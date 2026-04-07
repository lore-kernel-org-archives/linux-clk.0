Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60893A6B95
	for <linux-clk@vger.kernel.org>; Tue,  7 Apr 2026 09:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775554320; cv=none; b=QaAKONYNG2fJ/ugV0VMjTAQ9XVghOo3yx05W1chMg7NhpsZoNnM7cQah5NvgCeskMHbRo+ldU4Fav0Idt74Tz2W9G6cx+1dqQzZMmzXZ+J8ZqZNjKmtG9TqIlIlg4sUOuGRT8B+9LM24f5w4TGFCwGxor2pEEgvkAn+Gt9uI4t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775554320; c=relaxed/simple;
	bh=1WuIHXjP1EOU8oxrMLqv00jirlI6wlcaXjj7IvPVIE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WPJNNGOp0byoWEKqOmGOLgiKJYHsy3wvV89s005GoT+bzDZcWpZ00Z4Gi3WmKqtIcEBvcZQiLcVHkRbSuiKwtE91InK6fnPKq/kGku3wOrC9GgwHa8TY0TTikcPfXipyCmVPL6CSUWhlYv4vNJgdNWhw1iNYcSJ3TbqV97MyGDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nSnbsysl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oor3SxVI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nSnbsysl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oor3SxVI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376RuxX2550324
	for <linux-clk@vger.kernel.org>; Tue, 7 Apr 2026 09:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2tjvfWn90X2gwQ0oPND/UL5ENlIlf0ru6kXbNjLjd5c=; b=nSnbsyslSbWkgVmV
	E9qgjM+KFyawR11GzKroT5/BaFql7b5DjuINjxJ8TsnHomtr4nd2QV2oqD2Q8hLC
	U5fbJHd/98jEttC5+vZmWaGGpfXnRQlHpV/V5Ay4gwYHP8O6PmlYDB+zCdrqAEjW
	IDI20LtLWB3xWKYGOHJS9vMgWfNvGePch7E/4Yk/XMrtdkSh2bSeGOmd50/KVdUY
	p8WIOfj4JnctrgaegbY7OmRGttWtnQIvGpKlZ6dtSPMb7QywtjTfBRbu42LVyBK7
	MRdwkiGhH5dlr32VWCEiANP8hDImHALYOhhbfGsqAW4/tLhkmb3L50/2yWIwINdk
	8dyP3Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrea2qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 09:31:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2adef9d486bso75953045ad.2
        for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 02:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775554317; x=1776159117; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tjvfWn90X2gwQ0oPND/UL5ENlIlf0ru6kXbNjLjd5c=;
        b=Oor3SxVIs7pETtzIPpV1yd4QLDyrHdHqsqpsxRQWCCXv4IAiWHITjkMasEI12QsIYF
         5YIbMxD6nLGcSAqEOTFGOI9wGY4KoiOfc22Vg43oj2gzM7OfcKmtX2Y73JtsxZBSVm0g
         x3xtPmcbypFQ9GmMamjFtu7HMhsd8DeaVZ86r3m0KIqDuVqWoJkJOgSNw4siCs9iMM18
         C8lO7FXP9hj/nvmfzT+AKIHAIVF0FdbuatHlP16ybKUDzXmxL2BhD2/Z45x5MRNGJOSj
         UTMSRRzst/jIgiDH2X255ISFmHHXcvyC6y95AEEfCtiKlQ9Lx02PAAsT/VanpP/UGkMs
         jiDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775554317; x=1776159117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2tjvfWn90X2gwQ0oPND/UL5ENlIlf0ru6kXbNjLjd5c=;
        b=agiq25IM5pOOPJwlvTOh7KiW1kq582b36bowexKoIc5sYUH/FYRbnOK+SEDU9r6kcr
         vJOWsVOYco4PS24G+Xs9asj9iwVjHAAC7Hev8RVMbIoSDGByzgasFOeilkJi2yWwiVMy
         8IuMk+GJ20Aqz+ddaP4nDN1FiSeQfJ+mjtZLlqfkqFbagJxHMLoFKGFXZ5KdsbSQN9XI
         3/jhbCY15fXMt9XzYodh/RKtx6H5S8AtAngMiKnHNabh5vhS9d2XbkvTgyurI2Q9h1Oj
         CxeCfphLAo64KsLru0IZjsPwxZkvnHF3tGw0cEKDqSFsX5m2tQMC+w0YYjBxNb2pvma8
         iMGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlfF0uH4KatS/AcrY47n9gZTt7ESN5hMO/CzygMIi4PI6yN+e3AM+XcqEXJ4Ki42TVjQRdWLiIpAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfKXswzVSWJecjtwS4yzl9Ut9NX3IhBegURVCO4Z32F3UYv78R
	RjgywKw0m80ZsE/YJseI1+p159EzrrlvuOmpLy1iIBRSZE0Hc68IbQaLy8XogejBwYzuLsYqf4n
	OjuzMQhJ3sXx3coOSNqy0QMq4G1g+GvbJNwbQUu5u3hhLRoNLLbIWPbcXSZMNq2A=
