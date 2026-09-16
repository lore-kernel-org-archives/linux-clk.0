Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219094CC624
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554636; cv=none; b=Fv1JwVCdqWI6NQqnEfTMutTt4H8GmstbVkuZJxniGIs82ZPXCgJBZF4h9OcHQTdnH77BfXSjUZcIul3iYssGFnWxLHxLBQ8ldy5ePeJQFJslQtjO6J6s8P1h69VlNxhD+QFUFuUkxJ6sJPvQTpIAvyfeDb3FjuLY6SKn9dJwVVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554636; c=relaxed/simple;
	bh=lfSrimWZThdcUoiBKBc73gKP6/y+jyHpWjqj21yuyYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KEqablcbpQ4r1BN+8khKwCmhqUSL1AQ+aiYncGbRuyRoL16PddRUavaUEc53XLtFQ6bu2b+8QhiLxrPuBA0bZhDnpT0qMwsQOWsaEPhtC8zzAhcsWLo9Riy6lyTq9Ru103ni8Dgf0CyPuN4isA3I89PpLvZ9RHHI4aZg5YMztI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A5Ki0Mzp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kJCP8q3B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A5Ki0Mzp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kJCP8q3B"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92nHW978264
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aV8OrKimcjcHkzC+e+EE71QbF1fQjuljOHzNPxa4Twk=; b=A5Ki0MzpoodGdllX
	U3JchBtdnLx5MePx4+2pAXX82gkuEFDtHl7v4EpblmWeBxR6hiC6PSi9wk9WTYAv
	0L7QoecIxBvJ23rBQegwqiPeO6bs4xH1xuh+ZdfnrDkSRZnVvHuymllcLFGpZS/d
	kOGR88Lh17hN7v2Wudsa0BtwT+9EIBTW8M2npHRLhMNMLmjxNhtMwY7bRMpX0vSy
	QG2933pmn0nwYPcL4zoeCvv49UBiC4pROrlQFGMTlhAUTVfH8ZwE2OjfM5X7F8wP
	h8iTLp8Vlb/37zNGmYffNr5DOxNcsO3a/ZyLOOdI5shGcamYvOn3ZOvUYGZsrj6X
	YB7LbQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqqp3rfuf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9390a2c895bso1292387685a.0
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554610; x=1790159410; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aV8OrKimcjcHkzC+e+EE71QbF1fQjuljOHzNPxa4Twk=;
        b=kJCP8q3BKtSTJPUMIfPmHpgnJjr48S3Dp5z4SS3+zeIlgX/cJvpug/swJ6wwtJS7nD
         s1xK1Xz4XyVJWbX65qs59Uro54mWuHOLVf6gstRPGCcXqjHTzQUvDynOhH+uXK+Umkp3
         DQNZhOM3REbc22Cbv/Tkd/PaLQcA2zN5s4Lq6gJmuyN3z7iD/S6/q2Dtc476RxTCpAQQ
         pLpjtbLmYTt6OZOCkh1q6ussCpvygYXHEcNklrU5rNkAxELvFJKRdFVBK9/9GeSknKVw
         RsUU+towzer4CY2A48IZ/aMNFAar70qlyDgLjnBuTSkk5NuluBUpptsd2t9fK4urn2/n
         t++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554610; x=1790159410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aV8OrKimcjcHkzC+e+EE71QbF1fQjuljOHzNPxa4Twk=;
        b=GSDHtZnBUyMvCGYpVDp9wSa5S94EXCBWHqxyVn9uI1cSb41PB940a+HtrFlx7z1D4B
         8TGc8ceu8QtGJgjJFPUi1CWN2Ur0XISN5UbcKN5n/x2QZjYXB2MlbSP0Nu0NRxuBGN/T
         gZN6HrE4eHanLvjMbHnvv+RUCPsNJqzPdCSBCsh1gBmXhmFn1+ABsWXiW3ctqMRQSlph
         6k3WYfOaATaYCrFWXSd5tCWODPwCRfWdqzR9TabS8vg60+MuXBQwT0Nj/izdKRX01Bzi
         CedBkgVW/8p+E+no4bMvkLzBsFL2NwV/K7CiKaOYp1j9AOlr3V5BVpwX5aHxpapVZmeE
         YleQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNx5uUbWfHgAepWaD3zkcBLz09gcyjpJFx1PZi8QXmCopDgSoDbNp+11rR0siIBGNrsK3S6qgQlgE=@vger.kernel.org
