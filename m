Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C69D25A642
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 15:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777476278; cv=none; b=fScYeMmM/7xbqVrqv2QRLs3TL7MwBisv8VPz4NUo2/UONQT7Pl12J8U9Fj7KaDZG5po3598w8R+qEagKLprwbKX5z3w2DFNznHNTzREYUuns3XV9okLXAS4ThxLnjkXp0ZL1wzPHUwmZhOH8gMLmAiUJuDmv0cPxj+dUxPN5S7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777476278; c=relaxed/simple;
	bh=h51VaY30oVcgyb7vKdtI6o+pR2fhhkIjNYTH8SmpLGE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o9sZASwaNakphY/g4RAoTvyxTnKE5BYB1zRcH8ijCjt0moRUf6MLaw2LbSx2z/BQj2Cj79X6ruLsTIWn6v1hOyvBJaYpImRUh9ZsUPUI+htRTexTuoAzta/g5EFAqipNXtNB/FkjU+qNJJH1kYWWEt4NZRqFDXCGKMywmwMe1M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hCS8DjRA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Otfvzw7k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hCS8DjRA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Otfvzw7k"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TCebHf317184
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 15:24:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=118uGxkt14xVAFSp/1myEl
	ZrUnbYKTC4ie0A82Gcl5o=; b=hCS8DjRASIB8yzqFc09R19UgU9SH6Vmr7C5UQH
	Hf65h7oycDWH8AWI4HjQ7PxO7OG845tGXjsWxbih5RZWP1QBn8KFCOUoWEpYPSzo
	5cGwnbmtttA+D7AMSqv/fMC9bu2cBj3VhE62KTMEgdAHepzxrqQCJps7RSR3lBq9
	QPZAk1+mAPEFjexWE5TltHqAFU+fOYDs0PHuNZviQLPyub02f32k6+ooHBRjWqDJ
	KqseEfoIdbp5Eqjhu/2mCi9Y9ozOQdoypVIJKDmvZJDcIUMorARq5Y4TKK86mw6P
	XRaiwQMrJ/D+LkK+toM934WIf9XCZdHKoCvAp+a5WvVzghow==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duj6t8ktt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 15:24:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-362eb03240bso6069216a91.3
        for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 08:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777476276; x=1778081076; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=118uGxkt14xVAFSp/1myElZrUnbYKTC4ie0A82Gcl5o=;
        b=Otfvzw7kmhh+6R1vqrviIvkjxVpQjoTXdxCmELpEGf0sqvW0nVECLo98/bDbqzuNac
         3/HBjHutVlk16tzNRYiL6gGnqRaTL4gv/jl+xOUzocCfsYTeK7K/buMSYLFvLx1l6hBt
         HSPX3SMf/qFHxl7UWb+/WWZBZsgbXP8+UnlXf1QdzM8gurvenc3IhthOhR1W84uyQ3fL
         W/smvMYXbai0CjnDezKK6iA0QAQR1SsagUaSxlQR5IZ1kEG2ityDHTkEJ7WxqDxE3O+f
         d6Ef0neRqVK/26CYEM7dpX4PF9/IciNzHS0dLE4BwA63Z+CYoHXThQYE5Gs5IA3QYIPe
         OH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777476276; x=1778081076;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=118uGxkt14xVAFSp/1myElZrUnbYKTC4ie0A82Gcl5o=;
        b=nJ3tkQQZuWY6jS/5Ma1j66qB5lNaKGcgicM2xLdge4IAMeGvO/BHlo3Ow5vBrbdK/0
         jo0uf5eYhglnfEB5Bg/KGPIFiJC6J0w1sGWUrQARDndMlVpQxFnPTFryxmkMXpnHQ8VP
         pskbJ60dJqGUPvb+YvwtfDtqa8m99hAVpyKuhQ+79uTDQLghpepxqtTxC+TIfT7qsMBc
         J/vMWRzzrE0nxZNSeZiI/jwb3EjuRG9U7JMsJU9Qg1Dhz79zpy4qwKBe+X+SSdrTsahT
         wjCDNfYWPWBp/wm8CuJQ3g6TmhT8aTOoXGc3fNBMnimrF8tSR6sBw/dpyVVKN+QiipGR
         PEXw==
