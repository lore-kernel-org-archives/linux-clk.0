Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2793AA4E7
	for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 02:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784083253; cv=none; b=qgNxhoYDhRKs5ut01e70wQK0mgyly5HFPI9FrFYQ8KoF3FfIpu+5C35S7df6FHr/VrV8AD8ksTAJNot+DGtP+4Pcmrchy/MZ8D3AadWBrK0gL7+GN18bcRAlfCbN972stbtebUdl+ran1iv3dTzjHx4WihXJmeuhjAkyOYBy2g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784083253; c=relaxed/simple;
	bh=Y7Enj5nvTnUAitOITbmVzUKyVAQIsXafQXnlA1pe5jU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bCpEoOY2i0WDblPxvpovpjTsvTlEQNnjYQyIVKK3lJ8LWxkcCAPmfG9RBIGYsnLo1O4HoIPkBCMi3llXa/ds0jTGXYJnTDeCBCclVGWjcNubnF1Ey1ZM43+3u5YAdA/DRri5tLjx96qlMvESy/bW0bJpF8vcaFoBe0Q3xbyLiwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QDcYKy8Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b1+SQhS5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QDcYKy8Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b1+SQhS5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F0ID391952200
	for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 02:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k7HQRci3DBuDSJayO0pvsfI9FYIEDGLij9I7lpGA+Hc=; b=QDcYKy8QemlXXVMC
	PF5yxgH1PBlEwYkhr8Ne90av9AApceQSV3tdvkYQmAVE3SpcI+vJnhL2+G5GNnAx
	n0cESaM/VT2WlJNPXRMry65XstRwSHURTnopC53oiscVn4+S3eDojuRuEuxENLit
	ydoXBRVz3kovEpRBav5oxLNhZ2w7RkMrxk95AA8BXxzaLIa8BWEi78KH9GbFD4UT
	2D7/c7jmo1fsys2b6Hstn4U3aLQVzkVX7rTuoLcBb5RUTPuyfgUcf9UtDpAvu9Q8
	yFSXHx+AkS8LdiFfglRFPwj19QvZfAK4seDkUfhSA1TGdKWlh4T0S4+Hgw3qVC5u
	Z5wyeg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9g1m4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 02:40:50 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8895156101so4738583a12.1
        for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 19:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784083249; x=1784688049; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k7HQRci3DBuDSJayO0pvsfI9FYIEDGLij9I7lpGA+Hc=;
        b=b1+SQhS5tz/JDm2rwgJFQnTQMtYmEDRhkT17lr/6hEB6KRVvL0SyGIkG9b0irlpaBL
         1t0mM4+WnwQgaVTV7xC2u4Ls22JNT3+P+a5akukMcAUdZj1du0q4zXbxJqJbRWTPELyY
         GYNTH18JFq4PVTbZCw0IichNuYPE46S0Bgt27JrpYKtnEK+eYoPCcXVti5N+dVQ4L4yu
         KpcTIlh1GXvXOp4M6WLTJ95tS7SS4R2pNketjBmUFdFJOJCU1jj8RLcr8bH69paYlh3d
         XLSLXyLpg/Htyr9gfP4UXybxPUWXc9+3VAkF08NMyAtZgwFMBJmx0U0wy8ApgKcj6bKg
         /8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784083249; x=1784688049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k7HQRci3DBuDSJayO0pvsfI9FYIEDGLij9I7lpGA+Hc=;
        b=MuO4wg9uNipyrz+dj1VeoSoMlZTTPLgiygC9VbKYsP+TIf1wSMYWUqTWvwmJ9gP6rm
         /xNrL7Gz385ZcWFZ5GY0xeLm2N7VJ7ONLfrtNbUdRJHic0onRMIZND5sVPBT1ZQvZXuU
         qt/6Upv0dZDXCJ9LlhzdRZNaa3JazzSRZ3AFwCRi8pCeeO68KhGkcNL2IT5uewhTrTnk
         TbV8j9vaTTd7i6/gott95DCsHdUf3IbXuQdf5Usmt/XCr7PmlN/0K+3uBDzfpyNczfAC
         ebOUDAZG9+bhAZiMzraOP0vbFx2f9XDtkF55HAdoWwbSLmuS9+ldBbYSV7NvNlBJCJj2
         DVZQ==
X-Forwarded-Encrypted: i=1; AHgh+RrYLdauKw7QzWNsFy24ENm3i4futfM4EZ1JZQzZowpnRUQyz+mv+r74jK7cgzpuQjBcji36sqIw7xU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkZuMk9r6N1zlsgFThJUWxwssQq7Ei7S1kiCoB/W8HZkjOqT3X
	om3KM/k5XEgZG7irmCgHOzrmZN5mSXiNcapI71T3x2gPF8Mr01XyiqNOiu0LoRVnkidv/IHbBnP
	8hEvcln1gKXBF9S/gzL8/pO4bhXZLx2i1rM1hHMENDyU6FRCx/vNZDkHsgo1u1Is=
