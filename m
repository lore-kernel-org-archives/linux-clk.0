Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C81C1E9B3A
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379387; cv=none; b=bxHs/ZJcVx0A/X3iiREQHv4fIb3dE+OmOk42t74LAMPnjWkRxnqjD5FP+FeJbpTbD39m5tqraZK03yEl3CnEEc59R8LrfTVArsqI4ruThxO6ligDMBrqJAkNQtfDMmHnLs6d8PTwSKevBAj1l4wHuSAkAAtH/igCmDGfJCqcdoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379387; c=relaxed/simple;
	bh=rh2XhYb9Y0A67WdVNJ2cfhj/MALONQN8WmX6Glr3VgA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=a0bE1BYg/mjrg3+crDjo/czt7hg8B2pmm2ABxi5X/njJ7Wbpk2qQATwPzOsk2xoaK0Ic/rb5L4bwOt/IsciBHvjYivK/Mk7XbPjX9Nq4/EJcLPJSLG6AwNwwAsbX3CKsZIab/A6taKRg8gGAw2kMnNR7yfxt1rDtgqjVlE+rVDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gZMJVYvZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eoAhwtWG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gZMJVYvZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eoAhwtWG"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHHQC205641
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AdR7vRy5XBtV40I2ljwZ7F
	KFKDRSO+UZ/5LcwdVSpBs=; b=gZMJVYvZg9/SnmsV2xmONc0UR6Iyfb/Hp5Jbxl
	xY/mDdqGJml69TS8JFkZB4oNBlDJFnJdmD3+jePL90FJ6DGp2iLpu7/5sCQkVVHH
	u37GWRvAmPVAyE5+9LXr6nRHau6h8Eiv5lZ44Sukjoum7de/KxzWo02nqX4Q0MaM
	nshOzL/+gnNvD8fZNTNiasLpJfkVLItUSNzdsaEouLYqw13HkkHeIwJtV+PR5wNh
	DLxQcn2CIGmRCLxLN19J97/OEineafuAUUbk6lt87KurEX1vufthyeLyvvrls6L8
	ZKgTe9GSL5sc6inQecW62ew8LyVAn6aW0OVkXHr9Dta39X4A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bvrrk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:56:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-388b404eaa4so11475652a91.0
        for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 05:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784379384; x=1784984184; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AdR7vRy5XBtV40I2ljwZ7FKFKDRSO+UZ/5LcwdVSpBs=;
        b=eoAhwtWG473Gw5/NZzRqzkhJ5WZNF/dQfGTR0gs5Cg59ceflde8R7VL0lwO/1snwLE
         7XD/BdoLsZoFw0RMiiWIWnOIoDeEP+1GUvD81u/ym/c2bFY12LtpVBHKCzKwHE8dyu79
         ttN1qo1wJrjmf2RVJxzv1la/asIxW1uv6MvIZEp2i/BQTFjUvLw1+v1ltKcGAoOODD0h
         Gz3igmmMtYxdD+0JWR+zEPYnyW10SDcjMxt4iNbgvrb3wUi82H5Q+5Jfo+dK1PBCZtOe
         e7uLWJiLfdmQMFn7BD081AK6GOCgjDBizQuVtIcvVv0Op1y5WJyF24yi0BJJQSV4OI7B
         1FGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379384; x=1784984184;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AdR7vRy5XBtV40I2ljwZ7FKFKDRSO+UZ/5LcwdVSpBs=;
        b=AQPMnZQVnJDt6ge+5mbvMnItPuc05CP61txSgR3YIPOhu7gp5AOjREvIHSY3l3Nug5
         An7uKkVH90SwmEhuOpToM0DSgmUOe21+UQVIg81kQDTtcut4jj3VSRbqGFbFN0N7HF1g
         c1pPhRIqIoYMu1gcXcoTXBzAa2A7POpAsJzP23FMe1kA7NUpTySn8axZfvp/rku7GBJU
         cxYWN0VylwHVIZh/ZnVLHhGZraquZ45icl0ClghYeBcNU3eEdAAQq6y4nFgbgGSH8TGS
         QVp3eO2h27vLy9s1bzTfvMnlF4Sll2lOFlZ93W36BW3d127X2+4CH9JMZkYnK3sMz6Zt
         YARQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpq22nC4ssVB2otUCMSX/8lTXTqqqw0QjUW0UktXArXrhLE7Dz0nU3Awe17046fxRulmZttDStda+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhbBO1gtKgZGUop1mDd5ugc27Nu9LURZ8WA0nUDH/W8ZLBBi15
	0HDRVIUJsjiEX2h4YNbVKmS9ZWAX88ElmAdGf9KMjMmoov4KwsKECDXt6ASTQCjyafS+m0Cvgx7
	wRy7X0qB9sfD85uHsIhDzjPx0VtvcmFj6PZ7i6g1ZFH1MmpSQYP4W7KO6oSugCEA=
