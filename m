Return-Path: <gabriel.fernandez@linaro.org>
Return-Path: <gabriel.fernandez@linaro.org>
From: Gabriel Fernandez <gabriel.fernandez@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	 Mark Rutland <mark.rutland@arm.com>,
	 Ian Campbell <ijc+devicetree@hellion.org.uk>,
	 Kumar Gala <galak@codeaurora.org>,
	 Srinivas Kandagatla <srinivas.kandagatla@gmail.com>,
	 Maxime Coquelin <maxime.coquelin@st.com>,
	 Patrice Chotard <patrice.chotard@st.com>,
	 Russell King <linux@armlinux.org.uk>,
	 Michael Turquette <mturquette@baylibre.com>,
	 Stephen Boyd <sboyd@codeaurora.org>,
	 Olivier Bideau <olivier.bideau@st.com>,
	 Gabriel Fernandez <gabriel.fernandez@linaro.org>,
	 Geert Uytterhoeven <geert+renesas@glider.be>,
	 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	 Andrzej Hajda <a.hajda@samsung.com>,
	 Pankaj Dev <pankaj.dev@st.com>,
	 Dinh Nguyen <dinguyen@opensource.altera.com>,
	 Arnd Bergmann <arnd@arndb.de>,
	 Thierry Reding <treding@nvidia.com>
Cc: devicetree@vger.kernel.org,
	 linux-kernel@vger.kernel.org,
	 linux-arm-kernel@lists.infradead.org,
	 kernel@stlinux.com,
	 linux-clk@vger.kernel.org,
	 Lee Jones <lee.jones@linaro.org>,
	 Peter Griffin <peter.griffin@linaro.org>,
	 <arnaud.pouliquen@st.com>,
	 <benjamin.gaignard@st.com>,
	 <vincent.abriou@st.com>,
	 <gabriel.fernandez@st.com>
Subject: [RESEND PATCH v2 07/13] ARM: DT: STiH410: Enable clock propagation for audio clocks
Date: Thu, 16 Jun 2016 11:20:27 +0200
Message-Id: <1466068833-5055-8-git-send-email-gabriel.fernandez@linaro.org>
In-Reply-To: <1466068833-5055-1-git-send-email-gabriel.fernandez@linaro.org>
References: <1466068833-5055-1-git-send-email-gabriel.fernandez@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

This patch is used in the clock driver to apply a clock propagation
flag on the audio clocks of STiH410

Signed-off-by: Olivier Bideau <olivier.bideau@st.com>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
---
 arch/arm/boot/dts/stih410-clock.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stih410-clock.dtsi b/arch/arm/boot/dts/stih410-clock.dtsi
index d1f2aca..5a9a487 100644
--- a/arch/arm/boot/dts/stih410-clock.dtsi
+++ b/arch/arm/boot/dts/stih410-clock.dtsi
@@ -226,7 +226,7 @@
 
 			clk_s_d0_flexgen: clk-s-d0-flexgen {
 				#clock-cells = <1>;
-				compatible = "st,flexgen";
+				compatible = "st,flexgen-audio", "st,flexgen";
 
 				clocks = <&clk_s_d0_quadfs 0>,
 					 <&clk_s_d0_quadfs 1>,
-- 
1.9.1
