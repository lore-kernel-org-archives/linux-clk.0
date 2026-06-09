Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB36543E487
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 15:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017393; cv=none; b=PBhl4LbFJ4AaW7E8o3Qr1Pv10SBjxI/ZcjZq8BRJJDgbJpEsJc0I3sJ5Efj8K2hpjXum34vBIydVa51jtX7fbinvwEZBtWir3v7hveLEx0wjFbsbh1/O2IUf+0sf9tNelZ7iTH9Z89dT8Fpsw/N7NuIFLJFj/YxIFARQLGFcz+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017393; c=relaxed/simple;
	bh=MIqe8qokVa8YYJZkAkG1yXNBwKSVJLC1luMdgyTvEI0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=j5NTNxwXLqYxaBPLmxtJ7sH1W8PFvTwTJlJHY6g086UoJKcSCsa8GbpuUaYqobUUzWhbCi5BTpbXVCl5nniWuZjz3bO0XYT31xid5f3e/+KlANa6LIlbH0Wh+76PxcIL8ss/G7w3l0vCp45Kqv0drSbGoxTxp5OPI5TBWWx+XGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aglvGCQC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EXGhiI1S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aglvGCQC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EXGhiI1S"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClKOI2251625
	for <linux-clk@vger.kernel.org>; Tue, 9 Jun 2026 15:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=88cwJVjL2lnzu2cVHtBfD3
	jOAXqQUPFnSKVzm/xtaEI=; b=aglvGCQCGidI5XCIJbp+GZNa1nQ1FJjU+LP7vo
	wQ7+ec43PuohSglEXOsgxFAGBOPD++z69+aTRHyvHVI4rHMq2ev6ZkOtzqjZnoFe
	p2uG4BPfUjDe+JA280ag11U5PJa30CIYH0Pu6cUZyK+vrqlcLur/lT3i6mZSkqyN
	3VuQN1thZ1eRFN2EAN6NQ4s5MXhXRK0WcaCebhHRknwZh9jvupER5vrVoRcb8/Rr
	jsmjA16PMwZHUZ+/3Yd24fA72VMFVPpRkKF0HOgWpo/uZIyH7Kxx6DGIjEDkifDg
	k14dXD2Lsu+jw2UIW6tyimzvbuC8LHsNNFgawH5faXuZhgeg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqgj1k9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 15:03:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84233efcaadso3797438b3a.1
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 08:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781017391; x=1781622191; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=88cwJVjL2lnzu2cVHtBfD3jOAXqQUPFnSKVzm/xtaEI=;
        b=EXGhiI1S0olozg5UwqNp4uHplGPophwcxpwBCT1xGuqBPqkb4Jk48lZYFACIcg5Vg4
         EjdKXbisEFrDchfKKgFl30R2KkBsbFHqIttkGl9Yf3IDov/q+6SQoo1KaCdsDcLWRuag
         kHN1qrTFrO8n9674qkNixfpb+oadY3wLB58MDv3FV+nVivD3Xxlc6uE/b3HwReHBvBP1
         yAKMpoVYAmNvZn3qZLtx1eAgtoHS3KRpPLa1j1b6/U5qAAo7MvelL9QQXJdukwLvLZNT
         qh+3mGiL44ZM1gObrwhrptBeVzFdB2DDE9fQnFRxOhkZGDAjmsiB6W6ch/va+c/em0hU
         juKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781017391; x=1781622191;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88cwJVjL2lnzu2cVHtBfD3jOAXqQUPFnSKVzm/xtaEI=;
        b=soPaCyLpZB3VpHmk2CpKJaWcIDpkfi/PfRYP6EK3lhcpeWTh3m7T03+Dt139dhDpH2
         77aUe207leQ1BgXOO5vlQDzc9bSWlVZhPETwwMdeVe0nuf8UoZIWMDeVoVoUA1bqkKlw
         uEDvJaqR0qRd8UIsnYjn4PwZEHMDQJm8vt/qrqbG9bumnXMHjblIpcIMsGfRSKPSB6VN
         TK8Ktnq25sB94Bs8wWekusUgpHor58H+cSc6aaSfqPg7rIwltu8oarPbDKJnULwxFAhb
         42wzFwSuBMRqCVptKaMc2fsJhL4WhfocHSnT3BEA8itFKe4ou2GK5k0C1OtZZOblBP1C
         4uNw==
