Return-Path: <gabriel.fernandez@st.com>
From: <gabriel.fernandez@st.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@codeaurora.org>, Nicolas Pitre <nico@linaro.org>,
        Arnd Bergmann
	<arnd@arndb.de>, <daniel.thompson@linaro.org>,
        <andrea.merello@gmail.com>, <radoslaw.pietrzyk@gmail.com>,
        Lee Jones <lee.jones@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <gabriel.fernandez@st.com>, <ludovic.barre@st.com>,
        <olivier.bideau@st.com>, <amelie.delaunay@st.com>
Subject: [Resend PATCH v2 0/3] STM32F4 Clock binding fix & update
Date: Wed, 1 Feb 2017 14:09:53 +0100
Message-ID: <1485954596-11014-1-git-send-email-gabriel.fernandez@st.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

From: Gabriel Fernandez <gabriel.fernandez@st.com>

v2:
- Only rename commit subject of first patch to avoid the error:
 Remote Server returned '<vger.kernel.org #5.7.1 SMTP;
 550 5.7.1 Content-Policy reject msg: The capital Triple-X in subject
 is way too often associated with junk email,

This patch-set includes:
 - a fix to STM32F4_X_CLOCK() macro
 - an update of missing binding definition
 - a patch to use STM32F4_X_CLOCK() macro

Gabriel Fernandez (3):
  dt-bindings: mfd: stm32f4: Fix STM32F4_X_CLOCK() macro
  dt-bindings: mfd: stm32f4: Add missing binding definition
  ARM: dts: stm32: Use clock DT binding definition on stm32f429 family

 arch/arm/boot/dts/stm32429i-eval.dts  |  2 +-
 arch/arm/boot/dts/stm32f429.dtsi      | 66 +++++++++++++++++++----------------
 include/dt-bindings/mfd/stm32f4-rcc.h | 24 +++++++++----
 3 files changed, 53 insertions(+), 39 deletions(-)

-- 
1.9.1
