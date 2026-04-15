Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F3E3B2FF3
	for <linux-clk@vger.kernel.org>; Wed, 15 Apr 2026 13:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776260028; cv=none; b=Lrl5RjZJplYZ4QbFOQLrgf2myLsMRo2sGyQjpvriVuFXbWvWz6UBJCXYBB4/9H9dt1RTBzbC1dyYUjLLTbGasms7tiHANym16aP+Up/jtF//G5erMvUD3b+QcoS97K8MiwaFUPfrnvavJAzzyvZuwVvi//6k2PJuU0O1aWQ3AIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776260028; c=relaxed/simple;
	bh=MDqwhecTW4EJwoRIzi2Jxw4U12W0N6LMGHAHov4gvCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mhLXdrWgbJgbMzJts/K+ZfroB87FxW08B6P/eNQ4cqf5ikUtQaI29mWzxGbVXTGKZnKIL8Fg/urHo7OKedvaNSd9r0rgkX271cIMFwjrPcuXf37PSbQu1vU/2pgrsTrvSUWi3aR9dbGMQiJjVMnaD31iygXYMPuWQUgL15jPV7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ah30PV9U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e+V1zT9d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ah30PV9U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e+V1zT9d"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F9ghlL1778923
	for <linux-clk@vger.kernel.org>; Wed, 15 Apr 2026 13:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CD0hcrZPmTX3WuZwU95ZTPb83xTzxMybISm7lO6K16o=; b=ah30PV9U4tqA4nH5
	Ezuddp5IKc+PFTEOlgvZk2VAB7lxVhMgVrRBXZz1Mhgv3RBb0pbHXg3mUg3chk45
	e6YIqgm/r32DGIFBnsyWry7/yQEg7iidgO9eiBoX20Tw5q1DdeMq6JICwLVrbjpb
	T6xz2JybLUpxxbOhmDP1Vr7Gh8KpPymbFdE+AwxcgT1kjOGeCHcmOZZfJjLhAUo1
	ibe1yfRM4C8fTTgcxdMdXsHH2n7LElIdBFo5jr49lqT9ypEQFyiKwspgLyFWf9Xt
	d0TaM2HaHLmd663erW/ng4TmebObkoD+ie1L6QSDcw8MWtgXukXTnODt0j9k+WY2
	cReY0g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrw03ra7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 15 Apr 2026 13:33:46 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f37744f01so4561265b3a.3
        for <linux-clk@vger.kernel.org>; Wed, 15 Apr 2026 06:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776260026; x=1776864826; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CD0hcrZPmTX3WuZwU95ZTPb83xTzxMybISm7lO6K16o=;
        b=e+V1zT9dYUYn0sEAtqA45MjXHGVwibCkm5Psf9xByKcxvn4VbeP//lzS6UQdbx9RmB
         5cywjhVuRAl1huo1hw9iJlviJ2I6Bh6PWYh/xYv+GTEBmleAurfNMum8KUWHUsXqiYHd
         YlUeBDfF1p7FuOPB8D8+k+QgdDhE80QipAyyO7CNMX5x/nJRZNGuEeXUx8oTgx45EIWa
         FKDd7HtrnOrvEq6TGXG6skE2sH3g8NLTrEf01lbsYdUY1k/1Kh6QC7t6Ifj/smak+D/4
         5UbXPXZw5zast1dpEpZmNnDptbnNkM0Oo+Qi1U1U/DMYKBLYXxTQcRPR1LeuoWoab/c8
         mjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776260026; x=1776864826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CD0hcrZPmTX3WuZwU95ZTPb83xTzxMybISm7lO6K16o=;
        b=egU1TrdbE1eNSZfejYloQS/FMyXzxEsZ9+sdVvDx6Ld5mGEuanM8s4EwfO36ZR0sW8
         BzDHXQPpu8GeQ1w1Lor85+ieaXbtp9WTYbNYmX1xm8shcY2/eQkIUzr0Qck9gvqRxXdx
         bW0Moq/65q2z9r99XKW2MlnDcrrXkdqHmJiPEdViScvmPAs+qkDJiNZFsDgxLBjXlxpO
         77ViPwrzQQmwdhlKhgXqhdBrN8QDPnSJLV3GZ4ElpGHZU2AwQIYYbgM8FMhA7sitKMtQ
         iIE4sAFQjOcClzqM5KfHT0ToWi3R9XsSPinjMEXGcXG/CkOgiUomCVzT73tNj/hpgrea
         vqlw==
