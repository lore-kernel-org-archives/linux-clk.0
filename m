Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3AD3A6411
	for <linux-clk@vger.kernel.org>; Tue,  7 Apr 2026 09:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775554328; cv=none; b=h62bQO2GzJpX6X5Z7O5ECOREnLGqnUbEoPmsStr1BGRshvgPGfBxkZGTygLRqyOq99/BL/rSJMrY+MOk+As71MNMBOkC7QrdQpIrS2XTPLETdHFD9rOFwl78vN0oQTomfx7JCFqWwdMbrRT4kIbZN+PHQ+EIMogpZ0yk+TNv3O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775554328; c=relaxed/simple;
	bh=ebt+DlIxFYdZ58+Dz/1bcwNcBFyftHvLSrZPhrp4eDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GV00WNccwbHTOWVnIPoleZJRSrc7x8SLjNf8nf1+R7YFmfkfBkR95Jb0N7DGYYvRGd/1w2NvkBwuQ3I0koFybz6aABARH8nwPkwe7p35R8FynG5o0/baS7yupJVyvf8eL12LAJKTAFM+BJCusSWh89oiyRcDS1j00iLzrQLd+P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n9lNxdUU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b4yHqyDv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n9lNxdUU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b4yHqyDv"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376qR883816989
	for <linux-clk@vger.kernel.org>; Tue, 7 Apr 2026 09:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qzC8dA/21UMvhLjLYCfzr/+6i+/FSPhWX2hchnV7imk=; b=n9lNxdUUZhqiN7Wr
	dqJnk/9BBJRZ/D4SR6SDMY76gA1GgHx17IOWRnyhUpy/by4fKdTGN61eloGcmcFK
	jT9ldeFQq0K4KZpiaE1vWx5qSudZaQBizulgBgcXsjo5PGtkf+Ta4vQBlJ5wRpbO
	Hwg5DGztVYrboGJcarsf8gmfWWgihn43kCum76FS/plwGxZNguPQfcpCkWiSU77f
	P1MbnwjZACZnPbG50DLP7dtsgBzhmEAmlO2ou7G42bAIkh+cIMz3gBucE5htDBTx
	ljeMmOaY61H/UjSIkrCtXZfGSUMGpAzsrPISRFIj+gccEN27IgNzrvaWyN1fYpAh
	Z2eF4w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr4t2km-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 09:32:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b241be0126so132698185ad.3
        for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 02:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775554324; x=1776159124; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qzC8dA/21UMvhLjLYCfzr/+6i+/FSPhWX2hchnV7imk=;
        b=b4yHqyDv2gZXJvykgY/guP8mATHZwsLvp7Yx18vc7aZIbiSv1AqPuI2GGbtGNPJZoz
         /0+BPs+gZRwAHZtZclcCBeD7rYVLud5DuI8YAkcjaVHajHlD7C2cWGW5CWWQm1ri73Zn
         7Fk+qDitrMt0iR0vcK80HF7clGrvy22P9D2lyWS/8Ss+7YSkoZS/XN0saIrPVpDfuT10
         SIOHhgSZOCeFiRMuDhqUjz8k9zk33NjmsFOy8DGbyD1eKzSWoMegFalabnzjfdLTxXAd
         SmUXE1lqmk7OG77sJX3j3RFQQHmZTjWMQCnv7yvtljaJKoJCiFmtw5QnmdJs5dBlerSv
         Bwgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775554324; x=1776159124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qzC8dA/21UMvhLjLYCfzr/+6i+/FSPhWX2hchnV7imk=;
        b=R6Rt4cJxTEy98A65zEmtJJBq47Pu9IZ6qzRU4+YQ46+TBvMZSjfLXBqD/N6ms/cJHW
         B2tlLqxCG22j05o0he/PyIsa53vocAy6VereeuuBzEjjaeps1bI8ZG75XfnPwllE3xLH
         vOb1HHE2f3//B885VVGrHIs1Kp7TTzypoFqjRnqUSww2vCyMvKehBDAx+5GbNHTzJ5DV
         Fbav9RiQg6C3AG9HLJIUyBw6vZOJejdrcFPj94M7c2YAWdd1u4PZQljUn7Cd3ItmTjcx
         GKAiUU6IJIDxI3VrP8mgeZ4fK8rOVn72zEj62cNJY25UJ+FzE0UYGWiIIDvf2cqirn9s
         71QQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCx/v3Be27sPEkB3UvzEbrBTBapEFss/Us2nNZySVlYhZ5MEUO+CIB1zRwwuaAmRYwfOZf3pOrsJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzWSKzEQ9W9nB6l1TWcBF4YXqpGSpk1E1MXfdcm/nwO7xYyhHu
	TUAmIlryb2crFZoNL7Ct3fcm90UffwlAMAgNGdFM8CRxWTiPnb5XQXHGXa5sh3LS4O4QV69OuFV
	ho7lvXJsunbT/EIxnLkiR2rcB/6C+vxp6fEck4EKFUsJzTdLRzgkO/Hup9oRWOCU=
