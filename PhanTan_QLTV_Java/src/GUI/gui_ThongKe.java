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

public class gui_ThongKe extends JFrame {

	private JPanel contentPane;
	private JMenu mn_thanhtoan;

	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					gui_ThongKe frame = new gui_ThongKe();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	public gui_ThongKe() {
		setTitle("QUẢN LÝ THỐNG KÊ SÁCH ");
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
		panel_tks.setBounds(0, 24, 1281, 196);
		getContentPane().add(panel_tks);
		panel_tks.setLayout(null);
		
		JButton btn_Tknam = new JButton("Thống kê theo năm học");
		btn_Tknam.setIcon(null);
		btn_Tknam.setFont(new Font("Times New Roman", Font.PLAIN, 24));
		btn_Tknam.setBounds(677, 11, 360, 65);
		panel_tks.add(btn_Tknam);
		
		JButton btn_tkhk = new JButton("Thống kê theo học kì");
		btn_tkhk.setIcon(null);
		btn_tkhk.setFont(new Font("Times New Roman", Font.PLAIN, 24));
		btn_tkhk.setBounds(677, 102, 360, 65);
		panel_tks.add(btn_tkhk);
		
		JButton btn_Thoat = new JButton("Thoát");
		btn_Thoat.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseExited(MouseEvent e) {
				new GUI.Gui_trangchu().setVisible(true);
			}
		});
		btn_Thoat.setIcon(new ImageIcon("IMG\\cancel.png"));
		btn_Thoat.setFont(new Font("Times New Roman", Font.PLAIN, 14));
		btn_Thoat.setBounds(1123, 116, 136, 50);
		panel_tks.add(btn_Thoat);
		
		JButton btn_TimKiem = new JButton("");
		btn_TimKiem.setBackground(Color.WHITE);
		btn_TimKiem.setIcon(new ImageIcon("IMG\\s.PNG"));
		btn_TimKiem.setBounds(10, 117, 56, 50);
		panel_tks.add(btn_TimKiem);
		
		JButton btn_TieuDe = new JButton("THỐNG KÊ SÁCH ĐƯỢC YÊU THÍCH");
		btn_TieuDe.setIcon(new ImageIcon("IMG\\t.PNG"));
		btn_TieuDe.setFont(new Font("Times New Roman", Font.ITALIC, 24));
		btn_TieuDe.setForeground(Color.BLACK);
		btn_TieuDe.setBackground(new Color(230, 230, 250));
		btn_TieuDe.setBounds(10, 11, 516, 74);
		panel_tks.add(btn_TieuDe);
		
		JButton btn_capnhat = new JButton("Cập nhật");
		btn_capnhat.setFont(new Font("Times New Roman", Font.PLAIN, 14));
		btn_capnhat.setIcon(new ImageIcon("IMG\\re.png"));
		btn_capnhat.setBounds(1123, 26, 136, 50);
		panel_tks.add(btn_capnhat);
		
		JComboBox comboBox = new JComboBox();
		comboBox.setBounds(120, 116, 165, 51);
		panel_tks.add(comboBox);
		
		JComboBox comboBox_1 = new JComboBox();
		comboBox_1.setBounds(361, 116, 165, 51);
		panel_tks.add(comboBox_1);
		
		JScrollPane scrollPane_Tk = new JScrollPane();
		scrollPane_Tk.setBounds(10, 231, 1261, 412);
		getContentPane().add(scrollPane_Tk);
		
		
		
		
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
