Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155D740B115
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 07:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692734; cv=none; b=axizLOb2Xs401vjn5B40m1Fcpo0RTVK925fPcAjS7Hi+9LnFnNgLE0naCydv5h8bJWU8U389p6NZGYOOfx65t70BYCKHCPagZ24VtWdmrsNz2hrD968taHgW2EHAtBGuiyL+gUokeRjaSney/cY4H2IiRS4D+j6KFKTnTrQoItU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692734; c=relaxed/simple;
	bh=rtXTm0sNcVUQHP6jphCaU+mu+w6xi+uhAxczIqaG98E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dhb4Ht/FF0iiXPvQX0IEflyNGRiW0eaiLYSBv7jkd1PehRm3Cg6mRKZj1lbMiElj4MrQmcYwUO372g1LyhQv/geiOMM1D/HL8RJxvkS2kyzTn++9f4VjOQePr8DL5/wkil286g6L8gVgeaeyaT50X9RP+BFeSNvkSffcyta8Uf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O/Mqmya6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GAm2nCcJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O/Mqmya6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GAm2nCcJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4QcWj509953
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 07:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vRh6KGV70ia1LMOel+Ogjj
	kWMd2+zpPSn4EusQLoafs=; b=O/Mqmya65j6II0i0WRSS6OSUFbWclONlq1xD5i
	yOZYdVlO44Ypq5kepVOf41jOFxH/HHH2WN2TgjVvdqtvgG8lImaXPcIDYMVei9nN
	P10Hj+Rz37wHnkLrALzMyGZKGH5kIRp4l0OcNrXAz5yXx9Uzb8dRc9YWDDOazbZ0
	AWNdu2PJ4oQ7k7XuF5cj41x4itlMACyYmwLGavsS/P8T7xDTcpDX12lj7GJe19Ye
	65M7CTk/+HJen09yTroTPPbpfAmGYA5ey8ZUqj0dZS7pZMZehB6RK+LlVGUYXy1m
	hgW+7GqxtNXHIyRRax036NgErvEhoZFv0fTdb6Lhp2K3oZow==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1fg3us9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 07:32:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so14556585ad.3
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 00:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692723; x=1787297523; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vRh6KGV70ia1LMOel+OgjjkWMd2+zpPSn4EusQLoafs=;
        b=GAm2nCcJbqboOCVNQee3HRAY4EotIqo1x6kGhHMFRM97i//NER4nQy4mqtmAuIcNGU
         mGeSR9no1kePZ8AxaLf2hl+pHggBXAvJnJTSffOqxgiNRRb0Q1VnRQmaIyXsDtJh161L
         +Cdt9If5oGx0ONvBv4y7ys6oBc4DKpM5yuVNuVQnlEwti6hKMyDOKo4nuk9O8m03g9st
         R8n5Y4xBppSD4PLSMGm8yPDvhbrdrNxFGJ1K/xx3qOUjTaFIKq3cXX/hEFxkjZySVy0n
         iWczTIv8sCZdz5mMfToMzbmT8K73mejNBKGYtxOCoMER3MsSwb3j6YF2flkv2YPZkkZp
         9vGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692723; x=1787297523;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vRh6KGV70ia1LMOel+OgjjkWMd2+zpPSn4EusQLoafs=;
        b=EigzeacM/ixdUqLuA02mjocaKAPZ1P0Cc2FPxFnK3T2PMuoV2PO0XfYQbZmqD51pOy
         U/L1DY75P1Mt0ItZFFBdS7jj9biGJmyg9JWhgu+m919b+oxRjVqvJf7NQlVvI4SUUMG+
         /GlsmtDUYoXTUQHujYGdiH12TGlL7Enc9V19VvKRPWm5u+A22j/Q725EkWvgmPzbsVYs
         j+Ez9bliFRZ/DHxP3RMxfAPVi7GPW/rjUqj5chFf5lkk/BFIbg72Xhn+55eKjbcM4FET
         S2Zj6Zq9gfKYLPpZLxiDaHPYrGF0fhJgTggCAZUVc4piG5uSqSLZqR1CMSd01ieBab5F
         Ow2w==
X-Forwarded-Encrypted: i=1; AHgh+RpEKIkChWMZX0b6Uc2xWK+kjS243YAZ4CCbzqeVTAdWeSa6uXFWO0mBFjw5qRf2P01qZE/vbHfzf3I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSAwwbbVF55Jw9YS+uGYWVs/chdejsxEma2XrK4XnAHXr+rjil
	CkazGbGSKBxk+hW8/uS9eMs1CfPMeiDa1fYTem1X5eR+LebZg7SvNZ4q8MYDN3my9ThQuAkWzSb
	4MMeffPc5hhsu5z3kd18D3QAf1NJ6mLcnbCIJfBryY8huM9D7hbjNpNxOvnv1N2Q=