X-Gm-Gg: AfdE7clRNMw7nSVodbKG+GStDjMZ4iaUwF6V0o8tXEIkykegftOaHcpLtLywbTG9ZUR
	A83iEi6Uiqc6EX/b40/AVRFkFQT1ycv7pujonN1qgs1qj95vQJyIW/5ecwKtjozvRY0YVC4Ctqp
	2GZo0GUemj4mTUsV0KfSw/cZ5KEvm6SKRdo82xriaxYgInQXn/Kx6P8U5H9mUrYxCF7aBDv98u8
	nl4Y2KSYsXqG3Xal9HP8Y1+EsMNc49x9rzBpwYwXJ0PyZQm3LSI43CJESsSeiU29uItY6SfH/xI
	JxaVsV8DgpT/5k51rkbiFnC9YoNgfY7aHBAqpi7nyKr70mR9MqdyT33TZ3YzbPXp6gfqy+iCBP3
	41rN0tR0imPrtx9TtcJddthgSxsbYCM/cuhjo0jmAG7UsV3iLhctTPQVagg==
X-Received: by 2002:a05:6a21:a98:b0:3bf:6c08:fb83 with SMTP id adf61e73a8af0-3c36c3ddccbmr1078246637.51.1784083248714;
        Tue, 14 Jul 2026 19:40:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:a98:b0:3bf:6c08:fb83 with SMTP id adf61e73a8af0-3c36c3ddccbmr1078210637.51.1784083248091;
        Tue, 14 Jul 2026 19:40:48 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm155285746c88.14.2026.07.14.19.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 19:40:47 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 19:40:43 -0700
Subject: [PATCH 3/3] arm64: dts: qcom: hamoa/purwa: Add QREF regulator
 supplies
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-hamoa_tcsr_qref_0714_2-v1-3-13047922a376@oss.qualcomm.com>
References: <20260714-hamoa_tcsr_qref_0714_2-v1-0-13047922a376@oss.qualcomm.com>
In-Reply-To: <20260714-hamoa_tcsr_qref_0714_2-v1-0-13047922a376@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784083243; l=26246;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=Y7Enj5nvTnUAitOITbmVzUKyVAQIsXafQXnlA1pe5jU=;
 b=LPhJum2nzbYScgqj8qoMy5+lnfSQlb4g2GvvDi4TWXmGCHjGMjOsZ3oJMVbvkKCJd50eRElhw
 dMRSiBGpfzJCghtgqdMF0NVbH9StJdEXoRlKh/SyOB6XvS8lVVpCdia
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAyMyBTYWx0ZWRfXws3PIA/uMzv0
 L2UnH3hMrlWhuLGAXyuEU681Af7nTrtmZs3v4pyxOo4e5AyAErBZDWh+esfqld/+Pewyu4a8iqI
 I23HadDINc/AMmfBAIjEsrIishS2tXI=
X-Proofpoint-ORIG-GUID: ZP6PXQEYH19lkEpTnIQmJIw_vFN-7TwI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAyMyBTYWx0ZWRfXyYd1dD8jmTlT
 uqA4fMSRjmCM0D0PFkzSVn30XXJABO3RDd6eT8j5lUG85KabgIGPuKjGBjn0UQ7zRetEj+1z1ww
 uQLXJsvCfJra3AFwLsQ0BoyDF/RQGwFCXdHGKSIxUdBWkXd0W5bxZwc2vTy4wgY2X42/zHs52LX
 8iohy6zmvz53FSE+qMqmbBvfSy/27trO15UAJstZMEOdt7Leyj30C2+9XiLOmtNJqg15bGr71Ya
 ZSOdKHigZlNCe2IUWc4WVzRcnhhc2JLXoX3nWYWmxiWBtuF6SxRGEOKqdYe/TPHicnZFCi3FKoG
 WW24lam5rLQUZvCPdnBdv/f5nKWpP9Hv48h81jfF4y2UB8yVi1K1adVe2c1hbbhvffYkNJkj5pp
 MReojjUSInd2e/XPmnTq6NjjMGFSxXCXTqF0xPB1UJ2kzOVsEwe8EJJbq3kuZA5F24PQP85b2V8
 gR76uMfwRpGLnGOZJ5Q==
X-Proofpoint-GUID: ZP6PXQEYH19lkEpTnIQmJIw_vFN-7TwI
X-Authority-Analysis: v=2.4 cv=VoATxe2n c=1 sm=1 tr=0 ts=6a56f332 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=4vDcivUYQOVtOqHL04gA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_01,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150023

