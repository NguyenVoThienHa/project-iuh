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

public class gui_ThongTinCaNhan extends JFrame {

	private JPanel contentPane;
	private JTextField textField;
	private JTextField textField_1;
	private JTextField textField_2;
	private JTextField textField_3;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					gui_ThongTinCaNhan frame = new gui_ThongTinCaNhan();
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
	public gui_ThongTinCaNhan() {
		setTitle("Thông tin cá nhân");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 605, 770);
		contentPane = new JPanel();
		contentPane.setBackground(new Color(0, 0, 128));
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JPanel panel_1 = new JPanel();
		panel_1.setBackground(Color.WHITE);
		panel_1.setBounds(10, 11, 571, 135);
		contentPane.add(panel_1);
		panel_1.setLayout(null);
		
		JLabel lbl_HinhThuThu = new JLabel("No IMG");
		lbl_HinhThuThu.setHorizontalAlignment(SwingConstants.CENTER);
		lbl_HinhThuThu.setBounds(10, 11, 138, 113);
		panel_1.add(lbl_HinhThuThu);
		
		JLabel lbl_TenThuThu = new JLabel("NO_Name");
		lbl_TenThuThu.setBounds(223, 48, 298, 44);
		panel_1.add(lbl_TenThuThu);
		
		JPanel panel_2 = new JPanel();
		panel_2.setBackground(Color.WHITE);
		panel_2.setBounds(10, 157, 571, 454);
		contentPane.add(panel_2);
		panel_2.setLayout(null);
		
		JLabel lbl_ma = new JLabel("Mã thủ thư:");
		lbl_ma.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		lbl_ma.setBounds(23, 10, 129, 37);
		panel_2.add(lbl_ma);
		
		JLabel lbl_Dchi = new JLabel("Địa chỉ:");
		lbl_Dchi.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		lbl_Dchi.setBounds(23, 134, 129, 37);
		panel_2.add(lbl_Dchi);
		
		JLabel lbl_Sdt = new JLabel("Số điện thoại:");
		lbl_Sdt.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		lbl_Sdt.setBounds(23, 250, 129, 37);
		panel_2.add(lbl_Sdt);
		
		JLabel lbl_email = new JLabel("Email:");
		lbl_email.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		lbl_email.setBounds(23, 371, 129, 37);
		panel_2.add(lbl_email);
		
		textField = new JTextField();
		textField.setBounds(203, 11, 286, 37);
		panel_2.add(textField);
		textField.setColumns(10);
		
		textField_1 = new JTextField();
		textField_1.setBounds(203, 134, 286, 37);
		panel_2.add(textField_1);
		textField_1.setColumns(10);
		
		textField_2 = new JTextField();
		textField_2.setBounds(203, 250, 286, 37);
		panel_2.add(textField_2);
		textField_2.setColumns(10);
		
		textField_3 = new JTextField();
		textField_3.setBounds(203, 371, 286, 37);
		panel_2.add(textField_3);
		textField_3.setColumns(10);
		
		JPanel panel_3 = new JPanel();
		panel_3.setBackground(Color.WHITE);
		panel_3.setBounds(10, 622, 571, 67);
		contentPane.add(panel_3);
		panel_3.setLayout(null);
		
		JButton btn_Thoat = new JButton("Thoát");
		btn_Thoat.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseExited(MouseEvent e) {
				new GUI.Gui_trangchu().setVisible(true);
			}
		});
		btn_Thoat.setIcon(new ImageIcon("IMG\\cancel.png"));
		btn_Thoat.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		btn_Thoat.setBounds(312, 18, 133, 38);
		panel_3.add(btn_Thoat);
		
		JButton btn_ChinhSua = new JButton("Chỉnh sửa");
		btn_ChinhSua.setIcon(new ImageIcon("IMG\\edit_1.png"));
		btn_ChinhSua.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		btn_ChinhSua.setBounds(122, 18, 133, 38);
		panel_3.add(btn_ChinhSua);
		
	}
}
