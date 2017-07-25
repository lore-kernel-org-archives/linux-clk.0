Return-Path: <pdeschrijver@nvidia.com>
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad
	<pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, "Stephen
 Boyd" <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, <linux-clk@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Alex Frid <afrid@nvidia.com>
Subject: [PATCH 07/14] clk: tegra: Add TEGRA_PERIPH_ON_APB flag to I2C
Date: Tue, 25 Jul 2017 13:34:08 +0300
Message-ID: <1500978856-5981-8-git-send-email-pdeschrijver@nvidia.com>
In-Reply-To: <1500978856-5981-1-git-send-email-pdeschrijver@nvidia.com>
References: <1500978856-5981-1-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: pdeschrijver@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

From: Alex Frid <afrid@nvidia.com>

I2C controllers are also on the APB bus and therefor need this flag to handle
resets correctly.

Signed-off-by: Alex Frid <afrid@nvidia.com>
Reviewed-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk-tegra-periph.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index 294bfe4..848255c 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -216,7 +216,8 @@
 			     _clk_num, _clk_id)			\
 	TEGRA_INIT_DATA_TABLE(_name, NULL, NULL, _parents, _offset,\
 			30, MASK(2), 0, 0, 16, 0, TEGRA_DIVIDER_ROUND_UP,\
-			_clk_num, 0, _clk_id, _parents##_idx, 0, NULL)
+			_clk_num, TEGRA_PERIPH_ON_APB, _clk_id, \
+			_parents##_idx, 0, NULL)
 
 #define XUSB(_name, _parents, _offset, \
 			     _clk_num, _gate_flags, _clk_id)	 \
-- 
1.9.1
