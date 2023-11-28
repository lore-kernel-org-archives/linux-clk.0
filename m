Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="7t+x/6KG"
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7838AD4B;
	Tue, 28 Nov 2023 08:49:30 -0800 (PST)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3ASEY25D012922;
	Tue, 28 Nov 2023 17:49:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=selector1; bh=iB8QxrE
	lAv61BdkbTURf/4YgreurgxTFFxpS69+3uGo=; b=7t+x/6KGi240X0k541eunHF
	Gl9QJCuAwAIAYxYUi5WTQBVW9QOQJQ7xjA/QlihkN7/8+qE0Gi4fHKYkCjZK47IK
	1UGop2m+qX4a+IRaAsvTAOK57CFg6v/0l83b2R4piVV4TKA6FkdGvWhoiXCWtW67
	2NhpeWQQxjvdeF4mbVOChPN1k4IUmMHv9ILtBkkzbgc5iDIIdAi57GhJ1UD8tYJk
	ELeQGAcLJB6obvv37D5LzeW70kz1h7HyAk+LWsUZGlYjAc1wmSUAMvD7Krdfaizg
	aghsLtlH8rb1CLy2hiLwKmaSP7RyEXNw3lZ5NU3+TG+NeBGJSspIV3gRSYK9/wA=
	=
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ums0rpgwh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 17:49:07 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3703F10002A;
	Tue, 28 Nov 2023 17:49:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2DB1926028A;
	Tue, 28 Nov 2023 17:49:06 +0100 (CET)
Received: from localhost (10.201.21.240) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 28 Nov
 2023 17:49:05 +0100
From: <gabriel.fernandez@foss.st.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 0/5] Introduce STM32MP257 clock driver
Date: Tue, 28 Nov 2023 17:48:46 +0100
Message-ID: <20231128164851.588315-1-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_18,2023-11-27_01,2023-05-22_02

From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

This patch-set introduces clock driver for STM32MP257 based on Arm Cortex-35.
It creates also a menuconfig for all STM32MP clock drivers.
The STM32MP1 and STM32MP13 are now in same stm32 directory

v4:
  - use GPL-2.0-only OR BSD-2-Clause for clock and reset binding files
  - use quotes ' for #clock-cells and #reset-cells in YAML documentation
  - reset binding start now to 0 instead 1
  - improve management of reset lines that are not managed 

v3:
  - from Rob Herring change clock item description in YAML documentation
v2:
  - rework reset binding (use ID witch start from 0)
  - rework reset driver to manage STM32MP13 / STM32MP15 / STM32MP25
  - rework YAML documentation

Gabriel Fernandez (5):
  clk: stm32mp1: move stm32mp1 clock driver into stm32 directory
  clk: stm32mp1: use stm32mp13 reset driver
  dt-bindings: stm32: add clocks and reset binding for stm32mp25
    platform
  clk: stm32: introduce clocks for STM32MP257 platform
  arm64: dts: st: add rcc support in stm32mp251

 .../bindings/clock/st,stm32mp25-rcc.yaml      |   76 +
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |   59 +-
 drivers/clk/Kconfig                           |   11 +-
 drivers/clk/Makefile                          |    1 -
 drivers/clk/stm32/Kconfig                     |   36 +
 drivers/clk/stm32/Makefile                    |    2 +
 drivers/clk/stm32/clk-stm32-core.c            |    5 +-
 drivers/clk/stm32/clk-stm32-core.h            |    5 +-
 drivers/clk/{ => stm32}/clk-stm32mp1.c        |  127 +-
 drivers/clk/stm32/clk-stm32mp13.c             |    9 +-
 drivers/clk/stm32/clk-stm32mp25.c             | 1125 ++++
 drivers/clk/stm32/reset-stm32.c               |   73 +-
 drivers/clk/stm32/reset-stm32.h               |   15 +-
 drivers/clk/stm32/stm32mp25_rcc.h             | 4977 +++++++++++++++++
 include/dt-bindings/clock/st,stm32mp25-rcc.h  |  492 ++
 include/dt-bindings/reset/st,stm32mp25-rcc.h  |  167 +
 16 files changed, 6999 insertions(+), 181 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
 create mode 100644 drivers/clk/stm32/Kconfig
 rename drivers/clk/{ => stm32}/clk-stm32mp1.c (95%)
 create mode 100644 drivers/clk/stm32/clk-stm32mp25.c
 create mode 100644 drivers/clk/stm32/stm32mp25_rcc.h
 create mode 100644 include/dt-bindings/clock/st,stm32mp25-rcc.h
 create mode 100644 include/dt-bindings/reset/st,stm32mp25-rcc.h

-- 
2.25.1

