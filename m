Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFE73A7F41
	for <linux-clk@vger.kernel.org>; Sun,  9 Aug 2026 07:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786260445; cv=none; b=gJFI9n7uTt2M2mlBW58CzlRp8uSX99HvrWj44kxRzGt0s1rCLu1mEAHLihrop3CnSmNPgCKvCkL0kSKv1R2NjrbDEMliVcmDqsoGHmOVOHP3++ikqOluk5+XGZB4Mc/UXDoS4Xj3i/EepMXuPK31HB3Qdd/DdUB4+e3KENX4bfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786260445; c=relaxed/simple;
	bh=/Jsp7P44tLtJOlnHOneqYC259MeEKBIH/k/fg6ZZKBA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DKaGc4LfMYfA8oA2rUdtkpf68N98Y8LQ8pez9TTL5zwJK6AGhaBbtwDBvEGcFfpRPDunLbG+2/RV+RE/kKOvOnxnV0R9WrXg+U8vuJ8fWfHQ+nLKxZAqQz95Qlu0AtsHbS8bPeOpTFVEMFjI0JCH6OSWriquPhvKoKdz8VkAp2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WjJfu6rT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eP0somao; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WjJfu6rT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eP0somao"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6795cFIv1623232
	for <linux-clk@vger.kernel.org>; Sun, 9 Aug 2026 07:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cBZ+eLbW1mlGqL9Ak7/OeV
	MlOtNX8lTY6pwi+siJQYQ=; b=WjJfu6rT3IfIim8qPqnRzM8pRgViPU4Pv7Puld
	noOhmsy1OYzKVqpNNOlCWXuQf5tZKPJhGd3MHqp7wWColXJc0f3+m4DJ1nx8bvfk
	6+bBTr1LUrDINesgm8qQN5RgFPNGwR4F/kkVAGq7BTQSSTdUFSpaeiKzhEjr2zKh
	ZtnJyU14mei15W8jZb+Lgod7mDEt0Wm1dJ/oxcm55RsV5l2d6hNPhXAwdE4KxiTG
	goCeGDtz9uaAmlS2eZGNSrMyCmUD2w4/KbZxD9EB+Qp6ssWP27esXkGr2O4STeLS
	wZSFN4yGEc1IkoJiOUJQBB5jAZGDfNj14A4KAB7VdtR+Civg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwvu8jegd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 09 Aug 2026 07:27:22 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e6d253330so1059734a91.1
        for <linux-clk@vger.kernel.org>; Sun, 09 Aug 2026 00:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786260442; x=1786865242; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cBZ+eLbW1mlGqL9Ak7/OeVMlOtNX8lTY6pwi+siJQYQ=;
        b=eP0somaolbhMK123TXir2vmlyQtAxmHM05Fx6qvZQdaNU51yck+gRuJ5guuNk6tFeh
         ufzb3Tcjt3/jMQQa8I9zdWOhA2BjwZL5fLyfD+l+hl3lve4WdJstEB7bC7D6dNbaEH2p
         NaIHai8mWwHUeIu4oaSJROSdBrNtqHF9Cne4jJu9URacdCRaUh37o7ntRHCVv0SstRD+
         uxSbFVM4dW9eja6kLWYytVSEmP5aUOBhR0ycA5dZVGIdxSC7wT40zGZACQwAUTgbMs0w
         lYVP+aUbt4Puf82I2+loKrcH5MxYTwN/j6ns6lb4G0D7Se/VU31x6nWwUx0x+0D8OD8A
         /FYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786260442; x=1786865242;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cBZ+eLbW1mlGqL9Ak7/OeVMlOtNX8lTY6pwi+siJQYQ=;
        b=k5E0dmZIHMYUy9yoUKbN0+f7Jroo8fAL9ENVQRv7lpvB7z+yPjMMf+t+QmZk9sgH6B
         Lu4nDe8UpUD21GjHX/BXMy8mu/bxR8AfmC8uLTlaOKlZctzhfRxuPARURJzaViP9ly9D
         KpoQ4Ep6iR41z8cTxAO5AzrfxzPvjU4DiXhK8R3goXGc+q7SKhJzI0XQeURuo45ZbnMo
         yTHeMF4WAZTBk9GKZT+HjPrTqFp5Wc2dy7vVAk6wpDRmiSOkJD618sv8LOQeA/zcDVx6
         w/jCku9TwP7Lo3Ome8xqxGlwU8YlAVhsoLbjfeRzTaermu2RVUljxD+OjZTP5w4JpGE/
         7zFA==
