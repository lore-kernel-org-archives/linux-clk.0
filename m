Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A6530BF6B
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 08:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778057046; cv=none; b=pAt03oKgaNi95Hyaw74i56l5F5SZuhizNZnmImZ/ilVeJWbtpINzuFuBgAbatswI1guJf7PLip/F2yxVx1VE1gXMbhMQFgk1BomH1DVRdxDYjSY/R0Xj72cOqJaOCIrGAKscQOVyTGoSBq9AO1bAra8/b+z03Lyugd9RgffIR+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778057046; c=relaxed/simple;
	bh=9vA4fHyYmcRAvdU9Qy5L7g1YHobZkfL7qBI9EHl1cc0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G/Q7LMzYerBOHKAZFnXteYCf220VLMpg8vpoOMXyZzsVXAaedEfLdjvMeUSEhvgAcbIyjTqfkFcxDpwHA8bxbwE8BJOBMga0+lSRJSCMkVBKIQQVfirHZWoJAV9SeO1RBIYSvmcoInW6qoZrFCJt5E4I4F5YOvo86Cu4iDDyXeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kCZUwXoj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VcYhy/fT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kCZUwXoj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VcYhy/fT"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6466qqP8248143
	for <linux-clk@vger.kernel.org>; Wed, 6 May 2026 08:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=f/gbsaC8MFwCW2tlaPZomx
	EbJBK/uagWxLG9GJswcSI=; b=kCZUwXoj/Rf8fjRHnK2fnKtFhy3F2k4AG/7W64
	shF4X1khm3WzZyinGjZYXGQGN9ZpGyZpTjvjxwySZ5WlH0AvbtnNkYFKmS3fJpwA
	CyCUHEgmbTsMa8uTzKMWPEEi4RnONq5armI8CwGMRzudaWyKNoRRuWASpglRSqup
	sCnoICQbnV5Dy68B5GCfb+CQo2jdOgaAAZmJ+glKrUQO8+nM+jzVSfkRCzNGAS6+
	k/8qOufZU7YSySY+DHD4f5pIShSzkDTUFWGirs71035fINMs51MQ72CftXgsq3fp
	mZ6afirwtWr4OwG7YAtfzPj3STcA4SqVe4hO/tYHGb3Hvjhw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyjq43nfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 08:44:02 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12c8ccc7593so8228018c88.1
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 01:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778057042; x=1778661842; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f/gbsaC8MFwCW2tlaPZomxEbJBK/uagWxLG9GJswcSI=;
        b=VcYhy/fTxIscYOxRTE75xhDvgHsDa5pg2U7bhzKHO8hHyLF3ktr1RMU7QmMW6tayHF
         HXJ8735IWOuQEm9DSKLRqdRtRtGNMt5rWSCbtkTiFrQnTNP0MlO4kVKKv8NNfQhdBRTn
         WQANLYoHq+4IfdLOhRwtQlyE00tzMa4cs6xqSyL5MfXLO0CdK6b42IKsGzaP8e6QGZt8
         8xCCUr518GuwD9SvzVGflL0IfX6yfzcsIZtX7V0DArN2sLJ/EVyWaBdboocapYMNYQG8
         OTBW0GeHgNEdTZa+Clq0nynhdqTV8HPqR+I3ZsJ3a/0BaWBvl+kHafUjIja2BqxKO1BW
         lNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778057042; x=1778661842;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/gbsaC8MFwCW2tlaPZomxEbJBK/uagWxLG9GJswcSI=;
        b=AaIh945GfgxCXFQ0mNNITB99+UZGe7P1sayvMNSSej1IedSP9ZT2OzFMo71AkG3MAT
         ylA8GiDDMYWoQ9xQOEyqBijcGACsW0Sufq1jFd6ipuVgOYa0f3DZk0FPEv72FpxIwjL2
         8pn4OZtn3buptR74vFPKmBP2jm4p49UdjxJjchnX639TqOj1PMLlNFVggKV5Q7G8ks0D
         ZKQBujE/3ODCxWoguonh9RVwIhBAMc0Eu4M+hmdVuIyJRWeAhfdkac/MxF+MV3UCD+I5
         sAH4C7C+xOzKN+5oyaR+MEvADA1j9c5JzHgMbiguoMXpw9jsdnkDSKr+zJogX2kN2jpY
         75gg==
