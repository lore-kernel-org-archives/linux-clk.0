Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89147485517
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251671; cv=none; b=ZV5myXVMFwzCGMiZG2f6YHIrkvAZp5Fnpsf5ZpQ8WJOQJx855nRR+KJ63arqKtbuAtt0seM450B2STZFdAaJN9ElfuSi8m0xJIRWLi8QCcLCQ162u6UduC9tMvzHVzPiD+Ur1rjO/uXPMghAJFc0qfr3729tZpLiTbSMJ6hzA9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251671; c=relaxed/simple;
	bh=kUjOKgxIB/NpCDTYT/AAzaBzYBYfrFXzs3trDWh3TA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JdSeXWxPSdN6PEOkPodQwjf1bCqfZWa/r0slRmpCPq3CcIoHEPIynv2LJJsrHoAC7LPJB8yLhQJ5hrsAAwsGRghBFHTa/I384bpnhJPxrjyngQ83yYPpYBA96LVeqJv2muFY/mBmdpn7bH/UBE4UGOE8oY8enUWVloGQRueQ380=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jX0pII6o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P9qZAQ0n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jX0pII6o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P9qZAQ0n"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4fXE2594257
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:07:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V6Uxa2rM+N3dUq3DacWIBco9CYz6uwfZusKVoC6f3q8=; b=jX0pII6ojuZRwVAi
	paPgWOfjac3xUHk13x7aKKrH+fy9i/gnJXxp729w0YTddckPLpC/+m0W0WFQTRlS
	DDb5tviOjYf3vvg+F4DNowrAOvSSeEX3qyr5dyeFSYuA5suvLAZAxiFngK2dO1df
	4gjgUPVfdlEAlbvF+v/SesaiiCDP841HSDCBhm6G+WhbyBiarfW+i7UteF1iPTd4
	eykj0rha1UoLbS1wPrz6ON3VV011iUMHous8gKIKN62eJhfMA3rzUub+5uF8kAii
	NzXi2liA8N38YTTAZ6VIlPSCba1lgFb9/ZyzG0DjYt/xsKMGyIOU9GF9oPDD1EeZ
	eHEfZQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1tjge81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:07:47 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-79129463bb2so632593137.0
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 05:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251667; x=1790856467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V6Uxa2rM+N3dUq3DacWIBco9CYz6uwfZusKVoC6f3q8=;
        b=P9qZAQ0ndoGYqglfDc5dhTYu5NRTBu9JEljsaNaZp+rfUI8b4lR7sZKQqJ2QxMuvH3
         09T8tVJT6/GFppp501VmGsdMyPgqT4Ob6dUCj49TEuy2wAgqVzEY+2xTcpqKPh3bs+xr
         ebWXqVbt+pSBjwXCm/YDiBu+81hcRbdrSEZ+c14Lbz3AKyHxIlkV5pZ7Bh9XihASaJRg
         dr7F5Jy/3YpGkI4yq0UThW6bygjgb3FWgCPOJ6vj0UPK3ZLBc1m8zxpQVAwZLfWb+aGl
         t6RWO7m0hkqbWoy1p3J8cOAxae5HvawGL6D5S15vv21YMx+xorBm422O3TfNPQvgF/Dt
         w0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251667; x=1790856467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V6Uxa2rM+N3dUq3DacWIBco9CYz6uwfZusKVoC6f3q8=;
        b=LidYfQj3wWOC36CO7bwTl/wG5r2FAlm2+c6O4qzgT1svFfY18Z4vzq9cBJxK3qTAuR
         yjCCUIxbLlSfLNeR0sla2p2+AbhmZSh79SQTwno/H92ToOLGXGqTU3mEmrNjWkSLpgUg
         MeIXt7Z+OR8KGRFNeUiADb709mCp1Ze2BaUtrOGkagC5eNT5JLrAHilFUqY2mWIHa5z7
         axwSRAja6AmwIlycRHlx5sQkS92xl0kYsmV/25z7PRCaW5bETtt1gmw+m8MnymU0k1A3
         aqJfFkzJcMM3HqXePbUdbNn0u3mqlntb4iTD18E3EBarvpIxBYrGexgc6bvu19fZBSQB
         M4nQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBnda5WRbE18xQPtHjQixMsHPJLE9m0/RPA9fIqtDoNEhl4eLohIBNgTTGEJUc6CjeZXLVe2Mx8pY=@vger.kernel.org
