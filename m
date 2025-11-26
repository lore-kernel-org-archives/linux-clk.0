Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84802F693F
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 04:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764130573; cv=none; b=Ca0sHUJJ8a55+0dsmabV+rOoPPYiTgROsZpAFOZnhNSqOmM4xbU/YoaLhpSjHyufZ9cL73QVUUBAU6CGSpd3g9f8ad2+ir06kS2BK5OSbJquxZrkFzjUBCK8MpCL/nO/k7MH1zbvt0gaUcus10D73MciEVPy/jqlaNCMcfuPnZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764130573; c=relaxed/simple;
	bh=PSeSY7/jsiZchmSk5Huu4DJFasQrVPpsmR3MeyXINoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ka5gVVktBcuEpx/FxlmVAbFDBIFwgP3fOVUu13QQo4CQkpjPNOLnfsd5Y+Y5mpgiMaYaFc4YwEF/5LUjHfi0nqcbxPx3hih35xWLvVyliFPghS0kRZQw6g91DZY8kNzaWzWwqBhAjIGD6oCF/6q/nuUHpwNjE1wGIgC+dIdDJ7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E6Go5PJQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aoEtQRcT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E6Go5PJQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aoEtQRcT"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ3RduI2726802
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 04:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Oznjn/lJICc44Km35+Ewed+SjhiqmOteL6HGdmMJQ8=; b=E6Go5PJQWXGNKQGf
	vb4MYOcCwphV37GRAhs3tEDI4ztxmlYOEmySNZkWQtDVfH4LmzxgB3LBNpLOXKLL
	yZqgepdebXiZLyTJ8BNXz2PA61nuc5iCU6dXVCmPQrIhy+L3JK4dnMzhNsEY95N8
	aedGHEsW1jlCJ+A2z28QT2xJcnwLWdptHU8/LDBN0+4OFzYcblmwcc56KC14VzDS
	OIUBmKN0sbtCV8NoemsLPX1tRCW4ZxSw0KPBrwHXSBGFFT9tqRvusz3bW7XoV574
	klp1BA8TmKTjDsQGxwfg3KKM/AIS/QCGbZuogGqkaERNhVI1rb1vO9XxY7c7Qo0Q
	P7lEWQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an8rvu41n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 04:16:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2982dec5ccbso134466215ad.3
        for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 20:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764130568; x=1764735368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Oznjn/lJICc44Km35+Ewed+SjhiqmOteL6HGdmMJQ8=;
        b=aoEtQRcTmwHnHfyJ9WIA2+wlxTCKCjzoIR914VenyCIK4IT84Gd6uUqcMppQ3vTZuZ
         u037ZAr1gwZqA2fYDdBSaPeureJU0mToR+7Vyn4B3bqB1a4RVL1pS2+3d5iLK0i4ldfq
         juCx010udtid3WWdZSMRqoAWer2g7ZAR6KwAfq4h5WgIz8PL+ZAWVZVqHGspVPK2CQN1
         +c3u9acVobN+Ybby80KtMP7LYth/KBp0XeN1SqxioxnpWqqu+kKMX4PIyjn4w4SbL1gn
         CcxLne3/xcPpEdCJoSeTbrI9sNhvLzNrM028eCDksjZJfJNioT/ievpaIhKJPZCwCeuw
         uZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764130568; x=1764735368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+Oznjn/lJICc44Km35+Ewed+SjhiqmOteL6HGdmMJQ8=;
        b=ulUiMMjVUeS0d95a7xwgoXERbvMdwJrWVv7ajdFzEU2JKRo/hYg/naaetd4Ge5TYpo
         utiu/GBvvmeJ7/KCb3bzo+pNYpXVNmJEz6qM9GJQ0dswYI8laYGPaTXAj2vz+JS9j1Rr
         kVhmSKvGQB4hVw3uI/mUqZQIPUGKILekHBpn3IqwiGqDCFiLDhKfbKuCEY5PRc+Y9kJT
         zHqUKD7ES4gOXwNPtAQJHmLJgDeAL+7T0OcdOEsLQ9N/xMsGdagMeNOWVqZ0NNMVugqS
         O3Gh2wBDRifhqmADu4Ys5IafUgRGF1MAnggocFx5IBR3BBlnm8uXcSu4gLXWoQB2o0W8
         sThA==
