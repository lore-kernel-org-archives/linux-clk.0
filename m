Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58462F5308
	for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 15:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752679247; cv=none; b=px7PGcncAW8zixPkH/RQAustToIT/72Pvt7EJmXhTin310Wa45SRWS4SquByguxyGulAJ4BOKskxxBRNbQj+7xKfeWHN9RrnUu8poKH8ykJs+9SJdv/+sVxJxo4XgTw6yazhCktzNv7mEOBVj/W2liRn30wR6RxNq7AhEkvJ8Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752679247; c=relaxed/simple;
	bh=iSXFZ/rxSfqiYe032EgSZdLxuNhPgtOw+DCydKf66Q4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KgcNMfHMMnHxwWvJUU1AYogMdomm3TUl86wCYY5+VJxEWg5iDE8GlIzJh7a3PhuJLgSMpA/ldxRmu3nHjff+I+b1hdqRzNNSuaH03z5lde9kwVHlCXRXQXlXKbrawp8FA78SIHRlLzUY4o7XpN4Sr9q9m7s6xCsLncm1mG1y7v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mBSIobQf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mBSIobQf"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GC9FPS020490
	for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 15:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KeWo6NhvYfL
	SpZC4i2L+Ou9NoRlmlKN1CvQ6KpYQ+j4=; b=mBSIobQf3aVJSci4MgOtVXV+25K
	RmvnH6s8JyyRBOKoao8r31UDEb5uq5oV3KJMtc/1mGHCJb+ziDvOB8fr20FWAe42
	GZpMVO4a0kMAuG6gjF5Ll7DyiA/TsN6cZJytLp/uRD35jrySa+vhZlK06tFfKDCo
	aj7/bPoX4eoSLwl1ruuecLyauCEG6CTyJ2r0JvCDChNC2rIMDnBfKvL3H65+vlLS
	mITlnRFq0J7jWt7O0YrPhDYn/2goL4vdI5b+EH3nL1F9wiuZ7XoPpGW9B3iDKVGI
	vC9yvIURrdUT3T36yzMuzg7B0CU++ASc6wajVsfAM0HXQd5M58r5MABKniA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47xbsq8nha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 15:20:44 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b31ff607527so5394295a12.0
        for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 08:20:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752679243; x=1753284043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KeWo6NhvYfLSpZC4i2L+Ou9NoRlmlKN1CvQ6KpYQ+j4=;
        b=Wt4NAcVvLDyoyumQTqOyTtGj9Hdu7vTO1S7gcXOyJvGBRvR6cg0O4qrU9oAPmN9rVB
         WCb6hnd3C5e0YtfLD7Nbc2ZpnyCO8QPL84xyG96iaq8u/+EZ47L4MVO8tir1SneE7jHy
         8PL8d0sjTjXknU1dDBZAZW6271YBwS/B+AsD/J9JcByP5l/fxn0RoyoBQT5lCMCp03lL
         gunOPwV6V5zySkQpGg/utw/E9OKuBs9AllXQ5o/1DLCbOkhGYMi+5adyixHWu7Lwii00
         teQg4T4qpq0oFqKmaeau5t2bijSdH5pNjVf4/38PDEiAAye0FFlR/o2XEL9pFjPMf6C6
         giLQ==
X-Gm-Message-State: AOJu0YyP8bVD+nbMiEYvPpz1o/js5ZFfdZRIxR80S3JdZ4JEb5XhGUn7
	jVgsDQgnBFfPPsLnWYoVySyD3AGAF9aRB6V/AZkb+Uv8o+tigkUm2P5yDQFkQfVZYKUIn59ZpC5
	EztnGD18oPPz43PgtrrP0bI2S5Vdav7AcrTMjXiKkvHSoqhh5dJb8cqOO04g3QzM=
X-Gm-Gg: ASbGnctH1IujaKYHkB1wmg/eWM467wGvqJ9wc17VOjG7/mjTDyQxdWITqygw6GFv7Ue
	DWTSl/PJaJL8YezSH9xDcOSVYX0cUd6qw2E6pMdyhGCogRrDGCr0yk2Xq7ABtZWJT2gpQ/Gf+Y0
	/4S/HLd4i2aGWbJOXEryHGCrYNcm5odfb/wWcjXLDJsfQqPbMzE2WCG9a23Ws71vgDAZ94lu9bq
	VsJdyEkd4RI07K7HmRq3yRaFaTGeA3uZZnuZqLO4eXnUkFIPxMPIc/jMo/kaFkB8cKyEASxJp8s
	B8OACWV9Q9XsbgH9A4zGy0Jf25Pa1R2l/sZZe5AN+xYP/qAFghhvteypfsDMmJ0wnRlzC+GG8Ph
	tfFHj5EBSEN3VzOsLNKJHYntFxa8OLQSUu9ugOdcoOkb2lw9mxnD0i6lGnRcJ
