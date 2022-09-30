Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22094C4332F
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 06:25:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbiI3GZi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 02:25:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbiI3GZg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 02:25:36 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2F82F0899
        for <linux-clk@vger.kernel.org>; Thu, 29 Sep 2022 23:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1664519129; x=1696055129;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KbWdEfpFeC75tJ9Kcq0fAg4H1GPCjEQKuRMgacEA3i8=;
  b=DhzkxW3iWeQjr4RhiTBgRNCcTJ7nZJLb5NjiAv50Dnu6nm0S2HopIkTq
   tcYNtZQ/l3eoM23ehLpOjXTgchot+5qjKAobRLrWE9voJdgcQdMV8VU4m
   1bPCu0VDZM2IllittSj3i8uxCMYUeXKGY3skLPgNQbmhuIPE7qpIXRcRG
   bdKY/ChR8PTZuvpWYCpu2HKkbMFOg9DMcmFEGPwMCGyh9YxGNTfKKgKYX
   NNNywTjIozoLXasSdyvMvBkPAredFvE2hQv5m81uFOQO1vM8SMujku0ZX
   nYWx1P+hapKJ1OoPpYe6N4IcC2VSXGXZqcb4XMBRcsY2xVzobLxxHCTNm
   g==;
X-IronPort-AV: E=Sophos;i="5.93,357,1654552800"; 
   d="scan'208";a="26496115"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 30 Sep 2022 08:25:26 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 30 Sep 2022 08:25:26 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 30 Sep 2022 08:25:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1664519126; x=1696055126;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KbWdEfpFeC75tJ9Kcq0fAg4H1GPCjEQKuRMgacEA3i8=;
  b=jFTEvr8bep1BZeB+uBggLqSxCUODfchDwxuxXM8qf1SZ1qSN39RHEbzV
   diQZ1xTvmooNVKcYP3LTFBbNwfo/9rJ+g1mR5mgmZ/CY0m/g09pt4dQuS
   cRQm1NR24IXfJLM4WGfqmMvh5vv8UDU9pwL/9YgXhQ3hGkMtzWc0K1AcC
   8DyMw+oMpQE7At0z5Kcutq6X2GNcW1LDfp80NtjIGjeZb63RmRfpnbfNb
   LVrdZjkE/urRDqrjdCO5xCTK+/ZZTZZ16tiAlsUqVMCqrbcpz9+B8sePT
   joZN4WdAQSJkWC9DZi7BdiYWqeuDKVgfhSXTXdqOvO9p1JlgEm0gl2MV1
   g==;
X-IronPort-AV: E=Sophos;i="5.93,357,1654552800"; 
   d="scan'208";a="26496114"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 30 Sep 2022 08:25:26 +0200
Received: from steina-w.localnet (unknown [10.123.49.11])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id B0EAF280056;
        Fri, 30 Sep 2022 08:25:25 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     linux-clk@vger.kernel.org, Marek Vasut <marex@denx.de>
Cc:     Marek Vasut <marex@denx.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4] clk: rs9: Fix I2C accessors
Date:   Fri, 30 Sep 2022 08:25:23 +0200
Message-ID: <12086721.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220929195521.284497-1-marex@denx.de>
References: <20220929195521.284497-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Marek,

