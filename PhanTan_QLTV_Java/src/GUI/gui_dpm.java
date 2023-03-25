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

public class gui_dpm extends JFrame {

	private JPanel contentPane;
	private JMenu mn_thanhtoan;
	private JTextField textField_Tim;
	private JTable table_pm;
	private JTable table_DSDuyet;

	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					gui_dpm frame = new gui_dpm();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	public gui_dpm() {
		setTitle("DANH SÁCH DUYỆT ĐĂNG KÍ MƯỢN SÁCH");
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
		
		JPanel paneldg2 = new JPanel();
		paneldg2.setBackground(Color.WHITE);
		paneldg2.setBounds(0, 22, 1281, 198);
		getContentPane().add(paneldg2);
		paneldg2.setLayout(null);
		
		textField_Tim = new JTextField();
		textField_Tim.setBounds(76, 121, 318, 50);
		paneldg2.add(textField_Tim);
		textField_Tim.setColumns(10);
		
		JButton btnCapnhat = new JButton("Cập nhật");
		btnCapnhat.setIcon(new ImageIcon("IMG\\re.png"));
		btnCapnhat.setFont(new Font("Times New Roman", Font.PLAIN, 14));
		btnCapnhat.setBounds(900, 121, 136, 50);
		paneldg2.add(btnCapnhat);
		
		JButton btnThoat = new JButton("Thoát");
		btnThoat.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseExited(MouseEvent e) {
				new GUI.gui_qlpm().setVisible(true);
			}
		});
		btnThoat.setIcon(new ImageIcon("IMG\\cancel.png"));
		btnThoat.setFont(new Font("Times New Roman", Font.PLAIN, 14));
		btnThoat.setBounds(1058, 121, 136, 50);
		paneldg2.add(btnThoat);
		
		JButton btnTim = new JButton("");
		btnTim.setBackground(Color.WHITE);
		btnTim.setIcon(new ImageIcon("IMG\\s.PNG"));
		btnTim.setBounds(10, 122, 56, 50);
		paneldg2.add(btnTim);
		
		JButton btn_TieuDe = new JButton("DUYỆT DANH SÁCH ĐĂNG KÍ MƯỢN SÁCH");
		btn_TieuDe.setIcon(null);
		btn_TieuDe.setFont(new Font("Times New Roman", Font.ITALIC, 36));
		btn_TieuDe.setForeground(Color.WHITE);
		btn_TieuDe.setBackground(new Color(0, 0, 128));
		btn_TieuDe.setBounds(10, 11, 1261, 74);
		paneldg2.add(btn_TieuDe);
		
		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setBounds(10, 238, 1261, 405);
		getContentPane().add(scrollPane);
		
		table_DSDuyet = new JTable();
		table_DSDuyet.setModel(new DefaultTableModel(
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
				"STT", "T\u00EAn \u0111\u1ED9c gi\u1EA3", "M\u00E3 \u0111\u1ED9c gi\u1EA3", "T\u00EAn s\u00E1ch", "S\u1ED1 l\u01B0\u1EE3ng", "Ng\u00E0y m\u01B0\u1EE3n", "Ng\u00E0y tr\u1EA3", "Duy\u1EC7t"
			}
		) {
			Class[] columnTypes = new Class[] {
				Object.class, Object.class, Object.class, Object.class, Object.class, Object.class, Object.class, Boolean.class
			};
			public Class getColumnClass(int columnIndex) {
				return columnTypes[columnIndex];
			}
		});
		scrollPane.setViewportView(table_DSDuyet);
		
		table_pm = new JTable();
		table_pm.setFont(new Font("Times New Roman", Font.PLAIN, 13));
	}
}
				