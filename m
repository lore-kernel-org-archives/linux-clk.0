Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C518844A3F2
	for <linux-clk@vger.kernel.org>; Fri,  7 Aug 2026 06:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786085600; cv=none; b=RqHfpm3jDooAjgeIz5inFrF53u0jtt3oy6K1wYxRsIqr5K2iw2BJUXMgu9MmAoY8m53aNYWAQUdq28cqZrlCAWjTYEYk8XDiL1VYpRw+v3F/BQkMlAMyWegodcNAeOaXlsxpxnAu2fGRwJrYVY4V2p443frm7uDAveZ69eJTLZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786085600; c=relaxed/simple;
	bh=1/swuZjyJIeg5d4teu4VPlzCAW7NrnY1XkKkX3dFoTE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dZcjRCY6GqF8mesSzuXBemP9LLIDMC88YUlZH8iDKm/RAp4FDFxSENyrXKM3MghqudIarXchkca5WkRGDspXHE2YKK6vhpiygI2pQ/fgC/JzulLibvhx1PVU+PmqSr5vA2PzlbR/n37wMDTbhrJEftzQYN9q6yPFrgg8B81Eh3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ejztvMTc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aDJGk/W0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ejztvMTc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aDJGk/W0"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770GauG3176962
	for <linux-clk@vger.kernel.org>; Fri, 7 Aug 2026 06:53:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZDxW0B9zKHX8o5uqfjv/8e
	vUOr0oMC9Gq9ZzYTEqFQA=; b=ejztvMTcGOrd+18TdKrP5znVZoo5b3LHBLQ5P1
	pEkxSHCpCPLyBHJw7j1Q0VHLpTHMc7bBTjxFwEwKqqGz6xbAhaw/9wjqfBBro0bu
	uKEMlIue7J8WjMkxoHbChYAOdG2AsffhhyFpGBgVBwbto10RoYNYLyzUkIlY2/9x
	TUULcExbyidq9sYEmNGWvH1dOHDjXmpnnt4H2DUkAjcJCIjbGCg+MuEXyCbWgNik
	JmFQ/YM2SLi+gvJ/8UjQ0rlWl2ImWh1h52WUSSjrOaL/7VAfuHRZ5FxnHAFtbCRN
	UvrJRAP9rLKFsH01udtecVGYLW+ANwQiceIJa2BDwNcjNsew==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6jjkhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 07 Aug 2026 06:53:17 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso2512496a12.3
        for <linux-clk@vger.kernel.org>; Thu, 06 Aug 2026 23:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786085597; x=1786690397; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZDxW0B9zKHX8o5uqfjv/8evUOr0oMC9Gq9ZzYTEqFQA=;
        b=aDJGk/W0SUOAEAlmESN2dGT2Tv/nAVAHcjPPuubtq62NtW1D7iWyi2ViR2pWyaIJGR
         4q3+SPryRcxZCFPpUCzVDxMAMbwBIFI/yVmSIuKZJJAFQdaaK16D6l48s0scw2TZTSGr
         x9tX09C9u+twyTAUGkByZate45JD7cWcUOmDTYLnR6o3/r63J2rJd39G+Mq5dwdVhHZw
         1EDft1DIsuGWKZMxMli6fIUFLxV2Gli7oWB+lViTFOc/7G0peh68wBF63K24tHjJqA4u
         85Ey0pNzLAYFs+Jjm85jRE0h7+axgZ6qT8p2P0/e8RLWFBWTjZgGr5s8kU1Zkb8Wgfsy
         Hcfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786085597; x=1786690397;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZDxW0B9zKHX8o5uqfjv/8evUOr0oMC9Gq9ZzYTEqFQA=;
        b=Y5rmryaBhufsTgpvlTmZoLQIr8bV7+nGCXFv0n+CRYPNQQpgZeef3026zFggi+Bk2y
         ywnjHIAgEhn1tV77ghb5eky+axbEPUOy0P4GVh9InDTa9noQ6WC09zrHGUnOsq3oYNXa
         Fc/oOxJlUxFyk2t0rCPhysktCgdBP0g7wvU4pkx0HCBPEs0ytR3jVhvezAkEPXXQsY+b
         sYhM1CTMW1ph/AJK6PGWQjTDVNCIZIC8JuYkuCWpzOg5dfblXO3EtyL9Qn5+y2krBDDy
         VVHFWsaWm580OcLxlX1JxaYn+z4PI+JAD09hcNxQzYdDH5V0wFl8ACeIS9N7AvjoLWKU
         fzkQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp+ejFC4guUkswqqvIx+8KRYwdOlNDDEkFrbe8qmag+njpKnbLy/CEFyDrSFbJXxSLZpnBldkf3+jo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlbg09GsygudKe6+r8PmqEsSIu74iNh1gjANTr4Dpw8Esrv1L7
	GoaMznkX5rou9WyBM7jjaNze18yJSY8s4qb/+CqjjuAEHYDYQQeCyklHLs6fYdZ5r2+6IG/qWZR
	rVtCYfASj0KlzmdA7rVfYpslNjePzXpQ4eDdpZycEvsD/3ZrRNlpKZ3TqJ13dYaw=
