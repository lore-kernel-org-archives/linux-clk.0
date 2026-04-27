Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACF82749ED
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 06:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777271992; cv=none; b=cXhILTVS22cnCixAjGIXTQksgY3ewE0JeQT/pKjqYBYJKBC6ijndQOqQPq6hW6AfMQYOK7BVynjMu4EuUnM0e+IzbD3CFAXSXnAH8WLciq+2u+rRbJCsroQiWvE7PzICNeKTBjaygfxMS5qIDmGDLUi1hH2DyJVPxvS/NKDYUcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777271992; c=relaxed/simple;
	bh=ebt+DlIxFYdZ58+Dz/1bcwNcBFyftHvLSrZPhrp4eDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kvt9F9CQrXwPSnu3PVEfKPleVswb9ZyFttIHytNDHTIZbyzvwg1SokMdsOnfZzGo8zb7vtjyqlVw2qALQjOB5PQtARqvDNHu1t9YdfvzPkkFAPmRrEeoohJUOrdP4lVRIHVWrHSx45iwBeQ90tez/4dxA3PW9y6DYL0dG7ayufU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nvom64kR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EE55X/SM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nvom64kR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EE55X/SM"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R2jPMu2884169
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 06:39:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qzC8dA/21UMvhLjLYCfzr/+6i+/FSPhWX2hchnV7imk=; b=Nvom64kRl3CVEg9v
	VxzjqyKzMgv4wplcqD02BaPhFVqe2fyTtYCnOb+UYSakQJMGOZC6MwSyhr57OaVX
	7NHeQRYVmTve4d1AGhHmwQ0RkVqbaOXVPChTKYjIKWum4DU708aMBbIwRxxhmGRc
	i5rd9Az7NSlAPLXx8EqNzebqLRuM43iA/dJnBYQHyY6Im+qeyAZUOYgYivKf78Mn
	n7GhnrsAH+s1q8do/quUagvVdwMj5CYboMCY1eo8sdcSI7qYkYcSwWLTQ38pqaAm
	Jx1Fh/jCkRTRpBOekU6TU9Xhno0ZwVSgp82/RknRP4f4dRFWQJ9FgCABGiRE+ft6
	hxlxJA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsya00nam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 06:39:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-362eb03240bso2761634a91.3
        for <linux-clk@vger.kernel.org>; Sun, 26 Apr 2026 23:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777271989; x=1777876789; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qzC8dA/21UMvhLjLYCfzr/+6i+/FSPhWX2hchnV7imk=;
        b=EE55X/SMyHbmXXYVPTFpP43ypOCzQvlVBXyUnyBlmOkRiL8MMryaUK3iQFcPq6ec0x
         VxFWvN1lA31hsNsAPcxW3kms8LaMSchW59qlOvWUBvdPh83acT0Ck/A9DCsYnxP1mVHU
         0OtMcUjApgSMTvQEQHtNWQlCzUfCdly/04MRFzYLJvn5LUzzKhKCKF0cJVDcRK7B/rbd
         /OhdGwU2g9FOKfm5+hHWyPV1XBSrx1ntZ7ZiKiPoyNUOZNZRlCIKTQTPj3BO/Fmvkr+F
         dgoH/kpX8Rprc9TZ/4mW5i4hyzCTYVF2fUW0+3hWwea389NCqdjHxjgw1SqPkZEXsF18
         m5vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777271989; x=1777876789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qzC8dA/21UMvhLjLYCfzr/+6i+/FSPhWX2hchnV7imk=;
        b=QJVFIJmjBX5TCM5apnYI/5H3SkPnnFVx18hPeud55u5zO90IcZaNYuVcoUJspCyzP9
         gy4ft494+nQOKbZapr9tss37OLX0flhEdbmn6272uvOhpGQmYw72dNZAxIthqIbGXeor
         +SRCy2M9clScKvPBhxvRhWfS64OwEhDx0BcIa2ffPBKglRXntngawDwdOJk923Kdr6Bn
         FhUDjMNVS7vYEfBW4uUN66AIY5qmEi2cTzYc+vHM+86SzwEJhN+dCLmD6GMi7LUcbNMO
         YEHiH6i4+98jMSCQugSWEtc9keHBsIx2yQc5XEJwpGJm0P35e4tDfil69oDX7z19BOG0
         ra1w==
