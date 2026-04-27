Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA843806AA
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 06:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777271984; cv=none; b=WxxAqYip8EqZb9XU3CAOM9jzpVmmP97xk0sJzSU/YFrLXqJEmt4ZCgjJz5T9E4KvWTaZRAn3S/C0r1gx2XdDPDSBWDrb4677Sg3xKpUWuQahD+jnVwS8zOcsfE0sznrpF+PiYaFx3WjdWhqeVRgQT6A2yoETfsA8HSDnm+6CIgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777271984; c=relaxed/simple;
	bh=sU5/bKTcHz4y74cRJJQThCJj6V6cFUUTODgu5MX7PSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=djtKgg/98OXJdjWEekC1r3XXKRTuR1UE1iSNe3EhMLwm6VrLd9A4h++S66LpEaqoa4FTTJSdJfT31bV7gnvmR7dDDoFkMiTINBYfbKyKkI0CGBUIQDQlDt2wRTVqawASgVQks8cADjnEwS7Yn48qm4stfMpnKS7Qe3B2Q292Fgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SfzCHpGM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HHOv1xPo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SfzCHpGM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HHOv1xPo"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QGr6P01950998
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 06:39:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Spu2aZ7sZlC2v6vcrcvt66Eq5ch+u67lu57CxDRsDh4=; b=SfzCHpGM18QafocW
	NPb1KXvoKnxgHgJdKWoyUsKg4zsfSgvO6I5f2HH89DpFL5sQEc+ZcccvLXjCbFps
	VqH8xscCrWKjP9KZRAYSjFusMKws3LOJA4K8p+jjCbfWryXOOZqou0HCS2rRxijh
	2WkRC1xw5Xy5Vqzvx7dBvWVJmDyEWgeXkIYpB0ZhKkNBoqrxQWJx3RSBzHwbn9cN
	AE31ci29FE4nBT3uyRxvv194sKXXUPwZrL/vc7ilvsxRrwlBYDWPoyHRtePR2BPi
	j6pjXkOzkoNBeoYVpLMYq4gqy/OqefYWfZf4ZhJpcIvu+i1ff3QmHRqodsj+lSSE
	DBtAjA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqtct1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 06:39:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35fb6cd0879so9075548a91.2
        for <linux-clk@vger.kernel.org>; Sun, 26 Apr 2026 23:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777271982; x=1777876782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Spu2aZ7sZlC2v6vcrcvt66Eq5ch+u67lu57CxDRsDh4=;
        b=HHOv1xPoICZJM45L0PgNbbhpCZG8aQfdIIA9qmd+Xg3z2J4Mv6V6c6O/CYA4oJ6WUZ
         mEXdv5SDjq86Eg8blxq9xuJYH8sX7M3S+qE533UMTdYltl0Fg32sp8Bj9xx+rR5Ue06g
         TIbVWJbLcHvm6MdoEVzhK+YS7BzRkzVTyIFFulYoiK9+rtSI6LOV8AyIvyv9IG8rmUxF
         eypQE2HdcXNGGPUYh8qOMSP23rU1G+Tm6QDtYH1aUrAz21wNkdYbUvJLMvnxxeaKwZs7
         lMIXC7l695MICU9efE2qxSn+qZ4isuLzw59QC/h/M/ZmfD8VC+kpWMpYf95dnRAjyswg
         NKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777271982; x=1777876782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Spu2aZ7sZlC2v6vcrcvt66Eq5ch+u67lu57CxDRsDh4=;
        b=P5cxQMvyKRTTuJ2ZNZNd0SJbKajxAX/7N2T6e5z7iX0rhqxY+Rg1F0J6QmOWp+YmCz
         Ep/M8zetUf7Kh8w57bnoFPlo5L5wREJ4uB8HuWwLVCY+7VZpK20KWrcRZ6rHPmZRqpHv
         fY1yaPasNk87BlrNaPflhdiTvhwtAA3rQviztT4TEJYej3qlUBbXXwws2qTKpsC6/bCY
         rTGln3lwaJ6uyvpFyNDs5Jwt5aZX2gx/Z/rrCjN1s07m0u5HWyz0v9QKEZYqxXNR98iC
         SVMf4fyhjkY+wVREI08dzRc+1+7gCe187D7G36pJYwdgk5nypRdUwtIiYGytS0Vis291
         OWmA==
