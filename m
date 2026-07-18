Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DE129B8CF
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379429; cv=none; b=GUDahrnufP9hmg1PFPLgOjBD4qodsRJeauENv3pPUMUV8J1+32uE7dbtygVem0LDE5r9xLdkNDG8970Svy3In6tUkQckYjOjagR6NvTvAlZPHGHtCkXppGeQojayyc26fMoWdYqHMfeVCZeZ+Csp3xgM+oSeQblUJkfsWRq1b+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379429; c=relaxed/simple;
	bh=mXnatFuCFdJJPObEDq1dtsG2PRwjkYhWL1nY9lALsBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hlCd0Fn+pzGe/f2dnZZkKJsTW/fGS6TNNFR78n2/6VuM7YLqGty7Xduf9IrnYnBm5spPpjeX7wr+McUkYaJxOn1A0TZGSNYACOZZsawNfajhxyYZrvw6cBNuEopXe2yleJVGMTGjwk3DuOTvmByB0fJWqaq7z9C0jQGR7pwvGzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W1sUlmVM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zb7UNZCJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W1sUlmVM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zb7UNZCJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHJ4F584145
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:57:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JrrIGhDBwZXbVkC5dS2KTCkkFpEXQpPyx5WY3gk9VD4=; b=W1sUlmVMnjowiasW
	J4wUjneWB7VTiVW74lHTImW2/leGt1d4SaF3rXQ8bCSm/aWXEV4Ll5dOHbjpyQr/
	U/bMBynmASsknjtuZGmpe9NvLKK9+yutR0ewNnWRdmbkhzrDoIhUhsFnwlJTmsax
	i6ou7ogspelpsIgnTRr0PRYyJtPMe6Z3FC7m0QcwjROTbiGmcq+kLgIhf4Bccfww
	9UxmWhReziy8ITuIwlfwBLcdDQAxG9vsiHnHlnFBvljPveLXUK0J6tO3tr/IyG5z
	j3gx7Upp+RNjLiKXnTjBC5IkPUeiM4HwisshvqFxEwcpg8XM5+8t+Wr0jW+0hG5C
	bov/9w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2d90rmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:57:07 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38de0739ab6so6305053a91.3
        for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 05:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784379427; x=1784984227; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JrrIGhDBwZXbVkC5dS2KTCkkFpEXQpPyx5WY3gk9VD4=;
        b=Zb7UNZCJ6ZPKbB+4GuLzvJ2V+fzv4QjyHboeh8Xvn+aqWzvK6+1NLBz+JGluC2GaKF
         YrVhHCvpmr1PN+OivasGUh5l8aJW9eKPMxQDy5sMx46aOdbtqmxKM2LKJ7Ic5DcRoYwX
         RJbDSW/KqpjzuwZjF4bGRa63MjZEdjydAqY9A55ck92bkXcxy07T4WepkfKfQ3AWLsID
         6r8PBfx0y8MJoDWuAHeerqLHXutqQzKYj7LHQgb8/dtoYrKWXyVMBPTvTOnAMNP9hIqy
         xYxxWWAUCOibETZoHT6uA0QXMZzJ+sS1B/7nC6wveiM0tN/8jMSFngwlWeoL1zvz0qYt
         ku6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379427; x=1784984227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JrrIGhDBwZXbVkC5dS2KTCkkFpEXQpPyx5WY3gk9VD4=;
        b=Uc6HKSbeoiY+fGlGktiGg4YgVELlpOhaHgDd59TO6SbohCyDBrQNopmlwXaj/6FPZm
         M1ZQ5+0H0zcb8I+BjO+eMWnCiTVL6weVFTjnGLG5OR925rfB7FDPPfN9ehDRPoxET8vZ
         xLto+9ybWYLKLyy1bol8Kcbp0KIEkhpY1nJCZ9OMxgVN5t7S4bbw1ImUV6XohZz1oSeG
         utZdVQd7TnqAeOj3hpNZV7F8tDhAFl/Qpy2olVuTqY816OrOgj77JL3jRjp35vin6oqq
         reDpnA1ARQg32VsmtB/M9d8NQMNWjVL6dtZuboHQjiYEHgxNtI8Nfr2lOGy1BZ4c2FOw
         Jw9A==
X-Forwarded-Encrypted: i=1; AHgh+RrRvIi0j8nt8k4X6HFMBrcdoeZF5KWrn7GFEsibr24dJ4Wkqc74sHKroweuhd1xirTmizUooz7nkdc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKQJ6v73Z6wdwqZ6Ji0fcLCNSqatfIksFiTQpG7V6lqLHcXXXU
	TSVex4fDFy8Z+LpgrMz68OEQMi42+9CYvQDWGUI2QWhrxaoErcou/LNfpPk9TyxdC4Bb6SUxjRG
	0Zh2bhOtOAFnMrTpjtc6akTLR1B3Meqi4JkNpAWknMgwO7RoE1HEAtpdpVP4OhGw=
