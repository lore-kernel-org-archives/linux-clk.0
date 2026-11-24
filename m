Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550549;
	b=HdPZN5OAoiYEQgNWO8xhCMUzvgdmWiZu5LbUaDsK8EzrToRYKbpU+NB0DMpmn8L0Jp63
	 1Ess8eZXfyF5Lj/ORdL7wS0wBrGF+yNFsKKWT25+V7xJxxsx8MDC5LILFgzIQscNjw1py
	 AsZjODblRN7CzZsa6A12ttmbzf0kWkPWn5lsRUrpUTfUzxzGiYgfdHR0OuA2bRGx29Gcx
	 gfL/ddP68bUQHbrsjsUcxanoQ8uOp9g7zFexb03TqgqW4ODJ8CTdAVQdYUzjxUb+rkfCS
	 Tn064HkeNO7do0xBMKCWowxvXkcwQKPrRaPHgsYeAto+Hf4s6Ov3zQDOtepscfUutCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550549;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Eu2E32/ol3peL/W2BGbxgpIsqZt2KnAdADPuIMiKPDg=;
	b=4wO02Pb47e8j5atzRHnR68uXIAVnQVkuif3HIrNCyCaQWiG3MHkdy3NDRmWofk/v2dP/
	 d0vgoleWHdmufUn4M340s4EhkEtMPdkKWkmMIGVPpj2R1X8/n1txjlRLef6+xt4V0hLr2
	 qKgYM4BlmArfHtOyagw6GJmQqLKSLPhJv/6zTqgT95SmKhUqh9rwxH4ZzQiILTPBDkc8G
	 oZaoC1G2SZziPiPdNps+7iiwj1ZKkDY03kehx7EJM0f43qDb8U3T07t7QLMK5r2tiGVcq
	 LBbNI85FYM8RLcVnJciT2A+UIe2TDEO5g8CkWLIceIyCOLqhbZEaEVgryQCXvYRhMDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j5QU4sZh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BRbAeAyj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D741606A6AC
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D741606A6AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j5QU4sZh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BRbAeAyj
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIXQFj2037000
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:02:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eu2E32/ol3peL/W2BGbxgpIsqZt2KnAdADPuIMiKPDg=; b=j5QU4sZhI2xHgCjR
	p6IcSFGTcbJ82rex+xr1SMhGv1h5qPLhaPUFbQ/1uV3wPzeKB6gijASmOJCZjoxb
	dNITbOgJfcdtYUXdpMOdcdddYWfQb5Szaa2aDTSIm7iUoheXBY+8a1E1fykqei1D
	+jMaynYSLdyNOvppZlm5BJWbXBcajixJM3KoN12E2iQoYP/QFghY5ADuIO86VMZO
	QUxAt791k2lHBqNZRa0hiyiJiBidZrssi2oDSsj9V+fwv2cV8tTuEjJ+mkeQ1lMB
	a1S0FbXF4oSniGR/j5XMGaKap7HsRL/sORiGho1T4HmYda6mhA8PAWUL1DT8A43s
	WnzyTg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5dngh41w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:02:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b494fe37e8so441347a91.1
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 12:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550547; x=1796155347; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eu2E32/ol3peL/W2BGbxgpIsqZt2KnAdADPuIMiKPDg=;
        b=BRbAeAyjjgVr3ZniJikg8nXWvG40uDcmCCpYVMXLCw71vNKT+5q/ytU13K7e0A77Sf
         5OGecJTEopUAwi6CPvtZogEHOQBoqjPFISMZs1wd72jy5sV1bhZJu6t9P2/8xLE2NCLd
         IpdcAje667BKsM8Tum6/ybsr+SbmoYBXOMgFXZDwRodzH2kHgHfsXkiXnjVVaDoUr4Xw
         Ri2S7ZjxJ4OW0X0GF7Aqyo4yLiG2Bs+N0uM6rzgv4UslaXxLvtrfeJW4yNI3YSz8GGxM
         PGrW3YKQOxndZtoeqyCCxd7xqfy28FHlQI89MNLVpMqBGGVrBHLQV3a8BPop/uJaRRTe
         Er0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550547; x=1796155347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eu2E32/ol3peL/W2BGbxgpIsqZt2KnAdADPuIMiKPDg=;
        b=bvhz47QpW7iC/Svq4uA2GTw5L592PFF3xzdKTpQD4i23Q7Ag1zh1MmUcbRlVoSVRE8
         j+Dg4RuP2X/ryMRSy4LCDW9X/kk3d2WdHoZ1jnq0xlaxlUSXcmmro6ab38GhJfBkpTHv
         rTXVkFH2xMIXiBelmk5I6SV/jD1clY+PvzNckOGvryV9YE6DhUG8lAMxPyePVvRDLDYk
         ptb7gAPtnjSLnwLU6A8YZAVwPs64Blzb3APUdk59LAM/Znb0Vl8L4bMFXegGWly5ExEX
         Z8XYZELm1zx+pPnQoJ9JYQ8dtoxuWS+eDgWSBZYDCQOzhFnSToG0iWWv7w02Bowi/mXK
         vYsw==
