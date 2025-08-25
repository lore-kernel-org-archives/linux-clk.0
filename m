Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34053313528
	for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 18:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756145994; cv=none; b=H4Zezu5PgK8R8hv7Hq54VPb7PkfaK4PTHNGTrOTuD4GQPilEmMDWCFHuwWpHbY5IjV5bMUfv0JZQ9KcFM/7rbF5NCG5VRFON14SLY/SXtpV+M4R1F0RTSvChH37l9lFSzoUxOPjqnTNzMUljl7zOmYrQRj1sqiEz0SJCvekoDvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756145994; c=relaxed/simple;
	bh=h6RXWbyefgEVEM0BmVWVfZH0vo7yywZji3SwzXVLnjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dYWR4Tau37CaNgnG/H8HZaJXAMRjQLks95mG7nh5nnMo7sYRMhXC0aeYEOenE+69L0GeJznIZP3Q+PVciSqEji8YqJrDIQC+inArpT/wbps5N5a3gTj3b2RouTwbuJI2qwwztg0HMwyVOS+iNceHs32HBtZF+wx0Jy1322BvP4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bI3MsBQx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bI3MsBQx"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PGHwfr032598
	for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 18:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+lDsdc1O7kmdJsF/Ws/KKiaWnUoZYb60kkTYRbBrGPo=; b=bI3MsBQxfv2wJLFi
	9JQ4xfCD6buVnzIAOl9omrpuyipgxkb4my+UekwMw1mIRL5u4wobnh10a7RRWsVH
	ICZPbjfy5A20ESlgqF1LKjqoY0Dzyujcl0LbFZWq688wrjcN+dwMHcotNzbRfVOf
	f4E7YkAdDKXkIcfzwWAGn7RM2MNuJygWi++JCWUYZQ6qNV7GXQZLomhaL1H7Q8qF
	ayHKhLNJyLxkotC8N6tcgimvj4ZJKQGYvw/LmpR74NbAQXuYZbomAWBj3ktBSnzu
	4wTRAlQwKtdNDjtoiHypCspAHhhrNhezj3gnsrkLA1yatTju0CNpdYWkYPvOXGy9
	6NvTFw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xfe3gb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 18:19:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-246088fc25cso51324215ad.1
        for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 11:19:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756145991; x=1756750791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+lDsdc1O7kmdJsF/Ws/KKiaWnUoZYb60kkTYRbBrGPo=;
        b=agF3SqeQZkkjuW5t8tV3X6+3+ssdzKfRVY5Cst8rvMuCJd4mcxaW4T5ZJYoEieB2uT
         G4VaDU7HKUAOdSuk5KeRT2CHIeBVbZtqsMZ+YWgo+aDyigeW+V+eoSUv+EeOWEGWC12X
         ZS+2koFb3Ym8sGgI6EVbUE2iMf82rfeem9wd16F2uJZLWYsh7R/WAYex3lcV57tqbPi/
         BA0hLw9NQ8ZoLMaPgBB2ZNQy2heYup+tTNYwtAUveuOHHgu1ACnrG7xNXxwBPwe2XHtf
         rSMQC4FGIc8ER/08SDXa86c5VMzgjm1Zj8wdp6j2+krATxkmjidaiTR1iJqiptfyugbn
         n1Iw==
X-Forwarded-Encrypted: i=1; AJvYcCUjnqkiqD9w0CSkNtAm32mgec9spmUKQnFPa1riYFb3VebQYIi0eZPDP2xUs03E609nTJaOQ6Ut2xM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyNb469hnouhGyuVt8P+k9dBCBDkoHbIX4BmC4vPgaBccCzkBj
	0eAge6V7uB4SZnMa+ET6Qizq/NkUOZDvgYdw9YD6qxOmOmkMdOyyNKhjhZ9spzepmFGAPqaf/pA
	Q8FDO9tHwb1HO2/RfqzbuE31YayrL9cgvTJOYm0VPhNwe/HqEm/Bef2KJDueFZFw=
X-Gm-Gg: ASbGncvlFHlEsVEb4GSTEFUXrnJT9C1MPoEr6sFJyWYdbwA9z8jgzDaNZStJqLYDWRm
	iy0cYHENzYqyf4M3pWn6Zm8mb2Dl/0peq0xMMecGnCiuEaX3zPNzSa9e86h6HkY3hkekNCNiRic
	9q2mcVRb7F3EouR720jfUuVgecjIxVvEVIP+TuQI+/52SFZc0r+9Qeuv9pdipKF8KNWH0t8OIQo
	t9WNs9lqyowXRkHhfIokYKOG7f+OhxBxfJ/W0LpHdr+m1JFGYkiFUIG7Ro29P/YBnrh+xopuGYT
	iWRPGn4ozKFFjKI9E2V6vEC4qCxaC33vX2Ot9+aNXph9e/lUFfXBl6W9cR6FXnJU
