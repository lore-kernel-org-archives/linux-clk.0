Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D5B38C434
	for <linux-clk@vger.kernel.org>; Tue,  3 Mar 2026 09:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772530540; cv=none; b=cY8vWXfJLl+oc7fQP4Ybth+jch4Dh/I4bsIrXgdMxTjiOhqwzJBUQ6VL8CMAVw4u5E1kffDGnQ9IFTK8ee6AAt+NJYXFuQ55PyVxiVwMIrk1m9QQpDfLSbTI6vA3PUjpHl+xyyGnazVzh57TwTEMMWFjiEPpQg0EgkM2EjV8nV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772530540; c=relaxed/simple;
	bh=wEPfc0ygU2GYfoP1v6X5uIwJoeoMWGQ0SrsE83Yt0po=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HuHEaMvVfe5OFQr846QuvTwRAFuoRzLBvK4ghY7dUPOka4StjGm/M39708JtUlACNUt6kVscUOtA33sqlNPrHLVrSE748ki9KG3cSBXTy5uuIWM+S/0n3jDu1yB1X644cAyOhVNu7cUlTUQonH3kKobtrUwwkk0ZsWP0tHYN03E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JgFqto/l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZQ0gEvGZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JgFqto/l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZQ0gEvGZ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239DQ0a2229999
	for <linux-clk@vger.kernel.org>; Tue, 3 Mar 2026 09:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pw9OXHUwWpHlSsYUeP25ZF
	lkTojQSwDyCD+RcTmM+/E=; b=JgFqto/l1ccQj7jTlUjrjnVlqkxN19BmnOoevc
	lGfU8DSaz6wpxYWkoJs0mOOa/fbc1nUeVPK+TgLg78bCri4e8UgevmupSNVsBXTV
	e30oY02GySLVieMbaoJyGt7+DgDAeHFH9BFWC4w39WOI+URtLwOv7SD/x1Vf2BOJ
	oSF4bjuJcrmbfoD02cRZZI9eqsGRXwwDqjsvhkqYTP+2gZZmYI7U+U5wekrBU2T2
	JWv/BcP1URgLO8LARnLm6P/QXGn7kjwWnMChGDdTuqR6oHEC80os9bhZp7C/j0ZD
	5aF90rrSvhnjAULRbOly1ijBvfiMbdv+H+G65MZke9gCbVJQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvtu82jj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 03 Mar 2026 09:35:38 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82743548918so4451579b3a.2
        for <linux-clk@vger.kernel.org>; Tue, 03 Mar 2026 01:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772530537; x=1773135337; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pw9OXHUwWpHlSsYUeP25ZFlkTojQSwDyCD+RcTmM+/E=;
        b=ZQ0gEvGZ4OOJ7AhYcQCnkv/bARXUTEIkTBLT+j/fM+0w0othXdmObSBHfELzbp63r5
         q114LQJvuNY8TR3b25LURZjx200DM02EuhOem/MkKiumF36+ZkxyUhV7Luu8rO08HbqS
         UnjgBrdVgS1ZuZts7eGM8xGW50lKJUrzV6qmruH3z3dVBjW0bc3urmJODl3s3rFR3m9y
         BvV6nOh5CD1esB7LGQMe2vmsmW8wUuDQvMwirndqXY0F/nevvPO+aMVx/fZv/4ZG2NMA
         5VOtAExWMIm9dfOElSwV3IBPxQWLGHB7oEjCT2aPkHdoxEpEJoZr2HfB0ucNVYhX2Ocp
         hSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772530537; x=1773135337;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pw9OXHUwWpHlSsYUeP25ZFlkTojQSwDyCD+RcTmM+/E=;
        b=FwFOXDJqYbgRnWigzLTZWuJeOwO0MVkjRnBTtlsIhJXleDnwZ8cdc2lnvRhl47Y2hq
         XgWsXGREjyktoegZQIQzZ9+1sP7WuqJVl+tRsXzZTomVAWvCG2THqsPR9cD0SrqIpKJX
         7py9PObXOqlEm+IVFh01KGRw/sUkwOgv39pmFP5wkczMjPvaBcVlxhXfmBoja5oRkVMI
         ZK1AMI6godFOdteJ35xveLULfD9TUsm+LT3tU2IggfNiEvfQtnzmRNwxN7rHQCa8rYqp
         L6tBc7mzzmIhCYZL83NT+atnVpuduIx7zFAAiNz0GxBzzndO3AYsJRWeNV/z5GHTEaEP
         NmyA==
