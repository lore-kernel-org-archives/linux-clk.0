Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1124C3C6608
	for <linux-clk@vger.kernel.org>; Thu,  7 May 2026 17:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778173720; cv=none; b=OZJ10bB3WNoZD0IHukthXJ7UgkwK01mt0N9VYYtkBfHelt22Rk4Ev+PHhNj2npHWs6bII76JxqiNpQf6KF3spvCHEcf0pUD5Q9eWltQ+I0v98Wf3wsapqCAcZoe/PECaMZGhQYl51J8pxVd5hZCdusT0gGYbVBC43pMUBtJG1Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778173720; c=relaxed/simple;
	bh=iqVsyYlA+PkqKzWx8JHLx4T3/K9tKA/nyf40GvGZSeI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Agvrwy7psT/WmAd5v3mYqOnFl2dAEm43X/yAkjOclEc3iutcYPtAfVs6gFTx24tsHOKEDAzd6UL2lksZu0JreaK+nLrN9XRjuAQPUTDp2+JyOF9zoTQDrlFj/zYqZK5kwi6JAiaWEX7bRHMS4KDOtj5jQLS7yCk0nwjFQW+iBnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DrlOAxb7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y1kIs6Np; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DrlOAxb7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y1kIs6Np"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647GrYrc879574
	for <linux-clk@vger.kernel.org>; Thu, 7 May 2026 17:08:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hQs9VzGCGguaVtEJTIdHQJ
	wjgFMmJ7q2cn+ev8SAwEM=; b=DrlOAxb7taVvlcJd7WjM3uKSSJXcNh047NzahG
	I4S7Jq43FXUVh+tV9rorTcLjXYvP0E+DIjHkjV7vdfP6w+tcdEY6kTwCdIfgtefp
	RS/a3b5V+V4bDoVLAZI9qWpjDkLjc0jyxmG8tYAb94lpjKbrfd6r+RC3T8UQbyj7
	l7RbNvAJcOjmk2hJuUCphNOwvV/JLoxZGgD+Sq3+iWvw/t5aFjxMbfIDMNLD287I
	CyyTbNl8e2C0KBtgWrjReleye7dFnlcaBS0fTNWEuG8dAabkj9NR26UNe0xnm5fG
	E4k9DOgjfVfsrK5W1mOQKUu+Y46z3lqDrCuH9GoPlHP5LXTA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kdq2yt6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 17:08:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba86e35aa1so16625085ad.1
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 10:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778173717; x=1778778517; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hQs9VzGCGguaVtEJTIdHQJwjgFMmJ7q2cn+ev8SAwEM=;
        b=Y1kIs6NpWDS3cDY1065Bwg9SoujW5B97WTSJdPrEZp19CvQxSPLDmj2T9EfTeIr7f7
         bP0lcHBzxPtgpWCC/p1GRC15apXZzsUKdmj5+UTNKhVVTcWdZaYVJav8QmTqc5Dj2bs4
         xg/y6GpGwhJ3+xt+W2tgueZG66Z6qPRpsgCgEqT87QEEmPFnNInsA6ICa9rcY1XXfKLt
         PvsaWOllQcotbQseirfXVz6YtxdWqxVogh7qfZBjb+AsUyA3rAG2gl5stlXKozu5axzo
         O/JH5FhUBA+W/XhwH9Xu6CIdnHD1h5Xa7gMitIOPmmOSRij5TJERM3UfKdmrwSrNELaV
         fjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778173717; x=1778778517;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQs9VzGCGguaVtEJTIdHQJwjgFMmJ7q2cn+ev8SAwEM=;
        b=SIDTEJ07VQmnFpiAcJv868Nl/MI8GI6gUAyyTmVvukKayfV+aBQjPAkan/yi50FS9B
         N+ttGTMnO4rEgA3sSemKNaO5uvdTqBYZHLTRMarPeEBFRhUN4Z86RcBj4C2fUuHYvfD/
         7Mpt+66EqRxi3207htm+fi3oN9lr7DfaWvbubEzqwP/SiI0vA3uLN5NQT5bfZLGZkXEn
         x66q00sk74saOFNTqwWvYgMVgYu+yhuxtzDdR87pjFXJZyCPkCIYd1iSdCS1hga4jsXs
         aG5N5HOAX8USyvOUQM2dm/jTm3+5NFQTP2WT6RwZ+4qLI91TJjvnVauKacK6/Cz9lrBq
         cwhQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Yf5Qx8n78xtjd7VOb+K23qGHNLWLwSUSvsJ2gMHDqn/GAwk5zV8/YVS9FzHk6t0wyLDKrJe7ibmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxdGyVzjJzjzSEFzkiR4S488UxfrkykYZoLE9XCOewAUKAKCeZ
	Dh4Bgsn+WMkYbAvZW2IBEr2I6/mEBAr7rFp656oMclhk2DJlWRD0hXTyr9wqnXjJ3h4aiIOPvhP
	x89vLKMuVj8BlJ3P/andPHi8MLAzX5N7b9lDg5sL20/+prpMte6KIj+pGm9twi9E=