X-Forwarded-Encrypted: i=1; AHgh+RpQkk62kNSEq4MDnT0XQWjd/ICtw+oS0Acd7XZx6bM0Pd3vtkaIhDvo5VJUJ/16HHKRHVKFm5yo8lk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfDqFPQfUtJhTHX3+crFtROcqHV6yuPwiDsJzZGZhfvR5a0ZS9
	6keL6ggd6UF4y0Q3QHhMEV61/sCrb1GaGjU+r+dcKaJX0JvYvEnz1qqEjtyKURT/OLjao0x8Elq
	97FEVZb667IS/eSeTnH0Ya7Ks1INQw+9xVVKUldac9ClyYRQWTbNBNh3C5BUPUMs=
X-Gm-Gg: AR+sD10fb7LT/8uUvHJuk54gUFsvvMoxeJ9cS13iQ+W84CjRLrIsfNTI8VlniPp41Bf
	I/vF2yjjNxNbb7PR0N+M4ixzwPrHw1Fcm2ui6NVwOabdS6D7UeoDAElzCsv1jMmcmqoZshce8P2
	0YT8m0IqhojNTYK2myzXRIlGO4Lcnuz+xV4Dk52F/LOh/WST0Y1lLR8eWBdNfgBUgxaeMpAgKbv
	LRAucHMxOiYylOXqTh9dpt2t0gk6mu0lLQotbfyLJAzFBYkS2kkQfjvq/qLrbf3uaaffC6swpET
	BPE5VJ5PclT/TjAwyuY5s9G6oPqtkb9y1bB15mR+DL/f0vmRvmYpcB9QP7szhE1PJ1dSGJ6d4aB
	agc2R8w1dzAzdnzJcPmLQh3Jdb7hqI3L7h7qT2+voss2JGTbUSwNDj8U0ob4akJYpZjJ0twTmqg
	rMxkSLRVALUvc/VLW/mB71gvQ=
X-Received: by 2002:a17:90b:3985:b0:38e:4f31:8412 with SMTP id 98e67ed59e1d1-3928470124amr4899565a91.11.1786260441902;
        Sun, 09 Aug 2026 00:27:21 -0700 (PDT)
X-Received: by 2002:a17:90b:3985:b0:38e:4f31:8412 with SMTP id 98e67ed59e1d1-3928470124amr4899539a91.11.1786260441422;
        Sun, 09 Aug 2026 00:27:21 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b4eabsm22655630c88.6.2026.08.09.00.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 00:27:20 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Subject: [PATCH 00/15] Add initial support for Qualcomm Kuno SoC
