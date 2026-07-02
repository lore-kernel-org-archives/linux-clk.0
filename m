Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDA0358369
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 18:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017177; cv=none; b=FrAJxOfRGNx9Z3DrudFQRGd6weRLQ5HyRgb1g459lSLewuu8s9W6FMrxb7pdi73eVgKdiTdzy7eYNUWdC0nOcl9QWAAlLtw3Mihc8Os7l5cp0T35bevlCFYa3KntJ2BXXc1fTLmZFndCixED1fOUyB/R6c52wwxl4G5+vc+FdIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017177; c=relaxed/simple;
	bh=vxhflPrOdaYGoxTfLfbwwZ5FG49sYTimGVlqDhNCwuE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lbU30iLxp8auOOVWcfocOQPiFpD3KXz7on2V2pUTomrCw2opO2hvzY0cm8hPaj6Iet1Z0e0Wc5VcYuZwPqohe3LHoKxKgSZ0DIkf3eoaDlJxi0Z5Hl5jXQY/IVkO56vPQayVjsVfV6+RsnVtHe2DZyfBLE8y9Ga3LReFgaj8Km0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CrNe5eLd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hGIQd1d1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CrNe5eLd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hGIQd1d1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3gWa560655
	for <linux-clk@vger.kernel.org>; Thu, 2 Jul 2026 18:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VjOJXFQkKwF8skj3FkQ1tb
	bCkRos2qZQgHhQ/j0wxY8=; b=CrNe5eLdF9W4IjUKW7IivgvnJjAebPAE3iUUA1
	NsM0KOdSug77f5tPvjlXJ9wUiMLXde270TWprRK6GKeLYyDBL4yINbg30cbSFj4U
	2B53ZhV8chHWl/H8xjEgWxJ2QRq6iydh1IyvWxOSjKXKTB3i/FvesMZxY9NQVDuT
	6iCX4eM3DFrLzLky100Wt4frkwmeQm1bVbV4HFRpbFuJvaI5I31CSUXQ7Nd5qjuM
	EsVN/LOFqWysrreS9ox6s2R6HOWCYVoOhi6zYp4TOJ/NNH+cdHZVPhws970FdGJM
	lcMt6ALQG2nQXgi8EyWw70/p6qGiwgFHFyXPWNHTHLOneUqA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n9bjbgt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 18:32:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9c26587e67so1232551a12.0
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 11:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017172; x=1783621972; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VjOJXFQkKwF8skj3FkQ1tbbCkRos2qZQgHhQ/j0wxY8=;
        b=hGIQd1d1+oA53aA0uaV4Jgr7tXh3EmLkfNXfy7tomh0wSzUgCKz1eag7Gt4WIQD2jf
         CPNrER+Qw3Sj6cvJ0wL6q264wwr3ODyklMXB5ClF3X3yvRcluLJBwB4ZCGvcQaoXI9E8
         XIxjw0Q9d/1jUn/tOuT1T4ex/LUeYSyd052h2YAVb8/QfIoV1iC5Nbc/hmB8fjkUQAiw
         15k31dmttoWnUQjlSw2Yvh6gNueAh3zP21d5cspiNwozLa8MAHFs2wi7iVtGSaEaJ/pj
         B9aeT8s9Ys9EKWIy4cIHBNd/L+axZFwdmayWVdp+TCVD2+OD0bkzZihRwhHRFKKM07iI
         jncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017172; x=1783621972;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjOJXFQkKwF8skj3FkQ1tbbCkRos2qZQgHhQ/j0wxY8=;
        b=Wf0TDm1ke34eFvyoJu9riqjU5HcWWOAlGTT2vlbQIDEgOoHuYBMzVL/If9oBTUR67r
         Lgxa9u+SaNkH9rEBeu8PT4LMbYRX8pYspCxCz9dIhxrW7+hr+cg78uGDLTgLNvDwIqh9
         3g8AFG1pnXfLXWUQQ0Zu1Vda3CFhAG7i+1rPned8t1NKXI99NB+M78oz01Lfx7Us4FJ2
         3OVBmhSKaAOPounzaNOzMQF06wJA6f67UDr2o9A7CXJp1358kStbCR53fh4mxHEmZOjL
         08HNUq/zsgYpIBNkKff9FwXPEfIB3rrKQNVTbqqEWK84HjdOOYIk3JPrDOXQd4Q/E5et
         /Eyw==
X-Forwarded-Encrypted: i=1; AFNElJ9mJnuxCBYkPoSt5j/zLFdhL6Pygcxs68WvRvz9xpH5YcfCsKcVhRxL0MvT1xa8oDASGUtq21dkpB8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcWw/BY5XGNub5wHJtB/AlnB8c5gV0xmFMu5XIyXthNFFECVEO
	L+NJV5lIk8wrqpTiFTWn7sr/bmDNAp3N1Ps8IjqonOPJlWE9ZD0dZMz0ldwVDWbVaLg+5OJJxhN
	wSxkgJJXTH0eCWNudQ+/sauorFo9z6qzaMPA0UsSJE8PpLCkI0E2kdejEAj8engk=
