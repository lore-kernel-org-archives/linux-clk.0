Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4961A388E55
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379479; cv=none; b=HJNSBf1g++4GzJUMqRrgg8mvmWQ6KMYqhX14rnshYFhl3o7A0keoZGoUc8ZmlYGVZdw2VmbiT0WQ4VQz7At7w2gwN/gXpqfBxjEvjIqqU4zIbzw2IPJxlgTHavW3v0fIfBO5+mlqw4gItiAPldhmkbVqXjF79Y5piAdpbb1XvYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379479; c=relaxed/simple;
	bh=60ZYJrtJj+i+7nZ2grqsPKWvNd/3VlwVGCXmxTPy7bE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uihhnu2i8PoOJFKhgSNzKxM9mB6QgVdcSdacgGi0FxedTMx6/rNUGfdNl9yRWdb3F7PhCkGFT+kjlSrNLC5P/MU/FlFt7Ow7uLIGmqAiWWQal037r1WozHioiYB4TOKz+tk4FBXg7ax9QTXfThmxffMuUs6utowUJXCvnBHAAtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U9ruR5Sa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AbFYUarJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U9ruR5Sa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AbFYUarJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHWCB178792
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:57:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MKZNXqgSe5gAr8Kfvpo9NCpQKAYKRjWXiseLeGNHB54=; b=U9ruR5Sa9rsOF2gJ
	x99EJxchoxBA9EZPzlI1xmW3o51GV7GAk76kHpqPraCDW+7HXxYkgGNorxgcmFAq
	3fbSSNKUdt/w01u+C5MlFBy4//cK6WXdfYDY7+1HQdmDqgqe8naSKVWwa8rk9iXv
	YxHj62ZCZmwuyO2k6liebJNG7Gdvd8KYfmTBJnCco2HXPC95xTlGBwypR0JBK5ZX
	DFluFjfRxQqQvtwz3OXojsJvNhGeVbCbTVpPoXstfh8Nd61c/PERUJ/bPd3w+5AS
	C6M/lYji+CNAMzXGnlBR1N7Fh5+4XrOqUg+v0lGNGBGHbDbTTzhhJisSFup+FmkT
	Ks1VHA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2s7rqcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:57:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so2676508a91.0
        for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 05:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784379477; x=1784984277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKZNXqgSe5gAr8Kfvpo9NCpQKAYKRjWXiseLeGNHB54=;
        b=AbFYUarJlVyhHXMvWa0JJrcg/B3uMBJgp82xI21brGyfoyCNKpB/Qf3j6aSnhqRKxF
         htYcOn3P4lKF8qPXZX50E+bFUP1OB3JimrQaIC/z7wA8cx3Sre2BkkQvzpJq0XI09SUC
         q/ZIAvSpB6uPU/bPe1e3lymqi1hCTZwDckSzlOHuhz9GXttWmm9d1EObp5nPvdIiGTuK
         NOO95IqWfNHuDb0dJSIPtN33ME3GhuUIF89mJYLUoO/Itw/X5rFeFxRIIkfMSAOhpWGY
         irUtg/OnKhCXkRFwRpYvwzl4HCc/E1SiEDGT0DaGrA4ep4oTzA7MVBQiRgDYUGSqaT6R
         mhUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379477; x=1784984277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MKZNXqgSe5gAr8Kfvpo9NCpQKAYKRjWXiseLeGNHB54=;
        b=OGKpS/hfzVpT8ah+B4t9XjYjsrVMoape1lfIaQfVVDVaB/TDGx+LD10zShyZVJH6Xz
         gnCHmIz3S2X3yzIyWv2yoVrTZL6NJ4xhrbFn9uoh8IbXHt0X/th8z4HmpK0HLF9JuIQx
         BTAM3MfK4RCb6hmsKlfknCqjBv12f06zYIalOv3AYUL5RXxyHt/qR5lj2o0zYW5djplG
         oCCKHrjhxo+ToNY0HAXPjuTNKdhdYgbZz5xRARQU89NKstFrw49JVhF3bz6AKp+HSXFC
         kbMaVyQfgxYzrBQv2AMYjBPJU+wFZ/69sc7yv77NStDcDm371l5K3AY7DDLeIcNrZxb2
         MtPg==
X-Forwarded-Encrypted: i=1; AHgh+RpaPKDCRzO7MV4gHRveHVx66wiPBCfHgwozPQ30w3aQu8hSvFlX5Rj3ApzLmBzkIfnb1uRugFopnIs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGz+LvfMsnHiBbOliWDu2sIa/HUrqfQaWD7ygwlAm+MrA2TH20
	mjSKNSWKeSzDMf6FiAlYvvf1GrtjWL0ooI2O6sWKg/15fA5gfIh6by8CscgPVG+owF/VbZ/aEA1
	3LnhudgN4mhzoFg7yiQilmFY92O+igw0WyN/7pK8ZRtXLQxQDJrCnJ8nF7FCrPJY=
