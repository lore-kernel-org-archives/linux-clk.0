Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F87744D6B4
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554598; cv=none; b=Z+9ePYP5TwcEYPiGcWHujLHQxPOOkLtd83qZ2o+VgamFT17+Vy5FSpL2uYO8ZO/JuI3Cyc10KqR7lKWCAvV/MOj5yLFVm/Y5ehgYO4wUGdrr3Jq58Zj9fyPd1n8wNt5++qGXnKUlt15SobcDe/tRN5nj3bH9ZeQ1F6dGzXQbYmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554598; c=relaxed/simple;
	bh=9l1yH/TyKTh0nUOs+WYEyPBm3fUdzP6RQ05SEUY8blc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jWSbAj/gLbFEl50NGEJ6qot5aDpCTr7hoFPbPNe6LdbE4cz6GNjehhTFaXF2IdJ5Me95FOkw5npiaCWY6c5LGmzk3cGSzmO+Z/7JPTX3Ga8bekdwE55vuP7cJJ8tRrr9Xax6HvNcMEh+0TndcpRXYQydJbQ+Dg9Sv0a2Tm+BEHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=As8qx8wG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dDxiHwML; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="As8qx8wG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dDxiHwML"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G93AOU2658235
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V8iVqh0BF8H+A5TE1wGLKJj3rQu75RTalRcZa+kjp0Y=; b=As8qx8wG8+S3Sb/3
	gPGLb5VJX2A4/Oj+P4fddEqQKyvh30zmEy6rmOrBsF0LbQVat96eIm3OLeohXxhf
	VpCoIReVHSCpx2TwrDFR1ihe97fDovm+Cs6loaEREXdMJ8VaqsmT0WIcA6PtNIbZ
	pOmum28gGREBxW82ivQLqnhZs3qm1UKixWxVPyv7JW8CZLgDadZ6eeI5u44qwXgB
	C4Dep6/hYRJCfgySnT3qdbf097D72V7JuQAqBaeP77jZl/Cs7nZ3wcLzwLSYo/Kq
	yEtGJIPfTx1ziTqDmgWxOoA2xqgLzY02svlS8GUKbGvWfk+G8azHp4BuRkCNrTt6
	4WHyFQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqftujand-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936e393061dso868031385a.2
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554572; x=1790159372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V8iVqh0BF8H+A5TE1wGLKJj3rQu75RTalRcZa+kjp0Y=;
        b=dDxiHwMLz6yXFpZ8UVPG6N2D37Sfyr/JpYyH+QfvREZMa8Nm6N7gw8dgqwro/If+Jk
         LgF+mMWVAOQE7Lipx1M5xPhIqC4COvMmpXuKNkTdaM3cecvj6MaLKzNwlt9EqbjX6Klg
         7Q5mMik8yOofQbIW1TuhA92O1PLyjC+B0lEu3k8P6lIqxmFWfkpDPX8uGNLliQxA+XhT
         k/pt5gAfDzAuUbV4qJ+d4cU6uWJNgzjYarA7xg10tfxEbYhnUkmTZLKfBq76aHpuHk3O
         QpBGXpNiVhm+3X8Erpsx0flf5CA7jPE8f+WJLxZSVTelKexCthmS8lnA+i0QEzyCkxHu
         t2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554572; x=1790159372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V8iVqh0BF8H+A5TE1wGLKJj3rQu75RTalRcZa+kjp0Y=;
        b=mDM/M+MQOENbnGCiM9aIUIEKg4cbHdgPK2KpO8ee4IK7dBen9bjIt+xtOlcw1RPHZ6
         iJbKSSpIipe5ZRGBixh/J3RHF5bp3TFHLhp+4rPPwCE802/r41XXBb2uwP/sYY+N1VUM
         aj+HcjbcxIj+OLDdpmMKNtrfSa28XmsSEftwVEn7vgcu/DFzHNorDpBSZLxA9HnYXc/s
         WEQnV/oqb4xBE6dgyqjQsz2bGpo4DripOfSLOUMcpGLG0Jv9CxDcPbgLmJEWPUYDt4kM
         81kDRmm7J2eWtDd/ikdWETSDTxS6RV7UxLfhCSHAbaFr6Y+/UMZWq/pNuz8dsCQYkhrs
         rbpQ==
