Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9156435CB70
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 08:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773823197; cv=none; b=Eg0yPih+LzGGyolQ0xj+DBACMmwAZqkmR/MUrXXCCURTCTt2JZIn3RbRneuonAHEHX1oe2gHSkikmxn9ym5/cQuNuozre2F2LyxiD2orkwilbdKU3ON4RtxG++Gp3aUmZdN4o61nef0uZF0dtgSFCfd7ZMHn7bSGAkWrpuvlTWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773823197; c=relaxed/simple;
	bh=8KLemRvyA8U7Tou0b+aUT1ILPtwWJUdfQLe7MtExwhY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WEb/QaRxmTwV1Mzdl177ErGDe8Lnf6eZrJRlcQpmxRj3kWoWm5IY5cL87vCDLKP3U8uYfDmrtkvxCbj0jFYeLSQWGA95f3C4jXSS0bJDX+f7Hmw1SE+E4ODgmvLIjKuhkfM1jXIP/7XRFzK/AB9VofAcN95fwXDhjkq0DODQF9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mjXtbTiF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X/4uOf6V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mjXtbTiF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X/4uOf6V"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I2AVmT3281113
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 08:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2xQdqFYF5upcTZwVd+odhw
	ePsv9KSOASMh+UY7siCF8=; b=mjXtbTiF3rIa0VXcm+N3PNNjzdWXuKdS6tZBN/
	BJN6gZNL1T+0faACyoaJIM2OV6Lx8lD/Ilq8Jn/zo81X3YT0fI3SqXRUszPiyXEB
	qqVcCUkCJ6LVHnfkkmLoS+JH6R38dG/KI+x8k+rWaraDNV+6qmVP/0/YHEAL1mQQ
	wkXmMUU8xMl+9OP/0A+a4fhe9UVSl5L+2LRUXeBmhlLYfwAY9Gm0D+I60WmmA6iY
	T1pDyTixMXAxAGqeHYZBbIiW4hPm+urR2FaCfMGzODX9HUa/tw5P5Nhaz4J3jF9C
	pTLT/gpvoUNl7EgyDpfHwKtNRsKzZnonVsiILDSr71viBzdA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cya62uhrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 08:39:55 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82a5ee4a9acso981559b3a.1
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 01:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773823194; x=1774427994; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2xQdqFYF5upcTZwVd+odhwePsv9KSOASMh+UY7siCF8=;
        b=X/4uOf6VYnRkCPITWWUwc8+2MTNBvQTSBCIVBc+3xS7yM3+zPBCxfqI0R/KknVxKBs
         KlGjl1PmjtKb2hMjxVNz9jfuFRgE+rC55me3yzbBzUZHC2fJYx3r99OMny4dJif2FG+E
         STu4OEGS4v81KYMpYAYuaimMM8wHARMat+f0r1CQGe/UWNwoy8eIaUxtbaKmiasI6GMh
         yXQjeS2cmPeOThFyfjT0OkjtodFlC4/zaB9x2gYK53QW6rmSgYPbojJEvCfpMTYYaVjB
         yz/uE5M8jgocRsAfn3GNJUGT7dSCKPnVO8eIZSSdUjIrRK7jsRwKqHr+xtd5zGz2z/qb
         qeug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773823194; x=1774427994;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xQdqFYF5upcTZwVd+odhwePsv9KSOASMh+UY7siCF8=;
        b=ZhKYyaEDGF2DMmQn5Z6iNFuu0GO/5DOzGxSZW5OJwURGcHMU3u5bY4CfIXi/hjsUwp
         7MpJ/BSJ+YZs2fp1zWo9xhvwI8d7LDNSKaUrtU8rPzY/Y2Ow8IcNiPzturF5w0GmLT3e
         kAZxY7U951kXcFdQNYNwYYiyhQBLKzGGIdohLJlA/NAfGeO08igEAhF2hVdmPQIvOfcz
         Uo6c5b7GiDZ65pRgcH5T0ABdz55PqsAEN/uOskcunu4dGqH+TIDHt40c0pkxUywHL0ii
         CbLi2C1NpPgDvLEkExYvnqau93LEFFPDw+FKccNLrIxu0/qfgOoRu2JN4cTbB7GRpfez
         ETxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPHdClYAN8tfjbIvST8hIO8z1bcHoV3Rp7NFboOFwpsLubDVIFz2hIPkA1t4O/FjgJHmfE21g/HyI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZHL/GHfRZuYsx+jxRdxSb8zY49MJAqSBlNIXYYalm1Tgn/5ZJ
	pxtPSCZdutvDYlnL9VjOVv0dSMdD5j+pSsg8lZvmQcWj0ptujwcCmB3RYg1wWHbENNk4bz2XaXw
	HWpiKQEzKL3ZaKjVayXluyAeBoaiSTjxU40jS6EyktHvvBYtEdbG1Oo41J9fSpp4=
