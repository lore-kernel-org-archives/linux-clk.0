Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EB73CE4B2
	for <linux-clk@vger.kernel.org>; Tue,  2 Jun 2026 15:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780413724; cv=none; b=EAf1LmC1TA8uF6S70MOG55lp+pCC8b/pZN6sgI4lkavI3CfZ9Uwo9LRVhRp8BQXEWNu0Cg4O4u8j2QOeBmflAM7iJPVoeBkECU4/9EAH1T1ANx6ipm8/N8dLW55fpJGrZY0BJyBRpnqCBxcC7rR57+sz7b2cbEQLcmoDFmiNzUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780413724; c=relaxed/simple;
	bh=lh8FZMX2soQdqCvJUlCXyl979Qmo/LQaCjt7G5Tzax8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KQYv+wA/RttJslm1EZb6VNou81VhNhiq0ukx4LOyen3XUTNMU6IuHDD+tE4NZ0QNA6g0AR1wFxGmCrSEK8DlhwYIt79d44K3kQZMs35Q/B285yVpbYo/eaChy79SO6k0Cp88be0y5e9Rf1k0m9DUup7b6WKiFu2zdFyqe+LCvM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OK8hFhbB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AHCRHi9M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OK8hFhbB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AHCRHi9M"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652C2fTQ1316736
	for <linux-clk@vger.kernel.org>; Tue, 2 Jun 2026 15:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rula0vxp21DSEXYbt5FICL
	GmSa3GjueuuDLvkBfCxeA=; b=OK8hFhbBaTiNv1PaGBM6TcxK30wb64QPRVRHwk
	8C6+vFuMBZwa2GPPCOeuIvGH/YROzmtmK2NZSFRHTLjLlmK+3P3ZpvqjAM95tvNM
	YiHWk9QFm9o1FphvLWpekBEFFf8hwZAN+1QMRtpGDla6IeyndmyGWZILaTDm3LDq
	Oz7rcjc5/RFaOOQrFffTq2ggFx6BeSUcU8ZvG+OHOXEOYc5qKnGlUnEchVtf2mbo
	fUcHlQKGEi9000V6YQi9rHpgTn0mohXLOLHfWYB/Frdfys50/W4TlpOezhwvMoTA
	M5xVwMQ6kP4Z5CH+hU4Cb3r0zPOnlu6h00DeyFgxaldb0w4w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehs9vtb1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 02 Jun 2026 15:22:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso181635215ad.3
        for <linux-clk@vger.kernel.org>; Tue, 02 Jun 2026 08:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780413722; x=1781018522; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rula0vxp21DSEXYbt5FICLGmSa3GjueuuDLvkBfCxeA=;
        b=AHCRHi9MbRZEU9Eehx5BQ3tRHFlurQRtbkmJUQnCGyrUIoQ0B6fKdH+HlErN7qy1NC
         PxJN5mjE7krBVDoBLjqWrrArV4BuyBC2LY4KUpuwFUHqo305PjNlojyFyDpJXiKE0DXV
         liLzjoXGP/GQPnWv4BP8GvBtcQBO7qpCftOarwqKrfPiOXsRclDTVZD54rPyvlE8kd9s
         Y08CQ7x+416F4neB3kHS/InJsWkWuJIXLG5a0pncTuYcVixSMKDJRS9ndYKNXLeJ2CIP
         pao9uj+7otjme2o1E3QKackvcUWAK2yefGiSz8S1wkbUCDBvFNGtCFHysGNXOXc53hmL
         qPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780413722; x=1781018522;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rula0vxp21DSEXYbt5FICLGmSa3GjueuuDLvkBfCxeA=;
        b=QR9DJHvej18MkNu8qzER7ENC5KJiMHNr361fvrOdpNYXHkD6ye9XGQFDpgQlba0CTA
         oSwlysXBYE32SuvDd3/RAUybaoXj1GbAfm+hILGXE63SqfCEkrwRC/eSsduX/SdeJKve
         Yd+WcagkrVW6JlDBl0uS71IlKfx8qWGyd1CBu8ZTy5sQDC30DshtpaXVqTiTH6ekUym7
         I2vWX6U4KANfh2zIIkRLhtY6JOLHQoJB+Xjy0o2NyttRFnpM6JA5R/gCJcTlBm5Bnaw2
         zv/4Pqz9r+eH4VkyPvQQ5QpdgcgBatHZ1vlCxnR/LJkibWvGMnSgAqhc6FW8lPUT2U8S
         nAhA==
