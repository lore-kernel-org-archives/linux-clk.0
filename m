Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37B83126AF
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 04:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764130592; cv=none; b=Y1VhHlNWmptIF6YrZB6yiy08vrFjFgymIfq5vZnAqHAAKkSiBKZooSIkn84lK255nMr/Ein/PxzM7YVc+oS6oOoD0SnstgdsFET+NI5Vmxz5gUI74SghQuacsO6qeW/JHrBq5aMSeyYcZOE/6DVXiPlGCYou58JsoiBejd4oCRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764130592; c=relaxed/simple;
	bh=Gd9DDqbdG7bMeapNP9bObd2qmR8pCtMzEvur9SG1oTc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d4qugH6PBYreu+lKBWPvmiZO7bdwUQ1ijxsr+K3K+eGTFDdK7/Ez3iRTB4sxNWkI3Sx3wnE+H4QoIGstWvsOhlbUkxyVcQZwFQ8WGAr60cKcgyRw3xzzq1FY3qFYDLEP/OuzSs2VhTsErOWLyQ7Oa2MMjEZFWUzNtYM3sUWOH98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oan4DMnG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PklKeOyM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oan4DMnG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PklKeOyM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APNMnlr4049271
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 04:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hbN15rVn0YZRfafDVCeWQy1tJToiZA5rt2KKTjl/QzI=; b=Oan4DMnGVF8jfSUG
	1YMUDnrTUtfDHr+oKvRWZZ5KV4jgSNOVDVxz1KtJcUoQftpoa6/QvW7cD3lxfies
	C537s6Va9zdRDS9ibDViyoZc252JalDgzOEKIHY1BoIrkCrzuG+U7HvOC3rVERXz
	GrJ/Cen2+LU5ArO0cdFm0PTx+eEe8smz2MHBFwXW92jyo5meXulkrsfM0e1y195O
	89p2S8t3CcWFzNcxH6ZyyKFldoMPmzwxIbWm35wbmXnz5+FJXLJ/Gz4Ov272b/sm
	ISk5l9x51FH63nKcnUq1vKP412NK/XmXZFmm30cPFA460auZizV69Co2H/sgA9F/
	lgzTHw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anp2ngkfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 04:16:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297df52c960so157800085ad.1
        for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 20:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764130589; x=1764735389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hbN15rVn0YZRfafDVCeWQy1tJToiZA5rt2KKTjl/QzI=;
        b=PklKeOyMKUW07j/xRdnMkiQjxPC9B2PPiMhK6gh2J0qbEHt/Y60rMesDc9El+G74bE
         F/cLrjk0DfVuzPVZWKi6uoeDMuc0nYklY9pVS4C00FqH/DNTVtedlcJUouYPHrXm6j8H
         8uiN2UzVAVAkeAoMNLkTfmY86ypLwzQmDfy5W3kSIh7yHgxwn4f5spRWwR0oVEak2pZ8
         GqzNLd/LZwPJpvsvb0jXIkhIH4v605tzbuFKUZIkm2fYHviYW+dqmUtPok2xahpDdOCF
         RMu/zcisqYAakxZHjbS1W5NviOEiVRj/NKW+5pAJD9nPZxp5kAAm6bPmjSBojJ3NfIlb
         VdjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764130589; x=1764735389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hbN15rVn0YZRfafDVCeWQy1tJToiZA5rt2KKTjl/QzI=;
        b=Hz4nhBYoIz7cTwaCe7H1eBPCoRgS2Bwj5pnhXvkoOU8vQU0oDobl4GS3uN0AOOYI/F
         kAP3ZPtFoBEhmmCM8hK9KWRHo+o5t1awojzmKS8NY4f0pp9Kp2wQwdOlN5TyfuIeDFR0
         Rwn7OGCojcoNOh6bAmFxoE7uwzCKXco5eli7ZXBa4Mi6x5S/SzjTxKoOHFcYW/eLrn9f
         euEfxoAoxwiFID9/KJlNn232n7bUlI8/M8HPwJSp5vUgbRWiBFKYSy/AO23dm8VeKl0M
         Hl+iewForTm+BXdpSHwk4it+3rC3nQrMjueAnJPS75KhDP9iRl/DQXJTN/Q8JLJmXC7M
         l0+g==
X-Forwarded-Encrypted: i=1; AJvYcCW3BRMGdmt157eFx6W6Edy1X5ABi71RsX1B4tdjabgRt0HXWA7h21vqsNL41Rn858+cYdYxvU90sag=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2HBx5WtYYqMviKovCnFQVryIS/M9HrEJlEg29zwXwyzstWUbW
	asAZM9OSWBivze7ceYqY5zevrqTSqRlReg6tnTWKLSWjyg6lNm3gHmyuHCk/45qcqiFPiisKlKR
	XqGOXoPxlhu16xulld/Q63jaKlBr/wo1kw3Yv16daFe66oxk9nw2Fwu+LgAySVcE=
