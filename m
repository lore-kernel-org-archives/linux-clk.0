Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107886;
	b=2m7kjyAy5aGhxpTag8w9N307v8odYQsRtanWj5seoE3MzP3+Pyy8FLfvIKEsyqE6fAzp
	 KOQIqfAYLatlRrErzczEvumKddv0W1N+3/f50Ys7Fts67TFnpY+W9eUV1V1Kn5wUYG3Fx
	 Xn/YMCzWlZupBFgdterqgQwZPfGLcfox+LLkch4MeUhyGAO8ZSoqbO1YOgpUa7li6tMTh
	 NbsBS6KJWa0LT153P3MP2NJrFzOr3SMOTYjt4+yzs6j3OFajZQhcH3jD4EW7UuzFQFbXQ
	 hcDd9gtgFLdMANDL6i33yJKF64cG6gb9n8DQpgmd0NKFCGeBav5RXwMJONPAExCC3EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107886;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cncjVnExA6bfr+B+E0TlUndLQSnD5TH/elcwECuRNDg=;
	b=5t7gwmYGzoY5Tf2E9JCpAR1qh4QQnj/mU1eKCnz+tvnUlV5vRYYRBHxvQsNGEGjsSNJP
	 swx6Zlvnxmii+aTJgozCBYOqiiHPausC/GFVXQcyGhbve5OseoqRldxUIJciVScZ7y1gu
	 ghvLGuUf8Tgx3g0QsxI9lZAO2iBh2+IwvbVE+wQUhA6WdtEziRduT+p6VsNVK7yYLRTrB
	 WEtDPcy7yYhOLv430rzA9UezpT1VLMMRUjZcxuJJTmQ+p0Hro0FCRW3E5s6hcH15lYc6v
	 kEU+Ve6exAPdEsNkny7sXOeQVeLt6pDlvFNp6WrE0SpHm5FpMvcPwT4lW3vwRRqSBGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y6Vk1GxX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T4eOZYeZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E615360A2626
	for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 17:04:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E615360A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y6Vk1GxX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T4eOZYeZ
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJGsMhW3371586
	for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 17:04:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cncjVnExA6bfr+B+E0TlUndLQSnD5TH/elcwECuRNDg=; b=Y6Vk1GxXG1cDwK2I
	Ay5onzAoA+VRchaEdcN+T2+HmJKW1e2Mv61Zv1YiVeNf1fAAzpVwKf6Qcszwgjeo
	8SrfWy1No0eHTBNs5qsDwAFVPwMJ9YzhPepPmRWfJExpm96/7OhAQu/lNAbxlwuo
	OzRN0FOH1Y3j5A+J17CDSdf1kTDGyHquIxxHC6uvG+BsbTYmgoGi64xIpA6oL209
	Ks0rxNRakP5UGPCXPB/Mt/rHgr91iQ0gsoiX0qWKUAA15amMIlvhB2fxpR4yhugz
	cuBbM+WdH4xY1EwilCUIyJdxFK11DU8TwMkQIj1yg5WEb7mdX9/szhQQ5OiIEigH
	1/F5Qw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j20gu9f3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 17:04:44 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a08903566dso887871b3a.0
        for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 09:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795107884; x=1795712684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cncjVnExA6bfr+B+E0TlUndLQSnD5TH/elcwECuRNDg=;
        b=T4eOZYeZs8XqlzJWEwxtKKBfHHAm2TfYOpEVkafgc06bxHjR8/gCrb2KlhVV7wRKP1
         FMb8uVDJAD5g0xp671cnt6bZ/rfd3Q9IJUjcbCWJKH/LPPE4pQlatGRuuwvdx4gJCfFP
         6ZqwRHgcZ6eIkx9/EAn3cnb5sjqA6CFzycrZQh8UOni2bmRifsbxAGJBhHPGoX6i56bJ
         DpS0OdBrMyeVEzwwpaPTAd2IGPAI5fFcTVwAJGeX8b13FUlJ5Yg3lKVJHxttbtTYxa29
         gOnz/LzTXrlbKmNwf/3yT9xuim6ESopOFBQ8h55Z6wMlFcozzP7vq0FLvdj6JaLuL4fB
         matw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107884; x=1795712684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cncjVnExA6bfr+B+E0TlUndLQSnD5TH/elcwECuRNDg=;
        b=iC9DHmkPIisvzidpkoFifevOnjkjnaUTxCeuE4w9QXv9Cm/SUQMQOFiblgjogI+ueF
         5a9UmUHznL9BQaRtQRSOUOTuj3WyqTmjond2WMgoRBvOg8BP7SZNFoi19Mjn9LvXLBnd
         wuTqpYPx8Wkoo10L7jzrFx4UNus8rmPDIaqGjYUzlx6fA5SSR/jHgvjGZMgIAczffaQp
         hK3GZqwZWn2ILOLT5RBBnNprbAKff8EZCc8FEtsvXw4dvU3YKgEk7lGwtFsUAsdPn7FE
         Lw8UlqW5F+dyQCSYBv3VBtcxCIkGy91lVwmKooCNWl3luvcVF17Ju4v0dx+an7jWdMzc
         RhuA==