X-Gm-Gg: AfdE7ckKLXDey8+ae3p9fEncoqMn+yVjyb0MiQaOUGsFaFX4OTX6edWQY1QeTSAas8/
	n3by90CuI7mnqjCyAIQYbvGe5xoh+tFt2mX1AIcP8ahXSgnQfQ4Gwa3j3qCq9/XeXDkXb+zwjhd
	RUKIgeGK3DhqSN+kGo7OKQFYXWQxFSizyplYJMfEgNxPBaWJDcU1Bhota4O9KHYv9sNFUurxRxw
	QhVXShR6ebF2v54GxQDv+f56g7h9/aczWGKik6NWySsCVv9vAhxbQxkqs8aHhOOPWgpoiMb3s+7
	/W8/gWX6p5lRIZHEuTUwaWt+zyJwGWvx9e+9Nz4jdouUUs7fTXZ+abE/OofFr4neB4alUw9b8Xg
	AfgF+2J+loQZmhvoZ6hKsV8HOfaaPsa8=
X-Received: by 2002:a17:90b:5686:b0:38d:ee5a:63 with SMTP id 98e67ed59e1d1-38e3d175d29mr12581116a91.7.1784379476710;
        Sat, 18 Jul 2026 05:57:56 -0700 (PDT)
X-Received: by 2002:a17:90b:5686:b0:38d:ee5a:63 with SMTP id 98e67ed59e1d1-38e3d175d29mr12581098a91.7.1784379476277;
        Sat, 18 Jul 2026 05:57:56 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm14238910c88.8.2026.07.18.05.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:57:55 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 18:26:22 +0530
Subject: [PATCH v6 15/16] clk: qcom: Add support for Qualcomm GPU Clock
 Controller on Shikra
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-shikra-dispcc-gpucc-v6-15-62703e05ef0f@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX4FalmVltnrRX
 LIdFnbxXF9Miq5uNKlfdrs6p9F41pxSJVPviwdRaLcnG4LqZ8Xkx9+mnNIdrbI6+O26i23tCeji
 i13YfkO2INuRqbJ91Gzl/BETOR+cLqcGftul00SD88nFJtRQD26baacUQpS10tSflXkrKadFC8E
 Zo9GfaBlnEOogebOb9+JHR7D6uH3tTCKCF9O9ARMu4ngF2ODF4oihnQh6TdPDVIh/NMO6QJm2St
 uQzadxQD2EQpw6+7QYyWVWZv+s/FqrMRlwziYcIlx+yLePiuQQraOwxGZGZ4Qmn7cQyBpI4TyZS
 Jxb5puhbjLcCbjAlh41SSYXD75H+40jgdofmfFG2T+YXBEQ+tzOCQ22sE5318DY8Eby4+YodJ6p
 SCY69a2jleVO2MzKO7lzniVegsia6U70yuNuGYL1fZz6fFd+0Hst4Y1ZHv5Ld4g/NRvaPPBc6UB
 B5zbV59wREpgMHUdHyQ==
X-Authority-Analysis: v=2.4 cv=eKsjSnp1 c=1 sm=1 tr=0 ts=6a5b7855 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=YtofigLH9XhHtagRA10A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: aXaijS_ydvJ-WJ3P9ohzAm5k-QblWhZt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX+ovzm5vnvlxC
 nJBAMFn4VIzKC5822FlMxbrdoWVhiGyXpIAv7iNDvbc1BLvyIIKjxC5tCjKzYUUdPyr4/tV5EeS
 EONA0uGy5J4P9K0NXDKCv6cDIj9EZ3k=
X-Proofpoint-GUID: aXaijS_ydvJ-WJ3P9ohzAm5k-QblWhZt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180133

The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
hardware block, with minor differences. Hence add support for Shikra
GPUCC by extending the QCM2290 GPUCC driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index fc33d82bcfb6843307d002d67674253f0174cb4a..ece567c533e88527451eecfbcd52a52bd05a8ad3 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -133,6 +133,17 @@ static const struct freq_tbl ftbl_gpu_cc_gx_gfx3d_clk_src[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_gpu_cc_gx_gfx3d_clk_src_shikra[] = {
+	F(355200000, P_GPU_CC_PLL0_OUT_AUX, 2, 0, 0),
+	F(537600000, P_GPU_CC_PLL0_OUT_AUX, 2, 0, 0),
+	F(672000000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(844800000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(921600000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(1017600000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(1142400000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 gpu_cc_gx_gfx3d_clk_src = {
 	.cmd_rcgr = 0x101c,
 	.mnd_width = 0,
@@ -371,12 +382,16 @@ static const struct qcom_cc_desc gpu_cc_qcm2290_desc = {
 
 static const struct of_device_id gpu_cc_qcm2290_match_table[] = {
 	{ .compatible = "qcom,qcm2290-gpucc" },
+	{ .compatible = "qcom,shikra-gpucc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, gpu_cc_qcm2290_match_table);
 
 static int gpu_cc_qcm2290_probe(struct platform_device *pdev)
 {
+	if (device_is_compatible(&pdev->dev, "qcom,shikra-gpucc"))
+		gpu_cc_gx_gfx3d_clk_src.freq_tbl = ftbl_gpu_cc_gx_gfx3d_clk_src_shikra;
+
 	return qcom_cc_probe(pdev, &gpu_cc_qcm2290_desc);
 }
 

-- 
2.34.1