X-Gm-Message-State: AFuF++mQhi0uA3bx9al01UFmpMKcs0UY32HlzCc7BPGHioWNmeuGtsuV
	mtAAoCBVdp85zxsNWAeOxyVS6WZNFAyK6FXzKjM2jZgPwwwmjzrUDwaTOqlfzbk1yC6AYbwEM/0
	j+WTbCSIgWeewsyR7EyWQFchtwicMa4EwHACPkTwSpkeQdgj7Xn5+nVObKBgSVhU=
X-Gm-Gg: AYBFou3rA2e6U0PtjXdZOhqDaVcuxhbaT9M+N1UsgZWwI/XBxDWr7u0pmROV6scQxJ1
	OYqWKhRMIc18vPJj8Q3Gwf1ZM4O7dFRQjnLR8sNNPMpJfdoXZpmIv0N+ZpcxVJ8LxYm4uPWoNnh
	lty7PGtjSNRCavEGaQHdPuWRhv1pop6Cxyo7qG4+Q7AKia49W83K0P2jGvbQe9TMdWNfwkh1/pU
	IdasClU6lPGuoZV3YeYa9frCqstZQggf/o/8UhXfx85UNpBkkIFbTp4hg9qQj+7taY3en/SvMTe
	zVe/PNRvGdqA/yKYqmKlDwW8v1blSBMHZdeqmxQB8TybO8jgFHYpl5hU/ZXUmetFUb8Z6PtZWZw
	6l4jXB98Y
X-Received: by 2002:a05:6102:8098:b0:7a6:a661:efe8 with SMTP id ada2fe7eead31-7af1e4f74a0mr873634137.22.1790251667023;
        Thu, 24 Sep 2026 05:07:47 -0700 (PDT)
X-Received: by 2002:a05:6102:8098:b0:7a6:a661:efe8 with SMTP id ada2fe7eead31-7af1e4f74a0mr873620137.22.1790251666255;
        Thu, 24 Sep 2026 05:07:46 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:07:45 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:24 +0300
Subject: [PATCH v2 12/48] clk: qcom: dispcc-sm8750: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-12-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2073;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=kUjOKgxIB/NpCDTYT/AAzaBzYBYfrFXzs3trDWh3TA4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJNfYqZQeRYjcdexfQGiAopAofdf36YCrYCU
 y7AQ+Hckh6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSTQAKCRAbX0TJAJUV
 VoKPEAC3TRjLh75i5HVl+XV9dvWnQigWYWaf30n6m8T7LP8BBNI8rJtiTsx74BpPNw5sB9/TwMV
 V8GWybtUMMC2Fcza1rUYK/fy2jzExuWEuaBROyumxqWWW0NK1g99IIJNcejmPXSvlVFaljFHUfJ
 owJYolqa+7U2oZdft1lx7rrMQfqxaUQ0Eh7VSIgYXNnVfBlaDKLEr+w6UnIbcnI/BoWi/st5vTD
 L+aoLiBeJ4e9YxbvsuL0+iuiMFwtPcCLWVRaoUiKGxDZAnBTsmz0N+wjKBeevRseg+aVYZnF8v8
 VYFUCdqTEC/EV6B3fmnQtOdeBWq+iCfNJfR8FZnfwkfwB4WsmlXzZb95iOk1awPSE3bcB9VEwcP
 3nGV5mtsDH33oMzFLJVW1zjS756Cmc7Z2vdgH1jlfTyZxQ2V0/Ixh6U/hzl2KttH4C3VL/hMLRd
 8ZcLs0poim1Dko4LuuunMV9GUl8isloMAXGSXqc/Z7HTyiLxi4iybXnOgQYHPC6u9/7/iYac4ne
 M9+QJlHuRMUXsAAd5TVK5AhZ3MRHPiH4GaMt1kPdF6DtI+DZJdofJSLFV6S3jC5UJisp21IlCDx
 Y3JKv0daBqLtwSuNLQNHpmxcJwdMYTatRncVjDREoAr9LwOWS2lmOLInEbQ02xeyepo5ObYtheV
 V43beArEoyL2KrQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: 8cWQ-chDXliseXbRvnvt5QWgKa5y_x8W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX4EH7BoK6mP8e
 a8fgU2Uh7FOV3JAFxkrYtvb/IPH22dlk9RED8h24XXAzL9MoaSRkqzQhB4hbqW5pZ5LN6UDDf24
 eExzruiwfH+Qhh+o8DnFtrD1CP8pNkq/8UnSZKO1ZAV+EeOP4g+e2qOx2fRsScmXBY/hzQRzk/2
 0WoNymaf3JwbkxC99e5U3XB3RktlTYFpyNMHEHRtTHY7BWl3Hm/E9GSIL61fi0VcPpUwKjxgtzk
 +FuDWErcSGonT9gwSP1+XbOOpppiBH9YKHF1QIze2eGVd9+3p3yKE232qgC94qOAgB0uS1JAwKK
 vKp8ti+NOXjNioYg0cb8ZA63ebTcJkfgfbQUP4eGgPGVBXtPexuiWD+iuLuNITWPN54WnOlv7Oz
 Bq92qjp/2x9bdwHV85iXeHCMxIIGGrINuS1NuSJyBOXOrchVqu5dvr3avgXViX1exbB2fg6PePN
 dLOocp5TeoG9ulWg+YQ==
