Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D5231690E
	for <linux-clk@vger.kernel.org>; Wed,  7 Jan 2026 09:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767779008; cv=none; b=KsaaqW7SbuN5jxnr1vbZV7cHZE3Ouj3WFz2nqBO2Uc6xbfw4BifSO+YJmkjh/u5F5jqAN5T1d5QvWaJc5j/GNNZTIxSe7xpDR2ehOAJez0zw/98+lhvbAtK5uyNIJj0wyuLp8DZGvGOwcQcLZTdBOlFk4DBNMqKay1/tHNJCoyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767779008; c=relaxed/simple;
	bh=coDXjf0PxQnV7qdSfM1xAyiHQJbdRPteYaZAy29zZPs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fp6qKjmtuS4t3aH23Vj5JAoLZgRVSTW+zf/DVm6HF+20R2NtpdwZ0G/m9oQwOB7ohxHW1XC+Z43RGOp0VHR5N2L+aU6AeLWahlUmzi2eTHFbVeL7ScUPRegcaZmd2FQ2fgBUR+u6T6eIh7j1w+PXrt38bvXPpnde1eoyBXtdfR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bVBEMGcw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fJiXeo+G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bVBEMGcw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fJiXeo+G"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6078ZN0Q1979616
	for <linux-clk@vger.kernel.org>; Wed, 7 Jan 2026 09:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l6RdcxF0KkuoMThTWV/0U3
	PjiCm3+6V4PEqv1V5VmIM=; b=bVBEMGcww4Vw7b/c9KYdn7pvMqA4Tcdx8irdqG
	mzf1riG3iQ0XlX0ZlwbBzRBQM7ZrRUGp5n+13S86FKN2q4QS6sxTVHuWZUWGAO9r
	9lEUlf5IudA8uVWFSYsUqhbHR2Zy2C51c5PSxb4HwYmQa8jPilcy0SLsFQkVcLno
	xkfkYz49ekF8qo+LXA8+CCBTOJYVuHSm8DyxvtLIanHO5nL8IDBT/3G3jVOfl+gl
	B/VA5iUTeSH/9HhgkVAzuXSNGvotvF+d3QL1ExXYu/aj9g4z8NHQJs4axaeGG4Zq
	HU/SQvdHqdIqfhVlp2FoXgU20BGKsGRcUlDK5IWxxkZH9VGA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhdavhhaf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 09:43:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34abd303b4aso4282632a91.1
        for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 01:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767779004; x=1768383804; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l6RdcxF0KkuoMThTWV/0U3PjiCm3+6V4PEqv1V5VmIM=;
        b=fJiXeo+GteH0mFt501Nnd2+lYjAAuJaWrPs0Nt9+SdRJiIqPqGiA/qWkCJl9PP3nvY
         2Ljr3fSI5z77sofZGMiyCYOfjLekGJAGhiqGfJLFmJ6IMkBOev7vrCZ1k2yZh7ACQwCe
         FaEGxB7e6oJwOLGiRm1W3ak9245ql4FoQSZwPBBC6RUahkLwbIcAeRwrZS+wDyXmsSbO
         o9RWHl04oXzXZJ+jQqRr2Zb+OuL1Aa25H/SEQNvv9W9UF/0URjpQFaCHmzaUnDIxM/Fl
         Xv8L00EeiUM81U32G8TqOF8pMA/bWcZqumYRc5c+c+E6cCdRpXCcs9hxsBCy1A27Gtsc
         BNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767779004; x=1768383804;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6RdcxF0KkuoMThTWV/0U3PjiCm3+6V4PEqv1V5VmIM=;
        b=hrX0Zcl/UDgbgvAmBIFXEQyziY5K8sSiJPURh5alHoPKGoNivZ5mTla+AM1oXgPRLj
         ZBTGTMcR906rBz4zutrCpJcyAeptaagAv8MHHGPSsdOC3pLVVpppl8Emek6OZfsQwlRP
         Ob0LEmwleOykmRFC2MK1sDJTaIUjDMpL74s58NC5w8s+MDvjy/urldSGW9h15X9EAUl/
         hOATXKjxSyDkdu51JfmYc8XsAB72dSm6gDNYLQpMBQRUsv15SuQAR6lOj4wa4dDvdYzT
         9aNAZgN+flBK35QajLI+/KLAQCDP+jUI0Bq5NwcPDpAIuDRSQoZiU/BtQPbFd3w+qMTb
         srdA==
