Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8EA3B52F1
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 09:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783933461; cv=none; b=qVT14xha+Jm7qI+A8tWZCTGVJpD70WloWY8oLEiU3td1RchFdnfMmA2atarH1q6ApsTRuvRhf5NQDV8IThf+ENbw6q8uAeGGjvrbYyAGL/slRRx3BpIxtbtuogucBOIVcVkdDBAui+jkgrbSnGsnw1mf8Iy6lLeEFoveaqZgtfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783933461; c=relaxed/simple;
	bh=9BRmdFzW8oYEC9eBqhv0oyUu5gc72FbmneAGMeEP6Ow=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sIxx+wVuoMhNCqDAglpZPB+3P1i27hv2yHVnulRRdziZlREG4ujzkm6pvJ1LI+DEqwHfqhGqGWEgOw8Z87dfTOIp1JyStTY6ye7jFIGyOWsqlR+qlFFWH/cWJNYSofyZBPMPBBbIGQ3ZMPWhs8wbc3ysjkxRLRboh1J4jYuV7dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X8YwEQk7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dDOHevKa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X8YwEQk7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dDOHevKa"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NkQA668628
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 09:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4ECQjdaHnTc+TTRzlxH3WM
	4pEczV6dL3FXSVILHJzk0=; b=X8YwEQk7XcVpYrn07QBbKRKs+J2f3oHL1FM1JL
	b0wp6eQQSI8JA0hmZMG+BIO04Yb3VMjrEQBN/DCZTqinluj5obKfr2Y+i0jdaKSJ
	84vfCNAqyuTkTiRWrvQFYEg0djOhUsdtrw6r2GoDPYIoE39TE37CB6SoS7xyUVS9
	huUAdazIR8yzEZFu40OvioBdToAaetst0FK1Eq69KwIiYUQkRM6Y218RF1AfFA5H
	HBx+BsSob3yyAIgnex08AszjSb4XElr5QMT33KF/R/9ofDX3B7jJKTbHYW0AQNvJ
	VLudjzf4NQn42sDeJuRFn3FNvOa3m6eKjBF+Qr3Ex2ik2c2A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm1sm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 09:04:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dad28e86eso4452177a91.0
        for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 02:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783933459; x=1784538259; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4ECQjdaHnTc+TTRzlxH3WM4pEczV6dL3FXSVILHJzk0=;
        b=dDOHevKaKfQBhLacn5yjsJTUR9/XeCc+gCX8LFKQ3wEXIL/rPyHlqSOhhHedBqUa5W
         JzZRiZZfRDWy5wQ9zKny2jUQAThjgVm1ZCg5m4Ji+6XK1jXf9dWu8vxoeE09yHaYa/Gs
         o3LzKgfufUQdq5EG2FLpUlxCY7FF7fc4M9bfKfrWLZFtZwJc1tBc8QG+koBE865ZbgaO
         OLpA2DW0AMadD1ztLh8nLJRHUf2eoDCCgzeWKdAgJtlGN0r0LIJU430H72ud0EPl3jyg
         K6kU052cy4tT78UWkw3jI4spGNspMgxBJSXQvr5+iJHBajkZsD5jCG+VCtH8syNmmIRZ
         Urpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783933459; x=1784538259;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4ECQjdaHnTc+TTRzlxH3WM4pEczV6dL3FXSVILHJzk0=;
        b=pYu+FUwNEgTZYho2qXWoweyMrdGf9NXRjoYvrT4oE/R9ZiLMrgOVIRriL3OLyoqziI
         HHogB9vcpjSl07fk5Lb+aLUfo/32KzXVPnaYfmp29U5axwjtnHNPKMo9zExsvOZBF80g
         hlSP5/Y+YVjJbzvTFVqsPhgzsZp4ByO86Nw8+l+u6TIgvjdEzclpwTK3VXZGaFh14RfX
         A9cQLZDaC+uEh8rvOuxix3em4mfAuGd9KvDIvyu/1ba3X7n60R6Su738K/z54se3X4G9
         hhce8mUzmUOhxfyKfNseHCLKbkmezM3SEtAAPDsnwLqTfNXdrlxs6RLy9RzHCNImeFFx
         3X3g==
