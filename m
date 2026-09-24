Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63FF49AA35
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251753; cv=none; b=qqmEu6ViIkTCo8l76ONPokADgK1Jqm0PZydL3LLiwP4KhoBYhpT+4gDR7Pm8koB7EzvYrvsHPhGAMI1JKQra7oClq6D3KbIyTRLjXxLbMRAqYZqmoi68f5Akl4eL4zdwRUG78cpH/cNzUZLXuyfqIzV2i1ViZ56m7c/nNq5b6QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251753; c=relaxed/simple;
	bh=ZlV0ToIKIheLrRQzvesxiJyF6G0753SHmic9A9RRTjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hWixAr4Iuo6JpndXqkteQfL1fHJcYKFdMyfVWF9ECJ6CgezKoA4XEjehInrOOBEdI/izTH3bQsdHvwp5S1ZDS5r5xmSJY24XDF09wYnPz7ogFlejmOVrDRiasfVvW4xLRcVhxmJGNMKMjMwuJaSPnysbvzX9XbIm9YPR2KLd0bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mUqzIZ3a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RnTG/4nx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mUqzIZ3a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RnTG/4nx"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4uka803936
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OMuGpuatFPZ3Bg+0hqcyf/x4nQdJJ6oYxUDjpEqSRyU=; b=mUqzIZ3aCF2zmXoA
	R/d9nEsH/v/jX4PF+zZ00vnjFbQvA85ZtDpBjQ2HPJdaD5OQsmt9KnRdZLUn+XAR
	hys83ZGwJAJKwaDtKZeUhWXMvSIVs9lAoQ9JVrcGDI5pleWpTgBid7/BmhmUkukJ
	e19dXRAmlLUJD1N84FaAvZmg4ngcJEuNZuYNQPD1PDgu8X9NbzuZz8CyM9dRWyTl
	pNDzNRX5R/phf0/dzB6JVkvseCQqaFNqfJFzsggTPRJaziQEHkinRZaQtNZpXeOr
	IVdpWAkQqVKAKmPmHiEpyeTK7uFaSxTRm74jQ0ziuNl997/BudVxkFv02L/VH2wj
	cWhjAw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1sc8f9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:09:10 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78d25a8ff32so616574137.2
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 05:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251750; x=1790856550; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OMuGpuatFPZ3Bg+0hqcyf/x4nQdJJ6oYxUDjpEqSRyU=;
        b=RnTG/4nx4x3XVv6Cq67ifDPc8aJYLRkboyMF28pLF0rNSyLwZTPFVSkwEnYF1Q1+tz
         0wbHG4ezxyCHPy5IF6X9nxQjHc2N1f3a0sXW+AeifVKJ2aIw5cJE7TfxN2le/6e0ouhT
         uWfwQIy5rGG+R4EPvR7Kx8rqnpBu63jBZnAuYO5GjSNL8vWuwml8LIOLUfMad2zt9OFx
         S3Y8QNedngviHUC4BGR9AN+isAciCKKpu2knidCq17B2IeehhUDygYQpssIawLILZt10
         zZqzOKSy2mGd9DgG0aRukslTiFLUYPRq9uEp0a2kuYMMEkEXJOeZXEL3DPn5Edb9RkMk
         fLnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251750; x=1790856550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OMuGpuatFPZ3Bg+0hqcyf/x4nQdJJ6oYxUDjpEqSRyU=;
        b=fIX/18rj9RQZHl3hzZ+K0IUE2pIEPDPpBEJ8yOuzkR2Ek5PW6vlx7Byoqj7gtA6fBp
         V0/i3kz9URjrZSsaWDZVmcZFzHKp8PepzEXEAiROv6lx9uROKJFdWJ9FgrJWJH8cVLIQ
         rxcsZ3DsYT9ihyj28EP7mlyaIXJ4hTxCx7zD+0jvJRzqyOlHj1B/pBnS0Hhkrq6hXYoY
         WXSApKqOdh4cd8w2O8NrFtBWMz2wwDmDrXRvLwiAG8Xj+z0MgGvGuOg/pcV8gETb7c0s
         0U0W62xZ24IeWye3x7cpdK7VaZi8Utlb95uYR/1acRBKVyvnKe7yWOgD7oOMDAViMeIF
         OF+g==