X-Forwarded-Encrypted: i=1; AFNElJ8qCB71vRIC6eJF8xvdVIWYofTJpCHljsAbv0VJtLQzL3006qm4OhBNKoYTQ08GEQr/g1l11T+45xk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlsUK+KmE3ei6/FzsD7yC/yF2gp9lRy1y757mBIw+r3s64T7yr
	PRrhrtShqD5EOQ8jRDRrqdsAM8vd/Djq51M/HKe/FKVTX904XuSGcXuR5mVvZG819N2Km0rbKjC
	5QKMjOtgDNfDaLZoBJsZaP43kxGSiIxU88lenvrNhQjqI/FGwg72lBg2RJFB1NcM=
X-Gm-Gg: AeBDiettVJG/gYLxIACV8pMyHt2dfL3+JL1UVYdRFYdqu3a5bVDhlJg3CSmInB6Mqtg
	7dK9KAGBPLgxlSFQiQ8FNNAK+rtGRXFuon7CB7QomddbjQeW4oM7xhUQS8OiEkW54P9nuJKQ0pY
	Ptw23hyPM5VvC0WIPXcJ7LdZ+xy2GgWQJLl4C/TiweEwbUK/IBBAN7Yl8F3Qk8UyPuUX7McVRnq
	YNXb+2nmgLo/CoLkFaHjWnrScyRYpCTFgfuceTU4YzzW/bUI+YzIlg11XRGzY2FYktdJOoWiH1u
	ybMXW0ioVrbpc/toany4DLXyD2evx0DC4S8nNhab4OGjQ8sJ/XCxSJQf7W5LG1nvstZlvkF2Xpj
	aMmyuAa5WTeUNzKhILLkh+bYaX0evKhohkgGlwupWB0AhuX0lTIDflgJR8kn3CrBkxi2SZ/8rgr
	XJxVYidiiszAF6jumc3jDIXAMlPtV+q2qniKMtoz8U2QUowNpSf5qacU6eFK3AzSOvQbE=
X-Received: by 2002:a17:90b:3e88:b0:35e:3103:d4d8 with SMTP id 98e67ed59e1d1-36491fbf185mr8336436a91.6.1777476275964;
        Wed, 29 Apr 2026 08:24:35 -0700 (PDT)
X-Received: by 2002:a17:90b:3e88:b0:35e:3103:d4d8 with SMTP id 98e67ed59e1d1-36491fbf185mr8336375a91.6.1777476275209;
        Wed, 29 Apr 2026 08:24:35 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364bd588ad5sm66732a91.3.2026.04.29.08.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 08:24:33 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Add minimal boot support for Qualcomm IPQ9650 SoC
Date: Wed, 29 Apr 2026 20:54:21 +0530
Message-Id: <20260429-ipq9650_boot_to_shell-v2-0-9b0dc3d1f3a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKUi8mkC/3WPzW6DMBCEXwX5XEf+wSZw6ntUEVqbpbiCONgGJ
 Yp49xpStadeVjvS7HyzTxIxOIykKZ4k4Oqi89csxFtB7ADXT6Suy5oIJjSTklF3m2utWGu8T23
 ybRxwHClXNRNVp8qztSTf3gL27n7kflxeOi7mC23aw34cAeclA9PL9sfL+IMm9C8tjdNEBXCLU
 Ore1rxZ+Z5iICK1fppcagrU2IOxDHoLTORdaAkGlJS9VF3NOK/AiLMke6PBxeTD43g8Z+0FDmr
 J1T8/rpwyamSFprQSeMfffYyneYFxL3DKg1y2bfsGxPiNiFMBAAA=