X-Forwarded-Encrypted: i=1; AFNElJ/t/TvfuqlXuuzfYx5H++i67CABoZGLka43CuW684hEcUrqdRbw4d5rUwMkr902O1abU3/08TDGQ5A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRQocqifwNYingujLoV+c+91DXsSQZtgLWyhA8JNHGrloQWkNO
	mk8zO5pzpIP/ZtNMNLULEzNgIvIMKw18jeD66tlDn8PrrrUUze30JPxRxQDuMJSEtobmofy0cIn
	f8cCTqXUIUxYMzzVn8LTUc4YECFuiRFkzoYX+kMoo2HGMepxwCCXocrXzYhRuSxY=
X-Gm-Gg: AeBDieuSJtg1qiTbwv32+C4uFRRrc92OEuOVKYSkTm7HKCYMzrNSvxKr2KFPqtx8JYS
	LWetR3acwmM3h+feRePNuYYWHddYZEyPHK9gjR7vr5B9mmsjJnoXDfYqcskO08cAX/928tHk0/6
	xs6VdjvfwOaGWOFiAA1oAcOzhyCSewukjU8m5ly0yRzzySJ++MH0TgyAezhRYT6iKCyV7C+KzT/
	fNI/vqZsO3jg+Aew/NQRQZ1AoW51oUn41tsXyPE2KOvXI2Aya09RiQ7ELuVSLxd+fIuu3sbfiiq
	hLJqICa8teODNOGZvksys8SQmX+jWhVmCVSDsh9OtwPCXduD7pgcZnNJdToBG9a9/6bC2Iw7WJb
	7Jzg7GSm5ZkHJb+lecmAJEBkP/yAkkU0W6ccw8sdxY7jV9gMpx9eZZM0lvg2LvRxSFLHidtshNj
	q0RUY=
X-Received: by 2002:a05:7022:6191:b0:12d:ca31:f1b4 with SMTP id a92af1059eb24-1318e92854fmr1239793c88.24.1778057041709;
        Wed, 06 May 2026 01:44:01 -0700 (PDT)
X-Received: by 2002:a05:7022:6191:b0:12d:ca31:f1b4 with SMTP id a92af1059eb24-1318e92854fmr1239790c88.24.1778057041117;
        Wed, 06 May 2026 01:44:01 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13202fbf0efsm2257796c88.13.2026.05.06.01.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 01:44:00 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH v3 0/4] clk: qcom: Add common clkref support and migrate
 Glymur
Date: Wed, 06 May 2026 01:43:50 -0700
Message-Id: <20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEf/+mkC/yXMyw5AMBCF4VeRWWtS1+BVRERryli4tCUS8e4Gy
 y8n57/AoSV0UAUXWDzI0TIzkjAAPXbzgIJ6NsQyzmUmM7FZNO2xeGyZuTAqSpVRstB9CXxaeab
 zC9bNb7erCbV/K3DfD2xyfu1yAAAA