X-Forwarded-Encrypted: i=1; AL+hErHx91+gGwmCss7ohCCXqiChrD0dtaXlilmtlNbBTZxRTpiTPHtFgFBUzEvy29zZlcr9SaZ6YcH1qeM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SELtyLMu1tsNGW7ahNiw320iUKbgfGB85c4CbkwZp7yLm79r9
	50C6TnUVkM6oUxXxVQ3EJbxlOrvU5dgb0qPBzmP5loSxFOezs/szqFgNrCetVxYnf7EhgSbpZxz
	gwC1+vclOs8fjTShydZxXkEOO7tt5SzK2SGqBAQg9jyyHgjtItrgP8nXocFMDuC8=
X-Gm-Gg: AYBFou3FcTkksL7a8x2hAlGMYWbH3D4p5BQWoB2AK7+whPC38zPHd3WKbUcHWSPYPI8
	CIBPCV1Uzq8Qzheq9kTeaKjWlWsFUds1ogTwo4CzDLTVV4EdqVUoRTzCHu/y41oqb/hl1pPO6fZ
	gPd2lBGFbACiAzZtlcVoFrCpXBIauK+OTrc/FtDSEE/CI/AALvqbbO7WkS19SQARB/lghP8+K6f
	N6V3ChWnWgErS8MdFMpRUdqEE7p2u58FOuJPPsBp+Od5PhgbTe4U1j8aWrOu6mkec4fRZybyviA
	bKs9NsTt0nUsVop740BrSM+FbrMMyqzJ/FrYfPVP6FRZIQNrugKjGW9NJYwSTvClON7wAEn3jA7
	2ELhXKgStl7jTL2YYEGzmRNypD/teuos0MnO7UyjupM6CvJdFBt0mkXsyJSOk1g7xeZ/K3ROnbA
	==
X-Received: by 2002:a05:6300:614a:b0:3f9:3f64:9b9b with SMTP id adf61e73a8af0-4014ca44ac4mr173036637.13.1795107883647;
        Thu, 19 Nov 2026 09:04:43 -0800 (PST)
X-Received: by 2002:a05:6300:614a:b0:3f9:3f64:9b9b with SMTP id adf61e73a8af0-4014ca44ac4mr173005637.13.1795107883151;
        Thu, 19 Nov 2026 09:04:43 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4af1fsm206335b3a.28.2026.11.19.09.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:04:42 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 22:34:21 +0530
Subject: [PATCH v2 2/2] clk: qcom: segcc-nord: Add I2C and TSC clock
 support
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
Message-Id: <20261119-gcc_i2c_tsc_support-v2-2-dcb91a0b0013@oss.qualcomm.com>
References: <20261119-gcc_i2c_tsc_support-v2-0-dcb91a0b0013@oss.qualcomm.com>
In-Reply-To: <20261119-gcc_i2c_tsc_support-v2-0-dcb91a0b0013@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA2NyBTYWx0ZWRfX5etr3bS1G5V0
 1bWKZRnXFQwUsH6hUwqHRehyAF//Yg6FWdq1lEKmO1T6TVk/wcvDjnjBnvQuhObu2zMuKnM/Ybn
 5iWQrh99ZnzJ2zZDitxYnycCXYqRUBs=
X-Proofpoint-ORIG-GUID: bDBTSewFeXgce4dVajZKZKysY8J3ukRR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA2NyBTYWx0ZWRfX5WwRikNbyUe/
 eC32p7v0YosL318jwHHPPyukf/mfRew5tU/Y9adfc7d79QqYVO00mhWEfCCqglvo1+BDyBRNFjC
 KfC4zpHb8miDzyVCSsaAVAqUC526CrvnocIXfIJM4jkeSRMjqSAP+Ik2RBHD9gQHN7eOETQGodv
 I1lztmFgY7vxyWSK3g0NF/x3TTa+/kGFempun5DffjtG2HAggjx5Aj9TrTSKCq9B6CJ8/vnXaCE
 kAwTFlzt/Hp/jGVjPOFCXkOTZWJel2sLrD6ex3Zj76x67R4kaWfqrEd70l4BwVg8lR+oYXvY7rA
 nWtcPiNYW+fVvZKT4IM8QBV5YIbsPF6hXmCbiPiIi5/1Hk6yJlfy6mAkH60oJ0fElSbU7wJDKyS
 +KZxLjFianc69tbGtPMkcVLD8oMfbmp7foOI19BncBeRR7+eZe3xJcZELLy/3aw9FadCkwNfkW4
 9Scyw8HaZwDznL0Xfag==