X-Forwarded-Encrypted: i=1; AKwUvByGHmbQ6mkFut/2ZDkW5+LUVb75BG9QKJkELXq/xcUB87IQIEXMasashI9p8aV1Jvtv0yMRiTyByr8=@vger.kernel.org
X-Gm-Message-State: AFuF++nJkDK/zORKIj4jYwlwR/mIUedHgiA0Bod8uQ+rrIR6RIT9UAt3
	v1/vTqBiX7FDAo90fKubiBRCFXDwv4PrOscC9AUwXMsa3wbbCmgVYG7ih19HrJMyFWMDACNg6jH
	iI9EPvVSCyx+KWyhSZCpfffbSRi9EEffIMpRbW41Fc+VV+2Oi5/joHybccdfSEo4=
X-Gm-Gg: AYBFou2YxZDGvlM1ARqm5cB2aTabs049Yg1Niwi8Yq7EZGAK/o6NAcxtjlD7CYrwX8W
	pf115GualAxzMNKWRMrmkXFyd2Z+LZJHq2LVs3CwuGLtgvh+WvW5YSXQ9hqeNMUnxyJjhvu8EcO
	z9mW6sIo6PNke2SOzC7X6GMGpBqHb8OepRm/c+V0+OasmeKcsAsgQMHUKqyojPMFyLZQ6m23m/3
	RJTniSeq5bgJl9f8sgm1O/Dsd1F/4IPW5fGQfN88sOo2Ybzfb4LfmM9NgpFxg0lK8J0TAK8YGEP
	uKgI0Fs/zHd9AxozSiAYnAHFiB4QNDNwzVV/uu5iNL3Y9hHPwiE6amrje7nen+VTt3PWmNdeVrk
	CWcQ0FXOP
X-Received: by 2002:a05:6102:160f:b0:7a7:196a:84ec with SMTP id ada2fe7eead31-7af1f1fe5b5mr1088073137.36.1790251749709;
        Thu, 24 Sep 2026 05:09:09 -0700 (PDT)
X-Received: by 2002:a05:6102:160f:b0:7a7:196a:84ec with SMTP id ada2fe7eead31-7af1f1fe5b5mr1088048137.36.1790251749022;
        Thu, 24 Sep 2026 05:09:09 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:09:07 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:52 +0300
