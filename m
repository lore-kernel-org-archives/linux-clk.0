Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C52A37E309
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 07:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776670977; cv=none; b=cC0bw3MC+HC7A6+Fw2gKhwQRDQS9aSdULpFFm9nlnKA06qAivkXDyKkNzpY7VGWr6uMKRHoWTM1d8OH2oBcmU0gC+cHzXIAdnOPW9D56AvSNsJ6vtm2Tkq2Ty58mZuzAB5Ra2Z9ikRA52IsxGvGw0HlvybpJ+LJPqbjssg9gZvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776670977; c=relaxed/simple;
	bh=Gp9hl/qygyT8nufAcRH6NwgUpIKC+o6FY1Q5k14mclk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OOSOhQDAZquSxPUSmwoiwyM1M7Envbl515swugVSc2wogiDrWm3TBp65D7LL6uxE9apv/pgb6axRhP8EG4GIZ3PzqYD201TvaYS7mFjp4Y3EbLWI39sj8KsQLClrz121J++DsnAqV8qpyaJfVpRD1kBxT3sm8wWyfol4WUyOFQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cZ7ualqq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ipl1DCrz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cZ7ualqq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ipl1DCrz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K6U67o2048765
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 07:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=y9as6UYVJzlCPi2ljbc6Lf
	dgeuy7aPmwBy9AAlewefI=; b=cZ7ualqqs0b14WOrAk2RuJlLq6WxlbT+ZdHp1J
	21heqw3kgkioKqG5KqnjLf2n4XPTonMNuYFYlD8OixYk56r73SIxj/OasjY2QijV
	WD8yrxrvs2qEobS9h00oxu66+uYHTiJg8LJJ5pIGvwV9JmrcxacUidSBsTGqBLyx
	n+rqCBMXru3iZc3miUhuHs95Sudo8NsbXGE60u+/+uSx+LtrzIHsuLc3RaLd4TwY
	UFAqDl9av3miLdNB5eBYxWT+HeL6kIncykUYAZmH7NsWkobQxcdvUV9U/srh6yCL
	h567du212H50lNUDdK5LYbmlCQFiM+Jzl3rRDAtGAihQxP4Q==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm2qamqmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 07:42:55 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12c20d5d7f4so4769201c88.1
        for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 00:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776670975; x=1777275775; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y9as6UYVJzlCPi2ljbc6Lfdgeuy7aPmwBy9AAlewefI=;
        b=Ipl1DCrz8LLyH0UpZ/qN9wnvWNK7eIwn8zME4thkvlIsRsI1nwX92Pun6jBltM2RIw
         V8S2v1bK0g8MLSeht5sY5Ub+ww5VK1m+OKfLxAIAR2zD+kvZ3c332+glAoFxCpjQmG0y
         XoSEr75Kz1QtM8EPdERFktRUFmz/QySgK8GfQn/DC8fhG5GpTarch6T1BfHE/YQLsL4s
         iXGNfAH86WeTurj5mHty8o5ZHBjE4McJosEJQbKbPgvd/iXR1QEUiR9DIMn5QJblMW4q
         jELW4EGRDpMswrMwRs3eQ/sg+9uMNxEzm7VGQ7hlk3i5YeVkhS70rpLLQMD75Pawvqzi
         S25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776670975; x=1777275775;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9as6UYVJzlCPi2ljbc6Lfdgeuy7aPmwBy9AAlewefI=;
        b=K2A/Jse1Ibx+ZY+3We9qyUdeHo+4yC9JduO2NBS6eNVW0BRAZWlTvX0nsZ4vXsJZqF
         OHG25hvCqwJ4uVemF9DcRsaLRJ20eCNxF24dTGowPfGs9LLNmHS63JddI+QY9BKb3Swf
         2rG1fDBZ1DBxK1L+OgSIEp3E+2DNA+BZCbIhT24MVfGnIHWgGisqL5kIJMjLgV4lVjyn
         xG/r7OZQjGjN3pa3kmMXuxcEqkcn+yurRNQQfMCj/e0IdrVoFzdPoteJEGTswGc7TGF5
         1bpILwzOGKk6ysWCZcjD2oDTJJjCcIoOX4JBOZZ+7uep1gYh7afV42SQ2nqX0HDtoz0Q
         R1ZA==
X-Forwarded-Encrypted: i=1; AFNElJ/Vnf/E3RaRzTy6gDDM5xJAnghYLsd/sZSB62nXGcj9raI+DgC8lmyjCm+MTDUe24ShyYxlM0PbMzo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNBHRWRlx7p/ZUmkNKTDWSrl3gkvUlkLHl2dbx9xkdd8Bh7xWg
	rARzHEsMJeGoij95IG+HnEBprOtiMYSJIbxdro/KFaUVzsaw0wzp2BAj8YKFrq6Cbb4QyeHPZNd
	Z494KGvEsWRcJbr8Nt2dfkKBC34jzJQp5v8S8tHNq8PZtBhBf23TjEA3IChDcGfU=