X-Gm-Message-State: AFuF++mbNPBCoiXgSl9aNCBCyOWYnHH/OdGuJhYAc0l5gHPA1QTkr4Bu
	VaSkDVgg9rLEKZgIxrg5JruCMN6kG38//bP/RBjnQxkG0QDrhOFz58kD9sruaXRwRXsWs7g/X3i
	TpVxx21hvq+y29r40QA3MT/0pwpu88CkCcg3uQ77GbZgCQGaNstyKdU4qhvfytAQ=
X-Gm-Gg: AYBFou1oH8numWb/SDLTT6kfCZcoBpDHtf00zrch4xzOFSVqTP2/e6jYq2M7MlKaxh5
	eNg+hpx6wl3uuYN1emPAjRgUA+XKNHajAaobH8BbR+mDx8hTJqxOGKlwokhJoyFIv6uB+uPmIgd
	aTdyO4e1WMiDt47sbxoPPjM13LRlZzqIa8a6R1Y1AVW9UdbFwmf/84K6IJQXg+24t3EzxI5/N8j
	rHxt90h9bUxFYhijX8dEuuNHHTq56fzIxemCluzk1OFtK+DvcqgCHuxpVwn3u+q1Bpuk4wd3/DD
	2qnNy0NjEPJG/RXBjLiAJr2j9F6fw0tTn/T8Gbn3pHkIE3DAOJlvtbTeXqkiP4MEiMWt22TllqE
	vuP0Ys4E=
X-Received: by 2002:a05:620a:6889:b0:939:aa01:99fe with SMTP id af79cd13be357-93bb78d5a7emr323637085a.51.1789554609834;
        Wed, 16 Sep 2026 03:30:09 -0700 (PDT)
X-Received: by 2002:a05:620a:6889:b0:939:aa01:99fe with SMTP id af79cd13be357-93bb78d5a7emr323629085a.51.1789554609332;
        Wed, 16 Sep 2026 03:30:09 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:08 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:43 +0300
Subject: [PATCH 27/48] clk: qcom: gcc-sm6375: Use common clock controller
 probe data
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-27-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3185;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=lfSrimWZThdcUoiBKBc73gKP6/y+jyHpWjqj21yuyYs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9l6HFWpAPHkes9ACaOzpzl++9pwX+YBsceb
 tFOb75yboKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvZQAKCRAbX0TJAJUV
 Vrm9D/9DnV4vBZ/oj7sp7jHCORWOIsaiKza+HEkKyGMwSqP9G9YEeqJflyn7Z8WXpVvB7LO9n2v
 Ptvmjm7M6cqsdRCFZDcBAvEsQ4dimlB7lt3WZM82djoqhne71bVqsswgVyb8smL09D6P9awaoLe
 gc0X9QpKD00O6iKbTtePPkQjdZ4qMuFB28LiTe5D7v5C37sFMYQXRmjtQE2AoBVcpgJMQtL+Ny+
 gUDERQ7jNx6GDaOGPiONsgX4QlO+CXscFC+7pm//Qg8UNs61RvrPlAy04tXhR6vpoquiVokala1
 Szt0EiJGSnfNPcH07d5HLxLXTlg9Jy54Y8a0LwLbwoxPGIjnui45RhYYOJI14WlCpt9kUhGKHe5
 0jZKP9Y3xYDy/bwdspKsD1mV/cfNWGBU5YT+oi576r43YeM7uCCy/TsTOrn3cGVeQf2UZpTUZD2
 7PXWW52rvtP8lRqIpkiEA6WoyKucr3L26akLdDHzpdVQPisq2dUGkcudRHXWPch6zGahbiQV/BA
 V4kdwcimwAbYoe9pDG7fiiCjoSoO/BY2sEfjknrjk2V3ZCDKQn8NTmTYafQ+WIbmcWcExCEevbh
 yuyK+hd0gj8r08S709kwRgeMDVr0BVD0539AkyU3oTRlp8f4P4QxKFNE5R8Hu0DmLzNz58yXsBX
 6oWZP2EaceaNacA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXy16IS8txj2tT
 hAInpJYd9tcKACDHcxFZsVLTA8LcJH9I22E5FTxttP3MUX8OFt+KmLVLTzuT9X0bk1dKOueVNQb
 xlvfCCZuPq6VZHTuYPAyN3p0wQfOzPWFZB1eapbbGJCFj7LkD3ljoa6GRhJI80kYjT/q/U3Kk44
 kP/MZ/KXFvjo+9OXSFcaSpOodHUvXoeIDL+l3gxQ8hI5SymKhfHTBOJ3uQjVCKE1Re612jF3paT
 CRgER1zBxNFKJmEXhYUYNg4vguQq3tAb27wYJTY/LlezVCYOnZ5slCqm2GflaY0dO3K2LcXcR4D
 RJyALVDjV5TTK0BaiV7vQDb+85Bh51hyVYGYNz6vw77I9dYOyaYNQ1vCrpZJyJq+d07Fed+FnZW
 MOAtUjKXy2zyObXkBJHedcsIH/iBF9TUmSTAD7VWlpENyoafDcExOb5Nyy+mXnJon9VRXu4V3v7
 NX+hRGfM+DuzmzNfyOA==