X-Forwarded-Encrypted: i=1; AKwUvBw31AU4F43yYm2p3GDWW7t0RszhmGNW70CHFdFoec86frPJAxZ75BSfksQn2z7a4K49UhTb+Nn8RmU=@vger.kernel.org
X-Gm-Message-State: AFuF++nnrUTbHSifIZezAwMbmyTl+hF/Gmf1dG2zRUNKJjjxmU4Psd6T
	WuEBOAg6WIdUfK2GFbnMoyafF2e4HX1qgyj+Vivs4yvI64v3RRSTxU8Zie/5W69PDAqomCpDBsk
	cmflqL/Mt9qPr9S6zv7gkdeKhHrPU5ZyvRoPDeESlYQN0JBaGwiDn5BSoJ2+xGHg=
X-Gm-Gg: AYBFou1OmWn9zktN+xTI738Gz3qovlEX10GJfUa60Gy3iTtL6P0Q/SUXuv5HdrSPliT
	1+JwVkCnmXt2CfZzmEFKLi0MhuUGOVJz8alO2s+0aZVV8dEtzbaHmKbh1cLe0+nCqG68wr2kOo4
	CHxnSUmWs3qE4V9hYDeu4zLQppqH4+kQJ7+pMCxShP8HJfV0kQAOH6oxYbLoEn2NHpAfUAcPBJD
	VQrJXMd8z8kgTpQF48YYrkCjC1QRQv+Se8GuKIGLsNTFyKuradZSEL4wl2JO7R6D4jSTmr4/YTX
	c/MyfoGUZybnT6CVN6nRkdoUCVGY7PGdvdNlH7xjt+lPJUEj0Vq4k3JhQH3P1uLJiiq92QRcF/W
	Mh05AAPw=
X-Received: by 2002:a05:620a:2809:b0:915:a953:4b9c with SMTP id af79cd13be357-93bb76e380cmr318183485a.3.1789554572044;
        Wed, 16 Sep 2026 03:29:32 -0700 (PDT)
X-Received: by 2002:a05:620a:2809:b0:915:a953:4b9c with SMTP id af79cd13be357-93bb76e380cmr318179385a.3.1789554571547;
        Wed, 16 Sep 2026 03:29:31 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:30 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:24 +0300
