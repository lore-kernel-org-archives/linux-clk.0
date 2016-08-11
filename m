Return-Path: <broonie@sirena.org.uk>
From: Mark Brown <broonie@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Date: Thu, 11 Aug 2016 12:30:49 +0100
Message-Id: <1470915049-15249-1-git-send-email-broonie@kernel.org>
Subject: [PATCH] clk: Make clock framework user selectable
List-ID: <linux-clk.vger.kernel.org>

Some architectures like x86 don't use the clock API in architecture code
but one of the advantages of the common clock API is that it can be used
by regular devices to represent their clocking structures so we should
allow users to enable the clock API themselves even if the architecture
doesn't need it. This is more straightforward than going round every
architecture and convincing their maintainers to add the select.

Unfortunately some architectures do still provide a custom implementation
of the clock API which is incompatible with common clock. Provide a config
option HAS_CUSTOM_CLK which these architectures can select in order to
prevent COMMON_CLK being enabled.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/clk/Kconfig | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index e2d9bd760c84..08a0b2cd49c6 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -7,7 +7,8 @@ config HAVE_CLK_PREPARE
 	bool
 
 config COMMON_CLK
-	bool
+	bool "Common Clock Framework Support"
+	depends on !HAVE_CUSTOM_CLK
 	select HAVE_CLK_PREPARE
 	select CLKDEV_LOOKUP
 	select SRCU
@@ -19,6 +20,9 @@ config COMMON_CLK
 	  Architectures utilizing the common struct clk should select
 	  this option.
 
+config HAVE_CUSTOM_CLK
+	bool
+
 menu "Common Clock Framework"
 	depends on COMMON_CLK
 
-- 
2.8.1
