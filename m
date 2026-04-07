Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A86F153BE9
	for <linux-clk@vger.kernel.org>; Tue,  7 Apr 2026 09:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775554292; cv=none; b=KZwGi8PCJjF/rD7QD0DNQkw2B5kdCHtDkVSIVNMX/J8hlcLSMu2MrqGtaySXX8RNEctEqAetwOWExqzU7Jmn61NRPTi2xcvPLRODVoiG7H9mvdnHSdNrFxocMJTsYOklCGYyVyjfoN3MrEIMWKmZj0t5PcxUUvwTDbGCoJhTsM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775554292; c=relaxed/simple;
	bh=aXHT79v/7oLdbyzrr1UpPfg1SOQCQEJgRDXGeMNs4js=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VlHfYJlxzjfOwV6Txtrk+1cl9jaMJbsnh1oaVgIG9hJbI2EAIotCEeQOAWG8H4u0X2RdEhR8gVcpEUr61VfspRUCdllKxHQ8BROXPY7QJH8UdJccPodKs5tv/NCNFaxNun0wKq7tOXprXejNRG7ksiRUcDA/IZ7pLHt+iQw80ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RzmRA1WQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aLu3Wrrb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RzmRA1WQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aLu3Wrrb"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376gXU9492497
	for <linux-clk@vger.kernel.org>; Tue, 7 Apr 2026 09:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vjxepcNfcMFp0kM4FwikjtT6M4X71nel3jc1Rp4eDPk=; b=RzmRA1WQC21TiocN
	GJ0ald+eVXqwFx9+c/RuktHOrXgNsFoXWlk0PQrx8zLVS7uT8Jiy8aatFZujH+M+
	GOrQagM8No/lWDadgrDj+ehFnZTrwqMsrEswI4+Bp+bfxr/K4Hh5PkUqNCdUcKUF
	QVDfi45Z1yktVIUXq2U58UFdsHUiRGNTipu8fPF7ql8ZnwghRblLXC4YhecIWjBb
	GnnYlOde/eW6PgESM+v3CQ9bXEGF/pnzvhZARGERUMxlN89+niNEe3VV0FSJ0PPr
	toBIJaorlDrlughJaGDEJaNTUQozTvUlQJE/5FIXHz9dyhNc0eDlFZ07+KxNefep
	vDs55w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8t1g3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 09:31:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b0c30b51bfso105699115ad.0
        for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 02:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775554289; x=1776159089; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vjxepcNfcMFp0kM4FwikjtT6M4X71nel3jc1Rp4eDPk=;
        b=aLu3WrrbJV174WMqPUI0k27/CwD1R043xccskwtOr4HSjpTHm5uQWcWadhHsOjD6z9
         I0FfD7eabNnnF2wBJNhQt+20VNVTZjw9nWu8EfOmz3qQGctS7R7Krd6H/lyCbX8DjKyj
         u4l4ZMiPPm6BKoaYMXHwBNvQKnq8xoucMKA0V6vYq5+eiM39swwU8k2kKrc7EQdedHxa
         o8qaxcxrlg5BtZ9+8XWx4aowfwKmFuvpoUVRzNZzUPYjoMDWHzBZy6uV53DYIc5rj0iv
         6OhUFhgZy7NJli21/HJHlg5iEVvtTanmPK09XJ9C4x3LkDCyqR7+RBYlR4MvmxAlVvaR
         ZlOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775554289; x=1776159089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vjxepcNfcMFp0kM4FwikjtT6M4X71nel3jc1Rp4eDPk=;
        b=Brsl0mYHiGcFgphAq2AQVIomp4fHjdeTjH9WjhflqebLG/Ci0b5yl2Es0Isgm4vqKS
         X6J246N/eMA3wFi245ghxiOD8To7AEleIPLtm74ICG44GwUcwC8sJtWtRVsFPV15caAm
         2MvH93rhJhGtX3ktA0SEQF3VwCtr0AvRW6vWrs3/+Jv6Y+e623w3cF0HmejG5bHayrya
         12NlP2Vy9FPJx443JCCrs1P7PCAK1nm/RFZA5ZqIDceCn7Pqqv3TUYpQBOylxqwxWt8T
         pVVaBJxs75ChX3RQOB1B9AJTBzZSQecdhA9VjdTNphJZ0POCnhYTMIUQLap0PCZbm8s1
         viLw==
X-Forwarded-Encrypted: i=1; AJvYcCWgsP2DYTgN106V49/O7XrJuHqRJVnIy/VKdq1wRMAJaMnlpO4I6GXuAWG9SR1+U3HCzySHXD6DXWE=@vger.kernel.org
X-Gm-Message-State: AOJu0YztAzbU0/kT9OH7WgWvjqiOetDDGQx807eHF1h+2xQbN/Q4rFq0
	DfTah/+AWI4eIUrilI4K0hrEpoLyfoh8tM5cMkj1NBIOw+tAZbFLZYnyiHgjSiFNuektSkZo1eG
	XHqZGROfdwT1dj4fT8+BDe/s5Q8ALGI/sqtRyVJTlzUz1npXHSZAC7WYxHkGDwh4=