X-Forwarded-Encrypted: i=1; AL+hErE6S88PccrgQY5/STCculKIpYlU5X2NY5W7EhnPDTNqVnjgRCAVbpdnWByOrNTQye5SHT1148NLChk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hH87CB/zd3JVs3D6QgKjB5HaLbQGlvuwRJwEeEOipboNEZyPw
	tkUv5Nx/jujiqrSneMKFTdiYh5E81CpmQ73gIhQVwprX+z6cbepYHCB/bIJKddGigjGHqYBWpRR
	kWRZlUkIvNx8g2Td35xTrv52w7K49QllGHsPLKlWJhGjZCv1/b98nihXg0g0mXWE=
X-Gm-Gg: AZFdTZeIioZ3Vpf2uUrVYfwvdQFXXKdVS0ZRaNLsIFzFqYmpX+3pYPa2SY9aGdm8mxP
	1K+ycOxE6Vpw+3FixaiNHhVFCKLux8iGCc8vZzWKqwmcm8EdExFz8Wu3TW+1N0f1JcHj5uZcO0j
	DOPLM+wCV6bfqI1K8S+vJFONC91U892Os0wrI+0CW9kV0fM1F/sQklLEd3vx9KNHKHL7eQioPsB
	fvGk5iBLqeuIa43Zl5Xe3C8lg+6gBwajb0zktdT93b6BYYB2ZuBRIdLVRBqzDjo2mVIUeEDWW4K
	8jyYTbWohWUJq1CrYQPi9Fk6uZ4QK+ydfLjJhr7OwWNpey8d0cmnCbhossebSBo2wJUB4OwY6le
	/9z0JGtaoWfYjnYSeeN7AB9NuzqqnHWT/Wl9x3tt/XdSbK/aOCuEwxlKZDSAJ2IhHg8w/Gsmymw
	9KT//Wy6M=
X-Received: by 2002:a17:90b:388c:b0:3b4:393:453c with SMTP id 98e67ed59e1d1-3b41c96fdc2mr24660900a91.6.1795550547051;
        Tue, 24 Nov 2026 12:02:27 -0800 (PST)
X-Received: by 2002:a17:90b:388c:b0:3b4:393:453c with SMTP id 98e67ed59e1d1-3b41c96fdc2mr24660850a91.6.1795550546438;
        Tue, 24 Nov 2026 12:02:26 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:02:25 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:44 +0100
Subject: [PATCH RFC DNM 15/15] arm64: dts: qcom: glymur-crd: Enable the
 tertiary Type-C
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-15-a9b45c69cd38@oss.qualcomm.com>
References: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
In-Reply-To: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=2970;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=Xbb0k+CFqxQM/ieeZbaME85BBswl0ncWd9NTFpQElYI=;
 b=AnKx11Ytmn87ykR5uQbnyVsvTuFo085fcMybmpqMDR6+5APySmsUsX48jB0surCW5xRs4p64i
 uFocYqhyBcKBl+t/XRjLMJBrshrD8rnScFeWwkIVxA+3PaN8jSHdpzX
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX9Gf3XtvIBIvs
 FGC/9w6cIU6BANx9UuzmyFjaS16kcUCB6WaBXNz31bp4paj5A+2Wo/nkNZ/HJaMaRZstueilIq6
 zFnsetw1Nxh4k+QRb4PoZf0gMGgAXJY=