X-Forwarded-Encrypted: i=1; AFNElJ+d8buMMkZxCDHuApHZEjRUYGsKaJHWlb4kMtJfhDFny9MopudPZb3Zvr3s+QJhuHOrGB/D3NhsuF0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8AjcyIFNgau9DhhOoCXo1ow5tnYVOqHmhK/jLmTCUB1WD/AsV
	9K1ePtcOB9SkqKQOjktc0mETQmq/EUMjqGiq5c41h6ztdfc5FFUEGMrCQfU1yl7chWmFo9HuK36
	iol+f+2bfOxav9fXSvnYbnCzKCJfvDmUjP2cNV4Pyo3aFDSem7rkpsJuOOySuO64=
X-Gm-Gg: Acq92OEAT4eGw00MLTCFkLTzkSS4ZRh1mFnNlKwWBpl6llHqwajdXDVIUHWf/hMyrxc
	WipKg34wrMBfYzPtOKj9QVVyEXpzzkCxBxoAGJVkmYhSqGjH2e2fPP8jAu3GkVoncGuaFAi72L1
	iVpXFp/tBpkOL8vUr6BZs36zNcj7JCLNigxyUJZ26guKhjcbWq2Ct7ksTQ6AD01h21MpIrtbs9l
	+iycaF6kWlmblhoYgN4BQtA0kgqoPHynOElo2/t8YCiC9k7yo+OVIIYIImciYyR7uhY4RR9k5OX
	RG6+SQAPp544bR9MDRpLup0AIb4T3aZO+bgwnDNRK/aqjVxM3VGnCAjG+OlOCr1KDtqLwUWs0Wh
	iWaNJ5n2U4xvWQdqlRlSDkSPM1VpGKkBBrKbX4uNXXTHuZjBRE5ikyMD4
X-Received: by 2002:a17:903:230b:b0:2c0:af09:f3c7 with SMTP id d9443c01a7336-2c0af09f5d4mr156635985ad.30.1780413721684;
        Tue, 02 Jun 2026 08:22:01 -0700 (PDT)
X-Received: by 2002:a17:903:230b:b0:2c0:af09:f3c7 with SMTP id d9443c01a7336-2c0af09f5d4mr156635555ad.30.1780413721216;
        Tue, 02 Jun 2026 08:22:01 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e71cbsm135136465ad.15.2026.06.02.08.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 08:22:00 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/5] clk: qcom: Add PDM GP_MN fractional clock divider
 driver and DT support
Date: Tue, 02 Jun 2026 20:51:48 +0530
Message-Id: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAz1HmoC/x3MTQqAIBBA4avErBPUwKirRIg/Uw2ViUIE4d2Tl
 t/ivRcyJsIMY/NCwpsyXaFCtA24zYQVGflqkFwqrrhk0Z/aHbteoz6D17dgPQ5OOmG7wVioXUy
 40PM/p7mUD4Ugca9jAAAA
