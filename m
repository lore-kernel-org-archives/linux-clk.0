Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014226;
	b=dYi9ED5ojQKdfy2Ov3fh6OqWN508Qra5/ZKUI1uVC94BuiIZjY8owIN5d8T7ysT/OdyF
	 UiAOL3qTPx713IV/nBK/JTR5m/HgaKWUbXmJdVaURjYXZeZklW7dno68XpYu48B6YGhDp
	 Ibtq7HT40DQmzjXHTeQiKpSY9ILc2G2O2FRLHbybPY1LVDbzBJCNUNO6/AjKzNI6p5V2o
	 vctCy+N49EhuzPJZe79JB6UWkS4XlQbOKtSo4qHl1+aDZtAzu/MXEMG6e6ARUthZGG5Sv
	 yV+Bf9qu6S+k/0YDhw706NdXx6Prx62uP4AVCgXHQ/3whSY4V5DSeUFron070z0ke3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014226;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aeF/SIMKp1AhqcMN428zlJG3WBlYI6x0ZLS3Cwh8XwU=;
	b=BNA7m7hXVCqNM07WyhlkpH1WXTyjN2caVveEVAyZ2zHY0/uiT1togP951CfXfwE3DxKp
	 EJzcWay49goJaPZKk8v4YL5MTt2TQ9oyMRXqPAaSmiSFlcCCCJoPtCxtjQsY5aCQvu2jK
	 xEmvXJEOJ5fSv5h7vfW6F5txXs6KsI6iOAtPpL6TLHC8jgoQxUgAP5gwKvvzELv/uiKZy
	 cZjObIGT/nuwubcJZHk1LlHMf4lzQNZJJ+K0C1jvFJKTKIcngU40wohCvQ6dd5ffnRE8v
	 Q0cXSvu9sw4UYVqXL4q9rm9BrIwlIfGzkS7Cum6+FYeZbTufkp85du/bdTI+myEziDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S4qG6BFZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DegWBcjt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1A1606A32E
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 11:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF1A1606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S4qG6BFZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DegWBcjt
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt6Kx4126385
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 11:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aeF/SIMKp1AhqcMN428zlJG3WBlYI6x0ZLS3Cwh8XwU=; b=S4qG6BFZIZ7R887c
	q08zSadn5YqdRl465l1JEkvMZtIQ4Iur6HbCjN/4lXxcggrGkZvAHSKe+mVZpeix
	/fM7kh8y/aw0dVx2b/TjjPbZZmJNg/3vK4Qw/hIk/IccKY325p2fQFeH/wE7mL/j
	Q31qOcW7rqFOO90kZLb/+DruiVRO5JjblKC4q+ZMhF4lyDh0c69Mj5mLEmXmMtsL
	1eAoORa4Z/eZgIEBK4agkqqlcUqFfpgaviNBcCjXR1HfuzaSFJe6bk3zNIF6m2l1
	XJblOSKdSc/w0jlfsQGgyaP/FL79/bTpUAOKMvYa19KdpXA/W3nNhqzYWWVltzZn
	gMZZlg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhshpt5uk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 11:30:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3aaf955db5fso4776198a91.0
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 04:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014219; x=1793619019; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aeF/SIMKp1AhqcMN428zlJG3WBlYI6x0ZLS3Cwh8XwU=;
        b=DegWBcjtZ8j6fkJwwCLAtxSOj4T7e8osLJz5cVn4inUgG5b9Bfq0EFoTq7TIqrhtmA
         gGWN2reQ+NDWqIuSR+eyN0m3btVXYYJa22RazVEOSj/qSq4ciWxvzE8KfyinGkotrmdE
         IQjgpzYb0hGwrWOiqq9XGNeuaPOQlaX43VW2yO8/wk02blQf/AB8KZ9/3CKCamwFo6+2
         od1/KXIfITib7jGXrFeF4K/5Rd2sMOyneCd7O5swB4BOpXmwEulNf6xfOLwn+I53C1jI
         no/yqREZwLBnV8A2EeXgDuU9Nde7UtBu2oIKVQXT5cRWZt8HI2tqDPe9Vf9OPE1j4Z8e
         2WQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014219; x=1793619019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aeF/SIMKp1AhqcMN428zlJG3WBlYI6x0ZLS3Cwh8XwU=;
        b=v6xe/s2tR8OB2l8Oe3pvAndP/Z3zDJ5+H0krAtXt55jv6Edrp2WHFMKCAJ6U7jP/Pg
         zV+0g9nrS/4FLeOI+OjIyXTdP8hBukB0PRXEfXQn6ykfDWvSRwMkoxqxzNZKnz1LnYtE
         Lm9hZA0OiBuon4P/FnU5/y+F5o+RHUHNJTh+vlKVCAVnWSpygmuN8za5X6mARJqj0ruK
         XI28l/yQnGTfM4DvBaxjg6cw1V1B8xEa0lMzZrG0b7gCPsiDEtvcn0NK68wlAv52fc2Q
         L/mEx8zTsenIN7Xs+PHxiNs23qPpxHDN93/vXjkMwsI1q9woQihpuMRVmSFJXZ7nVbKE
         DpQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwrm58/x2tBCVnrDiCdMSOuhjvW9eLwb+I4P7BecY3RcgiKywnINpFi2XolUC7b5NBNXh/69ZJFq2o=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+gXq1br/Mz0HT5sz6Jj0ShISq5s1ViiUviE6CxyjWp6OR6Mmc
	Rb3CDubPiYu84hTDEYf0z8HSOPc/TjyluUGowrpSYY9lVERyav0oseAMoDm4nvDK9epzrSvpKu7
	42i6zVZ2U7Vc7TUfY0Z8V4+MWM+vaBe19Jwrl82p5Tw/T6oBv+xXak/6S2zDEapI=
