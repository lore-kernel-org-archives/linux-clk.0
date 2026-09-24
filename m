Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C27447FB13
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251688; cv=none; b=gjsF7ScFITWkge/QMqixzN1z58tPzqPn8hgTf2vCBJHOuSR5/5QaCXdSLrHGGux5qj0cXd+sKqlz99Be7BhowQKsq/a1AGDZ9qxKQKq7mFp9Qt4Ha7xhZAa2K80MJU42ZHXF8xbLmDNnEQqqjmm9wqG+KBFg12VBr2vf2wBmLso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251688; c=relaxed/simple;
	bh=CQXJofXOmMw3cH+dS3fdFOgmgQjockpxZA9akNR6TvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gKzO0MxBwosN2yCTt6ojvDUDQhjTIXiNlRJyartcL2U1Be9MyXVDDgkeXBSBo01j+XnFDbxyUAlLoldJa1D1bseSHX4tFjDan4K2m2E0VBg8nJj4U8Y9Plh8XkGzZhagOqyGHZ89p1n8ghqkQPGU0PqZUREcnYPXO9+01MBfRGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bCJZGym9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hp9JcKti; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bCJZGym9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hp9JcKti"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4XCw3134063
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ID/czw8MMUTt+UZF4aIlgMGUS18e0Go/4J1TeukaYX8=; b=bCJZGym9ZJXX8NO0
	9JoZJHuapsmSf0516wZ+cQSu1ltEH4yVVTEpzfCYAKhrpXMv7e6IxgsmsDFRO5Ya
	z0MgOG3TbmmOnCs31sowgwP2QVQM5R0wUyHc+QJfz0LfEaObcE9bIm/hEqR0lswE
	r6RXKBQJE2w09JcP4ROezVELTYbEjOBwvAxZitBkndMUsgr5xkiXRmrhy7Iyr/6W
	dN1YeyjMHY3tE2ErtrYQzTVwFtVkhNQB+8drZW4jI4sMgxdXAycBK/xJO8BMU+Pt
	R2bVCwB0W6rYMrnGAPGA78DHYSsRs84chYiL5cRsMZ5JKcP6iU/T9ksypB5GIxA8
	LLmGBw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1raggek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:07:59 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c833d4bd04so592838e0c.3
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 05:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251678; x=1790856478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ID/czw8MMUTt+UZF4aIlgMGUS18e0Go/4J1TeukaYX8=;
        b=hp9JcKtiQuclGs+oeGhubfjJptWNVY5XPFqVAAC1qdFr8Dr2YAKaM+cpL13DUuuJX0
         wDQwYeOA3FhZPaeYBu/UkGGsfwXAQLTKE43xnP/LT5dQkzYMEvKZNsrBEjLEmhEvSqvW
         17AMo3S6swejmuNmWQbu6dpCCUVkn25i5cti9W1bZukSc0sPqnc6soWFFfwC9761FChq
         NawsNqu5uRkBpTQQNYP2xXJgXrUrSCsXkq+qcQVm1UTg8flH19HSLIl/194o5Nas+QwT
         y361ZkdBBqlRj6mPn19EnwO1V0WsA2kANUriWwYLMgHJLfMMwj2slkuShCvIpblxmO6O
         EJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251678; x=1790856478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ID/czw8MMUTt+UZF4aIlgMGUS18e0Go/4J1TeukaYX8=;
        b=j014d1bH2dblwLDaMDCdv0jNxXlB1TIi3t9AgF6j67hgG9XU5FVRWPBwAJ2gg2HLSj
         IJ2DxAUYchLvp+3szgM2W0UBvxK7+YcGh0JwoPSfb8GAP+Rp7CAjzfIJy/rX43bwNm6V
         EZZHHdLNr0eX04b5BxyVGVXuhgB1aWXo3b7U9w5VJJ/380f+Abs1AvkOXikMnwaLJn3d
         IMAriQ/MCY9Afybp3WJ1jv4pm3bd34y3uypkQL4ZLWIc0twO72GYDXh7TFZmM20mqb7T
         Qdr8YODG0NfDF3oQ3Uce/8zGHRzZ7pla1E3Zdgxni5WlN6+1LR2Wa9qUgBqI01vpJTwq
         kIBw==
