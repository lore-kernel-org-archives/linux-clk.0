Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A746C001DF
	for <linux-clk@archiver.kernel.org>; Sun,  6 Aug 2023 17:13:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbjHFRNi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 6 Aug 2023 13:13:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjHFRNh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 6 Aug 2023 13:13:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FF7DC2
        for <linux-clk@vger.kernel.org>; Sun,  6 Aug 2023 10:13:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 117E460EAE
        for <linux-clk@vger.kernel.org>; Sun,  6 Aug 2023 17:13:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DB64C433C7;
        Sun,  6 Aug 2023 17:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691342015;
        bh=8VwOuLhwvYu1ICpyXAxr3nOtAto35ExIqTjSqrKxShA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=A7yDcOUAGy0TOQasoI8de3nHnwJ2aMJwoAgm5qc76YoNlTGrCKzDYGFSKUUCm2f7q
         7GNh6F7t5sqjHV9GPTXeB+J+8OTqH17Xvfyca0Xk4Bt1DcMCbyJfOdiLU2bvzGGPnO
         BH99LhiUgcBc9+VVqN8ybZurWn4PRoUG26Zf4hQRs8y8wWOkfrmxTWMxXBHZ3mZX+z
         5AI4KriL1loB13bBFWQh6RCxSUjORPKOc7E2OFmydAJAQ/X563ATbBkbTTkhdFpX4D
         JWdL/yJGiKpmELsGObQNWh9g348nszbZ47GNIBPKVUyFURGvioOqQfTzITiOlrIdI/
         Cq40xjQ/3fxBw==
Date:   Sun, 6 Aug 2023 19:13:30 +0200
From:   Simon Horman <horms@kernel.org>
To:     Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc:     Jakub Kicinski <kuba@kernel.org>, Jiri Pirko <jiri@resnulli.us>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>,
        linux-arm-kernel@lists.infradead.org, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-clk@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>,
        intel-wired-lan@lists.osuosl.org, Jiri Pirko <jiri@nvidia.com>
Subject: Re: [PATCH net-next v2 8/9] ptp_ocp: implement DPLL ops
Message-ID: <ZM/Uuhl4GwOWjku9@vergenet.net>
References: <20230804190454.394062-1-vadim.fedorenko@linux.dev>
 <20230804190454.394062-9-vadim.fedorenko@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804190454.394062-9-vadim.fedorenko@linux.dev>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Aug 04, 2023 at 08:04:53PM +0100, Vadim Fedorenko wrote:
> Implement basic DPLL operations in ptp_ocp driver as the
> simplest example of using new subsystem.
> 
> Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
> Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
> Signed-off-by: Jiri Pirko <jiri@nvidia.com>

Hi Vadim,

...

> diff --git a/drivers/ptp/Kconfig b/drivers/ptp/Kconfig
> index 32dff1b4f891..e4da62ac9a9f 100644
> --- a/drivers/ptp/Kconfig
> +++ b/drivers/ptp/Kconfig
> @@ -177,6 +177,7 @@ config PTP_1588_CLOCK_OCP
>  	depends on COMMON_CLK
>  	select NET_DEVLINK
>  	select CRC16
> +	select DPLL
>  	help
>  	  This driver adds support for an OpenCompute time card.
>  
> diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c

...

> +static int ptp_ocp_dpll_frequency_set(const struct dpll_pin *pin,
> +				      void *pin_priv,
> +				      const struct dpll_device *dpll,
> +				      void *dpll_priv, u64 frequency,
> +				      struct netlink_ext_ack *extack)
> +{
> +	struct ptp_ocp_sma_connector *sma = pin_priv;
> +	struct ptp_ocp *bp = dpll_priv;
> +	const struct ocp_selector *tbl;
> +	int sma_nr = (sma - bp->sma);
> +	int val, i;
> +
> +	if (sma->fixed_fcn)
> +		return -EOPNOTSUPP;
> +
> +	tbl = bp->sma_op->tbl[sma->mode];
> +	for (i = 0; tbl[i].name; i++)
> +		if (tbl[i].frequency == frequency)
> +			return ptp_ocp_sma_store_val(bp, val, sma->mode, sma_nr);

val appears to be used uninitialised here.

As flagged by clang-16 W=1, and Smatch.

> +	return -EINVAL;
> +}

...

> @@ -4233,8 +4437,40 @@ ptp_ocp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  
>  	ptp_ocp_info(bp);
>  	devlink_register(devlink);
> -	return 0;
>  
> +	clkid = pci_get_dsn(pdev);
> +	bp->dpll = dpll_device_get(clkid, 0, THIS_MODULE);
> +	if (IS_ERR(bp->dpll)) {
> +		dev_err(&pdev->dev, "dpll_device_alloc failed\n");
> +		goto out;
> +	}
> +
> +	err = dpll_device_register(bp->dpll, DPLL_TYPE_PPS, &dpll_ops, bp);
> +	if (err)
> +		goto out;
> +
> +	for (i = 0; i < OCP_SMA_NUM; i++) {
> +		bp->sma[i].dpll_pin = dpll_pin_get(clkid, i, THIS_MODULE, &bp->sma[i].dpll_prop);
> +		if (IS_ERR(bp->sma[i].dpll_pin))

The function will return err.
Should it be sett to an error value here?

As flagged by Smatch.

> +			goto out_dpll;
> +
> +		err = dpll_pin_register(bp->dpll, bp->sma[i].dpll_pin, &dpll_pins_ops,
> +					&bp->sma[i]);
> +		if (err) {
> +			dpll_pin_put(bp->sma[i].dpll_pin);
> +			goto out_dpll;
> +		}
> +	}
> +	queue_delayed_work(system_power_efficient_wq, &bp->sync_work, HZ);
> +
> +	return 0;
> +out_dpll:
> +	while (i) {
> +		--i;
> +		dpll_pin_unregister(bp->dpll, bp->sma[i].dpll_pin, &dpll_pins_ops, &bp->sma[i]);
> +		dpll_pin_put(bp->sma[i].dpll_pin);
> +	}
> +	dpll_device_put(bp->dpll);
>  out:
>  	ptp_ocp_detach(bp);
>  out_disable:

...