X-Forwarded-Encrypted: i=1; AFNElJ+1yLUK5cVQftNpqF9yuEHcQdz4GmPi9ennORvS+sCXvyUHwnbd1C17V4izg/n8VKEwvQSl5XBUW58=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ+7+7Kot3tyIunV5KStS1gSxukE6+2U4IseqCSrzCLtXkiLO2
	rjxC+zO3mOULWi+tG6SMK+KloKpEAk07nSYTzD/2MesCit/tse7mzVwg00BtVw90Jgd8IKU561r
	bmLOafNAGM2zUAJ3QIK/N+YdOVg7KYk4ToVpIOIYeKA+c30Z2HqsHqbwEUv7iKAE=
X-Gm-Gg: Acq92OG/88r4Oiz4KaFMgyvLdbFEfvW5zjuQcnrqB5owmVy6GPFnIoCJ4g0s+y0SUh5
	5rydpiSXazXJWZFCjwezpo96j/Zim3UOkaX9VUNqFV3GFPklp9afvqugc1gfcKdYqij/4VtkbyH
	VrP395Z7J/Fdo6B1asCp6pCrCrTTvZPcD/gtmEScqBQ6aeU8yEZOYxCeq35a70xW8GbKCa33FXU
	C3CFnOuPj8iF62Dr36R9IWBKailaz5UCC1JWDX0eooPg90lDfMCHa+3DvSq+g/9+4/zAFDVNln7
	aWlnFusa/+5ZAFy/CPrGIPSTq0tHAI4P/P1Z3XDe0hLEGmceesep9Tj0Stq90h94IEiUKhL3rQJ
	2gqmmqmm7BrbvFR6KMN89o71vkvuspEOFoMarBQQpfX4yBWaLcM92u9/C
X-Received: by 2002:a05:6a00:1946:b0:842:75d0:7e88 with SMTP id d2e1a72fcca58-842b1064cc1mr22480478b3a.27.1781017390571;
        Tue, 09 Jun 2026 08:03:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:1946:b0:842:75d0:7e88 with SMTP id d2e1a72fcca58-842b1064cc1mr22480295b3a.27.1781017389562;
        Tue, 09 Jun 2026 08:03:09 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828d6bd1sm26987659b3a.44.2026.06.09.08.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:03:09 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v6 0/7] Add support for Video, Camera, Graphics clock
 controllers on Eliza
Date: Tue, 09 Jun 2026 20:32:51 +0530
Message-Id: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABsrKGoC/x3MSwqAMAwA0atI1haK1qBeRaTUGDXgjxaKKN7d4
 vItZh4I7IUDtNkDnqMEOfYEzDOgxe0zKxmTodAFatSNGoziVW5nt80S2YgKDVFZjcZhU0PqTs+
 TXP+z69/3Ax0TjeRjAAAA
X-Change-ID: 20260609-b4-eliza_mm_cc_v6-64cc35d4a698
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0MyBTYWx0ZWRfX+5FVta+jjDfA
 42cU7Qx0ZD9tZHO1rfR9Dth4mHPxZrZMhVG40XbCLPnvqWIIxBC7QTvqnF2JDgW9bdMA44VjQBC
 KCz3owilTIbXebwZK9liw7hYbctGolk7aYXEeL3pugOt1ooVN539qsnMBXjsXmH6Npp5oFR3d6H
 TH3vCKwAf3YggNJ1KWDnxvZ9B7hfh9h51vp62D7Qt65kKlA0KmGBgfH8cTDTfbLBm0UqU2AD2Ak
 +smwQZqeEzOA3wAenL41naCUVo4goAkFTpzpDbU+GrTSeRSYN5DDzotM43+lfbnnXUTqdeShQh3
 kfh/+5/KzQDYjpU7WEFe0YFzYtF1V2ON5X4Ih/QuMpr37WM4LKzxNV4+4IYH7wzn90X0C14YktE
 KtZmjUmpNVFZdBiOOuF+vLPtR8x9PKH6yyxDh2z23O3Dj9/DxDrLSRrrWKe9ruucVaZgblDbAzU
 O2ykSLR+oeW5EcaSswg==
