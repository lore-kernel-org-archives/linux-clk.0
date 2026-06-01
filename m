Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3565A3E8C4C
	for <linux-clk@vger.kernel.org>; Mon,  1 Jun 2026 18:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780338177; cv=none; b=jOwOeWL6z8BvQdzgHhfKsC/WL4w61XFHvtddxJGeD2A+lm8xxPznYH7uxY7QMMN9DvXNUw1s+jbzrHYbXBLplpAvoyjg+4NGwPG6cVDcHUI+ZTLJhIHjwKsHeDpYlkrzN21ui5Ef0O/N0z+dwRO3ENW7wwbM900/Mtq//PCeruc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780338177; c=relaxed/simple;
	bh=lVc4njKqOhZzn4+GH1LiG7VTyYhJso+ZprzY1j0MwKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D3/yq6ha4zxmT32UXx85wBm15n4EuIhlpGaPSrPfwTuY0PhXo/ZejQ4htlLQHPOI129ZD6yuF+iJlM/eS66JwwCi1Efm7IPlDr8CwJ/LkNnKagUUlC8p3heuGLC4i3/WO4YratnQte7/w5zkbmhGKb/8eq8qqjCgh4AhF45D1E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=enDhJY3n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SlmEtrev; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="enDhJY3n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SlmEtrev"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651CcWFH600489
	for <linux-clk@vger.kernel.org>; Mon, 1 Jun 2026 18:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kr1A4/6DU9ckTKGgpWrd7fjQD2lYalZrep1+V/xnykI=; b=enDhJY3nHMuwcrb7
	Esng0omk4mP2rjtxJqmAKHOWjhk9pjxDhsOUFtxzrLOXlXGYD8SyKXQtY2knXYTN
	ZyODRmQNOdJvZqWXBcoyX7574Yy6PpMldvY0x3SkQ265TjHqT1xUWbm348CNoq3a
	R6s3TB5p5DETYjS4bJmOSg9eMWB1gtDAmkgOQlPZYoJa2L2QDFV+7K+MpVFnPDZK
	sRpt+lkuLhfZsinfMfE/ECU0A0B0rDwoearCA5BGupHSfI7B4WOMuBsp3+ZMu+GI
	PmjcpJC5GaCuUYsqX8GTJpd22LIQ+u3zpy6Q6fMVbitOofa7Al0n0mmWDuGKYQhf
	rs+J1Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eha8r9jd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 01 Jun 2026 18:22:55 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d992fa39eso2234180a91.3
        for <linux-clk@vger.kernel.org>; Mon, 01 Jun 2026 11:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780338174; x=1780942974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kr1A4/6DU9ckTKGgpWrd7fjQD2lYalZrep1+V/xnykI=;
        b=SlmEtrevp7ph0h6UgvUv5tFRJujjJZemsaIfHBcpASkhg8RD+0K4kV2chwllE9DaAz
         Z2bDE2nhoGFWW5i2gh5WBmRtZtp+vsLVwPyK3GiEN73jgcoFHYWfaUQU9/W1rPDSXdeI
         B9hiWZDcQAMk7OiooTUlmognmpOOGTdUL3BO0apvu9W2Nji2kV4HVeE/7COVFz23lZYx
         uk7TsU+gg9c3D8c5dYw4tGQ/KdZgz5aBIFLiyIydQufDKPCuqUJKdr6N9XNadJbEdN8N
         6Kvi7MCLQDe4IIusiqdRAkuh6Mo0do1Qx41GUWLtGFcUCf4uRVSUhvBZrDuB/g/Mq6lU
         nKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780338174; x=1780942974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kr1A4/6DU9ckTKGgpWrd7fjQD2lYalZrep1+V/xnykI=;
        b=A++mK1LfL/xTY23CR7I+imO75bUWSSSr0ZIFzc+zUvuPSJsYVzbR4Hkld+WEvJlGcu
         8OME+sgSIdrGWV05stsEbrfGBOsgt7YE0spLFWpuCziTlXLSrXwK5IqclUJcvVZSRKis
         rc0yDHJmn0JULEv7cnAsgxYfX1MEilVy078UYslABKP+ogycpxweAUMWfnyLXYWlNOhf
         LqhY8pAZJTLcXaTZ7zwvOxU0k5CkcpWC4yUeoPRqyBlMQucZhtFrsLn2Ld0QVoIbuZ/A
         oAGpaOzZBL5Tm+zGvrZidKae2AbovCczCGtUWIkvDmhFZ5ssIQRer3Lco80NPWcXulc2
         jlNw==
X-Forwarded-Encrypted: i=1; AFNElJ/WvJJUUQ2tgrc4WMtXrUBocrVVhQ8W07ePxMIkiPzdwYoVwkuQR0RU5+kdLN+pLqGx76RrpL27njE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJdkdYqo6XvY8mFX18p2zy+Nl9hrChqeKe6LNhLk3x5el3USR8
	4CmzxUM/zclpCfMoB3mq4v7PArd4/FsMAqK2QNxzuk/smr/DwYM05uqxIhW31WtTLgGMNLIhrgE
	fIUVRj0ltwAh3JL0Lq8ucJ6vWBuCeeVHj3KxUy+R5BWXZju2BMhhJpWGkOh4tdCo=