X-Change-ID: 20260505-qref_vote_0506-fb14bfb08cd9
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778057040; l=2713;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=9vA4fHyYmcRAvdU9Qy5L7g1YHobZkfL7qBI9EHl1cc0=;
 b=dNoxL7xzVuG/fA9F6C0/0aOb0eXGRFfaUaiM11KseP4Em/fKs/aBTK02gvsmSySFMLH1rgiSk
 nbHf1viqE4wBtvSMjZKcHpnyStaP9q4NAXW0NjrVk9p13jUhz+j8VN/
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=MYxcfZ/f c=1 sm=1 tr=0 ts=69faff52 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=EUspDBNiAAAA:8 a=gTLHQjeEnPAAWBE9dSMA:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22 a=xwnAI6pc5liRhupp6brZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA4NCBTYWx0ZWRfX7xRCA+Fk0r4s
 2r0e1Qv4ihhIrHfGuEySOZXXqDq0I3SD7h7QlG5XHAy9BhMxSNi4M+wYDKRW7rCjccun370MSoB
 hLfF10jIMAkdTenPGdWum8ILfROkadKOdMaBdoIacwuTahEn4/Kxf3VBTK6H2tL5mTT5ndrIVNk
 ONuH07ZDtfhs+tJ8WKrrebsRREoscWdFALGCLKsc+V1u0zduGu295K4uN3s+p8nLGpVwxOZ3KFh
 FFTLModJ8rkexGKmlWfuc3wGfo995NS87oS3vcpfMoeNvX1VPOJeziyDZpNBZ42v0Lm6I6xz/WN
 2XQbxveqi2qT9HGc8gJITRfwFFZTRC5B9rjxvA3G1Er2qgBeFGS1Vm1uDee9t0EfpGYa7h7MzGQ
 1EF+4sO1cNG/742J+Q/iKyOXAeEqKLiuH7yE8h3kHhb79jQcj4IVwFXoEMgVZdd/BUBStyjInGm
 0gY+jdPf3M7fG4LZv4g==
X-Proofpoint-GUID: l40FDLbd1w8Z-RhlKpsyv_fTrnLzl_FA
X-Proofpoint-ORIG-GUID: l40FDLbd1w8Z-RhlKpsyv_fTrnLzl_FA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060084

This series adds a common clkref_en implementation and converts glymur to
use it, along with the related binding and DTS updates.

The PCIe clkref clocks on Glymur gate the QREF block which provides
reference clocks to the PCIe PHYs. QREF requires LDO supplies and a
reference voltage from the refgen block to operate. The refgen block
itself requires vdda-refgen_0p9 and vdda-refgen_1p2 LDOs to function.

Previously, these QREF votes were done in PHY drivers. In earlier
discussion [1], the feedback was that this is the wrong ownership point:
those supplies are for the QREF controlled by clkref registers, not for
PHY directly. Based on that feedback, this series keeps the regulator
handling with the clkref control path.

Another reason for this series is reuse. clkref_en registers may live in
different blocks across platforms (for example TCSR on Glymur, TLMM on
SM8750 [2]), while the behavior is the same. The common helper lets each
driver provide simple descriptors (name, offset, optional supplies) and
reuse shared registration and runtime logic.

[1] https://lore.kernel.org/lkml/aEBfV2M-ZqDF7aRz@hovoldconsulting.com/
[2] https://lore.kernel.org/linux-arm-msm/20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com/

Changes in v3:
- Fix dtb check error: allOf:0: 'then' is a dependency of 'if'.
- Link to v2: https://lore.kernel.org/all/20260420-vote_qref_in_tcsrcc-v2-0-589a23ae640a@oss.qualcomm.com/

Changes in v2:
- RFC tag dropped
- Changed back to additionalProperties: false
- Moved all Glymur supply properties into top-level properties so they are explicitly defined.
- Link to v1: https://lore.kernel.org/all/20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com/

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Qiang Yu (4):
      dt-bindings: clock: qcom: Add QREF regulator supplies for glymur
      clk: qcom: Add generic clkref_en support
      clk: qcom: tcsrcc-glymur: Migrate tcsr_pcie_N_clkref_en to clk_ref common helper
      arm64: dts: qcom: glymur: Add QREF regulator supplies to TCSR

 .../bindings/clock/qcom,sm8550-tcsr.yaml           |  57 ++++
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |  19 ++
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-ref.c                         | 202 ++++++++++++
 drivers/clk/qcom/tcsrcc-glymur.c                   | 340 ++++++---------------
 include/linux/clk/qcom.h                           |  69 +++++
 6 files changed, 441 insertions(+), 247 deletions(-)
---
base-commit: 4cd074ae20bbcc293bbbce9163abe99d68ae6ae0
change-id: 20260505-qref_vote_0506-fb14bfb08cd9

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>

