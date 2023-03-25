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
import javax.swing.JComboBox;
import javax.swing.JTextArea;
import java.awt.Toolkit;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

public class gui_LapThe extends JFrame {

	private JPanel contentPane;
	private JTextField tf_maKH;
	private JTextField tf_ten;
	private JTextField textField_ma;
	private JTextField textField_Sdt;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					gui_LapThe frame = new gui_LapThe();
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
	public gui_LapThe() {
		setTitle("LẬP THẺ ĐỘC GIẢ\r\n");
		setIconImage(Toolkit.getDefaultToolkit().getImage("IMG\\hotel.png"));
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 746, 685);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JPanel panel = new JPanel();
		panel.setLayout(null);
		panel.setBackground(new Color(0, 0, 128));
		panel.setBounds(0, 0, 722, 731);
		contentPane.add(panel);
		
		JLabel lblTitle = new JLabel("  LẬP THẺ ĐỘC GIẢ\r\n");
		lblTitle.setIcon(null);
		lblTitle.setHorizontalAlignment(SwingConstants.CENTER);
		lblTitle.setForeground(Color.WHITE);
		lblTitle.setFont(new Font("Times New Roman", Font.BOLD | Font.ITALIC, 30));
		lblTitle.setBackground(SystemColor.activeCaption);
		lblTitle.setBounds(133, 11, 471, 53);
		panel.add(lblTitle);
		
		JPanel contentPane_1 = new JPanel();
		contentPane_1.setLayout(null);
		contentPane_1.setBorder(new EmptyBorder(5, 5, 5, 5));
		contentPane_1.setBounds(0, 75, 712, 645);
		panel.add(contentPane_1);
		
		
		JLabel lblTen = new JLabel("Họ và tên:");
		lblTen.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		lblTen.setBounds(10, 78, 126, 30);
		contentPane_1.add(lblTen);
		
		tf_ten = new JTextField();
		tf_ten.setForeground(Color.BLACK);
		tf_ten.setFont(new Font("Arial", Font.PLAIN, 18));
		tf_ten.setColumns(10);
		tf_ten.setBackground(Color.WHITE);
		tf_ten.setBounds(197, 78, 304, 30);
		contentPane_1.add(tf_ten);
		
		JLabel lblMa = new JLabel("Mã độc giả:");
		lblMa.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		lblMa.setBounds(10, 142, 126, 30);
		contentPane_1.add(lblMa);
		
		JLabel lbl_Email = new JLabel("Email:");
		lbl_Email.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		lbl_Email.setBounds(10, 397, 126, 30);
		contentPane_1.add(lbl_Email);
		
		JLabel lblKhoa = new JLabel("Khoa:");
		lblKhoa.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		lblKhoa.setBounds(10, 203, 166, 30);
		contentPane_1.add(lblKhoa);
		
		JLabel lblLop = new JLabel("Lớp:");
		lblLop.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		lblLop.setBounds(10, 334, 166, 30);
		contentPane_1.add(lblLop);
		
		JButton btn_xacnhan = new JButton("Xác nhận");
		btn_xacnhan.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseExited(MouseEvent e) {
				new GUI.gui_QLDG().setVisible(true);
			}
		});
		btn_xacnhan.setIcon(new ImageIcon("IMG\\check.png"));
		btn_xacnhan.setFont(new Font("Tahoma", Font.PLAIN, 14));
		btn_xacnhan.setBackground(new Color(153, 204, 102));
		btn_xacnhan.setBounds(210, 524, 126, 34);
		contentPane_1.add(btn_xacnhan);
		
		JButton btn_huy = new JButton("Hủy");
		btn_huy.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseExited(MouseEvent e) {
				new GUI.gui_QLDG().setVisible(true);
			}
		});
		btn_huy.setIcon(new ImageIcon("IMG\\cancel.png"));
		btn_huy.setFont(new Font("Tahoma", Font.PLAIN, 14));
		btn_huy.setBackground(new Color(204, 102, 102));
		btn_huy.setBounds(360, 524, 119, 34);
		contentPane_1.add(btn_huy);
		
		textField_ma = new JTextField();
		textField_ma.setForeground(Color.BLACK);
		textField_ma.setFont(new Font("Arial", Font.PLAIN, 18));
		textField_ma.setColumns(10);
		textField_ma.setBackground(Color.WHITE);
		textField_ma.setBounds(197, 142, 304, 30);
		contentPane_1.add(textField_ma);
		
		JComboBox comboBox_Khoa = new JComboBox();
		comboBox_Khoa.setBounds(197, 203, 304, 30);
		contentPane_1.add(comboBox_Khoa);
		
		JComboBox comboBox_Lop = new JComboBox();
		comboBox_Lop.setBounds(197, 334, 304, 34);
		contentPane_1.add(comboBox_Lop);
		
		JTextArea textArea_Email = new JTextArea();
		textArea_Email.setFont(new Font("Monospaced", Font.PLAIN, 13));
		textArea_Email.setBounds(197, 402, 304, 34);
		contentPane_1.add(textArea_Email);
		
		JLabel lbl_CVu = new JLabel("Chức vụ:");
		lbl_CVu.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		lbl_CVu.setBounds(10, 266, 166, 30);
		contentPane_1.add(lbl_CVu);
		
		textField_Sdt = new JTextField();
		textField_Sdt.setBounds(197, 457, 304, 36);
		contentPane_1.add(textField_Sdt);
		textField_Sdt.setColumns(10);
		
		JLabel lblNewLabel = new JLabel("No img");
		lblNewLabel.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel.setBounds(519, 119, 183, 203);
		contentPane_1.add(lblNewLabel);
		
		JLabel lblNewLabel_Sdt = new JLabel("Số điện thoại:");
		lblNewLabel_Sdt.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		lblNewLabel_Sdt.setBounds(10, 454, 133, 38);
		contentPane_1.add(lblNewLabel_Sdt);
		
		JComboBox comboBox_ChucVu = new JComboBox();
		comboBox_ChucVu.setBounds(197, 267, 304, 32);
		contentPane_1.add(comboBox_ChucVu);
		
	}
}