X-Gm-Gg: ASbGncuayabX/ZWgnZhA5h1ZZR5tb2q3TYB140nXCAZy8NACUGCCsMarO1v389AfAWG
	liCfpuPa+IRjTtIObbO1unB5kVfjoJmjS8aZnjU8KHeHvvF5ZZGcaT3w1+liMuSRdq1UTrUbLOq
	WH0AJAfp7GH2w7LXMtbvPCHZFTU74lCsoBtviVufmJwmlmdOVymtOFw0+9L7WIiSYMdRegrZH3r
	4LR6L3NVb99LzHxJUwtlHoN2f7LIJQyGSYtn4M8mUySIbAVRBcTNtJYyOwPDtrnqzwEeYlGthYP
	LfOwo0nhoCekaaFAyDUo2sVBqmkrlpq9eew2jGZ7ObKhrzfsCyCz48WJtI3DZHHsJIqEEndWOOQ
	EkZel9cAnFJcJ0ETZIQwQ4lBbiQ3rsB6EHxPzCIRq
X-Received: by 2002:a17:902:d541:b0:295:20b8:e0ef with SMTP id d9443c01a7336-29b6bf8165amr195705315ad.57.1764130589072;
        Tue, 25 Nov 2025 20:16:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+8vioPCSNogy1e8vV38+UzH238JRex1pqVuDom8uvuU/axu7qUlLwbhLuahnkr3Wd15iQdQ==
X-Received: by 2002:a17:902:d541:b0:295:20b8:e0ef with SMTP id d9443c01a7336-29b6bf8165amr195704895ad.57.1764130588599;
        Tue, 25 Nov 2025 20:16:28 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b1075basm179300125ad.21.2025.11.25.20.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 20:16:28 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 09:45:54 +0530
Subject: [PATCH 5/5] clk: qcom: gcc-milos: Update the SDCC RCGs to use
 shared_floor_ops
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-sdcc_shared_floor_ops-v1-5-9038430dfed4@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=KerfcAYD c=1 sm=1 tr=0 ts=69267f1d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=LYfvaOWUJrKu5F9ctIQA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: hsoKK-VvtN-aMyckVSUhkqU6XaE4SFY9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAzMiBTYWx0ZWRfX6TdH4YO9KS4f
 WA9dXndtWxcZPuFeAXgjLJSOyZZRaE0zb75YA2EQ5LyTqXgY7+Y7JPaaR0GXx/Xo5TNqQt/y9z0
 SLKfUuoQs+Ufmxnb7Npgjhk33RkddGWD5GDiG0xH0fhKe18Ot0PuhuTk4dJEM2QR4sphvIzmRXN
 XLH97Ro3bZEq+lF1BvIIXbcZooLH+0dyj0wCRGV21ALMdAASNZ/RbNz8oOmkFw1QY8Usr2h56Sr
 rpboqp3DZ5C8CAnUr6nKtKKyv0i1jSVmvdIbMTj96NS4t4DE7caFwJFqQzM0agrmjwi/mr4GKb5
 BB0lfM2OrB/qiqD6WVKR4p1BU8TI4Qjkj+CcHBk9VCk5uppMnQjQc5e4qRDxgnXXTz1+Ndhk5Ku
 BhXjfUzVtBwPWtNeXnNlH7n/T9n6Kg==
X-Proofpoint-ORIG-GUID: hsoKK-VvtN-aMyckVSUhkqU6XaE4SFY9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260032

Use shared_floor_ops for the SDCC RCGs to avoid any overclocking
issues in SDCC usecases.

Fixes: 88174d5d9422 ("clk: qcom: Add Global Clock controller (GCC) driver for Milos")
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-milos.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-milos.c b/drivers/clk/qcom/gcc-milos.c
index c9d61b05bafa1618274cd87c83df6fd14131efcf..81fa09ec55d7f6d6cb761affd3b93301a102f61f 100644
--- a/drivers/clk/qcom/gcc-milos.c
+++ b/drivers/clk/qcom/gcc-milos.c
@@ -917,7 +917,7 @@ static struct clk_rcg2 gcc_sdcc1_apps_clk_src = {
 		.name = "gcc_sdcc1_apps_clk_src",
 		.parent_data = gcc_parent_data_9,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_9),
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
@@ -938,7 +938,7 @@ static struct clk_rcg2 gcc_sdcc1_ice_core_clk_src = {
 		.name = "gcc_sdcc1_ice_core_clk_src",
 		.parent_data = gcc_parent_data_10,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_10),
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
@@ -962,7 +962,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 		.name = "gcc_sdcc2_apps_clk_src",
 		.parent_data = gcc_parent_data_11,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_11),
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 

-- 
2.34.1

