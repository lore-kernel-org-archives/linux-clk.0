Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE201A23AF
	for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 09:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753349363; cv=none; b=WGdWjYeuEOOYLFk/pt6VF8dqR9tiI/MO7US8g16CI8cHON1viBifVK/VFSDyVkUfgW8rstc/z5krdWgEICSJtNVN4ZYbvWw8e0RpbGri9KvMR9Ae3kpUsen7yJW2lgr31E7uMHvq6CUSWziWdNA8YbJ8MBJoz7oOLeqKugzfuVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753349363; c=relaxed/simple;
	bh=z4XYXGxfPBsun4MslFBva4KC4oRciMbcWsWJLlwAFEM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QmMQNKm7lqot9ECAj0g6mx06RBh5HY+etqBfXBBsv2ezGtBZSdOuM4RANz3D2mtbF3ZAp4+LAKboSeJqg5Hd7phTdUPFO+0FFldG1lDLT4zHFvnaZZEUmIMJDmeDIdvk8yVhfuZpMlrUdY3ASE8QhfJBBqNqkxs3oIJflePFkjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Czh6Jv/K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Czh6Jv/K"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NMXH2H028529
	for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 09:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=msStpiEk7pn9fF+TG6lMtb
	YY75N7MqJpIFNps/f3590=; b=Czh6Jv/KBXQZmcZ5s7pBUYdBEcZJi2Us98frrq
	YVr5Jsw3q7SdEK/e2scxXs1zCAyLQdRXtiwaZeiUbc1mIERsiZfGSpHoZ1+DnaVH
	NYyL84LFh/yiCSl+FxrW3KLzDMSgR0qUD5HPGiQHj4Z+1PWJT4arDMs81/AIv8Ab
	om+RagJTOmc0VCB6CJfAM1SnIlFUQs9sJNR82l8PCvaSWHcIy+cu2xHKzCyUp+nx
	qVtulTgits747x3RcanCC2NpnqSr1ry+zc/cD5N5IGv2Vu6+u2bHgDzoohgSJC++
	WfM1V2atqaDKp/JDVyUObd+C1w/sIVNdqgzHclCUCO0FlAQA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t1fh5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 09:29:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2349498f00eso17822375ad.0
        for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 02:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349359; x=1753954159;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=msStpiEk7pn9fF+TG6lMtbYY75N7MqJpIFNps/f3590=;
        b=C3PVprSqiVYg4ukzFbaZSVKG1RnQODYug7vsTbhWT2uATcjapbbVFE2yyZwFiWGQCz
         PukHxAcT/+aAKDg5/hYROp7kC+Maxs74Jn5zjpSpX/8l6zwh2i9neKLcOGz+lV56lLMD
         hlxMbrUnXdybOzl8ELbR9SJOKNgzURnu1m7drzBKtwZuvP5LKZ0yDa/b2z4Jr5hlIzrw
         48/8OVaF6LCwhEe27IGf2f7Bcw8W7mXq5u97Q2FryGX2RLX97bfbksBCILy9bN1XpF1r
         Pvevcmzm8my658tvua5bAsrwMiw7tEoXaVEitaRF3d97BbNi/7HD8F1an2suaY/MVbrC
         whtA==
X-Forwarded-Encrypted: i=1; AJvYcCWsix+ZcS/RZQuqWCkHbHA2GwfP+CPQrUqnxUvlhcX5KcZ9BZ2ItS5D12PYEVyssLlVrVEap78vT+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp3wdiRuJabEBIj/t31Egnu8sDLRy2eoNXocQtRzO0+98rAEAP
	NqPsSn0bscvtYsIRYVT80lOVAcMxA2yMpBMzXVOUft5OvbW7QwBT+wVNreDSlco1HCWgAgTyLp/
	NpLXbogJwBgf98fb0Hzu1/9OlNI/bo/ySldj8DfzEuDc2htBVqX5SdcNz5CG4uDZiCyUppc4=
X-Gm-Gg: ASbGnctPDi0FrEHutBRFphPvmUWRAjZPLPnlG2EBSiTGnc0p+bGtHHNveTLMHOGFY6Y
	gunAA40YGxwsEnazHS5vLBSm5VKno2+C4vKTElpHg3bL9mFRKO6yNJoAuy/1HL2zOPqZ4TVHYlY
	oLZPeA8UfdE94PXGEz0ffnFvqYSGsRiVq7tvkVu7fkZ/06viu7TgEOjRe1NquaznsTJEaunfM4v
	/YU1Kf626jdw4R30NS5VuMyda4pmOi++z0NU6op2hFOs09fMMtrFh1vyOzckFIaN8k24/mpbx8t
	Q9NRM2FmgxlkjpfSoIHBQHJIWPrleM7TXDEc7N/CYHh2VgrZf2cVBYqbl3Ai6NUp
