Return-Path: <adrian.hunter@intel.com>
Subject: Re: [PATCH v6 05/14] mmc: sdhci: Export
 sdhci_start_signal_voltage_switch() in sdhci.c
To: Gregory CLEMENT <gregory.clement@free-electrons.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
References: <cover.ff78bebe0384f650a51e5e6f0f1dca6e7894b53b.1487091464.git-series.gregory.clement@free-electrons.com>
 <ebab2ad6a83a91683c9589b976a6975141167296.1487091464.git-series.gregory.clement@free-electrons.com>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org,
 Mike Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, Ziji Hu <huziji@marvell.com>,
 Jimmy Xu <zmxu@marvell.com>, Jisheng Zhang <jszhang@marvell.com>,
 Nadav Haklai <nadavh@marvell.com>, Ryan Gao <ygao@marvell.com>,
 Doug Jones <dougj@marvell.com>, Victor Gu <xigu@marvell.com>,
 "Wei(SOCP) Liu" <liuw@marvell.com>, Wilson Ding <dingwei@marvell.com>,
 Yehuda Yitschak <yehuday@marvell.com>, Marcin Wojtas <mw@semihalf.com>,
 Hanna Hawa <hannah@marvell.com>, Kostya Porotchkin <kostap@marvell.com>
From: Adrian Hunter <adrian.hunter@intel.com>
Message-ID: <0648f4c1-6acf-00c3-bc5c-c7f029d1eec5@intel.com>
Date: Wed, 22 Mar 2017 16:49:10 +0200
MIME-Version: 1.0
In-Reply-To: <ebab2ad6a83a91683c9589b976a6975141167296.1487091464.git-series.gregory.clement@free-electrons.com>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 14/02/17 19:01, Gregory CLEMENT wrote:
> From: Hu Ziji <huziji@marvell.com>
> 
> Export sdhci_start_signal_voltage_switch() from sdhci.c.
> Thus vendor sdhci driver can implement its own signal voltage
> switch routine.
> 
> Signed-off-by: Hu Ziji <huziji@marvell.com>
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/sdhci.c | 5 +++--
>  drivers/mmc/host/sdhci.h | 2 ++
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index 0e9ed0fadff9..d2338dc362f4 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -1839,8 +1839,8 @@ static void sdhci_enable_sdio_irq(struct mmc_host *mmc, int enable)
>  	spin_unlock_irqrestore(&host->lock, flags);
>  }
>  
> -static int sdhci_start_signal_voltage_switch(struct mmc_host *mmc,
> -					     struct mmc_ios *ios)
> +int sdhci_start_signal_voltage_switch(struct mmc_host *mmc,
> +				      struct mmc_ios *ios)
>  {
>  	struct sdhci_host *host = mmc_priv(mmc);
>  	u16 ctrl;
> @@ -1932,6 +1932,7 @@ static int sdhci_start_signal_voltage_switch(struct mmc_host *mmc,
>  		return 0;
>  	}
>  }
> +EXPORT_SYMBOL_GPL(sdhci_start_signal_voltage_switch);
>  
>  static int sdhci_card_busy(struct mmc_host *mmc)
>  {
> diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
> index 3563c0c384ca..e4a07543a12b 100644
> --- a/drivers/mmc/host/sdhci.h
> +++ b/drivers/mmc/host/sdhci.h
> @@ -692,6 +692,8 @@ void sdhci_reset(struct sdhci_host *host, u8 mask);
>  void sdhci_set_uhs_signaling(struct sdhci_host *host, unsigned timing);
>  int sdhci_execute_tuning(struct mmc_host *mmc, u32 opcode);
>  void sdhci_set_ios(struct mmc_host *mmc, struct mmc_ios *ios);
> +int sdhci_start_signal_voltage_switch(struct mmc_host *mmc,
> +				      struct mmc_ios *ios);
>  
>  #ifdef CONFIG_PM
>  extern int sdhci_suspend_host(struct sdhci_host *host);
> 