X-Gm-Gg: AeBDiesnIrWOuOZalNrGq+HygFYY5EXRP8g/k6FJQEM9Eq18RTWn5FZwD/qtfS8yoo3
	3yZK3k8OoOkuBN7ULbKyfwlTuzUvgSoUH3WGsxZJGO21UQHnh5Z8tezuytPm4cdolwL+WvY5nmS
	9fV/ojpmN6yPPRt3oQqhduZYMPooNCED+JFHiAtLqvstCBbLh/vByFqjykTNchnSHVQyy7Ew1we
	7LMCDZGipqdDpo6MKJtqiYRS6zSaEP3BX8N6Tj7Z5UrKy/tKtGrDQqeY72IEAXriBKBzSAwwOoA
	F7En8Qm6wN0iFdqZX2zCtsqaV4ZdusQ7k0XzsuxFzv/cFfztbTaZybfTQaWpn8kaJ2nuXQ+t/15
	rTGBvp5HRctpysGa6UjhXK3ZbJVT4xzrB+k0jtURrTw+lHO6vo0HzFNKHb9QUIA3b+2hUcR9ADS
	cN2A8=
X-Received: by 2002:a05:7022:985:b0:128:d7a7:526b with SMTP id a92af1059eb24-12c73f957c5mr5685418c88.22.1776670975142;
        Mon, 20 Apr 2026 00:42:55 -0700 (PDT)
X-Received: by 2002:a05:7022:985:b0:128:d7a7:526b with SMTP id a92af1059eb24-12c73f957c5mr5685398c88.22.1776670974609;
        Mon, 20 Apr 2026 00:42:54 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a18a2bsm19866217c88.10.2026.04.20.00.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 00:42:54 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH v2 0/4] clk: qcom: Add common clkref support and migrate
 Glymur
Date: Mon, 20 Apr 2026 00:42:51 -0700
Message-Id: <20260420-vote_qref_in_tcsrcc-v2-0-589a23ae640a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPvY5WkC/x2MQQqAIBAAvxJ7TjCpqL4SIbJttRctDQnCv7d0H
 IaZFxJFpgRT9UKkzImDFzB1BXg4v5PiVRiMNr1um1HlcJO9Im2Wvb0xRUSFuulW1GgcDSDlKZq
 f/zovpXxbuNaNZQAAAA==
X-Change-ID: 20260419-vote_qref_in_tcsrcc-c015dc0c2ae8
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776670973; l=2526;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=Gp9hl/qygyT8nufAcRH6NwgUpIKC+o6FY1Q5k14mclk=;
 b=ASsH0+d130F38rzjqZx9LyYhFBlJkNSoHetHKiIix+pbijRVbsZsTnCqYikEFAu5S6U5nWsPu
 EFuTZukNSAxAlmrtx1SyCQz0kgw8cEbXHsb6Duvkre5NGmUP1GZWrjz
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: h4dpUqQVarkhLoKswTrIinkSHj6sWr0P
X-Authority-Analysis: v=2.4 cv=KdDidwYD c=1 sm=1 tr=0 ts=69e5d8ff cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=EUspDBNiAAAA:8 a=gTLHQjeEnPAAWBE9dSMA:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22 a=xwnAI6pc5liRhupp6brZ:22
X-Proofpoint-ORIG-GUID: h4dpUqQVarkhLoKswTrIinkSHj6sWr0P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA3MyBTYWx0ZWRfXzg//T7l2D/Ip
 fTAVCXLt3K/jV4V5sp5BZ+NxYsxJe7kX1pNw+NJqb79TfgmUVFwMAxbWYd/apOAQOziaweggwdL
 kJehezZ6VnnBF/v7629I5vwgBJm6YyqY8ONLRTfjhVCDWgHkGxeG0JG6xpmL9Z647lTLZNQZboI
 N4mYsxcDIgUiyXuattdj3JtnZGv38pgIdx64ceLX6b/JEcKinYQXcX5R0KjtV85KKpg9xU0IBja
 TK+GWJse/Fy80wdGhLTAgpKmHNXtEeHx1DtSEdkR4LlQlGN5p9ENB1DX7b17N3coultbHQ03J3e
 yg1aidS+C7KMnWdceF0ZI4erO4opWkGQ5Gkt6KRMJewU30ACFcsSKn4HK9gZPnnCVDORf7V9QCw
 +zz4FZcSkjSQJx6jUUZ2Nke+tlRYoHQUuVA51V+7dE7Th2IZxYi3M31xUjDZ6dfy4NlgSlfR/FO
 ICBP2wF1wKwkq6hNd8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200073

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

 .../bindings/clock/qcom,sm8550-tcsr.yaml           |  40 +++
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |  19 ++
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-ref.c                         | 202 ++++++++++++
 drivers/clk/qcom/tcsrcc-glymur.c                   | 340 ++++++---------------
 include/linux/clk/qcom.h                           |  69 +++++
 6 files changed, 424 insertions(+), 247 deletions(-)
---
base-commit: c7275b05bc428c7373d97aa2da02d3a7fa6b9f66
change-id: 20260419-vote_qref_in_tcsrcc-c015dc0c2ae8

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>

