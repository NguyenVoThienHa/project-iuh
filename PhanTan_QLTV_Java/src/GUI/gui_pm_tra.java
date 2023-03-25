package GUI;

import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import java.awt.Toolkit;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JMenu;
import javax.swing.AbstractButton;
import javax.swing.ImageIcon;
import javax.swing.border.LineBorder;
import java.awt.Color;
import javax.swing.JLabel;
import javax.swing.SwingConstants;
import java.awt.Font;
import javax.swing.border.TitledBorder;


import javax.swing.border.EtchedBorder;
import java.awt.SystemColor;
import javax.swing.JRadioButton;
import javax.swing.UIManager;
import javax.swing.JButton;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.io.IOException;

import javax.swing.event.MenuListener;

import javax.swing.event.MenuEvent;
import javax.swing.event.MenuKeyListener;
import javax.swing.event.MenuKeyEvent;
import java.awt.event.ItemListener;
import java.awt.event.ItemEvent;
import java.awt.GridLayout;
import javax.swing.JCheckBoxMenuItem;
import javax.swing.JRadioButtonMenuItem;
import javax.swing.JPopupMenu;
import java.awt.Component;
import javax.swing.JTextField;
import javax.swing.JToolBar;
import javax.swing.JScrollBar;
import javax.swing.JTable;
import javax.swing.border.BevelBorder;
import javax.swing.table.DefaultTableModel;
import javax.swing.ListSelectionModel;
import javax.swing.JScrollPane;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.JComboBox;

public class gui_pm_tra extends JFrame {