X-Gm-Gg: AfdE7cmjjuVSo0dYz3jC6WNoiGuumGS+HYFc56EXuCx6IhnGelZeELJZ++Gw4KS+EQv
	HvyiQxQfjsd3OWio5uUlYUz1O6wk6He1cc5b+Ma4cUW0yUZ7EeiTV1ORkp71jD98GqOSixrRJ5X
	ybYuu4nsZpT9lNQioxSXX+Fy2X+j2b1Ttn1iwkhPUb4vpiVuQFnco1W22Sek5ATFg7p4q6AQNK8
	HE6XmeYvxKBj76SPd70lQsx4fWQ5PcZWyGLm1BUHFm3aj3ji9wN+NSteUOC5EksFeh/boJ+6DA/
	AL2kPj81SiOwrG3YEDXirUKGCtiaBY3Bu0GnyGfcBmeSS3/kbBZrt4iwJ4udx4t0lqIU/eQ1aHH
	AZDYKC/OnsbTgZzDH3Lnas7n2Uub9poA=
X-Received: by 2002:a17:90b:57c5:b0:38e:2860:253f with SMTP id 98e67ed59e1d1-38e4b447cd5mr7158274a91.12.1784379384377;
        Sat, 18 Jul 2026 05:56:24 -0700 (PDT)
X-Received: by 2002:a17:90b:57c5:b0:38e:2860:253f with SMTP id 98e67ed59e1d1-38e4b447cd5mr7158234a91.12.1784379383894;
        Sat, 18 Jul 2026 05:56:23 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm14238910c88.8.2026.07.18.05.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:56:23 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH v6 00/16] clk: qcom: Add DISPCC and GPUCC support for the
 Qualcomm Shikra SoC
Date: Sat, 18 Jul 2026 18:26:07 +0530
Message-Id: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOd3W2oC/33Qu27DMAwF0F8JNFeBSD1sd+p/FB1kPWKhTexIs
 ZEg8L+XSQdnsLsQuBfgIcA7KyGnUNj77s5ymFJJ/YmCedsx19nTIfDkKTMUaIQGyUuXvrPlPpX
 BOX4YRpom6sahFCiiZrQ55BDT9al+fv3lHM4j4Zel7FK59Pn2vDzBo/3/yARccB29qSQoY1v86
 EvZn0f74/rjcU+DPdgJXyis1ykkqtEyIkEitu0GJRfKCFinJFEGHLRWVlKHeoNSr5RapxRRNQo
 VQWAjATYovVCV2PiVJso5kDUar7y2K9Q8z7+TkF4z/gEAAA==
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: _BAigbaexx-0zti_LfCa6aLYv_LhpF0y
X-Authority-Analysis: v=2.4 cv=EcH4hvmC c=1 sm=1 tr=0 ts=6a5b77f9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Jt_u-2xrBEiAwH-zeXIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEzMiBTYWx0ZWRfX7cEIL4aDRVpZ
 U5CwozxvEgBO5XDsRO8ksDfxzrcctadp8YQbhaL1A1C9tjkbJ3FE4bLPGjLk+bWHZ/ilX+IeOLH
 T7W7RgwjmcIKsI78FZJdY9K9y2AYQhRth9lgAzo67p7c+KeZkbwBXKyVT29kWj6r7QbjT2/Ecf3
 kbkfQtD5Gh2eul0tiEprZAtv0SyzoUEELV9Gc6CscQus1CJtp3zdvOXIejAKpzBH8O4VlCXchp4
 G1dDWQ1caiHrDM95FSi4Fore5AagkpLrDRaHD4EG71JpP3qaumEoErIBNyX0PsdWPLFZNjsqpWN
 Y8ruJQ794UxLqvXjLB/rt2Dqr2cylG9YJ4wdz0uWdqmANsUe+JH4e+ynjO2wN1tKpztt2o+8//Z
 aahwa2VHxo+55sXKALTXjwJFZ6tR358VO6KkVnu3Brq1fK6Ijq3eYeJN850rMgB3WAp1SAZ6sRL
 D70zwQaAFDbbVBvgEoQ==
