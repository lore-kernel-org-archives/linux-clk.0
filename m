Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD289481658
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251654; cv=none; b=lUmFv2ChdTtkBf0cbbhDZB5CRB6A5/4q27c0yBU5MICys1q/L6Pcpn6F5mADW2VR6lb1p2+ooKFIgA5uCN1YAthEBboaKDLO0HKfbMOBgvlVIpwCsAjYwyb4ddBBHZyMmGEi3IZJSj2vu/yJ6W3s371DeWK5tbItAPw9FxoWppk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251654; c=relaxed/simple;
	bh=Xg8yZ9bCiuy7/hKy2GSjfWfNlvm/K4g4ya5dCO9sfGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SwvABAyNXgdlyWA2EGm7U/7zYKBvnCyaN2uqtBEWrivK7k4C7sqCM8y/9IHqyAvoxSeDDLtQBKpW9z0keMhffodhPakT6pN4qgTKa6UL+BzUOeOz6gcfM8OP8xwekbLDxy/DXvzZNvlIoJFNcmCW8IbQkFO0an/OM1vndyD8vsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UDFTaJ7s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sl2f26mw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UDFTaJ7s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sl2f26mw"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4t3B803928
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:07:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nJIvvwuuwJUhqRsuC3nyaRQQk7di0D0zk/kBIt8wCTU=; b=UDFTaJ7sghrdSPsY
	l4Z8w2tEKwOAoob9mRZstTGRzO63msnhnsxZh/zuhmS5NbAupBO3I8eeQdXJ3PHA
	9S5uCP7RXTYybQop9RAxqvQ35o/PxuyMgn5iYj5YqkxHQp5XTSLqKHCnfxREQ9I/
	IClWIWPMzKWKMsVV/XnjIQ0Vynp4lMDo37BpmO4gy3abQY5AQdsWxSTVe42K8nw9
	CI88SIu1srKjltr22kQ+AXSxTYbo6rSV8hW9ZTpEd4pVSB9tNGASCm040YsArsJ8
	Q3imcvj2kxj5TNpxjYx/NSIEy7J5A8+oZaZfdW5hLc7Iq1z9c+OD0H1IFo8zbtb+
	9kyx6g==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1sc8ex7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:07:27 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78fbc5a4cf8so868881137.0
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 05:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251647; x=1790856447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nJIvvwuuwJUhqRsuC3nyaRQQk7di0D0zk/kBIt8wCTU=;
        b=Sl2f26mwGmX7pJqDabiBZWh+rwY0SerrkRwkHa5zscL8dH1d9GfnhhQHXciH4EuXcL
         kZ96q0TYtqQpw4PI48/MSkfWw+nHbodrsnxsz1WuNhtTAYVSz1Y0peReSM/Haqv3ubOg
         E6v43m2OgeW8mOywMn7iskmL5hlN2pO21ycYLV4qsLiw0M8KD9QIekJM4wfI92IWXAE3
         rpndk38AdEC08MYjjB0zCYvlkBMRhbQp5NXZ+fjh7gGmHIJe3f+thfFlISp2PE6uK+54
         xL1BksM2RVyHLIjn0sWSAjBkH8FgTiDqVLI9q73+RQAQXsEU6DK4LZjGrvm7FMw5J4IE
         rQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251647; x=1790856447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nJIvvwuuwJUhqRsuC3nyaRQQk7di0D0zk/kBIt8wCTU=;
        b=qNQBDMTEFVPqYJhdhPE4YODsFFnBK39TaD00tjTKGkYnnUM0GSbhvY/JUJ5jdlOFRV
         p7gZRAf/U0XhYJWjVkjxU29y8Tr/yrCGD7e2HbJ+/6TPZ7X1xtpI20zm1zpAaAmFClAA
         JhUUOF0jiIKT160Tvxg3vI1YhMXxIug5Ejw4+YLoYlKUktKJVHDMHj3YKe2+qAGvEW2S
         /DepNRDmw2albrmRTD9KWjsAT0g0VYkxiqNmW3Bo/yKJ0Un7Reck3GmhU9b7ERDaIXXs
         W8aRPLYVnZWFzlTCJyQ0yUOlpgQOAGZbYnSKFob/dnLfXFXvee+6mzaQsUDVEkbWk9Pk
         H1/A==
