Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269B32F25F0
	for <linux-clk@vger.kernel.org>; Wed,  1 Apr 2026 06:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775025337; cv=none; b=QchoxL+EUtIhfExeJIeAl++vCQytl41YoqlQmMgOAZ8OnkbSyEa8NGsFpHI1YNe9EVN1RabTWnRd58EuJHDgpGhx8kHHFWQSS+32RKeGcE4/fZZzbhoFrTzeV/123TdfDeXESSx8YeMlWkywnJoGj3agKEazI6w1U5nhXZ/uews=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775025337; c=relaxed/simple;
	bh=pZgJfIlthTCYN9wLzuXbK0NjilNyt3lBCh93LAZc1mU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kGDyMmgaDdd4fksbD5sRhCl2A9mASQYKs4D0/y97Fy/VsZHbbLqNhP4KsKgsrzdOGulKsm9ajZ/Ocg2w25lcYcMuCer9bSwNKheUsPI026XX5QIydZuF7+v/b1srcK9DAi4BLiboajyX41iQcBZK8bpxhJxnMsbzUI5SY+Akdoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KPbHFyjt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EbcunRjf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KPbHFyjt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EbcunRjf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6312OsG93081386
	for <linux-clk@vger.kernel.org>; Wed, 1 Apr 2026 06:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Z/Xwg6NdWjuQ2U74auSCsp
	9k1g83Vjj3epMh9+/ls5g=; b=KPbHFyjt4rpCpD516jII9Yr9s2UkqTCBIWbdwU
	qOs08qv4e3WuO9ns/wKKo6Asyt9oGf0TEgl1UAJUSVc/xGNO9D0dkbpqgkRfVidW
	ghsrl3jltmfaQ7QGNuBPlYU9Wac3rf6XvlLOymuh79j+xxB6fDrsbr3g5x9OOJav
	XwUn3dTWrpnRL+g4QTEkB/8YQY7ZT+H++ugVI/CQGro385N3i4Se4ncI3K1raCHn
	GfUUVL6pHW+PTWcBvFfBhX0J6NElmcETKE14p9SqOY8XzlYIh+wiyTmYc5BTvUQr
	v4/pRJ9IrmZIlWJg4NLBO+OKuTA411JGNtiuTyfNPxDo8AhQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kdktm05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 01 Apr 2026 06:35:35 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-127337c8e52so11603990c88.1
        for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 23:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775025335; x=1775630135; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/Xwg6NdWjuQ2U74auSCsp9k1g83Vjj3epMh9+/ls5g=;
        b=EbcunRjfg54flc1c2L5a96boowEmgsgSm/sBEcmbjS5+AoICTtqlMwrLJrqmc/+ezM
         X6OPtf7rQYvHa+qOO2JkzYsXPDxJaNJf+PrpWT11B2EqpfMjrvnFwU89u7Ic5D5QWmFo
         ZNZ9cwLDbtmCpfsPnKCAEORRycE04MnYS3xUEmn1GsaNKs8CPTBgG/pIN/92DxVThSTB
         Ki0fzVHU9WltmlMQvqJ3Ddt1eWJ9sixdE9fGcFnVROf+KsdHqksVA58tEBWQGsEXTb0w
         0TYbyFyebjPyi57UQN4u3nHvcf7o5vv2KOVNaF2aIQlMyfO1pTNCWKTt0/vfyaio2te0
         THlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775025335; x=1775630135;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/Xwg6NdWjuQ2U74auSCsp9k1g83Vjj3epMh9+/ls5g=;
        b=lyiqZ6JkwA7tNrJWmJT7QYygNDKjlr1MtmUfKJqNb28rj6emjjUIIce67NJAXBLIlu
         c4ChA7VNeBWp06d1Us2HUp/Q0AQRVrlqAVqG5I1zbcQ2LGhXScczFwuADk32W9udZywB
         erU0owiPHz8fMfLJhX15l83+rKOr8JjoKhDbArT2HgIGjTg++jrO3/SMCdeJ9FG/HpRM
         4ssM6oUqe922mU/7zh5dWGVAc04JUcI6gaYOZWewj/hfgidHsgryL4UNQkPHASnK2PIa
         J5FEWZaPTIvcukRKhlPMm9I39BQHE0MzhCY0dnkAtiZMDQGtxcoP/jfd+IU353AeTOKT
         FRXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYJKZOAblZUgmA28KAt7Q2v21lUnzLhw0HeYteUT21JaCBZVhYyZGaA8rAN/UQYAcbY+FW0S75/Zg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6dTn3PALj9qrgNRLnX9T4lPVF7kYloMwWM4FH4EWCSNzOF9jz
	MOMl16WnQ1ZptP6byXbFRxc/GZuWD9Ap1Sqtep51RrAZBKWaJYq8GZf0wTTnMIr6gfdV2f8Ni37
	kOxaZElQaYtH+NXYzPgswfHFWLX1vUqrW2dw9YdhpR3SY2QvA5a8Oi/v0nVzvF0k=