X-Gm-Gg: AR+sD119J4U6dSB55D5o/mChVrj5jgItk+U+AJs6rjCvsTvF3njAo5P9Siru9Bxxqv7
	R4AETZHA0x6177aV3f82b0J0tCOVK5ENKDzuoF83tLchBIhaZE8uARLZ5jxCMfJrIXFejKDNLJ+
	J9hgNNIPrP+kXbRzC8Wql7RXC9fuKcbiLhn+LkMlVW/bHX7N7Z5OlpYcbSz4IPnxMuhtGnwLvrI
	P2W17M/+Z6mCA/JWcA43d0ddJpPqOdeloK5/onAnAAOmT+3VXgbRS5wtyQMBrVlMOdMaAsk+GLD
	Kt3VFFzPpOP8xwnlJFx9aDPaeVr2Ig1YHvDTQLEpIO94vmkfR228tlqIrtMwRS6rdgwQu70j22e
	8Il9rdlIOKTk5sEemOBUE2vTiMmK9NM3CsMv5aXqc358=
X-Received: by 2002:a05:6a00:2406:b0:845:a435:a2eb with SMTP id d2e1a72fcca58-84f2e094eacmr21848990b3a.31.1786085597185;
        Thu, 06 Aug 2026 23:53:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:2406:b0:845:a435:a2eb with SMTP id d2e1a72fcca58-84f2e094eacmr21848934b3a.31.1786085596682;
        Thu, 06 Aug 2026 23:53:16 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f19842bsm223493a12.4.2026.08.06.23.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:53:16 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Subject: [PATCH v2 00/12] clk: qcom: ipq-cmn-pll: Add IPQ5210 CMN PLL
 support
Date: Thu, 06 Aug 2026 23:53:04 -0700
Message-Id: <20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANCAdWoC/32NywqDMBREf0XuupEk1FdX/Y8iEmNSb1GjuSot4
 r832n03AwfOzGxAxqMhuEUbeLMioRsCyEsEulXD0zBsAoPkMuWZvLJJu77CcUqk4JXuh7HrGDd
 1oYpUJI21EJqjNxbf5+qj/DEt9cvo+Zg6jBZpdv5z3q7i8P4/rIJxpvI6T7OikSKxd0cUT4vqg
 tzHIaDc9/0L6+Cm8s8AAAA=
X-Change-ID: 20260724-qcom_ipq5210_cmnpll-0eb9a9615dff
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luo Jie <jie.luo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786085594; l=4314;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=1/swuZjyJIeg5d4teu4VPlzCAW7NrnY1XkKkX3dFoTE=;
 b=XGiiDODkvGpmZ0VVl1vgnUz2h/n57VzMVeIAirDsynbygZA5gddGwNLlr8luEL3CeFD3tPAKa
 0Is88LCPT4eAcrGuJu3uWsTgtq7DlSR1NMLCOA6IQHma6guTvzCoQEG
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfX/NOvhXk9MnmS
 QU/DQ/GI1f1gYDwXjPNNk7594ut/ogbAQhqn2EOIrGU/70B41M8B/VELhDpv0rQPtzMqnKmNdqe
 LTcq5b8qUyRY25dW/7YU/1ogX3l+XBXnbStdpYAnqy8ym5n+dOs15Wqjep/DIn1QnULxoJJwvq9
 JaGq115HlZXzO99SJVk4MnazSEfrNFAkgp+r5lmTf/YAUbvLa20m6rwXa+FxPsFFtwd6Mtn+gNl
 0x4Op0MOlR2bRSguObOuWU4H3cJBRMGP2u0UhxI0oropbwxOdYZpcXo9etjcgHAfkmpoYLqHI79
 jnWFAsDz8UB0dqS9Rzltl0Au6zeOaI435r9Pkdok98JV9sZpSwFVYXiIlPP9xECgNOvLEDRYWJR
 /Wg/LSNCIv3VzIN5rkbF00W/Do6aD82Sq68hsjueLrtAc6/ai3XfDX1233/YWG2bjgPjNnNgsbR
 CcPxsIeaXhd1RcZKCSw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfX/77QPR1CWZal
 Ofm8+NaoONZRIyung+0rnfoIvfGGjMnu2v0bMTDCROICsh9iX+SqtgQ/AgLsuDbaXuD949kqGPG
 zsaxldovHto8W8mTrPeL7v4W20nrCqQ=
