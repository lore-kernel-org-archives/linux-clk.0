Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D9CFC07E9D
	for <linux-clk@archiver.kernel.org>; Mon, 26 Sep 2022 06:37:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232814AbiIZGh3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Sep 2022 02:37:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233811AbiIZGhF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Sep 2022 02:37:05 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D45FE1EAE8
        for <linux-clk@vger.kernel.org>; Sun, 25 Sep 2022 23:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1664174216; x=1695710216;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NI5qs76f7La81N/G0wKVHmd6pKLNvsuOYewYM4Byc40=;
  b=Bml7H1zD4ciHraYZY/cm4nMB/ZXnv9rJi+6f4XlzcYuexcG1+YgsRXp2
   pYlNjMsHkKfbeIfsd9FCS6DnUWWjgN6mEye2tzmxdr30ccJzjkEO9k0Tx
   IORNhgo8ketFDtUu6DQmjCvhe8KuwwZq/sW8y+sgfZb3BhxtED6rpMwVR
   jJ+Unn3BbMmPmG2Vzs/JE6MjkBSoMcLMou0AJAkuebm9cRb5qpp4LUZPs
   bZt4JIK7TOo6fsPr9i3EchLZjdgHXjqZrW1z0r10RT1Kw0Rv8kNrubLAV
   5q2K4KnpojIsmStlr32XaZuhO0TQKnHby9bTQajl4U2KBUkruuQeNXadJ
   g==;
X-IronPort-AV: E=Sophos;i="5.93,345,1654552800"; 
   d="scan'208";a="26381078"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 26 Sep 2022 08:36:53 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 26 Sep 2022 08:36:53 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 26 Sep 2022 08:36:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1664174213; x=1695710213;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=NI5qs76f7La81N/G0wKVHmd6pKLNvsuOYewYM4Byc40=;
  b=qxepJO9QpfeR6qPIS2LrJjP1YaogyQtLpRWnxE+i0LeOJbex195Ea4RF
   jxXT8qb7pjLoPcO/VhYCQlZJSblJKbCUvc9yNySSr3C3X8UvDdpqhYEus
   slnyrdJ45J3xtrVBDkcViIsztzXxnRiixEmFnZWkX7uy0HQIJnaQeFANq
   cPP38B7IeInQ1qkj44EzgMjPKLdCBCCHqG6PXqEFtmHa3UZSoEH5xocFA
   uUzS6NiXH23Yyc8GfSV22JMxE/X32gBeGrZNg4wbn41gkZCIGmToCjAyY
   aiIgHnCqLwr8pOsfI+UU7rglWuC3nQZtsbrvWJccJ+yCe/J5n8aGuZjpw
   g==;
X-IronPort-AV: E=Sophos;i="5.93,345,1654552800"; 
   d="scan'208";a="26381076"
Subject: Re: [PATCH v2] clk: rs9: Fix I2C accessors
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 26 Sep 2022 08:36:53 +0200
Received: from steina-w.localnet (unknown [10.123.49.11])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 217C0280056;
        Mon, 26 Sep 2022 08:36:53 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     linux-clk@vger.kernel.org, Marek Vasut <marex@denx.de>
Cc:     Marek Vasut <marex@denx.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Date:   Mon, 26 Sep 2022 08:36:50 +0200
Message-ID: <4745081.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220924164933.393649-1-marex@denx.de>
References: <20220924164933.393649-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Marek,

thanks for the update.
To answer your question regarding the cache: With this patch I get the 
following:
$ cat /sys/kernel/debug/regmap/1-0068/registers 
0: 00
1: 00
2: 00
3: 00
4: 00
5: 00
6: 00
7: 01
8: 00

