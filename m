Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15479C04A95
	for <linux-clk@archiver.kernel.org>; Thu, 29 Sep 2022 07:17:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235168AbiI2HRX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Sep 2022 03:17:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235148AbiI2HRT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Sep 2022 03:17:19 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D810115F6A
        for <linux-clk@vger.kernel.org>; Thu, 29 Sep 2022 00:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1664435837; x=1695971837;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=teRKT+ppQBz5nbufZiSqNeR9adklydzc5GiMf5cOI1g=;
  b=Lfb9NWYhLvXKJtXmo26G7BJYXVzmwIo90dAS6dYtj4Kh1otFU5T9Cx0m
   WxdXmPjPYaNu8UT+b2AIu//UVa16Dfq7P7jjyhqpho0v/jyLGiXlyaMny
   k+K4VRj4KkR3QtWw/RGTT9wourSMVBWOBEblGMKdA+GlhrM7o5YIx5vDe
   35N1mJqnMS6hheptzfpcSBQb5wQBq+lVgU1+sxj//iOTgbtQnq5BcJZsz
   PvMVAlrAcueRXz8eiADIjViNmWGVN6/8xAoeWXwDqHtmd4V0clqoDHGB+
   yoWzG1W9c6m2d+bckW6y8DSHW5X8wZoO4OASz/tOftgyWfw63+oNB+9oF
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,354,1654552800"; 
   d="scan'208";a="26472198"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 29 Sep 2022 09:17:15 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 29 Sep 2022 09:17:15 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 29 Sep 2022 09:17:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1664435835; x=1695971835;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=teRKT+ppQBz5nbufZiSqNeR9adklydzc5GiMf5cOI1g=;
  b=VwZ1vCet3CjGVWYpxS3nuFVooKQlU8u33NGz0J3N7bpo26RV+Khl6J4j
   Ly6tPD+hMqDu9zwKY0vHa1Uquy6Xs7Jh1/iapnZlVvvWKtbwNMytQq5Wc
   xQllDkyb3Ex3piRXwNQPn3y++sSoqmWUEIe9tqx0TNR5tG7F0cBkC43yj
   xnwGohfI3+AB01ny1TF8H8OvLNp9CQD0A6j0omZPqoxttlaUiO+Phu7k8
   Krl3bE2cV2YYdNJdCtjvRQrbIwybAJmHVbOyEuMhPb/uj0UCUTVVWho6U
   mXNq6NXtfJaKRIGuWvuNM44zNU8wdje5OfvCjcISVdwxvkCzzaHmwMzj6
   w==;
X-IronPort-AV: E=Sophos;i="5.93,354,1654552800"; 
   d="scan'208";a="26472195"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 29 Sep 2022 09:17:12 +0200
Received: from steina-w.localnet (unknown [10.123.49.11])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id A7FE8280056;
        Thu, 29 Sep 2022 09:17:12 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3] clk: rs9: Fix I2C accessors
Date:   Thu, 29 Sep 2022 09:17:10 +0200
Message-ID: <8330403.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <bb942700-af09-e510-8b56-236a6ec8e43c@denx.de>
References: <20220927214415.418140-1-marex@denx.de> <3198374.44csPzL39Z@steina-w> <bb942700-af09-e510-8b56-236a6ec8e43c@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Marek,