X-Received: by 2002:a05:6300:6d0b:b0:238:cded:d32d with SMTP id adf61e73a8af0-238cdedd407mr1274381637.23.1752679243317;
        Wed, 16 Jul 2025 08:20:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGalH6XH9sbSz8Z1EVkarL4o21D07/XcWEc3VRsCi3TM9BgHq254ZLszBRAS/A60P5dNPeUGA==
X-Received: by 2002:a05:6300:6d0b:b0:238:cded:d32d with SMTP id adf61e73a8af0-238cdedd407mr1274334637.23.1752679242755;
        Wed, 16 Jul 2025 08:20:42 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe6bd8f8sm13912054a12.38.2025.07.16.08.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:20:42 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: sboyd@kernel.org, mturquette@baylibre.com, andersson@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        quic_rjendra@quicinc.com, taniya.das@oss.qualcomm.com
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] clk: qcom: rpmh: Add support for Glymur rpmh clocks
Date: Wed, 16 Jul 2025 20:50:14 +0530
Message-Id: <20250716152017.4070029-5-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
References: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ad1hnQot c=1 sm=1 tr=0 ts=6877c34c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=RRvC4NyyfoRIYhV0TvUA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 1bKuyeYFIZaDshp7cXZZoSbocS7ZxI5l
X-Proofpoint-GUID: 1bKuyeYFIZaDshp7cXZZoSbocS7ZxI5l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEzOCBTYWx0ZWRfX4GHzzi5fIWwO
 dWyeNXIQ8AK3QSy6pT7T0UraKDuF8xuwvt2/0MBn9WBaCURdeddeGfc2D3+jlv41IdXIXYPNbwU
 as8QWNljNi9LsDyHP/pxMxM6uZc8Bzvz/c4oZJMlMF6zfYvKyT5QF4fwQrrjEy11ojnk/KD+i7W
 cKvgDeSjPUco3gmwJWz4escQ+KNf7pYUEFRidb5Mt196qB8eTxudD2/M8QgItXLNmhaKzrlywmr
 KcB8yZ6EXBOn4vgfPHWTx9ZfzxQTblnG54JnkBj9E3KAwyK5OcCwZA8ifHN/vN44bHTgKfnDZbm
 PRK3MnWpZAqWPJK2pIC66gC+hYRasbO4WDDJhp7IOd9aB6jXCaxp0nwb2KRiVt5HqQltyp1np6d
 7keYlkf+D5LZ4H9w2DJga1NmkE4DIBPvdLDQYaziw+76hflJynWeaFROzdS/p98roEISvCTe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160138

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add RPMH clock support for the Glymur SoC to enable proper clock
management.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 00fb3e53a388..1bc1333087b4 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -388,6 +388,11 @@ DEFINE_CLK_RPMH_VRM(clk8, _a2, "clka8", 2);
 
 DEFINE_CLK_RPMH_VRM(div_clk1, _div2, "divclka1", 2);
 
+DEFINE_CLK_RPMH_VRM(clk3, _a, "C3A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk4, _a, "C4A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk5, _a, "C5A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk8, _a, "C8A_E0", 1);
+
 DEFINE_CLK_RPMH_BCM(ce, "CE0");
 DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
 DEFINE_CLK_RPMH_BCM(ipa, "IP0");
@@ -854,6 +859,22 @@ static const struct clk_rpmh_desc clk_rpmh_sm8750 = {
 	.clka_optional = true,
 };
 
+static struct clk_hw *glymur_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a_ao.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a.hw,
+	[RPMH_RF_CLK4_A]	= &clk_rpmh_clk4_a_ao.hw,
+	[RPMH_RF_CLK5]		= &clk_rpmh_clk5_a.hw,
+	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a_ao.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_glymur = {
+	.clks = glymur_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(glymur_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -943,6 +964,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id clk_rpmh_match_table[] = {
+	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
 	{ .compatible = "qcom,qcs615-rpmh-clk", .data = &clk_rpmh_qcs615},
 	{ .compatible = "qcom,qdu1000-rpmh-clk", .data = &clk_rpmh_qdu1000},
 	{ .compatible = "qcom,sa8775p-rpmh-clk", .data = &clk_rpmh_sa8775p},
-- 
2.34.1

