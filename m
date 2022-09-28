Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6BA1C32771
	for <linux-clk@archiver.kernel.org>; Wed, 28 Sep 2022 07:36:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233729AbiI1Hgy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 03:36:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233466AbiI1HgS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 03:36:18 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B5D1107599
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 00:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1664350548; x=1695886548;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=otKn7OwoFsXCrEvhetC8t9/G3EV2BY7tBF6g9XjRrOU=;
  b=Lo2XDpPGfUDMHlE+TweUeKSVV6swk/EFmTRkqSkvNwZW2fohPp+SENWB
   cZ54bleI4+2gXLMPq4a+8LuWGA/SpM0R1A9O2Hig+NW0oxalxv21Bd72S
   ZQVCynUS5yFvu+ALxDnBY6dsobkYh2MPxYbYnjS6cEF22RvmeT4XI8GT5
   y6HNDiW3cVORNeyR+gtNncIAt7X0pIJeOfxfOlHZ85PSuSuYjysEVhUjd
   p4bDMS1OKADLsY3+vlKGnm5hRYizWteOInhOOrvyXVxDwzEf6m2KTGp9E
   1+o1zFwarNMRDNpdP2877BY7xun2dFE908QAyIpLiivGcmCYxcg5u8PTb
   w==;
X-IronPort-AV: E=Sophos;i="5.93,351,1654552800"; 
   d="scan'208";a="26445561"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 28 Sep 2022 09:35:05 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 28 Sep 2022 09:35:05 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 28 Sep 2022 09:35:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1664350505; x=1695886505;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=otKn7OwoFsXCrEvhetC8t9/G3EV2BY7tBF6g9XjRrOU=;
  b=TJ14XV8oSWw10pbMVbjF4y2PAdfqNMbMlDd01QB/N2I2oAqpJwfbSiK8
   Zp6jRHHwtzmr1R3uVaqqaCIvR+zVkQjLlOpnKw1q7BP9JyU7r2c08d4cZ
   XSyedpD/mLq90UnD5vCsr0RWdwaHw9lppQ2L5SCWaIp50JLMHSCBCKjMc
   ET9BeY/uAyWfu/JwgoqbiD1gPyO4808iWT+jKvV9m8Eho7rrc6f+TKCcA
   YQPN2Y2RmWYHVLre98xcx/hOKIjPMV9Dy0TIu0PpyO260QUPpzmSsMPEN
   UKXQap7HhF1lgVzvyv421/YJsGYZz7CtsAkuaEJbSwiAehCQ9pTbSH2VU
   g==;
X-IronPort-AV: E=Sophos;i="5.93,351,1654552800"; 
   d="scan'208";a="26445560"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 28 Sep 2022 09:35:05 +0200
Received: from steina-w.localnet (unknown [10.123.49.11])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id F1CDE280056;
        Wed, 28 Sep 2022 09:35:04 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-clk@vger.kernel.org, Marek Vasut <marex@denx.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3] clk: rs9: Fix I2C accessors
Date:   Wed, 28 Sep 2022 09:35:02 +0200
Message-ID: <3198374.44csPzL39Z@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220927214415.418140-1-marex@denx.de>
References: <20220927214415.418140-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Marek,

thanks for the update.

Am Dienstag, 27. September 2022, 23:44:14 CEST schrieb Marek Vasut:
> Add custom I2C accessors to this driver, since the regular I2C regmap ones
> do not generate the exact I2C transfers required by the chip. On I2C write,
> it is mandatory to send transfer length first, on read the chip returns the
> transfer length in first byte. Instead of always reading back 8 bytes, which
> is the default and also the size of the entire register file, set BCP
> register to 1 to read out 1 byte which is less wasteful.
> 
> Fixes: 892e0ddea1aa6 ("clk: rs9: Add Renesas 9-series PCIe clock generator
> driver") Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> V2: Fix endianness handling in rs9_regmap_i2c_read() i2c_transfer
> V3: - Disable regcache, the driver does a couple of I2C writes on boot
>       and that is all, so it only adds complexity
>     - Set regmap max_register to RS9_REG_BCP which is the correct one
> ---
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> ---
>  drivers/clk/clk-renesas-pcie.c | 60 ++++++++++++++++++++++++++++++++--
>  1 file changed, 57 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
> index 4f5df1fc74b46..138aaab05fc8a 100644
> --- a/drivers/clk/clk-renesas-pcie.c
> +++ b/drivers/clk/clk-renesas-pcie.c
> @@ -90,13 +90,61 @@ static const struct regmap_access_table
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
> +	xfer[1].flags = I2C_M_RD | I2C_M_RECV_LEN;
> +	xfer[1].len = 1;

I'm still in favor of removing I2C_M_RECV_LEN and setting len=2. This 
currently works only, because there is no read access between 
devm_regmap_init() call and regmap_write() to RS9_REG_BCP.
Enabling cache later on again this will corrupt the stack.

Best regards,
Alexander

> +	xfer[1].buf = (void *)rxdata;
> +
> +	ret = i2c_transfer(i2c->adapter, xfer, 2);
> +	if (ret < 0)
> +		return ret;
> +	if (ret != 2)
> +		return -EIO;
> +
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
> @@ -242,11 +290,17 @@ static int rs9_probe(struct i2c_client *client)
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




