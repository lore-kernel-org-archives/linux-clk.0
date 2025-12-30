Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D76532B98E
	for <linux-clk@vger.kernel.org>; Tue, 30 Dec 2025 17:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767116338; cv=none; b=C7wN0L6LWzxL2Oq7ZsmIoRgax2YGMMLP0UBjq4oOwtxtckWigPo+KcWGU7A4pmW6kVGV6ctTHTywwW3MuP3OC6iNB1m0Q1H6STD34imBMlWKWJSZI7WJCHCFwncnC1Mgo+xBSRvg2KCvMHohJiN3Qc82k5jWik21+EHc7SRXJoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767116338; c=relaxed/simple;
	bh=q5Cs9pMAdeX8ROnaUQwit23gUZZU92irF88/Bmc63Tc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=De1kgViGp/AhDPp4h/Uy59B5QigO3eONsy98PIjaFcaHdyS2nLJB1af7FkAD5vLQh07TXUSZl1g+3KhpTazcxmZeiZeFRNWJehQeEPZa1dIVIFwsB1/bT4k/ND9yAlPxZvNFAg4RAx8iJePj0kt5yrstsXgaLW7aV4B7w1E4i3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cqA0rhHH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kIkrmKNi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cqA0rhHH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kIkrmKNi"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUCtdPl715181
	for <linux-clk@vger.kernel.org>; Tue, 30 Dec 2025 17:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A+8oapdwj8Kirsaqr20TQ6RDvOnq/fvBRIB/9Md1HLc=; b=cqA0rhHH8BRuxJZn
	4qHiwgjfinXDTLrM9nTRE4mIt3ogrPDYqucHKsPNP00MMSzV8zHi0enTMdi6Kbxw
	m3EtYAmE5xi/2UeN1JRBazs6DI5zutvhbnOTifaC5oJgqmmouyT9io7hFjkc/zJ3
	7HPx4sepOxcxItakN9WS2t+RZWPM5Ayj3nU6pGxPYN1syVWnE2c4+OVwxXEX4rHT
	kqoN33HepfD/qsSXXAkajSnTF9BqFhLpQWlMA4awnx9YBwHTSsD0TPKs4BC+k+z1
	Qi3a+51R4+irkj3mnRWmsJa3nzRsNejSedKMNGtO4Yly6TggzlkOY/mAP+MnmNc0
	rGTZtQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcf5yrnf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 30 Dec 2025 17:38:55 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7d24bbb9278so19834485b3a.0
        for <linux-clk@vger.kernel.org>; Tue, 30 Dec 2025 09:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767116334; x=1767721134; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A+8oapdwj8Kirsaqr20TQ6RDvOnq/fvBRIB/9Md1HLc=;
        b=kIkrmKNi2uMND6NUZaThgKi2wp2891V6ECvD9PAkv4BEIIeivDkT45857qYRU4XvUt
         HcDDJDUfRAKi/n2sVNZa346CLEjWdys/l5GVqzDaVqwnOWnk9RiOAWxEw6dw3iBywjK4
         66WLWjvhCeFyD2nZERdqdjxTRQ2/JfHr8mADV8rmFEu3iBU88BW6DhU1mmVbOBn0ngKv
         ozUU/is1vtzHipxz/OnCf7Ro4ddtNhdwcTX3BSpo8YuY5v1+77RqzHoGkaKmZF6dyPbZ
         9dfta21HPkbFWM71aZrs/uU4BH4oYlNhTxTFnl7FL7diXUwLp8iRjMYZ7xRjYLdUBKkl
         2Rlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767116334; x=1767721134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A+8oapdwj8Kirsaqr20TQ6RDvOnq/fvBRIB/9Md1HLc=;
        b=sWrlgC3k9Ntti46uIuFdIYDB6Uj8bKUDTGu0cOIhbjTU5r9gTKlvgHMdBYIFOw2eVM
         QwG8YAG1kaQEraB4iGFVgMF/2Snc0/GF8jk88trPDgmXZjOBve7AVy5HdwBuqFP9AtnY
         SsqH3kDEMMvtvcNB3O8wadBxaCuUFRV8QRx+is3PjaCy+cencYC/jWeRNg2fGoHVNo3j
         WmdqmTiniSvTK7aiJml1cKhFDr1dI5y58P2u0aYEg5D0oBWUmMJfEd0QILf3+T5iVmS3
         fP7sIY6Tnz+qp09iwVAmcjPfyMpmzhB4XEJYMSwy4i09Lr+mDE2WBcjdyhwfcr0hy5RV
         zG0g==
X-Forwarded-Encrypted: i=1; AJvYcCVbWqvC6oLE+MkTfM/itx35FgtunINT2b8S0zdXX5miPDrZoZwMekHw+TCfZIxNniasuQG35IIQFSc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB5OsuTDgu7ebv5E4V1h9ywYI5ssMTXEF2yuVFVQKMqJXLz3to
	8/JzFGxZjFP+wicajAttH+sPzPhf5eQem9OF/t8cLBl69XYpa7nNquBZg7j4YeYdBb1+OB7Wjvt
	IBLcbzmIq+18RNj9ZXOJ5sQbk3CX5a/IL8KFzIFPZD5RMCyLz2ovWGFSJRrsaq7E=
