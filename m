Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFB3371063
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 06:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777271950; cv=none; b=cxhcRx/Vvj/9T6EflzyIg7EQc7dAe0hGLEE0smKUvCEo5d936Fxc+Z62+LmrZryMYbmV6/gJbU4ov1TEOxhYkpXdDh+ZSIwrQ1R4Yg4KNPqTOUco3L6mKBj9KqCwvGy54zxt9bOZIfzVdQaZ3MEtZQiPjpBwyWjTh4e+2uI19FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777271950; c=relaxed/simple;
	bh=twNgjSdLVk/DrYt7aPzgVN+MOCFk7MhrzW6YAjRqQnM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IweLlQetwUsbHVlNoHQv8g2Yebh89T4hiLBOqUDAKSCU5Zha68PIH0TEuLpQCMJoAhFMEhLAsUkNeUuHllIcccVTWWctnagC2fgv+C+T3gshxrNz5bPs4wpGDT1/iSIu45RPcNXvTP1WmD7T1h5zW4dIQr08nLQAteaUGJTFSkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X9B+0pN5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H3DgFZVa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X9B+0pN5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H3DgFZVa"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QNUmnc2752011
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 06:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=61k0S6Aru9OHZyh04vEK3H
	Mf3snwaPzlYNIyU6zJurQ=; b=X9B+0pN5/64cUbBlhfNBDKS+5fVivKX5cGvTIE
	2I+HyyyDJHgNwQuDPq63k9xH5I06Lmcy4nAykLXuyUbR9PN3icJoMg0pZF1mld0P
	74GuBvt8vkDchInMD4rtAcrQ2IOvdLUdk6u/70z2NEYBmu/biHqPS0DlE29P/Jvk
	wGqX6Q43oqupWJMVSXOih26ALA+p3gE185P5yUun6W3rLXCc8krYGm0elw4+xYgn
	VYud7ar7430mjn8ZcbR3lRlr2oQz1VGBjJ3UadnipZSys6QC55/FLqA4MS4lZHpy
	cDDXbfL5oGsBShA2qOlt0wVQ9e6TxS8fEwtO2/QMI8oWTJZw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqtcsy4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 06:39:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-354c0234c1fso10800219a91.2
        for <linux-clk@vger.kernel.org>; Sun, 26 Apr 2026 23:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777271948; x=1777876748; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=61k0S6Aru9OHZyh04vEK3HMf3snwaPzlYNIyU6zJurQ=;
        b=H3DgFZVa3ufMKtD0xIdM8IbPjFOzyHAr+CvCm/wgdqSLtIDX4JLCbz2sDDu24TerAl
         gPmi2w9m6df5qbhKkXeF0VPHKVXis8Sy0lslRtXfMvfqecZfKUFD1iRL0jVfHvBm72ke
         rWVLNfjFeLUhBYf+UUqwctEJ/5lBIfX1M9kHKcyI50fZrqWYvez0W3eKzIzApT4QF5cT
         9oLzzoES4UJ8hKCUGjLylz9rX+CEQnpGImbvUcg5cs6uS8XHnRqyUQMe/YwkGz+ZOhAF
         IvEYZ6Um/Cbmh1rukBlpyIZUL1qL1ekH4beAWfgL2fGIbTpTm5kfsILg6qJB08xMtSzu
         BT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777271948; x=1777876748;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=61k0S6Aru9OHZyh04vEK3HMf3snwaPzlYNIyU6zJurQ=;
        b=p/hmdPQ7KFG1WAEMt2txvJbt69cQXVUcXDlvHCQDKQbQkBzYCNWv4GqcLR/T1cJuEU
         b3ZxEegnMdvg0JvQ7w56nIfwbGAAwUNi24WzZPrvrc2nd8OfqTH+hG6OMrWNk9x6IpYr
         Ouj2wysRabJe/iCUcAFH3+nFvPHE6eClzyaRPy/iYf6mgWPSGwymDyyu3tWC/roJOnYf
         bNG6ylus2KjS6AvfeV1AeRcLlxvSnGIO5fnVwLcOujJ5Bu1AyXcH5O18h1tcDbYhIa1k
         2+xRnQpAw74VfBd15KqhwSe5h2WfUxdNWNQQYT/zlUzB3aJ/5bett0PUrY4lE/oqnnUp
         C3xw==
