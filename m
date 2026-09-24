Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823A6481235
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251709; cv=none; b=RY1iLtMVy8C/xn5aVG3IbZ8ILQsS2KRXWpSccw3gggargHgpSL6Pi4JOHpyYrxw1VpWxKRuNm/Th90KOmjulW6Hnz9Sn9deejxVXj1YSDDSrNtOaDbZxmnqKws8Mq1hlWT4HcdfrTpnVWxmF+/OlXQaZz7UL8KNQHlWGJwtlfoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251709; c=relaxed/simple;
	bh=SUwK7+vvo8MXx+P0Y4VzWQKFb096limbIcKlkagiwbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RoFrZIE+bl5xxSlboNrOt5laq/Rbyi40b7ZsncxTHTPAOPvjyIQVCoSALo+BJtTy8XOjiB14sXQjtB6R9wzog6ZLaP4kjP6FHVEDqt7XTQ5Fg6peJlZci9FoMexdNQq32XoOvkbsjkhnYeZ1AEaN3KFuwfORIdRklxJte+aIfQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TD8srMCp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xpkgo6/V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TD8srMCp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xpkgo6/V"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4TAY3282810
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o50Vv5ozjRpwsqKEbhb317IFkWHZ+LfKlaV10R8xyQE=; b=TD8srMCpJN15v3Ru
	neaygED6F6WV2D0RNkXTmU0CRf/zGhNd/FB7gz7V+oc1ci7ZJPKGtWF3oDfIwMUl
	bwMr9x9whqZ0OFebCwF+4V2Y3BAjvwkKPKXBIqe3zW1LjaamH9Ws0fsYjIvW1xoy
	x+6n9oQu9E14eQKS8PfruCJgiAvgpe220HqlVpi6pS6QzYV8peZoBSo37Ijj2/Be
	MpQhuyoh4uzz98sRW8XC2nTgJkQKmUVA21iUcFM5sLOLbYedUZJJebIJPR8eD9/o
	XZftX6K8wBSRb0C5E1hTGCkQzEA3jrLK1oOLsYkAchapzwrWQ55D39jeF3JxS6C6
	EzMTDA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvstujfu4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:08:26 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c990236604so611600e0c.0
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 05:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251706; x=1790856506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o50Vv5ozjRpwsqKEbhb317IFkWHZ+LfKlaV10R8xyQE=;
        b=Xpkgo6/VBY6xlKtOr8cvwoduTqV4UZXXmmeG1SSgLC0N4U48sfEsCgO32KAonusJwz
         1hbjZDJQxl3oKGl4JZZeMfP7I+jcoquTibRcYmVbWoAhoPpltFz4JStfsMPpTVHcDfq4
         plSc+rIwmqBfxwPTAspdIIwzrues51x/Od0IFuerCiYs3yBSH46xLBHjNRc6/aU+VHMz
         mhAzsxRmYc+8hY2NM6eh0D0mS5FI7ULRptK0kqaEvZ+vLI8hrSXm7ELuuSkqKZNtcszI
         yjGig2xKoQFhK2Zgwaz1sWUaWWauZPI3SpGFo+KGxHfJmfLgWi7tw6YWwwMgauepwHY2
         bVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251706; x=1790856506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o50Vv5ozjRpwsqKEbhb317IFkWHZ+LfKlaV10R8xyQE=;
        b=Ars9X4853OeIqUc1LxycKDu5wOvgN9TougFDHR59bntWjnMMIe4a9ol6RGZDrA7g4+
         NMNura0azM5DYqgoDEjxqRL4dGbSH85G5Vlw6pZbYq+gEa61mGeDX1G382MFbL6R+7AW
         oPOlsNSXDbY3S/1YJeceBnfJFJ9ruej1D2ZuUzRp+nGkiSyo5Z/2j8Q87VyMcSb74qkQ
         zlZTW1kf0Jx1PqwMCm6l65oGDcamMF7JfMyew9M4F/yLTbQ3mBD/FBUcwIYgdt2893YJ
         WPJuEOuBSqf4JYGDCCed44XEmcZamSJq3aldTdE5+RX2jLWCzqjNHpLpFNNraia+q/NG
         p3FQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbXPsSskwccJPOhNsV52W8EGIKGWq4B+aa6yHAeKZ4bckIkOdnwfdQ+Q+xPFHZcn4YoSwDsCXoh58=@vger.kernel.org