X-Forwarded-Encrypted: i=1; AFNElJ+rpakleXNsHd0RMBHTV2yTZl1LPhT0LiE48sn7ttkfDYFGy/NQtmbrMOvsir822xDy+XQ05X8T1eY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvvYncn09kKBuRUlMkZtmvF2B3+k2vNcKLGeVrueXVYr+uKIgO
	53m6UGHUVoVvzzAHszIhyHFQFqtE7NwNzq02kCVzjYTl43Do6za05T9eIusZdRxL4M2GqtGe0JY
	SJgo8vhsstiVdgJmsU2RSkwVjt+lg0QfXB/mCyCohDTy4CMEMGMLHAy7odGVqJt0=
X-Gm-Gg: AeBDiet0gg2/ELDLj3eHQoQYfin2VNapAq3S1yJUykOxy6cP/rwKGB/B9wRGwbJNTqO
	ys6o6tTTNjGn59PlS0j2hsnj4oRMJnNbkhKsDp2RXhgNGyw1pi8IpbJyeYE2m7zDa95npk2bUdv
	cd9PJeW0PpKDp3/cR9nejq1Mzxsvyfer6xzARudWZbFvjiRf+PHhjUogXF23nNwe30sJNMHPTQd
	gTeugv3Pkd6kupPVjhamIbEBbHcksg3JqXjsFDCRpqX7z47FYGOvNl9PMF0tiKIw4z8QaZBq5Of
	qAjZkbovcdzXGXsMENO/67ieEgE654HrOfZXXikij4ZHVsoTyjrPsP5gXzCMm8sVONweOzotvEm
	HzyInCS0WbJuE2QUmBZi8SWiY6HP84D7oqttH5o0EeZTsP7v/kEdh21sNX0uernSsF0xlf2VwpS
	0UEnIWa7buwJX8Eqv5fBx3MHkdVYuiwEBf4xEqfAIk1FZXu4RWvoibX3tO
X-Received: by 2002:a05:6a00:951b:b0:82f:5a8b:7f90 with SMTP id d2e1a72fcca58-82f5a8b8304mr5825881b3a.14.1776260025322;
        Wed, 15 Apr 2026 06:33:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:951b:b0:82f:5a8b:7f90 with SMTP id d2e1a72fcca58-82f5a8b8304mr5825827b3a.14.1776260024662;
        Wed, 15 Apr 2026 06:33:44 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f6b95f222sm1602774b3a.29.2026.04.15.06.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 06:33:44 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 19:03:19 +0530
Subject: [PATCH 4/5] arm64: dts: qcom: add IPQ9650 SoC and rdp488 board
 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-ipq9650_boot_to_shell-v1-4-b37eb4c3a1d1@oss.qualcomm.com>
References: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
In-Reply-To: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776260000; l=10885;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=MDqwhecTW4EJwoRIzi2Jxw4U12W0N6LMGHAHov4gvCQ=;
 b=DN7mKuc4eTiuvVay9JTjko0Ogye8Zjv0widV3dOttDLa9ipHfX+OlW3omwWlJDzty1J1+sZnw
 Ya8L7JaYkC3DOdy+xWAGSG6zXADdGqYF3ks6Cb3IGJLU0A9Z7Yce27X
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: -oZEnNjihbaStNaJqObuwJy5AVsLwr1X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEyNiBTYWx0ZWRfXx9ZWcete5ZOY
 p7hMYqTJHGs3dOKWDIc+ubVhbeME3LX8wizQe8/F+r77nOSssgJyyx/O6b1lbdznOil3Zhekw+q
 efsF9o9qjoz0ofm2eZRZjwdD62TaapDRb159u5aCkFP+fGqiRju2y2uIliqWZXoPUoIWDHV88bR
 5Ytf5G8SD76b14u4DSihxnzjENVfK9pqXGKAbWZIioQ/uJfVGzoTbC72Lrk9y9ewo6IuUYizz46
 DRxJDfrJIvERFwgINBtB+y8k0g/B8Kg+hPlizfWOrBC9PJJ3jbLA7Tdq14KWPg8tJsaebH7MWH3
 BRWPAmacHUap0CHvzcfRGTmPBW2Zsy07wAvczbjhepr6iqlLUvHT8u2X3eoR0lAq9YkT6Of4Asd
 Tlpo8HALokjiIazCFJpLgDYF49tcXfHplPjCpiPSHShtISnTNonbODzOE+ot7mqXjrZIO+mizOA
 L5YxIYFPImQy00JcE3Q==