X-Forwarded-Encrypted: i=1; AFNElJ/Tj0imizEUBuBjrvCI76qQ0lJYCIg349bONWAhRdcZERb7PPInW0LlBpwoEOh+8B6cEZl7jFE16yc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQnAnt6c9srUcT3SZEPXoC1cqWVKNJuypSq/37I2I6By8LGu8q
	z2CKmwIm1JgWUGcXakarmudRYwTbmBjjcTGng819pdY5F6dk9GtYiB1npwO0QIdZoc1aiAp8Hzn
	eyIa4OSCRPGgRsFbtS3SqCmf1zUuI5EfZgrob5gHqM49SROgpQ7J7Q0gfWE27Fbo=
X-Gm-Gg: AeBDieupAj0DOpv8i+1HiU7d2hvWelRy5+19ufPhztlThy7fae+WjnF5ktJChpLnc4v
	lPmMhLQ28rlQXWuWECMRKTZJ/Hv31p6p/29PSQN/VfRonXFHP+aXf3jg5oT+LOAGngUOHyyx8h5
	iKDM+9Vd1/XH3OHsDX65cApeYaJVMTG4xGQbrYSmb9YKYViDLA8bhIS/ucK/EySOhYihi4nZGyU
	iTTLKGqTKcaKIG5BwH9/JbBgHfSXx5wj46iTuJ2YBPQ+BuY5QYy+2KGWwlrlhxtLf4Jr2LYN5tW
	DQAuRHivhazNxKweJtntke3ziaTK/UeX5shlCWZxwezZ/jHeK1cHtlE6cV20IsBOfkzGQvdy0u9
	OXMpmWkQ+KG1BG08egbiuUBpZENU2zztzo6V1jFA0GxR/yTjkqsBnxm2m
X-Received: by 2002:a17:90b:3504:b0:35f:bb33:d727 with SMTP id 98e67ed59e1d1-36140478be0mr40995948a91.20.1777271947660;
        Sun, 26 Apr 2026 23:39:07 -0700 (PDT)
X-Received: by 2002:a17:90b:3504:b0:35f:bb33:d727 with SMTP id 98e67ed59e1d1-36140478be0mr40995916a91.20.1777271947140;
        Sun, 26 Apr 2026 23:39:07 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361410a7ab7sm38628234a91.10.2026.04.26.23.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 23:39:06 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v2 0/6] qcom: Refactor GPU GX GDSC handling and IFPC
 behavior on A8x GPUs
Date: Mon, 27 Apr 2026 12:08:54 +0530
Message-Id: <20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAH4E72kC/12Myw6CMBREf4XctZeU2oe68j8Mi7YWaASqvUowh
 H+3krhxM8mZyZwFyKfgCU7FAslPgUIcM/BdAa4zY+sxXDMDZ1wxwRS2zYyuv2ETZk/IhRFHbq1
 WWkH+3JPfhny51Jm7QM+Y3pt+qr7tz6T/TFOFDIW1Uh72RjIpzpGofLxM7+IwlDmgXtf1A+za+
 Z2xAAAA
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
X-Authority-Analysis: v=2.4 cv=J42aKgnS c=1 sm=1 tr=0 ts=69ef048c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zYEJGWroTao7pyO8AgkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: BDNRe2m4HU6ycx8lN7MrXS100rTiVVrl
X-Proofpoint-GUID: BDNRe2m4HU6ycx8lN7MrXS100rTiVVrl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA2OCBTYWx0ZWRfXytCDMXB4BXqk
 ELfBVl3dOdEs01IrKb1eRUZfDj2FgukeDhBXAKyEwR/jyRRF0ueXBhTMnmhKB0OLVH7N1nuZm0Z
 p5U2g6pbTJ/9RuD0PC4qe4GceUxAxrQy1R+VNvjJfFeEwcpzP5P3LcFvQNF1B25K3pmqB8A1nhk
 wY9fmAQaX7ohW8DPL8/+6XkIpU7lWvia9DNSJTF4t0xiF6isTYFRYApEn74Km3osHIKqPGfOnPx
 py7//Kd9hmePq2KcNrjEJTo/TkhW52kzMTyi3rNDz3SOj8eip6RD6MVimfb39fMnQKnzYxw1uWU
 Cr54qXaJWgKx17ASEkFkyk/GEyJeNWJiC4JqTvZ8aYo94NB/gLmEVef+ew9VdoYZCOuXlMKwQBU
 UXls32WtZ5umab4Kf9/ffEgBrXkGtUSosm9oGjFBLMq33N+FJndLehIF93blahJC8EN6ib1pNm1
 bzOk9DqRjpdvPCKU52A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270068

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

Changes in v2:
- Update commit text for patchset#3 [Konrad]
- Add RB-by tag for patch #2, #5 from v1 [Konrad]
- Link to v1: https://lore.kernel.org/r/20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com

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