X-Gm-Gg: AeBDietL/1Q/QyH0drVGI0E8Nk+cxbFzbPCfqFKWLjeEyjh/hv4oMaJAmxJy3b8jYxp
	LkXH48zuczxiAmFPdJauLxXjSWFeZaSQNTkdJkZ1/0t6mvAvYelPmekD+sLb4/NvxfhVmej0CBb
	wBdAg2GEZxzJJIi8/vHeSHR/4jDT6MaaWO7Rj8V3zQ41hbR89wpr61wYQllyxomrfKG7m4dYxIU
	E8QXLfSorz5Yw9pvrOFNnCmdPDaVAtJGPoTek1ozowW3Dcuviz1zxge3qmusvaHqUSG/wsWDzxK
	tCGWPkYKK9/7G8xjJITbvNVHCIl86FVtwK7A2kRcHFgdGD1knmHDhYvlZHrQwYtT1BSJAgo8+8C
	hFkyuQ5H2s/zRdvrgQxF6G9s2rv+Hutq8RyUKYi9W4dlDMA==
X-Received: by 2002:a17:903:1b4b:b0:2b2:5c31:24bf with SMTP id d9443c01a7336-2b28175bf51mr176450155ad.19.1775554289483;
        Tue, 07 Apr 2026 02:31:29 -0700 (PDT)
X-Received: by 2002:a17:903:1b4b:b0:2b2:5c31:24bf with SMTP id d9443c01a7336-2b28175bf51mr176449715ad.19.1775554288963;
        Tue, 07 Apr 2026 02:31:28 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478bc96sm172888365ad.33.2026.04.07.02.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 02:31:28 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 15:00:51 +0530
Subject: [PATCH 1/6] clk: qcom: gdsc: Add custom disable callback for GX
 GDSC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260407-gfx-clk-fixes-v1-1-4bb5583a5054@oss.qualcomm.com>
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
X-Proofpoint-GUID: ViAHlI6D1egxPGMBAVZe9Y-Tw3t7RcGA
X-Proofpoint-ORIG-GUID: ViAHlI6D1egxPGMBAVZe9Y-Tw3t7RcGA
X-Authority-Analysis: v=2.4 cv=c9abhx9l c=1 sm=1 tr=0 ts=69d4cef2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=6udHJU8j9nUP921WRPkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4NyBTYWx0ZWRfX2E95u05joYpC
 wEFTOKUE5SYTxnvI+qGJps1mRJ/lqIS+XQX287xA4odFeIfv64y6Dh9FDdYAbex9wNa2ap7WXiW
 75WSvHsVdeWk1zmqSM64scd6lDvvZdQjYijB6QFcUjbVl2zD4NF5G52c4d2lxiObJRIR3EYt3eu
 jysfB7evvC9urHajo+raA3CYS4qAnhTYQ1L06FfGtSbVCdRVHnuRo5vw0LQOAdTcldQbBfBNn2L
 PIIU4j0nCG26E56LgxtiW2dOni7DtvBjEOH/SOvlwTm6gJ0zN3WdaJ/gKFH7iOhu6U8PnyWc8sQ
 V8bqn9A3GuTtP2l5HWkBlCL40do3bFFd+AuBfkDL1E2Xov2htoHgYMUJmgD0kvO/Sn/kxY+M65M
 SIpoDAZURkhnvKq8UBv3eZW1Jy44zS0LqSpWojFqanTafQLkz77n7tDakGCDzTzElf+OzMwajKZ
 Q3Vatuj4tkuC9U7Mt8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070087

From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

The GX GDSC is a special power domain that should only be disabled
by OS during GMU recovery. In all other scenarios, the GMU firmware
is responsible for handling its disable sequence, and OS must not
interfere.

During the resume_noirq() phase of system resume, the GenPD framework
enables all power domains and later disables them in the complete()
phase if there are no active votes from OS. This behavior can
incorrectly disable the GX GDSC while the GMU firmware is still using
it.

To prevent this, implement a custom disable callback for GX GDSC that
relies on GenPD’s synced_poweroff flag. The GMU driver sets this flag
only during recovery, allowing OS to explicitly disable GX GDSC in
hardware in that case. In all other situations, the disable callback
will avoid touching GX GDSC hardware.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gdsc.c | 22 ++++++++++++++++++++++
 drivers/clk/qcom/gdsc.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 95aa071202455421d818171d04f95d15e2b581fa..ab5d741a2e2351bfac06a6814c5a8ba7355bc8bc 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -675,3 +675,25 @@ int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain)
 	return ret;
 }
 EXPORT_SYMBOL_GPL(gdsc_gx_do_nothing_enable);
+
+/*
+ * GX GDSC is a special power domain. Normally, its disable sequence
+ * is managed by the GMU firmware, and high level OS must not attempt
+ * to disable it. The only exception is during GMU recovery, where the
+ * GMU driver can set GenPD’s synced_poweroff flag to allow explicitly
+ * disable GX GDSC in hardware.
+ */
+int gdsc_gx_disable(struct generic_pm_domain *domain)
+{
+	struct gdsc *sc = domain_to_gdsc(domain);
+
+	if (domain->synced_poweroff)
+		return gdsc_disable(domain);
+
+	/* Remove parent-supply placed in enable */
+	if (sc->rsupply)
+		return regulator_disable(sc->rsupply);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gdsc_gx_disable);
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index dd843e86c05b2f30e6d9e978681580016333839d..495daebaf99519ba0571070b41d133ee867c4fd3 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -88,6 +88,7 @@ int gdsc_register(struct gdsc_desc *desc, struct reset_controller_dev *,
 		  struct regmap *);
 void gdsc_unregister(struct gdsc_desc *desc);
 int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain);
+int gdsc_gx_disable(struct generic_pm_domain *domain);
 #else
 static inline int gdsc_register(struct gdsc_desc *desc,
 				struct reset_controller_dev *rcdev,

-- 
2.34.1