X-Gm-Message-State: AFuF++lacHBngUETeWviNkOsQaKJPxwCzS07pjK4YdSuIGCRzKhUicE/
	HRXqbJCmt3XJUqsvX3i/Irct7T48xgwt65EbQV9/flUyGTchVmjKNbGX82ICL6dwvGWP336YEOs
	9hkl9R7ZXlyVTaql406GtB59+LSshogxAM2CHROmgUUpXNSvoQXYrqm4XfeGnuPQ=
X-Gm-Gg: AYBFou0cH3+1Yg0u0FKdRFY6k3o9IzsioczVn1oOUJeSCUqrjXvQyKqbHUSPtMJHqYz
	1WI5UVuWEyBucBrVoRCa52O9dGu9l6CcQgvzipQ2ku8g+jsuBK5ueaIIJb5W4mtmFRa5d86GXYa
	uuKtDxeLhjr7O0+xpnKVi3t/aQD42XfHJRsGJPGlhhRfIopMsJcLcAI493vySdLtO33SVwx72vS
	KHqygmMPk6v1x5mScrcnSkZFKViQ8iMGiflPv8ey7eY7oTAzm2hBHkhsE7SK0UPaji5v+7BE4q3
	6F4+ioukXJYMGj/12L+AdGP4o2NYuyR8d/hEGeIO7tKxl82Wkt2cr6xQBeXZMXj8rS/ENCrw1lr
	QZoWEndBm
X-Received: by 2002:a05:6102:2d04:b0:7a6:accf:72c1 with SMTP id ada2fe7eead31-7af19740319mr1080102137.0.1790251705504;
        Thu, 24 Sep 2026 05:08:25 -0700 (PDT)
X-Received: by 2002:a05:6102:2d04:b0:7a6:accf:72c1 with SMTP id ada2fe7eead31-7af19740319mr1080086137.0.1790251704877;
        Thu, 24 Sep 2026 05:08:24 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:08:23 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:36 +0300
Subject: [PATCH v2 24/48] clk: qcom: gcc-sdx65: Use common clock controller
 probe data
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-24-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2392;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=SUwK7+vvo8MXx+P0Y4VzWQKFb096limbIcKlkagiwbo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJY86AicJNhLqrdq1luztbEgTGLOJtDxvzpX
 Q7HM85vxV2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSWAAKCRAbX0TJAJUV
 Vi8TEACE/mcrDGNz4VuYk452D3EH478DgF9c8SDed8rRLGDLcZezJPS4KIxHWkPHQFtZtP9mzcC
 dY0wI56AVVfZ7RXkdArCxJ6oAEC6lBVugfdi3mzukhKIrAfhigl0coc4rr4xfW8Wo7r6VcccBfI
 QdD65aoDpz/XvvZSrQbHWrB6SRA+t1Wumr8+/UtqBIlWyNANpVVxgLjz4xSQbt2QUVKqxNpRyEO
 YZTiD9MSeNY9SHQRZ5q9VlbqAWd4AFg8DbZ3Lqs8gfjSLqAthiVR8oyhh5UZga1r7OUIEOf+n0G
 gr6Qld1/3j2y/h5te3JRLvMWdEs64wJRSepx8Ykohi0dc5Oj1Bnt/cd9GGZJRL8IwmcPo2YqcIp
 GcLqctx8FxwBNnbQ/nTn7wrWW3vIVbFMjuQddI9NnNbZyC74eeQZKP79C9zr0loh10hAG7aHdjL
 9/uODbztknwM36YvabQBiY8O26JQGoTTPLNZmlvvEzHjABSyapzxnTkgDP15bY+G5YYoRV3hXaQ
 UMDaaVjDlCO+oiV1PmChYZej5GlZaOmLcc1fPpRUV3POk6FmuKMw6CEz3BnTE5VHLhDgv308KJV
 j5dp7ASranr0jaKKVl2QwX904rOg0YWTWUPfQndqjEaLRz05O41sQBipnu47/slv52/ErYhIvNU
 ldr9azFkEK5cPjw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX+gTPubo/gInN
 ayST5zJePjDlqOJaOsPW4P5rc/tIhHQEnK10LREw8pYLyhJSiWgIKWkRKOlgzwDC13ujmYxVegJ
 7wYTyjTgaQJTnzpPeyotDq3NZmnoE54=
