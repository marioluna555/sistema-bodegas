package model;

import java.util.ArrayList;
import java.util.List;

public class MaterialDAO {
    public static List<Material> obtenerTodos() {
        List<Material> lista = new ArrayList<>();
        String sql = "SELECT id, codigo_material, nombre_material, descripcion, categoria, presentacion_cantidad, peso, volumen, stock_disponible, stock_minimo, stock_maximo, lote_serie, fecha_vencimiento, ubicacion, proveedor, costo_unitario, costo_total, observaciones FROM material";
        try (java.sql.Connection conn = Conexion.getConnection();
             java.sql.PreparedStatement stmt = conn.prepareStatement(sql);
             java.sql.ResultSet rs = stmt.executeQuery()) {
            int rowCount = 0;
            while (rs.next()) {
                rowCount++;
                Material m = new Material();
                m.setId(rs.getLong("id"));
                m.setCodigoMaterial(rs.getString("codigo_material"));
                m.setNombreMaterial(rs.getString("nombre_material"));
                m.setDescripcion(rs.getString("descripcion"));
                m.setCategoria(rs.getString("categoria"));
                m.setPresentacionCantidad(rs.getString("presentacion_cantidad"));
                m.setPeso(rs.getString("peso"));
                m.setVolumen(rs.getString("volumen"));
                m.setStockDisponible(rs.getString("stock_disponible"));
                m.setStockMinimo(rs.getString("stock_minimo"));
                m.setStockMaximo(rs.getString("stock_maximo"));
                m.setLoteSerie(rs.getString("lote_serie"));
                m.setFechaVencimiento(rs.getDate("fecha_vencimiento"));
                // Relación: ubicacion (solo id)
                if (rs.getObject("ubicacion") != null) {
                    UnidadAlmacenamiento ua = new UnidadAlmacenamiento();
                    ua.setId(rs.getLong("ubicacion"));
                    m.setUbicacion(ua);
                }
                // Relación: proveedor (solo id)
                if (rs.getObject("proveedor") != null) {
                    Proveedor p = new Proveedor();
                    p.setId(rs.getLong("proveedor"));
                    m.setProveedor(p);
                }
                m.setCostoUnitario(rs.getString("costo_unitario"));
                m.setCostoTotal(rs.getString("costo_total"));
                m.setObservaciones(rs.getString("observaciones"));
                lista.add(m);
            }
            System.out.println("MaterialDAO.obtenerTodos() - Filas encontradas: " + rowCount);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    // Implementación real para aumentar stock
    public static void aumentarStock(int materialId, double cantidad) {
        try (java.sql.Connection conn = Conexion.getConnection();
             java.sql.PreparedStatement stmt = conn.prepareStatement(
                "UPDATE material SET stock_disponible = CAST(stock_disponible AS DOUBLE PRECISION) + ? WHERE id = ?")) {
            stmt.setDouble(1, cantidad);
            stmt.setInt(2, materialId);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Implementación real para disminuir stock
    public static void disminuirStock(int materialId, double cantidad) {
        try (java.sql.Connection conn = Conexion.getConnection();
             java.sql.PreparedStatement stmt = conn.prepareStatement(
                "UPDATE material SET stock_disponible = CAST(stock_disponible AS DOUBLE PRECISION) - ? WHERE id = ?")) {
            stmt.setDouble(1, cantidad);
            stmt.setInt(2, materialId);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