X-Forwarded-Encrypted: i=1; AJvYcCX47MVzvp3sMA8NT/jslnvTtyGesdnYfZmW4zf44gFbEDXgNmYYoO0VI77ruzm5SavAoKKaz3Q7Uys=@vger.kernel.org
X-Gm-Message-State: AOJu0YyONAgI+hv1TBE7ZBXzlKDxQ6hHgRNvAq+4C2EjnxZyuKjx4hd7
	lyL5RZjtbovmBokIddApg9ByMhN3gbAkecu9CjhMSbph2S6t892SUo4A5QVvOxktffGJ/3nfGNZ
	F1rJyGX4gk+chmLWeJhtgxroTFhHm+Y9DUi6r4YAnq8x0lWWM/j1d+4I264L1RIY=
X-Gm-Gg: ASbGncsaIRPu5U4qoOI3sbpb5zhATG/cSDMjHSP5EbuMdsKvVoUX5IH7bBXurDv3YYt
	uzoXv4gTrEyBWJ2pLrlybaVsX4WwyoJl3CZg6N9aQ9wI+F1XyqO7oxzX2Qp46cjwY9v54TD92W5
	x2XWINBpBsHvA1qHq9/KFfzfz64olkHQYu5LXzarjSyTdhjeF0KgC9fj0TI/iB6cgmFv3KkxQli
	U3s1wjwg7MzZOOH2bvwpm0Eo+I4nhmzvVZM98p8rbtub3q8ZFgo3WC964mxOG9YUIs5Zn1IrkG4
	+pu7IWWb4d1I0eGg2s6ldK+xP2Zur4KDhsbRirfTaV8VGwvp89Z+ozoJImW4wi6CobtDcYkSn/l
	nshIk4V3NiywAFA6yupBZ7pFpc+vR746axVvUa8L2
X-Received: by 2002:a17:902:cf4a:b0:295:596f:850a with SMTP id d9443c01a7336-29b6c3da11fmr193804965ad.5.1764130567876;
        Tue, 25 Nov 2025 20:16:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExSHlPyLvZ5FuLuqVyizbUYG/FPtFeStCPdljHhYVdeav3ocZUeHBiReiqUE36C898Oezg7Q==
X-Received: by 2002:a17:902:cf4a:b0:295:596f:850a with SMTP id d9443c01a7336-29b6c3da11fmr193804495ad.5.1764130567389;
        Tue, 25 Nov 2025 20:16:07 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b1075basm179300125ad.21.2025.11.25.20.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 20:16:06 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 09:45:50 +0530
Subject: [PATCH 1/5] clk: qcom: gcc-sm8450: Update the SDCC RCGs to use
 shared_floor_ops
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-sdcc_shared_floor_ops-v1-1-9038430dfed4@oss.qualcomm.com>
References: <20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com>
In-Reply-To: <20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: kHjjBo7Wc2d3ChdtNU5VbzE4L5RhoEMO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAzMiBTYWx0ZWRfXyA8O9urgTvzJ
 HteK2RzggUHLevQxhLJYp6UwVo9AxIPYb30a6TeejW8dkw+mJ/kUb8sTTYtmA87UuxEc+dZrccJ
 R5M3yrF5LsIOtxOvq/SOIbLryvv1C7J2fhrEcPMiBuMhPXNJalr3/ash+5HB4Vien7tg/3fsYrd
 sEcUrFCFfKG4/2HiZnw0epwNvo/ldkxp9PwZtBjuVE3wQKxSSq4ucduqHMyshx5cysh6EC4DflC
 eLsgrIyM+w3Ms+f6wEiuf1lwvIX7hJM0WshJneOSmK2e+YF8XyLwEN6Nx8UV3+NsR/O9RtQA2G9
 eY+9uBNBsEaF1bGhz3MkTNEOBcr17lQIAU82zrjGqES28408EgwOM2ar3QCLwI5qQvl4nkCS5oa
 1fens+utBbjxwbdKN8o7GWy8DKdK/Q==
X-Proofpoint-GUID: kHjjBo7Wc2d3ChdtNU5VbzE4L5RhoEMO
X-Authority-Analysis: v=2.4 cv=Ushu9uwB c=1 sm=1 tr=0 ts=69267f0a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FOTRiHr0QPuqn3MmG-gA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260032

Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
during disable and the new parent configuration is programmed in
hardware only when the new parent is enabled, avoiding cases where
the RCG configuration fails to update.

Fixes: a27ac3806b0a ("clk: qcom: gcc-sm8450: Use floor ops for SDCC RCGs")
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8450.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index 65d7d52bce034335707014797fe9002429212a14..b18bb34889ab28fba13cbf2ca8cf83101e4e0484 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -1034,7 +1034,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 		.parent_data = gcc_parent_data_7,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_7),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
@@ -1057,7 +1057,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 

-- 
2.34.1

