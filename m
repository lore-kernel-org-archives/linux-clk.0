Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EC9378815
	for <linux-clk@vger.kernel.org>; Tue,  7 Apr 2026 09:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775554300; cv=none; b=kYNl9W3A5dPYHLgUvfjdt64m9WAtv8/Ed5eB/E6L24iQxO4y5qa4L2YkH7pDfMlBOH5w6Yg+DAKzV0Wk0AbzPqMgVgpirfC0ySKPNbYceNo3OU3BTHHjpe1e4dMDbtbDfurAsMjX0dah4JKGpveGo0TBIIomZ+6H+Y/kdHU4g0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775554300; c=relaxed/simple;
	bh=5NO0Fd42towIS40//QdgD2H+fOt/M3cbf891ePrQMCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DIEyNIhvE1en/RFxuij9NuBSOPgOXW9+2mxtSXid/yeNV0isHVvbfqxwjnXllnbOVZlwB2uDxbPzvnBK3nOdNrL/QpPCdo+Gee8y5jGWqq2iXVlVM4p/au+3y3Jp6ODqa1Gzifqr7NGDga5zohuXNQbX05Jr1O/u03TXWiiJhKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bbH9fGus; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=itEwDLiF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bbH9fGus";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="itEwDLiF"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376Bnss2550794
	for <linux-clk@vger.kernel.org>; Tue, 7 Apr 2026 09:31:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KK5gjgnaalniXHVQETjquADftfg1WO+N6PsIIlecERI=; b=bbH9fGusY9Nosdil
	zvPpKkdKOk9iwDUSH3MNOUa3h7rm0A4Fhyo2uKZX13wI+OXgkOy1jWXzo2tA5ZPG
	b/9mZ666FH44XDFmteP098d6D/ZDeKo5/KzP88OY/jVdpG82zifEKuLFw8ReDg5p
	8Ij7CvYQSU88KUC0nuF4ePeopRqF9eVzNWeFFTVduxHoH4L+mWCX9bGbhKHpX+2O
	oCdYri0USs5e2US8vLQH2vBLLIrzAABJ0DYjAu94IzZ0W+hQ0wrVqV/hGnqizYmU
	iA77W9tHgERWUg1BRUXG5t+8k79cn+Yh4v9XyOe79jmyPHBCGUDrQSjn3Ou+qm4O
	WPO0Vw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrea2nv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 09:31:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b23af7d7e8so136070115ad.0
        for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 02:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775554297; x=1776159097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KK5gjgnaalniXHVQETjquADftfg1WO+N6PsIIlecERI=;
        b=itEwDLiFTLU/DN7VL8NXRIdOxgYETCkRuoRCDGaebGaz+eKQmGxnrugFCeJRId2L0T
         lqqRLzY4unLO1p8yV/KRMsk6AFNxtMNQQdZsnvsXlE1TJ6i3kLPV55MEC+6b/GbyqNft
         hB0+imxQVAp92dyb7Ovf0Mus6Xf/MI4+Ws6VFwGuPhxAx2CVbR/W5mVarMHH+Nb2t2Q3
         AQyiO+opuGwNkg/nb0QhUt4eJRZudNpijl2iwJm/Yu49n77uuyFNAdfxvlmwz4tEdUkz
         ccOwuiPaXwb+F9pD89dLTFIyq6WKhfVGptzjCIwl0gfPVHbdYDpFlrkrcdy3c7AiBAO8
         MWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775554297; x=1776159097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KK5gjgnaalniXHVQETjquADftfg1WO+N6PsIIlecERI=;
        b=Rt2O89Zc1zu6WChADc0eNdMYfPJhj33FPTPJ/oKieKBhtm9BMY056CTV88rG8X5Iav
         vOSVKc7+atCgSuykf8CiBx5F4P01bkCb9n8JQ3MdGMCq57m8UpzLTtl8E17MKbP5vr1j
         HxlfVAJWhgD5fDx3CwQyjX7yYyh9Rk4ZvbbbM6EJbF7obHMSStXTXng0uOW/mkZee/q2
         eBnfmEODgYP/e8euHIAchVr6NerYGG7qq7YmGmeIs+weHbljeGJS9Wfi8Hd/x0raQKYi
         r7aa/FAJejl4SNKCTNYdFD3cGWCLqXoSXUZoCMqYi6OzalM32Xa6cy8Pfirbyxs6mQCi
         xJfg==
X-Forwarded-Encrypted: i=1; AJvYcCUMFh7H4fhBxA9vY6k33tBDXHaPcAEfvruTAhHDW6V3WK/BRQNlic3noWSz97JQ6Flx8+JwPo1rN9s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfJwLzkP5oTuVcm2m4kUsp/JMGhgeJq8RSrTgmGDYkRgQM/Tbj
	/aCo7qY27Iu+HyVY4KyT/jxc+7aRAX6vmwE2ADL1D/BmjNU73OHA5M1e9/Gnm+Be25QdoQJrR7p
	n+ptvuVCuxayL0SRmwfadBCcCw73J+MvVTTNbMni2Bn8qLvW+xjQKvGhzsNrvy9o=
