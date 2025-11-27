Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A352F658F
	for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 17:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764266343; cv=none; b=TXkh6B/l5IUjPi4H8a/LATj4hYLtK4TkRMCCNqn3ihPr9e9r+bi+z0Bmqt3l1iMG5hkvhrMd2/UEz8TNopYxTvqwTWLsygi7vWZZ8TaDMPt3E+1X4ojHrEFmic/u0yGRqiDkZvZ27vicpXsC5B1wqdxvTBlxpDHctIqWAVCV9Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764266343; c=relaxed/simple;
	bh=3EtaK/Ap3qzlNULqdLpObX67a8X2lyxz27kHHlljs+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OO+VPi8SrtqngolMtU/M626bSUIsaycrkY5g3TcT0j6zxXlpenfPM/WyGBFhXwrH0we9TqLXYkXyBMPY9RaDr0ZEaKNQjMXl9uXCR7VTgnJXe/J/O6P7BFYe8Q0ViA+MgFhDweoYBZop/V6XdeslNAn09Ho6sy3seZ74/F7mZGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DP+9mUlr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WmoKtUZ/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DP+9mUlr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WmoKtUZ/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARHY9Zm2388038
	for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 17:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NB4bZT0vtjfLMUEWEcAirZBlsWCneJ4N9Y0ZGs8z6dE=; b=DP+9mUlrAF9dA2CN
	ynBpnLk9suhdjFl0gmgHsm9s6JIUfI4sWV/n1qtiXudyNBxAddUVSm5PTdVkJOgC
	/lGMI6utQkf0Ig4f74YJPkNVchtw0v3xExskgSG8nuOg9i7pelHAVbenbcuR1Hbn
	e/OlWIsbQfH7fppWe67XW+itGd7ud6K9EGJVL1BO71sjRFWw1Uk4H0s6vh/vMErf
	46UPIeQJGNnxRK1sD4dSGKwHlF4xWCNuOwRgMacxR/b2KZnmlwgK6b/KEsfikBJu
	Wh8w/jUs7WoTMryqbE65fImuLlpGgfr5dAMH0wHpDJo0umMsRzBXC6jOKkJS2qHs
	aarFvg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap7n8k5da-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 17:59:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297e1cf9aedso17826285ad.2
        for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 09:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764266340; x=1764871140; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NB4bZT0vtjfLMUEWEcAirZBlsWCneJ4N9Y0ZGs8z6dE=;
        b=WmoKtUZ/RIBuhs1IZmOJqfGUkegtALg9s8k+ZykCov9QgtjvuvgiVMqGRIfG2Xg2fy
         jg5dyZA0zPL9+jgU8Ar3rvqBt3woPvm26cjAPBsq9+Fti+grwIRQ5b+jbqUXl9SqW1qH
         NVnE+ohZ5OBrvZp9uerM8P1FAYIro7Vy9hxoXVhOsyxoBqBEKsofTQHlfK1zMMuLBIxM
         Nk0CC22YK2+NM9dyouOriUmLHUEQRHbR39fBHpcygGYbVMpJLLipxSMbU6lt0c6t4I2F
         GoSqZbYV9iOMBEmBrhH1ExwU3sHxYD0zOwWEfRqHk60KKx4YTVoIhfxsm7HNfhuqp/PO
         JIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764266340; x=1764871140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NB4bZT0vtjfLMUEWEcAirZBlsWCneJ4N9Y0ZGs8z6dE=;
        b=sPpK5e9YTs8oxMJgVmyKqL5Bt1oD44PuV45E0mxob/40gZX8L5lEOWWvZYOYq1GBtV
         hXG+k4KZnsARJOZjX6rxthglzQezcqP9L+7QMRie4fgYjd2KXpWtiR2/iYjH7ee2OFz9
         23liyvMWAGxiHRleOMCFxM7qDsI/2q2/3AXUtd/xdwNmlP0ibut+Zvyx5vY4xev+Upcz
         +sz/OCXMVjOckSjiUH5KAevWeuzGd8RqjIqiRnalK3sV8/4aWaor9IHO2SKMaSKXQLll
         vU0leAo59iYTfMoSvqrwrNtt5OdLK15rd1b015M3ywn0fVo0bQMggYm/stS77u+Gwm1h
         TFHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXxLccMSD/meQczAzOZUPJSHKaDtbY9HNW9DhcQdl8ZYtoJs+CSEMtb5XtiD5MTycbl4B0HgNWWrM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yykl6aGxlcF/SKZTX3Kb3GjUmE9eOE5IO/ARmYcBuKvckMI8dnb
	BLQ8k7VvdbS0GMGXlHq4J+ieNRBAERy8FeZwL5p+XRyWmIFWoVkOVbT0MRcpuzrpdBdV3+eGSP9
	HroJnZTt1rsFshrmt1CXjroZ9VR+V7DTn2hm2kZ1fq2VWupQx8IUEi1hSuZcwwO8=
