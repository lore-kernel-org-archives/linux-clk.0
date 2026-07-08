Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A423B42EC
	for <linux-clk@vger.kernel.org>; Wed,  8 Jul 2026 18:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783535126; cv=none; b=HXXgUszPYIBSfwHZhAksObGAAWyNresvpnDiaA9JoujsZHvF+DCpNuZA+V3EByngSEe7bi2EpY/lNeRm3QKqmHDqgQCvCDc9oNJsLb5ylN12rDcYImCJIZSBi6kjAbZSBbwry3baYTtPAa/7LOmbdvS2HPkhWl+MmhCBLS77/vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783535126; c=relaxed/simple;
	bh=xEfWcNodSiJaimKcnO8lld02aNd9L/RRemVH+bXC/Qs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m1szoSLDDBc27BmqNpluL9OZePmyC510OhyctGHypY9iGMFGVJt7TnD/XY2uosG1bb1DhkIEZ9XlsU3ObIGzuVrj7C4IZFpEigrnER8iwnnwdpLDGjMyKi44HMEw7EUtDzJXygo0bgyYcRdlTgLqCL9er3Pbe+G+/u1VTV7iOV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S0J2K3OD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HWMhLB3G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S0J2K3OD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HWMhLB3G"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668GL0573256338
	for <linux-clk@vger.kernel.org>; Wed, 8 Jul 2026 18:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DlOq9cyGVjo1GSBmam8JHq
	IncEW7Ur5TJOCioZSLmxk=; b=S0J2K3ODUevZxf5v5BEoGFyQz+DKj/rkQbuwUF
	KNRDtROjiI1QhxDIAaiFI3uH0rFdi+eKjZN1x+P+G7LocbzkcW0j+Ut3U4hvFjXp
	1wUd551D5kA4hghQX/D9/2m3T4L/YO1BmdakF8gMWgf0jdqlj0r+/89ZZJYqqyAK
	spfo9WzvZ3XBA55Ox99QqBBCtGsRbWkOxW6qE20A8OfLzUshJPl3XjwxMUDg/syI
	7UySzfmvn1FZFB9NtyuJZlDiF3+hhraP30R+iIvdWZAGUmC+W95NgIWWIBZv5NJl
	MakU9FAOh0m+MoRjF8Wuq8YNCwN69IqCEBBSzfxPFccsAheQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqw8kgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 18:25:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8895156101so1450434a12.1
        for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 11:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783535123; x=1784139923; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DlOq9cyGVjo1GSBmam8JHqIncEW7Ur5TJOCioZSLmxk=;
        b=HWMhLB3GFwv3gwJV6vW8loRtFqfhRkfaTj0z2jkRKPge2hBNf1xz8Ckb4eWzafv4p5
         l19V5pPPUNSUdnhUXxgEpqZ5BBdfp5Y+6lUDdTyxOxrefNay43gMKurPDyTdzU/hGPsW
         5CDQ2+gQlV0Agdlo2WLBFMZlNN4aWcoIcljMzMWeQpH0FRs2bIp0Yl6HLlWrEXdH0kLy
         agQe5qG3fyeVgpMzOQr+BUYa+FvSjW5G40AkaDiKeMcaHz1uQ0fBcwgN6LOv+rEDpoSU
         HY9LRi4W9/LDsxA6Y5iXUwS4Am5vzFUEAK3X+/TKLiztazYB8rzMxo7pGw67ZwQatxvc
         Fcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783535123; x=1784139923;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DlOq9cyGVjo1GSBmam8JHqIncEW7Ur5TJOCioZSLmxk=;
        b=cYfN1l+KyJOV9rckbu3WwmXShogphR7lypldwdPOroq0l01c1CCsz3hRniMmlsdcXk
         XIF3m3rAKonXrQtYsGHt11AS20uZ9vgkgCSCUu09Pur0N/iKf+GvHu51mOFEk0/gg16A
         +UUj+5vYJwJjfJhklBxWh8MkKE96gkJ4T9ytBpr1RqhQsbISn/vhWpIFovTpcrreg5eG
         P4/ZnQc/qhCVID2XuppoehZ5vCvu9unWtATmk7VN1P0FPD2V3/jkVLc2vU5HAumymt+y
         HHtRy2Pk+1+eDzopf0X+dem0c5wY1GSHJKb79tOl4XYi5MAQFOHghdYDUUpWlr2QgkUN
         LBkQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrh0LYhEZp4kh0DhbZRpBaZueA3glaNwKY2AdqOe7X8v1i1kVeKsf8R4F20f4Ym9jLvlKvmOyLA4As=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAx4//fbQrhVHwkaxP+1tqHC/FRcDYuG75+TGWjjR5me8gJ54f
	YFiJsbbCuh/UOsgi0zQ/lIU/SRcgRcXvjrljIX/74I0fLcV34v4xgsQot+jUyzX961vjxx3Nka8
	GKwVUZObygo4P7kmqxgtOhZq1gdVxCIWaWY8aHyFAIVUuvz1PUyv7r6tIFzkI2wA=