Am Mittwoch, 28. September 2022, 14:59:07 CEST schrieb Marek Vasut:
> On 9/28/22 09:35, Alexander Stein wrote:
> > Hi Marek,
> 
> Hi,
> 
> > thanks for the update.
> 
> Thanks for the reviews.
> 
> > Am Dienstag, 27. September 2022, 23:44:14 CEST schrieb Marek Vasut:
> >> Add custom I2C accessors to this driver, since the regular I2C regmap
> >> ones
> >> do not generate the exact I2C transfers required by the chip. On I2C
> >> write,
> >> it is mandatory to send transfer length first, on read the chip returns
> >> the
> >> transfer length in first byte. Instead of always reading back 8 bytes,
> >> which is the default and also the size of the entire register file, set
> >> BCP register to 1 to read out 1 byte which is less wasteful.
> >> 
> >> Fixes: 892e0ddea1aa6 ("clk: rs9: Add Renesas 9-series PCIe clock
> >> generator
> >> driver") Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> >> Signed-off-by: Marek Vasut <marex@denx.de>
> >> ---
> >> V2: Fix endianness handling in rs9_regmap_i2c_read() i2c_transfer
> >> V3: - Disable regcache, the driver does a couple of I2C writes on boot
> >> 
> >>        and that is all, so it only adds complexity
> >>      
> >>      - Set regmap max_register to RS9_REG_BCP which is the correct one
> >> 
> >> ---
> >> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> >> Cc: Michael Turquette <mturquette@baylibre.com>
> >> Cc: Stephen Boyd <sboyd@kernel.org>
> >> ---
> >> 
> >>   drivers/clk/clk-renesas-pcie.c | 60 ++++++++++++++++++++++++++++++++--
> >>   1 file changed, 57 insertions(+), 3 deletions(-)
> >> 
> >> diff --git a/drivers/clk/clk-renesas-pcie.c
> >> b/drivers/clk/clk-renesas-pcie.c index 4f5df1fc74b46..138aaab05fc8a
> >> 100644
> >> --- a/drivers/clk/clk-renesas-pcie.c
> >> +++ b/drivers/clk/clk-renesas-pcie.c
> >> @@ -90,13 +90,61 @@ static const struct regmap_access_table
> >> rs9_writeable_table = { .n_yes_ranges = ARRAY_SIZE(rs9_writeable_ranges),
> >> 
> >>   };
> >> 
> >> +static int rs9_regmap_i2c_write(void *context,
> >> +				unsigned int reg, unsigned int
> > 
> > val)
> > 
> >> +{
> >> +	struct i2c_client *i2c = context;
> >> +	const u8 data[3] = { reg, 1, val };
> >> +	const int count = ARRAY_SIZE(data);
> >> +	int ret;
> >> +
> >> +	ret = i2c_master_send(i2c, data, count);
> >> +	if (ret == count)
> >> +		return 0;
> >> +	else if (ret < 0)
> >> +		return ret;
> >> +	else
> >> +		return -EIO;
> >> +}
> >> +
> >> +static int rs9_regmap_i2c_read(void *context,
> >> +			       unsigned int reg, unsigned int *val)
> >> +{
> >> +	struct i2c_client *i2c = context;
> >> +	struct i2c_msg xfer[2];
> >> +	u8 txdata = reg;
> >> +	u8 rxdata[2];
> >> +	int ret;
> >> +
> >> +	xfer[0].addr = i2c->addr;
> >> +	xfer[0].flags = 0;
> >> +	xfer[0].len = 1;
> >> +	xfer[0].buf = (void *)&txdata;
> >> +
> >> +	xfer[1].addr = i2c->addr;
> >> +	xfer[1].flags = I2C_M_RD | I2C_M_RECV_LEN;
> >> +	xfer[1].len = 1;
> > 
> > I'm still in favor of removing I2C_M_RECV_LEN and setting len=2. This
> > currently works only, because there is no read access between
> > devm_regmap_init() call and regmap_write() to RS9_REG_BCP.
> > Enabling cache later on again this will corrupt the stack.
> 
> The device does send you the amount of data in first byte of I2C READ,
> so I think I2C_M_RECV_LEN is the right flag here.

But you'll need to take I2C_M_RECV_LEN into account, and store at least 
I2C_SMBUS_BLOCK_MAX + length byte in the reception buffer, see [1].
Otherwise bad things can happen, see below.

> I had a look into the above topic too before sending V3, and I think you
> can use regcache_cache_bypass(..., true) right after devm_regmap_init()
> and then again regcache_cache_bypass(..., false) close to the end of
> probe() callback to deal with the problem you're describing.
> 
> Would that work ?

Unfortunately no, if cache is enabled and cache size is set as well, you'll 
read from hardware from within devm_regmap_init call, no way to enable cache 
bypassing (yet).

--8<--
diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index 4e627855583f..99e5fd867efc 100644
--- a/drivers/clk/clk-renesas-pcie.c
+++ b/drivers/clk/clk-renesas-pcie.c
@@ -139,8 +139,9 @@ static int rs9_regmap_i2c_read(void *context,
 static const struct regmap_config rs9_regmap_config = {
        .reg_bits = 8,
        .val_bits = 8,
-       .cache_type = REGCACHE_NONE,
+       .cache_type = REGCACHE_FLAT,
        .max_register = RS9_REG_BCP,
+       .num_reg_defaults_raw = 0x8,
        .rd_table = &rs9_readable_table,
        .wr_table = &rs9_writeable_table,
        .reg_write = rs9_regmap_i2c_write,
--8<--

This results in the following kernel panic:

clk-renesas-pcie-9series 1-0068: No cache defaults, reading back from HW
Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: 
rs9_regmap_i2c_read+0xb4/0xb4 [clk_renesas_pcie]
CPU: 1 PID: 278 Comm: systemd-udevd Not tainted 6.0.0-rc7-next-20220927+ #816 
5af64c0444274ab7984baf7c2d7f82d1e1bca080
Hardware name: TQ-Systems GmbH i.MX8MQ TQMa8MQ on MBa8Mx (DT)
Call trace:
 dump_backtrace+0xd4/0x130
 show_stack+0x14/0x40
 dump_stack_lvl+0x64/0x7c
 dump_stack+0x14/0x2c
 panic+0x19c/0x364
 __stack_chk_fail+0x24/0x30
 rs9_get_common_config+0x0/0x19c [clk_renesas_pcie 
0f42365202f6346c1b8a6cb8867a1ff0d4899aee]
 _regmap_read+0x74/0x160
 regmap_read+0x48/0x70
 regcache_hw_init+0x184/0x2d0
 regcache_init+0x1d4/0x2c0
 __regmap_init+0x7dc/0xf30
 __devm_regmap_init+0x74/0xc0
 rs9_probe+0x110/0x298 [clk_renesas_pcie 
0f42365202f6346c1b8a6cb8867a1ff0d4899aee]
 i2c_device_probe+0x100/0x340
 call_driver_probe+0x28/0x140
 really_probe+0xc0/0x334
 __driver_probe_device+0x84/0x144
 driver_probe_device+0x38/0x150
 __driver_attach+0xac/0x244
 bus_for_each_dev+0x6c/0xc0
 driver_attach+0x20/0x30
 bus_add_driver+0x174/0x244
 driver_register+0x74/0x120
 i2c_register_driver+0x50/0xf0
 rs9_driver_init+0x20/0x1000 [clk_renesas_pcie 
0f42365202f6346c1b8a6cb8867a1ff0d4899aee]
 do_one_initcall+0x58/0x200
 do_init_module+0x40/0x1d4
 load_module+0x634/0x6e4
 __do_sys_finit_module+0xc0/0x140
 __arm64_sys_finit_module+0x1c/0x24
 invoke_syscall+0x6c/0xf0
 el0_svc_common.constprop.0+0xc0/0xe0
 do_el0_svc+0x24/0x30
 el0_svc+0x1c/0x50
 el0t_64_sync_handler+0xb0/0xb4
 el0t_64_sync+0x148/0x14c
SMP: stopping secondary CPUs
Kernel Offset: disabled
CPU features: 0x00000,00800084,0000420b
Memory Limit: none
---[ end Kernel panic - not syncing: stack-protector: Kernel stack is 
corrupted in: rs9_regmap_i2c_read+0xb4/0xb4 [clk_renesas_pcie] ]---

IMHO, I2C_M_RECV_LEN makes only sense for regmap's (raw) 'read' callback which 
supports reading multiple registers.
But for a single register read, there is no need to take length into account, 
just read 2 bytes (length + data).

Best regards,
Alexander

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/
include/uapi/linux/i2c.h#n45


