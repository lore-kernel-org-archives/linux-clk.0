Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D672264C4
	for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 15:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752679232; cv=none; b=XCxZG7iHvuzshbO2sEXk3V2mxLheizuxQFSgDb0rPRjYixCrbo4XCbOHTJfPQLeepR3Ya1y/eShy0EzlCDYSpHCajeSmQJa26MwJ8h/rRJol7S+Fw/b257o6fojfw2fwwCPFJxa8pZ07OkKsbwODalwup9kVm8AgaVSRPgUGBas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752679232; c=relaxed/simple;
	bh=BI6qVlMF3xOeCX9WCFqLZh1Xpl2v5uGPz6zfIO0mzlA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nM+LJia87mDcm8InK7zjERp4PLoQfTe557L0dfxHutudmUWsU6twmpoeNA94+WIZaoo8B1v0tdPPgTL142Z18xnb+I6dRC3X8MWRV2B0NyrfRGLIJvMTAjR+UACvKBDoBuL/X5+BKrgwTOOqMnLXSaOaW/BC5fU0G3+5KXpT8tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TTPZGPzJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TTPZGPzJ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G9EV0d015423
	for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 15:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+zNBS1PmSdDbKE+Ml6xSeir27yoPaFDEr7o
	sJk1m7ps=; b=TTPZGPzJ2Uql7GDggLh+Hp9ps+qhB1w07cCZiRPLWhO+rZIU9pR
	20Gy7YRexSpfaRnr21+qKkjYcdQTJm3FdQJKUJmGPw+LiUgT9qeRP4ATg8zXrHVH
	62nP8BpRijb1m7YDaDLzWrHwYMiC+iKegA1bk0eNMwbkElM6NkoZdthWNIBqDLkP
	ufzu+nDyscZp4IsC9o7wtlIhNvqAm904l6TtRi5bHWM4Gl6KgKU8Ws8mdXLXnwb6
	6N/FGx1mD3ngoqgipXN8iSbntUmEcC95UDN1CVpxsDhpSMuoqO0F++YHrDa2g3gL
	jCDS0Y6Tehe0xEyQm5yb0lWJ5tfixY2ihlw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dyqd9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 15:20:30 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-748f3d4c7e7so21811b3a.3
        for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 08:20:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752679229; x=1753284029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+zNBS1PmSdDbKE+Ml6xSeir27yoPaFDEr7osJk1m7ps=;
        b=ZuThyQZEOveEPvjWYGAVuN5j0FyEMkTip749B8ethL/zsqCQ2YeHqHvX8bThWAEcIw
         GQnHA1Ke9atpfcGtPxmp8wmSk7sbAOeN5jQMnJa6OJXxvSWAaMAABKEli4+EdJmTxmaJ
         aZf+QBRZq15AaWGrfDOTetYXF9xg8Q0YpXSTZE5xICPSMA4MJcdlzKeH+VlTrofC54eh
         w0YBYIGLcu5SCBSbBOoU3/e6DDjKrl4QvHvIKX++zJTnbOjc5NLao9T1sCANVCUKlt6i
         7k5FLCNC09NVPAH3Sv1nWqKxaQYqx+CBichqgWdfb+JVQE66Dj8vkRzG/+eUJAN15jEw
         kiyA==
X-Gm-Message-State: AOJu0YxV5xHrlVnbmYxKLsYV7CRHuL/K7lO5hZWm9HsSXwTllpBXiuX5
	2JHw1LO8O/RVh5GfWIrwPpcXzSUz4FS3Z5y+4HE1MkOW0cGAxRJykiO04IfXf/Qe84IH3Ws9tvb
	2bnVSVV/O3c1LUE/QoB/AlxOgHzn+DF7OUEle8mqPJlOn9lQ1CmcyMVzcRZTA6svJMK7P/Uw=
X-Gm-Gg: ASbGncsIXrxRuOCpnnQLHi9xS76QZ7lskrW5euKVeQdf5G+qCEUUTP+3HhnlsK5RZFW
	jUOMdXaFGmd4z5gG91Gs11V7UfzVACVSSWvcl/nVnvy452ChBXVni4SejEETmwngSzPlmum5e5+
	mvk+HJeNW/c71jaK5++lDsP/Ycbpzx9rppphkaBQioNq53xKM5AnZNh+EasaraLLtTcfzC+y6oR
	L8ne46xNrKXWvTZ9m9jCAftI5ODnhw/sz7+VjyUDYI9rOibXr/3KcngMimQiktNPghoDiv6V4b8
	EwEjomNUQJLf7kfyjgZRBxumWxKr9mRuy4wY+cuUop2wGylfjH39ThcrJV1znVPVCpmAfQTAJnv
	l0bikhkdnF/QYkdY7guBZrCaYyjvyczrzqyNy6GHntlASdaEleiXEtIdRj4re
