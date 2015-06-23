Return-Path: <gabriel.fernandez@linaro.org>
Return-Path: <gabriel.fernandez@linaro.org>
From: Gabriel Fernandez <gabriel.fernandez@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	 Pawel Moll <pawel.moll@arm.com>,
	 Mark Rutland <mark.rutland@arm.com>,
	 Ian Campbell <ijc+devicetree@hellion.org.uk>,
	 Kumar Gala <galak@codeaurora.org>,
	 Srinivas Kandagatla <srinivas.kandagatla@gmail.com>,
	 Maxime Coquelin <maxime.coquelin@st.com>,
	 Patrice Chotard <patrice.chotard@st.com>,
	 Russell King <linux@arm.linux.org.uk>,
	 Michael Turquette <mturquette@baylibre.com>,
	 Stephen Boyd <sboyd@codeaurora.org>,
	 Gabriel Fernandez <gabriel.fernandez@linaro.org>,
	 Peter Griffin <peter.griffin@linaro.org>,
	 Pankaj Dev <pankaj.dev@st.com>,
	 Olivier Bideau <olivier.bideau@st.com>,
	 Javier Martinez Canillas <javier.martinez@collabora.co.uk>,
	 Geert Uytterhoeven <geert+renesas@glider.be>,
	 Fabian Frederick <fabf@skynet.be>
Cc: devicetree@vger.kernel.org,
	 linux-kernel@vger.kernel.org,
	 linux-arm-kernel@lists.infradead.org,
	 kernel@stlinux.com,
	 linux-clk@vger.kernel.org
Subject: [PATCH 7/9] drivers: clk: st: Fix mux bit-setting for Cortex A9 clocks
Date: Tue, 23 Jun 2015 16:09:25 +0200
Message-Id: <1435068567-30995-8-git-send-email-gabriel.fernandez@linaro.org>
In-Reply-To: <1435068567-30995-1-git-send-email-gabriel.fernandez@linaro.org>
References: <1435068567-30995-1-git-send-email-gabriel.fernandez@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

This patch fixes the mux bit-setting for ClockgenA9.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
---
 drivers/clk/st/clkgen-mux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/st/clkgen-mux.c b/drivers/clk/st/clkgen-mux.c
index 3919a67..ecb492e 100644
--- a/drivers/clk/st/clkgen-mux.c
+++ b/drivers/clk/st/clkgen-mux.c
@@ -586,7 +586,7 @@ static struct clkgen_mux_data stih416_a9_mux_data = {
 };
 static struct clkgen_mux_data stih407_a9_mux_data = {
 	.offset = 0x1a4,
-	.shift = 1,
+	.shift = 0,
 	.width = 2,
 };
 
-- 
1.9.1
