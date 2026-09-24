Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCC348B37F
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251701; cv=none; b=KnLKGnbEQ6Wr/Yvr4cI0p3L5ZcJt5QaDW6ZZLUnS7uiIZH9Kw3DkChjxHamxriOpwS5WhyM50VE0NcwyTHEuUr5zdCuld8D+EoHu79FP/evoRE+1ecGSJY2DxcaJunFpg5MegtGB2cslWNfuhXBv51bOJvKjzewuEy9txsJIjso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251701; c=relaxed/simple;
	bh=TkNe6dbYFbBpRN0mUJBWTHpBKSQ2PJFZBXam3qDlU5E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iqrp4kFZyPgBZaiulzCQxXcYpyksK9J0+5HC+SAqliiIj15PrU4Ik74vgu8RWL1ddWyXIb9GiZaZLyAiKXIUmQAZ966JdE2etaildVQSuauAMuHqWyzp6tCtoNKmWxnI14jgCQeUN0YEHHEPJ42Tg3tkTkAvCql191PCDJ14I2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IEZI4A77; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OIKW0X0q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IEZI4A77";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OIKW0X0q"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4frE3134233
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qwzjn6cElmXfCp14l4ddV9QtlIXhn8pGPhPbkAHvkrM=; b=IEZI4A777l9WSP2B
	uiBF2/tPntucT7G1kzUn8snW5CfZILSGaGetgD72gpLlxVijbcLvCMayG7NBvrMi
	5t1tvC7AT2oCzGEEObYQiIdGpbVYEnmm7XiihBRWgoHKifzx4d89NruK+5ASTB3r
	qzSkpAan8+LicfyLDtAUyMw/4yjs7zSybhzpdXFpLuMS08IltidQeXoFu5v6ZzsS
	ec7ABhocalBGRC4J/c3ZPhYfZcAnxwtVkWENPXaKvqpgGwtDPBEadWQ2bfCO4BDe
	zfoQvmsLbRLLypCIV2VT18XynKGHgGcJwrMI3FTLy8u6AiF1Cvviqnm4HvgHHPVv
	+7Hdcg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1ragghc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:08:19 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98087b0c5deso1550551241.2
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 05:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251698; x=1790856498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qwzjn6cElmXfCp14l4ddV9QtlIXhn8pGPhPbkAHvkrM=;
        b=OIKW0X0qBhfzEf9D44ja5gCD+sW/QRdPADd5fB3qaOOPNR9+9c9toU1QKgzAmTnCUk
         RSifOChCsxC+VF8XgVULuqOBprkqf/WUEduF0mq+92HC7O7HgZ0+Ympe21M921XLoxuC
         9aBkInNIG0VnieUEz8j8rBaTbZDL+o7MzQvEjOtbEtZEWA2Op9oCYuf2AMd+5txKhtwV
         qSppPdFWiBnlk9EbeYQWtRzFMI2FEriEgILrm8UUXHOHVKHLuUbZPOlygK2/waN+yWAH
         STXzWI7ZQs76lg15qRY67rEduWFQnvisDMV3ms7YjPOwaU7eVygubcBkPWdFxtHDe/qp
         PqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251698; x=1790856498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qwzjn6cElmXfCp14l4ddV9QtlIXhn8pGPhPbkAHvkrM=;
        b=1949ipgtMw3fdKeszyQGlH5//YYKz7U/JO3x7qVppPmpiIxJMCMPbv8fAjb/legAPd
         cMl+JecAMLZZK7diHNGucAICLMD1CwMCHIQSGGEqdFx2JYQI3gv5rM8DzZ34hm/VydpE
         5mNu1khuwzggkaveSufLhMhpmX9Dy3cxyQRInpI0RvqMVdxzIjQIZYnjkwxB0J7jZuUo
         zolU9DlGSoy0vZ2GmBTIxdoA6UNGWOE+ewyiYNB6mM0HGUu9ONMK1y9WLwI4cVHRMa/t
         JCOeOaxhnKY7Gq2f8VuAhoQmmntgvsq8WdYGS/7ZpPrNJg80DhfV1G2tNSF4AQ6wZIIV
         rx5A==
