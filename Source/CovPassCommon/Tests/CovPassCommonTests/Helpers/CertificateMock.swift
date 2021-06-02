//
//  CertificateMock.swift
//
//
//  © Copyright IBM Deutschland GmbH 2021
//  SPDX-License-Identifier: Apache-2.0
//

import Foundation

struct CertificateMock {
    static let validCertificate = "HC1:6BFOXN*TS0BI$ZD4N9:9S6RCVN5+O30K3/XIV0W23NTDE$VK G2EP4J0B3KL6QM5/OVGA/MAT%ISA3/-2E%5VR5VVBJZILDBZ8D%JTQOLC8CZ8DVCK/8D:8DQVDLED0AC-BU6SS-.DUBDNU347D8MS$ESFHDO8TF724QSHA2YR3JZIM-1U96UX4795L*KDYPWGO+9A*DOPCRFE4IWM:J8QHL9/5.+M1:6G16PCNQ+MLTMU0BR3UR:J.X0A%QXBKQ+8E/C5LG/69+FEKHG4.C/.DV2MGDIE-5QHCYQCJB4IE9WT0K3M9UVZSVK78Y9J8.P++9-G9+E93ZM$96TV6KJ73T59YLQM14+OP$I/XK$M8AO96YBDAKZ%P WUQRELS4J1T7OFKCT6:I /K/*KRZ43R4+*431TVZK WVR*GNS42J0+-9*+7E3KF%CD 810H% 0NY0H$1AVL9%7L26Y1NZ1WNZBPCG*7L%5G.%M/4GNIRDBE6J7DFUPSKX.MLEF8/72SEPKD++I*5FMHD*ZBJDBFKEG2GXTL6%7K7GK7QQ1C3H0A/LGIH"
    static let validCertificateNoPrefix = CertificateMock.validCertificate.stripPrefix()
    static let invalidCertificate = "6BF:XVTAOMEVT-VXI24H9STEWXMQRA6J668060BT4"
    static let invalidCertificateOldFormat = "6BFWZ8VIMDWR-53HT0+M981HE-IQ%8/MLK3OK$JZXDCGE+014R2NJADEJXDTJ7VLGVX0SB 9312D7155F2G70VAIFT4ILV:Q++L6%2NNKAA9-K56EOG:6ASTGBSDAOY4FI/AXBJ PN%%Q LUGEVRDDH4A*5KE6O15OO8LPMNC29JDFGZH/QAHKQ2LTXXSDMPJH4LPLK.PYYRZPR-J3PRBI*HO.NGDRI*EMJCT-J:2D8WAYHOM84G$7S67S44Z64WD3J34HRIZ60U9BHN2:GG$33GJAY7CN%K22BVZGI30/73X6613TK-A4W4HB8W$2 DOHTAZ$PJI8K 12620OL-98V.6TNADD54T8RKK.FISK6/69HGT698+VG0IEIK7CBKPICPHK5.8U27VG1S6B*HDM:A%IGWTC/-T$VE62H19OVT9ND4H7E6JKBOU9ED9.3PDKV$AFGW-AV3OOE6K$$IE525I00IAEQ06P3LFGL9C*IHT*K9XB7*F+TQD9UCGVFVTU9KT1P3COHK7-8TR%T$4WS6RDDWYC7:TDHDTI8T8X20ZST9W6.VQE9Y0GPDL6-37+8N+0Q1LLZBCA9OC0O7820"
    static let invalidCertificateInvalidSignature = "HC1:6BFV602G0/3WUWGSLKH47GO00IQ7EGFEDI-99CK7603XK4F30ZG.-F2F3W$K$-F1JC X8Y50.FK8ZKO/EZKEZ96446C56..DX%DZJCH/DTZ9 QE5$C .CJECQW5HXO*WOZED93DXKEW.CNWE.Y92OAGY82+8UB8-R7/0A1OA1C9K09UIAI3DA8D0EC*KE: CZ CI3DAWEG09DH8$B9+S9JPCT3E5JDOA7Q478465W5G*67:EDOL9WEQDD+Q6TW6FA7C466KCN9E%961A6DL6FA7D46.JCP9EJY8L/5M/5546.96VF6.JCBECB1A-:8$966469L6OF6VX6FVCPD0KQEPD0LVC6JD846Y96B464W5Y57UPC1JC 7B+ED 8DM9EQX56$C4WEOPCO8F8VCOPC*G72A6HS8MG7VH98ZA17ACG6VF64-APH9DY9H%6JIAGB92T9AG78*6V500FKOAVCTRIMO WTP34R%CDYRRTN4364K7P+TPY3O8NLHMW0L$VU7R4A7P5ZK/69HYLK%OB*9GZL:ZBTCR3EEOJ2GG5VTG$XO.ABNONJFTPCBS5OZ/7$6ELA7DM2GM6405GG8.GCF04+4CQ1SLPNJL8CJ3NMG SOYH3ZE8PBGZTTH/NV7AYTS%MD1 MW*JLES:GA31MNF8T54Q15MVV1CD$Z42RF.M5B*I-1LJ82ACUZXB*HA1HJQ2W1UK.1Q0JC1YLPER9XPXO36274Z1YMDUIHI4BYOH Z2$ U95EI$VEX7Z6Q:PL2LC8BW7INF5G29QXLTP+A833UD7TLGJFM MDM$IXP16HU/EUMW3*M0OC0 Q6L%8P:UF9I5P0T4SXEJO+VR1S"
    static let cert1 = "HC1:NCFOXNYTSFDHJI8M-OS6LV5UIXJAVI7LGI/8RX4 D9.IOVGAK0BS3E-RIM6BY4N NI4EFSYS:%OD3PYE9*FJ7OIQC8$.AIGCY0K5$0Y.A*JOVFC.C8*/GB2PRQPYE9/MVZ*J.A5:S9395*CBVZ0K1H%Y0BZIGDB5LKPMIHZISVBX3C*8BEPLA8KOHSLOJJPA*709EF7AL-T4P*KQYGN%2+T4D-4HRVUMNMD3323R13A2VC-4A+2XEN QT QTHC31M3+E3CP456L X4CZKHKB-43.E3KD3OAJ5%IWZKRA38M7323Q05.$S580QW6:CGPOJI7JSTNB95V/5HFKKKUG%M/PKDVS7%NC.U+NG WUJUHIO2 .1/7AI596AL**IOS0VPVI97I97M%V9Y4KCT1+S-8FB%0XKR.RNPCGZUIQJAZGA2:UG%U:D4LC3G5U48S8BQAQI.DCDIU%PARZH3874N462D:PUO21VFFYKJ92T2O5WMHU+GDZMQAU.QVF5FJFK$VTA4SBPN%OENJ6Y.6S:4HTNV.K-RNP/U+$S1KKXD5L.RD6N72TX1G7VL2-3:GD-C8+THI RE+2BLBTEU%R96LBHGT-9TRGEDFNF/SO3D1ATL8E: 3RIR:2VPVB+*FL3VS5II5SSCMA4FYEV1ZOGK1W3E*8R3GADTR5N2DV75KR30VK%F0 U%K14J27RMF3NYCWHX70GQ*E823HO0JJPESSR9HVC%P:J4$/K5HC9SUNTH TKB3W7YUCTGV/J/6JV9K8WM0U9MGM5UNPP6$0OLPB7BOO%V-.MEH63WP.NHQ9SI/JFJ7R87HTGZWE70V/3O4+I.7LF:1000C+NZLS"
    static let cert2 = "HC1:NCFOXNYTSFDHJI8Y0PBTOTVM O9NA7U 2XF6LR5XW9G81OGI4OP+9BM*4FGMU ACV4*XUA2PSGH.+H$NI4L6HUC%UG/YL WO*Z7ON1.-LDJ8ON1HQ1+Z9/HQESOXHQM47/972CL395J4I-B5ET42HPPEPHCRSV8%DPAC5ADN%9S8L6IWMW KAHA508XIORW6%5LJL0GG1M69721+V5O$97KPM*0A$FZM9IG9NXUGL2/IE%TE6UG+ZEVB8W107G67PPDFPVX1R270:6NEQ0R6AOMUF5LDCPF5RBQ746B46O1N646RM93O5RF6$T61R63B0 %PPRA5TI *9336TOJ%PD.ZJI7JSTNB95+6M:54BT5H35IZ6VRMGFPRYBQDTX-UC.U2U76*PVJA9DLEJC8.C2KC4JBSC9HAG-BJDCI-TL-VC4SLW HPOJZ0K PIS$S0O29T2*ZE6WUAKEG%5TW5A 6YO67N65VC899E.B%87 SUHU0KZ6I5H0PSFZV5INL1C$6GU4E5 IVRU1SIWOUIUIWC0T6F.1AV0D73P//F7TRWKVI%E9A6E9SGC2/70*ZLYMBCP6GGL21V.5UD9BMOQHBHX1HU+HOUHY*68$BG 1*Z7PEK-5T7N4EM8%ROLXL1/TO:HSX1%:QQ6EN5DC*R20D+ZON4KCPCFLVX9S/KISVDM.VTVESMU+*87BMDLH5OIC+A0AA8YNXIV0+O3*PKF4+*Q.1GXX7ZRB+*6U1VFG0R06XK2LLRASFB.BF4T%AP69CL0AOR5.VOX8U$%VX4WIW65N85-P6+1 S384BE.MBZ99:6RDMYN2+CS0C9$AOX$F.:NBTJ-92KTP9PB68H+0D.AUKZ8I%7D%H1LL7.5K$2B05J%6F-PV3012GE0"
    static let cert3 = "HC1:NCFOXN%TSMAHN-HVN8J7UQMJ4/3RZLM52XGP1WG2D58*IXF595TXR38WABRMB57F/8X*G3M9JUPY0BZW4:.A63HNNVR*G0C7PHBO33RW05LBPOF QTYF34HGOIH8L+6H1SF+5F/3E1JAF.75 JDXI03L9ZI4Q5%H0AN8CJ0PZBITHP+PRRMJVUM I/PSM%GA8IM%O%KI*W0 .UQ*N RP-+R2YBV44C$BXGDO98:0LPHN6D7LLK*2H9-89UV-0L/:IS-O:S9UZ4+FJE 4Y3LL/II 0OC9SX0+*B85T%62*5PZD5CC9T0H%:K5QNX/GJZII7JSTNB95+16LETF4N.SS.PKIXR.UIAYUH2WVQI0THXZQ.J91 FI%B2LG7PG% B/UI2YU5MAXSG+W34PIQJAZGA2:UG%U2E4ASNMH8M-405A1OK-UKVCFB3LB.6DJPHBS15C/KNKM4$IIX*B1JS9AC99NE7PHTRO+2I*5C6EA2U$ 8C2ST IE%N1+24V7LD1LZBAMAS306WDO1"
}
