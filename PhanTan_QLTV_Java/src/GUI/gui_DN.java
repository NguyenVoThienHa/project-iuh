package GUI;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import java.awt.Toolkit;
import java.io.File;
import java.io.IOException;

import javax.swing.border.LineBorder;
import java.awt.Color;

import javax.imageio.ImageIO;
import javax.swing.BorderFactory;
import javax.swing.BoxLayout;
import javax.swing.ImageIcon;
import javax.swing.JTextField;
import javax.swing.JCheckBox;
import javax.swing.JButton;
import javax.swing.JPasswordField;
import javax.swing.JLabel;
import java.awt.Font;
import java.awt.Image;
import javax.swing.SwingConstants;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.LayoutStyle.ComponentPlacement;
import javax.swing.DropMode;

public class gui_DN extends JFrame {

	private JPanel contentPane;
	private JLabel img;
	private JTextField txt_R;
	private JTextField txtngNhp;
	private JTextField txt_DN;
	private JTextField txt_1;
	private JTextField txt_2;
	private JPasswordField passwordField_mk;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					gui_DN frame = new gui_DN();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 * @throws IOException 
	 */
	public gui_DN() throws IOException {
		getContentPane().setBackground(Color.WHITE);
		
		JLabel lbl_1 = new JLabel("New label");
		lbl_1.setBounds(0, 0, 0, 0);
		lbl_1.setForeground(Color.WHITE);
		lbl_1.setHorizontalAlignment(SwingConstants.CENTER);
		lbl_1.setBackground(new Color(0, 0, 128));
		
		txt_R = new JTextField();
		txt_R.setBounds(0, 0, 686, 103);
		txt_R.setHorizontalAlignment(SwingConstants.CENTER);
		txt_R.setBackground(new Color(0, 0, 128));
		txt_R.setForeground(Color.WHITE);
		txt_R.setText("PHẦN MỀM QUẢN LÝ THƯ VIỆN");
		txt_R.setFont(new Font("Times New Roman", Font.BOLD, 36));
		txt_R.setColumns(10);
		
		txtngNhp = new JTextField();
		txtngNhp.setBounds(209, 121, 276, 46);
		txtngNhp.setFont(new Font("Times New Roman", Font.BOLD, 34));
		txtngNhp.setForeground(new Color(0, 0, 128));
		txtngNhp.setText("ĐĂNG NHẬP");
		txtngNhp.setHorizontalAlignment(SwingConstants.CENTER);
		txtngNhp.setColumns(10);
		
		JButton btn_DN = new JButton("Đăng nhập");
		btn_DN.setBounds(114, 386, 205, 54);
		btn_DN.setIcon(new ImageIcon("IMG\\lg.PNG"));
		btn_DN.setFont(new Font("Times New Roman", Font.BOLD, 24));
		btn_DN.setForeground(new Color(0, 0, 128));
		btn_DN.setBackground(Color.WHITE);
		
		JButton btn_Thoat = new JButton("Thoát");
		btn_Thoat.setBounds(447, 388, 138, 50);
		btn_Thoat.setIcon(new ImageIcon("IMG\\exit.PNG"));
		btn_Thoat.setBackground(Color.WHITE);
		btn_Thoat.setForeground(new Color(0, 0, 128));
		btn_Thoat.setFont(new Font("Times New Roman", Font.BOLD, 24));
		
		txt_DN = new JTextField();
		txt_DN.setBounds(209, 217, 432, 44);
		txt_DN.setDropMode(DropMode.ON_OR_INSERT_ROWS);
		txt_DN.setColumns(10);
		
		txt_1 = new JTextField();
		txt_1.setBounds(10, 217, 169, 44);
		txt_1.setFont(new Font("Times New Roman", Font.BOLD, 24));
		txt_1.setForeground(new Color(0, 0, 128));
		txt_1.setText("Tên đăng nhập:");
		txt_1.setColumns(10);
		
		txt_2 = new JTextField();
		txt_2.setBounds(10, 304, 148, 47);
		txt_2.setFont(new Font("Times New Roman", Font.BOLD, 24));
		txt_2.setForeground(new Color(0, 0, 128));
		txt_2.setText("Mật khẩu:");
		txt_2.setColumns(10);
		getContentPane().setLayout(null);
		getContentPane().add(lbl_1);
		getContentPane().add(txt_R);
		getContentPane().add(txtngNhp);
		getContentPane().add(btn_DN);
		getContentPane().add(btn_Thoat);
		getContentPane().add(txt_2);
		getContentPane().add(txt_1);
		getContentPane().add(txt_DN);
		
		passwordField_mk = new JPasswordField();
		passwordField_mk.setBounds(209, 304, 432, 47);
		getContentPane().add(passwordField_mk);
		
		setTitle("\u0110\u0102NG NH\u1EACP H\u1EC6 TH\u1ED0NG");
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setLocationRelativeTo(null);
		setSize(700, 500);
		setResizable(false);
		
	}
}