X-Gm-Gg: ATEYQzzHiMN7xn6lOgi7cFSc/z7FhZntncVSGZJVEmQtB9hz49qccr4Sp/xrLW84CKX
	0V37VHimKZg/xOUKtAwpV1f6+Lsd6xssMNd7w3wVOBPvo4+m16OgK8XnHKVaI5rDIjosy47Ft5o
	+iwWoUMFUDG6E6XsI0JUknwU5kLhLaIfyLw1dmC5xgCLk4xDB5HeXvJzY9MI+f+Hy/rEIHHqblk
	UT8s/2omR+fJ++x+MoHfVpeq7qLHu8UgMMWYiI1H/iILjv3Huv1IpenW1vIS1/uXqdytrsoTsCP
	aHMvpC1Q17iGvQpInwpzc60iHwJjTN/nl/8mgYxVGHH+JyKayYNuMOejwbjrdLZhGLQsDGJThf6
	1ejNI2nvPcwnWNYKd6D2SsTL+Bl/UZ/pCyGVVN9/1KOtVfsyVe/sB2eEhw9/3vV5XzE/rQablWI
	ddbnWuL5PhdHsOdmqfGuFZyBr2yJeYvDz347i0z5SFG7dF2WwjV2gBKM2K
X-Received: by 2002:a05:6a00:1749:b0:82a:8aa:cbb6 with SMTP id d2e1a72fcca58-82a6af35779mr2068499b3a.55.1773823194274;
        Wed, 18 Mar 2026 01:39:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:1749:b0:82a:8aa:cbb6 with SMTP id d2e1a72fcca58-82a6af35779mr2068474b3a.55.1773823193772;
        Wed, 18 Mar 2026 01:39:53 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bbb2802sm1863498b3a.31.2026.03.18.01.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 01:39:53 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v2 0/6] Add minimal boot support for Qualcomm IPQ5210
Date: Wed, 18 Mar 2026 14:09:42 +0530
Message-Id: <20260318-ipq5210_boot_to_shell-v2-0-a87e27c37070@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM5kumkC/0XN7wqDIBSH4VsJP09QS/tzKxGheVpCZqmLQXTvc
 wXbx/cH5zkHCuANBNRkB/Kwm2DckoI9MjRMcnkCNjo1YoQJkpMam3XjjJJeORf76PowwTzjItd
 KcMHLeiQo3a4eRvO+3La728P2Sny8x7+enl02LX92nK3FemSMKqCEK97s7KsqGQAPzloTm6wCL
 ouyUkILibrz/ABCLW8iywAAAA==
