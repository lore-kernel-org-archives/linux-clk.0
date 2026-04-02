Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953072F361E
	for <linux-clk@vger.kernel.org>; Thu,  2 Apr 2026 13:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775137287; cv=none; b=YgG+/78kOcU48MrAifEKojZ6pbOlrJgYC0VMbLgl5ALsTeURGqRUP0ip7VbNP4RuiH0qv++Y57Syrm5E4hIRx3B0Y2Hof0I/tZWlutyWpvvCXS75AxLsUltUYfeOl1S6F/ccZCqoVZLbA7T16l3Q+4x2f1+HqGR0ZRbu22Zy5Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775137287; c=relaxed/simple;
	bh=BQWzsvFxUOEy93Lv9oCbsgPB19vUqLBsv/3Z000R/KE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lt3O/ts4qth7m3WrpzcJ4BjWp7312iSaHmgwUILJ+Owsj/Nk1+8PanyCG1ikAssnsrse/L6AIxfrhqdTpzSpbmzOF4C2nuZ7Fx8ARMBma/FDePwml8MvxeBgyF64yvBSBx4O+gzN3AwIXqCywu/ME1EygvRBgbLWTwcvdHbj1gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dzZIq2WN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QXHOzdMZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dzZIq2WN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QXHOzdMZ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632CCQDZ1964793
	for <linux-clk@vger.kernel.org>; Thu, 2 Apr 2026 13:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sv9xB6+Go76erVqN6g1vezYQ8vqR4bRuLJP
	JN/bGVwo=; b=dzZIq2WNVEYA9OwFvprmEDltpgrDBe2YFsgUr3xmsQ6rcIFegCi
	mICsS8T6jCzWxO32uHP1w1ER2HMsIHiVyi2CP122Stul04xYgCxpL4CSdbSyu7qc
	Og3hRwTAKVnGBn4pcLk9YQRufo/rhVWjrrgmXps6LvzY0rWp3o0qY517KrLdKx2V
	lC1m7PDvmRyULPoSE4rMl2bCvdleSmplTx5DQ7qiBTy5dHRSDNbbDosBSr5K1UKv
	eXQPtP1GD4EJI/8tJMgi1iKMWkQ/ylvk662eyhQjhnxb1ExsOm/pMsKmruk9cbnQ
	pgDwQJYiTGtGq9+UdNnr3rx9ppA0t8l/LOg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9b9h3eme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 02 Apr 2026 13:41:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4661881eso9456291cf.0
        for <linux-clk@vger.kernel.org>; Thu, 02 Apr 2026 06:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775137284; x=1775742084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sv9xB6+Go76erVqN6g1vezYQ8vqR4bRuLJPJN/bGVwo=;
        b=QXHOzdMZXTm5OQRwuAiSLA3gr7/EfzdMs7mcsP6YfZ8mOvk4L1JAOMMFoOUiH9RXjN
         t6hLPw//SioVJjzJLiVGY35MryXqq3KkXDngDSRp+jyENRHC1c/Vamhq9ODh4SKe6cF3
         IL6X1zukVsFwVoCSNL0qoPKCfBugeYh/3DwMCUGmkRAMFCja2nuFmhpXfcbGha9qauXB
         9KzOlSKOXv3v3go1SX949RGMyY0ac234LEmTHo93lbjtkWNfwc/8JqKDfhUJwOx1Wun7
         SYDBFbNVmK6HS/1LSVSPooGMk05zt3OXI0Y4tAGeRYYSw6VvUWtrGTMonJiCiaqpviSb
         FVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775137284; x=1775742084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sv9xB6+Go76erVqN6g1vezYQ8vqR4bRuLJPJN/bGVwo=;
        b=oGKLhb3iN2QToFOCeJ8st7ur0YXhq6eShQQ6c9a/3yesQ3k729DXgiw89l/YmnsuZX
         Byf94ugSMWVIB9pfWbVIKlmfkfLMP0EVdgtQo/IoLDiEjbgHKwiD6FAuRO8B0k9awa2c
         RhZlwQKLaDmq6NaaIXTzaLjBX004SjcxmPiweyRP3xk+48L8oX33r4rIfEL8oqEHzxHL
         lIdFYOi2LbF+BMLLjXkKMNcGQTTju5QzQivHlZ9glTaXeDWJk3Gbed/2omRQlM73SLrZ
         CIVDqAK6+Ed/odNVXIcMVwNOeelHkls/3XypADsuA08KQqjRA86Lm6cdEWsieOjQy4LE
         wbxA==
X-Forwarded-Encrypted: i=1; AJvYcCUlpbv/H+itauZZwoIAF1ALOcPeNsTlTxnlLmjpikrudRqIroiDkhQLEZYZLpkMIj+9YEHQtpeGjRo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx31mPihc6wSMX7yve8Y5fIe2DbTm55Znrskx/UwjDXyZ9c1Xpq
	G35tuUn8pCZr0TbPu0FH7oHe9HzwAsYkgXrPxONjOBY+UvgpCwMRMyFBndqHXdYFpBOrBuZCzUk
	DEfH2aNxV2qYx/2YY2/iNGm3Gfw2P6Z2YrWxEPVQ5XY3Z1Ccwh6Itc/RgLpiSOX0=
X-Gm-Gg: ATEYQzwCOPDWA3zXb3QNjMVf6b9f4P5REFpO2qv5SstuTUSwKY0v0pGWLW4WX8Asa0n
	OxgMQn4DS3JwAwPqDHZ0AnOyZfCVn4xczcAYJtVsOHemsD75DmJT6M41Er1zakltf9eAhpVPp8i
	O4zfOQK4ArnwotKd+FQNQ4Sv8Ivhj9a5YuQa2rnbRA9S0terg0km36GYzHPG8QjHOBaqpUTvRGD
	u6nx0Dzm3dK6s5ueQjuh0SG12mV4x5rMd7Dk1iGbGJYJXgi6Y0YYk7hQ4KvVeXy2qKVKnlVoPc8
	4vuRP/zp+aWocWlbvyCqPmrLuC5qewyLPuWQ5BdSm87Q3iwDHzkpfgvQX0k2Tg0vJCYpS4BeDEz
	JPwKP8n+NK+wH1oOryeFCohOIF85llA==