X-Gm-Gg: AfdE7ckuWRiGf+HtRsKON/sgucooHxjOIuc/qpHeSyAqCmFp7tAlPqigUVlXrNJJWJ/
	YyQ8XzZ91L6/OGocHKH4iqLSO1AAXzasn9E36ZwYx9plNr8jbq7RjrOBJk4c/E9OAIY//JN+2bs
	n5ebbDwYDnqOXGNVdP24HdEY8azztTG9wP56S2ZC5Ie9RLeZmjllS3Ikb2UBkF9UxKbRLkrPfFJ
	miF9452vrE+V67tvcT47Bl6jVDvJTK0gFHFlT3xSeESM2ZzgWERHbNsXAANfOzjQ1v7OunR4aXR
	ANrIVCS6nBXUFJSLxIoEaHUY2Bw2/DGO27Ra5YPbB7gVrAZ9QdhOn6kN1hlwU3YZgynkMv8pkYG
	UMrv+Z1BMlCMpwNShmvnOAMLZfbxpfaQ=
X-Received: by 2002:a17:90b:2f10:b0:387:e0bb:5803 with SMTP id 98e67ed59e1d1-38e4b5ea2f8mr6684497a91.42.1784379427287;
        Sat, 18 Jul 2026 05:57:07 -0700 (PDT)
X-Received: by 2002:a17:90b:2f10:b0:387:e0bb:5803 with SMTP id 98e67ed59e1d1-38e4b5ea2f8mr6684467a91.42.1784379426758;
        Sat, 18 Jul 2026 05:57:06 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm14238910c88.8.2026.07.18.05.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:57:06 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 18:26:14 +0530
Subject: [PATCH v6 07/16] clk: qcom: qcm2290: Update DISPCC and GPUCC GDSC
 *wait_val values
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-shikra-dispcc-gpucc-v6-7-62703e05ef0f@oss.qualcomm.com>
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=HpxG3UTS c=1 sm=1 tr=0 ts=6a5b7823 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=w9HkOJeuip43wi8LW4MA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: H-zfe8G8YXR_00ljnvVHVcC13Ah2Fkhq
X-Proofpoint-ORIG-GUID: H-zfe8G8YXR_00ljnvVHVcC13Ah2Fkhq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfXwBxHcxh4fjBe
 hhdYioLf6Aqe1HWQC7XkoLnXwdwfDrEzt5LGiImPWj9N48lXGsMu4WMmoeWMMT1/ErPoEUTtZ8a
 2ZIhudIqfFCeevD4qNG1gng9NAbnZs5nPWt0t+XORslTBcMJ1y23NF4uK0+iWE1wEUOSnZp5RN6
 wPH3ZmQwGjrn2H/0EZqlPJI+nafONa2NcOeqeuSiMewaOOG0Zt6hCZHSJCypt2jhIU/BzbYDelj
 qeYk016+Thcp0cqgdcyKYgRTwRVwn9NBeSq31xkktGPpEsgnIVeu4HdjKg8vFlbPiKPYMqVuTHN
 H4u9+prHC3vwC3B7JInEA3iqIcGJzBgr2cshLEQiAXtLcGyKXtq5J86pjX4GcDD0Rah5XXYVpeu
 p91GiZ9bfKmsVHsVtub8eZSrliIy0lf3AFk55KZIaZm0dtx0L+o8hKGJzqgvt+yAJJUp5LZJn6O
 y99aJYB7lvOOe44k02A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX61kbAU9VVGju
 Zd67UAFpkYYzwgf/K/j4ZuwQZuYxKLnFSkTySjkDszvPx2oFUoMftNb4EVMM3bq5xnMTbZWBElq
 eO/INvWEN5P3imTYk74DH+YIdUvjvTs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180133

Update the QCM2290 DISPCC and GPUCC GDSC wait_val fields to match the
hardware default values. Incorrect settings can cause the GDSC FSM to
stuck, leading to power on/off failures.

Fixes: cc517ea3333f ("clk: qcom: Add display clock controller driver for QCM2290")
Fixes: 8cab033628b1 ("clk: qcom: Add QCM2290 GPU clock controller driver")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 3 +++
 drivers/clk/qcom/gpucc-qcm2290.c  | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 1b796698dff5abf50e57d90b92a6a429ee078e2a..d32fd3f8d7acda2b5beae6695a5606732d056a17 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -451,6 +451,9 @@ static const struct qcom_reset_map disp_cc_qcm2290_resets[] = {
 
 static struct gdsc mdss_gdsc = {
 	.gdscr = 0x3000,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "mdss_gdsc",
 	},
diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index 8d397cadc86aaa1666e27c8c4185b9b3de13cf94..4e97a02d942ad23af561ec6ce1ba0a6f61bf5a69 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -296,6 +296,9 @@ static struct clk_branch gpu_cc_hlos1_vote_gpu_smmu_clk = {
 static struct gdsc gpu_cx_gdsc = {
 	.gdscr = 0x106c,
 	.gds_hw_ctrl = 0x1540,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gpu_cx_gdsc",
 	},
@@ -308,6 +311,9 @@ static struct gdsc gpu_gx_gdsc = {
 	.clamp_io_ctrl = 0x1508,
 	.resets = (unsigned int []){ GPU_GX_BCR },
 	.reset_count = 1,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gpu_gx_gdsc",
 	},

-- 
2.34.1

