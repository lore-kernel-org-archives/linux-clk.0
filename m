Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4593890EA
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379486; cv=none; b=is7VF4Eq27bQ2vTotV3rNxnlhvnMAWdkLvlzCeoq5I3Idqu0Ty/HVBBZ3vS8fm7LFan5DuBBugtgG4hMmw+ENh8CRmEh49v0puD26OmU2U/FWTqD59wwTFxrg0eR2SrF9Rt6eE960gbkPstMKbYPLi07d3/uJX4B2BrPCEe1OhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379486; c=relaxed/simple;
	bh=W8fQ/mHRK7+lmrAsUtJnjM7kVJyNpvrbB36Yz1Pnvz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q+NJWvxPe0FghJ/sawyWMpodhYyEq01D/CkeC+cPrVvRXskZ2RB8B6GR6BWPvIt1T8Q4SQ5GfxNFRa9fzo8QRL8wuSJi51NT+9uiPJVEKRbCIYKgNwnrAFMdR6iRf13HnR7qmmudtw+nEkus7M00fp3u6n5SI2BrYioVHS3gEqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C1Kvz/z8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UdRlMhB7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C1Kvz/z8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UdRlMhB7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAIAUj418371
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:58:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7FD00VAny2e+DYLeLM3Tk210/krwbmmfC51LXdEm4hg=; b=C1Kvz/z8Zl6hxvq0
	4G+DesYUtHqOTTZskn/uNQUqQjDQPypo5XS1d/jgbytch65Rwz/Js7cq/UAZ1Dvb
	rKIZnwd3hXPCILy4Tz17P4/P8t+eF2+0e+fBzqQoXuDlYuHSZEAiV3mhbqgjOpX0
	1WsgVC3W/t1JvoSGnIu6PBqvV5hGv66xhZZTLUl00rU7EXQ0gPTDggmxtM801Ws8
	rl1kb3vH5J1T1IYYNFup+q+KwKTUY/FUgiutCThOdCzcoNK4d4Mj1Kp/0D7kdoHQ
	GZP59bu/OpNkGhxmP239qKm8zyiM4J8/vKbJJ7RWncjUsjPkC/hjPiOPRFmIEqLY
	PKCyMg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2dc0s40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:58:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso7954757a91.0
        for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 05:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784379483; x=1784984283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7FD00VAny2e+DYLeLM3Tk210/krwbmmfC51LXdEm4hg=;
        b=UdRlMhB7vVHoHDHS3zrC5BgBpFuGV8LvGZavweUX3d67uWuDw5farnb98lqNqj99KQ
         1yqtATH/AxU+y8kiHO7IhVL0qPlqjaAZgvF9u62jB1suJ4xQx4t9tpo7wqwrALFfk5zC
         2/kkyEwB2j1e/XxTGceRFz0Ev73YbvO+413M0LHu1GAil9bEYP6QJALHUQgbTN0pJBX4
         RCYqnIEF9EACMW8J4wRZJeCb1/NMHWjtyijXZEJYQ1kebpnYUUu7aHWcuGEsrlFBgA46
         uiqONB0SyUC4K6djbBjS0M+FkzDyaLIynOpEb0w9MWXRE2bQWVGkSqe3BEmJcbnyY1QJ
         V6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379483; x=1784984283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7FD00VAny2e+DYLeLM3Tk210/krwbmmfC51LXdEm4hg=;
        b=iXZ8lL8BoAR38SpAmqR9TcNaY8p7NxfqN3Msq58b0fvBl76VMklLGZHxHsEo3ISCSd
         nm8a5yEe6pNnYbdUMsO493HVpAwKtvtdtacB9q9p70JotjmyM8tN6mYNMJBhLqYB3ira
         0tM1rhQPcCjt5o/Bq1e4j7h37A4f5JijfoVIPvU9NqwXXEbd2a1p5t064Qo0enlauVL+
         kaH/vR2OOy5XMfeJ2Kml3ZQXVDmnUWD0H3XQlZOFWNmpAfFfSz/DYEAK1nOACjDL5Vu1
         ss7uII+58U9zINZDCb8Xj1mcsmEAcB3exfUF5HtE5Y43nzeRwwcXNmeHfWV0byQGaRnG
         IUHw==
X-Forwarded-Encrypted: i=1; AHgh+RpCffz3zVPKihoxyFiwOm3oj2drkpnZnaRRTC+QVHEfUUuDU3dFvZn02GifFLFd1urE1/ujXsvoG/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDNcNMYzqOp95bO7YLE17OKKm1elF1MPWc0gQBeXabuTZukdZi
	e8YXDUFLiakdU93SlEFcbg5m5ktezSfmsT3cRRXKq/3JQOjHVC/eejI/mpEdV8WiQ+YI3fztewI
	5JaUD+JBAAthA0VgDMW9CRkQXvokE+ssgWHMZRMm/+vRkFMtW8LY5JGS7aGrW/sM=