X-Forwarded-Encrypted: i=1; AJvYcCWiWL3fzpKe48iZbpo0vrcIHWxaAalpMt973VEPfoFeWZGNCmEDCQnF5aEd6PP2t0D7h9vb0EAlDrg=@vger.kernel.org
X-Gm-Message-State: AOJu0YymvHwCfsMYR8xr4bVmJwYbVq8T4cluNgjVHOiTckmgX29JiyHH
	KGvX0Ra81cb2LBQ2vIZscKZCDOX88oy5vnAy6IGEoPBwC1PGlg6NMs4W73ssHfUqsQlvMXmuoxq
	ZOYlNIoYI2Blih7HmRVr9BtbzqAD+UGy3SWSF5iX7JZFgPHbWP3jelZsy5ZSXLhs=
X-Gm-Gg: AY/fxX5vhcyfwFHNTeSbkzbf+/VnSffnVVPkLkevOBXUAXZ7aJes4GRFNwGH037odLN
	FVfUtHXAaAqB/IJKMPlHUcOigxUo9ZerhKaQUKWQAvy61otOolrDizXBkIBJdcgRPUhVbEc5TG0
	a051MT/MpKfSdSLCwxCgHlBr+FruKIALqqWeJXwDQzqhvQsd7HDFnIin4rKg0M2O50fjNzn3Nwj
	g5tlhlBXBU/8nO5jFh87dJKPrmQ9Fo7JLW+tbscK0yNkOs+wWQ02QfEfXbW707zAuXNT16jix61
	OtoidGCpLsU48zyC0ZtdyyzgeLHuUnUaJU6qQNxqCLSMgUupRnWiJuA18PKyKHBs7QVN7UUFI8p
	uBNlj0utOI/CZTWPOmk9sJrhkq4p9i0iIxQ==
X-Received: by 2002:a17:90b:4a07:b0:339:ec9c:b275 with SMTP id 98e67ed59e1d1-34f68c308camr1992716a91.6.1767779003901;
        Wed, 07 Jan 2026 01:43:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9utHaerxlmRKQBS/EdaJNmJ7bFN1nMsGjL366kf8cZMjULjE7RzNmpNRtkBxRkq0JoaMtcg==
X-Received: by 2002:a17:90b:4a07:b0:339:ec9c:b275 with SMTP id 98e67ed59e1d1-34f68c308camr1992696a91.6.1767779003444;
        Wed, 07 Jan 2026 01:43:23 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9568sm4472944b3a.15.2026.01.07.01.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:43:23 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v3 00/11] Add support for Multimedia Clock controllers for
 Kaanapali
Date: Wed, 07 Jan 2026 15:13:03 +0530
Message-Id: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKcqXmkC/x3MMQqAMAxA0atIZgNRsaBXEYfYRg1qlRaKIN7d4
 viG/x+IElQi9MUDQZJGPX1GUxZgV/aLoLpsqKk2VFGLG7Pni3fF47AWU4NuImvIGWfmDnJ3BZn
 1/p/D+L4fuMB+e2MAAAA=
X-Change-ID: 20260105-kaanapali-mmcc-v3-db0c60d6d6f9
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA3OCBTYWx0ZWRfX3gcreHs+HZWH
 sPstdEuaqIFnraJBBssuUl0tTsmnVnu2AITWCgbHygq71IMiJD0nT9Xc1owI8GwFLt4dYjdM7C8
 FvEIMJ7DM3Qne2KUJhOnBS1sewh1hmQaMGifTmy/DuLecYcmBYV3I5ogHJNhVw31iS1TaqcrN/3
 FN2WaPJqgti08S1hpD+Xc5r0x3pwXAUNfogLqio2etw8l+I6MGihi3QHqZiOBYAhpwJXzb9064w
 A1kTz2ac/vWn5+nxqDO33QxMT/E/bIzk3wyiYY1r1ae61d7R0KZ+vDGJJS7nIQyxfFUUnXraE/Z
 CZDBl5GEHlyWvR87RyUuWGpiV2ZPLd976ulgb+D/Vl/CWhazkIxwslCf1ssUd26JQLDNJldx9Sj
 sPy1+geCs7z0WFN+iajfmVkIGvqoIDhaxjYOTrv6/fd5fRvplCyg2KWuCR3mFXFwJ3rtbNW2JXN
 HhVYZevl91i6tRKx/MQ==
