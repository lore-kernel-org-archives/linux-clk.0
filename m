Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426E0363C75
	for <linux-clk@vger.kernel.org>; Thu,  9 Apr 2026 18:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775758265; cv=none; b=rGWQBa/oQWUXgyvRgwdgzRfEPSpATKx+ZWwtsSEMjgdheKpGxA4HcDJwzhCrgUj1RcDXKFN76Kc93TpIANTFpnyEsCbjPmh3gbYxbNSf3SK00Jqlbv+7YD+5UuNtth43S5bVXK0dJs8QW9kasDJRjvhDE3a/RbKlwD2c8tJk0Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775758265; c=relaxed/simple;
	bh=DcNNggxe3/4gvizHu0j9sZrhDu4v9aPRRQ+y/3tUjT0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AoipBsGi2/OKdDQe3PRJEPH3nJizDEKOBkMmZgnvexygKlQh8yx8hKJK5S8137T05BAW6ndwo2Jxil4IfnhXP3rNAnxTi0jLFBtRp+mbuu20txsX4hLYWyFyCqjdMCB1a0subLWBiMXKZZppc9dm7azgEg5V78LR1gyJGYzsUG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oOv1WGiD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FfFqu/K0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oOv1WGiD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FfFqu/K0"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639DdLJG2812084
	for <linux-clk@vger.kernel.org>; Thu, 9 Apr 2026 18:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vYpYuC0n38W0nO+hluOO6j
	DvBMadgq+PwfBPn4EQ3kw=; b=oOv1WGiDKNP8CjOph4FPN5YWeLxm8jl8ZEPeHH
	NxDmx0A+301t04L2xXkKAdJ+5J0BE1bJvrlZPk2oNNcNkl9NdhY5sx96RJW8eDwI
	N0y+WxDQq3PtfXK1KKH+ffWlPPaLsE2aYb79UKSq8E8BrJCyKCb25Fg7w3ws6kHH
	pumfCHyQrszHMnvkp3HMkrA6A4U2X/AtsSiwnjVbolVYINyEdNTcDZoN3ZlN7uah
	D2/1VSFjAeHTtG+/90Xydm0G5cIyJc9/FAjArPJdpOfxBr0IudV6UEsdUdHsn21Y
	mAoa0AtQ6/4npULpXkMuepFBdpHlFC6Nxm85bSSJR9sa25zw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded6h90q6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 09 Apr 2026 18:11:03 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c741c4cebf3so607072a12.2
        for <linux-clk@vger.kernel.org>; Thu, 09 Apr 2026 11:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775758263; x=1776363063; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vYpYuC0n38W0nO+hluOO6jDvBMadgq+PwfBPn4EQ3kw=;
        b=FfFqu/K06thMBR0XU13QT9q8IHdSHWlq4PwlUaiQQgmLA53igDn9tHTbYzXP/WF9lM
         XyDruJikUYYgrFMgAhO+TsO9K0QyuJvgEKzmAFffmQad3sH6gDYiKU9FBpm1zIJHtSUV
         scY/yqtM/b+f69GX+gFLtQjcnKZfmti/VOIqEi/STv7vbiBwvPt+CdrywJdM4DCEVS3Q
         RcYOrmp/wEBXCktw7Dqx8NftgT2hUTLuK0y8+dP1uU2DYyn2r5T7L5xzA+Qp038THzEr
         +LV0Szt1ClJ7IFNWChGJXs+v0C4Lf9eWAS8OBbKW18VXl9ACutTzp7Pvtph0IzGb2Wwr
         scrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775758263; x=1776363063;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYpYuC0n38W0nO+hluOO6jDvBMadgq+PwfBPn4EQ3kw=;
        b=bWz2tPXnTKWFu8n5Gx5LqGEmBpt7I50wTwqTRDHfD7lN4ikZ+9iyu/AkauB+qUw4tM
         q+b8B6Uky/siaiN2Pclf5OVm1A4z+FVsDgsDCG+brBvkMT7bHrIzXQaexir+DfrAp+Ma
         Ud9OZey/g2oSD0Kzdlqw98YcdB+/lIEKdCGNx7wJRk+4DNdo9D7hUsOddua4O3YYAVNE
         1DhZpoFihb4Ib8pbq30bnPmvB722sOeTF0iYRdI2szYicKisUBZc5ZA4hJxXT5pyBAFh
         9KX1x/99X78MLapwz2X44w/JfDYeEUGcFnt6u3mtP74BKVEZ/T2QdVHrqSBiVxVUoGiK
         Jy9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXQ3XbWQaE9HOxpDFY3Ch5PhlXGPcx99clmfzwZ+OJzCGygvbJSr6uLfnQ+GJ3xySXynlomD2zHN04=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdpABXWfas9NCDrhZBXvGxp6GBuUul6Smx0vcHYSZnTaTlCLL2
	2SVpeAm7Ou2e9nw/yzjqdFI3wpJf+lyoZQlYq6IsA9RtgAlFlsEe/04c4kswOJi54JaZGL85KzA
	uvSNXzgqissJt3zZGP2fcRIcdGCSsXUN4OB1ikvTjsZLce48UlC5W0yGdYluoxNTz/sX7ocA=