X-Forwarded-Encrypted: i=1; AFNElJ/AaII4NFzT8IgntxTuYt4zpwEbdLn8KJIryEg3eMi7X29K0HMM9DnZrLeWjLXTIQbr2RVTTItRixQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxB7Ylwqo/BEVug6yP+uB/ijLDWYfXHXy3UAyNoEtEyNXbgJta7
	z/dK8vmhrHAkYveJkoo8g43/2qRAnryn3oRdJWb0vVwXrcw1IQRb0NxIs633ddtgKKqxmVprfQf
	YjWQiFioDLiJuxkIDdQnjpIs8HPeNT+mbU7SrMSmWsQbFFW5fm0aCCwii+ayk1aE=
X-Gm-Gg: AeBDietl1c5g88M19/vThzvfEc8FwVZqX/LhK/RI+w7htWdFybjsdm6tMctVj/XZJ8t
	+ViZ4snrsQpJ6SPHZVWlcjYcvhAn+zxYIkWLm3rHrXLbGJw7bQ4vTXThjfiAKJ+UgYbPLge7JUH
	jWoifEcnFc0JQNzDIDD1xc1qkHf0w1cTgUV7bSUOne2tuL5/LYNcDP9Z/n0Vn33fDkI2x7A+v4h
	pIqtH27hAE2UTGQLwERRkczcsU/UfANDkbHCVklLe5omBWut3eNyhLL+dRunQc6FV7LJqIX3Rl9
	jSQww/XEQU8mDcJbfsZ3dfmxEdoxlZlby7CWR+KbVxV0COAk6s9IrcJVnLN4gPdlBcObI1m/6yq
	cpsVVt39pOSelKi0VblU5QYAc7SQXNKCCvqyyK0DgkYPQb75RSzJDyjHQ
X-Received: by 2002:a17:90b:3f4b:b0:362:e7e5:a20a with SMTP id 98e67ed59e1d1-362e7e5ac9amr12823665a91.4.1777271981948;
        Sun, 26 Apr 2026 23:39:41 -0700 (PDT)
X-Received: by 2002:a17:90b:3f4b:b0:362:e7e5:a20a with SMTP id 98e67ed59e1d1-362e7e5ac9amr12823621a91.4.1777271981496;
        Sun, 26 Apr 2026 23:39:41 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361410a7ab7sm38628234a91.10.2026.04.26.23.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 23:39:41 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:08:59 +0530
Subject: [PATCH v2 5/6] drm/msm/a8xx: Make a8xx_recover IFPC safe
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-gfx-clk-fixes-v2-5-797e54b3d464@oss.qualcomm.com>
References: <20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com>
In-Reply-To: <20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=J42aKgnS c=1 sm=1 tr=0 ts=69ef04ae cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=6racf7IOMx3K1H64_JMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: PuZYhevVG5pFm6JQ6_2Pz5OTfQt3prPK
X-Proofpoint-GUID: PuZYhevVG5pFm6JQ6_2Pz5OTfQt3prPK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA2OCBTYWx0ZWRfX/4FJQANa13RQ
 bh3k+X7x+25ys8h0sRsYukWbDpVbskfjPgZX7bSC14vU71ASlo15GmXzCN7jYP4gz/EXhGh6grF
 vK6mxO1KMpbuzFk7ltx7Lpz6nai6COqOJhVcylpQ4DesVAXB+r0mDpkKhRsy3qKUBnZA2x+zKd5
 /5fvjWDinnvpPHQHsTyeHnxECu2IWbBhDH2pqFt8hSoEw1Usg9ffKq24bHDiUmwIKxnPNkQy5xc
 uepImHhtLI77IUxXqmVlR9pR2LnTtKX/trJ96e4tq9DNX3Mh2VAI3j6HNGSgcXWhHUJy2QxQlr9
 XbWFFARR3j1qoe2bCeQW6cgIOueNiMMAsjpb764GRdhe1jGUv8RWTyQhPPZ0PJAbod5hgKUSR6Z
 oWMQEzzC6OWbaSPTdPNYLp97Fld9yQFRejl7oKXJ4hgQAcj0G+ypbz5OP9ui7K4hxCD5OTIYxCi
 dlcH95BZ3QhzVe+TX4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270068

From: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Similar to a6xx_recover(), check the GX power domain status before
accessing mmio in GX domain a8xx_recover().

Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