X-Authority-Analysis: v=2.4 cv=cK11IVeN c=1 sm=1 tr=0 ts=6ab51293 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=oq02ZYoPfhOxzj0u8kcA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: 8cWQ-chDXliseXbRvnvt5QWgKa5y_x8W
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXx5nLA/5TVaXW
 qoyUdDDrcm8ayR90RSWpJSrytD8PwklQH68XyonjwCawCMyK0G870pzB4uexN4k/tjKkgfMZlw6
 EyYN+OPAeXsznJuFYx8ij76hMXgdOYA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-sm8750.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8750.c b/drivers/clk/qcom/dispcc-sm8750.c
index 18e86b80e581..3205ce5c1ad9 100644
--- a/drivers/clk/qcom/dispcc-sm8750.c
+++ b/drivers/clk/qcom/dispcc-sm8750.c
@@ -1884,7 +1884,20 @@ static const struct regmap_config disp_cc_sm8750_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 disp_cc_sm8750_critical_cbcrs[] = {
+	0xe07c, /* DISP_CC_SLEEP_CLK */
+	0xe05c, /* DISP_CC_XO_CLK */
+	0xc00c, /* DISP_CC_MDSS_RSCC_AHB_CLK */
+	0xc008, /* DISP_CC_MDSS_RSCC_VSYNC_CLK */
+};
+
+static const struct qcom_cc_driver_data disp_cc_sm8750_driver_data = {
+	.clk_cbcrs = disp_cc_sm8750_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_sm8750_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_sm8750_desc = {
+	.driver_data = &disp_cc_sm8750_driver_data,
 	.config = &disp_cc_sm8750_regmap_config,
 	.clks = disp_cc_sm8750_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_sm8750_clocks),
@@ -1926,12 +1939,6 @@ static int disp_cc_sm8750_probe(struct platform_device *pdev)
 	/* Enable clock gating for MDP clocks */
 	regmap_update_bits(regmap, DISP_CC_MISC_CMD, 0x10, 0x10);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0xe07c); /* DISP_CC_SLEEP_CLK */
-	qcom_branch_set_clk_en(regmap, 0xe05c); /* DISP_CC_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0xc00c); /* DISP_CC_MDSS_RSCC_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0xc008); /* DISP_CC_MDSS_RSCC_VSYNC_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_sm8750_desc, regmap);
 	if (ret)
 		goto err_put_rpm;

-- 
2.54.0