X-Gm-Gg: AYBFou3XlZ33imwzaV8fj/c9KimbHz4W6PADYc4en087R90YJlLkh6uxG/WB8W7d88s
	JkZKZtb8vllvtNBzHspRA9/102/Q3ZAT5pb2YdfPTPFzTFFZyGG+CBSmObdVBdDSkBc5yVnFLOX
	hZ6w9EY2dk/UpAgzVAh3xwndGE5M7A0/8pjKraffQoOfzTxg1VWde1ZDFGbj/o5kLrkHHq+lr26
	PFXIiwaAXbfryO7a6o9dd9Ara6Pa7oern0KXYLaDm1Urx0nbZ5BhL92mW5sV/vjmYNiT8xWBMz3
	QG3fryn2Pi5ryKYLPOlZ3ICpvmWtQsQe9ZEUaEqt00FHEJRlam4kErdXw2pbtGjbhJNTddtlWfH
	bvqkclvpM/sRpmcpPkTA0l18=
X-Received: by 2002:a17:90b:5101:b0:3ac:9669:846b with SMTP id 98e67ed59e1d1-3adea0a4d0bmr5308508a91.9.1793014219195;
        Mon, 26 Oct 2026 04:30:19 -0700 (PDT)
X-Received: by 2002:a17:90b:5101:b0:3ac:9669:846b with SMTP id 98e67ed59e1d1-3adea0a4d0bmr5308404a91.9.1793014217632;
        Mon, 26 Oct 2026 04:30:17 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:30:14 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:30 +0530
Subject: [PATCH v2 04/12] clk: qcom: gcc: Add configurable PDM XO4 div
 clocks across targets
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
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-4-ff8e4bc8d567@oss.qualcomm.com>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX4V004LGr7w3V
 hxkJDF/5p283jeC/GlJ9h08OF9WPwlSAHHr82jN7Y9jhQe9/RhLLN67admORSFzICxdEuYsq/3v
 JXK5UriJ+eBWWhTyZSi4uUF9KRADcwQ=
X-Proofpoint-GUID: NukdKDEg8L4-2wPt-gqPrCu-CkisOu7y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX1w5bVp2dWyxO
 1vnmC4DzP9MFnOHqGZog2KTXtGTNzHWszitlmaKmy9mwOHF+F/dDhpswnQUcJjFTfhnRe2f3nyO
 udA4WL+8Bknu9OgoZRUa+Qq9wmwmCpBvwBv1leiOeQg7GYCXPaAKbtHFArJyUHhRVINH+38tY5V
 gtC2qeGahUR4s4hGTjC07kGLTC9bl2Vw3AjVqiPul42/5ThLiqCaDfJy3nJMgA0zBWFvWxgzGpY
 iHvDKwKnJrTBDDBPZ1SDH9aydcRW0TECJae5C7w0AOYtc737Ssf1pgN0Esl3J/BcH4AIujinw28
 XoPxnc7lw3JJDwvjhTI8X5JGh2rb2CZaRAd9qkRyDU+xgyteDYbpEAcFIoufW++aa+1/2+zbiPJ
 gIXPuwa6iuLLUjwTJMeAiNkaVtRtZoQj5ZIuPSX7L3vQU7KrnVY2dLbxvrrPcMZwxNrhBR9XYig
 d7drfJ0ZemyymwLNhYA==
