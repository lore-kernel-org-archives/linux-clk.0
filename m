Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887F236CDEA
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 19:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769542026; cv=none; b=Uar5fRgrz99UxbOvbJYETZdvlkdzfwI/K+wOPHCMYnkD9MXYn5LyB7FT4hRKT/aOqqDGnRUjex5AHmqlEOcH9CsPwgU6U2jxZ7AybDcb1bS26rV6D6wA636UIwK7lEX1fml9UbvHQf5oK8o7MEepK3vnYSp+94455G6nxB9d83I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769542026; c=relaxed/simple;
	bh=PA99VsBvx5SIs0szb1JLsFFEYSaP5u8l9YkIWjVzo1g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TpUvvR0ioMDjrmg8IK5V3C+3rOdnx7m/ceXTKxwXEXBoZpAZa7mVuI4DNKX9v0OVSQAgtMbgxajZMiozi0/bgdrVl6Lw3KskMBYOkzi6kXW/5OKBxHltXjcyLJ8vEyxwrizPOEShsl2eXM8mq9RCykMmon8losVCYrJjJWGNHr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cz+nzRrH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MUSFcK1B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cz+nzRrH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MUSFcK1B"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RHheGX2477317
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 19:27:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u478abj+sjd2lC/OaHT9eDhnZeVzUtBngbIXopIxjcw=; b=cz+nzRrHWXi/tpcT
	QBdeiVqo8f//p7M/X5XT8G+CI3uDE1/SCSvefl9QeUeMsdsvjCJZ8jLin6/qHD/0
	GbFZQtNeCrdzkua/lFv6jTXEd5QRI/+vKKvi6EskIEgRBb1jG32nYmP5/OttQRpV
	XbxBQZMJJWnELsQP2NfIo/+Ae6YWqyJqS+60Q+fSjWczCwQiy5sk6aPtJemrgTDp
	4F9vwSPZEUsX3tzotiaIQQKvZxaOGjE4bh0GIGNXyjO0S1tgYCDZxo9Z3ensMHkY
	uFEJMJ8pEReZ8SiCsdwRjeD8GAJK3oWkqQsRifBh0lM2s0eSPC+Dk7rciFWYKcLy
	QKBsrg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by20y0but-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 19:27:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a13cd9a784so56438505ad.2
        for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 11:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769542024; x=1770146824; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u478abj+sjd2lC/OaHT9eDhnZeVzUtBngbIXopIxjcw=;
        b=MUSFcK1Be3OWOLSTo4r71Qd65jmcYbhMz5MeZWpP/K79i/DvDG+psZBkI9iKirRfUd
         dcUFSjrXoRrvpEozdt0Qy4fXy/NEcsFtz2A3SVB0gRiAZK26Q5LdAMqZJQ5JK8Gke8fI
         1bPofCnwiVZP/xJW/mgYAuHRwfzp6bRUXYFM07EbubfP3II1y+dUccxPceYN92Sh7cNu
         5DTzF98pIQUjxIoZivV2iehbqqxLhOfkElYSe0Mz3x5/hYewbuzqrl2rfwDC5V3fTAIp
         Jlf+HFPE1oQoLDEEcmaANUVaamI341mU1czUj+S+4P0kjZ2V4tNntq9N9IFoOns9TIQk
         +R0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769542024; x=1770146824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u478abj+sjd2lC/OaHT9eDhnZeVzUtBngbIXopIxjcw=;
        b=UsDZnnLWK8e0MEvIJ+8XjGlow7O1BlFjEP994gcxJfhUumvzK8ZyG+zbguGWggWDnh
         x0CmY2w1zZDNulpL/+YEtvgD0BGmIgLEP0ePTM/3eKJgsw6VEoFOgdbuOcO2rbxKc+vi
         U+3vhoSD22oGUNDYyVFizI9Fga8vMP6qemOsW0ZZc5FxKhf+JjASUmlft4yZpjLSkZL8
         kEnUbcTY3EIHTOmbxMz1LQRHKPEz5uj4GV50VQLcjP2mXIrdREkAHW6LJ/mgOSVQhxO/
         tG0/VdvpaoyPiOE2JSBVGdp637nkjb/J19Mx9AtkfOXG6kbOqDv7QGcoYM2IvTochU4r
         HESw==