X-Gm-Gg: AeBDieuLgVV4kAlRdOFyDX78lrGUgNzovqHQU9pm6zm90kIudfNe6G2KZZbR9PNG11J
	yUJIwhFrcruxcS9LtqYnTMgByzOiCJilLfN881uYRxBO2cwDsWqA0YI3TQoOWRKJWiBVk/zxMxF
	rtgaR0DMYxU3kJQK1Z9dwxKcvgSRy3+Z/sCNVGY0EKrp5agEckxbfKglGu2XOBnz7ynTHJPnpqo
	X2y0y2TFxVmoW+DyXXLJhKBitdTocwfTDVcamnPCdn+90IOQEWr2nJocsWIehstq4bZn2kdU4z/
	BOV0vcPtabBnWnRJVLNmYwQPxIM8dWCM9/3na1BPxbM8JmxO3tWOz693PXM1zhpJ+LbQshrSgYW
	05rmd47svHj/f4gz+HLGwM+V15hutH9GJqsbVf9yb1Rf1yi2drQe+p/8vN5AgQySrJUuYJH1wT6
	OW0IKZ93yG7+LKD0HVQbJRSIZqli1sLrNp6mcijQWqzyu731K2guJrfOtT
X-Received: by 2002:a17:903:2904:b0:2ba:85:5827 with SMTP id d9443c01a7336-2ba798d3e99mr64873375ad.26.1778173716975;
        Thu, 07 May 2026 10:08:36 -0700 (PDT)
X-Received: by 2002:a17:903:2904:b0:2ba:85:5827 with SMTP id d9443c01a7336-2ba798d3e99mr64873085ad.26.1778173716367;
        Thu, 07 May 2026 10:08:36 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bae78751fesm2530455ad.73.2026.05.07.10.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 10:08:34 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v3 0/4] Add minimal boot support for Qualcomm IPQ9650 SoC
Date: Thu, 07 May 2026 22:38:26 +0530
Message-Id: <20260507-ipq9650_boot_to_shell-v3-0-62742b49c991@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAArH/GkC/3WOQQ6CMBBFr0K6tqSlFMSV9zCEQBmlBih0CtEQ7
 m4BE1duJnmTP//NQhCsBiSXYCEWZo3a9B7EKSCqKfsHUF17JhGLEiYEo3oYs0SyojLGFc4U2ED
 bUi4zFqW1jM9KEX87WLjr1957yw/GqXqCclvZN2FhnLzQ/WKNRmfse/9m5tv2EMdc/hHPnDJai
 RSqWImS1/xqEMNxKltlui70g+Trun4ALWXOVugAAAA=
X-Change-ID: 20260330-ipq9650_boot_to_shell-159027d548cc
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778173710; l=2791;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=iqVsyYlA+PkqKzWx8JHLx4T3/K9tKA/nyf40GvGZSeI=;
 b=+2WUeZSlDg8W4QeAuP+zv3zblPxROagGLKrDwEnEOdN5dBrguD7qg8fiS0t/iqPaSztHjbjk4
 4C76MlY9VDkAhHTaSpkVja1iGtM4dWC44oPATfjaY6E01++a3nUX72v
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=P6IKQCAu c=1 sm=1 tr=0 ts=69fcc716 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bC-a23v3AAAA:8 a=YURS4O9UCPS1-Wi1IM0A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: qrCZp8MmYNlzneWM8ejgyT31Dkq_NuHF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE3MiBTYWx0ZWRfX+gXn7zWV2vZ+
 2VhcvYyUPNk2vcbQfBopb57c3ybVrcpGLVaXgdrqWzElivpOhatEqlMvWSHIxARQG5xWq3/DXT8
 rPkjA0MtcXZWFUVrefqHmRJ/k7jz5kQVOaAQF3hpE7RIf0uRRdyGDwWVPDeODytXvqNg/RVeLAY
 bHEI/6mg+iLElayO01srHnmpVBd7KV1xOqIO+FI9iIozmAU2FxeXTZFLb6coS16OyRTrCL6zaMZ
 PiS/LulspaAziThYXa9WREhTwU1UToAHHjIeyWab+gHfmB73tDWoUqW8KiuKTaEClfNUmW1p3sK
 0wd6eeqAauG4SDG1RZ1fqYPeq4hCNUWRHI9x1jkYUMNSR1P+barMCz5iMbWjwlG07XY+OCLE9xN
 gONRYfsBO5jXRoGWhjgYKsezcPmCde7vt/FimF/pqIlp/D3ow5ymiVEEAdN4sWyAuR5mzYAw0S5
 r5izzpgO8BwmtIL490w==
X-Proofpoint-GUID: qrCZp8MmYNlzneWM8ejgyT31Dkq_NuHF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070172

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
Changes in v3:
- Added \n before the status property
- Rebased on next-20260507
- Dropped the REFGEN, PRIMESS clocks from the bindings and the GCC
  driver since the ownership of these clocks are in discussion. It will
  be added back if Linux needs to play with those clocks.
- Link to v2:
  https://lore.kernel.org/all/20260429-ipq9650_boot_to_shell-v2-0-9b0dc3d1f3a8@oss.qualcomm.com/
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
 arch/arm64/boot/dts/qcom/ipq9650.dtsi              |  377 +++
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/gcc-ipq9650.c                     | 3445 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,ipq9650-gcc.h       |  172 +
 include/dt-bindings/reset/qcom,ipq9650-gcc.h       |  215 ++
 10 files changed, 4373 insertions(+)
---
base-commit: 17c7841d09ee7d33557fd075562d9289b6018c90
change-id: 20260330-ipq9650_boot_to_shell-159027d548cc

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