Am Donnerstag, 29. September 2022, 21:55:21 CEST schrieb Marek Vasut:
> Add custom I2C accessors to this driver, since the regular I2C regmap ones
> do not generate the exact I2C transfers required by the chip. On I2C write,
> it is mandatory to send transfer length first, on read the chip returns the
> transfer length in first byte. Instead of always reading back 8 bytes, which
> is the default and also the size of the entire register file, set BCP
> register to 1 to read out 1 byte which is less wasteful.
> 
> Fixes: 892e0ddea1aa ("clk: rs9: Add Renesas 9-series PCIe clock generator
> driver") Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> V2: Fix endianness handling in rs9_regmap_i2c_read() i2c_transfer
> V3: - Disable regcache, the driver does a couple of I2C writes on boot
>       and that is all, so it only adds complexity
>     - Set regmap max_register to RS9_REG_BCP which is the correct one
> V4: - Do not use I2C_M_RECV_LEN due to overhead, it requires buffer 4
>       times the size of this devices' register file, just read two bytes
>       via I2C
> ---
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> ---
>  drivers/clk/clk-renesas-pcie.c | 65 ++++++++++++++++++++++++++++++++--
>  1 file changed, 62 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
> index 4f5df1fc74b46..e6247141d0c05 100644
> --- a/drivers/clk/clk-renesas-pcie.c
> +++ b/drivers/clk/clk-renesas-pcie.c
> @@ -90,13 +90,66 @@ static const struct regmap_access_table
> rs9_writeable_table = { .n_yes_ranges = ARRAY_SIZE(rs9_writeable_ranges),
>  };
> 
> +static int rs9_regmap_i2c_write(void *context,
> +				unsigned int reg, unsigned int 
val)
> +{
> +	struct i2c_client *i2c = context;
> +	const u8 data[3] = { reg, 1, val };
> +	const int count = ARRAY_SIZE(data);
> +	int ret;
> +
> +	ret = i2c_master_send(i2c, data, count);
> +	if (ret == count)
> +		return 0;
> +	else if (ret < 0)
> +		return ret;
> +	else
> +		return -EIO;
> +}
> +
> +static int rs9_regmap_i2c_read(void *context,
> +			       unsigned int reg, unsigned int *val)
> +{
> +	struct i2c_client *i2c = context;
> +	struct i2c_msg xfer[2];
> +	u8 txdata = reg;
> +	u8 rxdata[2];
> +	int ret;
> +
> +	xfer[0].addr = i2c->addr;
> +	xfer[0].flags = 0;
> +	xfer[0].len = 1;
> +	xfer[0].buf = (void *)&txdata;
> +
> +	xfer[1].addr = i2c->addr;
> +	xfer[1].flags = I2C_M_RD;
> +	xfer[1].len = 2;
> +	xfer[1].buf = (void *)rxdata;
> +
> +	ret = i2c_transfer(i2c->adapter, xfer, 2);
> +	if (ret < 0)
> +		return ret;
> +	if (ret != 2)
> +		return -EIO;
> +
> +	/*
> +	 * Byte 0 is transfer length, which is always 1 due
> +	 * to BCP register programming to 1 in rs9_probe(),
> +	 * ignore it and use data from Byte 1.
> +	 */

This comments only holds true until cache is enabled again. Cache is 
initialized by from reading registers using this function before BCP is set :)
Anyway, that's good for now:
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> +	*val = rxdata[1];
> +	return 0;
> +}
> +
>  static const struct regmap_config rs9_regmap_config = {
>  	.reg_bits = 8,
>  	.val_bits = 8,
> -	.cache_type = REGCACHE_FLAT,
> -	.max_register = 0x8,
> +	.cache_type = REGCACHE_NONE,
> +	.max_register = RS9_REG_BCP,
>  	.rd_table = &rs9_readable_table,
>  	.wr_table = &rs9_writeable_table,
> +	.reg_write = rs9_regmap_i2c_write,
> +	.reg_read = rs9_regmap_i2c_read,
>  };
> 
>  static int rs9_get_output_config(struct rs9_driver_data *rs9, int idx)
> @@ -242,11 +295,17 @@ static int rs9_probe(struct i2c_client *client)
>  			return ret;
>  	}
> 
> -	rs9->regmap = devm_regmap_init_i2c(client, &rs9_regmap_config);
> +	rs9->regmap = devm_regmap_init(&client->dev, NULL,
> +				       client, 
&rs9_regmap_config);
>  	if (IS_ERR(rs9->regmap))
>  		return dev_err_probe(&client->dev, PTR_ERR(rs9->regmap),
>  				     "Failed to allocate register 
map\n");
> 
> +	/* Always read back 1 Byte via I2C */
> +	ret = regmap_write(rs9->regmap, RS9_REG_BCP, 1);
> +	if (ret < 0)
> +		return ret;
> +
>  	/* Register clock */
>  	for (i = 0; i < rs9->chip_info->num_clks; i++) {
>  		snprintf(name, 5, "DIF%d", i);