X-Forwarded-Encrypted: i=1; AJvYcCUbZut9AAV/vmEMqNEQuIMS+i2P0c3mQFYenR7rJ7eU+xqk8E7Mk0HRYeOHtzKymX9cNVX7L2zr3Cs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY5ldqmnNTlgoteP1pnhcdRjNJ37Eq5vTFrUAQj0x7WLj5dZxr
	4UKRLhQAOdx32kWgXwXMi/YnDaB+TzwQ47jeDSduxA5FDYHkrXACD1aKc22b6uvgPXyAE6V0o9U
	3cK9YdJzgkYSGJkVYlCiCvu6AmdusJ1y5YxgrdFg2YLbLRF+kfVc0CuQKU7fnXH8=
X-Gm-Gg: AZuq6aILY/dcvli+RVyxVPuJ7mSNbx1JRQ4LDAWHnOELf4gPvJPUlYMfDTm2nn1uBcF
	OgT3Sst95AvztTGJuSLXCIlVQijikpSwRRd6XLT+PO+5nKj2YQIGtUBY+BL8hfI6x5+yNiIXbZ9
	8h8BTM0ein94QWm3qcV9PZKF+Y5BJ3aHDe1Z5t1UyknTqKwUAB1dMA2GsXOa4b5OiEA2RoBuSIQ
	AtsfGloG9EUlEBdzkHWErUbQlWjnfzfBefFyQrlbG1dv4nAXaFfLdk3Kp1jcraj+pTMsI+ONVaY
	vqVBXCBCLmaBRdObu8MwAvsQVdr2myYRCBSWJEJ7CCSY1Cm9rq5DbuD1uWtuQtBZrRJB228W0K/
	F6fy7q7YY7Z3734TGLoENFn4Jhd8Hf3r3XSMPsxkO
X-Received: by 2002:a17:903:19eb:b0:2a7:8486:fe65 with SMTP id d9443c01a7336-2a870d72aa3mr24926245ad.22.1769542024120;
        Tue, 27 Jan 2026 11:27:04 -0800 (PST)
X-Received: by 2002:a17:903:19eb:b0:2a7:8486:fe65 with SMTP id d9443c01a7336-2a870d72aa3mr24925885ad.22.1769542023638;
        Tue, 27 Jan 2026 11:27:03 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b414fc4sm1322225ad.32.2026.01.27.11.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 11:27:03 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 00:56:35 +0530
Subject: [PATCH 4/8] clk: qcom: camcc-x1e80100: Add support for camera QDSS
 debug clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-purwa-videocc-camcc-v1-4-b23de57df5ba@oss.qualcomm.com>
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
In-Reply-To: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: QKqG6AAK0pIkzKxSdVxx20sZaT2fEmRs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE1OCBTYWx0ZWRfXzlB5/kPkt/OH
 gGaI5A7e9n1joZTosud2ZKA5J392AUvNYjrRqpLixMGxQ93G+NmtDkYrimC+BQW2vql6KAinisZ
 sild7vLXtLPPhWccVJeN5vVOJSwzWX6pUxtB3wk/m7oCAhuBN7qIzRHAn0Ns+UldHDfggy0+E45
 Gi7/FJ3Jih89jph3nJjmybbvP+vNCwx+EIX73YF/2jvl9CSRhlthznSoQFMhwNmPtXMMfjqO8Ro
 L/Bt/aTmYF5hFglJHo8GuGZUAOpH6YU6gHdbAOYz4Tyl9ljh7VssWQ/n+6P2Z/Zud98iaskJxWA
 n7ke7GeMcI7536//tgmocRUFL6+SaAU2Zjdn11lRlWS27yuuah5XGq+9pCHxk3MKRwL/WwErjHB
 SQyGV0eSHbVuo8hp5jmhnut4xtm6lBr2HGn/8DLTB/6V8GUQ7ZyanEB8S1o849RRb3WUdlZwQqt
 PHrSnumrVUBX6Bxa/vg==
