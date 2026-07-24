Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C9926ED37
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 15:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905244; cv=none; b=s7t+kvegizuBuS0Hyjl+FqmVshWoGHs1//qax2ppRTtSxzSyVf8ZtO+cIOrV4Lp/cc9l+45DIlCVhckWj3RFaw+5hAKe5oK9j5DUfx3Q5c+n79QU418fOU+wAGmXkkvLq2LcV9UQc1VWfqCgi+xyejhVHAObbEBi466KWjU6ReE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905244; c=relaxed/simple;
	bh=NX5KasTfSKSbMXviS2FdTitdo/PZoLn00u5pTFfve+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JH6O8OCgyqH5Watf8uvSOYUTA5pwrNBnYh2YUpNarQkFc673NyerfRMVjKub7R6y8nAhr4CBM6oYFwFSS0bZeVr4EzQZQO7Dz6GyMmOAbMzTS6rXdfj4QhAK9fsUaLahGSOPvRJfTTwSvYnqfnZmNMGPmYsHtMKfMn/x6/7CR8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hDsKG5J0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GWzKFHpl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hDsKG5J0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GWzKFHpl"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbSoH3488119
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 15:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yQfWpDlFYUpXwES98z5okhU7Uu/y/brvW4wJP/P4HzI=; b=hDsKG5J0/4+lV1NJ
	oz0PF0Md6RdmNC6TX5Iby045cgtHxSJ0BmKYCF5N53VdFxzdJNuXHZ59Bi22+90Z
	3EIG7YNaguSO6eb0aTc+87oo+HmUWsCP55ihUil/BCH7NhxhbH18OhPMAJ7CyMZk
	gKNJ5pEEJhxPKIYUjVHS0KS0m0rZJkSTqnNXOEwVB2yG/TmfxmLrWXoKsNqx3GIw
	UND/20jmNJHnuLvY02dtoTRB0B/g34CZV58okQb9GeK/RSWaC0POB2RDW56sEsCL
	lmgT6ohp1VLkOe8tpetd3PHVBcOZMuyJsQd3CiuO2O2TgAw53NTzMepnr4267U+C
	AitfsQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa0c9ja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 15:00:38 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb733fc5024so769591a12.2
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 08:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905237; x=1785510037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQfWpDlFYUpXwES98z5okhU7Uu/y/brvW4wJP/P4HzI=;
        b=GWzKFHpl5s1gsNt35Vj/V/zL/dJhvhQISv5yb6UQFMqMVeO4qTNmXfw4cwOcwz7aSS
         fxk/Gpun8zGqLZ2pHWQVs9V6EnZDOAFcL9ft8q6ViPcP0NIBTZZGE72YirB/z/HBKAtW
         YAhrMOKFdHrRbTzJgHX0V7ZWSksdZcIX1SwAvIvFD7stC+IbDNqRfJLYqLROhyNTdjkn
         RjQ+TPXWWmC9+gXrMGwqkhxBx6bzeQCyrOhx+QMEa29UZPfwbodfk6YZUVN+wzp5/c9R
         57VFSOWD0LZ3pOSlYeHwjqz2CNNT6eCmBuzQZjedwPVyAewjhknJej6d1rFPzCc0DCLK
         /FSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905237; x=1785510037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQfWpDlFYUpXwES98z5okhU7Uu/y/brvW4wJP/P4HzI=;
        b=CA/ok8tuuyyxcSxidcKrRr5jl9nDMzk7rDNyKu4QyFeOlCL+5IwqGaySDMmP+/UFIp
         AvkoVcI1GESosMXXAYIDW79GpaVJXf3A1sPS8mfgXrXtnL1h8Ca5kZ64gVLb1R5mcd6E
         vXuEgNHTki2o/wSTAlpoLKVHyeJnRE0zJss+lRv6hS5FOZjuedTQ0QAkid+6TJmtxFmH
         iBXtjLt7MCTpzMQqSIlSHzJYxRnMV4xrdnspsiJvZhE7rYN/8PiyVQGfFyBTvivg99Nn
         j23rFBFA8q/CJ8X+b1oAIrPaZ8BmZ7+NR/NsBVVQ4/1uzDoG/RliGQtMFz+jm/VPFSVZ
         nSug==