X-Proofpoint-GUID: bDBTSewFeXgce4dVajZKZKysY8J3ukRR
X-Authority-Analysis: v=2.4 cv=XutvqlF9 c=1 sm=1 tr=0 ts=6aff2c2c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=dmjuMl4sYXMLEaQzlHIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190067

Describe the I2C slave and TSC subsystem clocks, reset lines, and
parent PLL needed by the Nord SE GCC. This permits consumers to enable
and reset the hardware through the common clock framework.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/segcc-nord.c | 135 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/drivers/clk/qcom/segcc-nord.c b/drivers/clk/qcom/segcc-nord.c
index ef97da3852e3571db5c34676a8f08b9650d1e4c6..256d3c18201b4fd0e48bef9293cdf78fb329ebe2 100644
--- a/drivers/clk/qcom/segcc-nord.c
+++ b/drivers/clk/qcom/segcc-nord.c
@@ -29,6 +29,7 @@ enum {
 	P_BI_TCXO,
 	P_SE_GCC_GPLL0_OUT_EVEN,
 	P_SE_GCC_GPLL0_OUT_MAIN,
+	P_SE_GCC_GPLL1_OUT_MAIN,
 	P_SE_GCC_GPLL2_OUT_MAIN,
 	P_SE_GCC_GPLL4_OUT_MAIN,
 	P_SE_GCC_GPLL5_OUT_MAIN,
@@ -74,6 +75,23 @@ static struct clk_alpha_pll_postdiv se_gcc_gpll0_out_even = {
 	},
 };
 
