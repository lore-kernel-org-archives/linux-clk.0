Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:38811 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750944AbcKUHuo (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 21 Nov 2016 02:50:44 -0500
Subject: Re: [PATCH v9 09/16] mmc: sdhci: Factor out sdhci_enable_clk
To: Ritesh Harjani <riteshh@codeaurora.org>
References: <1479710246-26676-1-git-send-email-riteshh@codeaurora.org>
 <1479710246-26676-10-git-send-email-riteshh@codeaurora.org>
Cc: ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        sboyd@codeaurora.org, andy.gross@linaro.org,
        shawn.lin@rock-chips.com, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, david.brown@linaro.org,
        linux-arm-msm@vger.kernel.org, georgi.djakov@linaro.org,
        alex.lemberg@sandisk.com, mateusz.nowak@intel.com,
        Yuliy.Izrailov@sandisk.com, asutoshd@codeaurora.org,
        david.griego@linaro.org, stummala@codeaurora.org,
        venkatg@codeaurora.org, rnayak@codeaurora.org,
        pramod.gurav@linaro.org, jeremymc@redhat.com
From: Adrian Hunter <adrian.hunter@intel.com>
Message-ID: <419c6e7d-4068-4fc6-e4fc-ee0c7248a964@intel.com>
Date: Mon, 21 Nov 2016 09:45:40 +0200
MIME-Version: 1.0
In-Reply-To: <1479710246-26676-10-git-send-email-riteshh@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 21/11/16 08:37, Ritesh Harjani wrote:
> Factor out sdhci_enable_clk from sdhci_set_clock
> and make it EXPORT_SYMBOL so that it can be called.
> 
> Signed-off-by: Ritesh Harjani <riteshh@codeaurora.org>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/sdhci.c | 28 +++++++++++++++++-----------
>  drivers/mmc/host/sdhci.h |  1 +
>  2 files changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index d08d507..62aedf1 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -1344,20 +1344,10 @@ u16 sdhci_calc_clk(struct sdhci_host *host, unsigned int clock,
>  }
>  EXPORT_SYMBOL_GPL(sdhci_calc_clk);
>  
> -void sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
> +void sdhci_enable_clk(struct sdhci_host *host, u16 clk)
>  {
> -	u16 clk;
>  	unsigned long timeout;
>  
> -	host->mmc->actual_clock = 0;
> -
> -	sdhci_writew(host, 0, SDHCI_CLOCK_CONTROL);
> -
> -	if (clock == 0)
> -		return;
> -
> -	clk = sdhci_calc_clk(host, clock, &host->mmc->actual_clock);
> -
>  	clk |= SDHCI_CLOCK_INT_EN;
>  	sdhci_writew(host, clk, SDHCI_CLOCK_CONTROL);
>  
> @@ -1378,6 +1368,22 @@ void sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
>  	clk |= SDHCI_CLOCK_CARD_EN;
>  	sdhci_writew(host, clk, SDHCI_CLOCK_CONTROL);
>  }
> +EXPORT_SYMBOL_GPL(sdhci_enable_clk);
> +
> +void sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
> +{
> +	u16 clk;
> +
> +	host->mmc->actual_clock = 0;
> +
> +	sdhci_writew(host, 0, SDHCI_CLOCK_CONTROL);
> +
> +	if (clock == 0)
> +		return;
> +
> +	clk = sdhci_calc_clk(host, clock, &host->mmc->actual_clock);
> +	sdhci_enable_clk(host, clk);
> +}
>  EXPORT_SYMBOL_GPL(sdhci_set_clock);
>  
>  static void sdhci_set_power_reg(struct sdhci_host *host, unsigned char mode,
> diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
> index 9c35776..2fe9e80 100644
> --- a/drivers/mmc/host/sdhci.h
> +++ b/drivers/mmc/host/sdhci.h
> @@ -682,6 +682,7 @@ static inline bool sdhci_sdio_irq_enabled(struct sdhci_host *host)
>  u16 sdhci_calc_clk(struct sdhci_host *host, unsigned int clock,
>  		   unsigned int *actual_clock);
>  void sdhci_set_clock(struct sdhci_host *host, unsigned int clock);
> +void sdhci_enable_clk(struct sdhci_host *host, u16 clk);
>  void sdhci_set_power(struct sdhci_host *host, unsigned char mode,
>  		     unsigned short vdd);
>  void sdhci_set_power_noreg(struct sdhci_host *host, unsigned char mode,
> 