X-Gm-Gg: AeBDieuz2UuqbMhpzDqXKmYJifnyOZBPOYuzgGLh+UvEIAe2uAOAaNBPNyDStWJh9sG
	XJieeO/8u2af0d8CTr8uaWabrscTlQVlkzZrmzldmLTPY7/AGCIbqttk8ueHDLCXJYdKeTngC0Q
	uGnnsgcF22nGv0Hlk2OVbguY5GO2X+8LeF56SALAScgqheaaCHt8uu2WsXNBM5uxwCb1NNzDwpT
	zrvqEf3S6AA98pyuMgXtCRRZaBHVc11cZ8MSAdIa9v+njdD2jEbdCLISWD+jV7RFEEbkYBk/vXI
	3HtwEhR8KBzq8YRnDOUmkntH+EoS5Es36msl5kKSATSGcUsVKo7iZuHMvc8/7RbkWaT72SENgti
	AHIY++fQZ4vzXeb4sRhXfBi8qCe7tmIDOK6TolEk9hImRvg==
X-Received: by 2002:a17:903:3586:b0:2b0:b325:748a with SMTP id d9443c01a7336-2b281705e9fmr171104805ad.22.1775554324146;
        Tue, 07 Apr 2026 02:32:04 -0700 (PDT)
X-Received: by 2002:a17:903:3586:b0:2b0:b325:748a with SMTP id d9443c01a7336-2b281705e9fmr171104335ad.22.1775554323620;
        Tue, 07 Apr 2026 02:32:03 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478bc96sm172888365ad.33.2026.04.07.02.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 02:32:03 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 15:00:56 +0530
Subject: [PATCH 6/6] drm/msm/a6xx: Limit GXPD votes to recovery in A8x
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-gfx-clk-fixes-v1-6-4bb5583a5054@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=dO6WXuZb c=1 sm=1 tr=0 ts=69d4cf15 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=wUjT8lVc3dO_4AMqBZcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: iJnXvNcQLcNy8e3CTICzTjo3W91fm8xM
X-Proofpoint-ORIG-GUID: iJnXvNcQLcNy8e3CTICzTjo3W91fm8xM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4NyBTYWx0ZWRfX4VNTn6ID0JiG
 pREw5n37WNJlphGStdj5m0fWT0u3pqLzmdvePDeH3NX4uF0fRtgOWlW1otZpjORVczIQnZCvYTD
 E6Ra6WKWpl1BIfEKKgtnVTd5S71KbAFjfkHVZhNobgr4WS+Kukh5S9p+pJHtnC0qiJNc4FyNCNm
 Zy7iyvKm4hXtHUzClDQVLM6FiC/tA0CQ9+rhXAJfe01QjxqoIWATtrNsnzTqXToQTzj1qTaO0iX
 CHnbNfki1e9ObpDrkZPHRsYmsPOecPbFpiCb2vZH9lNsgR/ONMSxJ8+MvvTOoLLQxeTjRMtDReT
 STuCkgS4Obg89ubZVyQQIsO/QHS1lNk8q0rEVJsfMHuRpJMiulFriAt5RgJNyG4VKt9eSvd03Ut
 wWqyeErm7Dcdmux6wk99qOT+0kM5/rEGFvRqz1+Jnk8hZ+7e3Q9ZtirObE1PwnkayE9rLt5+ojr
 BKifHcpLxgymviZIvCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070087

From: Akhil P Oommen <akhilpo@oss.qualcomm.com>