X-Proofpoint-ORIG-GUID: dFXrPigV_IncyATPYJj9GAR0zIpu8caH
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a282b2f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8HYrQF7E7KXWYYjJzRwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: dFXrPigV_IncyATPYJj9GAR0zIpu8caH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090143

Add driver for Eliza SoC camera, graphics and Video clock controllers.
The camera clock controller supports the cambist clock controller and
the regular camera clock controller.

Eliza camcc and videocc are on CX and MX rails and doesn't have MMCX
and MXC rails dependency. Since CX and MX rails are already ON when APPS
is active, explicit power-domain voting is not required similar to Milos.
Hence extended the Milos camcc & videocc documentation bindings for Eliza.

The patches have been tested on Qualcomm Eliza MTP board.

Changes in v6:
  - Update device tree to latest linux-next.
  - Update commit text for no ABI breakage for VideoCC and CAMCC
    binding [Krzysztof]
  - Added the RB-by from patchset v5.
  - Link to v5: https://lore.kernel.org/r/20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com

Changes in v5:
- Taken care of comments from v3, v4.
- Update milos-videocc and milos-camcc bindings to add '#power-domain-cells'
  as required property in bindings.
- Remove duplicate clock 'gpu_cc_gpu_smmu_vote_clk' from driver and
  bindings.
- Add '#power-domain-cells' for 'camcc' and 'cambistmclkcc' device node.
- Link to v4: https://lore.kernel.org/r/20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com

Changes in v4:
- Update the clock ordering for camcc and cambistmclkcc in milos.dtsi.
- Link to v3: https://lore.kernel.org/r/20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com

Changes in v3:
- Dropped new documentation bindings & extended Milos documentation bindings for Eliza videocc & camcc.
- Dropped the defconfig patch and included the drivers as m from Kconfig itself.
- Update the header inclusion in the milos.dtsi.
- Link to v2: https://lore.kernel.org/r/20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com

Changes in v2:
 - rebased the patches on the latest linux-next.
 - Add new bindings for Video and Camcc.
 - Remove commented code in GPUCC (limiter code).
 - Add device nodes for the corresponding clock controllers.
 - Add RB-by tags for VideoCC and CamCC/Cambistmclk from v1.
 - Link to v1: https://lore.kernel.org/r/20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (7):
      dt-bindings: clock: qcom: Add video clock controller on Qualcomm Eliza SoC
      dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
      dt-bindings: clock: qcom: Add support for CAMCC for Eliza
      clk: qcom: videocc: Add video clock controller driver for Eliza
      clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
      clk: qcom: camcc: Add support for camera clock controller for Eliza
      arm64: dts: qcom: eliza: Add support for MM clock controllers

 .../bindings/clock/qcom,milos-camcc.yaml           |   12 +-
 .../bindings/clock/qcom,milos-videocc.yaml         |   10 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                |   61 +
 drivers/clk/qcom/Kconfig                           |   31 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/cambistmclkcc-eliza.c             |  465 ++++
 drivers/clk/qcom/camcc-eliza.c                     | 2803 ++++++++++++++++++++
 drivers/clk/qcom/gpucc-eliza.c                     |  607 +++++
 drivers/clk/qcom/videocc-eliza.c                   |  404 +++
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
 include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       |   51 +
 include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
 14 files changed, 4666 insertions(+), 4 deletions(-)
---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260609-b4-eliza_mm_cc_v6-64cc35d4a698

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