X-Gm-Gg: AfdE7cnRKAJB484cOKTLQBog0S+vnPjJr+z7pVq2HGeAjwcv+K8CMCw6SwPdMlWcJae
	OUvezqYGRa4byIfi2qvDpjT4aWsZqTYKSQhhqy/4m+EZ/+qFYN2VbXW4X6FyDQmfIVugAViIrTw
	eiLVP5DOvuLbUpFTcME7b1DS3DI8wEg0K1hAGO2LZBT/RM7GFght4LcECo0n29CIe+mxufDUEVj
	XLgQTuxw0XZ/I3v2ha/njIimYLR8oegRK1UVx35/bDZFbnOqgslP2HyRpVoFBVQ9sVs/lIOxPQ/
	1oxTGf7li8xL7lU39y0qCXOPVTOSm2vH+SWzRZxcrQPXGtsd6ufTkj9SPQ1Nd6WnPMssNTstT+6
	OXyC0koKJtG1eA2p7EzB8SKwtmpDatnyGTHrw0xE7lQ==
X-Received: by 2002:a05:6a20:a10e:b0:398:7df5:2dae with SMTP id adf61e73a8af0-3c0bcf49b71mr4360040637.9.1783535122745;
        Wed, 08 Jul 2026 11:25:22 -0700 (PDT)
X-Received: by 2002:a05:6a20:a10e:b0:398:7df5:2dae with SMTP id adf61e73a8af0-3c0bcf49b71mr4359995637.9.1783535122275;
        Wed, 08 Jul 2026 11:25:22 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af7d5946sm2671098a12.7.2026.07.08.11.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 11:25:21 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH v2 0/4] clk: qcom: Add Audio Core clock controller support
 on Qualcomm Shikra SoC
Date: Wed, 08 Jul 2026 23:55:04 +0530
Message-Id: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAGWTmoC/32Qy2rDMBREf8VoXQVZT8ur/kfJQo+rWCSOEsk2L
 cH/XtlpaFfdXJgLc2aYByqQIxTUNw+UYYklpmsV9K1BbjDXE+Doq0aUUEkkEbgM8ZwNNrOPyaU
 MzuFOQIBAFOOKo2q8ZQjxc4d+HJ86w32u7On5/EXXpA3MqX6BTxWYb2O97nIumBLNwYcQmCX9I
 tDfXj9m0bYvs5+wV8JrxQWXXPaL3AzWFMAujWOc+sa14CxlOhjGhRRUG0apEEzo4FRnpQarfcc
 V2poPsUwpf+3rLO1e/b8hlhYTrACkFYF6Tbv3VMrhPpvLln6oBx3Xdf0G1Iiz23UBAAA=
