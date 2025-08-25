Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832063126CC
	for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 18:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756145990; cv=none; b=WPOh7d7sKrxAWiySc0UhwUp+dAFXX80SpQK27PruewdSZnnu7vsCB7oA82SyiT3kV6MBwGxqaSxmhgHrF0HG7xHllWdhuq9KXur4O48+L5t44oTt7UbG/kA5xspsvbaG0AF0t7+Fqqrfl6W3By+dcuVnyjispZCWNQjJbaM1CJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756145990; c=relaxed/simple;
	bh=W1hErH4RE0iMu8p8enZojO7LmQhRLyjqYp9yg5Coa0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xb5DfBID/pQDe/EszClqq07WWwpY8HLr5XqrwgDBfo7vjn0ODApIA3gcBKIFaq29bPLgKjtPg/qsOjcPKP8UI3KMIR9DDeR9QWxKudeQue6Ph3Bi/1MF1kPZSXFuyUW3pEILVgjGZ7wVQs61TGktojYps+zSrMA0DWKljYMcAk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IzFVVpJb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IzFVVpJb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PH9Fnu012204
	for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 18:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JcjcOM3D/Lj/LClPeIpUH0/bEc7QqRb9K73cv9in5mU=; b=IzFVVpJbNeMWfAwz
	0nJ+GRCz2VsGe5vAoOsc5eLJ9FvZ/YQsWv/SEDJOokSgL9An8x9pnTPpTHh8IuRy
	YYjzlFKHVz9d4dbJ38GoUQOrvrOv5YdZkshPRNPsfpv4W+kfatVzLZ3dWNRp0kEp
	p1Gj/syVCuJf00Tm5vs2aiSxVZ13V3I9SmeSaVJX2Ms/ryolUmRH8ThGghBs6b2M
	fMh4j0kX/FcB+MXQbLjliWoOMKQ34n077VzPw1GvnXIkZub36N2CZcEkiVxYSpra
	x3M5zgKxRcAzLf4x7+i2+/p9bZu7LjSw7A00L37RKBGkZ00BzCrKmeUwggyqwXv3
	99dnww==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5unp19y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 18:19:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-246164c4743so84441345ad.3
        for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 11:19:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756145986; x=1756750786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JcjcOM3D/Lj/LClPeIpUH0/bEc7QqRb9K73cv9in5mU=;
        b=Qw1Tn0s+SB1P+O4JmGzEa9Xcq3lZmmo8Tf8ESKgoHKrIXpMkSn3cFE8Aqw0TqEIOOa
         9HfypwKHEpgnTPkJrJnVTvMIi6dSTsq7I+0+fQyotB30mvMItF+NToQ/bamAL4HBXVht
         gg1w97YGxsi7DcK8aklE7CYTSlS7ZVO/f1wEdkF2RpK23tgxhwMf9OQ6pv/qRnx3rV2s
         qUp4jeTv3nNWkWx0oxjO0WXUoYOo0XTHlrh0vTtNlglb+cEOEnRiGt9OAsMCXpJDKLvr
         2S9yjjBnuI0K1NVBQUvQhyi2H4TVD96g6xW32xNSo7iJoiXe/DOjCPhe/PUrrknR5r7A
         KVEw==
X-Forwarded-Encrypted: i=1; AJvYcCUciPHHHfDTdlpQdkNhWlqCa5LLtmbi9YtO5iCAM5gw1pGdfbl+Cu+I9sb+huxP4/KPfNRdfArZvqU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK5zPsIbGO79Eg1rL6QFiVLJVXFIRY8a+GWllr3f0MGCPio6mo
	Nnaih+nDdxcp8kJlhCS83n42aIO0hrJ0evHKbhxqb08Jq82szEHQbTXD/HFZ48x1c7J9vC/DawA
	xMQerBiJWMtDIj2j0J9X8ugR2W9jTZaVyNrnpVzSRqpex1S+aRvO7hgdvb2qQziw=