X-Authority-Analysis: v=2.4 cv=HZWB3SE8 c=1 sm=1 tr=0 ts=6adf39cc cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=l3K8MKQ1fDOuS62S88UA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: NukdKDEg8L4-2wPt-gqPrCu-CkisOu7y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260045

Add PDM XO4 divider clocks and make the PDM XO4 branches propagate rate
requests to them on QCS615, QCS8300, SA8775P, and SC7280. This lets
GP_MND select the supported PDM source clock rates.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcs615.c  | 20 ++++++++++++++++++++
 drivers/clk/qcom/gcc-qcs8300.c | 20 ++++++++++++++++++++
 drivers/clk/qcom/gcc-sa8775p.c | 20 ++++++++++++++++++++
 drivers/clk/qcom/gcc-sc7280.c  | 20 ++++++++++++++++++++
 4 files changed, 80 insertions(+)

diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
index e096af7d82bf558bedf524eb2ca959f3e9e5c22e..9b558ea023ad62e6d465155e21c54376d7b99732 100644
--- a/drivers/clk/qcom/gcc-qcs615.c
+++ b/drivers/clk/qcom/gcc-qcs615.c
@@ -1654,6 +1654,20 @@ static struct clk_branch gcc_pdm_ahb_clk = {
 	},
 };
 