X-Received: by 2002:a05:622a:5815:b0:50b:1adf:89c4 with SMTP id d75a77b69052e-50d3bd3a047mr99605711cf.46.1775137284405;
        Thu, 02 Apr 2026 06:41:24 -0700 (PDT)
X-Received: by 2002:a05:622a:5815:b0:50b:1adf:89c4 with SMTP id d75a77b69052e-50d3bd3a047mr99605151cf.46.1775137283847;
        Thu, 02 Apr 2026 06:41:23 -0700 (PDT)
Received: from hackbox.lan ([84.232.191.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c8bc9dcsm115066065e9.6.2026.04.02.06.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 06:41:22 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev, NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] clk: imx: Updates for v7.1
Date: Thu,  2 Apr 2026 16:41:07 +0300
Message-ID: <20260402134107.1528450-1-abel.vesa@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TqLrRTXh c=1 sm=1 tr=0 ts=69ce7205 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=1UCgTMz9MQc3icybWezSFQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=DpqbpgNP_Zn6TWIi6OsA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: RsMICx4bEHrXukVNBqg_h-IMXBMUFr-b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEyMCBTYWx0ZWRfX0diegvTgmzAg
 56+9S7TNJxq8ra+BeZfVUyUAMLLAwD84zRthgnpaIvOhQdrsTdQfeaeDZyuljxmyu4ag3QY+flE
 0ooXkol5FKQUw69dbvLucCrKy99LUWEg+FtIqpDVw9n71xWXinYA0xULRZKrOThOTpX7cHd0Slr
 7xGRka94StUU5MAOMEotsCoTQ4x3Tyk6GwCjpbFITExWSDYmdLmpj5EMTX9N9e5K8jl2ynaEpsN
 ln1G0Ei6sIVcdATCZwLhFKeFa1+cTACXe/Rnl5/qv11L8gKdmg9I1FXVWrkROiJmZ/62iutiRmC
 lfZhcfwtYnJbQYXHXNV5/Lb/kaMgMLtYvVw+XDLa/zyUJck3iwKLj/tkcKB4ygVMMwQ8c7ifMbz
 xXg88v4vU3sd0YOfQFP1FRM+sP5q02ivWNC5y9vJjVw1dnelHOjkR9zsxxNMTipuuMsseXvPKgF
 E5alg/ZDDXc7NIRy2SQ==
X-Proofpoint-GUID: RsMICx4bEHrXukVNBqg_h-IMXBMUFr-b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020120

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/clk-imx-7.1

for you to fetch changes up to d16f57caa78776e6e8a88b96cb2597797b376138:

  clk: imx8mq: Correct the CSI PHY sels (2026-03-19 16:15:32 +0200)

----------------------------------------------------------------
i.MX clock changes for 7.1

- Add optional ENET reference pad clock inputs for i.MX6Q/UL.
- Fix debug output in PLL14xx driver to use unsigned format specifier.
- Add 333.333 MHz and 477.4 MHz support to fracn-gppll for display use cases.
- Fix device node reference leaks in i.MX6 driver.
- Fix device node reference leak in of_assigned_ldb_sels().
- Fix ACM clock flags on i.MX8 to prevent SAI sysclk failures.
- Move VF610_CLK_END define into the driver.
- Add VF610 Ethernet switch clock support.
- Correct CSI PHY parent clock selection on i.MX8MQ.

----------------------------------------------------------------
Alexander Stein (3):
      clk: imx: pll14xx: Use unsigned format specifier
      clk: imx: fracn-gppll: Add 333.333333 MHz support
      clk: imx: fracn-gppll: Add 477.4MHz support

Felix Gu (2):
      clk: imx: imx6q: Fix device node reference leak in pll6_bypassed()
      clk: imx: imx6q: Fix device node reference leak in of_assigned_ldb_sels()

Frank Li (1):
      dt-bindings: clock: imx6q[ul]-clock: add optional clock enet[1]_ref_pad

Lukasz Majewski (4):
      clk: vf610: Move VF610_CLK_END define to clk-vf610 driver
      dt-bindings: clock: vf610: Drop VF610_CLK_END define
      dt-bindings: clock: vf610: Add definitions for MTIP L2 switch
      clk: vf610: Add support for the Ethernet switch clocks

Sebastian Krzyszkowiak (1):
      clk: imx8mq: Correct the CSI PHY sels

Stefan Eichenberger (1):
      clk: imx: imx8-acm: fix flags for acm clocks

 Documentation/devicetree/bindings/clock/imx6q-clock.yaml  |  4 ++++
 Documentation/devicetree/bindings/clock/imx6ul-clock.yaml |  4 ++++
 drivers/clk/imx/clk-fracn-gppll.c                         |  2 ++
 drivers/clk/imx/clk-imx6q.c                               | 12 +++++++++++-
 drivers/clk/imx/clk-imx8-acm.c                            |  3 ++-
 drivers/clk/imx/clk-imx8mq.c                              |  4 ++--
 drivers/clk/imx/clk-pll14xx.c                             |  6 +++---
 drivers/clk/imx/clk-vf610.c                               | 12 ++++++++++++
 include/dt-bindings/clock/vf610-clock.h                   |  6 +++++-
 9 files changed, 45 insertions(+), 8 deletions(-)