X-Received: by 2002:a17:903:2105:b0:240:8fa2:15d2 with SMTP id d9443c01a7336-2462ef440eemr109453235ad.33.1756145990742;
        Mon, 25 Aug 2025 11:19:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqGpGu9nyoARN82aFs3nmiW5nNqCgT1gPGMKlJWpANuLc/XS090pHBPwUfr5neFxpCrqXAkg==
X-Received: by 2002:a17:903:2105:b0:240:8fa2:15d2 with SMTP id d9443c01a7336-2462ef440eemr109452925ad.33.1756145990294;
        Mon, 25 Aug 2025 11:19:50 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246688647acsm74174015ad.87.2025.08.25.11.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 11:19:50 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 23:49:12 +0530
Subject: [PATCH v5 5/7] clk: qcom: clk-alpha-pll: Add support for Taycan
 EKO_T PLL
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-glymur-clock-controller-v5-v5-5-01b8c8681bcd@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX0x+k/D1af3mR
 TY098rvVQtOgiO9TlIa/E9Q/3hsDAJQeDV44wEB3WEExOrEBQ36Id682fLyKOXNbX5ijST22lpR
 6lI/c1CuU2HGJTXlVEn3wGxO481grPbTB+rTyw1vuMSEMIV0sc0hI+cjmX0trAM0MDQICVmmID3
 blH11ZbJ0FiF3LnM+wmPQelcxf3RTZM3Fb55NLONJqKLT6OgT16i7EcTASSdpR3jgBrxxK4hc9c
 F2CIhAsiczpfc7oGq+QKUDZCv+wnfWdAy2E3OX7ocHh5ifp8lEHz8sRJsLQaFCJHrmFXvCrzqkQ
 1OGF8Vlv4YkLgwMBRaLXhQmgi23DjUYE8AQKvYr0CzhqlaSooA2b9HYkUuW8bFRr+g/r1FZSfsS
 +XCLcm4e
X-Proofpoint-GUID: 6UTSn4YrEA253xyPZ8lTp4w0uqww0BTn
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68aca948 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=9yNAuCQw4ehsCnPPvT8A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 6UTSn4YrEA253xyPZ8lTp4w0uqww0BTn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

Add clock operations and register offsets to enable control of the Taycan
EKO_T PLL, allowing for proper configuration and management of the PLL.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index ff41aeab0ab9844cd4e43c9b8e1ba0b50205e48e..0903a05b18ccc68c9f8de5c7405bb197bf8d3d1d 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -29,6 +29,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_LUCID_OLE,
 	CLK_ALPHA_PLL_TYPE_PONGO_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
+	CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T = CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
 	CLK_ALPHA_PLL_TYPE_DEFAULT_EVO,
 	CLK_ALPHA_PLL_TYPE_BRAMMO_EVO,
@@ -192,14 +193,17 @@ extern const struct clk_ops clk_alpha_pll_zonda_ops;
 
 extern const struct clk_ops clk_alpha_pll_lucid_evo_ops;
 #define clk_alpha_pll_taycan_elu_ops clk_alpha_pll_lucid_evo_ops
+#define clk_alpha_pll_taycan_eko_t_ops clk_alpha_pll_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_reset_lucid_evo_ops;
 #define clk_alpha_pll_reset_lucid_ole_ops clk_alpha_pll_reset_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_fixed_lucid_evo_ops;
 #define clk_alpha_pll_fixed_lucid_ole_ops clk_alpha_pll_fixed_lucid_evo_ops
 #define clk_alpha_pll_fixed_taycan_elu_ops clk_alpha_pll_fixed_lucid_evo_ops
+#define clk_alpha_pll_fixed_taycan_eko_t_ops clk_alpha_pll_fixed_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
 #define clk_alpha_pll_postdiv_lucid_ole_ops clk_alpha_pll_postdiv_lucid_evo_ops
 #define clk_alpha_pll_postdiv_taycan_elu_ops clk_alpha_pll_postdiv_lucid_evo_ops
+#define clk_alpha_pll_postdiv_taycan_eko_t_ops clk_alpha_pll_postdiv_lucid_evo_ops
 
 extern const struct clk_ops clk_alpha_pll_pongo_elu_ops;
 extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
@@ -233,6 +237,8 @@ void clk_pongo_elu_pll_configure(struct clk_alpha_pll *pll, struct regmap *regma
 				 const struct alpha_pll_config *config);
 #define clk_taycan_elu_pll_configure(pll, regmap, config) \
 	clk_lucid_evo_pll_configure(pll, regmap, config)
+#define clk_taycan_eko_t_pll_configure(pll, regmap, config) \
+	clk_lucid_evo_pll_configure(pll, regmap, config)
 
 void clk_rivian_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 				  const struct alpha_pll_config *config);

-- 
2.34.1