X-Gm-Gg: AfdE7cmTI8M3p0Xd7vsVC+q1Ip0uT5zQIP8dmQRi7rINFRwW4cxQFUzGJX1L9HOe7iK
	ochnKrsNLNPbkLtqUpCuIgI5oq0ufxS+tZYaqBPNMreipWVhKK2ZObi8w1M2hpa3/l7hfjz4VuX
	JBlnvTc7zb2+wvmtcZESVZW4QcMx3f4x5+ZpGHiL4oyLVaPh/naWvP8fvxlA05AW2tNEZmzHMd7
	qE+S2lyWz5hyE24y4NB9V2+Fmq0IBhQ8f74U7X5GL4Jl6s9w7boa8ft90HqI4PQIqhz2G5jGn5d
	U1Cxycx7z5xkugjLTbXKa6qs//PJG1oepivpleEMbpahdu8Z5n+bFDLG9JsJUt5ymy31QBfKQp2
	9hr2xi29//de0mKl5+4w+PCDTFetotm4rTJyn3WYuQQ==
X-Received: by 2002:a05:6a21:7a9b:b0:3b4:731e:6fad with SMTP id adf61e73a8af0-3c01c6d75c9mr1034217637.16.1783017172234;
        Thu, 02 Jul 2026 11:32:52 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a9b:b0:3b4:731e:6fad with SMTP id adf61e73a8af0-3c01c6d75c9mr1034174637.16.1783017171721;
        Thu, 02 Jul 2026 11:32:51 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:32:51 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH v5 00/19] clk: qcom: Add DISPCC and GPUCC support for the
 Qualcomm Shikra SoC
Date: Fri, 03 Jul 2026 00:01:22 +0530
Message-Id: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH6uRmoC/33Qy2rDMBAF0F8xWldhJI1ky6v8R+nCeiUiDzuSY
 1pC/r2KQ5tQnG4ujOAeDXMh2afoM2mrC0l+ijn2xzLIt4rYbXfceBpdmQkHrkAyQfM27lJHXcy
 DtXQznEuqILXlAjgESUpzSD7Ez1l9/7jPyZ/OBR/vjw+7rWYZuf6RNwVMw6Gk3e8y5aDRuxCCM
 NBOM/+3LBn7XWukrpZO1yhRoWondSuYLntq+8Mhjm2FAZFpBV5p5kRtmwYctxYAnQdljDTKOOm
 R3Dbfxjz26Ws+z8Tm1f+9xMQoUBmcqgVD1Rm+7nNenc7d/vb9qsTMTvyJ4s0yxQulpQi8QBCMe
 UGJB6WALVOiUIpZZjpRC+mbFxQ+U7hMYaEaDhgYcC0YW6Cu1+s3iF7A41gCAAA=
X-Change-ID: 20260513-shikra-dispcc-gpucc-6f59c23020f5
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: xHKlpnLXS3pa4NBVZ6GPCTKY4XaOSomy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX1TX2u2IpSNDx
 ccn1drPMcWEQP5ERPgfaMpVL9yPsEBlwKZ/CpHqq6aaNKyP74j0s7aob0s/Jn40sRHWGErV+0p2
 uB2ef+alRRWu+jzAGgAAMsYPQCELAeI=
X-Proofpoint-GUID: xHKlpnLXS3pa4NBVZ6GPCTKY4XaOSomy
X-Authority-Analysis: v=2.4 cv=bOom5v+Z c=1 sm=1 tr=0 ts=6a46aed5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3CZ3qO44dVgf1hZb4ZMA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX5z0vyZrPYbEu
 4RAnQffhLx6Xuja+qaazhIf07tIqcP0LXEkhfpBd9O5+D24aUS1f4US1Po9KkxNjtTZVJqh7R7T
 BU/2moojEILbdY8CSFX5jMUR7CKs0Q7Itj07NxWuOzIFF7F8EXuQlu1NXyN+JqyTruDYk0BJYEB
 24UBxsgH2woXS9faprYjSScjp2fH81rpSkMgh9IPV9ZoLR/+GBFuRiL3Eo8Mjeir3vi24+EplZ6
 qYiHDzb177Vt5yBDgQreodRJeXtFTNmaDK8voaxa6DUCLTdfs3va1EJ7X7sUNbxCSIZPJi7uWUV
 uM9mbr93KP3fIQ5hYWDL6EclrHGbreZzvzGCOX743oEp+ZYTFzaGQ5bZQDiYUydFZCKQoZR0Udr
 n5VFb6FYR9XRHC1M0IzPOacsajs2Unn7cId2g2I7FRg2IAvwhLuDh1STlVQ5adTwspj7U1jNc4s
 zUbMQawlei/LKjtfV5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020195

This series adds support for the Display clock controller (DISPCC) and
GPU Clock Controller (GPUCC) on Qualcomm Shikra SoC, by reusing the
respective QCM2290 SoC drivers.

This series extends the QCM2290 DISPCC bindings by adding support for the
DSI1 PHY and sleep clock inputs, as well as the CX power rail. The Agatti
device tree is updated accordingly to comply with the revised bindings.
As a result, the existing DISPCC binding and corresponding DT ABI are
changed, making this an ABI-breaking update.