X-Forwarded-Encrypted: i=1; AHgh+RoYOUYvJ8KxI9jVGulnJlO5YHz2zCRlOwb7VXLqHCkhl7csx/2Y+RGPqu/OGqnSh/HmR+8Ba4QVtK4=@vger.kernel.org
X-Gm-Message-State: AOJu0YysPXNi9kujmyjhPydqW6M7crffPVZ1ObDORPf10N6nyxVFj2Fe
	WkQYaRj+DWDUNSwS4y+J23FjfGVzWbvoNin8gyJ+z2ulApd7hf6747KgEO3SSG4Vs+WdgoMXn4t
	WjXKfJhGtjLGVbOK+GKgIBWX1kzZDx9azfSPcm8IXQK9yHqZAvAoNOzZXjxqr/GSkRZL6v/0=
X-Gm-Gg: AfdE7clcnfIEn/Rs2sWKZ+Ok0A7zqDVNj0c/4uTHkrkiH4ZyhuaixH6/u/4sXLRD4fJ
	OFqdULTq5EMoXxLHZyMI5MaAoHhDOw7Qs45gfuld48KLuaabyjrThlZbxXuqFp2wT2swnTaupcD
	rELrJzch/JlWit6WtlAA6H1WloQqImtWI/BQCvul8VBTOnLRN+tQIgy8xVARWod5R7HePnbL9Rt
	8KtmiK0cY7JiWVC3/NrDfJcKGjXpvXU2IKGgAIgsh+eAv7lMw1b4kPYYn86x9TQllI8YJ52+v0I
	nt9rsnPPDp6T8GULul713QWYwxnabk+pe4eQKJKKJNda5RxaTWx2Gj+cqW0CC7VajEjIQ3eofme
	Nxzpxm4UybttQPRcLofCxZgdcD1LDTzbdbrw=
X-Received: by 2002:a17:90b:33c8:b0:387:e0db:3fb1 with SMTP id 98e67ed59e1d1-38dc77993c3mr7931710a91.42.1783933458983;
        Mon, 13 Jul 2026 02:04:18 -0700 (PDT)
X-Received: by 2002:a17:90b:33c8:b0:387:e0db:3fb1 with SMTP id 98e67ed59e1d1-38dc77993c3mr7931675a91.42.1783933458528;
        Mon, 13 Jul 2026 02:04:18 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3119c2a7bb5sm43504435eec.25.2026.07.13.02.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:04:18 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v2 0/5] clk: qcom: Introduce initial clock controllers for
 Maili SoC
Date: Mon, 13 Jul 2026 14:34:06 +0530
Message-Id: <20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAaqVGoC/22NywrCMBREf6XctSlJah+48j+klJhc7cU00aQGp
 fTfjQV3bgbOwJxZIGIgjHAoFgiYKJJ3GeSuAD0qd0VGJjNILhveiJZNiiwN5GgmZQdtvb4x3aI
 87+uKm45DXt4DXui1WU995pHi7MN7O0ni2/583V9fEowz06BBXtVSiOroYywfT2W1n6YyB/Tru
 n4A95k1uL0AAAA=