X-Gm-Gg: AeBDiesZQCGOakwmNPEbu1nmx5sgtICnWJn5rBsenhX5VfUgLjKWDTu6T+5kEC5jjkI
	7LNCas2OkaJ9/0Jvk1KN2rZrTsMLrg8ZkVIZi14UBTw65aox+BypAyIBOshu73aPxBP5YYi364K
	WyumbzF9MyBda4vx22KYxWnTPxo2PsQOr8BNArubqSUgN0S831BUv2ecBG2Kxms+BZpH2XRIOJx
	HKoyoV8VS21egvWZcvjzB99Tuj6m2vCG0C9oigvs9PvsvRtA39roPo0LK7rZoAyiSH3c7kFog60
	d6Y8Ld76xks7yXYAyB8vThJcR4mNLctYBFc/a9Pqp51FzxdPDxkoPhfd7BPQuBfqANJ1DZJp7xQ
	pRzxrZ+PzmN6agchQ/rYo4z0/K+o2suEUQ+FtAsCsWoecpA==
X-Received: by 2002:a05:6a20:1587:b0:39b:fbb2:5e46 with SMTP id adf61e73a8af0-39f2f0968d0mr27843588637.40.1775758262380;
        Thu, 09 Apr 2026 11:11:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:1587:b0:39b:fbb2:5e46 with SMTP id adf61e73a8af0-39f2f0968d0mr27843534637.40.1775758261702;
        Thu, 09 Apr 2026 11:11:01 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7921a2d9ebsm66132a12.30.2026.04.09.11.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 11:11:01 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v2 0/8] Add support for Video, Camera, Graphics clock
 controllers on Eliza
Date: Thu, 09 Apr 2026 23:40:41 +0530
Message-Id: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKHr12kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDEwNL3dSczKrE+Nzc+OTk+DIjXXMDw2Rjk5SUJHOTVCWgpoKi1LTMCrC
 B0bG1tQCG5W/qYAAAAA==
X-Change-ID: 20260409-eliza_mm_cc_v2-701c34ddb74e
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=RfCgzVtv c=1 sm=1 tr=0 ts=69d7ebb7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=O432ggMcIDbDob6sqXIA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: MRV79InPGW5wBi1b29-kSMTf_3JdgTPG
X-Proofpoint-ORIG-GUID: MRV79InPGW5wBi1b29-kSMTf_3JdgTPG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE2NyBTYWx0ZWRfX+wOTtt3GBdVV
 XM6VyorIJc3ZXCmPe82TqHQYqx+wBkuAotLB7B+iueQQV51foB+e5MBiwuHlkI3Lhb2j07VxT6S
 JxDjnm8WmgzHnxOTXbtBdKUInwnBVmJyeSohvD5WQhfaOGUjCqpNOk5WKkFuEfdnDPAxEhRZGdz
 IwpoRn9tbo4JkqkPj7tKlad2xRorNkY6tgtQxa1XijZTqFgRml94Sy9NpvCx9YpZfXskv0Ymiii
 GKjhlJmzkWuMrugxU20RqHXzqDzpG7a+8Wp48Robi96eZLnJgzre6YIuVlXurbIltI4pDfZkejC
 260MgbZ6biHasTABM4Pe9JheC9vpJlZT9RshfCazLEoPaObsuCLrb4hQfNLA2KZH8cRHIdwLjer
 VPYq4MHLeJysYKAL2ku5GDH7M5EbaYy5YW+FzA+mr/BbNhUpJt0er1effJbfIvS9KmWeG+W+VzP
 NpPRbZyC064gzKwvHUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090167

Add driver for Eliza SoC camera, graphics and Video clock controllers.
The camera clock controller supports the cambist clock controller and
the regular camera clock controller.

The patches have been tested on Qualcomm Eliza MTP board.

Changes in v2:
 - rebased the patches on the latest linux-next.
 - Add new bindings for Video and Camcc.
 - Remove commented code in GPUCC (limiter code).
 - Add device nodes for the corresponding clock controllers.
 - Add RB-by tags for VideoCC and CamCC/Cambistmclk from v1.
 - Link to v1: https://lore.kernel.org/r/20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (8):
      dt-bindings: clock: qcom: Add video clock controller on Eliza SoC
      dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
      dt-bindings: clock: qcom: Add support for CAMCC for Eliza
      clk: qcom: videocc: Add video clock controller driver for Eliza
      clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
      clk: qcom: camcc: Add support for camera clock controller for Eliza
      arm64: defconfig: Enable clock controllers on Qualcomm Eliza SoC
      arm64: dts: qcom: eliza: Add support for MM clock controllers

 .../bindings/clock/qcom,eliza-camcc.yaml           |   55 +
 .../bindings/clock/qcom,eliza-videocc.yaml         |   51 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                |   54 +
 arch/arm64/configs/defconfig                       |    3 +
 drivers/clk/qcom/Kconfig                           |   28 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/cambistmclkcc-eliza.c             |  465 ++++
 drivers/clk/qcom/camcc-eliza.c                     | 2803 ++++++++++++++++++++
 drivers/clk/qcom/gpucc-eliza.c                     |  621 +++++
 drivers/clk/qcom/videocc-eliza.c                   |  403 +++
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
 include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       |   52 +
 include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
 15 files changed, 4761 insertions(+)
---
base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
change-id: 20260409-eliza_mm_cc_v2-701c34ddb74e

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