X-Received: by 2002:a17:902:e84a:b0:234:986c:66cf with SMTP id d9443c01a7336-23fa5d33199mr20503565ad.16.1753349359064;
        Thu, 24 Jul 2025 02:29:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHprT8jlcs812l9EWL69WuM6Bat9XcczDUKk8DFEqsO2Jwgflpk1e3HkcrmWIK2ErGLOwPA0g==
X-Received: by 2002:a17:902:e84a:b0:234:986c:66cf with SMTP id d9443c01a7336-23fa5d33199mr20503125ad.16.1753349358638;
        Thu, 24 Jul 2025 02:29:18 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa475f8a0sm11276505ad.24.2025.07.24.02.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 02:29:18 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v2 0/7] Add support for Clock controllers for Glymur
Date: Thu, 24 Jul 2025 14:59:08 +0530
Message-Id: <20250724-glymur_clock_controllers-v2-0-ab95c07002b4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOT8gWgC/x3M0QqDMAxA0V+RPK/QBiWwXxGRETMX1rUjnaKI/
 27Z43m494AiplLg3hxgsmrRnCrw1gC/HmkWp1M1oMfOE7ZujvtnsZFj5vfIOf0sxyhWHKEPIbT
 EHRHU/Gvy1O2/7ofzvADMqGmuagAAAA==
X-Change-ID: 20250724-glymur_clock_controllers-72011147c577
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: HA89LKvfMz7wZ8aRAWhWYnQqEXxSGE3g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA2OCBTYWx0ZWRfX8OcphgxdEN7L
 X0G2kjvksc+8HTMY/aQ9/bOu+s/MXe9rDYhpIE8uRxPut7I9dbsKULUPRQ4K3InqjPDYgPj4uvH
 /QOz0qn12A2mCNrdpKmK0LNgdt8s5Dri7aiJczdN+OKIR3ixCVQ9RlnmIbYQIXwsZJ/SKW0cuf8
 LaMx5vA5QFNNOShbb1y6VX2/oU0n05B4ExqFjUc4mXvdA0I3Lnmjp5VYbwXLk08Gqvz/K5fj3wj
 kD/V5mM3bK2NE27NGb/xL4+Ev+N6qyTJXibm18GWzlkdJfaD1B7XGNVy2AGm4fO528mESIDc4/R
 ESP9KDi12kcjkGGXFHCbB+7hsKC3G96fa6W+SG2UJsJGTFI7svs8tbEUU/4AhK+hsWdH/qTvZ/F
 6ViCugk66rphlCCvPcF0PUuTNaQQch6EbGKGEo3adLeKT3Ypgj2CwVhnUie8K7fKFvuwEKfD
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=6881fcf0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=qUAPAiL5QJq3HUhlMeYA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: HA89LKvfMz7wZ8aRAWhWYnQqEXxSGE3g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240068

Glymur is the next gen compute SoC.

Add support for Global clock controller(GCC), TCSR and the RPMH clock
controller for the Qualcomm Glymur SoC.

Changes in v2:
- Drop second/last, redundant "bindings" in TCSR and also align the
  filename [Krzysztof]
- Update the year to the copyright [Krzysztof]
- Align to the new Kconfig name CLK_GLYMUR_GCC/TCSR [Abel, Bjorn]
- Use qcom_cc_probe() for tcsrcc [Dmitry]
- Add RB tag from [Dmitry] to patch #5
- Link to v-1: https://lore.kernel.org/r/20250714-glymur-gcc-tcsrcc-rpmhcc-v1-0-7617eb7e44d8@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (7):
      dt-bindings: clock: qcom-rpmhcc: Add support for Glymur SoCs
      dt-bindings: clock: qcom: Document the Glymur TCSR Clock Controller
      clk: qcom: Add TCSR clock driver for Glymur
      clk: qcom: rpmh: Add support for Glymur rpmh clocks
      clk: qcom: clk-alpha-pll: Add support for Taycan EKO_T PLL
      dt-bindings: clock: qcom: document the Glymur Global Clock Controller
      clk: qcom: gcc: Add support for Global Clock Controller

 .../devicetree/bindings/clock/qcom,glymur-gcc.yaml |  122 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    3 +
 drivers/clk/qcom/Kconfig                           |   17 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/clk-alpha-pll.h                   |    6 +
 drivers/clk/qcom/clk-rpmh.c                        |   22 +
 drivers/clk/qcom/gcc-glymur.c                      | 8623 ++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-glymur.c                   |  257 +
 include/dt-bindings/clock/qcom,glymur-gcc.h        |  578 ++
 include/dt-bindings/clock/qcom,glymur-tcsr.h       |   24 +
 11 files changed, 9655 insertions(+)
---
base-commit: 9ee814bd78e315e4551223ca7548dd3f6bdcf1ae
change-id: 20250724-glymur_clock_controllers-72011147c577

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