Subject: [PATCH 08/48] clk: qcom: dispcc-sm6115: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-8-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1674;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=9l1yH/TyKTh0nUOs+WYEyPBm3fUdzP6RQ05SEUY8blc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9S6BRQIIkNxjkcRFfOiKoohORO+HWCy340Z
 uuKMPWV1WmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvUgAKCRAbX0TJAJUV
 VkDHD/9Z93CpqY6+tb/srAdImnb6HGdyc7Mmd3tZeHaweH1AJ4fTOVwDX5NA7FrotdT/mTHpCe7
 ZNNvPmkJW4T927L75GM4ShNmQV1CNEPaf8TxHRzj/h8UVrjAYA0DnE7W5GOuLU+ygqUZJkesB4V
 LFAHv+VqCWnEN93XFYIjJUQOiJMkF8YcqRmUa8j+Xx9pdXDdem6K1WARcIpl8utMIkHdykUAF9v
 u/rjpl/TAGW0KJ6c2vz54+onrdC92z9O5SFDPaHf74jhQnr7ncd9l7CEIv1OrK2YHqxn7Kj+PxE
 q1PFdnjtC82iOVd72clvFwZnt3bGKAd7J2jB/yEvN6UUzS7jlmcac9JUmADz2hJdzHsHg6huT3T
 1SSUVj/mcCG/YNHFdHUTp7x07vxEQxAG/Bm5yqJmqT+hCbssn080rnL7impqM2jOC9rlEU5reb8
 /MBOT3ECrmTdNNW1xlPdfBUxpnlKZ5VjjwSV3uadhhBJve3npcMCJzj4b3e7ntR98gQzT7kELka
 GkuH5hPrEBy+RSVxi/V/I95fsUJEY0/xEFgE2Nfgs3026HMGMaWWvwniTXmxTIb100uCyZ8hUd3
 JsizQ5CQ8GaheRudJpq+gdkYfC3fp2QCDyR8+t+V88hlA5tQCceOYW7m8zBP5/y3adxer2DWuZp
 whrpvzGU/Lx6tpg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXw5dZYYgjnDWq
 44p7bpYtX1cebOJin0gIF1yZUcdw7ViZCK28J/v1vaTA3sNfIicFl4ciMK26+Zak5c4nnwkKL27
 QC1lLW/7bvme5j4svvs8xY3Zey728mKhAY00wkxgQIVC9gQxbcG7eGYXk7jrQVxBhep8SIe2SCq
 xKs3aSmNrXdl8t2zDrKKkEfpRq6Y5ps+GRebohOWz+VHxxi6jSR9+fqA1LTtlpcgUVKouS3c0/h
 a8+mRDC8FB5lkucOlDdAqnQH9hVl5v2kJE+By4KDKfC8SEqIWGxBTueeQMa/xrt4VPcCE0zxbe+
 UUJbpv+YHwuLIXoZwPKOlyg7KbPHbuS0KsvnitXPdpJkPaJQJtyyR3IV+J3TQspy2TG0pyRtkj2
 Fs2Lidp3zuQP9eJk2XEzR17OzBUequ0Yzi4TJHVZqQeFHMeVoKxcLnxhuDSalxbaT+NR3zhuyyL
 AzLoo2BERx5xUrbhu4w==
X-Authority-Analysis: v=2.4 cv=a5ulZkSF c=1 sm=1 tr=0 ts=6aaa6f8c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=zyovT9EyBzSEY6lazxoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX4jzqP+Qu8u7b
 zzyw/mIRm8vyvlR7UtZnev7CL4hOuZMZnO2zf1sGrJ1MamPs99p8QZ5JV5H/aV10lemnZRgejOO
 MflTPcUw7P0HTGcqofu1jEgnblhZpgc=
X-Proofpoint-GUID: sNfYs7Ovlot3NEK-tqJm5itZCdERc3g1
X-Proofpoint-ORIG-GUID: sNfYs7Ovlot3NEK-tqJm5itZCdERc3g1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-sm6115.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm6115.c b/drivers/clk/qcom/dispcc-sm6115.c
index 9a7b8ad646ed..f6f5edf07f03 100644
--- a/drivers/clk/qcom/dispcc-sm6115.c
+++ b/drivers/clk/qcom/dispcc-sm6115.c
@@ -561,7 +561,17 @@ static const struct regmap_config disp_cc_sm6115_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 disp_cc_sm6115_critical_cbcrs[] = {
+	0x604c, /* DISP_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data disp_cc_sm6115_driver_data = {
+	.clk_cbcrs = disp_cc_sm6115_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_sm6115_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_sm6115_desc = {
+	.driver_data = &disp_cc_sm6115_driver_data,
 	.config = &disp_cc_sm6115_regmap_config,
 	.clks = disp_cc_sm6115_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_sm6115_clocks),
@@ -588,9 +598,6 @@ static int disp_cc_sm6115_probe(struct platform_device *pdev)
 
 	clk_alpha_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x604c); /* DISP_CC_XO_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_sm6115_desc, regmap);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register DISP CC clocks\n");

-- 
2.54.0

