Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA8B48C8D2
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251706; cv=none; b=a/csPBxaULSKUa1yeFB8cPB8b9ZBn2+QSfkoTrSjssE8EpjjruDdcuxOSDXS3mIC6PGkLMlrhE7Dz0J0Dkw3OYrl7QfQrEQ+S77EU0HA1OkG1TzviLvG2JaTmJK/UZujVKXC+H2mXjwjBG4HRbnRDc4FTY2iLQ/eQ2ShvVN4H9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251706; c=relaxed/simple;
	bh=pMEAhmjQ8SoU5+CjnX88Vune5TxLlw3Sq9qAxDVyltM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QbdfnPxCAeHEEgG9NZMW7+St7x8G5NhtrPpbpCqHrH2jdz6X0Z/g3aPhFZusTJXNNqw4EAyPCVGJ9Ol9f3qOWdOQEHfDaafOn0jruURCW3pjODYqnQbrseYRRZNriINtGRinnJQDqYjp7DhEWar8yVVjltOOgsboRXCXbp5wl6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P6tpfxaV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SNWOs/VC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P6tpfxaV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SNWOs/VC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4ti41630816
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HrRr+mDCkAGXrueKNpJnB0kvZSeCwJItxGhTTWWe0F8=; b=P6tpfxaVvhyxrmCE
	/aDu4wAQglwygP/+IiVul2CFdMvEK4MmcCzBigtN9rTSIH48qkg8LTJ72NLN30Bz
	3ZRTXlmQaQht62v3zHxIjagzdDTQYkPYDOUTCW3YvTueAUe4rCF6AKjtVZ7swbhu
	fMye0mV8VCMHrzvdoru2r5tVqTUz6JU4jf+aIgQHN1/BBkIEkQmzgrn9+5j0pmxk
	5ch0u8Rq60D4RFSfWbgPm2Pv76HXqXN8b28Ba6kGg8W661YavIeW2W1bNzkWDBk1
	fMn+gsk7d9EquL2+ze55V6sAf2DqehtbHfoGf/lbbdhgUHwG21p4IPrly9pT0QCD
	poKz3w==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr90axe4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:08:24 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c93c294214so754180e0c.0
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 05:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251703; x=1790856503; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HrRr+mDCkAGXrueKNpJnB0kvZSeCwJItxGhTTWWe0F8=;
        b=SNWOs/VC66eNKxeWjAod4P6w1uHCyr7UlMvDXsAfv2GyvErg5vaHt1WyFFalPkyUXe
         n0r0/fgYJaNYNTnDUhekwku0xItw/LFmPTFVGiCXQVyVPpa7FpaW9V4i2/i/kRb7OHpP
         crVwpYIP1dBXZxsHTRxykMReVx9VW52OsKrojxNUEqRWHqTKjteW+mmAEbl/yj3PFg4B
         FI/sApZeTnncIW06V9FkDgjLpInMLXLa+03zmZ96P7tApoFyDVGf21fnJCgPKdyAaHqw
         H1abvhEm+nZVAsa4e2VVDFnSetlMaYWeZqNx0xgQ5wN0LQIE1eCpFNzU9CoezDdFNZWM
         Lm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251703; x=1790856503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HrRr+mDCkAGXrueKNpJnB0kvZSeCwJItxGhTTWWe0F8=;
        b=KBkcTDZf5MQtNJ10kzcieLOBym4zmSUklBGhqGYxRd2SWJK4yxf/3wQNNDVMEC1ljl
         xJa9uLnFXw9BeARBF6xD+IosVQoHdKfG6Zr9GWS63ZvgniR0S39kbj/LqKKTR02RyHh7
         cn6l6NYUuH/I9zA1sOh2FxYsIqTrQJZzhJWpxuunGSJGJ939SzXRwurYsig7Kq6DHJYb
         ds24DxEsX9uIBlz/HLyjLTWUUnlsQVuzyhsrMchTlIERRagXiRw7AMwowlkP2N2nosVd
         t6w2MyBa2F96oZFNxF7GXFURSQrj7wLvcIw1m1WJ7cgxR08DMdX448WH1IPxRXitj/DV
         WkCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAILijlPKRRDFmIQAyr1tuH9V1yLYEKBNOyXUp+XSZbD8DivZFcWOB4hSGxeB46hPegHQXm4Gqxw8=@vger.kernel.org