X-Gm-Gg: ATEYQzy8P0LxFAMr7msYPH9nM9l7txYnJXN0whViQ/Yv93ZBiTyRsOdk7/F/KxcpPVL
	yQsgOfygRlnOLMit+FRGHhekAeYayyan/jfGAB3EmyJYFFBtqbA8KstMYjYmcVdPV0Ie0rqGR4O
	TZRrfhLwMtSmdJYydjunfg0FlmYEGyZi43QOgm/5msrW+lGKuvsyneECa8+jDgOyEcNKCT0GgGP
	LIb12YH0PoQ+/dQqL0yQsDQ2YrFR+syKsZTIAWU26G0ELH9n+QaBxXzql38+313wIyFQg6G3iSR
	Hh4MTBhvIv379fsPHHtsZLi4KRfdHqd6cLaaiB9WDNnuIDb/+o69WJQHg/O4ny3OSTSVChqIubx
	2EalmU7VqR/KZ/5NIl5UeZN2owLuprTOjytyBsbgEWd6KPPLeqbgoMAw0iJIoZA2TsV4J
X-Received: by 2002:a05:7022:618a:b0:11b:7970:ea3f with SMTP id a92af1059eb24-12be6578552mr1536515c88.25.1775025334508;
        Tue, 31 Mar 2026 23:35:34 -0700 (PDT)
X-Received: by 2002:a05:7022:618a:b0:11b:7970:ea3f with SMTP id a92af1059eb24-12be6578552mr1536483c88.25.1775025333824;
        Tue, 31 Mar 2026 23:35:33 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab97f6994sm12027550c88.8.2026.03.31.23.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 23:35:33 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH RFC 0/4] clk: qcom: Add common clkref support and migrate
 Glymur
Date: Tue, 31 Mar 2026 23:35:25 -0700
Message-Id: <20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK28zGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY2ND3cKi1LT4svySVF3jNGOLJBOzFFMLE3MloPoCoExmBdisaKUgN2e
 l2NpaADYT16dgAAAA
X-Change-ID: 20260331-qref_vote-3f38b46d5847
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, johan@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775025332; l=2248;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=pZgJfIlthTCYN9wLzuXbK0NjilNyt3lBCh93LAZc1mU=;
 b=eK8hXo8iF5pBml20zvFA/MQ11chaCiG20yvmVZ0FOCsH2NDyKH08/z8TSXPXmxtA//TuxYMyq
 YcA4Rc1c0doCWSeDwd6IFvoEDW1HptLP8FhLcVUWBUPNZNX8KkFBAbM
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA1NiBTYWx0ZWRfX6/16A20U/EoB
 e4p5fKbSB5y+um6CBCwaJj/H1QUocUwO+b29PDNQFXYdyM5TY025PkoGbul21OC1Omdbiw2daue
 fxioq4GNEfWbc1AF/AkCXNApo6QRzG5NS4+O34qviUiwD6kMl5wxKjO9SWVgG0AlG5oNhbGncnm
 Y25BBQvjVOFNHC1qzr45O/X938SBOiz9gAwQiE4LOAHzdj7jEXMfD6hIQwqpZDlQ14MTupaPwWU
 9BUCYuhfFZxkSK/X0XPhqkCJqCxW5d2+u26njHMt44gW5Yw1PsWlraFuesojnvniZP8l+z/etYs
 e73XHnza3K878qP0T3LKOcm6sP9u8u9vtsQuL0lwUy+0mvB8deClOMQ9nJ5I7jqSa+w/6/1+SWb
 PkcvIDuOoule2MYTyjlMtvi/u8QHtm4rD+PyUFRzl6BH6E330R9vfEWvVort7LJgaRcOfucNEod
 inRH5GdoE8qBtgfNW+A==
X-Proofpoint-GUID: AOnX7wl4Nsm2R3wZJOGw_5Z1oFaU66jB
X-Authority-Analysis: v=2.4 cv=YsQChoYX c=1 sm=1 tr=0 ts=69ccbcb7 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=EUspDBNiAAAA:8 a=gTLHQjeEnPAAWBE9dSMA:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22 a=xwnAI6pc5liRhupp6brZ:22
X-Proofpoint-ORIG-GUID: AOnX7wl4Nsm2R3wZJOGw_5Z1oFaU66jB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1011 impostorscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010056

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

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Qiang Yu (4):
      dt-bindings: clock: qcom,sm8550-tcsr: Add QREF regulator supplies for glymur
      clk: qcom: Add generic clkref_en support
      clk: qcom: tcsrcc-glymur: Migrate tcsr_pcie_N_clkref_en to clk_ref common helper
      arm64: dts: qcom: glymur: Add QREF regulator supplies to TCSR

 .../bindings/clock/qcom,sm8550-tcsr.yaml           |  26 +-
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |  19 ++
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-ref.c                         | 202 ++++++++++++
 drivers/clk/qcom/tcsrcc-glymur.c                   | 340 ++++++---------------
 include/linux/clk/qcom.h                           |  69 +++++
 6 files changed, 409 insertions(+), 248 deletions(-)
---
base-commit: 36ece9697e89016181e5ae87510e40fb31d86f2b
change-id: 20260331-qref_vote-3f38b46d5847

Best regards,
-- 
Qiang Yu <qiang.yu@oss.qualcomm.com>