X-Proofpoint-ORIG-GUID: 9iJx6PSgJcupPGLYgKdsTrA5R8Y266e-
X-Proofpoint-GUID: 9iJx6PSgJcupPGLYgKdsTrA5R8Y266e-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX/5OWKd18xLSl
 VB/xI2jCrKMT+fAzaW3C2hTWxUA+H8Se7Xqu1SvHk5dJp7YKAeBRpnjIIMPDpGpoAZxE8d/40/9
 ItDipguAd+faMATw3GzqA8t4DgANT9x/HyUflEZmh75EFDTEdKSd72HTZGwPlTsnaa8mNQUsRdM
 gCZoR3Po3JE8toQ/elKc5icrYa4i9TJNXPLfs274BAowLJ1LehB5Dg0WVmHJBPti/JUYrPEBPUY
 je0mIrQUoYPKt7AqAvBFPif79aH1CKMd4Kt0FQVURHgWIvCGplk5NpbrlD+iFTgpjzTDBRXqECa
 qdgblr1bmUgTmDNggFTvxfNf3JDbzpHJ0c93cw+tVbMo6lKqome8CKaC09UmTjpAoC6e3oDs2fn
 nSz24IOW5cdDpNmJvL+MyCBw0Ipf6w2PhUa6ZJ4cReGQuPsWtS7kJPA/q5TKuSak4UTL3/7fsf1
 9nXPJh3dOlyhqMOvqzA==
X-Authority-Analysis: v=2.4 cv=cKp1IVeN c=1 sm=1 tr=0 ts=6ab512ba cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=8L-1-Gifo5kdOXCWqOUA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240050

Move the always-on branch register offsets into a critical_cbcrs array
and move the register programming into the clk_regs_configure callback.

Use qcom_cc_probe() to perform the common initialization instead of
open-coding it in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sdx65.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdx65.c b/drivers/clk/qcom/gcc-sdx65.c
index 8cae11a0b2c0..b1ab265ba2c1 100644
--- a/drivers/clk/qcom/gcc-sdx65.c
+++ b/drivers/clk/qcom/gcc-sdx65.c
@@ -1551,7 +1551,25 @@ static const struct regmap_config gcc_sdx65_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_sdx65_critical_cbcrs[] = {
+	0x6d008, /* GCC_SYS_NOC_CPUSS_AHB_CLK */
+};
+
+static void gcc_sdx65_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* Keep some clocks always-on */
+	regmap_update_bits(regmap, 0x6d008, BIT(21), BIT(21)); /* GCC_CPUSS_AHB_CLK */
+	regmap_update_bits(regmap, 0x6d008, BIT(22), BIT(22)); /* GCC_CPUSS_GNOC_CLK */
+}
+
+static const struct qcom_cc_driver_data gcc_sdx65_driver_data = {
+	.clk_cbcrs = gcc_sdx65_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sdx65_critical_cbcrs),
+	.clk_regs_configure = gcc_sdx65_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sdx65_desc = {
+	.driver_data = &gcc_sdx65_driver_data,
 	.config = &gcc_sdx65_regmap_config,
 	.clks = gcc_sdx65_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sdx65_clocks),
@@ -1569,18 +1587,7 @@ MODULE_DEVICE_TABLE(of, gcc_sdx65_match_table);
 
 static int gcc_sdx65_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-
-	regmap = qcom_cc_map(pdev, &gcc_sdx65_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x6d008); /* GCC_SYS_NOC_CPUSS_AHB_CLK */
-	regmap_update_bits(regmap, 0x6d008, BIT(21), BIT(21)); /* GCC_CPUSS_AHB_CLK */
-	regmap_update_bits(regmap, 0x6d008, BIT(22), BIT(22)); /* GCC_CPUSS_GNOC_CLK */
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sdx65_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sdx65_desc);
 }
 
 static struct platform_driver gcc_sdx65_driver = {

-- 
2.54.0