In A8x GPUs, the GX GDSC is moved to a separate block called GXCLKCTL
which is under the GX power domain. Due to the way the support for this
block is implemented in its driver, pm_runtime votes result in a vote on
GX/GMxC/MxC rails from the APPS RSC. This is against the Adreno
architecture which require GMU to be the sole voter of these collapsible
rails on behalf of GPU, except during the GPU/GMU recovery.

To align with this architectural requirement and to realize the power
benefits of the IFPC feature, remove the GXPD votes during gmu resume
and suspend. And during the recovery sequence, enable/disable the GXPD
along with the 'synced_poweroff' genpd hint to force collapse this GDSC.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 64 +++++++++++++++++++++++++++++------
 1 file changed, 54 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 1b44b9e21ad868e6454b9140284cc7ebedc4f59a..b7166a883b018f459caae742e9a589f32167f8d2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1250,6 +1250,56 @@ static int a6xx_gmu_secure_init(struct a6xx_gpu *a6xx_gpu)
 	return 0;
 }
 
+static int a6xx_gmu_gxpd_get(struct a6xx_gmu *gmu)
+{
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+
+	if (IS_ERR_OR_NULL(gmu->gxpd))
+		return 0;
+
+	/*
+	 * On A8xx HW, GX GDSC is moved to a new clk controller block under GX
+	 * power domain. The clock driver for this new block keeps the GX rail
+	 * voted when gxpd is voted. So, use the gxpd only during gpu recovery.
+	 */
+	if (adreno_gpu->info->family >= ADRENO_8XX_GEN1)
+		return 0;
+
+	/*
+	 * On A6x/A7x, "enable" the GX power domain which won't actually do
+	 * anything but it will make sure that the refcounting is correct in
+	 * case we need to bring down the GX after a GMU failure
+	 */
+	return pm_runtime_get_sync(gmu->gxpd);
+}
+
+static int a6xx_gmu_gxpd_put(struct a6xx_gmu *gmu)
+{
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+
+	if (IS_ERR_OR_NULL(gmu->gxpd))
+		return 0;
+
+	if (adreno_gpu->info->family < ADRENO_8XX_GEN1)
+		return pm_runtime_put_sync(gmu->gxpd);
+
+	/*
+	 * On A8x, GX GDSC collapse should be triggered only when it is stuck ON
+	 */
+	if (adreno_gpu->funcs->gx_is_on(adreno_gpu)) {
+		pm_runtime_get_sync(gmu->gxpd);
+		/*
+		 * Hint to gfxclkctl driver to do a hw collapse during the next
+		 * RPM PUT. This is a special behavior in the gfxclkctl driver
+		 */
+		dev_pm_genpd_synced_poweroff(gmu->gxpd);
+		pm_runtime_put_sync(gmu->gxpd);
+	}
+
+	return 0;
+}
 
 int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 {
@@ -1266,13 +1316,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 	/* Turn on the resources */
 	pm_runtime_get_sync(gmu->dev);
 
-	/*
-	 * "enable" the GX power domain which won't actually do anything but it
-	 * will make sure that the refcounting is correct in case we need to
-	 * bring down the GX after a GMU failure
-	 */
-	if (!IS_ERR_OR_NULL(gmu->gxpd))
-		pm_runtime_get_sync(gmu->gxpd);
+	a6xx_gmu_gxpd_get(gmu);
 
 	/* Use a known rate to bring up the GMU */
 	clk_set_rate(gmu->core_clk, 200000000);
@@ -1339,7 +1383,8 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 disable_clk:
 	clk_bulk_disable_unprepare(gmu->nr_clocks, gmu->clocks);
 rpm_put:
-	pm_runtime_put(gmu->gxpd);
+	a6xx_gmu_gxpd_put(gmu);
+
 	pm_runtime_put(gmu->dev);
 
 	return ret;
@@ -1455,8 +1500,7 @@ int a6xx_gmu_stop(struct a6xx_gpu *a6xx_gpu)
 	 * domain. Usually the GMU does this but only if the shutdown sequence
 	 * was successful
 	 */
-	if (!IS_ERR_OR_NULL(gmu->gxpd))
-		pm_runtime_put_sync(gmu->gxpd);
+	a6xx_gmu_gxpd_put(gmu);
 
 	clk_bulk_disable_unprepare(gmu->nr_clocks, gmu->clocks);
 

-- 
2.34.1