+static struct clk_alpha_pll se_gcc_gpll1 = {
+	.offset = 0x1000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.enable_reg = 0x57010,
+		.enable_mask = BIT(1),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_gpll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fixed_lucid_ole_ops,
+		},
+	},
+};
+
 static struct clk_alpha_pll se_gcc_gpll2 = {
 	.offset = 0x2000,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
@@ -189,6 +207,20 @@ static const struct clk_parent_data se_gcc_parent_data_4[] = {
 	{ .index = DT_SLEEP_CLK },
 };
 
+static const struct parent_map se_gcc_parent_map_5[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_SE_GCC_GPLL0_OUT_MAIN, 1 },
+	{ P_SE_GCC_GPLL5_OUT_MAIN, 3 },
+	{ P_SE_GCC_GPLL1_OUT_MAIN, 4 },
+};
+
+static const struct clk_parent_data se_gcc_parent_data_5[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &se_gcc_gpll0.clkr.hw },
+	{ .hw = &se_gcc_gpll5.clkr.hw },
+	{ .hw = &se_gcc_gpll1.clkr.hw },
+};
+
 static const struct freq_tbl ftbl_se_gcc_eee_emac0_clk_src[] = {
 	F(66666667, P_SE_GCC_GPLL0_OUT_MAIN, 9, 0, 0),
 	F(100000000, P_SE_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
@@ -670,6 +702,21 @@ static struct clk_rcg2 se_gcc_qupv3_wrap1_s6_clk_src = {
 	.clkr.hw.init = &se_gcc_qupv3_wrap1_s6_clk_src_init,
 };
 
+static struct clk_rcg2 se_gcc_tscss_clk_src = {
+	.cmd_rcgr = 0x2a010,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = se_gcc_parent_map_5,
+	.freq_tbl = ftbl_se_gcc_emac0_ptp_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "se_gcc_tscss_clk_src",
+		.parent_data = se_gcc_parent_data_5,
+		.num_parents = ARRAY_SIZE(se_gcc_parent_data_5),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
 static struct clk_branch se_gcc_eee_emac0_clk = {
 	.halt_reg = 0x240b4,
 	.halt_check = BRANCH_HALT,
@@ -1079,6 +1126,34 @@ static struct clk_branch se_gcc_gp2_clk = {
 	},
 };
 
+static struct clk_branch se_gcc_i2c_slave_ahb_clk = {
+	.halt_reg = 0x2c008,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x2c008,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x2c008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_i2c_slave_ahb_clk",
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_i2c_slave_xo_clk = {
+	.halt_reg = 0x2c004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2c004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_i2c_slave_xo_clk",
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
 static struct clk_branch se_gcc_mmu_2_tcu_vote_clk = {
 	.halt_reg = 0x57040,
 	.halt_check = BRANCH_HALT_VOTED,
@@ -1456,6 +1531,57 @@ static struct clk_branch se_gcc_qupv3_wrap1_s_ahb_clk = {
 	},
 };
 
+static struct clk_branch se_gcc_tscss_ahb_clk = {
+	.halt_reg = 0x2a00c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x2a00c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x2a00c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_tscss_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_tscss_cntr_clk = {
+	.halt_reg = 0x2a008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2a008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_tscss_cntr_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&se_gcc_tscss_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_tscss_etu_clk = {
+	.halt_reg = 0x2a004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2a004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_tscss_etu_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&se_gcc_tscss_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct gdsc se_gcc_emac0_gdsc = {
 	.gdscr = 0x24004,
 	.en_rest_wait_val = 0x2,
@@ -1520,9 +1646,12 @@ static struct clk_regmap *se_gcc_nord_clocks[] = {
 	[SE_GCC_GP2_CLK_SRC] = &se_gcc_gp2_clk_src.clkr,
 	[SE_GCC_GPLL0] = &se_gcc_gpll0.clkr,
 	[SE_GCC_GPLL0_OUT_EVEN] = &se_gcc_gpll0_out_even.clkr,
+	[SE_GCC_GPLL1] = &se_gcc_gpll1.clkr,
 	[SE_GCC_GPLL2] = &se_gcc_gpll2.clkr,
 	[SE_GCC_GPLL4] = &se_gcc_gpll4.clkr,
 	[SE_GCC_GPLL5] = &se_gcc_gpll5.clkr,
+	[SE_GCC_I2C_SLAVE_AHB_CLK] = &se_gcc_i2c_slave_ahb_clk.clkr,
+	[SE_GCC_I2C_SLAVE_XO_CLK] = &se_gcc_i2c_slave_xo_clk.clkr,
 	[SE_GCC_MMU_2_TCU_VOTE_CLK] = &se_gcc_mmu_2_tcu_vote_clk.clkr,
 	[SE_GCC_QUPV3_WRAP0_CORE_2X_CLK] = &se_gcc_qupv3_wrap0_core_2x_clk.clkr,
 	[SE_GCC_QUPV3_WRAP0_CORE_CLK] = &se_gcc_qupv3_wrap0_core_clk.clkr,
@@ -1560,6 +1689,10 @@ static struct clk_regmap *se_gcc_nord_clocks[] = {
 	[SE_GCC_QUPV3_WRAP1_S6_CLK] = &se_gcc_qupv3_wrap1_s6_clk.clkr,
 	[SE_GCC_QUPV3_WRAP1_S6_CLK_SRC] = &se_gcc_qupv3_wrap1_s6_clk_src.clkr,
 	[SE_GCC_QUPV3_WRAP1_S_AHB_CLK] = &se_gcc_qupv3_wrap1_s_ahb_clk.clkr,
+	[SE_GCC_TSCSS_AHB_CLK] = &se_gcc_tscss_ahb_clk.clkr,
+	[SE_GCC_TSCSS_CLK_SRC] = &se_gcc_tscss_clk_src.clkr,
+	[SE_GCC_TSCSS_CNTR_CLK] = &se_gcc_tscss_cntr_clk.clkr,
+	[SE_GCC_TSCSS_ETU_CLK] = &se_gcc_tscss_etu_clk.clkr,
 };
 
 static struct gdsc *se_gcc_nord_gdscs[] = {
@@ -1570,8 +1703,10 @@ static struct gdsc *se_gcc_nord_gdscs[] = {
 static const struct qcom_reset_map se_gcc_nord_resets[] = {
 	[SE_GCC_EMAC0_BCR] = { 0x24000 },
 	[SE_GCC_EMAC1_BCR] = { 0x25000 },
+	[SE_GCC_I2C_BCR] = { 0x2c000 },
 	[SE_GCC_QUPV3_WRAPPER_0_BCR] = { 0x26000 },
 	[SE_GCC_QUPV3_WRAPPER_1_BCR] = { 0x27000 },
+	[SE_GCC_TSCSS_BCR] = { 0x2a000 },
 };
 
 static const struct clk_rcg_dfs_data se_gcc_nord_dfs_clocks[] = {

-- 
2.34.1