Which is obviously wrong. Reason is that the cache is not allocated without a 
known size. This can be fixed using this patch:
---8<---
diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index 5b37d6a2e908..f1c185980466 100644
--- a/drivers/clk/clk-renesas-pcie.c
+++ b/drivers/clk/clk-renesas-pcie.c
@@ -140,7 +140,8 @@ static const struct regmap_config rs9_regmap_config = {
        .reg_bits = 8,
        .val_bits = 8,
        .cache_type = REGCACHE_FLAT,
-       .max_register = 0x8,
+       .max_register = 0x7,
+       .num_reg_defaults_raw = 0x8,
        .rd_table = &rs9_readable_table,
        .wr_table = &rs9_writeable_table,
        .reg_write = rs9_regmap_i2c_write,
---8<---

Unfortunately now the cache is initialized before RS9_REG_BCP is set to 1, 
resulting in the following panic:
[   17.221637] Kernel panic - not syncing: stack-protector: Kernel stack is 
corrupted in: rs9_regmap_i2c_read+0xb4/0xb4 [clk_renesas_pcie]
[   16.862107] CPU: 3 PID: 277 Comm: systemd-udevd Not tainted 6.0.0-rc6-
next-20220923+ #764 d22d7e904fab3397adb372dbcb36af4e5b1f49bd
[   16.862118] Hardware name: TQ-Systems GmbH i.MX8MM TQMa8MxML on MBa8Mx (DT)                                                       
[   16.862123] Call trace:                                                                                                           
[   16.862125]  dump_backtrace+0xd8/0x130                                                                                            
[   16.862136]  show_stack+0x14/0x40                                                                                                 
[   16.862141]  dump_stack_lvl+0x88/0xb0                                                                                             
[   16.862147]  dump_stack+0x14/0x2c                                                                                                 
[   16.862152]  panic+0x19c/0x394                                                                                                    
[   16.862160]  __stack_chk_fail+0x24/0x30                                                                                           
[   16.862167]  rs9_get_common_config+0x0/0x19c [clk_renesas_pcie]                     
[   16.862179]  _regmap_read+0x74/0x164                                                                                              
[   16.862188]  regmap_read+0x48/0x70                                                                                                
[   16.862193]  regcache_hw_init+0x184/0x2d0                                                                                         
[   16.862200]  regcache_init+0x1d4/0x2c0                                                                                            
[   16.862206]  __regmap_init+0x864/0x1000                                                                                           
[   16.862211]  __devm_regmap_init+0x74/0xc0                                                                                         
[   16.862217]  rs9_probe+0x118/0x240 [clk_renesas_pcie]                                    

This is caused by I2C_M_RECV_LEN for the rx i2c transfer. Upon cache 
initialization the 1st byte received is still set to 8 in hardware. So 8 data 
bytes + len are copied into rx buffer (which is actually only 2 bytes).
There is 2 ways to fix it: Set the rx buffer to the maximum receivable bytes 
(8) or only read a fixed size of 2. As reg_read only supports reading 1 
register, the latter one is enough.
Reading is fixed by the following patch.
---8<---
diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index c320ce25c11b..5b37d6a2e908 100644
--- a/drivers/clk/clk-renesas-pcie.c
+++ b/drivers/clk/clk-renesas-pcie.c
@@ -122,8 +122,8 @@ static int rs9_regmap_i2c_read(void *context,
        xfer[0].buf = (void *)&txdata;
 
        xfer[1].addr = i2c->addr;
-       xfer[1].flags = I2C_M_RD | I2C_M_RECV_LEN;
-       xfer[1].len = 1;
+       xfer[1].flags = I2C_M_RD;
+       xfer[1].len = 2;
        xfer[1].buf = (void *)rxdata;
 
        ret = i2c_transfer(i2c->adapter, xfer, 2);
---8<---

Putting all together the regmap debug output is like this:
$ cat /sys/kernel/debug/regmap/1-0068/registers 
0: ff
1: 06
2: ff
3: 5f
4: 00
5: 01
6: 04
7: 01

This is actually a 9FGV0441 using some queued patches on my side.

Best regards,
Alexander

Am Samstag, 24. September 2022, 18:49:33 CEST schrieb Marek Vasut:
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
> ---
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> ---
>  drivers/clk/clk-renesas-pcie.c | 56 +++++++++++++++++++++++++++++++++-
>  1 file changed, 55 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
> index 4f5df1fc74b46..c320ce25c11b6 100644
> --- a/drivers/clk/clk-renesas-pcie.c
> +++ b/drivers/clk/clk-renesas-pcie.c
> @@ -90,6 +90,52 @@ static const struct regmap_access_table
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
> @@ -97,6 +143,8 @@ static const struct regmap_config rs9_regmap_config = {
>  	.max_register = 0x8,
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