X-Gm-Gg: AR+sD11/yEkJmUPdeMG3trbdke5cblUYv4FVdiVKV5yYrWmhrxTxJwKRwvjFxAzdXvx
	yXaJQZUPB32WIZf6W/OBVRRwNJ0nEBnfTDI+z4VNy+CCLN3Xa9PdalODSAzH2qODZOKDNlPinH4
	176bLM97uA5SUtF6R5O+D8D+DFDe2x1DFJKSMC27ugos30TGLNpF9Iv6+IvdGuujYhqyzDyC+l3
	kTLgeWoEQ2U9WEJWPuiJz66h7Dkz40mGpu0SwhiWf6DhlJLE0Ev07tBAeWFXGT1yF8TKN+fDXkN
	P0Rr3HzLKWrb5L/YS3WpUB3xVSlc5J4bRfJpKRgktiS5WrTI+LO7vPgbY5OWMhNu0plNPpdacfz
	i7LZUJyStv2VJK7KH4ALftTkPTkL+hHdCcuNsQ8cNrxtaoHTsui57BziIERm0aVU49PgXMeljQh
	wg1vBoRKQTs6C3Hc6/VWZO3Pg=
X-Received: by 2002:a17:903:1b23:b0:2c9:ff29:3f91 with SMTP id d9443c01a7336-2d3b08727e4mr47012255ad.6.1786692723228;
        Fri, 14 Aug 2026 00:32:03 -0700 (PDT)
X-Received: by 2002:a17:903:1b23:b0:2c9:ff29:3f91 with SMTP id d9443c01a7336-2d3b08727e4mr47011435ad.6.1786692722691;
        Fri, 14 Aug 2026 00:32:02 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm1062280eec.26.2026.08.14.00.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:32:02 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Subject: [PATCH v2 00/15] Add initial support for Qualcomm Kuno SoC
Date: Fri, 14 Aug 2026 13:01:31 +0530
Message-Id: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFTEfmoC/32NwQ6CMBBEf4Xs2ZLSKKIn/8NwKO0iVelilxIN4
 d8tePcyyUtm3szAGBwynLMZAk6OHfkEapeB6bS/oXA2MSipSlnJk3hET4LJCI7DQGEUhdVNpUq
 LsmkhzYaArXtvymv9Y47NHc24etZG53ik8Nk+p2Lt/dFPhZDigBIt7rU0R3Uh5vwV9dNQ3+cpo
 F6W5QtM1QZVyQAAAA==
X-Change-ID: 20260809-kuno-soc-support-1dab826de0bf
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786692713; l=5037;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=rtXTm0sNcVUQHP6jphCaU+mu+w6xi+uhAxczIqaG98E=;
 b=fUkvttIUx9VCeWiaW8i5QCky33IAmVohtGKSDZr78CLMXqmKNpCHYfU1KEQLV8FLetJGjWP5J
 3ll8FB9xdhtAdIfmrCb/Iua1Pv0CIwTO5xFkvvbomvSJc4M5okPPa4Y
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=NsfhtcdJ c=1 sm=1 tr=0 ts=6a7ec474 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kp1mlcltsySZhJOGRSoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX4cgaKjM46sE2
 IXBkgM7jZFKWwuIb9A2UI9bTlkd42TpRyerT92qL3EYotItUE7l0GGI+qmhkd91nyXbx1v4v2K0
 npKwGOStST/H6ySx+h+P7gHjbIzM8Frk+RT/g5PIozYN5YX06aWxjGvGwZEX3NrNfoewetCaTfN
 kIk5MS0hYCXbR90H0JXC90esbkhZ/Z7U4VPHFM5Ue19gVpO68yCrR8Lv86X22J09OQ2fiwoIQup
 ToG7w+PzUi3FNt1svg1tJ88F60MZLSDSWAFnJA7BQ7F3nR8DFuSmKYzHBLEYWcRI0vABJmXT6zk
 NTc2qqsxJZ1NY6XdtRmxjnJwatdbFWMvMqSu1c8QSgIMCVxAiWbS/anqoPGWbtGqVN0qkF1riWq
 DMW3jL7rn77qvgO+JNfHZ6YhLgJH/Nr+5cTui9jmd7GpGZd5c2o41w7VA4PiyoCzuFOnA7F3lHx
 jI9nIAeizY/Gzki60YQ==
X-Proofpoint-ORIG-GUID: rSqXdZE4SeIxymQxsmLZIr-2AvXlXgko
X-Proofpoint-GUID: rSqXdZE4SeIxymQxsmLZIr-2AvXlXgko
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX9MyEi3V+/B9+
 xXqbueOoiYMz+7DyqCBHZ5jOKgwaCJjF4dhHiILO2CB47s87+IcVprQcmgZI00RMK/bX7HORPne
 BngleR6V5LWdRvcE4k0hBpuJAVRoUdo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140058

This series adds initial support for the Qualcomm Kuno SoC and the Kuno
IDP reference board.