X-Forwarded-Encrypted: i=1; AKwUvBzMtW+KwPSHIUUfMhgL3Bft3dwYBfJS2w8p2JoHGwxVaaaURWIqq7r4VHFRj4DTZCY8WR+V/v4uOF4=@vger.kernel.org
X-Gm-Message-State: AFuF++nMvnGrFEjzQYxmgDsC2ERQPSTKvLwndVFOfubd7Q13C1tYQAtY
	VvC/fhW7mgA/BLPPu5UNBt/DlpdDcmPr2qupjL+oyA3lV/JMD76GyqO0M1rWbA9t3tENT6Zb0iK
	hSJSm3KneVlGbklBmeNE96AbPQgHZm5b5ZomcoeJyFIpD2efzo6+Y3IeHnvIqfdE=
X-Gm-Gg: AYBFou2e+pk7cYxBsVFfWBS8m6nBKREBrwiTlqEhJ7xl+cgZm6buDrtBYHAUb+b1Ez7
	Lew2kfEcNLzvgsGB065SEj+hWFd97Fg6S0KiRi/jwgWAEjsTzkr9YYtkLL/3xIGtqGCPsnX35tk
	C/bNS8E5VI76m8q42vasL1alqxz2pqEKsjQ8Jr5g1ZMk0bB1CRsD7CEmfRwjopEnEBkv1JJstqy
	vxd1rT2ntM1aCq0+/eBKWFVX6stVuPSz8AeNbAonHNZ48TqFpZvtaue86EfA5c5ls9F4etjlh2O
	DEhedd7xx5wHQhZ5rCg4/KDgF6UJx3jSL9RYea+epE0OCZHZX0f2jTXZD8TN9f+5L61uGh+swsP
	571PY5lky
X-Received: by 2002:a05:6102:3ed1:b0:7a7:79c5:d465 with SMTP id ada2fe7eead31-7af1973816amr1126125137.0.1790251678181;
        Thu, 24 Sep 2026 05:07:58 -0700 (PDT)
X-Received: by 2002:a05:6102:3ed1:b0:7a7:79c5:d465 with SMTP id ada2fe7eead31-7af1973816amr1126101137.0.1790251677583;
        Thu, 24 Sep 2026 05:07:57 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:07:56 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:27 +0300
Subject: [PATCH v2 15/48] clk: qcom: dispcc1-sa8775p: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-15-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1985;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=CQXJofXOmMw3cH+dS3fdFOgmgQjockpxZA9akNR6TvM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJQy5ONo70EP64WXP3iFcC24rUeNgy+70UOL
 qaUpPGrSEGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSUAAKCRAbX0TJAJUV
 Vjy5EACb6acFzFedBqO2kT8nPcKyzUgODZu38TyD0NDJevhgdbIuqkwqWTsRBpSJbbKbmF2jkGA
 cZVK/EPsR4QaA/CivWCyeCPCyFIpvmQH4itELw/QqI+6eA55K3wVmo192gp7VYw3f7nsKT3M8qI
 0SBVBAddI5ZQg5mV1b5hUd+vDlcqh6hRUfju43B3i6FGmLWbyTMCOtArvQvtMa5FGpvXNxpuJhJ
 HwcmHxkrwtY6zBTwPtToI5U6TRYP+Ipan91+mSbXLvdL6+z/Pa1Qti2rYc7nxfc+y1yGvGZtKYj
 rzDOCwWKb1Yy0veR1UO3h9yVCiCS/Dn4byJwPkyZoNlY0tAPKvR6ap17yHDh0IPo3UdGm78NB6E
 J+k5FTV25IFViabvnjyPgxUw2z7Ppm3TsTLkQkIbsAUl+9GaGGDQzHs8o9YknscNRbjm5Y4fOiN
 wZFi/YE82KOHb1xriI/wMYoR+GKp+fgbd334SKfLbP+1NWhN6ATjYETQpfSFf7SZ6tNyWb5ye8A
 jVH47IxCGLD37G/NQi8IhZ+2uY3+0IgEFehas9iR5STdqWx6tyLfJ1WT8KLAbq9MLTVlxTptKNF
 Tm4bwM/+puWBTVM50wZKJQQJLmFkLvzbAq5wU7wUbN9HH9HHHuSkG6DMidBNLHOJlHN/8KV4+tz
 HMHXJxj6IKo9kvQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXyXeY4pMcyHGs
 QHOhpNWb4yk01Crcx3k1+0QNyeIMwc6OjhaKhNu3QTqaPgdaIsHe3dhUcD4v875SsDjOB/A+zAM
 /CWpVL2daLdpdD7hc9l3Cc9ydbz+4IcXyz4QW99+LovnnJe3TYWCTEeFxSVp5pnwNZHsH19KdtB
 39rwnNt7GX8RJZwKDf6YK/cF+F0/Fllr6sZm45y0+7jANF626EpX39gcJdldeI0MDnybvblpqRD
 U9JlDOqHeVXSOtZPMpWAmz4VFfGtFUQL3vubQET6DvevrPD8tu8ba6IQo1y2WrToUWCLhPE2zrg
 vburo0TU2234GJxf4SJy1Ow3unmYBG1Eyxp2zNCd/qoP6qMGeBZPoDCGTtm04ywm3xmoLWqMeVz
 uPYp6WhgRkg6NwE3Kkec4dW3CJGu61f5IKURaZR8SbIJYuve/8me7xf/EDGwT3cDVPTbBdOsgSh
 8Oz+m69EWZr6pQYoqwQ==