X-Forwarded-Encrypted: i=1; AKwUvBzjQRBE/IjUum3DM+nYYkHzs2aqoaWQOXBOkFLNFl2npRCauQc141p6/qq5+hc/mRmvGWvZuyMesCA=@vger.kernel.org
X-Gm-Message-State: AFuF++mLjZTpGdEAqRSV3VHoa2j/OgOKdNwHo/GkdALo0dAFnbtY13D/
	mRuWkCQPOiiDPvLz66E1MeKESbPelyVvlwPd0ut72dsyx0i1tR+oM1MR/6gGtPgcUVoJdsYBLqE
	RP89+9J2lCvPXuiZKO8odyuk+RUBYXgUwndhk5ylHYP0JJxIZxBOZp8jYwqxFnoM=
X-Gm-Gg: AYBFou1KmqGqcIogRmBLQJuurVcS2+1MKjETV+aaUDI3H8e9PvLrADF/ZmHcHnTPp1p
	4uPGs4b3+x/jgsmITVqGEr/upEIIOQbtgxOMAxkZorGKxuwJrpObtRgMFAPaHEuYt0InapvietU
	N61BgIuMCg6OLfnq0JBq/mrXAP4UL/LjBDb18qPf+WvDPapqqdA/mNo5cx3rUjXsQW0Ra9QIAjq
	YdloRiUbSWpDJ1gyyZEbZaq8e7dRrWoEb2F/hQ598eI7NhtXRDO2RjZhNvKrEIRciPIQczlVD1R
	esaaJavJ/+hwZCxWsU5DRwE6HWlrNdIEn9XuuxuIcbpZYe+llejFUZpJfp8M1Gw9/lsXrep9EnF
	fNYr394Hi
X-Received: by 2002:a67:ea0e:0:b0:7aa:b962:a4e7 with SMTP id ada2fe7eead31-7af1f617c94mr662206137.36.1790251646647;
        Thu, 24 Sep 2026 05:07:26 -0700 (PDT)
X-Received: by 2002:a67:ea0e:0:b0:7aa:b962:a4e7 with SMTP id ada2fe7eead31-7af1f617c94mr662191137.36.1790251645988;
        Thu, 24 Sep 2026 05:07:25 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:07:25 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:18 +0300
Subject: [PATCH v2 06/48] clk: qcom: dispcc-sc8280xp: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-6-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2398;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Xg8yZ9bCiuy7/hKy2GSjfWfNlvm/K4g4ya5dCO9sfGc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJHe9D/k6B6U1f7PGu7o8OdohElxcEes2Y11
 Ne6n8dhUlGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSRwAKCRAbX0TJAJUV
 VlU/D/4zZHPfTsvmsA0NiyofHRP73lkYmvGuCSEJRSxd7o0khdehDfcHltdZ3a0mXkbCKBB4Sbz
 mXvn2PSZDdWyBRcoSI2xG3uZo0XaNjD2RyHEM2jz211//t02D78BpuUoXHJC5zED2JiGhTX7Lll
 0tDgGlgJb1q1Sim9bhzhqsUg+AiqmxBr4wIcQCaBFrbXd4rgufo6dWwrVySRfWGWPRN6UxqrWi7
 aPP4RwiUiyKGV/yefEInWFVV6ASdkm/WnjQixLNf0ICN2R6bgEO4KPTeqoi7JrHFkFxuoJmnduS
 2i2tJsQY2tkhuHILhihWayuzERlZfuiAnmh4BcxuNe1NQfgxcEKOxfB0M19jQ6aeTfuqBSDT8cz
 QqWoTBPlbB5HV4FhWo4FVoway1l8mwmjKHiTCudsIMe/XEvR7Avu6lIMA+SRp0XId1hYJJs0CJa
 EdsAPYgmUTwgUBOc7cIoe9NMuf/BopP/r19t7bDN9b3Ax+HPNmY99QYKQL+OxUnD4UaRpz9okpY
 pK4jCYzUTiiQJ/iQc/QgT2sr0v20T4LMPotmzWYm9JfCzByYn3/gzT4irdfjKXUTxzjPwym9Ygs
 g5qqio0an9Bji44uAP0S1P1d2JKRv3V5xVqFWYJ8m/fwZWndWgypbiCkwnNTYf8IO1U1W1Pm/yq
 PJyODDzHYaBTzAw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: ig885wwlERX518kS3WlY0LED1eAIiejG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX845z3SapNYtk
 gXd/4jCW2mJcSHK8ouOK9Te+L/BeMbPQqWh7mnq/rO+DsNlSrSW5Qy3RnhL/l6iENvHR9W/e1hS
 VRJxjxoaeqURSyhRYQiFihq5gljOSP5P+Kac/5jn304k5Dvh8HycG9CELbs/4/f9BsSPE089sjL
 DXW7g8Nq996ziJIp+XqRpOtWC4CDbvN9Nj8iHfF4mSan71DrTynulRIsRh0OVy8hdoGNU6cUveB
 m/aUs31MkxO851tNk3RkDc004NsgPEagcgDlRTGFAfS0I1Dty62ELKjDrtMYJbWguXM+trdmZYc
 qzHsqmYekA0o6VGZLCurhqiGjoaH/uwS2v051Bqlkf5hnIWBiy6wlcWSQCM7oN5RNs1rCowP+li
 fmjMQZSywyd9oDwes/3RHwCzhHpD8RFqNCbOwhRDzj8dE7Qko+/y+5GNiZDFpDKRab4CPWQKvXM
 qre3dIrw1MxL1PuUEdg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX6rtHmvhGJMEU
 TosHYouHLHfSaymI8bDMMkdatIAvZ/ZxP0ebbkYLQIPY/+vlKeO/Ffj2Arw0lzyhZizmzms8t3W
 8LnRXXao7WVqUyZrz9nD6wJ+gWB5qn4=