X-Proofpoint-ORIG-GUID: RL76ni7rTc4Za-Bat4y6HXNfOCCl7OKl
X-Proofpoint-GUID: RL76ni7rTc4Za-Bat4y6HXNfOCCl7OKl
X-Authority-Analysis: v=2.4 cv=e5Y2j6p/ c=1 sm=1 tr=0 ts=6a7580dd cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=tavO0OwAFwysDn8gYvoA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070050

The CMN (Common) PLL block of IPQ5210 is almost same as that of IPQ9574
which is currently supported by the driver. It accepts a 48 MHz reference
clock from the on-board Wi-Fi block and is configured to run at 12 GHz.
The difference is in the output clocks.

This patch series adds support for IPQ5210 into the CMN PLL clock driver.
On the IPQ5210, the CMN PLL block supplies a broad set of output clocks
to the networking hardware and GCC:

  - NSS (network subsystem): configurable rate via 6-bit divider
  - PPE (packet process engine): configurable rate via 6-bit divider
  - PON (passive optical network): configurable rate via 8-bit divider,
    plus a fixed 31.25 MHz UNIPHY mode
  - EPHY-RAW: 125 MHz or 312.5 MHz for the SoC-integrated Ethernet PHY
    (EPHY), which supports up to 2.5G link speed:
      125 MHz for 1G/100M/10M, 312.5 MHz for 2.5G
  - Gated fixed-rate outputs: PCS 31.25 MHz, ETH0/1/2 50 MHz,
    EPHY 50 MHz, ETH 25 MHz
  - Fixed-rate outputs: XO 24 MHz, sleep 32 kHz

The patch series is organised as follows:

   1/12  clk: convert fixed-rate registration to devm, remove remove callback
   2/12  dt-bindings + clock ID header for IPQ5210
   3/12  CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET flag in the generic clk divider
   4/12  clk-regmap-divider support for CLK_DIVIDER_* flags
   5/12  NSS configurable divider clock
   6/12  PPE configurable divider clock
   7/12  PON reference clock with enable/disable and divider
   8/12  EPHY-RAW 125/312.5 MHz select clock
   9/12  clk_fixed_gate gate clock type for gated fixed-rate outputs
  10/12  IPQ5210 output clock array and device match table entry
  11/12  DTS node in ipq5210.dtsi
  12/12  Update IPQ5210 xo_board to use fixed-factor-clock

Changes in v2:
  - Introduce a new CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET flag in the
    generic clk divider framework and re-register the NSS/PPE clocks
    as plain clk_regmap_div instances instead of hand-rolled ops.
  - Replace the composite clk_fixed_rate + clk_gate implementation for
    gated fixed clocks with a dedicated clk_fixed_gate type that reads/
    modifies the shared gate register through regmap.
  - Replace the rate/enable_bit/strcmp(name, ...) runtime inference in
    ipq_cmn_pll_register_clks() with an explicit enum cmn_pll_clk_type
    field, making each output clock's registration path self-describing
    instead of implicit in its rate/name/enable_bit fields.
  - Update the EPHY-RAW clock's determine_rate() to pick the nearest of
    the two supported rates (125 MHz / 312.5 MHz) using the same abs_diff()
- Link to v1: https://patch.msgid.link/20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com

---
Luo Jie (12):
      clk: qcom: ipq-cmn-pll: Use devm_clk_hw_register_fixed_rate_parent_data
      dt-bindings: clock: qcom: Add CMN PLL support for IPQ5210 SoC
      clk: divider: Introduce CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET flag
      clk: qcom: clk-regmap-divider: Support CLK_DIVIDER_* flags
      clk: qcom: ipq-cmn-pll: Add NSS clock support
      clk: qcom: ipq-cmn-pll: Add PPE clock support
      clk: qcom: ipq-cmn-pll: Add PON reference clock support
      clk: qcom: ipq-cmn-pll: Add EPHY-RAW clock support
      clk: qcom: ipq-cmn-pll: Add clock gate support for fixed clocks
      clk: qcom: ipq-cmn-pll: Add all output clocks for IPQ5210
      arm64: dts: qcom: ipq5210: Add CMN PLL device node
      arm64: dts: qcom: Update IPQ5210 xo_board to use fixed factor clock

 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |   1 +
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  22 +-
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              |  25 +
 drivers/clk/clk-divider.c                          |  22 +
 drivers/clk/qcom/clk-regmap-divider.c              |  14 +-
 drivers/clk/qcom/clk-regmap-divider.h              |   1 +
 drivers/clk/qcom/ipq-cmn-pll.c                     | 554 +++++++++++++++++++--
 include/dt-bindings/clock/qcom,ipq5210-cmn-pll.h   |  30 ++
 include/linux/clk-provider.h                       |   3 +
 9 files changed, 633 insertions(+), 39 deletions(-)
---
base-commit: ea2bff00da89d7767d677bb68470130ba96f4928
change-id: 20260724-qcom_ipq5210_cmnpll-0eb9a9615dff

Best regards,
--  
Luo Jie <jie.luo@oss.qualcomm.com>

