Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F99ECAAD5
	for <linux-clk@archiver.kernel.org>; Mon, 12 Sep 2022 06:46:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbiILGqj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Sep 2022 02:46:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiILGqi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Sep 2022 02:46:38 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66C2818B0E
        for <linux-clk@vger.kernel.org>; Sun, 11 Sep 2022 23:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1662965196; x=1694501196;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M3u7xeqMwROMeNrp0MNdsFNAwLduQe5wSQJbL9nGcjU=;
  b=BAfdFjhKfxmFpD5HxnPwVn+Mplfl0cJJiJTxiYuE5lEPe/O4AqqyT946
   mvhOULwg6J8laJXX5rtM2fBmkJOrwJbp/qq1tBZBcsmte5dHCsowCnzpJ
   Xrh7jomhIZ3TrMTYMbMD7+eqGv4Mkeh7V/ThKUMy2ss0MQSRoiK2lM3uw
   fAyQdgyXOtVymTJhdLjd3rksxAQOnOKaGm8c9xpkHktbTUj6OV3SPor8J
   vPP2WWmNSd2gBu80y9KIaymAofyJlhI2Lpd/urZh5XUc1mqSPiH+SD8An
   84nZBwtNNPDZ1p8zCskZ+tH4Gy4hVxb9CZzXFDQICdCkaRs5Of++WCE8G
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,308,1654552800"; 
   d="scan'208";a="26110790"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 12 Sep 2022 08:46:34 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 12 Sep 2022 08:46:33 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 12 Sep 2022 08:46:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1662965194; x=1694501194;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M3u7xeqMwROMeNrp0MNdsFNAwLduQe5wSQJbL9nGcjU=;
  b=G4jmIjkr6q6JALyuVNRb3GZRJ38w1k+GbxFJ2L0yMbhY99Ayd5VawyH4
   zZoCredHPBwB+qFt9U+w9k5mlfCk5+VRbuV1SYleZupnF3CmgJEEI7qBC
   pye1WIngShRiqh70HlEIllag+WZeEhlC16aq86cGC0OJWSqVmQ81Q43wA
   elpkRwt0IfKkxjdvpzQAhMPdm+E00RvW8zKTVOtoigVHjdTaZFnO14MqH
   JwtNxQIY2LCq9Gbm4B9py+6HEdAlUX+o2xr7gCG45MLouq2OtLAJkDgJT
   9j76sH7cwnKfBCW/5Vpnij4UL0MJXduXTCjYkPRuqcbB/X4PdTtLpyfyP
   w==;
X-IronPort-AV: E=Sophos;i="5.93,308,1654552800"; 
   d="scan'208";a="26110788"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 12 Sep 2022 08:46:33 +0200
Received: from steina-w.localnet (unknown [10.123.49.11])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id AF973280056;
        Mon, 12 Sep 2022 08:46:33 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-clk@vger.kernel.org, Marek Vasut <marex@denx.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: rs9: Fix I2C accessors
Date:   Mon, 12 Sep 2022 08:46:31 +0200
Message-ID: <12053354.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220910232015.216329-1-marex@denx.de>
References: <20220910232015.216329-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Marek,

thanks for the patch.

Am Sonntag, 11. September 2022, 01:20:15 CEST schrieb Marek Vasut:
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
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> ---
>  drivers/clk/clk-renesas-pcie.c | 53 +++++++++++++++++++++++++++++++++-
>  1 file changed, 52 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
> index 4f5df1fc74b46..711ba443f33b7 100644
> --- a/drivers/clk/clk-renesas-pcie.c
> +++ b/drivers/clk/clk-renesas-pcie.c
> @@ -90,6 +90,49 @@ static const struct regmap_access_table
> rs9_writeable_table = { .n_yes_ranges = ARRAY_SIZE(rs9_writeable_ranges),
>  };
> 
> +static int rs9_regmap_i2c_write(void *context, unsigned int reg, unsigned
> int val) +{
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
> +	u8 data[2];
> +	int ret;
> +
> +	xfer[0].addr = i2c->addr;
> +	xfer[0].flags = 0;
> +	xfer[0].len = 1;
> +	xfer[0].buf = (void *)&reg;

This does work only for little-endian machines, right?

> +
> +	xfer[1].addr = i2c->addr;
> +	xfer[1].flags = I2C_M_RD | I2C_M_RECV_LEN;
> +	xfer[1].len = 1;
> +	xfer[1].buf = (void *)data;
> +
> +	ret = i2c_transfer(i2c->adapter, xfer, 2);
> +	if (ret == 2)
> +		return 0;

You are missing setting 'val' here.

> +	else if (ret < 0)
> +		return ret;
> +	else
> +		return -EIO;
> +}
> +
>  static const struct regmap_config rs9_regmap_config = {
>  	.reg_bits = 8,
>  	.val_bits = 8,
> @@ -97,6 +140,8 @@ static const struct regmap_config rs9_regmap_config = {
>  	.max_register = 0x8,
>  	.rd_table = &rs9_readable_table,
>  	.wr_table = &rs9_writeable_table,
> +	.reg_write = rs9_regmap_i2c_write,
> +	.reg_read = rs9_regmap_i2c_read,
>  };
> 
>  static int rs9_get_output_config(struct rs9_driver_data *rs9, int idx)
> @@ -242,11 +287,17 @@ static int rs9_probe(struct i2c_client *client)
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


For some reason this doesn't work with cache being enabled. No idea why this 
happens though.

Best regards,
Alexander