X-Forwarded-Encrypted: i=1; AHgh+RrYEAdkVthPUPWWiuYlguVcMSLSLnWliAeO+YJXm9aPkMlLqiEwZMxCCVf3jooTNhgq49iEV1wcO1g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRwDaBJynDyVDniej9gMT49NAeZ9I3tfBDFRyBYqkkLpzL/vGc
	obI9QpoUZgcs1PI3fywqtKx5G2k4bG5ZQhwihQU+QxqA96SG02v8g+41Iie5U33T5jklCkR9tv7
	lVRrWrFkc4hEZlOo2CgH3BLBYRkUbVyhOzfa2ciR6YZnEJxLuTxSHqRVs/cL4rM0=
X-Gm-Gg: AR+sD11JHyQH0WSrXC6nscs+sx397F2mSwp4w1Jb5/nC7rhb9F3iXssfKoQfV5ieVrl
	ZwLkU5pIuyT+aBIWctTxOp8KXZe8uYnHSPYP59JfZtaKE4Fe3Va3Du2x/0YDtaGio+HhuLHdD9P
	rwLXbb8UOLEcGIqcGW9jnGqMM8ESW9td4Op9CEZJ5CtRlLBzG83TOzq5DrtzuxHDoiu8tdEzNEv
	upN778maTUoG9j9NFQGFXDf6r3xUcFhQtuTl8cXa4gWbnVJaIIIkSPAAXmGKnLeYaM7VQAN00JX
	6lk+/wPJ7mFw8LdEVGNhXea+XRjQorWfpHxHszrl4GHgeTr1Usn1SwJ8a9ZV8Bz05wPInKF9xGv
	1+46kE7FhbjA0Y16W+DMV7MAMREkgNU59KmZ5GD01KW0=
X-Received: by 2002:a05:6a21:918c:b0:3c3:6af8:ab24 with SMTP id adf61e73a8af0-3c44b21eb32mr8865009637.56.1784905237274;
        Fri, 24 Jul 2026 08:00:37 -0700 (PDT)
X-Received: by 2002:a05:6a21:918c:b0:3c3:6af8:ab24 with SMTP id adf61e73a8af0-3c44b21eb32mr8864945637.56.1784905236677;
        Fri, 24 Jul 2026 08:00:36 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc593b57sm621809eec.25.2026.07.24.08.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:00:36 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 08:00:33 -0700
Subject: [PATCH 11/12] arm64: dts: qcom: ipq5210: Add CMN PLL device node
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-qcom_ipq5210_cmnpll-v1-11-a8b8679d215f@oss.qualcomm.com>
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
In-Reply-To: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com,
        Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784905224; l=2855;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=NX5KasTfSKSbMXviS2FdTitdo/PZoLn00u5pTFfve+U=;
 b=gcQ7OhdE0DgGlhmsNp5bB83DWWLXlQAVb3RRgWRFGCxxWA1L+jSeziLbglT90osY6QuuO6AwQ
 S30eUzn984NDohmj1qfgNH239MNl04xUzEvSwIhOFMWQQPtTHNENHMw
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-ORIG-GUID: Og4obqEmUY5oBJHyPYgwYzjyHw7SALpO
X-Proofpoint-GUID: Og4obqEmUY5oBJHyPYgwYzjyHw7SALpO
X-Authority-Analysis: v=2.4 cv=e/k2j6p/ c=1 sm=1 tr=0 ts=6a637e16 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ihdlGfXGyWBHLSVGZBMA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfXyLn/mOH72joB
 0g3O3SYVnhA0KdFAU99I7eN1+8o+uO1hscg/1SMFOuedKaEDTg54CBsG12He5MdEAxQdOLGmXX0
 2/GMHo+DTX/AeFIGyqxI4Jf1JWQ67GyyjkcFU/7WIqpadOEGRCb/07FK0Dn4Ve4CHVODVcghq7G
 gjsbOPMeiuSYweQIGMBjqML+vYDdW8jbT66R8dlM4eEi5J08rfQhPryQ5Hrrea/McwrMG3ycPkT
 1/jvwnoJ5nTdg+uOMl4u+178VcGjb4U1ABZqHdFV5kZ2UIPABt07CwgY3qRsdqlAClo4J6p2wSz
 0BGSPm8lqIDxy4dmwvOuJnOljSRlfPsYCuJ8PrIfmBQoFJrbh1iKQjDKI7Dk6My6sSipyEa6wbN
 IEuTJ+XA3Mo4HugsP2tUkLTBeNOuzs5QsfzyrV5xuH678VJX89q5YAYLSOZBByvSyBk9FAaKI0D
 T4LaqvSiZ3kSNzWf3PQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX1tK4uDwlCLG3
 +eDo1g9izme6lb2k2vCx1cnGeh0uRALuw/jxIkIu+86TrSkQxsUA63js+oOFm6PWvHWsVpuXUvJ
 os156vWegVmY0MSA0x1vwA/GTDUHyNI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240135