X-Forwarded-Encrypted: i=1; AKwUvByByAsqishpowF8nTg6Wm6ZSdoyjDmnPtQF1yCtQbt1Oh9wVMamC0KCATxz1ynMLcaIvPuus8FxR18=@vger.kernel.org
X-Gm-Message-State: AFuF++nHEy1atvGDvmw+Evg6zq4OdwKXEApJ7PUofQgjNNekKQs2sefj
	oEYWplpAxW0GpMxBLpc1ft+FVQWkq0lXIc8tW+dJJMH125f34ISkLRSKevyf/qNuF/bZjXCCWQQ
	uBKg1Rrlbx7B/4EbN8aNKWCwzXYk3OTPV/0vCdKSUchUDC5UNtbMIP4tyHqvUstA=
X-Gm-Gg: AYBFou2Bwu9pdC5NqYQh/oGevapKAVQKNrhzA20qswHKnF87K7OEPXUSqmXHwBjk2PD
	X2xOGcnFlGXZu7cBIsNvE4dBQDSZqrqsJoapH7h+88AXdlMuShvY3p+iLNt59MGBsJkUtNUDM/R
	RW//hBr2OAekgxAkoZJW6V+dguuA2T/9VF5rYbMktbdiR2huALCK/wZNXX00nKU56DfjV8b+b+y
	flLYeKRmfkPpAWVZ3vXiz1gvFufbtfBTpwY7TkHn5RcfEkKxuJZfQx3Po8ja497mIG8YWikVcji
	49cxuwRUZcPe5u7kXUk7kGo9bRZFfgBW/DBXMQ5tKg9RXCX6ad54bbbjO5uJEGqoob/ehFJ9sFY
	mV1D9YuHD
X-Received: by 2002:a05:6102:4b0f:b0:79f:3bbd:aa3f with SMTP id ada2fe7eead31-7af1b96bb76mr1266028137.6.1790251698004;
        Thu, 24 Sep 2026 05:08:18 -0700 (PDT)
X-Received: by 2002:a05:6102:4b0f:b0:79f:3bbd:aa3f with SMTP id ada2fe7eead31-7af1b96bb76mr1266017137.6.1790251697450;
        Thu, 24 Sep 2026 05:08:17 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:08:16 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:33 +0300
Subject: [PATCH v2 21/48] clk: qcom: gcc-sc7280: Use common clock
 controller probe data
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-21-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3307;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=TkNe6dbYFbBpRN0mUJBWTHpBKSQ2PJFZBXam3qDlU5E=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJVGg4b1AyPYI4Q0ARlYl6HjJCWkBpNfEeaP
 Yfv95GjXbyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSVQAKCRAbX0TJAJUV
 Voc/D/46mdtTzQZr+VHlY8rxF8Nudtsi1Fgz1zAy7xk8jTA/TOc6UPqyn4gaoYXmAuvEk2uVUcw
 JZQid7Gu1VzzxCPTF5Rx50/4r4CGytcjU3Lo5qqjMjY0sNmGjmL9BvSBq5PadHqgo8hVxh6J00A
 o2SXKVvh95GDmPknILHJN8RNZ2nuoHeB3c6vZpcA4kxALz3dLHrfH5ASHOIdmCZCJ380IpaAXte
 sn3iUdRgqkrs3juLDWMNfJMXjxUaCuaRcHNVLko4a0pak8H+wIGrF/xG55ZUXN0MviGXuPwHuSW
 JIvx4HfvRzIMejH9jvheJndn5SzfEWDp1ajp6f6xe+uEef+8COxnNuAqkHK968zUHy8pHoOFxsf
 vpVlHPW7R6l0Ad3s+VQ3IGNKtyk1J4SzqwFazHDzpqOKUeyVArXKgon80YM1f9Nyi9ZSuRDBF3t
 WXPc/CHkbhSm4oBZAyXk4rmhVuVCQFkC3lIArYm12B2g5hdQm+cyJjQP9o9yrrLlAHtxZlxsJEQ
 Lt3s6VHkEYpSA2aCcQWi0coo/oxfxrXSQsfP7LMdyAu0P2b3XuVvDlrajQbGFdQKYl51yc2s2xr
 pcmhaGLwNza+/PPW/g/3/PvqMdQiNmrFeH6YMxv/wMn1GWaZRaRKUDaTfhGclo17QUi2mtKtEMp
 nOfD40s4q6dmyuw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX8XvAB8m45KFr
 W8RvcwDSmCkHfE3HJ6oJkFNO+DpbH9iZ4QWBwXbL5HulGP0gYQTMA93eFg520C5dMvCbiGsvP7D
 A1m8vcbUQEbZLRlrz+t+LJtRlRdHjgHrcrXOpn/QUlQgoqh6ZQPYiHwhuqxmubNZcmFXAL9oyur
 VMkjHlwlHZZN1rnisBLJEe5rtxlkbvoypRCCeHqk0QmG/yUnGpTtgXoMdvBRL5njMKM+Avk6n+P
 lMUT40crEAZB8XWhH7vcFyvu8e4V0HmII5NqNxWw5So3xI/KVFT5+1+7IDeplxmTw9Eg8sRJi0U
 bSUxaYWJxa2ZpEMGaqasYjUVM+NxmwvxR9GVBaFHCRXlF2GDOgAITShgYxjGoHjz8JXfC28fExi
 Q/ZwLsHY8kiUUflc0C3z03AF25wjlNeLGhWERH6/cr2f8Ro7jheo/mpNE+ANtdg8p5x48A9DvZq
 CyXTeyZ/S/gIe9VxWVw==