X-Proofpoint-ORIG-GUID: -oZEnNjihbaStNaJqObuwJy5AVsLwr1X
X-Authority-Analysis: v=2.4 cv=YMGvDxGx c=1 sm=1 tr=0 ts=69df93ba cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=fBkTXTPqfNaV2XDYC8MA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150126

Add initial device tree support for the Qualcomm IPQ9650 SoC and
rdp488 board.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile           |   1 +
 arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts |  79 ++++++
 arch/arm64/boot/dts/qcom/ipq9650.dtsi       | 366 ++++++++++++++++++++++++++++
 3 files changed, 446 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4ba8e7306419..dba16311ca2b 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -39,6 +39,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp433.dtb ipq9574-rdp433-emmc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= ipq9650-rdp488.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
diff --git a/arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts b/arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts
new file mode 100644
index 000000000000..6871f3dc4eaf
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "ipq9650.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. IPQ9650 RDP488";
+	compatible = "qcom,ipq9650-rdp488", "qcom,ipq9650";
+
+	aliases {
+		serial0 = &uart1;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+};
+
+&sdhc {
+	max-frequency = <192000000>;
+	bus-width = <4>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	pinctrl-0 = <&sdhc_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32000>;
+};
+
+&tlmm {
+	qup_uart1_default_state: qup-uart1-default-state {
+		pins = "gpio43", "gpio44";
+		function = "qup_se6";
+		drive-strength = <8>;
+		bias-pull-down;
+	};
+
+	sdhc_default_state: sdhc-default-state {
+		clk-pins {
+			pins = "gpio5";
+			function = "sdc_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		cmd-pins {
+			pins = "gpio4";
+			function = "sdc_cmd";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		data-pins {
+			pins = "gpio0", "gpio1", "gpio2", "gpio3";
+			function = "sdc_data";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+	};
+};
+
+&uart1 {
+	pinctrl-0 = <&qup_uart1_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&xo_board {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq9650.dtsi b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
new file mode 100644
index 000000000000..f3dfd595ccaf
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
@@ -0,0 +1,366 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,ipq9650-gcc.h>
+#include <dt-bindings/reset/qcom,ipq9650-gcc.h>
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	interrupt-parent = <&intc>;
+
+	clocks {
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
+
+		xo_board: xo-board-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		CPU0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0>;
+			enable-method = "psci";
+			next-level-cache = <&l2_0>;
+
+			l2_0: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+
+				l3_0: l3-cache {
+					compatible = "cache";
+					cache-level = <3>;
+					cache-unified;
+				};
+			};
+		};
+
+		CPU1: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x100>;
+			enable-method = "psci";
+			next-level-cache = <&l2_100>;
+
+			l2_100: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		CPU2: cpu@200 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x200>;
+			enable-method = "psci";
+
+			l2_200: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		CPU3: cpu@300 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x300>;
+			enable-method = "psci";
+
+			l2_300: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		CPU4: cpu@400 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x400>;
+			enable-method = "psci";
+			next-level-cache = <&l2_400>;
+
+			l2_400: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&CPU0>;
+				};
+
+				core1 {
+					cpu = <&CPU1>;
+				};
+
+				core2 {
+					cpu = <&CPU2>;
+				};
+
+				core3 {
+					cpu = <&CPU3>;
+				};
+
+				core4 {
+					cpu = <&CPU4>;
+				};
+			};
+		};
+	};
+
+	firmware {
+		optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+
+		scm {
+			compatible = "qcom,scm-ipq9650", "qcom,scm";
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the size */
+		reg = <0x0 0x80000000 0x0 0x0>;
+	};
+
+	pmu-a55 {
+		compatible = "arm,cortex-a55-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	pmu-a78 {
+		compatible = "arm,cortex-a78-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		bootloader@8a100000 {
+			reg = <0x0 0x8a100000 0x0 0x400000>;
+			no-map;
+		};
+
+		smem@8a500000 {
+			compatible = "qcom,smem";
+			reg = <0x0 0x8a500000 0x0 0x40000>;
+			no-map;
+
+			hwlocks = <&tcsr_mutex 3>;
+		};
+
+		tfa@8a600000 {
+			reg = <0x0 0x8a600000 0x0 0x80000>;
+			no-map;
+		};
+
+		optee@8a680000 {
+			reg = <0x0 0x8a680000 0x0 0x280000>;
+			no-map;
+		};
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		dma-ranges = <0 0 0 0 0x10 0>;
+		ranges = <0 0 0 0 0x10 0>;
+
+		tlmm: pinctrl@1000000 {
+			compatible = "qcom,ipq9650-tlmm";
+			reg = <0x0 0x01000000 0x0 0x300000>;
+			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&tlmm 0 0 54>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gcc: clock-controller@1800000 {
+			compatible = "qcom,ipq9650-gcc";
+			reg = <0x0 0x01800000 0x0 0x40000>;
+			clocks = <&xo_board>,
+				 <&sleep_clk>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		tcsr_mutex: hwlock@1917000 {
+			compatible = "qcom,tcsr-mutex";
+			reg = <0x0 0x01917000 0x0 0x57000>;
+			#hwlock-cells = <1>;
+		};
+
+		qupv3: geniqup@1ac0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x0 0x01ac0000 0x0 0x2000>;
+			clocks = <&gcc GCC_QUPV3_AHB_MST_CLK>,
+				 <&gcc GCC_QUPV3_AHB_SLV_CLK>;
+			clock-names = "m-ahb", "s-ahb";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			uart1: serial@1a98000 {
+				compatible = "qcom,geni-debug-uart";
+				reg = <0x0 0x01a98000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE6_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+		};
+
+		sdhc: mmc@7804000 {
+			compatible = "qcom,ipq9650-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0x0 0x07804000 0x0 0x1000>,
+			      <0x0 0x07805000 0x0 0x1000>;
+			reg-names = "hc",
+				    "cqhci";
+
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq",
+					  "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
+				 <&gcc GCC_SDCC1_APPS_CLK>,
+				 <&xo_board>;
+			clock-names = "iface",
+				      "core",
+				      "xo";
+			non-removable;
+
+			status = "disabled";
+		};
+
+		intc: interrupt-controller@f200000 {
+			compatible = "arm,gic-v3";
+			reg = <0x0 0x0f200000 0x0 0x10000>,
+			      <0x0 0x0f240000 0x0 0xa0000>;
+			#interrupt-cells = <0x3>;
+			interrupt-controller;
+			#redistributor-regions = <1>;
+			redistributor-stride = <0x0 0x20000>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			mbi-ranges = <800 160>;
+			msi-controller;
+		};
+
+		timer@f420000 {
+			compatible = "arm,armv7-timer-mem";
+			reg = <0x0 0x0f420000 0x0 0x1000>;
+			ranges = <0 0 0 0x10000000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			frame@f421000 {
+				reg = <0x0f421000 0x1000>,
+				      <0x0f422000 0x1000>;
+				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+				frame-number = <0>;
+			};
+
+			frame@f423000 {
+				reg = <0x0f423000 0x1000>;
+				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+				frame-number = <1>;
+
+				status = "disabled";
+			};
+
+			frame@f425000 {
+				reg = <0x0f425000 0x1000>,
+				      <0x0f426000 0x1000>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+				frame-number = <2>;
+
+				status = "disabled";
+			};
+
+			frame@f427000 {
+				reg = <0x0f427000 0x1000>;
+				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+				frame-number = <3>;
+
+				status = "disabled";
+			};
+
+			frame@f429000 {
+				reg = <0x0f429000 0x1000>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+				frame-number = <4>;
+
+				status = "disabled";
+			};
+
+			frame@f42b000 {
+				reg = <0x0f42b000 0x1000>;
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+				frame-number = <5>;
+
+				status = "disabled";
+			};
+
+			frame@f42d000 {
+				reg = <0x0f42d000 0x1000>;
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+				frame-number = <6>;
+
+				status = "disabled";
+			};
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
+	};
+};

-- 
2.34.1