X-Proofpoint-ORIG-GUID: ig885wwlERX518kS3WlY0LED1eAIiejG
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab5127f cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=JaSVaRig_KI77aDXWKAA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Share the CBCR data between the two display controller descriptors. The
XO branch is now enabled by the common probe before clock registration.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-sc8280xp.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sc8280xp.c b/drivers/clk/qcom/dispcc-sc8280xp.c
index 96609bd5233f..96b3e5505279 100644
--- a/drivers/clk/qcom/dispcc-sc8280xp.c
+++ b/drivers/clk/qcom/dispcc-sc8280xp.c
@@ -3108,7 +3108,17 @@ static const struct regmap_config disp_cc_sc8280xp_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 disp_cc_sc8280xp_critical_cbcrs[] = {
+	0x605c, /* DISP_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data disp_cc_sc8280xp_driver_data = {
+	.clk_cbcrs = disp_cc_sc8280xp_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_sc8280xp_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp0_cc_sc8280xp_desc = {
+	.driver_data = &disp_cc_sc8280xp_driver_data,
 	.config = &disp_cc_sc8280xp_regmap_config,
 	.clks = disp0_cc_sc8280xp_clocks,
 	.num_clks = ARRAY_SIZE(disp0_cc_sc8280xp_clocks),
@@ -3119,6 +3129,7 @@ static const struct qcom_cc_desc disp0_cc_sc8280xp_desc = {
 };
 
 static const struct qcom_cc_desc disp1_cc_sc8280xp_desc = {
+	.driver_data = &disp_cc_sc8280xp_driver_data,
 	.config = &disp_cc_sc8280xp_regmap_config,
 	.clks = disp1_cc_sc8280xp_clocks,
 	.num_clks = ARRAY_SIZE(disp1_cc_sc8280xp_clocks),
@@ -3167,13 +3178,8 @@ static int disp_cc_sc8280xp_probe(struct platform_device *pdev)
 	clk_lucid_pll_configure(clkr_to_alpha_clk_pll(desc->clks[DISP_CC_PLL2]), regmap, &disp_cc_pll2_config);
 
 	ret = qcom_cc_really_probe(&pdev->dev, desc, regmap);
-	if (ret) {
+	if (ret)
 		dev_err(&pdev->dev, "Failed to register display clock controller\n");
-		goto out_pm_runtime_put;
-	}
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x605c); /* DISP_CC_XO_CLK */
 
 out_pm_runtime_put:
 	pm_runtime_put_sync(&pdev->dev);

-- 
2.54.0

