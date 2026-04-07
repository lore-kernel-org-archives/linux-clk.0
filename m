Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0FB2FB0A3
	for <linux-clk@vger.kernel.org>; Tue,  7 Apr 2026 09:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775554286; cv=none; b=ra0MRLTV5J4kUa7PGZZoEn8wkcHqCx3ii7SJYhve1aCPCIh6GtDVhc71K/X77F1AJGZ1q2wPLrAP8JH7e0e9roiJBYKXYKgNesgQ7fwDbq0mJXPfPZiPcLTUCkrjMH8q4q8PDF1DVrhqWqqsA2HtMicgcJ0NCrsiLsYNDuI/DJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775554286; c=relaxed/simple;
	bh=5PUM3cpSCzzj2Jq5xYdzED5g5GdD9XHo60yLneOdx+4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lE3O8LuAV+S+sQAX8uAL5052jfWeCiKt/jClYZOIn1oCdyYXHSuwOI6vusVfd37hOX4+xvqwM3s+3ZJiAwOb7ZfqzATiQedl3BoO9ukkYe2CeP755p1zT4q7mzL9Emq/t4x5K/JvCi/pUZS08acSg7uaP7IhCkyOYLkPZ0HQSS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fj7GuhKT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fTzXdVfb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fj7GuhKT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fTzXdVfb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376hwcl2580473
	for <linux-clk@vger.kernel.org>; Tue, 7 Apr 2026 09:31:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=no6GmN1FeKv2TMsDqdpgcy
	RTsovznCVnpZx+ew88y/c=; b=fj7GuhKTzcP1FSYoJcErC/suupVPGRtLzj8gsn
	HMU0u/rFXc/2XD9X79GwxqXZdLP2zKDdOlmYf3lM5UTE0KCVhHBTuJbPukxSaC1G
	vtj0xzke5eCUwZDr6iZUyT9+dWQa/My3MsNM2FzmazeM3BbVPU5tenxGKue8e/Fr
	VeTPtEekoJrE9BM2NfH+Vg8ts4DrUrw3SXcUkMAQmRjAC7XncGCcuPemOTD4x24j
	1josFXQOHrcqD5KGxcwLdFj4zDJjOOz8//eCdERVNTV6Jh0Qy6FPG7/GrUUXhB7i
	ca1df1kYN3FXShIpZNWAMnvQuSkYASPifB1dyEfy6iMyREQQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmsf22fw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 09:31:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2523e0299so122064575ad.3
        for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 02:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775554283; x=1776159083; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=no6GmN1FeKv2TMsDqdpgcyRTsovznCVnpZx+ew88y/c=;
        b=fTzXdVfbyWpYA3p2y9gOJdr6uWeV7MNCTG9n0AKpydlR3+ytlULIJSQ8PcRQ/OSOQV
         Lf4D1TzWgM3CtUurmRC5CkffZSszwX80QVxkXmF+ujCWqqVXhIgBhFXM3mAhEc2hdKTO
         vuP0KTMVHFSFPr6fD42PaKNWanDHK4nBnp4PmPbpRIC08H+BIK+Hv05EuM98INLJ0dVN
         3VOLO3XhLvQMML1Yr6YNJCVTi7qiAcSCTP+ga+LAF56xAXk8livZLvfw8wGT7Ko5AWzq
         Ok7nepd+uzD4JyxclQ5Jj7iU1ZUNYnKaaCRrnKuW4U5quWZHQ31Ym3ga7Bui4ql7t1kP
         kNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775554283; x=1776159083;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=no6GmN1FeKv2TMsDqdpgcyRTsovznCVnpZx+ew88y/c=;
        b=CD4Vws39uxy2R/ROZenF3/3U1JO8Y0+YAI1sYzExo1dXCzOC2p8ZGXK/Ap4Tcraqxo
         1u3eiUE8PAbFGId6nW50UfSY7Erx18fnqOLA9ry8pjxRCFsLBpThOmIJZhFIukOjzfSa
         CEBNuBIkMoun58T9lZEyq574KE2SzIpQXGLB8ljssUrnRMWHZ11IMfjBo/vJ1RzGdt2I
         TEk+wRPjLJd1eHGz+fJzKMlPWehzI7QlEplLB4szWdY+tbLlBcvF1GV8N386iSqtY+eN
         ol66ck0CydqyLzyCwlCH99uj3hTt0d3J6pccPUE9wbQWNL5AR0M5ehAih7DPyCj4v5ED
         XpEg==