X-Gm-Gg: ASbGncuXJUmSQ2DWeyORRQrY2azEIZiIi9VaOkO2FoxmWuiexFPoOA/glL98jUXrhdH
	YzLUabfHiiYB3mI80E16ttKcZiECvUp8Hh/N0tPTysuRoWk1QdE0mMEBNx5kyYvQUQW9ZPhepbT
	pMsdP4btpZ7rAvD5s4gAPKcZCShRkqeCbrdUjk7KuKDbSJRypBsLs6pbp6BbiWF0/H5DqEzYpPP
	rs85L0nLN6xKjySKt2J9kCd7FyN0kna5fyKGxh0qUxZs/SOlUN9kOBzV+sFY+upsngexJSPs/jT
	4qFmUE1Ziy/wLSp4R8G5uG2UkTldPhNNX0AvZ1jl37Jft7RCIfBldQASBfm8u1DgaeTmStrcLXp
	5TR0hsNY5aFg4V4wftD0JzLoRD4xvWf1PuHSqY9ki
X-Received: by 2002:a17:902:ebc8:b0:295:290d:4afa with SMTP id d9443c01a7336-29b6bec6564mr247105995ad.23.1764266340194;
        Thu, 27 Nov 2025 09:59:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwvqIkNus6GsAAdWR8zjoVzWJ7RnYXcx8VVP9ZnJTN3mp1wCnsXH5d/y6jph+qFGzTSrPEKQ==
X-Received: by 2002:a17:902:ebc8:b0:295:290d:4afa with SMTP id d9443c01a7336-29b6bec6564mr247105715ad.23.1764266339743;
        Thu, 27 Nov 2025 09:58:59 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce445927sm23785535ad.37.2025.11.27.09.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 09:58:59 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 23:27:43 +0530
Subject: [PATCH v2 8/8] clk: qcom: gcc-glymur: Update the SDCC RCGs to use
 shared_floor_ops
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-sdcc_shared_floor_ops-v2-8-473afc86589c@oss.qualcomm.com>
References: <20251127-sdcc_shared_floor_ops-v2-0-473afc86589c@oss.qualcomm.com>
In-Reply-To: <20251127-sdcc_shared_floor_ops-v2-0-473afc86589c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: pWLXBnE6El8lbZj0aKLdTwS0Qh6MTvK0
X-Authority-Analysis: v=2.4 cv=AufjHe9P c=1 sm=1 tr=0 ts=69289164 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=BHyzMCWm4d9bGE0EpZgA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: pWLXBnE6El8lbZj0aKLdTwS0Qh6MTvK0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEzNCBTYWx0ZWRfX2Inorj1+pdjc
 HQ12uFPOIYrzsIWoq6o4Q0VsBL9A4EcsynFYfS39sDb1yg+L4U9MYZ16OeW93qFNjM8SDVmKUoz
 G0t5skwVJnnPF+oKsH32QoM8cjS6AsmzYRAqt6nBmmI6EVb7PRXVUJrBiCjB9lSIbwZAY8SgBAD
 biwTP4nAahFKB5QyXE9bzCzNOgNrOvHyDKZEm3PpDcQs/s6sAklE8RFxwVMzgdCwh7ydKYZaFHR
 FiGIfUuT+JHMH7PIY2CgQCnGzbV+j6rDKL0nhTFeFFPRBiLMx5T5MAJdYgHNcNCKg8ZTUMqR9dF
 ANM3nRHw1X1auX4h+IhqXUYWpKpAy+SL53W5wf8B5mh1T0qrvQLfPZONLGt0K8MomxtYI5YYaVh
 bONBpBw4EKwyP4Nb4jAbU04DoQYlWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270134

Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
during disable and the new parent configuration is programmed in
hardware only when the new parent is enabled, avoiding cases where
the RCG configuration fails to update.

Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index deab819576d0e18afb0b699b7ec6fa4c155eb5c2..238e205735ed594618b8526651968a4f73b1104e 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -2317,7 +2317,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 		.parent_data = gcc_parent_data_17,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_17),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
@@ -2339,7 +2339,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
 		.parent_data = gcc_parent_data_3,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_3),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 

-- 
2.34.1