Add CMN PLL node for enabling output clocks to the networking
hardware blocks on IPQ5210 devices.

The reference clock of CMN PLL is routed from XO to the CMN PLL
through the WiFi block.
XO (48 MHZ or 96 MHZ or 192 MHZ)-->WiFi (multiplier/divider)-->
48 MHZ to CMN PLL.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts | 15 +++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 24 ++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
index 941f866ecfe9..7410d092814e 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -74,6 +74,21 @@ &uart1 {
 	status = "okay";
 };
 
+/*
+ * The bootstrap pins for the board select the XO clock frequency that
+ * supports 48 MHZ, 96 MHZ or 192 MHZ. This setting automatically
+ * enables the right dividers, to ensure the reference clock output
+ * from WiFi to the CMN PLL is 48 MHZ.
+ */
+&ref_48mhz_clk {
+	clock-div = <1>;
+	clock-mult = <1>;
+};
+
 &xo_board {
 	clock-frequency = <24000000>;
 };
+
+&xo_clk {
+	clock-frequency = <48000000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 2cdc10529c48..9bbd55cc1e75 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,ipq5210-gcc.h>
+#include <dt-bindings/clock/qcom,ipq5210-cmn-pll.h>
 #include <dt-bindings/reset/qcom,ipq5210-gcc.h>
 
 / {
@@ -13,6 +14,12 @@ / {
 	interrupt-parent = <&intc>;
 
 	clocks {
+		ref_48mhz_clk: ref-48mhz-clk {
+			compatible = "fixed-factor-clock";
+			clocks = <&xo_clk>;
+			#clock-cells = <0>;
+		};
+
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
@@ -22,6 +29,11 @@ xo_board: xo-board-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 		};
+
+		xo_clk: xo-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
 	};
 
 	cpus {
@@ -141,6 +153,18 @@ tlmm: pinctrl@1000000 {
 			#interrupt-cells = <2>;
 		};
 
+		cmn_pll: clock-controller@9b000 {
+			compatible = "qcom,ipq5210-cmn-pll";
+			reg = <0x0 0x0009b000 0x0 0x800>;
+			clocks = <&ref_48mhz_clk>,
+				 <&gcc GCC_CMN_12GPLL_AHB_CLK>,
+				 <&gcc GCC_CMN_12GPLL_SYS_CLK>;
+			clock-names = "ref", "ahb", "sys";
+			#clock-cells = <1>;
+			assigned-clocks = <&cmn_pll IPQ5210_CMN_PLL_CLK>;
+			assigned-clock-rates-u64 = /bits/ 64 <12000000000>;
+		};
+
 		gcc: clock-controller@1800000 {
 			compatible = "qcom,ipq5210-gcc";
 			reg = <0x0 0x01800000 0x0 0x40000>;

-- 
2.43.0