+static struct clk_regmap_div gcc_pdm_xo4_div_clk_src = {
+	.reg = 0x33028,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pdm_xo4_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.index = DT_BI_TCXO,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
 static struct clk_branch gcc_pdm_xo4_clk = {
 	.halt_reg = 0x33008,
 	.halt_check = BRANCH_HALT,
@@ -1662,6 +1676,11 @@ static struct clk_branch gcc_pdm_xo4_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_pdm_xo4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pdm_xo4_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2802,6 +2821,7 @@ static struct clk_regmap *gcc_qcs615_clocks[] = {
 	[GCC_PDM2_CLK_SRC] = &gcc_pdm2_clk_src.clkr,
 	[GCC_PDM_AHB_CLK] = &gcc_pdm_ahb_clk.clkr,
 	[GCC_PDM_XO4_CLK] = &gcc_pdm_xo4_clk.clkr,
+	[GCC_PDM_XO4_DIV_CLK_SRC] = &gcc_pdm_xo4_div_clk_src.clkr,
 	[GCC_PRNG_AHB_CLK] = &gcc_prng_ahb_clk.clkr,
 	[GCC_QMIP_CAMERA_NRT_AHB_CLK] = &gcc_qmip_camera_nrt_ahb_clk.clkr,
 	[GCC_QMIP_DISP_AHB_CLK] = &gcc_qmip_disp_ahb_clk.clkr,
diff --git a/drivers/clk/qcom/gcc-qcs8300.c b/drivers/clk/qcom/gcc-qcs8300.c
index 916617a001c854c1a0349c1793a427a2822acfab..4a152e95aa997bdcc7ec56a6ae96c61b3575cd88 100644
--- a/drivers/clk/qcom/gcc-qcs8300.c
+++ b/drivers/clk/qcom/gcc-qcs8300.c
@@ -2280,6 +2280,20 @@ static struct clk_branch gcc_pdm_ahb_clk = {
 	},
 };
 
+static struct clk_regmap_div gcc_pdm_xo4_div_clk_src = {
+	.reg = 0x3f028,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pdm_xo4_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.index = DT_BI_TCXO,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
 static struct clk_branch gcc_pdm_xo4_clk = {
 	.halt_reg = 0x3f008,
 	.halt_check = BRANCH_HALT,
@@ -2288,6 +2302,11 @@ static struct clk_branch gcc_pdm_xo4_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_pdm_xo4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pdm_xo4_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -3501,6 +3520,7 @@ static struct clk_regmap *gcc_qcs8300_clocks[] = {
 	[GCC_PDM2_CLK_SRC] = &gcc_pdm2_clk_src.clkr,
 	[GCC_PDM_AHB_CLK] = &gcc_pdm_ahb_clk.clkr,
 	[GCC_PDM_XO4_CLK] = &gcc_pdm_xo4_clk.clkr,
+	[GCC_PDM_XO4_DIV_CLK_SRC] = &gcc_pdm_xo4_div_clk_src.clkr,
 	[GCC_QMIP_CAMERA_NRT_AHB_CLK] = &gcc_qmip_camera_nrt_ahb_clk.clkr,
 	[GCC_QMIP_CAMERA_RT_AHB_CLK] = &gcc_qmip_camera_rt_ahb_clk.clkr,
 	[GCC_QMIP_DISP_AHB_CLK] = &gcc_qmip_disp_ahb_clk.clkr,
diff --git a/drivers/clk/qcom/gcc-sa8775p.c b/drivers/clk/qcom/gcc-sa8775p.c
index 0e02af686614162dd7d5d9ab9f3a20c390ed0512..5ed3ec74b210807813f97120a4a19773f3f67d0d 100644
--- a/drivers/clk/qcom/gcc-sa8775p.c
+++ b/drivers/clk/qcom/gcc-sa8775p.c
@@ -2712,6 +2712,20 @@ static struct clk_branch gcc_pdm_ahb_clk = {
 	},
 };
 
+static struct clk_regmap_div gcc_pdm_xo4_div_clk_src = {
+	.reg = 0x3f028,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pdm_xo4_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.index = DT_BI_TCXO,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
 static struct clk_branch gcc_pdm_xo4_clk = {
 	.halt_reg = 0x3f008,
 	.halt_check = BRANCH_HALT,
@@ -2720,6 +2734,11 @@ static struct clk_branch gcc_pdm_xo4_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data){
 			.name = "gcc_pdm_xo4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pdm_xo4_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -4406,6 +4425,7 @@ static struct clk_regmap *gcc_sa8775p_clocks[] = {
 	[GCC_PDM2_CLK_SRC] = &gcc_pdm2_clk_src.clkr,
 	[GCC_PDM_AHB_CLK] = &gcc_pdm_ahb_clk.clkr,
 	[GCC_PDM_XO4_CLK] = &gcc_pdm_xo4_clk.clkr,
+	[GCC_PDM_XO4_DIV_CLK_SRC] = &gcc_pdm_xo4_div_clk_src.clkr,
 	[GCC_QMIP_CAMERA_NRT_AHB_CLK] = &gcc_qmip_camera_nrt_ahb_clk.clkr,
 	[GCC_QMIP_CAMERA_RT_AHB_CLK] = &gcc_qmip_camera_rt_ahb_clk.clkr,
 	[GCC_QMIP_DISP1_AHB_CLK] = &gcc_qmip_disp1_ahb_clk.clkr,
diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
index 78399993cdcee225d2f21f39844b056193bdfca3..dc7a855be0234f6135d461175099862f2d486d9a 100644
--- a/drivers/clk/qcom/gcc-sc7280.c
+++ b/drivers/clk/qcom/gcc-sc7280.c
@@ -1913,6 +1913,20 @@ static struct clk_branch gcc_pdm_ahb_clk = {
 	},
 };
 
+static struct clk_regmap_div gcc_pdm_xo4_div_clk_src = {
+	.reg = 0x33028,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pdm_xo4_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "bi_tcxo",
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
 static struct clk_branch gcc_pdm_xo4_clk = {
 	.halt_reg = 0x33008,
 	.halt_check = BRANCH_HALT,
@@ -1921,6 +1935,11 @@ static struct clk_branch gcc_pdm_xo4_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pdm_xo4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pdm_xo4_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -3250,6 +3269,7 @@ static struct clk_regmap *gcc_sc7280_clocks[] = {
 	[GCC_PDM2_CLK_SRC] = &gcc_pdm2_clk_src.clkr,
 	[GCC_PDM_AHB_CLK] = &gcc_pdm_ahb_clk.clkr,
 	[GCC_PDM_XO4_CLK] = &gcc_pdm_xo4_clk.clkr,
+	[GCC_PDM_XO4_DIV_CLK_SRC] = &gcc_pdm_xo4_div_clk_src.clkr,
 	[GCC_QMIP_CAMERA_NRT_AHB_CLK] = &gcc_qmip_camera_nrt_ahb_clk.clkr,
 	[GCC_QMIP_CAMERA_RT_AHB_CLK] = &gcc_qmip_camera_rt_ahb_clk.clkr,
 	[GCC_QMIP_DISP_AHB_CLK] = &gcc_qmip_disp_ahb_clk.clkr,

-- 
2.34.1