X-Forwarded-Encrypted: i=1; AFNElJ/FVjuO279TyyqyQiuCBACguQDeRNkgA9l9Ug6KtQhn66L7T6D5GF61Y5Q0e7IV0H8ZsnKfghy5AAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyqG/aGkGeku35kxHoBS4zml3lgjxFfus4X8yQynMghBdYNRxA
	L30+y5+8BDRdLJkiAtif86Ct3K2cwK5CiJm0juazeq0DcWpEm6K54ZKtInsukpdhQkgiSRFieBw
	iq95m2hDFMb8aRkWIH8CSjAuJ90KhP/VXLmV26ljbLTj1gUSdHLg/JzcaBdO8y2c=
X-Gm-Gg: AeBDievGdzo3jHoh0a9tqwnl7Gte0zOiLqp0KYZv9KliM3/2jB0zm49WZJiv69pSyRs
	8qSyQGZqG4QpRSxV47IisEMuXdMjZOQJ+KxoRayGtr8eJtqzaKvXNuOmdGibHEQw4XlmS6ZfDMq
	te789ztIkOHz+cM+JgCL29/e+pB1FixSPDyK6q0xLkQzpur/SGK4Z8whJMPJDZrF4yVitKZLyXF
	GJExFAie5eqf3I44YO+sPwSINVlqSWkbOLfj9K3/lSCQNdP8THJ749mJKhk7gO0smKcYXTXc1/t
	Uj4UrjnB4yZn63nRQU0cOM69yk5Jv4PvkTxdlbVU8btVs5295ActqUB4gN+PjTHJSbY55PO3b5C
	a8szPiXdhBt09MCSlX21y1oB7m//jgev1qdgSGTsuetLlRiGSBDDqjjyu
X-Received: by 2002:a17:90b:164a:b0:35b:96bb:47ba with SMTP id 98e67ed59e1d1-361404c0ca8mr41138487a91.26.1777271988826;
        Sun, 26 Apr 2026 23:39:48 -0700 (PDT)
X-Received: by 2002:a17:90b:164a:b0:35b:96bb:47ba with SMTP id 98e67ed59e1d1-361404c0ca8mr41138449a91.26.1777271988319;
        Sun, 26 Apr 2026 23:39:48 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361410a7ab7sm38628234a91.10.2026.04.26.23.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 23:39:47 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:09:00 +0530
Subject: [PATCH v2 6/6] drm/msm/a6xx: Limit GXPD votes to recovery in A8x
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-gfx-clk-fixes-v2-6-797e54b3d464@oss.qualcomm.com>
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
X-Proofpoint-GUID: XhzkdNFkYRrqdRUqhrl1rYWeYRK3a0Hx
X-Proofpoint-ORIG-GUID: XhzkdNFkYRrqdRUqhrl1rYWeYRK3a0Hx
X-Authority-Analysis: v=2.4 cv=DZEnbPtW c=1 sm=1 tr=0 ts=69ef04b5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=wUjT8lVc3dO_4AMqBZcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA2OCBTYWx0ZWRfX093wJQ/qZSUP
 fmj+Xy2GSbKPRxpPTVwgAHh0hdPbp6MlFc8pxNjwgKyHtUr5mAeiBxYfOs+LmPD7TdK1J3t3UbD
 POQTtZFTmZmI4CfYxguF5aOHr0HEJPYrTyEyffOUeVqoYAmeufRtNKtzftX67QaaP96hZcNMSYt
 h2ald02WYzaUOUcdFCPAgsM1lOjgDwE8tfHbYRznfOQZaBLjnF7eUePPoOvOxGaVOKdaFYJzQGf
 xGD8d6ONPO1oFzVJiy3RNrmBJ3EiVg1Z2P4C0NhLwas8y8WwyXO5V1rtG05u7w1tx7GbGYDyNOk
 5brG4FiHKeMU3x4Dovb9bV+yyW5wdB34CKAVbOyCebsa5cI3NzzoAOTirNvseA0aVsgvROvcbXc
 bxM8nKYGi3i0Jp1eUz7a0/+inGUekE7vfGMumSxxQeHtifln+FY5k/vpQCqEHO3Z4LimUeuFOSw
 EjEcvkhnq7mNLa0B+lA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270068

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