X-Gm-Gg: AeBDieuYug4pKbITYMOeuY3Bj6RkSdxsHsjRdWnlZxzmWdzJRqOZHbosmROK01pHwUt
	dPXwDbIZcAEawqDfn8jcMQ8T3BlK/7EgYk52OSI2kPDThyULa3B6od7We2U/3sF8VvgAxSzr15N
	f1EDQMmZMPYwn+eRDhLVQjZr46nIuxHOfmn64ZPJkBj/0V7E/ygZYlmpVeaktYrM5itobeBXFFq
	E4/r4Irc77AfvSEzHu0iq8n7L68Pp5gPfla8UCPSefbbQZXIM1XqfPiEWaszTk79MH5EMS0ZH+G
	ORilCDWi2QwkOtvjdKeSWlOObuUSm79Ol6wc+PixiibSvBhAo8vNj+drnroPuwY4+TbCV0rGi0y
	v8SNkWQkyf5DBA8DdaxrZqKgbksaqt2LD0ywJ8H7N9CFJLQ==
X-Received: by 2002:a17:903:2c05:b0:2b0:6475:73d0 with SMTP id d9443c01a7336-2b281854f0fmr177278795ad.12.1775554296701;
        Tue, 07 Apr 2026 02:31:36 -0700 (PDT)
X-Received: by 2002:a17:903:2c05:b0:2b0:6475:73d0 with SMTP id d9443c01a7336-2b281854f0fmr177278225ad.12.1775554296196;
        Tue, 07 Apr 2026 02:31:36 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478bc96sm172888365ad.33.2026.04.07.02.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 02:31:35 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 15:00:52 +0530
Subject: [PATCH 2/6] clk: qcom: gxclkctl: Use custom disable callback for
 gx_gdsc
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-gfx-clk-fixes-v1-2-4bb5583a5054@oss.qualcomm.com>
References: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
In-Reply-To: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Pengyu Luo <mitltlatltl@gmail.com>,
        Alexander Koskovich <akoskovich@pm.me>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=OKEXGyaB c=1 sm=1 tr=0 ts=69d4cef9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=r9sBLZ6K9uwiCka_ugMA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: _GLIjqJTtbjgOZNFbN3GVfG6bXLe98z8
X-Proofpoint-ORIG-GUID: _GLIjqJTtbjgOZNFbN3GVfG6bXLe98z8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4NyBTYWx0ZWRfX5BeYP4sM0/5S
 KR5hSNkhpLgvW04+b7oCGrxduxLAr7EiCf7O6Wu2iI/47YDbne/WgriynWOWCvFc4ocnu44Ws0c
 YJ/ckclYzQYSOrJVInWPnn6C/XKQfAVIv9lmNb+U7kXaoqzPP98t3lpLtrDbGNqEjlxw9OB1py8
 4YB6KNWTwF0aFVDuZieGH6Wa7uqzCnOZYJEsWZdfDrqmbYyycwf5C5wzt9YUq5fx9PjbtwIpKj7
 IsedCV4YByJiXgM2O3sTTSxFzRibdoUfdVmMwireLkIFgtTd6R/quQr93CwBoegOZo9Cb6hCg8S
 tKT/GTHYo7W4chteF+pFksuioGoR+6QAvZOdT77Wa1m6PCnYsNApszsy3mwBxVzADU44DkAJsz5
 S0DPmQNHieYjqIL9w6VKKqi4MdrmUENzlYmptvJf6up60E9E3mBCBf6i0kvY+5ZbDteyZzd7mFx
 I+cESzxOmtg1eDUcYIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070087

The GX GDSC represents a special GPU power domain that must not be
disabled during normal runtime PM flows. As per the GMU architecture,
GX GDSC should only be force-disabled during GMU/GPU recovery, where the
OS explicitly resets the GX power domain.

However, when managed by the generic GDSC runtime PM path, GX GDSC may be
disabled during GMU runtime suspend, resulting in warnings such as:

  gx_clkctl_gx_gdsc status stuck at 'on'

and failures in gdsc_toggle_logic() during rpm suspend.

Use the newly added custom disable callback for gx_gdsc to ensure the
GDSC is toggled only in recovery scenarios, while preventing unintended
disable attempts during normal GMU runtime PM operations.

Reported-by: Pengyu Luo <mitltlatltl@gmail.com>
Closes: https://lore.kernel.org/all/CAH2e8h4Vp9fJYAUUbOmoHSKB25wakPBvmpwa62BTRqgRQbMWuw@mail.gmail.com/
Reported-by: Alexander Koskovich <akoskovich@pm.me>
Closes: https://lore.kernel.org/all/gwVAH2mJerU4dBInw8pKmOs5aQK55Q7W6q_UQAlLFCsEgX6eyvSgXAWbNNMqAX4WmPlYCKUSMhfkr5Jry4Ps5EqnxYZqEEDd3Whwv7ZXGlc=@pm.me/
Fixes: 5af11acae660 ("clk: qcom: Add a driver for SM8750 GPU clocks")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gxclkctl-kaanapali.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
index 40d856378a74aeb706c2f4a7a17a2c5602042af2..d7cf6834dd77c2a5320ffb8548cdb515be237bdc 100644
--- a/drivers/clk/qcom/gxclkctl-kaanapali.c
+++ b/drivers/clk/qcom/gxclkctl-kaanapali.c
@@ -26,6 +26,7 @@ static struct gdsc gx_clkctl_gx_gdsc = {
 	.pd = {
 		.name = "gx_clkctl_gx_gdsc",
 		.power_on = gdsc_gx_do_nothing_enable,
+		.power_off = gdsc_gx_disable,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,

-- 
2.34.1