X-Gm-Message-State: AFuF++kRfor1AgwgBzN8522x/aCGZw88FkEy7BT7+xvrJitEWrfR5Dc5
	cKa6O0DzRiP597fLs/XNaw7c4ywqM+wTveZFOEisOTkFwb1/DZl7Q/nUgxXvUt/cXsE1EU4NdOy
	NfHkmbkY1VlYHJ/Sasf6iuEB817LbgG6hmg6f4NqjELdDZ2UxJ6L9vDPqUs5yZ0U=
X-Gm-Gg: AYBFou2/rIYKWwx7LQfgKvVFGYZ0SLe9wqxcgFPP/6uTalv+ShL0H39K9+KIBn6f7Z7
	DavopEKgrTyGeHZR0RgbHy37NoUT/3dYUMAqd9H05YaKNZ1K5oyHEK/sQ8XVVy9pjVqGP1sTeb8
	ax87PL4cgRzS6Xcu3EFR/pU5w88s/uCgfq0GVRmRf7L3HnmBkNbe6m8fgTvq3/DeBVTzO+NvtKW
	NEbTi2XTPjNfz9RKcrb7qTZLF3Q2ofsDzbn8pGHpNHQGi3hqKl7M0U8PX1Rp5eYSJxVldMsKTZw
	AILhkxAdt5KCzvZ+1KtXL5tVyVDVi7dRt+PyJ8qKhWTwHzPx99/cu1hJ3NZ70E/3WLAEbtwHo0l
	TgMevyNm/
X-Received: by 2002:a05:6102:5707:b0:7a4:85a8:fbc5 with SMTP id ada2fe7eead31-7af1d1bb461mr1067212137.16.1790251703374;
        Thu, 24 Sep 2026 05:08:23 -0700 (PDT)
X-Received: by 2002:a05:6102:5707:b0:7a4:85a8:fbc5 with SMTP id ada2fe7eead31-7af1d1bb461mr1067197137.16.1790251702747;
        Thu, 24 Sep 2026 05:08:22 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:08:21 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:35 +0300
Subject: [PATCH v2 23/48] clk: qcom: gcc-sdx55: Use common clock controller
 probe data
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-23-1479443ee016@oss.qualcomm.com>
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
 bh=pMEAhmjQ8SoU5+CjnX88Vune5TxLlw3Sq9qAxDVyltM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJX9KDo56OXYKsoACbcEGEJgfuiq4uumpAga
 JbdJ9u4RI2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSVwAKCRAbX0TJAJUV
 Vo9ZD/9biE3OVF4NZysl1yMmWTeNjHPSIe+Yoi4s7XaDxS3+FR1UFas/DV3tC0CW++tCneoy1BG
 UwbLrDocTnXRJJjZS/Vds2E0K4mu/JiWSm02gyiIqJHJs+plcua+KFuUPT3mnqgDifS3BmsfppP
 81waVbGOJEFdSuD8WHgjAvJugKmhp6wEHI0S1X56CVzd+r2dBoeR6hsdLoSXyxnIGI0LTEuKZzc
 u4MWBeyr6p0V3JaASQoJgdpjSRoJxZ+Zm6g/zOwcO3kKbYEz2ZY1R4NJpOACR+KSOCVrGOg76p+
 /X2bRa3hDdD/vcAgvpwFbW4JrHZvlzWjVI4zQRkiNItoH2peUYOgDWbFTDNIhxVhS2y/ma9vhOD
 IcEn9xbHN7LwI1nZ+t0L/vHrsXu/a65yWp91rieYcO0eBqmDJVmHQMTu20SPJSpS634qHnia2Va
 EGgm3dy/TwMzkZ/NI3TFTMG26qEjxJURMRJlBdNOMEAYYkiE4X9Ug5m8qM/uT4CmPeoILOvt4mP
 J5l3J0V7fcTm5pawdzHyEChLSYT0/FM6rbJXwxYh6OeHPKLoBFXxYHX6k1BSuqj/5FiQTMEvod1
 yLUhXjy8yjIMaD4z9ehGGYtQCuUebJuNgpMT0iR3TMGEpjF8L4COTzIeJDXaAq8eqeEyUl/s7h8
 Qp0PZ+7B1pAeljw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX7IOKHMAc1ukY
 EXl2alc66+Kb6FKYFPhT4dJ+kLXzIvPjIaF6YC91LHPz6hQcCpKGAoIMxnwlN7ERFZ4p7NYOzeY
 bPHPyx7XWmmthMMPMKznUJ2boxT/njI=