X-Change-ID: 20260309-ipq5210_boot_to_shell-43db656579f0
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773823188; l=2901;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=8KLemRvyA8U7Tou0b+aUT1ILPtwWJUdfQLe7MtExwhY=;
 b=Ij908p/ruhzBRYl3BcnS/46dbjz231JgW+ha2Vw5SdAn4uvlP+QiBQ9WrXueT8sCPSWSGM1tN
 arGAli6ZQ0bB7cquSTiWGQG6eDBt5SUPDYvhS44iBMbaUrsTJBOLWve
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=Ns3cssdJ c=1 sm=1 tr=0 ts=69ba64db cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=iO1PHWQBdAPoGl4AmagA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: eJPY53E5gV7C7Ku_3-1ZoRlLzyhTXCe0
X-Proofpoint-GUID: eJPY53E5gV7C7Ku_3-1ZoRlLzyhTXCe0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA3MSBTYWx0ZWRfX8D8ZrI74y/pd
 9zIbNIyuHO0+MP1GPpUzjq6/k214qhYhkTmHuobGkgkL0hxp9XvdeUda+i8NBu3aR8oBCt7xRgW
 K8SfEgYM+3oTdo1HQFPdkZwFYf0qN1mx7E1p8MAY0Hk2h75tMrBOvfI2qsCOiwuhtp8zARxk7Ri
 VQ45c7ym/HFjGmKnKAgXzlxH9vIDj7Xt5A+CPiSJRRJRBqQNxIAdKW0OzZwoafMJYnEduaa6FqA
 /A9kVnWoepA7gKyI+cyrNKgPQwzyfBIOBK89/KkcuLR1XkD7TkpT/IoAtQ66A9gGF1i01/AbWCO
 cazS6gOi5ty5v3q5C+vL1NcOaV3DzxbBUKAMKP0X6gOazGuZ9lZq1bWXwAIRbjkfwA9YBnMWxdG
 nakoR1h4+FeFg/HeMR4mMdvn+Gw8HTEOMPjr7lJ/dyQScwAkM55oDkRG3lA1luagElCRn3p/TO8
 NtEUVN5zaOmOKnT6AKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180071

The IPQ5210 is Qualcomm's SoC for Routers, Gateways and Access Points. This
series adds minimal board boot support for ipq5210-rdp504 board.

SoCs based on IPQ5210 is shipped under 2 different marketing names such as
Qualcomm Dragonwing F8 and Qualcomm Dragonwing N8. The difference being is
F8 parts has the Passive Optical Network(PON) interface which acts as the
backhaul where as in N8 parts it is ethernet backhaul.

Qualcomm Dragonwing F8 Platform:
https://www.qualcomm.com/networking-infrastructure/products/f-series/f8-platform

Qualcomm Dragonwing N8 Platform:
https://www.qualcomm.com/networking-infrastructure/products/n-series/n8-platform

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
- Separated out the TLMM patches into dedicated series
- Dropped the extra ':' from the GCC binding
- Added a comment in GCC driver for the need of CLK_IS_CRITICAL
- Various cosmetic changes in DTS (inclusion of dma-ranges property, \n
  before status property, lower case phandles, enabled the QUP node by
  default in the DTSI)
- Picked the R-b, A-b tags
- Dropped the SDHCI binding change since it is applied
- Link to v1:
  https://lore.kernel.org/r/20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com

---
Kathiravan Thirumoorthy (6):
      dt-bindings: clock: add Qualcomm IPQ5210 GCC
      clk: qcom: add Global Clock controller (GCC) driver for IPQ5210 SoC
      dt-bindings: qcom: add ipq5210 boards
      dt-bindings: firmware: qcom,scm: Document ipq5210 SCM
      arm64: dts: qcom: add IPQ5210 SoC and rdp504 board support
      arm64: defconfig: enable IPQ5210 RDP504 base configs

 Documentation/devicetree/bindings/arm/qcom.yaml    |    5 +
 .../bindings/clock/qcom,ipq5210-gcc.yaml           |   62 +
 .../devicetree/bindings/firmware/qcom,scm.yaml     |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |   86 +
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              |  311 +++
 arch/arm64/configs/defconfig                       |    2 +
 drivers/clk/qcom/Kconfig                           |    8 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/gcc-ipq5210.c                     | 2661 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,ipq5210-gcc.h       |  126 +
 include/dt-bindings/reset/qcom,ipq5210-gcc.h       |  127 +
 12 files changed, 3391 insertions(+)
---
base-commit: 8e5a478b6d6a5bb0a3d52147862b15e4d826af19
change-id: 20260309-ipq5210_boot_to_shell-43db656579f0
prerequisite-change-id: 20260317-ipq5210_tlmm-df221be105b5:v2
prerequisite-patch-id: 459d23e18bb8cbed98775775e4e330d9a45a36d4
prerequisite-patch-id: 7ed57adb6c96a0c74f5a13321770595919456ac7

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