X-Received: by 2002:a05:6a21:648a:b0:231:4bbc:ff09 with SMTP id adf61e73a8af0-2381313ca9bmr4639889637.36.1752679228834;
        Wed, 16 Jul 2025 08:20:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKwU6o+tpWlwEXgv5gzHLfLU5Ajgm6I1bD672WOsYEy26mbRK7YPdMqUcJVLXOeBXYIhuUrg==
X-Received: by 2002:a05:6a21:648a:b0:231:4bbc:ff09 with SMTP id adf61e73a8af0-2381313ca9bmr4639840637.36.1752679228388;
        Wed, 16 Jul 2025 08:20:28 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe6bd8f8sm13912054a12.38.2025.07.16.08.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:20:28 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: sboyd@kernel.org, mturquette@baylibre.com, andersson@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        quic_rjendra@quicinc.com, taniya.das@oss.qualcomm.com
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] Add support for Clock controllers for Glymur
Date: Wed, 16 Jul 2025 20:50:10 +0530
Message-Id: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: SxYYVx7LYFXlIg_KbFlq27aF1VMJefM-
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=6877c33e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ur2kyboyjIJ0vDSx390A:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEzOCBTYWx0ZWRfXzGjiNFCmBzVe
 vU/pjf0BYGRiFsa/Hzur5SK1NEY1O0K2UOxmsOqy1EsuVD9VxK2702EApEkqd33C9adXeaMSXi7
 D40OlkQn3uYJ/625ipDiYzsp0mBgL1eX5Unpj7O3UBns7emhl4YRSi9MplODcVRd7PX6roGHnxi
 WSdU2/lzrRjaceLXDSP5sUejF0VmlEXcPH9nnLvzJbLLWZ4ylwZexvRWMJgAAwCeBBH+8NNjJwS
 XIOikeDB5tKnVo7vyfhjbfWEtlJ+5YAuiElQ4iDhMmZKCkGtS7JKJzLhyD6e1GPz7BTx1kYNcyO
 9+EsZoe4YuYuECryX2HU6ZGa32bPteilwO80R+O7PZ53uFWiV/XnpHoHXalfbcLBwGSMy+f3K1M
 6Xt/CNc+F1uffYq9/LSyH3DBwuk5vdzZkidpF+KmuKVCaE1tGodX5ND9asgMK+df8blwlzlC
X-Proofpoint-GUID: SxYYVx7LYFXlIg_KbFlq27aF1VMJefM-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1011 mlxlogscore=969
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160138

Add support for Global clock controller(GCC), TCSR and the RPMH clock
controller for the Qualcomm Glymur SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (7):
  dt-bindings: clock: qcom-rpmhcc: Add support for Glymur SoCs
  dt-bindings: clock: qcom: Add bindings documentation for the Glymur
    TCSR
  clk: qcom: Add TCSR clock driver for Glymur
  clk: qcom: rpmh: Add support for Glymur rpmh clocks
  clk: qcom: clk-alpha-pll: Add support for Taycan EKO_T PLL
  dt-bindings: clock: qcom: document the Glymur Global Clock Controller
  clk: qcom: gcc: Add support for Global Clock Controller

 .../bindings/clock/qcom,glymur-gcc.yaml       |  122 +
 .../bindings/clock/qcom,rpmhcc.yaml           |    1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml      |    3 +
 drivers/clk/qcom/Kconfig                      |   18 +
 drivers/clk/qcom/Makefile                     |    2 +
 drivers/clk/qcom/clk-alpha-pll.h              |    6 +
 drivers/clk/qcom/clk-rpmh.c                   |   22 +
 drivers/clk/qcom/gcc-glymur.c                 | 8623 +++++++++++++++++
 drivers/clk/qcom/tcsrcc-glymur.c              |  263 +
 include/dt-bindings/clock/qcom,glymur-gcc.h   |  578 ++
 .../dt-bindings/clock/qcom,glymur-tcsrcc.h    |   24 +
 11 files changed, 9662 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml
 create mode 100644 drivers/clk/qcom/gcc-glymur.c
 create mode 100644 drivers/clk/qcom/tcsrcc-glymur.c
 create mode 100644 include/dt-bindings/clock/qcom,glymur-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,glymur-tcsrcc.h

-- 
2.34.1