X-Gm-Gg: AY/fxX6Hv3w9GN1IJjqL3Jlz8RlPvsO9NiaDcPShPQ2jwuNbdGrrfp09hTD7ppHvtek
	2hLOzVBbycw8HTUy2bOk9RJkflfR1gOxFh3IPTKLPnkCHIrrcHD0pO+NTRVzEiFtiZxMfpz+WHx
	r/M9LAz751EbweZ6qqOdojzoOUD6vPSeXxeKi0VGzaa8tc6FIDj2LjMva2vJbt4ADkfrAyIQTZw
	cVboO7twEUl2oVL0qTiTG74ypf6sUy3VX0+5WRIRLF5ekUllbr3jgJasPXXtgShvsJSfW4VTbTm
	1g2Wj7c/g45VOueTD9gCjLUKXgsqiNxo9B4ybJi9x/02pKtxDUcqpxFodace9NVbnuf8cONL7lL
	0jyMbq3kVKY8T+sqOjLApsUMa9BrOu+l/Fg==
X-Received: by 2002:a05:6a00:4105:b0:7b2:2d85:ae74 with SMTP id d2e1a72fcca58-7ff65d7e724mr30564499b3a.29.1767116333942;
        Tue, 30 Dec 2025 09:38:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJ48hkLumTZo1qmOgJTcbRN51YorB0Ubsww+zTBgea2mb5I+SE1k3buqmASho6QQmQRfIagQ==
X-Received: by 2002:a05:6a00:4105:b0:7b2:2d85:ae74 with SMTP id d2e1a72fcca58-7ff65d7e724mr30564465b3a.29.1767116333428;
        Tue, 30 Dec 2025 09:38:53 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7af35f37sm32865208b3a.18.2025.12.30.09.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 09:38:52 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 23:08:35 +0530
Subject: [PATCH 2/3] clk: qcom: gcc-x1e80100: Add missing UFS symbol mux
 clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-ufs_symbol_clk-v1-2-47d46b24c087@oss.qualcomm.com>
References: <20251230-ufs_symbol_clk-v1-0-47d46b24c087@oss.qualcomm.com>
In-Reply-To: <20251230-ufs_symbol_clk-v1-0-47d46b24c087@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDE1OCBTYWx0ZWRfX4xdWG4INlIjb
 ToaD2fFCnb5dDqnlXnzlvYqLKjLeeuIyLvDUrp8cPviUEoCtEQOyyQUViiVKdLVHk4rBoUaHrnZ
 zjFA1k5XV6x2HZY6m4M7PpUdVGmw/jSXFOMxJ3D2XZjGeJrbpDPdZGw5uyPMdNB9akJJIgSKJPd
 Yvxq5LReIBvc0wOeJ8mjHZoNuYonsJEFcCe80r8y7JYZtGa417/SZQwBBPImCcYyQV0RVFoPXNT
 0mSNXVL6kS7e1T3riOPLSOT2+o49Ai5JMTmwgGKZLAlAvJe6AK8SMgUnxTlCSZHJgKLQjIhR5H4
 jtmQe0Xs8QZBa7GjTVJz0L8trG2+zFf4VdYCodykLEVAA2eYUVhRdvtFaB+1RDxtVcJ8M5OC6ND
 JEv4ItWdRZSahnE0jX4h+eiDzZIz+Cv2mU0YLRn5qUvsSnjiSri8+VFC7GWMgE0/5jGJZlar9dk
 8+vZo3lqvndgOAwRcWg==
X-Proofpoint-ORIG-GUID: cljDmMPCXo4K_fIT5Sroi36iRIW3308Y
X-Authority-Analysis: v=2.4 cv=KvNAGGWN c=1 sm=1 tr=0 ts=69540e2f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=zK1IZneI0yAGVV4HvJ0A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: cljDmMPCXo4K_fIT5Sroi36iRIW3308Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_02,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300158

