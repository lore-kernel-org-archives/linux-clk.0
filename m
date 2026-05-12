Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E4B13AD05
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 05:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778562779; cv=none; b=bcn68p/YBonXDgqJ/NRm4E73/E1kL/JYc5kphLV9yP2nI/eLIf+q2rBgDYdlteLQZPJDhxQWqOriyyAzuRLMoOBgfyzoTEqqnMwyA6YH5AFNWrKSieYKqQdHM/ClYRR/tNEzC4/DbMKa55iZWW6ZiWKabvOFJdF2pht+YnVyJf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778562779; c=relaxed/simple;
	bh=XAAdVzRIgG1++KpC6o+mUhQKjjhsFsPBjnBt299X6wI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Sy0V8IL72RjmZoqbD4pX89hBB9WWeez6TnKQlkJ/1WIZaINgS/HbO883VqRlamw3iDlQhooEUNv0aHNd50JgpXNJbjw5st6C/WmTkO7kZmaB1cN1on939JRGAUPBaWjel2VlI8XSGvZfZWUNEifHxW63B/n617R3QkZ5yQstVVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WK6pPZ6b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UAxi0Cw0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WK6pPZ6b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UAxi0Cw0"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK7sNg2172407
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 05:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fSI/j7IvdCFik5UD++CGec
	gmmuHc0Slj/zGvA6DAlGU=; b=WK6pPZ6bcajgpPYcj04VqPxa0agUE1oBCXH3i1
	JUH0MDfUONYNYXbRuTp5vYl2BRBYJ+Vvk0nnLHDMwPTxuNmKxLsrCIY8W+ib4lyg
	pa2eLupCt8BK2KonMR9EKFqabN9eXaFK8IKwPomazv/go/Zta6UWJ7VTvdxmkNu+
	mzbwmlcoX/AiMZnghWYqejyDGXIopGmh1QffcapWvjeqLhqKjjCRYfAbo0E825Uc
	zl3xMk1nE8k+eThw9B5DNShr+OxOwMDetBGXeyCH/xnZw3bHNuC+JQKn4gGkmptc
	5HrPdB1SlWdORwfwWCgUYDWyRMiq3SbZYTYkgcVXb9s7oCIg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nvj9k8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 05:12:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-366122e01fcso5781790a91.2
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 22:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778562776; x=1779167576; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fSI/j7IvdCFik5UD++CGecgmmuHc0Slj/zGvA6DAlGU=;
        b=UAxi0Cw01aQylCDHP70WGEk9Hqx3LjEM5O8w5oPFyVpWPtsFWNhKpOTc+1Oe6O5pY5
         EGZCRoD8XdUTmbJm5Z4AIco9cKQ0I1Y5QwYOagNA0bkf+pOQRE+MiuRZrcVuuxlFURuz
         d2kCZbQV8RiCv+rI/AxxxmOXonDsizp7xgrIx8zIho5FkFwAVRQgLcxd3nUWIAOKf/cG
         rC4D9L1nG3mCc4fFDBm+LZMcICteVUz5ahq41988W8KiCrK/sDtbGW5sK7p7UX8AqmQC
         WzwjvUHBSmSd9OG+HV+A/bIoEXNgBRzFWHdvr7eVKdaTHJ8l/+cfFcp2iNliXJANxIfe
         1Cug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778562776; x=1779167576;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSI/j7IvdCFik5UD++CGecgmmuHc0Slj/zGvA6DAlGU=;
        b=bWTnPBDJGIiEeiIc1aOU2TLZwMQ8xWS4Z2IqjD7gf/6rcw5JZdmIRKior1BuMAmDY8
         +BD6GKnep6oomEXAmCnwWIpEi9Macbqk0HrNQuI5uo3Oxq57ZTQyjD9A6PhDMgJ2FR4S
         pX3/KsKAV11hqtRpNMukADEZ+qKpoFHU26jxJRbrkgVLjOJM++gF53cOHskB1gIo99Tt
         aOjr3c514BMg3M5aaoqPq+oiXoIMmYV8MGxmGukR5aWc1gdSnFDgsOAkBPAc24u+r8AJ
         3dUgrHzYc1JzTB5S9Ztzo+kxwr3tTtauDtisky4XVgt+ujiIPZKS5nivUdYegnRAk8WA
         JDCQ==
X-Forwarded-Encrypted: i=1; AFNElJ/OHCiY/sFtIw11Q9turQyerCkLK9CNOqwZcdZiCzwYN+LDnm16OYHQy4wV1SHOe+slNmGQBH8Gv1U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGEZF/gGwE1DrPgf3AlSQuUzz7U6n0Tsa4joLnrQeWtOhYVGfu
	Rlq6kMGs01iH8PnChnIcESuvT2iaiJYt7k6foMCvDA2che0chUG/EdpKbtPDhDdWtXUTzPNWoTH
	drRP5eABwFmOKkIefWabFLDzhUxUMiDRJ/pKkZKNLIrfH29ZYzbKXVlsys/O1lH4=