X-Proofpoint-GUID: o5VR4u0p4p3xLXsyOJFIWekuiGg8ScJQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX/PwUrfmmi4Zb
 lrMTHUr+/UCmP0/CFVfEjDbhiav9F4LdkKxc+lUIbNLCq99303G6bDf4vOPKfWOomJR1MTW3wyn
 oh8ODmr98lYq1uaUwUJ35xIc5yeKhGsLToq/sefUtyIyyampCbj5s88v/2cia9xl7VerCZEDMUo
 ymMyQNKqXVVQYXTEbJL9g7xXFW1s3waJSglfhkHzU1X1UevkKIV9JtcMQ2VKY3X80vkMo7a+BHQ
 CPrRdTi2nDvkkOJ5XYaodFiCbZ01Ss2lvfsJxYrmnbCw8YlDXTAGWFjd6vCwV16VtGx3Yh0vU9Z
 t2TRWilyWjhBwSEcvJfvqZ5w9JYvkgtQvfHQkwg887v/TULkyPtxXXW0NQX+T5Wr2JLErdiPxXM
 DVYNhSYzfTuYK3JFg3Lr2VnZCjtBEQxXdFKUPkl3yT2FZj5WntP8YkXC0EUqCrxACdgq9QZeGO/
 tpdInS4QCohkd6+oRYg==
X-Proofpoint-ORIG-GUID: o5VR4u0p4p3xLXsyOJFIWekuiGg8ScJQ
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab512b8 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=8L-1-Gifo5kdOXCWqOUA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
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
 drivers/clk/qcom/gcc-sdx55.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdx55.c b/drivers/clk/qcom/gcc-sdx55.c
index 13d6c9e8183b..8d8547c12b19 100644
--- a/drivers/clk/qcom/gcc-sdx55.c
+++ b/drivers/clk/qcom/gcc-sdx55.c
@@ -1587,7 +1587,25 @@ static const struct regmap_config gcc_sdx55_regmap_config = {
 	.fast_io	= true,
 };
 
+static const u32 gcc_sdx55_critical_cbcrs[] = {
+	0x6d008, /* GCC_SYS_NOC_CPUSS_AHB_CLK */
+};
+
+static void gcc_sdx55_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* Keep some clocks always-on */
+	regmap_update_bits(regmap, 0x6d008, BIT(21), BIT(21)); /* GCC_CPUSS_AHB_CLK */
+	regmap_update_bits(regmap, 0x6d008, BIT(22), BIT(22)); /* GCC_CPUSS_GNOC_CLK */
+}
+
+static const struct qcom_cc_driver_data gcc_sdx55_driver_data = {
+	.clk_cbcrs = gcc_sdx55_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sdx55_critical_cbcrs),
+	.clk_regs_configure = gcc_sdx55_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sdx55_desc = {
+	.driver_data = &gcc_sdx55_driver_data,
 	.config = &gcc_sdx55_regmap_config,
 	.clks = gcc_sdx55_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sdx55_clocks),
@@ -1605,18 +1623,7 @@ MODULE_DEVICE_TABLE(of, gcc_sdx55_match_table);
 
 static int gcc_sdx55_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-
-	regmap = qcom_cc_map(pdev, &gcc_sdx55_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x6d008); /* GCC_SYS_NOC_CPUSS_AHB_CLK */
-	regmap_update_bits(regmap, 0x6d008, BIT(21), BIT(21)); /* GCC_CPUSS_AHB_CLK */
-	regmap_update_bits(regmap, 0x6d008, BIT(22), BIT(22)); /* GCC_CPUSS_GNOC_CLK */
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sdx55_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sdx55_desc);
 }
 
 static struct platform_driver gcc_sdx55_driver = {

-- 
2.54.0