X-Forwarded-Encrypted: i=1; AJvYcCVoeh1RBGdC8ZK3fl+WdkavoE0Q+qtgSOKI/pGnJAhdtApL/Z9XF80r52ndz0IZfwY+ry4o0wRc+wc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVjl9L4nRcLUXl7SdS2wz68b5yZJ1I7Q7BpUtyjpGtKxnPg5CL
	r/0qvmI4BF6/+bEmBkZGJSeS7ljudVojWH7bE3gsZpnI/0tNBd5FxTO+PHlQI6lf3bv2Rgk6zPs
	p1GnH68NFcq/KH/aGtyQ4qSGTV9n3dgZGU1/LLlvK4d5zZEUVrtK9OSL7SLuW4TI=
X-Gm-Gg: ATEYQzxvHADcr+UKOjVfrRgYj2iu9s5IQgY7XTIT12EkESD4VxfHgB635fA+9ZrHA2i
	Lqf0RifnbUfhektyYBqQ6HCCnfS5dvbEHfCfVMWa3LQxFge38BZ/QfnU2XtfNNIsrHhoQSx4W6S
	6d+oiM/7Me+r9t6bA5T+kVCsMm4NgXdVQ/L6cfP2njE3Ed9nSPmuWnSjuTgVQHzksFru5xrz18x
	7afr+f2hDgAPQU10QJbPzc0cp2/FgKQ8PqKVfk/WAonV3+2UxfL7CFLepsQpfJ2efNG0s/Eo1VE
	K5uHG2XTQqinnns8reW+tPUy/ggWiPr+o53QY81HV6xRsULCwZkmNyu50i0CXSSwsZIIe/GKg37
	RL6olrA2toqYveO1UuCWQSwM4TZBHIwavC+Au+hcn7B9lQw==
X-Received: by 2002:a05:6a00:2e04:b0:821:a7b6:10a3 with SMTP id d2e1a72fcca58-8274d9e67cfmr13924050b3a.34.1772530537278;
        Tue, 03 Mar 2026 01:35:37 -0800 (PST)
X-Received: by 2002:a05:6a00:2e04:b0:821:a7b6:10a3 with SMTP id d2e1a72fcca58-8274d9e67cfmr13924010b3a.34.1772530536689;
        Tue, 03 Mar 2026 01:35:36 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739ba6275sm19644212b3a.0.2026.03.03.01.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 01:35:36 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v4 0/3] Add support for GPUCC and GXCLK for SM8750
Date: Tue, 03 Mar 2026 15:05:24 +0530
Message-Id: <20260303-gpucc_sm8750_v2-v4-0-2f28562db7c9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFyrpmkC/2WNwQqDMBBEf0X23Mg2mkR66n8UEdlGDVSj2Rpax
 H9vKr31MvAG5s0GbIOzDJdsg2CjY+enBOUpAxraqbfC3RODRKlRno3o55Wo4bEyCpsoRaW1Mlo
 b1bUIaTUH27nXYbzViQfHTx/ex0Esvu3PJfHPFQuBQpMqsVK6pIKunjlf1vZBfhzzFFDv+/4B6
 Pa6QrUAAAA=