X-Gm-Gg: ASbGnctFD8HRrm8vijaVVVdaUTDs/QD9cijLJPi1Jrg3Q77TiSt+8h7RzSeARDvo1f4
	i55tqUIRl9VUnn2d0fG87bnsqM+Y38B7N+X9d+AByjxkF/3B0/Y0RBHGOjtGpdzkH69IP5ck3Fw
	Hix/bHfLaLMwEfKJC7+J3rcjQZ0nHDp0dohJXPI8AWZcF9MltnAl8nNPoFWViv0KNYd87oOr7hv
	WoJ0/iyjliCJNbFkpytPLiNev5Ls//Av78RHUogVfaRPcnrz4jmmGv7rN8rhpz0p/wHbCySlNHR
	bA/LL0c2KHml5FzbJlNFHhaiaDqJOEvIENIjZWTW+GoOcHKAMKLQvcKakdqViKw4
X-Received: by 2002:a17:903:98b:b0:246:de32:10d2 with SMTP id d9443c01a7336-246de32149dmr53483235ad.15.1756145986098;
        Mon, 25 Aug 2025 11:19:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4xqkONwCepz7glKpZPLFP9f1sYT3YWmR2O9VzfnO3roOayrJHRaHM5P1Z0XIQsKFqj7Ju2Q==
X-Received: by 2002:a17:903:98b:b0:246:de32:10d2 with SMTP id d9443c01a7336-246de32149dmr53482835ad.15.1756145985634;
        Mon, 25 Aug 2025 11:19:45 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246688647acsm74174015ad.87.2025.08.25.11.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 11:19:45 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 23:49:11 +0530
Subject: [PATCH v5 4/7] clk: qcom: rpmh: Add support for Glymur rpmh clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-glymur-clock-controller-v5-v5-4-01b8c8681bcd@oss.qualcomm.com>
References: <20250825-glymur-clock-controller-v5-v5-0-01b8c8681bcd@oss.qualcomm.com>
In-Reply-To: <20250825-glymur-clock-controller-v5-v5-0-01b8c8681bcd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: Gwi8gFTf_mBwbdYkZbLRUUoGbyl-BX7M
X-Proofpoint-ORIG-GUID: Gwi8gFTf_mBwbdYkZbLRUUoGbyl-BX7M
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68aca943 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=RRvC4NyyfoRIYhV0TvUA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfX6AgbJnxRxy3y
 qejQtakFwkYUMdRR66MOav3BG6mq5+8+5qujLoNU4f0hMsHVCTDYKOdnKT/msHd5GKIxHcgYQCR
 nKwYN1lEY3V84APXRMMq0DfMz9jdBQshYA/YLZqZhpw4lE+aoy4PAcxca19/31KGD8a3phINRCB
 i23FwtEeivbtBS+KcxbSRW+PXKdOkF5SHb2nIJzd62Otv7OJ8oqJWlfhn/pysYuMgvhMBvLDeRE
 Dx/T2aEsbM2NvGF/X0K3AmafIYCsNjSdOoQXqscgOCEdPp68SU1X4pTKxpdOW7khWZK/c3TUO4i
 MSsMbjAc44JHmid+y/LC0uMDIUI/AKyBcNcF0CEkC+RZGFF4NyIwwS4h9xv8fknnLIf8NWdsLmV
 MkqiWjYz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031

Add RPMH clock support for the Glymur SoC to allow enable/disable of the
clocks.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 5103a464d86d3cb4c0ce3ff68956178dd58b1864..63c38cb47bc4592ad8d50b11dd73e09fc3011982 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -390,6 +390,11 @@ DEFINE_CLK_RPMH_VRM(clk7, _a4, "clka7", 4);
 
 DEFINE_CLK_RPMH_VRM(div_clk1, _div2, "divclka1", 2);
 
+DEFINE_CLK_RPMH_VRM(clk3, _a, "C3A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk4, _a, "C4A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk5, _a, "C5A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk8, _a, "C8A_E0", 1);
+
 DEFINE_CLK_RPMH_BCM(ce, "CE0");
 DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
 DEFINE_CLK_RPMH_BCM(ipa, "IP0");
@@ -879,6 +884,22 @@ static const struct clk_rpmh_desc clk_rpmh_sm8750 = {
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
@@ -968,6 +989,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id clk_rpmh_match_table[] = {
+	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
 	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},
 	{ .compatible = "qcom,qcs615-rpmh-clk", .data = &clk_rpmh_qcs615},
 	{ .compatible = "qcom,qdu1000-rpmh-clk", .data = &clk_rpmh_qdu1000},

-- 
2.34.1