Kuno is a 32-bit ARM (Cortex-A7) Qualcomm platform. This series brings up
the essential SoC infrastructure required to boot to a serial console:

  - Global Clock Controller (GCC) and RPMh clock controller
  - RPMh power domains
  - Interconnect (NoC) provider
  - TLMM pin controller
  - PDC interrupt controller and SCM firmware interface
  - Devicetree for the SoC and the Kuno IDP board

The soc: qcom: geni-se patch allows the GENI serial engine driver to be
selected on 32-bit ARM Qualcomm SoCs, which the debug UART console
depends on.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
Changes in v2:
- Addressed v1 review feedback:
  - Reworked soc: qcom: geni-se commit message; dropped the Fixes: tag.
  - Reworded dt-bindings commit messages to the "Document X for the
    Qualcomm Kuno SoC" one-liner form.
  - Canonicalized copyright headers on interconnect binding / driver /
    NoC ID header to the single-line Qualcomm Technologies form.
  - Dropped unused <linux/mod_devicetable.h> from the interconnect
    driver.
  - Fixed MODULE_DESCRIPTION casing "KUNO" -> "Kuno" in the interconnect
    driver.
  - Extended interconnect binding to optionally allow up to four QoS AHB
    clocks (matches sdx75/glymur shape).
  - Cleaned up brace/space style in gcc-kuno.c to match peer clock
    drivers.
  - Reworked initial DTS: moved idle-states / domain-idle-states inside
    cpus{}, wrapped fixed clocks in a clocks{} container with peer node
    names (xo-board, sleep-clk), dropped the pcie_pipe_clk fixed-clock
    stub (the GCC 4th clock now uses <0> in DTS to match the sdx75
    idiom; the YAML example uses a named placeholder), dropped the
    RPMHPD_CX power-domain reference on GCC (Kuno GCC has no GDSCs /
    no corner votes / no pm_runtime, so the reference was inert), and
    added a bootloader hand-off comment on the memory node.
  - Collected Acked-by / Reviewed-by tags from v1.
- Link to v1: https://lore.kernel.org/all/20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com/

---
Hardeep Sharma (15):
      soc: qcom: geni-se: allow selection on 32-bit ARM Qualcomm SoCs
      dt-bindings: power: rpmpd: Document Kuno RPMh power domains
      pmdomain: qcom: rpmhpd: Add power domains for Kuno
      dt-bindings: clock: qcom,rpmhcc: Add Kuno RPMh clock controller
      clk: qcom: clk-rpmh: Add support for Kuno RPMh clocks
      dt-bindings: interconnect: Add Qualcomm Kuno NoC
      interconnect: qcom: Add Kuno interconnect provider driver
      dt-bindings: pinctrl: qcom: Add Kuno TLMM
      pinctrl: qcom: Add Kuno pinctrl driver
      dt-bindings: clock: qcom: Add Kuno Global Clock Controller
      clk: qcom: Add Global Clock Controller driver for Kuno
      dt-bindings: interrupt-controller: qcom,pdc: Add Kuno compatible string
      dt-bindings: firmware: qcom,scm: Document SCM on Kuno SoC
      dt-bindings: arm: qcom: Document Kuno IDP board
      ARM: dts: qcom: Add initial device tree for Kuno SoC

 .../devicetree/bindings/arm/qcom-soc.yaml          |    4 +-
 Documentation/devicetree/bindings/arm/qcom.yaml    |    5 +
 .../devicetree/bindings/clock/qcom,kuno-gcc.yaml   |   50 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../devicetree/bindings/firmware/qcom,scm.yaml     |    1 +
 .../bindings/interconnect/qcom,kuno-rpmh.yaml      |   82 ++
 .../bindings/interrupt-controller/qcom,pdc.yaml    |    1 +
 .../bindings/pinctrl/qcom,kuno-tlmm.yaml           |  109 ++
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |    1 +
 arch/arm/boot/dts/qcom/Makefile                    |    1 +
 arch/arm/boot/dts/qcom/qcom-kuno-idp.dts           |   25 +
 arch/arm/boot/dts/qcom/qcom-kuno.dtsi              |  419 ++++++
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-rpmh.c                        |   15 +
 drivers/clk/qcom/gcc-kuno.c                        | 1438 ++++++++++++++++++++
 drivers/interconnect/qcom/Kconfig                  |   13 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/kuno.c                   |  977 +++++++++++++
 drivers/pinctrl/qcom/Kconfig.msm                   |   11 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-kuno.c                |  796 +++++++++++
 drivers/pmdomain/qcom/rpmhpd.c                     |   16 +
 drivers/soc/qcom/Kconfig                           |    1 -
 include/dt-bindings/clock/qcom,kuno-gcc.h          |   95 ++
 include/dt-bindings/interconnect/qcom,kuno.h       |   89 ++
 26 files changed, 4161 insertions(+), 3 deletions(-)
---
base-commit: 28d012efb4327f9c75d5e042a7c91e9a542efa98
change-id: 20260809-kuno-soc-support-1dab826de0bf

Best regards,
--  
Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

