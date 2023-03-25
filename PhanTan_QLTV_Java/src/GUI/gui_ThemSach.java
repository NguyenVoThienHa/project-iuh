package GUI;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import java.awt.SystemColor;
import javax.swing.JLabel;
import java.awt.Font;
import java.awt.Color;
import javax.swing.SwingConstants;
import javax.swing.JTextField;
import javax.swing.JButton;
import javax.swing.JRadioButton;
import javax.swing.ImageIcon;
import com.toedter.calendar.JDateChooser;
import javax.swing.JList;
import javax.swing.JComboBox;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

public class gui_ThemSach extends JFrame {

	private JPanel contentPane;
	private JTextField tf_tenSach;
	private JTextField tf_TenTg;
	private JTextField textField_SL;
	private JTextField tf_NhaSx;
	private JTextField textField_GiaTien;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					gui_ThemSach frame = new gui_ThemSach();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public gui_ThemSach() {
		setTitle("Thêm sách");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 605, 770);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JPanel panel_1 = new JPanel();
		panel_1.setLayout(null);
		panel_1.setBackground(new Color(0, 0, 128));
		panel_1.setBounds(0, 0, 589, 731);
		contentPane.add(panel_1);
		
		JLabel lbl_TieuDe = new JLabel("THÊM SÁCH");
		lbl_TieuDe.setIcon(new ImageIcon("IMG\\plu.PNG"));
		lbl_TieuDe.setHorizontalAlignment(SwingConstants.CENTER);
		lbl_TieuDe.setForeground(Color.WHITE);
		lbl_TieuDe.setFont(new Font("Times New Roman", Font.BOLD | Font.ITALIC, 26));
		lbl_TieuDe.setBackground(SystemColor.activeCaption);
		lbl_TieuDe.setBounds(133, 11, 316, 53);
		panel_1.add(lbl_TieuDe);
		
		JPanel panel_2 = new JPanel();
		panel_2.setLayout(null);
		panel_2.setBorder(new EmptyBorder(5, 5, 5, 5));
		panel_2.setBounds(0, 75, 589, 645);
		panel_1.add(panel_2);
		
		JLabel lbl_TenSach = new JLabel("Tên sách:");
		lbl_TenSach.setFont(new Font("Arial", Font.PLAIN, 16));
		lbl_TenSach.setBounds(21, 11, 166, 30);
		panel_2.add(lbl_TenSach);
		
		tf_tenSach = new JTextField();
		tf_tenSach.setForeground(Color.BLACK);
		tf_tenSach.setFont(new Font("Arial", Font.PLAIN, 18));
		tf_tenSach.setColumns(10);
		tf_tenSach.setBackground(Color.WHITE);
		tf_tenSach.setBounds(169, 11, 336, 30);
		panel_2.add(tf_tenSach);
		
		JLabel lbl_TheLoai = new JLabel("Thể loại:");
		lbl_TheLoai.setFont(new Font("Arial", Font.PLAIN, 16));
		lbl_TheLoai.setBounds(21, 77, 166, 30);
		panel_2.add(lbl_TheLoai);
		
		JLabel lbl_ten = new JLabel("Tên tác giả:");
		lbl_ten.setFont(new Font("Arial", Font.PLAIN, 16));
		lbl_ten.setBounds(21, 152, 166, 30);
		panel_2.add(lbl_ten);
		
		JLabel lbl_NhaSx = new JLabel("Tên nhà xuất bản:");
		lbl_NhaSx.setFont(new Font("Arial", Font.PLAIN, 16));
		lbl_NhaSx.setBounds(21, 234, 166, 30);
		panel_2.add(lbl_NhaSx);
		
		JLabel lbl_ngay = new JLabel("Ngày xuất bản:");
		lbl_ngay.setFont(new Font("Arial", Font.PLAIN, 16));
		lbl_ngay.setBounds(21, 307, 166, 30);
		panel_2.add(lbl_ngay);
		
		tf_TenTg = new JTextField();
		tf_TenTg.setForeground(Color.BLACK);
		tf_TenTg.setFont(new Font("Arial", Font.PLAIN, 18));
		tf_TenTg.setColumns(10);
		tf_TenTg.setBackground(Color.WHITE);
		tf_TenTg.setBounds(169, 152, 336, 30);
		panel_2.add(tf_TenTg);
		
		JButton btn_xacnhan = new JButton("Xác nhận");
		btn_xacnhan.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				new GUI.gui_sach().setVisible(true);
			}
		});
		btn_xacnhan.setIcon(new ImageIcon("IMG\\check.png"));
		btn_xacnhan.setFont(new Font("Tahoma", Font.PLAIN, 14));
		btn_xacnhan.setBackground(new Color(153, 204, 102));
		btn_xacnhan.setBounds(210, 528, 155, 34);
		panel_2.add(btn_xacnhan);
		
		JButton btn_huy = new JButton("Hủy");
		btn_huy.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseExited(MouseEvent e) {
				new GUI.gui_sach().setVisible(true);
			}
		});
		btn_huy.setIcon(new ImageIcon("IMG\\cancel.png"));
		btn_huy.setFont(new Font("Tahoma", Font.PLAIN, 14));
		btn_huy.setBackground(new Color(204, 102, 102));
		btn_huy.setBounds(392, 528, 89, 34);
		panel_2.add(btn_huy);
		
		textField_SL = new JTextField();
		textField_SL.setForeground(Color.BLACK);
		textField_SL.setFont(new Font("Arial", Font.PLAIN, 18));
		textField_SL.setColumns(10);
		textField_SL.setBackground(Color.WHITE);
		textField_SL.setBounds(169, 465, 336, 30);
		panel_2.add(textField_SL);
		
		JLabel lbl_GiaTien = new JLabel("Giá tiền:");
		lbl_GiaTien.setFont(new Font("Arial", Font.PLAIN, 16));
		lbl_GiaTien.setBounds(21, 385, 166, 30);
		panel_2.add(lbl_GiaTien);
		
		tf_NhaSx = new JTextField();
		tf_NhaSx.setForeground(Color.BLACK);
		tf_NhaSx.setFont(new Font("Arial", Font.PLAIN, 18));
		tf_NhaSx.setColumns(10);
		tf_NhaSx.setBackground(Color.WHITE);
		tf_NhaSx.setBounds(171, 234, 334, 30);
		panel_2.add(tf_NhaSx);
		
		JDateChooser dateChooser = new JDateChooser();
		dateChooser.getSpinner().setFont(new Font("Tahoma", Font.PLAIN, 15));
		dateChooser.setDateFormatString("dd-MM-yyyy");
		dateChooser.setBounds(169, 307, 336, 30);
		panel_2.add(dateChooser);
		
		JLabel lbl_SL = new JLabel("Số lượng:");
		lbl_SL.setFont(new Font("Tahoma", Font.PLAIN, 16));
		lbl_SL.setBounds(21, 465, 81, 30);
		panel_2.add(lbl_SL);
		
		textField_GiaTien = new JTextField();
		textField_GiaTien.setBounds(169, 385, 336, 30);
		panel_2.add(textField_GiaTien);
		textField_GiaTien.setColumns(10);
		
		JComboBox comboBox_TheLoai = new JComboBox();
		comboBox_TheLoai.setBounds(169, 75, 336, 30);
		panel_2.add(comboBox_TheLoai);
		
	}
}