	private JPanel contentPane;
	private JMenu mn_thanhtoan;
	private JTextField textField_Tim;
	private JTable table_TraSach;

	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					gui_pm_tra frame = new gui_pm_tra();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	public gui_pm_tra() {
		setTitle("DANH SÁCH TRẢ SÁCH");
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setLocationRelativeTo(null);
		setExtendedState(JFrame.MAXIMIZED_BOTH);
		setBounds(100, 100, 1295, 691);
		getContentPane().setLayout(null);
		
		JMenuBar menuBar = new JMenuBar();
		menuBar.setBounds(0, 0, 1210, 22);
		getContentPane().add(menuBar);
		
		JMenu mn_TrangChu = new JMenu("Hệ thống");
		mn_TrangChu.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				new GUI.Gui_trangchu().setVisible(true);
			}
		});
		menuBar.add(mn_TrangChu);
		
		JMenu mn_DG = new JMenu("Quản lí độc giả");
		menuBar.add(mn_DG);
		
		JMenuItem mn_DSDGia = new JMenuItem("Danh sách độc giả");
		mn_DSDGia.addMouseListener(new MouseAdapter() {
			@Override
			public void mousePressed(MouseEvent e) {
				new GUI.gui_QLDG().setVisible(true);
			}
		});

		mn_DG.add(mn_DSDGia);
		
		JMenuItem mn_Lthe = new JMenuItem("Lập thẻ độc giả");
		mn_Lthe.addMouseListener(new MouseAdapter() {
			@Override
			public void mousePressed(MouseEvent e) {
				new GUI.gui_LapThe().setVisible(true);
			}
		});
		mn_DG.add(mn_Lthe);
		
		JMenuItem mn_DSTheHetHan = new JMenuItem("Danh sách thẻ hết hạn");
		mn_DSTheHetHan.addMouseListener(new MouseAdapter() {
			@Override
			public void mousePressed(MouseEvent e) {
				new GUI.gui_QLDG_HetHan().setVisible(true);
			}
		});
		mn_DG.add(mn_DSTheHetHan);
		
		JMenu mn_Sach = new JMenu("Quản lí sách");
		menuBar.add(mn_Sach);
		
		JMenuItem mn_BSSach = new JMenuItem("Bổ sung sách");
		mn_BSSach.addMouseListener(new MouseAdapter() {
			@Override
			public void mousePressed(MouseEvent e) {
				new GUI.gui_ThemSach().setVisible(true);
			}
		});
		mn_Sach.add(mn_BSSach);
		
		JMenuItem mn_KhoSach = new JMenuItem("Kho sách");
		mn_KhoSach.addMouseListener(new MouseAdapter() {
			@Override
			public void mousePressed(MouseEvent e) {
				new GUI.gui_sach().setVisible(true);
			}
		});
		mn_Sach.add(mn_KhoSach);
		
		JMenu Mn_QLMTS = new JMenu("Quản lí mượn - trả sách");
		menuBar.add(Mn_QLMTS);
		
		JMenuItem mn_Muon = new JMenuItem("Danh Sách mượn sách");
		mn_Muon.addMouseListener(new MouseAdapter() {
			@Override
			public void mousePressed(MouseEvent e) {
				new GUI.gui_qlpm().setVisible(true);
			}
		});
		Mn_QLMTS.add(mn_Muon);
		
		JMenuItem mn_Tra = new JMenuItem("Danh sách trả sách");
		mn_Tra.addMouseListener(new MouseAdapter() {
			@Override
			public void mousePressed(MouseEvent e) {
				new GUI.gui_pm_tra().setVisible(true);
			}
		});
		Mn_QLMTS.add(mn_Tra);
		
		JMenuItem mn_Dki = new JMenuItem("Đăng kí mượn sách");
		mn_Dki.addMouseListener(new MouseAdapter() {
			@Override
			public void mousePressed(MouseEvent e) {
				new GUI.gui_dpm().setVisible(true);
			}
		});
		Mn_QLMTS.add(mn_Dki);
		
		JMenu mn_QLTK = new JMenu("Quản lí thống kê");
		menuBar.add(mn_QLTK);
		
		JMenuItem mn_TKNam = new JMenuItem("Thống kê theo năm học");
		mn_QLTK.add(mn_TKNam);
		
		JMenuItem mn_TkHki = new JMenuItem("Thống kê theo học kì");
		mn_QLTK.add(mn_TkHki);
		
		JPanel panel_tks = new JPanel();
		panel_tks.setBackground(Color.WHITE);
		panel_tks.setBounds(10, 128, 1261, 86);
		getContentPane().add(panel_tks);
		panel_tks.setLayout(null);
		
		JButton btn_Thoat = new JButton("Thoát");
		btn_Thoat.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseExited(MouseEvent e) {
				new GUI.gui_qlpm().setVisible(true);
			}
		});
		btn_Thoat.setBounds(1115, 24, 136, 46);
		btn_Thoat.setIcon(new ImageIcon("IMG\\cancel.png"));
		btn_Thoat.setFont(new Font("Times New Roman", Font.PLAIN, 14));
		panel_tks.add(btn_Thoat);
		
		JButton btn_TimKiem = new JButton("");
		btn_TimKiem.setBackground(Color.WHITE);
		btn_TimKiem.setBounds(10, 11, 72, 65);
		btn_TimKiem.setIcon(new ImageIcon("IMG\\s.PNG"));
		panel_tks.add(btn_TimKiem);
		
		JButton btn_capnhat = new JButton("Cập nhật");
		btn_capnhat.setBounds(967, 24, 136, 46);
		btn_capnhat.setFont(new Font("Times New Roman", Font.PLAIN, 14));
		btn_capnhat.setIcon(new ImageIcon("IMG\\re.png"));
		panel_tks.add(btn_capnhat);
		
		JButton btn_ChinhSua = new JButton("Chỉnh sửa");
		btn_ChinhSua.setIcon(new ImageIcon("IMG\\edit_1.png"));
		btn_ChinhSua.setFont(new Font("Times New Roman", Font.PLAIN, 14));
		btn_ChinhSua.setBounds(821, 24, 136, 46);
		panel_tks.add(btn_ChinhSua);
		
		JButton btn_Xoa = new JButton("Xóa");
		btn_Xoa.setIcon(new ImageIcon("IMG\\eraser.png"));
		btn_Xoa.setBounds(675, 25, 136, 46);
		panel_tks.add(btn_Xoa);
		
		textField_Tim = new JTextField();
		textField_Tim.setBounds(109, 11, 347, 65);
		panel_tks.add(textField_Tim);
		textField_Tim.setColumns(10);
		
		JScrollPane scrollPane_Tk = new JScrollPane();
		scrollPane_Tk.setBounds(10, 225, 1261, 418);
		getContentPane().add(scrollPane_Tk);
		
		table_TraSach = new JTable();
		table_TraSach.setModel(new DefaultTableModel(
			new Object[][] {
				{null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null},
				{null, null, null, null, null, null, null, null},
			},
			new String[] {
				"STT", "M\u00E3 phi\u1EBFu m\u01B0\u1EE3n", "M\u00E3 \u0111\u1ED9c gi\u1EA3", "M\u00E3 th\u1EE7 th\u01B0", "Ng\u00E0y m\u1EF1\u1EE3n", "Ng\u00E0y tr\u1EA3", "X\u1EED ph\u1EA1t", "Ghi ch\u00FA"
			}
		));
		table_TraSach.setFont(new Font("Times New Roman", Font.PLAIN, 12));
		scrollPane_Tk.setViewportView(table_TraSach);
		
		JPanel panel = new JPanel();
		panel.setBackground(new Color(0, 0, 128));
		panel.setBounds(10, 22, 1261, 95);
		getContentPane().add(panel);
		panel.setLayout(null);
		
		JLabel lblNewLabel = new JLabel(" Danh sách trả sách");
		lblNewLabel.setIcon(null);
		lblNewLabel.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel.setFont(new Font("Times New Roman", Font.BOLD | Font.ITALIC, 36));
		lblNewLabel.setForeground(Color.WHITE);
		lblNewLabel.setBackground(new Color(0, 0, 128));
		lblNewLabel.setBounds(413, 11, 484, 73);
		panel.add(lblNewLabel);
		
		
		
		
	}

	private void setLayout(float centerAlignment) {
		// TODO Auto-generated method stub
		
	}
	private static void addPopup(Component component, final JPopupMenu popup) {
		component.addMouseListener(new MouseAdapter() {
			public void mousePressed(MouseEvent e) {
				if (e.isPopupTrigger()) {
					showMenu(e);
				}
			}
			public void mouseReleased(MouseEvent e) {
				if (e.isPopupTrigger()) {
					showMenu(e);
				}
			}
			private void showMenu(MouseEvent e) {
				popup.show(e.getComponent(), e.getX(), e.getY());
			}
		});
	}
}

