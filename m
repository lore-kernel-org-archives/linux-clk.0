Return-Path: <gregory.clement@free-electrons.com>
From: Gregory CLEMENT <gregory.clement@free-electrons.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	linux-mmc@vger.kernel.org
Cc: Jason Cooper <jason@lakedaemon.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory CLEMENT <gregory.clement@free-electrons.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	linux-arm-kernel@lists.infradead.org,
	Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Ziji Hu <huziji@marvell.com>,
	Jimmy Xu <zmxu@marvell.com>,
	Jisheng Zhang <jszhang@marvell.com>,
	Nadav Haklai <nadavh@marvell.com>,
	Ryan Gao <ygao@marvell.com>,
	Doug Jones <dougj@marvell.com>,
	Victor Gu <xigu@marvell.com>,
	"Wei(SOCP) Liu" <liuw@marvell.com>,
	Wilson Ding <dingwei@marvell.com>,
	Yehuda Yitschak <yehuday@marvell.com>,
	Marcin Wojtas <mw@semihalf.com>,
	Hanna Hawa <hannah@marvell.com>,
	Kostya Porotchkin <kostap@marvell.com>
Subject: [PATCH v7 05/13] mmc: sdhci: Export sdhci_enable_sdio_irq() from sdhci.c
Date: Thu, 30 Mar 2017 17:22:57 +0200
Message-Id: <eb72f50cf8a5dc4cfbcf2f9464d6781e8b71d70e.1490886907.git-series.gregory.clement@free-electrons.com>
In-Reply-To: <cover.51071caa64e5df81264a91b9a81ed1e94f47d2c4.1490886907.git-series.gregory.clement@free-electrons.com>
References: <cover.51071caa64e5df81264a91b9a81ed1e94f47d2c4.1490886907.git-series.gregory.clement@free-electrons.com>
In-Reply-To: <cover.51071caa64e5df81264a91b9a81ed1e94f47d2c4.1490886907.git-series.gregory.clement@free-electrons.com>
References: <cover.51071caa64e5df81264a91b9a81ed1e94f47d2c4.1490886907.git-series.gregory.clement@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

From: Hu Ziji <huziji@marvell.com>

Export sdhci_enable_sdio_irq() from sdhci.c.
Thus vendor SDHC driver can implement its specific SDIO irq
control.

Signed-off-by: Hu Ziji <huziji@marvell.com>
Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/mmc/host/sdhci.c | 3 ++-
 drivers/mmc/host/sdhci.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index cc5bb9fb7706..5e090227c6c7 100644
--- a/drivers/mmc/host/sdhci.c
+++ b/drivers/mmc/host/sdhci.c
@@ -1832,7 +1832,7 @@ static void sdhci_enable_sdio_irq_nolock(struct sdhci_host *host, int enable)
 	}
 }
 
-static void sdhci_enable_sdio_irq(struct mmc_host *mmc, int enable)
+void sdhci_enable_sdio_irq(struct mmc_host *mmc, int enable)
 {
 	struct sdhci_host *host = mmc_priv(mmc);
 	unsigned long flags;
@@ -1846,6 +1846,7 @@ static void sdhci_enable_sdio_irq(struct mmc_host *mmc, int enable)
 	sdhci_enable_sdio_irq_nolock(host, enable);
 	spin_unlock_irqrestore(&host->lock, flags);
 }
+EXPORT_SYMBOL_GPL(sdhci_enable_sdio_irq);
 
 int sdhci_start_signal_voltage_switch(struct mmc_host *mmc,
 				      struct mmc_ios *ios)
diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
index a741d8da6227..78437f82609e 100644
--- a/drivers/mmc/host/sdhci.h
+++ b/drivers/mmc/host/sdhci.h
@@ -706,6 +706,7 @@ int sdhci_execute_tuning(struct mmc_host *mmc, u32 opcode);
 void sdhci_set_ios(struct mmc_host *mmc, struct mmc_ios *ios);
 int sdhci_start_signal_voltage_switch(struct mmc_host *mmc,
 				      struct mmc_ios *ios);
+void sdhci_enable_sdio_irq(struct mmc_host *mmc, int enable);
 
 #ifdef CONFIG_PM
 int sdhci_suspend_host(struct sdhci_host *host);
-- 
git-series 0.9.1