Shikra GCC series link:
- https://lore.kernel.org/all/20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com/

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Changes in v5:
- Collected all Reviewed-by tags received on v4.
- Updated the commit text of the bindings patches [Krzysztof]
- Converted only the critical GCC clocks to the latest clk_cbcr convention
- Reorganize the series into logically independent patches [Krzysztof/Dmitry]
- Added CX power domain support for DISPCC [Konrad]
- Dropped DSI1 PHY clock input support from the driver, as these clocks
  are not referenced by any frequency table.
- Link to v4: https://lore.kernel.org/r/20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com

Changes in v4:
- Included new patch for Shikra DISPCC/GPUCC DT node support
- Link to v3: https://lore.kernel.org/r/20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com

Changes in v3:
- Updated the QCM2290 GCC patch to use the .clk_cbcr convention
- Extended the QCM2290 GPUCC bindings to add DSI1 PHY and Sleep clocks
- Separated the patches as per the review comments in v2 series
- Added Agatti DISPCC DT node changes as per the latest bindings changes
- Link to v2: https://lore.kernel.org/r/20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com

Changes in v2:
- Dropped QCM2290 GCC critical clocks modelling to kept them ON from probe.
- Updated the QCM2290 DISPCC/GPUCC bindings to align for Shikra drivers reuse.
- Reused the QCM2290 DISPCC driver for Shikra without modernizing
  (keeping the clock-names approach) for now to avoid potential bindings ABI breakage.
- Modernized QCM2290 GPUCC driver to use commmon qcom_cc_probe() model
  and reuse for Shikra. 
- Link to v1: https://lore.kernel.org/r/20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com

---
Imran Shaik (19):
      clk: qcom: gcc-qcm2290: Keep the critical clocks always-on from probe
      dt-bindings: clock: qcom,qcm2290-dispcc: Add DSI1 PHY and sleep clocks
      dt-bindings: clock: qcom,qcm2290-dispcc: Add missing power-domains property
      dt-bindings: clock: qcom: Add Qualcomm Shikra Display clock controller
      dt-bindings: clock: qcom: Add Qualcomm Shikra GPU clock controller
      clk: qcom: dispcc-qcm2290: Move to the latest common qcom_cc_probe() model
      clk: qcom: dispcc-qcm2290: Switch to DT index based clk lookup
      clk: qcom: dispcc-qcm2290: Set HW_CTRL_TRIGGER flag for GDSC
      clk: qcom: qcm2290: Set POLL_CFG_GDSCR flag for DISPCC and GPUCC GDSCs
      clk: qcom: qcm2290: Add RETAIN_FF_ENABLE flag for DISPCC and GPUCC GDSCs
      clk: qcom: qcm2290: Update DISPCC and GPUCC GDSC *wait_val values
      clk: qcom: gpucc-qcm2290: Drop pm_clk handling
      clk: qcom: gpucc-qcm2290: Move to the latest common qcom_cc_probe() model
      clk: qcom: gpucc-qcm2290: Keep the critical clocks always-on from probe
      clk: qcom: gpucc-qcm2290: Park RCG's clk source at XO during disable
      clk: qcom: Add support for Qualcomm GPU Clock Controller on Shikra
      arm64: dts: qcom: agatti: Add DSI1 PHY and sleep clocks to DISPCC node
      arm64: dts: qcom: agatti: Add missing CX power domain to DISPCC
      arm64: dts: qcom: shikra: Add support for DISPCC/GPUCC nodes

 .../bindings/clock/qcom,qcm2290-dispcc.yaml        |  35 ++++++-
 .../bindings/clock/qcom,qcm2290-gpucc.yaml         |   4 +-
 arch/arm64/boot/dts/qcom/agatti.dtsi               |  11 +-
 arch/arm64/boot/dts/qcom/shikra.dtsi               |  42 ++++++++
 drivers/clk/qcom/dispcc-qcm2290.c                  |  79 ++++++++------
 drivers/clk/qcom/gcc-qcm2290.c                     | 113 +++------------------
 drivers/clk/qcom/gpucc-qcm2290.c                   | 102 ++++++++-----------
 7 files changed, 190 insertions(+), 196 deletions(-)
---
base-commit: 4f441960e691d37c880d2cc004de06bb5b6bd5e4
change-id: 20260513-shikra-dispcc-gpucc-6f59c23020f5
prerequisite-change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0:v5
prerequisite-patch-id: 59bb0a7828e41f546f734f127d81da83c0adcda9
prerequisite-patch-id: 197da6bcb15cadc47869dba88c8020987b25c335
prerequisite-patch-id: 8ec9c1eb03f052ae232ed54117abed38672c23f6
prerequisite-patch-id: 350db4f4bcdfc0fad9ed57cd5b1723f85ad44f5d
prerequisite-change-id: 20260511-shikra-dt-d75d97454646:v6
prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
prerequisite-patch-id: ac83151a889855498d36288ddd36216d451340c8
prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>