X-Proofpoint-ORIG-GUID: _BAigbaexx-0zti_LfCa6aLYv_LhpF0y
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEzMiBTYWx0ZWRfX0siiTnOI8w8v
 1kR2WQVp6BLqmYQ7Q4QZfCsOxzA4imrugT90LqnVDCv2T7yoRrG/vZgUqVk5Jto+PBVExnf65Yg
 XEHWp62igsgJCGF97jvwwFUadK/J2E8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180132

This series adds support for the Display clock controller (DISPCC) and
GPU Clock Controller (GPUCC) on Qualcomm Shikra SoC, by reusing the
respective QCM2290 SoC drivers, and adds fix-ups for the QCM2290 Clock
drivers.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Changes in v6:
- Rebased on next-20260716, as the dependent RPMCC/GCC and Shikra base DTS
  changes were merged.
- Collected all Reviewed-by tags received on v5.
- Added the Fixes tags to relevant patches [Dmitry/Konrad]
- Reordered the series to place the fix patches at top of the series [Dmitry]
- Updated the DISPCC driver to use use_rpm, as required by the
  power-domain fix-up changes [Konrad]
- Dropped the additional external clock, index-based driver, and DTS
  changes to avoid an ABI change that has no functional impact [Krzysztof/Konrad]
- Updated the commit text for few patches [Konard/Dmitry]
- Link to v5: https://lore.kernel.org/r/20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com

Changes in v5:
- Collected all Reviewed-by tags received on v4.
- Updated the commit text of the bindings patches [Krzysztof]
- Converted only the critical GCC clocks to the latest clk_cbcr convention
- Reorganize the series into logically independent patches [Krzysztof/Dmitry]
- Added CX power domain support for DISPCC [Konrad]
- Dropped DSI1 PHY clock input support from the driver, as these clocks
  are not referenced by any frequency table.
- Dropped moving dispcc driver to DT index approach patch as the
  external sleep_clk is not there in the DTS, and no functional impact.
- Dropped HW_CTRL_TRIGGER patch as it is not applicable [Konrad]
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
- Modernized QCM2290 GPUCC driver to use common qcom_cc_probe() model
  and reuse for Shikra. 
- Link to v1: https://lore.kernel.org/r/20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com

---
Imran Shaik (16):
      dt-bindings: clock: qcom,qcm2290-dispcc: Add missing power-domains property
      clk: qcom: gcc-qcm2290: Keep the critical clocks always-on from probe
      clk: qcom: dispcc-qcm2290: Move to the latest common qcom_cc_probe() model
      clk: qcom: dispcc-qcm2290: Enable runtime PM support
      clk: qcom: qcm2290: Set POLL_CFG_GDSCR flag for DISPCC and GPUCC GDSCs
      clk: qcom: qcm2290: Add RETAIN_FF_ENABLE flag for DISPCC and GPUCC GDSCs
      clk: qcom: qcm2290: Update DISPCC and GPUCC GDSC *wait_val values
      clk: qcom: gpucc-qcm2290: Drop pm_clk handling
      clk: qcom: gpucc-qcm2290: Move to the latest common qcom_cc_probe() model
      clk: qcom: gpucc-qcm2290: Keep the critical clocks always-on from probe
      clk: qcom: gpucc-qcm2290: Park RCG's clk source at XO during disable
      arm64: dts: qcom: agatti: Add missing CX power domain to DISPCC
      dt-bindings: clock: qcom: Add Qualcomm Shikra Display clock controller
      dt-bindings: clock: qcom: Add Qualcomm Shikra GPU clock controller
      clk: qcom: Add support for Qualcomm GPU Clock Controller on Shikra
      arm64: dts: qcom: shikra: Add support for DISPCC/GPUCC nodes

 .../bindings/clock/qcom,qcm2290-dispcc.yaml        |  15 ++-
 .../bindings/clock/qcom,qcm2290-gpucc.yaml         |   4 +-
 arch/arm64/boot/dts/qcom/agatti.dtsi               |   1 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               |  36 +++++++
 drivers/clk/qcom/dispcc-qcm2290.c                  |  44 ++++----
 drivers/clk/qcom/gcc-qcm2290.c                     | 113 +++------------------
 drivers/clk/qcom/gpucc-qcm2290.c                   | 102 ++++++++-----------
 7 files changed, 137 insertions(+), 178 deletions(-)
---
base-commit: 1a1757b76427f6201bfe0bf1bea9f7574f332a93
change-id: 20260513-shikra-dispcc-gpucc-6f59c23020f5

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>