The UFS symbol RX/TX mux clocks were not defined previously.
Add these mux clocks so that clock rate propagation reaches
the muxes correctly.

Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-x1e80100.c | 102 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 99 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
index e46e65e631513e315de2f663f3dab73e1eb70604..c8fc9e6b1ac97b13f84753ac7f76e23df071c2e0 100644
--- a/drivers/clk/qcom/gcc-x1e80100.c
+++ b/drivers/clk/qcom/gcc-x1e80100.c
@@ -59,6 +59,9 @@ enum {
 	DT_USB4_1_PHY_GCC_USB4RTR_MAX_PIPE_CLK,
 	DT_USB4_2_PHY_GCC_USB4_PCIE_PIPE_CLK,
 	DT_USB4_2_PHY_GCC_USB4RTR_MAX_PIPE_CLK,
+	DT_UFS_PHY_RX_SYMBOL_0_CLK,
+	DT_UFS_PHY_RX_SYMBOL_1_CLK,
+	DT_UFS_PHY_TX_SYMBOL_0_CLK,
 };
 
 enum {
@@ -103,6 +106,9 @@ enum {
 	P_USB4_1_PHY_GCC_USB4RTR_MAX_PIPE_CLK,
 	P_USB4_2_PHY_GCC_USB4_PCIE_PIPE_CLK,
 	P_USB4_2_PHY_GCC_USB4RTR_MAX_PIPE_CLK,
+	P_UFS_PHY_RX_SYMBOL_0_CLK,
+	P_UFS_PHY_RX_SYMBOL_1_CLK,
+	P_UFS_PHY_TX_SYMBOL_0_CLK,
 };
 
 static struct clk_alpha_pll gcc_gpll0 = {
@@ -482,6 +488,78 @@ static const struct clk_parent_data gcc_parent_data_33[] = {
 	{ .index = DT_USB4_2_PHY_GCC_USB4_PCIE_PIPE_CLK },
 };
 
+static const struct parent_map gcc_parent_map_37[] = {
+	{ P_UFS_PHY_RX_SYMBOL_0_CLK, 0 },
+	{ P_BI_TCXO, 2 },
+};
+
+static const struct clk_parent_data gcc_parent_data_37[] = {
+	{ .index = DT_UFS_PHY_RX_SYMBOL_0_CLK },
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct parent_map gcc_parent_map_38[] = {
+	{ P_UFS_PHY_RX_SYMBOL_1_CLK, 0 },
+	{ P_BI_TCXO, 2 },
+};
+
+static const struct clk_parent_data gcc_parent_data_38[] = {
+	{ .index = DT_UFS_PHY_RX_SYMBOL_1_CLK },
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct parent_map gcc_parent_map_39[] = {
+	{ P_UFS_PHY_TX_SYMBOL_0_CLK, 0 },
+	{ P_BI_TCXO, 2 },
+};
+
+static const struct clk_parent_data gcc_parent_data_39[] = {
+	{ .index = DT_UFS_PHY_TX_SYMBOL_0_CLK },
+	{ .index = DT_BI_TCXO },
+};
+
+static struct clk_regmap_phy_mux gcc_ufs_phy_rx_symbol_0_clk_src = {
+	.reg = 0x77064,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_ufs_phy_rx_symbol_0_clk_src",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_UFS_PHY_RX_SYMBOL_0_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_ufs_phy_rx_symbol_1_clk_src = {
+	.reg = 0x770e0,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_ufs_phy_rx_symbol_1_clk_src",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_UFS_PHY_RX_SYMBOL_1_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_ufs_phy_tx_symbol_0_clk_src = {
+	.reg = 0x77054,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_ufs_phy_tx_symbol_0_clk_src",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_UFS_PHY_TX_SYMBOL_0_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
 static struct clk_regmap_phy_mux gcc_usb4_0_phy_dp0_clk_src = {
 	.reg = 0x9f06c,
 	.clkr = {
@@ -5148,12 +5226,17 @@ static struct clk_branch gcc_ufs_phy_phy_aux_clk = {
 
 static struct clk_branch gcc_ufs_phy_rx_symbol_0_clk = {
 	.halt_reg = 0x7702c,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
 		.enable_reg = 0x7702c,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_ufs_phy_rx_symbol_0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_ufs_phy_rx_symbol_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -5161,12 +5244,17 @@ static struct clk_branch gcc_ufs_phy_rx_symbol_0_clk = {
 
 static struct clk_branch gcc_ufs_phy_rx_symbol_1_clk = {
 	.halt_reg = 0x770cc,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
 		.enable_reg = 0x770cc,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_ufs_phy_rx_symbol_1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_ufs_phy_rx_symbol_1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -5174,12 +5262,17 @@ static struct clk_branch gcc_ufs_phy_rx_symbol_1_clk = {
 
 static struct clk_branch gcc_ufs_phy_tx_symbol_0_clk = {
 	.halt_reg = 0x77028,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
 		.enable_reg = 0x77028,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_ufs_phy_tx_symbol_0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_ufs_phy_tx_symbol_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -7180,6 +7273,9 @@ static struct clk_regmap *gcc_x1e80100_clocks[] = {
 	[GCC_USB4_2_TMU_CLK_SRC] = &gcc_usb4_2_tmu_clk_src.clkr,
 	[GCC_VIDEO_AXI0_CLK] = &gcc_video_axi0_clk.clkr,
 	[GCC_VIDEO_AXI1_CLK] = &gcc_video_axi1_clk.clkr,
+	[GCC_UFS_PHY_RX_SYMBOL_0_CLK_SRC] = &gcc_ufs_phy_rx_symbol_0_clk_src.clkr,
+	[GCC_UFS_PHY_RX_SYMBOL_1_CLK_SRC] = &gcc_ufs_phy_rx_symbol_1_clk_src.clkr,
+	[GCC_UFS_PHY_TX_SYMBOL_0_CLK_SRC] = &gcc_ufs_phy_tx_symbol_0_clk_src.clkr,
 };
 
 static struct gdsc *gcc_x1e80100_gdscs[] = {

-- 
2.34.1