X-Proofpoint-ORIG-GUID: 8rnhlIMIEmc43hgy664Hwx7aHMtJ_Xi1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX2ZVySsM+wdLE
 4eea7tbt1eHgoDRzmcd8eRKv2Zb3yrKyNODv5HUsn7SNNGYwIk0KzEwcUdci3Zc6UYRCNdMiCuE
 mCUHWwpU3upLggVt39UFdkqQP7YZYYI=
X-Authority-Analysis: v=2.4 cv=fvpJ914f c=1 sm=1 tr=0 ts=6ab512b3 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=3W-9O9G7v02zwTbmxhoA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: 8rnhlIMIEmc43hgy664Hwx7aHMtJ_Xi1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240050

Move the always-on branch register offsets into a critical_cbcrs array,
describe the DFS RCGs through qcom_cc_driver_data and move the register
programming into the clk_regs_configure callback.

Use qcom_cc_probe() to perform the common initialization instead of
open-coding it in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sc7280.c | 54 ++++++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
index e1fe64463de6..1c9f8d8b99d4 100644
--- a/drivers/clk/qcom/gcc-sc7280.c
+++ b/drivers/clk/qcom/gcc-sc7280.c
@@ -3438,7 +3438,34 @@ static const struct regmap_config gcc_sc7280_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_sc7280_critical_cbcrs[] = {
+	0x26004, /* GCC_CAMERA_AHB_CLK */
+	0x26028, /* GCC_CAMERA_XO_CLK */
+	0x27004, /* GCC_DISP_AHB_CLK */
+	0x2701c, /* GCC_DISP_XO_CLK */
+	0x28004, /* GCC_VIDEO_AHB_CLK */
+	0x28014, /* GCC_VIDEO_XO_CLK */
+	0x71004, /* GCC_GPU_CFG_AHB_CLK */
+};
+
+static void gcc_sc7280_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	regmap_update_bits(regmap, 0x7100C, BIT(13), BIT(13));
+
+	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
+	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
+}
+
+static const struct qcom_cc_driver_data gcc_sc7280_driver_data = {
+	.clk_cbcrs = gcc_sc7280_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sc7280_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = gcc_sc7280_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sc7280_desc = {
+	.driver_data = &gcc_sc7280_driver_data,
 	.config = &gcc_sc7280_regmap_config,
 	.clks = gcc_sc7280_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sc7280_clocks),
@@ -3456,32 +3483,7 @@ MODULE_DEVICE_TABLE(of, gcc_sc7280_match_table);
 
 static int gcc_sc7280_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sc7280_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x26004);/* GCC_CAMERA_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x26028);/* GCC_CAMERA_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x27004);/* GCC_DISP_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x2701c);/* GCC_DISP_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x28004);/* GCC_VIDEO_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x28014);/* GCC_VIDEO_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x71004);/* GCC_GPU_CFG_AHB_CLK */
-	regmap_update_bits(regmap, 0x7100C, BIT(13), BIT(13));
-
-	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
-	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
-			ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sc7280_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sc7280_desc);
 }
 
 static struct platform_driver gcc_sc7280_driver = {

-- 
2.54.0