X-Gm-Gg: Acq92OEw9lKA4wK7qup4IBnMLwI63vq9wJ0kLFPJ+OMOZhqGhmOvkBJIsMXt2mHg70y
	GLPFbHPrMnsHdmNJJXlTltphUnU4FduAU61TbxyCLcr3nddZv8uTBMTI1l5xRa3Q5fx3y16Pr3A
	XoMIwQegWhhpx/74Y2JqH1FomSFgKUQpYUCNjP8Y+O2QQHOnn4Ac4oXcUKe7zB5ROWUYeYNXuvl
	8mZldWeUSE41hz8UGbAwFWR9UPOkxmt/6ry2bzhaMbikuGvjXuBBaNBI0SQXshEEwoY6AkEFdm4
	DJ8/+IRajymrOQQQvw7ZkxN+asmugxmA0Ij9LOMyXsLo2zDfEyUGLRZdDtDATeB0vjyiRkjYATq
	fKgguiSe7eSY6Aw9TbA05t1prlrClBRG7eCtwjXNMmO/yWghIVhpDlkecbBhXTbY=
X-Received: by 2002:a17:90b:2787:b0:36d:ae6a:22f4 with SMTP id 98e67ed59e1d1-36dae6a23fcmr6141451a91.15.1780338174200;
        Mon, 01 Jun 2026 11:22:54 -0700 (PDT)
X-Received: by 2002:a17:90b:2787:b0:36d:ae6a:22f4 with SMTP id 98e67ed59e1d1-36dae6a23fcmr6141419a91.15.1780338173748;
        Mon, 01 Jun 2026 11:22:53 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd918f069sm326613a91.1.2026.06.01.11.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 11:22:53 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 23:51:32 +0530
Subject: [PATCH v3 10/12] clk: qcom: gpucc-qcm2290: Update GDSC *wait_val
 values and flags
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-shikra-dispcc-gpucc-v3-10-61c1ba3735e8@oss.qualcomm.com>
References: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
In-Reply-To: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=aKnAb79m c=1 sm=1 tr=0 ts=6a1dcdff cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=0JU4rCqLU3avs8DDqI0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: x22-nm-ZxJLAEIxwHeaO0cMUbnEW8OxY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE4MSBTYWx0ZWRfXwfm5sGiEdFpv
 603u/nwVHJBz+gevKy5MdDYicBUqZ/hx6RD3yssFHS69wp2gsVNK9kmAKbtwl2TPdiUsWo5Xpwb
 vpQhyQTyI7byD4IUxGR7Mjh0j4uf54qRoqS6cnWoAstgnPUj6pxaSiDzC6MeOfPASH26aMOlT1b
 5mut2trXb4Y5wP0OPg+Gk1nlt/i+3QU1FsRP02yzl272Mk+mhh/1aZAoQ5558wOHubk6bXI4tJS
 Htyca5yQb2uIFMzj8+GuRm9biW90MU8E1cF1SoqiojSxE037EORGQ7QI3aCOaV/inUTrss+TgcU
 J0MADOsMQ7ybUoDRReUxsJXvsyRIsG+fvXXAF16yWR3LCDL8gYzzVjKrncoWjg9ffie02yVJbai
 OxmQpBM7XRWYFlBNj8cYTtmkxLbeMDNkGyZ0j+aR3dLdTr0F2LnaG1C/sReJhgsSwnkegDU98O4
 uP0Pk77s1qLjXs5OerA==
X-Proofpoint-ORIG-GUID: x22-nm-ZxJLAEIxwHeaO0cMUbnEW8OxY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010181

Update the QCM2290 GPUCC GDSC wait_val fields to match the hardware default
values. Incorrect settings can cause the GDSC FSM to stuck, leading to
power on/off failures. And update the GPUCC GDSC flags to retain the
registers, and poll for the CFG GDSCR as applicable.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index 2150b94ad0ce5146c47ae21fae4deccdaba20673..6e696cf672923495c789055dcd2ff905d1761e16 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -270,11 +270,14 @@ static struct clk_branch gpu_cc_hlos1_vote_gpu_smmu_clk = {
 static struct gdsc gpu_cx_gdsc = {
 	.gdscr = 0x106c,
 	.gds_hw_ctrl = 0x1540,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gpu_cx_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE,
+	.flags = RETAIN_FF_ENABLE | VOTABLE,
 };
 
 static struct gdsc gpu_gx_gdsc = {
@@ -282,12 +285,15 @@ static struct gdsc gpu_gx_gdsc = {
 	.clamp_io_ctrl = 0x1508,
 	.resets = (unsigned int []){ GPU_GX_BCR },
 	.reset_count = 1,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gpu_gx_gdsc",
 	},
 	.parent = &gpu_cx_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = CLAMP_IO | AON_RESET | SW_RESET,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | SW_RESET | CLAMP_IO | AON_RESET,
 };
 
 static struct clk_regmap *gpu_cc_qcm2290_clocks[] = {

-- 
2.34.1