X-Proofpoint-ORIG-GUID: Frw0Lu6wK5oSvSY0PXuybxoIZLz3175A
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXy009t4NFLrxk
 X5BN3giya9qpSh5i/1EcimcZlTmEUxNz0czQgRFdVAN+sqbcc60xvOvlUnKnulgmd8bWaFMjph2
 TzIiF41jNn9AnpyXdaDYAwDSxidOIvk=
X-Authority-Analysis: v=2.4 cv=fvpJ914f c=1 sm=1 tr=0 ts=6ab5129f cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=xG6gKK67fXx6DpdPwiUA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: Frw0Lu6wK5oSvSY0PXuybxoIZLz3175A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc1-sa8775p.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/dispcc1-sa8775p.c b/drivers/clk/qcom/dispcc1-sa8775p.c
index 58008c1afc76..330d953b5e9e 100644
--- a/drivers/clk/qcom/dispcc1-sa8775p.c
+++ b/drivers/clk/qcom/dispcc1-sa8775p.c
@@ -1414,7 +1414,18 @@ static const struct regmap_config disp_cc_1_sa8775p_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 disp_cc_1_sa8775p_critical_cbcrs[] = {
+	0xc070, /* MDSS_1_DISP_CC_SLEEP_CLK */
+	0xc054, /* MDSS_1_DISP_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data disp_cc_1_sa8775p_driver_data = {
+	.clk_cbcrs = disp_cc_1_sa8775p_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_1_sa8775p_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_1_sa8775p_desc = {
+	.driver_data = &disp_cc_1_sa8775p_driver_data,
 	.config = &disp_cc_1_sa8775p_regmap_config,
 	.clks = disp_cc_1_sa8775p_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_1_sa8775p_clocks),
@@ -1452,10 +1463,6 @@ static int disp_cc_1_sa8775p_probe(struct platform_device *pdev)
 	clk_lucid_evo_pll_configure(&mdss_1_disp_cc_pll0, regmap, &mdss_1_disp_cc_pll0_config);
 	clk_lucid_evo_pll_configure(&mdss_1_disp_cc_pll1, regmap, &mdss_1_disp_cc_pll1_config);
 
-	/* Keep some clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0xc070); /* MDSS_1_DISP_CC_SLEEP_CLK */
-	qcom_branch_set_clk_en(regmap, 0xc054); /* MDSS_1_DISP_CC_XO_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_1_sa8775p_desc, regmap);
 
 	pm_runtime_put(&pdev->dev);

-- 
2.54.0