X-Change-ID: 20260330-ipq9650_boot_to_shell-159027d548cc
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777476269; l=2587;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=h51VaY30oVcgyb7vKdtI6o+pR2fhhkIjNYTH8SmpLGE=;
 b=2hG2KNlQlYc43LOvAu+LsUXlN8aSGKMmZnVCRA86UUf/9x6yN0vWxB55QvPmHtVml2Ke8H10G
 +gVBIbNdvudCoqFgEp4/VSUvZNRqq8u9U3iGlM7Oqi8HPy+iSM3p/1O
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: y_tcC5Z3esqZYvpydv2aQ-3KTSnTgj3S
X-Authority-Analysis: v=2.4 cv=KcHidwYD c=1 sm=1 tr=0 ts=69f222b4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=YURS4O9UCPS1-Wi1IM0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: y_tcC5Z3esqZYvpydv2aQ-3KTSnTgj3S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE1NSBTYWx0ZWRfX6d0+sfHfKWrH
 f8YNC1OITe/mGrZn/6BjAydPS4fRFuffo/ey7HdhRW4r4vu2yGc2v8QHDtuCKxaOCvxuOT/GR65
 CggkqG1sACTf1Xo245BJcxkWCGfUbus0gK/TtkZSsj9141HcuI66rmaOO5Aeckiudkpi2lRE3MD
 pHr1EOOzePlxVZr6Q505xD6/b1tSrY8PMMqGAV4UcTgEYSk6ZmLAFg8qfpZpMjNEdK3Qjk6Y2P1
 GS45cWHuKztEo/VNx1bzmWhELBA+S0ySal7EjSl2VnEeM7n0St83VeVGlZv5ihoSk2hKtjTE8Ce
 pf/NBzNrLNVNW2dHjkh7SzC2nXPyjIG+iLaqzBr0bB+8/fYzoKFGW7JZD0CRg0M27i7U4ptRXvc
 NU/MsmB31+WVL4lVQDXGZIYZK9CEmchTACol7WSAz7V9Amh2xgeGnISZjZ9HV8oBXsage7qUraq
 bm0ZPlcYAhVoA3TOXYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290155

Qualcomm IPQ9650 is a networking SoC targeted at routers, gateways, and
access points. This change adds minimal support required to boot the
IPQ9650 RDP488 board.

Compared to earlier IPQ SoCs, IPQ9650 features a heterogeneous CPU
configuration with four Cortex-A55 cores and one Cortex-A78 core, a
2 MB shared L3 cache, SMMU support, IPCC, five PCIe Gen3 controllers,
an integrated CDSP for task offloading, enhanced PPE capabilities,
and DDR5 memory support.

More information can be found at the product page:
https://docs.qualcomm.com/doc/87-96766-1/87-96766-1_REV_AA_Qualcomm_Dragonwing_NPro_A8_Elite_Platform_Product_Brief.pdf

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
- Collected the R-b tags
- Add the ARM64 dependency to the GCC driver and enable it by default to
  align with Krzysztof's effort to cleanup the defconfig
- Updated the GICv3 interrupt-cells to 4 and added the ppi-partitions
  and hooked up with the PMU instances.
- Made the labels to lower case and kept the \n before status property
- Dropped the defconfig patch
- Link to v1: https://patch.msgid.link/20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com

---
Kathiravan Thirumoorthy (4):
      dt-bindings: clock: add Qualcomm IPQ9650 GCC
      clk: qcom: add Global Clock controller (GCC) driver for IPQ9650 SoC
      dt-bindings: qcom: add IPQ9650 boards
      arm64: dts: qcom: add IPQ9650 SoC and rdp488 board support

 Documentation/devicetree/bindings/arm/qcom.yaml    |    5 +
 .../bindings/clock/qcom,ipq9650-gcc.yaml           |   68 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts        |   79 +
 arch/arm64/boot/dts/qcom/ipq9650.dtsi              |  376 ++
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/gcc-ipq9650.c                     | 3795 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,ipq9650-gcc.h       |  190 +
 include/dt-bindings/reset/qcom,ipq9650-gcc.h       |  228 ++
 10 files changed, 4753 insertions(+)
---
base-commit: e6efabc0afca02efa263aba533f35d90117ab283
change-id: 20260330-ipq9650_boot_to_shell-159027d548cc
prerequisite-change-id: 20260326-ipq9650_tlmm-2a1cea46fc91:v1
prerequisite-patch-id: 13d4c96c03378602b50fa7a976e57f97f960b018
prerequisite-patch-id: fcc2de8f1b615b06fe2e509bdcb1ffd719274dc6

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