X-Forwarded-Encrypted: i=1; AJvYcCUMqbAcgfx4tKN7ewDFO6UW4HjVcv+YTuHfmJJab7bS1ManQJArn0nsWwVv365GGq7nRSYBiqmhvP0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGyBN7Ks0TaZ8f22Pw+l+9DkqAY0HdqcNvrd6XoxPF0KmtTMbH
	Zmt0Xd2Dl3PaSpEnTVmZGRGofGiBHWLcUX6BleO3lnDpEkY4gIAZYaiy8lyhFKPYaU/ihA08VUR
	5y7TpKAmw2bmHi6/+3/qbmu79Bp5rewRzI0ZenX6PDYKi442Xg66rojetJY0C4Es=
X-Gm-Gg: AeBDieu3DexMGP+Jo2uCsQtRVEiOfWZTMKbWVBber+tlJidT+EbsIAodtRlnoI8iydC
	THmkVQQjrxGWum7KbgucrFe2WJFjNwlsLf7XXw+rZzsvMaGxMyQk2kw99HL8y3Ped/WCSEcDTWK
	09tDsuEHul4ZtOrxuSdc5dQmb7Za5Q6rb8v2hAkE3rLuV9sdRL0M0MJ2QxWt/YE9n0s8W9GiNqD
	1/RgrJRFw4GRe2w6inw48mlgIrI/QAM4UyKjT3p2Ea4nMi2DP1WuffeWbjDyYaryfNi5VEKVTMD
	YUhTQ0Q+cvBPRCLPHnDQiOgslG1b0cVs6Xmv1tc0zXVya5UUWlsSC+MIAiKYM69cS4jsz287WDV
	hZdZ3XwFYvtKNJoYJllXprtqGBPIDH2i2c/SefgFSytzvYg==
X-Received: by 2002:a17:903:3508:b0:2b2:50e1:f104 with SMTP id d9443c01a7336-2b281706efbmr176573435ad.3.1775554282628;
        Tue, 07 Apr 2026 02:31:22 -0700 (PDT)
X-Received: by 2002:a17:903:3508:b0:2b2:50e1:f104 with SMTP id d9443c01a7336-2b281706efbmr176572955ad.3.1775554282039;
        Tue, 07 Apr 2026 02:31:22 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478bc96sm172888365ad.33.2026.04.07.02.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 02:31:21 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/6] qcom: Refactor GPU GX GDSC handling and IFPC behavior
 on A8x GPUs
Date: Tue, 07 Apr 2026 15:00:50 +0530
Message-Id: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMrO1GkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwMz3fS0Ct3knGzdtMyK1GJdI5NEE0ujpCRzM3MzJaCegqJUsARQS3R
 sbS0AQqIcQV8AAAA=
X-Change-ID: 20260406-gfx-clk-fixes-24a492bb7676
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4NyBTYWx0ZWRfX+27ywA2MS499
 fBRVizbOZ4Wj+1bqKx3evCngq8jF5C5N6HdRErWEaRrhH2KjlChlGj0LIoYI15s8tLEgpZCJoWP
 Mwmw2TWmqwfJ4su4eTZTLCLN05c13fzHFT/cAZ/W17NJJ0UkWG3D0dOS0ZBARaJWIUMhHkJOete
 D/lGLWA7rY/cheqieR7L69/ct8I9DSP8zrT5+ZVXxjrI/YPobWCD7BpJSmu3PslD/pcZCy7UYKZ
 +zF3W/5Af4hSe1DLmmceXxewXVgwNKOjU4ZiwC86PgXszs/22W3V4KzZwtg2ywUs3AKtU0UiU1p
 Sc+KyYjkfW7vAiKtLQxoq+g2zdyb7sbgREglwvdjSn1QSGXRzS1IJsCXpGSkM5Ru+3byw0UlpA7
 Q2JL+srU5E1sZuRM3iNWZSs2Nmo/ZMugSWLFQjqcdVP+yn23Ge6IHwJHOnBiTKpGWIck33/vpP4
 EOOyF8ILApGvk/ZS68A==
X-Proofpoint-ORIG-GUID: gEM25h7wOb_q-b-4fcRv4Lw9S8mTDuwb
X-Proofpoint-GUID: gEM25h7wOb_q-b-4fcRv4Lw9S8mTDuwb
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=69d4ceeb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=zYEJGWroTao7pyO8AgkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070087

This series fixes two closely related issues around GX GDSC ownership and
rail control on A8x GPUs, where recent hardware changes and runtime PM
interactions violate GMU and IFPC(Inter Frame Power Collapse) architectural
expectations.