Wire up the LDO supplies required by the QREF and refgen blocks on Purwa
and Hamoa boards. Purwa's QREF topology is same as Hamoa's, so it reuses
the same qcom,x1e80100-tcsr compatible and supply set rather than needing
a dedicated one.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi         | 21 +++++++++++++++++++++
 .../qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts   | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi         | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi  | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi   | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1-crd.dtsi                | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi         | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi    | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi   | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts        | 21 +++++++++++++++++++++
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi     | 21 +++++++++++++++++++++
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts      | 21 +++++++++++++++++++++
 .../dts/qcom/x1e80100-honor-magicbook-art-14.dts    | 21 +++++++++++++++++++++
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts   | 21 +++++++++++++++++++++
 .../dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts     | 21 +++++++++++++++++++++
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi   | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts           | 21 +++++++++++++++++++++
 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts  | 21 +++++++++++++++++++++
 .../boot/dts/qcom/x1p42100-microsoft-sp12in.dts     | 21 +++++++++++++++++++++
 19 files changed, 399 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
index 9c5e77df0054..c035bc890f36 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
@@ -478,6 +478,27 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>; /* TPM LP & INT */
 
diff --git a/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts b/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts
index bfb7cea56df9..4c77c51768ab 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts
@@ -902,6 +902,27 @@ wcd_tx: codec@0,3 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
 			       <76 4>,  /* SPI19 (TZ Protected) */
diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
index 394e65518ac5..3d3b40e19c76 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
@@ -471,6 +471,27 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>; /* TPM LP & INT */
 
diff --git a/arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi
index 48c4ad648354..57c306047d7a 100644
--- a/arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi
@@ -1036,6 +1036,27 @@ &smb2360_1_eusb2_repeater {
 	vdd3-supply = <&vreg_l14b_3p0>;
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
diff --git a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
index 66d566808f58..da6ecd4a1452 100644
--- a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
@@ -1272,6 +1272,27 @@ wcd_tx: codec@0,3 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p9>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p9>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <44 4>,  /* SPI11, TZ Protected */
 			       <90 1>;	/* Unknown, TZ Protected */
diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index 9602d65c8b3d..8bd58f194f82 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -1528,6 +1528,27 @@ right_tweeter: speaker@0,1 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index d6de4da02dcd..dd466aac10f2 100644
--- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
@@ -1301,6 +1301,27 @@ right_tweeter: speaker@0,1 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
 			       <76 4>,  /* SPI19 (TZ Protected) */
diff --git a/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi b/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
index 02708f23a865..224474678ed2 100644
--- a/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
@@ -1284,6 +1284,27 @@ wcd_tx: codec@0,3 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
diff --git a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
index 7559557610ed..9f677319a0e0 100644
--- a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
@@ -1107,6 +1107,27 @@ right_spkr: speaker@0,1 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
index 2e38402e2c14..9ccfaaa3065e 100644
--- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
+++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
@@ -1193,6 +1193,27 @@ wcd_tx: codec@0,3 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <44 4>; /* SPI (TPM) */
 
diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 5d49df41be02..d172d8eb52c6 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -1382,6 +1382,27 @@ wcd_tx: codec@0,3 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index ce7b10ea89b6..ed812cf349dc 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -1069,6 +1069,27 @@ &smb2360_1_eusb2_repeater {
 	vdd3-supply = <&vreg_l14b_3p0>;
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p9>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p9>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
 			       <76 4>,  /* SPI19 (TZ Protected) */
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts b/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
index b70c1e094bbf..603f6d7717f3 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
@@ -1066,6 +1066,27 @@ right_tweeter: speaker@0,1 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>; /* SPI (TPM) */
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index beb1475d7fa0..0ddec7b4a473 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -1347,6 +1347,27 @@ right_tweeter: speaker@0,1 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
index f95b1f9f439d..ac4e7943c608 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
@@ -1248,6 +1248,27 @@ right_tweeter: speaker@0,1 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p9>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p9>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <28 4>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 28342cb84ded..47018bb4e7ec 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -1322,6 +1322,27 @@ wcd_tx: codec@0,3 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 8afbac349cc9..8c41ff76c68e 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -1177,6 +1177,27 @@ wcd_tx: codec@0,3 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <33 3>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
diff --git a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
index 500809772097..53c7d0fe7d54 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
+++ b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
@@ -1324,6 +1324,27 @@ wcd_tx: codec@0,3 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <72 2>; /* Secure EC I2C connection (?) */
diff --git a/arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts b/arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts
index 0314b2246cdb..edcb6b99a384 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts
+++ b/arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts
@@ -968,6 +968,27 @@ right_spkr: speaker@0,1 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>; /* SPI (TPM) */

-- 
2.34.1