Subject: [PATCH v2 40/48] clk: qcom: gpucc-sm8550: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-40-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1833;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZlV0ToIKIheLrRQzvesxiJyF6G0753SHmic9A9RRTjk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJoSpH0HQzLkTM5wfxmpv+jplK4B0u0n2GVE
 BVN2j8HSVeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSaAAKCRAbX0TJAJUV
 VuF1D/9Ml5SbMGeNznrPvr1sEeBSW593eGrbFmF4x+U/PEaC44X0SBXJeX9X2Q82TLY8OAvrcaH
 KBT5+LOC4nwgQK9lc8xxOxgVpRQHLsAeOiI+1xVWZn8/Pk1WkAaIF/HBdSa9PauAIX7psNmWgJ7
 4pbIT83iiD/8GgJ5cBlE/lyfUvkomGJZGS25BOhcF1pOWZzn5U86ogqpJzwVtSiHPU31xK+zwdm
 EtCxFhqFymxH9ry6beajozCFvKOb7BMz+D48EDw5GlsEImSYNrYhgh/lhe7pnzJNbKNvwL5LeFV
 N3w15rL9ntQVlz4fCgHhu83py0m9Rf0ShTrqo9rP87aPraHwlPL1FGcsB1NT2iTjUXvF+3KhZWb
 tNy1TWtVPNCpozQfe5t+g9XMQ5wVXCWqg8h6qqxwcliaFUDOAHEetdObtEJuoA1dghrjzvH2uNs
 X6YVNIljxThsKi+SexNSbWcR1qj1fp4UBhIBxKHfmLbsQOhiIbdd4V9s+1XJAQTZoPzuePe8BkO
 L4b9pOIYmv50aym6PccXoYgmrBXaLbnX0I+ZzXIBgcEP7yJYIs/hzd3ll1KTh/sbFEAb8NISqCh
 DFUfE3YoDHui5e/PhEwclW0HyK2P430fyWTo1bwSP/ojMGC8fKjPuqVRV2/CC92MnBKEaA+as8D
 nDv29ftSrxxxP2A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: aLUD6oHV80vGAkh0AnCPnNNU8efHmGmq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX0mOIX8W1TM3g
 PGr1tFHqI9X6822vQc6poWvr2qpIz3+QC5fylxVM10zyFbR/ZdW9ENsa3qIxFO96jYTzYBL+cX1
 yCF/SM7Kxg93bsXDfu18X/Cg/IDdo/C9o1rF3K4Nnz59k/OwJ2iGFu0smWxyZqAikH7TiFliauw
 jd6BTM6lHFgHbQDNW0y5D/OveW+Yl2WbRW+R+sTBBwE3xpdo8DRP4tEP36yJgjg9DmHAttbomb7
 CSGDhhvPmLjkgxEBv0cuL+TFDyr5OJ69NSLXEEyce6Ik3lapRs28pWDSfMnNOSm9m2CZmVlylq5
 OkzRAyegXMweEdHM2MSfhhx8SALisSmPvx7sgW8XOcu4AYOsls/16BjB79i0e2dqtrUgdxJ5k0l
 OuuFzLZhf8nJixv/epi72xP8JQIz26TsBfONIqZ7ufU4v4Q5zNKDHEaoNKVNVWjORV4ZNaThuQI
 kmqkt1qbSITPZk8ZvZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX0rl6bEwF5dmo
 fPvPB84nGLX9vlNUez7HBq9yLhu9CxT9J8btsIgYyHN6DUByqIaVtCewoyNKaW23eYKb4X3TIr0
 Y9FQoZfWpO9xB7c/6x3WepjTiB38Ui8=
X-Proofpoint-ORIG-GUID: aLUD6oHV80vGAkh0AnCPnNNU8efHmGmq
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab512e6 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ED4nYY0oUM9iKWp7kXQA:9 a=QEXdDO2ut3YA:10
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

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-sm8550.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sm8550.c b/drivers/clk/qcom/gpucc-sm8550.c
index 53614e980b26..f8dd1727c080 100644
--- a/drivers/clk/qcom/gpucc-sm8550.c
+++ b/drivers/clk/qcom/gpucc-sm8550.c
@@ -547,7 +547,18 @@ static const struct regmap_config gpu_cc_sm8550_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gpu_cc_sm8550_critical_cbcrs[] = {
+	0x9004, /* GPU_CC_CXO_AON_CLK */
+	0x900c, /* GPU_CC_DEMET_CLK */
+};
+
+static const struct qcom_cc_driver_data gpu_cc_sm8550_driver_data = {
+	.clk_cbcrs = gpu_cc_sm8550_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_sm8550_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc gpu_cc_sm8550_desc = {
+	.driver_data = &gpu_cc_sm8550_driver_data,
 	.config = &gpu_cc_sm8550_regmap_config,
 	.clks = gpu_cc_sm8550_clocks,
 	.num_clks = ARRAY_SIZE(gpu_cc_sm8550_clocks),
@@ -574,10 +585,6 @@ static int gpu_cc_sm8550_probe(struct platform_device *pdev)
 	clk_lucid_ole_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
 	clk_lucid_ole_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x9004); /* GPU_CC_CXO_AON_CLK */
-	qcom_branch_set_clk_en(regmap, 0x900c); /* GPU_CC_DEMET_CLK */
-
 	return qcom_cc_really_probe(&pdev->dev, &gpu_cc_sm8550_desc, regmap);
 }
 

-- 
2.54.0