X-Proofpoint-ORIG-GUID: pkCDyVDyAxTMTIyZMfB9kmJWEuyh3dL8
X-Authority-Analysis: v=2.4 cv=comWUl4i c=1 sm=1 tr=0 ts=695e2abc cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=AqjRrIuq8FlCCJD4mHwA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: pkCDyVDyAxTMTIyZMfB9kmJWEuyh3dL8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070078

Add support for Display clock controller, Video, Camera and GPU
clock controller for the Qualcomm Kaanapali SoC.

Changes in v3:
 - Add RB tag for CAMCC dt-bindings [Krzysztof]
 - Add more description, commit message for the newly added GX Clock controller
   for GPUCC dt-bindings. Update the complete region for the controller. [Krzysztof]
 - Add RB tag for display clock controller [Konrad]
 - Fix the below for the Video clock controller
	- use lowercase for mem_enable/mem_ack reg.
	- use GENMASK for mem_enable_ack_mask.
	- fix the indentation issue.
	- update to use regmap_set_bits().
 - Fix the below for gx clock controller
	- update offset for gdsc as per new mapping
	- update regmap_config as per new mapping
 - Link to v2: https://lore.kernel.org/lkml/20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com/

Changes in v2:
 - bring in the PLL related code from https://lore.kernel.org/all/20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com/
   to this series.
 - Add RB tag for DISPCC dt-bindings [Krzysztof]
 - Remove the patch 'Remove sc8280xp camcc to from sm8450 camcc' as this
   series has no functional dependency.
 - Add RB tag for VIDEOCC dt-bindings [Krzysztof , Bryan D]
 - Add RB tag for GPUCC dt-bindings [Bryan D]
 - Fix the commit log for camera cc driver and add RB tag [Byran D]
 - Add comment for using 'ACCU_CFG_MASK' in video cc driver [Bryan D]
 - Describe GXCLKCTL the newly introduced clock controller in the commit
   log [Bjorn]
 - Move the 'gx_clkctl' driver from subsys initlevel to module.
 - Link to v1: https://lore.kernel.org/lkml/20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com/

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (11):
      clk: qcom: clk-alpha-pll: Update the PLL support for cal_l
      clk: qcom: clk-alpha-pll: Add support for controlling Pongo EKO_T PLL
      clk: qcom: clk-alpha-pll: Add support for controlling Rivian PLL
      dt-bindings: clock: qcom: document Kaanapali DISPCC clock controller
      dt-bindings: clock: qcom: Add support for CAMCC for Kaanapali
      dt-bindings: clock: qcom: Add Kaanapali video clock controller
      dt-bindings: clock: qcom: document the Kaanapali GPU Clock Controller
      clk: qcom: dispcc: Add support for display clock controller Kaanapali
      clk: qcom: camcc: Add support for camera clock controller for Kaanapali
      clk: qcom: Add support for VideoCC driver for Kaanapali
      clk: qcom: Add support for GPUCC and GXCLK for Kaanapali

 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    |   63 +
 .../bindings/clock/qcom,sm8450-camcc.yaml          |    6 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    2 +
 .../bindings/clock/qcom,sm8450-videocc.yaml        |    3 +
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |    2 +
 drivers/clk/qcom/Kconfig                           |   38 +
 drivers/clk/qcom/Makefile                          |    4 +
 drivers/clk/qcom/cambistmclkcc-kaanapali.c         |  437 ++++
 drivers/clk/qcom/camcc-kaanapali.c                 | 2661 ++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c                   |   20 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |    7 +
 drivers/clk/qcom/dispcc-kaanapali.c                | 1956 ++++++++++++++
 drivers/clk/qcom/gpucc-kaanapali.c                 |  482 ++++
 drivers/clk/qcom/gxclkctl-kaanapali.c              |   76 +
 drivers/clk/qcom/videocc-kaanapali.c               |  821 ++++++
 .../clock/qcom,kaanapali-cambistmclkcc.h           |   33 +
 include/dt-bindings/clock/qcom,kaanapali-camcc.h   |  147 ++
 include/dt-bindings/clock/qcom,kaanapali-dispcc.h  |  109 +
 include/dt-bindings/clock/qcom,kaanapali-gpucc.h   |   47 +
 .../dt-bindings/clock/qcom,kaanapali-gxclkctl.h    |   13 +
 include/dt-bindings/clock/qcom,kaanapali-videocc.h |   58 +
 21 files changed, 6984 insertions(+), 1 deletion(-)
---
base-commit: f8f97927abf7c12382dddc93a144fc9df7919b77
change-id: 20260105-kaanapali-mmcc-v3-db0c60d6d6f9

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

