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
import java.awt.Panel;
import java.awt.Label;
import java.awt.Button;

public class Gui_trangchu extends JFrame {

	private JPanel contentPane;
	private JMenu mn_thanhtoan;
	private JTable table_pm;

	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Gui_trangchu frame = new Gui_trangchu();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	public Gui_trangchu() {
		setTitle("HÊ THỐNG QUẢN LÝ THƯ VIỆN ");
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
		
		JPanel panel_1 = new JPanel();
		panel_1.setBackground(new Color(0, 0, 128));
		panel_1.setBounds(0, 22, 1281, 100);
		getContentPane().add(panel_1);
		panel_1.setLayout(null);
		
		JLabel lbl_TieuDe = new JLabel("HỆ THỐNG QUẢN LÝ THƯ VIỆN");
		lbl_TieuDe.setForeground(Color.WHITE);
		lbl_TieuDe.setFont(new Font("Times New Roman", Font.BOLD | Font.ITALIC, 40));
		lbl_TieuDe.setBounds(327, 11, 628, 78);
		panel_1.add(lbl_TieuDe);
		
		Panel panel_2 = new Panel();
		panel_2.setBackground(SystemColor.inactiveCaptionBorder);
		panel_2.setBounds(10, 128, 407, 516);
		getContentPane().add(panel_2);
		panel_2.setLayout(null);
		
		JLabel lbl_hinh = new JLabel("New label");
		lbl_hinh.setIcon(new ImageIcon("IMG\\Captue.PNG"));
		lbl_hinh.setBounds(0, 11, 403, 385);
		panel_2.add(lbl_hinh);
		
		JButton btn_Thongtin = new JButton("Thông tin cá nhân");
		btn_Thongtin.setIcon(new ImageIcon("IMG\\name.png"));
		btn_Thongtin.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		btn_Thongtin.setBounds(81, 407, 231, 45);
		panel_2.add(btn_Thongtin);
		
		JButton btn_DangXuat = new JButton("Đăng xuất");
		btn_DangXuat.setIcon(new ImageIcon("IMG\\exit.PNG"));
		btn_DangXuat.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		btn_DangXuat.setBounds(81, 463, 231, 42);
		panel_2.add(btn_DangXuat);
		
		Panel panel_3 = new Panel();
		panel_3.setBackground(SystemColor.inactiveCaptionBorder);
		panel_3.setBounds(429, 128, 842, 516);
		getContentPane().add(panel_3);
		panel_3.setLayout(null);
		
		JButton btn_Qldg = new JButton("Quản lí độc giả");
		btn_Qldg.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				new GUI.gui_QLDG().setVisible(true);
			}
		});
		btn_Qldg.setFont(new Font("Times New Roman", Font.ITALIC, 24));
		btn_Qldg.setBackground(Color.WHITE);
		btn_Qldg.setIcon(new ImageIcon("IMG\\Caure.PNG"));
		btn_Qldg.setBounds(68, 43, 324, 154);
		panel_3.add(btn_Qldg);
		
		JButton btn_Qlpm = new JButton("Quản lí mượn - trả sách");
		btn_Qlpm.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				new GUI.gui_qlpm().setVisible(true);
			}
		});
		btn_Qlpm.setIcon(new ImageIcon("IMG\\Cptre.PNG"));
		btn_Qlpm.setBackground(Color.WHITE);
		btn_Qlpm.setFont(new Font("Times New Roman", Font.ITALIC, 24));
		btn_Qlpm.setBounds(68, 296, 324, 154);
		panel_3.add(btn_Qlpm);
		
		JButton btn_Qls = new JButton("Quản lí sách");
		btn_Qls.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				new GUI.gui_sach().setVisible(true);
			}
		});
		btn_Qls.setIcon(new ImageIcon("IMG\\sa.PNG"));
		btn_Qls.setBackground(Color.WHITE);
		btn_Qls.setFont(new Font("Times New Roman", Font.ITALIC, 24));
		btn_Qls.setBounds(462, 43, 324, 154);
		panel_3.add(btn_Qls);
		
		JButton btn_Qltk = new JButton("Quản lí thống kê");
		btn_Qltk.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				new GUI.gui_ThongKe().setVisible(true);
			}
		});
		btn_Qltk.setBackground(Color.WHITE);
		btn_Qltk.setFont(new Font("Times New Roman", Font.ITALIC, 24));
		btn_Qltk.setIcon(new ImageIcon("IMG\\t.PNG"));
		btn_Qltk.setBounds(462, 296, 324, 154);
		panel_3.add(btn_Qltk);
		
		table_pm = new JTable();
		table_pm.setFont(new Font("Times New Roman", Font.PLAIN, 13));
	}
}
				