X-Gm-Gg: AfdE7ckSwu7kYiIy5OapVSlvfr0aRboEp7VWqjeRld8x81u191s3iL1CnPK4cwpdrJ5
	b3j6II0lCrKNTdTTARubvr9LHk1q1clZg0VLjXhe+91vnBhL0cqXY4YYaQHKncyt01VrDgbv2Ak
	Kgj7mGs++7bpVss61UXj/mplLNyfxm0VgO2F8Ueti0FpFXJhJlEly27v6rpUx2vDmTX1SVtCRcu
	9akUDvIH757lW/QBWf8UFJAPtEAK7yzWlPsYDbaCO9Hl5TTgofJBtbpufxe35ZQWg5Q9O4sJfbK
	jhkevCZPNqIKZLZx3d0EzLhZAqxG6A+Xzaye3oy96RZpjnpynO4FRwkUQxphmvCCQdPW6rjdJfv
	b6GbNjOrIZNApNfBN754oUJvJGFnZS6A=
X-Received: by 2002:a17:90b:562f:b0:380:7688:fbe9 with SMTP id 98e67ed59e1d1-38e4b41fb4cmr7099385a91.8.1784379482690;
        Sat, 18 Jul 2026 05:58:02 -0700 (PDT)
X-Received: by 2002:a17:90b:562f:b0:380:7688:fbe9 with SMTP id 98e67ed59e1d1-38e4b41fb4cmr7099354a91.8.1784379482224;
        Sat, 18 Jul 2026 05:58:02 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm14238910c88.8.2026.07.18.05.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:58:01 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 18:26:23 +0530
Subject: [PATCH v6 16/16] arm64: dts: qcom: shikra: Add support for
 DISPCC/GPUCC nodes
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-shikra-dispcc-gpucc-v6-16-62703e05ef0f@oss.qualcomm.com>
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX+FpizTi5ZYvK
 vU2C2Q5VWzMuysgN5Uw12xX7Puw9rEJgKjUWNimzGqyVaMEUCXzFGFt9HBKTJvmYjH41Fy2ZTEO
 W3bW7KeshCIq3Uy/bwvLnQDRmO6apLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX1Lc2CbLqpYlK
 HlUHZyo4/PP2MHx1WRpsJ5xK/3XOndDNv/8AKhXc57qTH4MIeJJO6Vwx1pEq5jJQqI980Lx/PrA
 /0JGfkGamXIWGznrrW7IqDB8NlljLAUb8cbJkOijI5Q7mnfgvhWQK/69Sv0YfUpZTp0t0sUkf4P
 fkukQi/ljXeIdUjBw3/X3mbbd6qPkpL0+wtuu4SlhOiQuEwJxTX8JEcIk9j8UDetfKhJwq7Oz+M
 h/1W6hQsk2VFr3pB2Qg1MX4ZBAI9F5ZJojBVf1ebUdd2tPurZ6aRSc70x7bwRcwdu+T5KTuOc37
 MYf4tT1dUHZBzzXnytlnNkelhv+32jva0XijTJiSUhIqgdWwk1LoUC3qMnqUR3+NHU3ESGC6gm5
 G28Po7sGecPVYCPB5BcPQLzNUZQciCOj/J626BJaabeYGvagnRGTeWp0O9Gmxh4XV9zqVXLCHpX
 +0+6kCTwnBrkUq7eO/g==
X-Proofpoint-ORIG-GUID: aH3YCk1mnLKbPIYcNlyj9QLAk-Px0pzj
X-Proofpoint-GUID: aH3YCk1mnLKbPIYcNlyj9QLAk-Px0pzj
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a5b785b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=KUIDwAxYdJFQKfevFyUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180133

Add support for Display clock controller and GPU clock controller nodes
on Qualcomm Shikra SoCs.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8ed8914733ac9fdc9b69128b40216e..2a131ae601a7040142da16e39dbe2f8563ef43ee 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -3,6 +3,8 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
+#include <dt-bindings/clock/qcom,qcm2290-gpucc.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/clock/qcom,shikra-gcc.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
@@ -640,6 +642,40 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		gpucc: clock-controller@5990000 {
+			compatible = "qcom,shikra-gpucc";
+			reg = <0x0 0x05990000 0x0 0x9000>;
+			clocks = <&gcc GCC_GPU_CFG_AHB_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+			power-domains = <&rpmpd RPMPD_VDDCX>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		dispcc: clock-controller@5f00000 {
+			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
+			reg = <0x0 0x05f00000 0x0 0x20000>;
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
+				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
+				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
+				 <0>,
+				 <0>;
+			clock-names = "bi_tcxo",
+				      "bi_tcxo_ao",
+				      "gcc_disp_gpll0_clk_src",
+				      "gcc_disp_gpll0_div_clk_src",
+				      "dsi0_phy_pll_out_byteclk",
+				      "dsi0_phy_pll_out_dsiclk";
+			power-domains = <&rpmpd RPMPD_VDDCX>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		sram@c11e000 {
 			compatible = "qcom,shikra-imem", "mmio-sram";
 			reg = <0x0 0x0c11e000 0x0 0x1000>;

-- 
2.34.1