Date: Sun, 09 Aug 2026 12:56:59 +0530
Message-Id: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMMreGoC/yXMQQ6DIBBA0auQWXcSZGGoV2m6EBh1agKEEdPEe
 PeiXb7F/wcIFSaBQR1QaGfhFBu6hwK/jHEm5NAMRpteW/3EtcaEkjxKzTmVDbswOmv6QNpN0LJ
 caOLvvXy9/5bqPuS36wPn+QOs+sUOdAAAAA==
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786260433; l=3517;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=/Jsp7P44tLtJOlnHOneqYC259MeEKBIH/k/fg6ZZKBA=;
 b=h5JXYnqQMhEtl8w3fxLi36MDFjd8N4CmajKqzBnD/JHcQsYqMPf/iQ1b5wxO7rVJTTO9inXI5
 CfO4Ma0JMXIApHJk0v98xzk2/Hh8dgwC3L/u9byvG5t0RSKl1u4Ffj/
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-GUID: -nBNg8Uka6q27IS1oj1TOlZ3xmMskN7q
X-Authority-Analysis: v=2.4 cv=M8p97Sws c=1 sm=1 tr=0 ts=6a782bda cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=o20KKycpbvKjA6q8TgsA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: -nBNg8Uka6q27IS1oj1TOlZ3xmMskN7q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfX/zKR8OQiuv/i
 yZe6FrrzKAyba2RwDQZHrq+E2/jWC5X4oYINej/NKULtAceDvLSq2eLzKlXOeP3Cz8Ioh/3YKXT
 3aYAYWsoHtNyQusVuKQfYVy/L6GoyDJcGvKQhUNZ32/e4FU849ucKqcW+Ds/2cSOE6wV1wfM4rQ
 B8w+Rc61b4ClDUZUo8iVEql2BoaNd+Ma7rasV1rfPRVRIPCudPhNNByrUEIdN1vPY8MbZobP8hf
 vBR0bh/iXWDSRzq/wEuxDwCaH8wdMvcYxkKmousLT3oKlauwXE0LKw67RSxBI14lUPl8a5ydC8z
 3FQhGU4AcE1Eh+QCq/BYULddfHQTFLxEONO4Od9WxNFi97bQU99j/E8NMNUR/Cbo3CuGJZzmRpT
 7jIh07hqt9QiPHuNFuJi0gpqKG07+Vgd6LZ6FLIoUmh3c+9l2DohwQJOH3S9F484VetoDRChixC
 NCbae6/GdjgEY39c1IA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfX/B+1IrV9Yj2o
 DLz+xVWCQHXxmS8srtsm62iXOU7IcmCvIsXsf560nqTRGQiZfF9e3dSAGviBBUZRPoYeJBY6Qls
 i0J//vAQtDI5vNoODqkOAGdhA2DbSYk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608090063

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

 Documentation/devicetree/bindings/arm/qcom.yaml    |    6 +
 .../devicetree/bindings/clock/qcom,kuno-gcc.yaml   |   56 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../devicetree/bindings/firmware/qcom,scm.yaml     |    1 +
 .../bindings/interconnect/qcom,kuno-rpmh.yaml      |   72 +
 .../bindings/interrupt-controller/qcom,pdc.yaml    |    1 +
 .../bindings/pinctrl/qcom,kuno-tlmm.yaml           |  109 ++
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |    1 +
 arch/arm/boot/dts/qcom/Makefile                    |    1 +
 arch/arm/boot/dts/qcom/qcom-kuno-idp.dts           |   25 +
 arch/arm/boot/dts/qcom/qcom-kuno.dtsi              |  423 ++++++
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-rpmh.c                        |   15 +
 drivers/clk/qcom/gcc-kuno.c                        | 1438 ++++++++++++++++++++
 drivers/interconnect/qcom/Kconfig                  |   13 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/kuno.c                   |  978 +++++++++++++
 drivers/pinctrl/qcom/Kconfig.msm                   |   11 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-kuno.c                |  796 +++++++++++
 drivers/pmdomain/qcom/rpmhpd.c                     |   16 +
 drivers/soc/qcom/Kconfig                           |    1 -
 include/dt-bindings/clock/qcom,kuno-gcc.h          |   95 ++
 include/dt-bindings/interconnect/qcom,kuno.h       |   89 ++
 25 files changed, 4161 insertions(+), 1 deletion(-)
---
base-commit: 0d33d21e47d9dc66f91e44da3fc9220c74d93df7
change-id: 20260809-kuno-soc-support-1dab826de0bf

Best regards,
--  
Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