Problem statement 1: Incorrect GX GDSC disable by OS
----------------------------------------------------
GX GDSC is a special GPU power domain that must be exclusively controlled
by GMU firmware during normal operation. The OS is expected to force‑
disable GX GDSC only during GPU/GMU recovery.

However, when GX GDSC is managed through the generic GenPD runtime PM
framework, it can be unintentionally disabled by the OS during system
resume (resume_noirq/complete phases) or runtime PM suspend paths. This
can race with GMU firmware usage and result in warnings such as:

  gx_clkctl_gx_gdsc status stuck at 'on'

and failures in gdsc_toggle_logic(), leading to broken GPU suspend/resume
behaviour.

Solution:
Introduce a custom disable callback for GX GDSC that prevents the OS from
touching GX GDSC hardware during normal runtime PM and system PM flows.
The callback relies on GenPD’s synced_poweroff flag, which is asserted by
the GMU driver only during recovery, explicitly allowing GX GDSC to be
disabled by the OS in that case.

This ensures strict GX GDSC ownership by GMU while still supporting
recovery use cases.

Problem statement 2: Unintended GX/GMxC rail votes from APPS RSC
--------------------------------------------------------------
On A8x platforms, GX GDSC has been moved to a dedicated GXCLKCTL block
under the GX power domain. Due to the current runtime PM device links
between supplier and consumer, when GMU device is moved to RPM_ACTIVE
state, GXCLKCTL device will also be moved to RPM_ACTIVE and result in
GX/GMxC rail votes from the OS.

This behavior conflicts with IFPC and Adreno architecture requirements,
which mandate that GMU firmware must be the sole voter of these
collapsible rails on behalf of the GPU. Linux is expected to intervene
only during GPU/GMU recovery.

Solution:
The runtime PM of GXCLKCTL can be disabled post the GX CLKCTL is runtime
suspended in probe, so the runtime PM requests of GMU device are not propagated
to its supplier GXCLKCTL.  To avoid incomplete runtime suspend during probe on
clock controllers using runtime PM, ensure pm_runtime_put_sync() is used so that
runtime PM suspend completes before returning from probe.

This along with GMU driver change to vote on GX GDSC only during GMU recovery will
prevent the votes on GX/GMXC rails from APPS RSC during normal GMU operation.

Patch overview:
--------------
1. clk: qcom: gdsc: Add custom disable callback for GX GDSC
   - Prevents unintended GX GDSC disable outside recovery.

2. clk: qcom: gxclkctl: Use custom disable callback for gx_gdsc
   - Applies the custom behavior to GXCLKCTL and fixes runtime PM warnings.

3. clk: qcom: common: ensure runtime PM suspend completes on probe
   - Guarantees synchronous runtime suspend during probe.

4. clk: qcom: gxclkctl: Remove GX/GMxC rail votes to align with IFPC
   - Eliminates unintended APPS RSC rail votes, restoring GMU ownership.

5. drm/msm/a8xx: Make a8xx_recover IFPC safe
   - Makes the A8xx recovery path IFPC‑aware by checking GX power‑domain
   state before accessing GX MMIO, matching a6xx behavior.

6. drm/msm/a6xx: Limit GXPD votes to recovery in A8x
   - Removes GXPD voting from normal GMU runtime PM and restricts it to
   recovery using the synced_poweroff mechanism.

Together, these changes restore strict GMU ownership of GX GDSC and GPU
rails, align Linux behavior with IFPC architecture, resolves reported
runtime warnings and failures, and enable correct power collapse of
GX/GMxC on A8x GPUs.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Akhil P Oommen (2):
      drm/msm/a8xx: Make a8xx_recover IFPC safe
      drm/msm/a6xx: Limit GXPD votes to recovery in A8x

Jagadeesh Kona (1):
      clk: qcom: gdsc: Add custom disable callback for GX GDSC

Taniya Das (3):
      clk: qcom: gxclkctl: Use custom disable callback for gx_gdsc
      clk: qcom: common: ensure runtime PM suspend completes on probe
      clk: qcom: gxclkctl: Remove GX/GMxC rail votes to align with IFPC

 drivers/clk/qcom/common.c             |  2 +-
 drivers/clk/qcom/gdsc.c               | 22 ++++++++++++
 drivers/clk/qcom/gdsc.h               |  1 +
 drivers/clk/qcom/gxclkctl-kaanapali.c | 12 ++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 64 +++++++++++++++++++++++++++++------
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 15 +++++---
 6 files changed, 99 insertions(+), 17 deletions(-)
---
base-commit: 2febe6e6ee6e34c7754eff3c4d81aa7b0dcb7979
change-id: 20260406-gfx-clk-fixes-24a492bb7676

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