X-Change-ID: 20260605-shikra-audiocorecc-85efef073474
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE4MCBTYWx0ZWRfX1a3P7NRqZF3w
 W/9hR/ILMTnYfJYZnfW638a1Vxj0y3/NAHrj+MdU2+xMJG6CYKaOpC3XOcXF3m4TUW8vHumDaHM
 L74gjddvNTYPPKO7GVdQRpNnMQRTWHT1pXfjAvcJcaIWXITvwwzSHbjnnYRFk2U578F1qlCicoJ
 1HWu8YCx/3bgd1FtxWm0bChov4wApTg9en3AVsDTF46YWV7XTPkXUUu7anNLrOgyiGnJVK2vHqs
 vLPSFQqTjl+qPBsWIiQmhm2JufVtJyVmgYk7s/OXN18KsmmlnexgV/BmYVA8WpmL2ziskuv9wk4
 7sLn1vvL/UEMnxKuBT/v8Cq6gcHFzJpt+quTm1ZuqtjqiTeIlJzHaE2RcPMciCJ01h2SAx+Hcgz
 /ob8/8TRDVtjJ4ZV+bMXPw+f7ThmgH5oOffLyhMshHin9PZxE3d+MfOh7dIjSIj3R85RXTQKL22
 sKTsAj6I0MYp/EUxkxA==
X-Proofpoint-GUID: zMs2VLnICLK-MtWHCHyawyLtDySDzSS2
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4e9613 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tvEzqpDY3YWCjbqCEX0A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: zMs2VLnICLK-MtWHCHyawyLtDySDzSS2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE4MCBTYWx0ZWRfX/B3Sx5GkeWls
 RCJfGFZzEVloxvTCgq5/+O6ogakNbuDuMb8UgeO2xDYytIBIAoQMGGFgsgZd73qkBF8EtX989g7
 RDpuci0QajfvNgoy/GypoqBKR2ARTyU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_03,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080180

This series adds support for the Audio Core Clock Controller (AUDIOCORECC)
and Audio Core CSR resets on Qualcomm Shikra SoC. The Audio Core Clocks and
Resets support differs across Shikra variants based on Audio subsystem
enablement as follows:

- CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
are required to be supported on HLOS.
- CQS variant: The QAIF driver runs on the Modem, and required clocks are
handled on Modem, so from HLOS only resets are needed.
- IQS variant: no soundwire codes, hence no clocks/resets are needed.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Changes in v2:
- Separated AudioCoreCC and AudioCoreCSR nodes as both resides in two
  different register spaces. [Konrad]
- Updated bindings and driver patches to handle the separate node
  compatibles.
- Updated resets in driver patch to handle HW_CTL bit.
- Link to v1: https://lore.kernel.org/r/20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com

---
Imran Shaik (4):
      clk: qcom: common: Register reset controller only when resets are present
      dt-bindings: clock: qcom: Add Qualcomm Shikra AudioCoreCC and AudioCoreCSR
      clk: qcom: Add Audio Core clock controller support on Qualcomm Shikra SoC
      arm64: dts: qcom: shikra: Add support for AudioCoreCC and AudioCoreCSR nodes

 .../bindings/clock/qcom,shikra-audiocorecc.yaml    |  90 +++
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        |   8 +
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts        |   4 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               |  18 +
 drivers/clk/qcom/Kconfig                           |  10 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/audiocorecc-shikra.c              | 809 +++++++++++++++++++++
 drivers/clk/qcom/common.c                          |  24 +-
 .../dt-bindings/clock/qcom,shikra-audiocorecc.h    |  49 ++
 9 files changed, 1002 insertions(+), 11 deletions(-)
---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260605-shikra-audiocorecc-85efef073474
prerequisite-change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0:v5
prerequisite-patch-id: 59bb0a7828e41f546f734f127d81da83c0adcda9
prerequisite-patch-id: 197da6bcb15cadc47869dba88c8020987b25c335
prerequisite-patch-id: 8ec9c1eb03f052ae232ed54117abed38672c23f6
prerequisite-patch-id: 350db4f4bcdfc0fad9ed57cd5b1723f85ad44f5d
prerequisite-change-id: 20260511-shikra-dt-d75d97454646:v6
prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
prerequisite-patch-id: ac83151a889855498d36288ddd36216d451340c8
prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>