X-Change-ID: 20260602-pdm_clk_gp_mnd_v1-7e9c2c1b39ab
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: nJmHZn-EbXm_-4OsE5DrPlTxfNWVAlb-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDE0OCBTYWx0ZWRfXyYzxxZWPsn/l
 R4xAPGVrIX6kA+T0NGBuR5maPkIUv9O43JbBbeaEA3u+7g2Z0a5XgbsPcCisxOknlZQxo8sK6l9
 tkTYW5sjCEqhRPqR340ipV2S5RlYtokFSAtE3PnBA8iS49U49dNy6OC4NDyYhSfurWr4jM86u7H
 4NTulfhcdgFHKKS33eQLGbhUPkA83jjZQABjMJ0O1Z9yVX+o2AN1meWrCNBxz68UotvMouiinuR
 aCKfEjNpPUil4oByDcVt+5AXMNz/QXzHUiASzzQRgVuBzAhAmKMQKyA/m3kbwzxr9IqrdRmLQt7
 OCCnSqoECacPKYsfnsB2PCV1BFyipKhwl+X8kXzD6dMjJvhatHaEY7LRi9N/fbbCyzvtVp3eXEk
 65O7g09yf0lPQhAYX9paHQkfDVShxy55BSri0lLQ5ovRZ1Gvpougl1/b7SMk+oBRyBP7Ike86Eq
 ao5h3x/WoxHaOSoA6Uw==
X-Authority-Analysis: v=2.4 cv=NYfWEWD4 c=1 sm=1 tr=0 ts=6a1ef51a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=7twCsXJWkRLxYzWIcc4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: nJmHZn-EbXm_-4OsE5DrPlTxfNWVAlb-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020148

The Peripheral Web's PDM hardware block on several Qualcomm SoCs
contains a GP_MN clock divider that generates a fractional output
frequency from a fixed input clock (typically TCXO4):

  Fout = Fin * (M / N)

The output is routed to an external GPIO pin via a dedicated pin mux
function, making it useful as a reference clock for external devices.

The hardware uses three registers:
  - MDIV: holds M (9-bit numerator)
  - NDIV: holds the 1's complement of (N - M) (13-bit period)
  - DUTY: holds D, the low-phase count, constrained to M < D < (N - M)

This series adds full upstream support for the block:

  Patch 1: dt-bindings YAML schema for qcom,clk-gp-mnd
  Patch 2: standalone platform driver using rational_best_approximation()
           to find the closest M/N pair, with full clk_ops coverage
           (determine_rate, set_rate, recalc_rate, get_duty_cycle,
           set_duty_cycle) and AHB bus clock gating around register
           accesses
  Patch 3: gp_mn pin mux function for QCS8300, SA8775P and SC7280
           TLMM pin controllers
  Patch 4: pinctrl state nodes for the GP_MN output pin in the
           kodiak (SA8775P), lemans (SA8775P) and monaco (QCS8300)
           SoC device trees
  Patch 5: GP_MN clock controller DT nodes for SA8775P (kodiak,
           lemans) and QCS8300 (monaco), clocked from GCC PDM XO4
           and AHB clocks with the XO4 pre-assigned to 4.8 MHz

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (5):
      dt-bindings: clock: qcom: Add bindings for PDM GP_MN clock divider
      clk: qcom: Add a driver for PDM GP_MN fractional clock divider
      pinctrl: qcom: Add gp_mn mux function for QCS8300, SA8775P and SC7280
      arm64: dts: qcom: Add gp_mn pin state for GP M/N clock output
      arm64: dts: qcom: Add GP M/N clock controller node for SA8775P and QCS8300

 .../devicetree/bindings/clock/qcom,clk-gp-mnd.yaml | 105 +++++++
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |  21 ++
 arch/arm64/boot/dts/qcom/lemans.dtsi               |  21 ++
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  21 ++
 drivers/clk/qcom/Kconfig                           |  15 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-gp-mnd.c                      | 333 +++++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-qcs8300.c             |   9 +-
 drivers/pinctrl/qcom/pinctrl-sa8775p.c             |   8 +-
 drivers/pinctrl/qcom/pinctrl-sc7280.c              |   8 +-
 10 files changed, 539 insertions(+), 3 deletions(-)
---
base-commit: 08484c504b55a98bd100527fbe10a3caf55ff3ff
change-id: 20260602-pdm_clk_gp_mnd_v1-7e9c2c1b39ab

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