X-Change-ID: 20260217-gpucc_sm8750_v2-866576675fa0
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: bQDy1bl2Zh6xWaf3h-dUorwPEyDVgvuq
X-Proofpoint-ORIG-GUID: bQDy1bl2Zh6xWaf3h-dUorwPEyDVgvuq
X-Authority-Analysis: v=2.4 cv=A75h/qWG c=1 sm=1 tr=0 ts=69a6ab6a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TW7xPe3Xj7hOj2XzWEUA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA3MSBTYWx0ZWRfX1bgR7wN7JUS4
 JcDwZk0BozT0vL8scn21xJ6dFAgCvlKnl5aZZ8pfycMN/L1IqspKXANz/NRbRMluZKuYrIoD1uL
 wxmzp/1cxCgPGplGlYrmd1sYt2uPA2RPsQgulY7SBG524i9Ls6hzROBmLoWJuRBPwAVRMzQ8KPj
 MWH1M6y6/xN8JsyJVRMygBdnDOHlYnvD1JpRvWf+T+brF6TFYT89NKnk8KfdatRodyo26Y8Ffwo
 xQKGTtfwlNp7shpk4j8iEYvSHfzt741g4vRUiochwhnvKaZCrOFvpZYjGOS+H0m4c1y8dnu+mw7
 MBNlBxhTC5wPVT5CMX5uppw3jK9FUy4IJc4YTUcFnrB8oaMGjAwep4sbqxUyhMXQcRv2lHqj6to
 GbNRg/KpnbH250z1AvzN8LySdC6GzfwkYfC+JwrTUr7P6i6Iij3mii6l5ji3hTXYhoZp7Xhw1+F
 afOm1DBwUowCqD2SuCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030071

Support the graphics clock controller for SM8750 for Graphics SW
driver to use the clocks. GXCLKCTL (Graphics GX Clock Controller) is a
block dedicated to managing clocks for the GPU subsystem on GX power
domain. The GX clock controller driver manages only the GX GDSC and the
rest of the resources of the controller are managed by the firmware.

The Graphics GX clock controller is a reuse of the Kaanapali SW driver.

Changes in v4:
- Add RB-by [Krzysztof] for GPUCC bindings.
- There was a documentation errata update for GPUCC and updated the
  bindings to capture the MX and CX power-domains and required-opps.
- Update the compatible[qcom,sm8750-gxclkctl] in code which was missed in earlier patch.
- Add the 'use_rpm' for GPUCC.
- Update the power-domain/required-opp handles in GPUCC device node.
- Link to v3: https://lore.kernel.org/r/20260220-gpucc_sm8750_v2-v3-0-6c5408564c3c@oss.qualcomm.com

Changes in v3:
- SM8750 GX controller is reuse of Kaanapali SW driver, update the
  bindings.
- Remove 'qcom,sm8750-gxcc.yaml' as it reuses the driver.
- Cleanup the 'gpucc-sm8750.c' to remove the GX clock controller
  reference.
- Add the corresponding changes in Makefile for gxclkctl-kaanapali.o
- Update the device node for GX clock controller.
- Link to v2: https://lore.kernel.org/all/20250723-topic-8750_gpucc-v2-0-56c93b84c390@oss.qualcomm.com/

Changes in v2:
- gxcc bindings: remove double colon & list the names for power-domains
- Link to v1: https://lore.kernel.org/r/20250708-topic-8750_gpucc-v1-0-86c86a504d47@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Konrad Dybcio (3):
      dt-bindings: clock: qcom: Add SM8750 GPU clocks
      clk: qcom: Add a driver for SM8750 GPU clocks
      arm64: dts: qcom: sm8750: Add GPU clock & IOMMU nodes

 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    |   1 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  23 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  68 +++
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/gpucc-sm8750.c                    | 473 +++++++++++++++++++++
 drivers/clk/qcom/gxclkctl-kaanapali.c              |   1 +
 include/dt-bindings/clock/qcom,sm8750-gpucc.h      |  50 +++
 8 files changed, 626 insertions(+)
---
base-commit: 350adaf7fde9fdbd9aeed6d442a9ae90c6a3ab97
change-id: 20260217-gpucc_sm8750_v2-866576675fa0

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