X-Gm-Gg: Acq92OGXbOw2tgAtzFJh2MO2XjXlSJc6piR589LnNDyvkaatHxlYIwkQFBdrYDZI8oh
	LGUyVVOFVpWYNcLVe1Y4jSHwavjDEHSagqzgpRJa8t3Bo0+yE72TcnAEFXu2uNdJWr3rAi9nBQd
	PiGX6ZYILK688gdhNmRwhjIb3KkiOqXk+BYA5hLKKLZIRa/tgbktLCyg/b8UNU2R8vqSeytaOje
	lrseG/FpyeHRc7hvY5Z//tlNniyOcbrxc9L4ZMbnpw7eUBFEwZbmAKoWHzjjA/CQsjV+d9bZZLn
	yMsQ13WAosttBc3en1+QQMraoa00dpBKb3o+S+Acg/Fe54cmEylgYPYwVTp0y2iYjtJE/AvU+7B
	1zni0bBWqkezUHzbwV47dpRgkRPyYnh9pTvXjnK+m3JfN8A6mQWrv3h1owMi5ZWc3bxxaRuN+5b
	XfL7xXWWHWndqK5UEWoErSW/baPj5SWpan2L5UNzA9Fo6oVD2Ks4ImMRDT
X-Received: by 2002:a17:90a:e7c3:b0:367:b9ed:6656 with SMTP id 98e67ed59e1d1-368b269e776mr1648346a91.13.1778562776437;
        Mon, 11 May 2026 22:12:56 -0700 (PDT)
X-Received: by 2002:a17:90a:e7c3:b0:367:b9ed:6656 with SMTP id 98e67ed59e1d1-368b269e776mr1648320a91.13.1778562775914;
        Mon, 11 May 2026 22:12:55 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368b06d6b33sm425701a91.10.2026.05.11.22.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 22:12:55 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v4 0/4] Add minimal boot support for Qualcomm IPQ9650 SoC
Date: Tue, 12 May 2026 10:42:46 +0530
Message-Id: <20260512-ipq9650_boot_to_shell-v4-0-1e87c8326e59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM62AmoC/3WOyw6CMBBFf4V0bU2fYF35H8YQWkapASptIRrDv
 1vUxI1sJrmTO+fMEwXwFgLaZ0/kYbLBuj4FscmQaar+AtjWKSNGWE44J9jeBpVLUmrnYhldGRp
 oW0ylIqyopdgZg9LtzcPZ3t/c4+mTw6ivYOIC+zY8DGMSxl+tsSE6/3h/M9Fl+xELKlfEE8UEa
 16AFoZXtKYHF8J2GKvWuK7bpoEW8MR/MEmKNRhPsJwVgmmhjFL/YPM8vwDXuo6iNQEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778562771; l=2956;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=XAAdVzRIgG1++KpC6o+mUhQKjjhsFsPBjnBt299X6wI=;
 b=fTj0XyZnkBpYSSoL1vJXBeZtf/k3d2jspdBJthXb/1BXpIevuliiA/vaMQhvDK9b2cFNcifqZ
 HOr3XG7BvZRAXlVpZe0NPW/bR6+rgJH/BgqkPcNuo7sYFt06GgjVtRX
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: JPA926q_CaUe4KxGgwavyks_IaLs7Z9e
X-Proofpoint-GUID: JPA926q_CaUe4KxGgwavyks_IaLs7Z9e
X-Authority-Analysis: v=2.4 cv=H8brBeYi c=1 sm=1 tr=0 ts=6a02b6d9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=VwQbUJbxAAAA:8 a=YURS4O9UCPS1-Wi1IM0A:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA0NyBTYWx0ZWRfX+08IJBul0U2D
 G6qBb2LORMSiXYA4f63r0a3O67qoIfzhO+vrY1ynp2THfG1BYMJhByw5YGb2IzJStTVfWWvkaVp
 Nrw/baURmJjKLewvvT9N9PBQKW8XW3swU2ocVaJGfZ0IGHTaipQ7DT7XnywUId9A813gIpjxv0q
 MZXV/gOZXlzUUx39mrHSiBO7MQuzEJkJvEH36GWjcOJeG/ZmQsebY23QFf+u7nmf+HpkYmiNCIC
 oTviXziMjNSnMfMBaZaYZhU/q92SnQfwGg68Yv8XBGgbYn4KtIQtqb4fw8N03TpQOk9DVwYRsvf
 j1zO2UpHnFLCdDHsLKc5a4fr1FEL9IbOGoS1/g+jxL4NNaPsUQ6+m51X+mD228dwMLReXSgM4I8
 11NRowREzJmz0Jl4PzdoQWtJtVPYLXjXwoVxt1K/RbCSGW8MjxBIWKM9wQ69u8fW115bCBJl+qH
 Fbbj+u0fqXqorUOlzog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120047

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
Changes in v4:
- Fixed the qcom,tcsr-mutex region size
- Link to v3: https://patch.msgid.link/20260507-ipq9650_boot_to_shell-v3-0-62742b49c991@oss.qualcomm.com

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
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260330-ipq9650_boot_to_shell-159027d548cc

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