X-Change-ID: 20260617-maili_initial_clock-c7e2b4530d80
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: iE_woXxi7evg00TgoepZQ6Wke8XXVB7t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5NCBTYWx0ZWRfX5MzMO7xB2tQf
 LG1KHxt7DNNuGA7GXrNWEkfnbPo+FM5ipTVpcd0LfRH66I2M11bCdpxGz1wGC+JmeSgBQllEwr8
 p4Q8tjYZgWR0QOGw2yiaOMV/H6mZOuLcsDwQuYOJe8D5bSOMGmnELQ6wuFvxGeqzpBY3xz82c+y
 //aL0g9do+4tl1AwWQNN9U5Z5pERY5UC0BgSs5LzGxvGYEkiRN8uQLwp6qbFfhbNLZqDXN6dop7
 8xxM45q7NZkxW2kGLFSbn5BDb4Oy1WnDsOS2Wg0j6cUGjXZJH3nUiUS7PHt4Fmf0ieMdcGRc/IA
 yqIWdZAQ26XUtFKYpCuaY+HmIoqwCCVACkcq9CKzs0smru8zychUpgst3XK0QGOw2Pc69Ge5GDG
 Yn2d5lTZxhDtQlMGJOX6RdV7pTJMdcI9EMTTrkhEPmKxBcFFRxTRvRJ6L7wuDHDwUeDVYdMLpee
 eueXZb/CE3YfRwu7HMQ==
X-Proofpoint-GUID: iE_woXxi7evg00TgoepZQ6Wke8XXVB7t
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a54aa13 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Kp3T8kGXBi3sce7iFlAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5NCBTYWx0ZWRfX2IfxfyVnwfiu
 RZ5CnvjOtXAt+cGJtYtdz+vP0hZRbxZ7sxlXsPFAf8V0d7aI6VsD/WCsyMv2d82wqBVLILdWWxu
 b9jXMbU8DG/xVan2iqQXOxEHCgKubGA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130094

Introduce the initial set of clock controller bindings and driver
support for the upcoming Qualcomm Maili SoC.

Maili is a new mobile SoC from Qualcomm. It is a derivative of the
Hawi SoC and shares most of its clock topology. Where the hardware is
identical, Maili reuses the existing Hawi drivers via fallback
compatible strings. Where Maili diverges — specifically in the Global
Clock Controller (GCC), which carries an additional QUPv3 wrapper
(WRAP5) — the Hawi GCC driver is extended to handle both SoCs.

The series covers the following clock controllers:

  - RPMH clock controller: identical to Hawi; uses qcom,hawi-rpmh-clk
    as fallback.
  - TCSR clock controller: identical to Hawi; uses qcom,hawi-tcsrcc
    as fallback.
  - Global Clock Controller (GCC): extends the Hawi GCC driver with
    eight additional QUPV3 WRAP5 clocks present only on Maili.
  - CPUCP mailbox controller: software-compatible with X1E80100; uses
    qcom,x1e80100-cpucp-mbox as fallback.

The devicetree for Maili will be upstreamed later.

 Changes in v2:
  - Split the new Maili-only QUPv3 WRAP5 clock IDs out of
    qcom,hawi-gcc.h into a new qcom,maili-gcc.h header (which includes
    qcom,hawi-gcc.h), instead of adding them directly to the Hawi
    header. [Krzysztof]
  - Update the GCC driver to include the maili-gcc header.
  - Link to v1: https://lore.kernel.org/r/20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com

---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com

---
Taniya Das (5):
      dt-bindings: clock: qcom-rpmhcc: Add RPMH clock controller for Maili
      dt-bindings: clock: qcom: Add Maili TCSR clock controller
      dt-bindings: clock: qcom: Add Maili global clock controller
      clk: qcom: gcc-hawi: Add support for global clock controller on Maili
      dt-bindings: mailbox: qcom: Document Maili CPUCP mailbox controller

 .../devicetree/bindings/clock/qcom,hawi-gcc.yaml   |  11 +-
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |  65 ++++---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |  34 ++--
 .../bindings/mailbox/qcom,cpucp-mbox.yaml          |   1 +
 drivers/clk/qcom/gcc-hawi.c                        | 201 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,maili-gcc.h         |  21 +++
 6 files changed, 286 insertions(+), 47 deletions(-)
---
base-commit: 4fa3f5fabb30bf00d7475d5a33459ea83d639bf9
change-id: 20260617-maili_initial_clock-c7e2b4530d80

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