X-Gm-Gg: AeBDiet+Xcs4LQBPpCYJ6CyEQCN+Ykbmigl3wNMONtO5x/SZYaZGOmsAhjHjXItnJji
	tIyDVhilhhq90Em3TE2kn5EZesFP1h4XI83AI14xj3gYhFVvSD4EaV5n1Yt7zjfpjIl0pJPv0u7
	BpFKz/POEdL6sybETKsBmMyRJljNgzlxPZNEVXmyzZoZ04Kgs+uDvQfIe3wW+HTRjooqj9K1ZQ8
	LGEShSmcSSqzIMCcqCGAvI+G66BXs9DWwvu11m2+Y4PT01cR75aBzUrvAGZ9swUbyJr/VVrNL7x
	2l+gw6dxhaFfVbAu29vJIFQkU9lBKwWBDtM9PeUsepEcKkY49B4X4R84A8kid3MOQI3XzM/yH9y
	JJFbglfi8eDiQHRjDOFemksG3/yLtmrL6TKeKKzvvInMxiA==
X-Received: by 2002:a17:903:b8c:b0:2b0:6885:f1d4 with SMTP id d9443c01a7336-2b2817b5e43mr172138005ad.39.1775554317321;
        Tue, 07 Apr 2026 02:31:57 -0700 (PDT)
X-Received: by 2002:a17:903:b8c:b0:2b0:6885:f1d4 with SMTP id d9443c01a7336-2b2817b5e43mr172137655ad.39.1775554316829;
        Tue, 07 Apr 2026 02:31:56 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478bc96sm172888365ad.33.2026.04.07.02.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 02:31:56 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 15:00:55 +0530
Subject: [PATCH 5/6] drm/msm/a8xx: Make a8xx_recover IFPC safe
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-gfx-clk-fixes-v1-5-4bb5583a5054@oss.qualcomm.com>
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
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=OKEXGyaB c=1 sm=1 tr=0 ts=69d4cf0e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6racf7IOMx3K1H64_JMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: jbnUNTu5eaBOkxCd2bGf1WSiuA8Ly5mO
X-Proofpoint-ORIG-GUID: jbnUNTu5eaBOkxCd2bGf1WSiuA8Ly5mO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4NyBTYWx0ZWRfXw8axkwEls+7K
 oCJQWYsTI31XD+sAA90lg9vQoGAuClqyG+sHiwpIg3REsXJlEPTDNm6ZEoHb1ub7DZpVAkWwTSb
 jTH2kikwEyByCy++cydvyhLHnKmL4z2Pb5oY4k4DkSC6ECXxa0slfQ/g4wku4tZMlXUso9/tczU
 srTcBrkFOPoBYRWr4VKgMho9vEO8EE9LiONhV6Cu6oka9YPfNTuA9mQzyotGIHAUrkKXCvaGwE7
 u2GNBkmXP7lJpsClG9AJ1qq46qG+PZhTfTKjwV7OHogcZPrQGW+wlGMmdYqXuj28lym4gEU2O8g
 vPJIwoqN2yDXLWgt6Wmj5OQZ/BAztDFfz8j92hKqraeQEiVGChHZpx0TO073BGeNEJpJ1Sqhsmj
 7Q02UinU8PrjW68RM2PelJfih99O8PcIBvja7eyT8iwmsbtIz7pv6byQ2BdPyfhJjK/M4kNsrYh
 9+j0PhBIqRbuZxVoTyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070087

From: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Similar to a6xx_recover(), check the GX power domain status before
accessing mmio in GX domain a8xx_recover().

Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index ccfccc45133fda53168d3475ebd3d543f10268af..9b99ec5ceeb5826fbd5cd1059febf5bc5ba468b5 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -886,17 +886,22 @@ void a8xx_recover(struct msm_gpu *gpu)
 
 	adreno_dump_info(gpu);
 
-	if (hang_debug)
-		a8xx_dump(gpu);
-
 	/*
 	 * To handle recovery specific sequences during the rpm suspend we are
 	 * about to trigger
 	 */
 	a6xx_gpu->hung = true;
 
-	/* Halt SQE first */
-	gpu_write(gpu, REG_A8XX_CP_SQE_CNTL, 3);
+	if (adreno_gpu->funcs->gx_is_on(adreno_gpu)) {
+		/*
+		 * Sometimes crashstate capture is skipped, so SQE should be
+		 * halted here again
+		 */
+		gpu_write(gpu, REG_A8XX_CP_SQE_CNTL, 3);
+
+		if (hang_debug)
+			a8xx_dump(gpu);
+	}
 
 	pm_runtime_dont_use_autosuspend(&gpu->pdev->dev);
 

-- 
2.34.1