X-Proofpoint-GUID: QKqG6AAK0pIkzKxSdVxx20sZaT2fEmRs
X-Authority-Analysis: v=2.4 cv=IKgPywvG c=1 sm=1 tr=0 ts=69791188 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=F2hG9-dZ5E7o3FMX4mIA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1011 suspectscore=0 impostorscore=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270158

Add support for camera QDSS debug clocks on X1E80100 platform.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-x1e80100.c | 64 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/clk/qcom/camcc-x1e80100.c b/drivers/clk/qcom/camcc-x1e80100.c
index cbcc1c9fcb341e51272f5595f574f9cb7ef2b52e..7e3fc7aee854eee841176a1330f97dc91af91670 100644
--- a/drivers/clk/qcom/camcc-x1e80100.c
+++ b/drivers/clk/qcom/camcc-x1e80100.c
@@ -1052,6 +1052,31 @@ static struct clk_rcg2 cam_cc_mclk7_clk_src = {
 	},
 };
 
+static const struct freq_tbl ftbl_cam_cc_qdss_debug_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(60000000, P_CAM_CC_PLL8_OUT_EVEN, 8, 0, 0),
+	F(75000000, P_CAM_CC_PLL0_OUT_EVEN, 8, 0, 0),
+	F(150000000, P_CAM_CC_PLL0_OUT_EVEN, 4, 0, 0),
+	F(300000000, P_CAM_CC_PLL0_OUT_MAIN, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_qdss_debug_clk_src = {
+	.cmd_rcgr = 0x13938,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_qdss_debug_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_qdss_debug_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
 static const struct freq_tbl ftbl_cam_cc_sfe_0_clk_src[] = {
 	F(345600000, P_CAM_CC_PLL6_OUT_EVEN, 1, 0, 0),
 	F(432000000, P_CAM_CC_PLL6_OUT_EVEN, 1, 0, 0),
@@ -2182,6 +2207,42 @@ static struct clk_branch cam_cc_mclk7_clk = {
 	},
 };
 
+static struct clk_branch cam_cc_qdss_debug_clk = {
+	.halt_reg = 0x13a64,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x13a64,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_qdss_debug_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_qdss_debug_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_qdss_debug_xo_clk = {
+	.halt_reg = 0x13a68,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x13a68,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_qdss_debug_xo_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch cam_cc_sfe_0_clk = {
 	.halt_reg = 0x133c0,
 	.halt_check = BRANCH_HALT,
@@ -2398,6 +2459,9 @@ static struct clk_regmap *cam_cc_x1e80100_clocks[] = {
 	[CAM_CC_PLL6_OUT_EVEN] = &cam_cc_pll6_out_even.clkr,
 	[CAM_CC_PLL8] = &cam_cc_pll8.clkr,
 	[CAM_CC_PLL8_OUT_EVEN] = &cam_cc_pll8_out_even.clkr,
+	[CAM_CC_QDSS_DEBUG_CLK] = &cam_cc_qdss_debug_clk.clkr,
+	[CAM_CC_QDSS_DEBUG_CLK_SRC] = &cam_cc_qdss_debug_clk_src.clkr,
+	[CAM_CC_QDSS_DEBUG_XO_CLK] = &cam_cc_qdss_debug_xo_clk.clkr,
 	[CAM_CC_SFE_0_CLK] = &cam_cc_sfe_0_clk.clkr,
 	[CAM_CC_SFE_0_CLK_SRC] = &cam_cc_sfe_0_clk_src.clkr,
 	[CAM_CC_SFE_0_FAST_AHB_CLK] = &cam_cc_sfe_0_fast_ahb_clk.clkr,

-- 
2.34.1