X-Proofpoint-ORIG-GUID: D2yv2rJdLgMSnigqgKer-HwBXS8KUzw7
X-Proofpoint-GUID: D2yv2rJdLgMSnigqgKer-HwBXS8KUzw7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX8/0lC7WbqdC9
 5EF7oPNT3JIQc0XzPn5a3JRU6cKuoAFTnUWoBjlGxufQHEkFGjO5+2fI4zTAuIE/rpqRRfoQY9l
 P5GkFWIvGXhAzfKTniAZpl8ulflg60i0bN4HZNwUDfPxrrwL1diHUAGZysbbhVIiFdEX4n82tCp
 QyAPmGgLVDY2kz6x3S+4yBY/9keOBohX6zd5pg0USx0xiyHTeYEHqg0TXrk6Wytpt0Cni8zHYHX
 bCd8pFDMri7fYtnSDwdC+iKeGerHRtoq3SNH5DFByVEAppyD1ONwJ0xjCIV+Ny+MmH+PkixARU9
 jjMbzlp4no8e0au6MrdIR/IozKl7533JApJTh0EvbhmMauRurSwEgaWOq0BmECZO3SV4sgdUH+s
 0V5/ZGiJ7iIQMDZY2KdDavHl8e4ukUqTmPLlqvLUFx34IzSAG85HSdbtOMMSOwH6FUukLUrOpmy
 J/I0LrqS+pvqCD23uhQ==
X-Authority-Analysis: v=2.4 cv=U9cHnuru c=1 sm=1 tr=0 ts=6b05ed54 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=WzDp-nSq77L6p4kU6a4A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240078

This is just for demonstration purposes for the series, a cleaner patch
handling 2xType-C + HDMI variants will come separately.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 82 ++++++++++++++++++++++++++++++--
 1 file changed, 78 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 53f134878b1934e8627678dd1d3b8b73ec91f308..5d557d17ca29c4b379209815b2ffd426aaa0b093 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -123,16 +123,16 @@ pmic_glink_hs_in1: endpoint {
 					};
 				};
 
-				port@1 {
-					reg = <1>;
+				port@2 {
+					reg = <2>;
 
 					pmic_glink_ss_in1: endpoint {
 						remote-endpoint = <&usb_1_qmpphy_out>;
 					};
 				};
 
-				port@2 {
-					reg = <2>;
+				port@1 {
+					reg = <1>;
 
 					pmic_glink_usb4_in1: endpoint {
 						remote-endpoint = <&usb4_1_mode_in>;
@@ -140,6 +140,42 @@ pmic_glink_usb4_in1: endpoint {
 				};
 			};
 		};
+
+		connector@2 {
+			compatible = "usb-c-connector";
+			reg = <2>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in2: endpoint {
+						remote-endpoint = <&usb_2_dwc3_hs>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_ss_in2: endpoint {
+						remote-endpoint = <&usb_2_qmpphy_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_usb4_in2: endpoint {
+						remote-endpoint = <&usb4_2_mode_in>;
+					};
+				};
+			};
+		};
 	};
 
 	vreg_edp_3p3: regulator-edp-3p3 {
@@ -563,6 +599,14 @@ &mdss_dp1_out {
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
+&mdss_dp2 {
+	status = "okay";
+};
+
+&mdss_dp2_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
 
@@ -735,6 +779,10 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&smb2370_l_e2 {
+	status = "okay";
+};
+
 &sdhc_2 {
 	vmmc-supply = <&vreg_l9b0>;
 	vqmmc-supply = <&vreg_l2b0>;
@@ -1018,6 +1066,10 @@ &usb4_1_mode_in {
 	remote-endpoint = <&pmic_glink_usb4_in1>;
 };
 
+&usb4_2_mode_in {
+	remote-endpoint = <&pmic_glink_usb4_in2>;
+};
+
 &usb_0 {
 	status = "okay";
 };
@@ -1062,6 +1114,28 @@ &usb_1_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in1>;
 };
 
+&usb_2 {
+	status = "okay";
+};
+
+&usb_2_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in2>;
+};
+
+&usb_2_hsphy {
+	phys = <&smb2370_l_e2_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_2_qmpphy {
+	status = "okay";
+};
+
+&usb_2_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in2>;
+};
+
 &usb_hs {
 	dr_mode = "host";
 

-- 
2.55.0