X-Proofpoint-GUID: k6TWgQ-q4a14VkiMiFT1TUM_QXYs05ya
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX/Ix1CVBHKPR6
 DljU5AoYyYE4iF0XdvjijFiGCM9/HMfHEFGhVeb5V5ovgXvNQrn00GMD52jeArU1Fxy6paiSOkZ
 aOoVODp15yiXSV7UHgqgl/uskQydgXI=
X-Proofpoint-ORIG-GUID: k6TWgQ-q4a14VkiMiFT1TUM_QXYs05ya
X-Authority-Analysis: v=2.4 cv=F/DC5ahN c=1 sm=1 tr=0 ts=6aaa6fb3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=wnEm36D4OOU7-cSD6GIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Move the always-on branch register offsets into a critical_cbcrs array
and describe the DFS RCGs through qcom_cc_driver_data.

Move the configuration of GPLL10, GPLL11, GPLL8 and GPLL9 into the
clk_regs_configure callback. This preserves the existing ordering of
enabling the always-on branches before configuring these four PLLs.
Using the alpha_plls array instead would configure the PLLs before the
CBCR enables in the common probe path.

Use qcom_cc_probe() to perform the common initialization instead of
open-coding it in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm6375.c | 46 ++++++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm6375.c b/drivers/clk/qcom/gcc-sm6375.c
index f47dc2808095..d125243ac6cb 100644
--- a/drivers/clk/qcom/gcc-sm6375.c
+++ b/drivers/clk/qcom/gcc-sm6375.c
@@ -3853,7 +3853,30 @@ static const struct regmap_config gcc_sm6375_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_sm6375_critical_cbcrs[] = {
+	0x17028, /* GCC_CAMERA_XO_CLK */
+	0x2b004, /* GCC_CPUSS_GNOC_CLK */
+	0x1702c, /* GCC_DISP_XO_CLK */
+};
+
+static void gcc_sm6375_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	clk_lucid_pll_configure(&gpll10, regmap, &gpll10_config);
+	clk_lucid_pll_configure(&gpll11, regmap, &gpll11_config);
+	clk_lucid_pll_configure(&gpll8, regmap, &gpll8_config);
+	clk_zonda_pll_configure(&gpll9, regmap, &gpll9_config);
+}
+
+static const struct qcom_cc_driver_data gcc_sm6375_driver_data = {
+	.clk_cbcrs = gcc_sm6375_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sm6375_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = gcc_sm6375_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sm6375_desc = {
+	.driver_data = &gcc_sm6375_driver_data,
 	.config = &gcc_sm6375_regmap_config,
 	.clks = gcc_sm6375_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sm6375_clocks),
@@ -3871,28 +3894,7 @@ MODULE_DEVICE_TABLE(of, gcc_sm6375_match_table);
 
 static int gcc_sm6375_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sm6375_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks, ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x17028); /* GCC_CAMERA_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x2b004); /* GCC_CPUSS_GNOC_CLK */
-	qcom_branch_set_clk_en(regmap, 0x1702c); /* GCC_DISP_XO_CLK */
-
-	clk_lucid_pll_configure(&gpll10, regmap, &gpll10_config);
-	clk_lucid_pll_configure(&gpll11, regmap, &gpll11_config);
-	clk_lucid_pll_configure(&gpll8, regmap, &gpll8_config);
-	clk_zonda_pll_configure(&gpll9, regmap, &gpll9_config);
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sm6375_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sm6375_desc);
 }
 
 static struct platform_driver gcc_sm6375_driver = {

-- 
2.54.0

