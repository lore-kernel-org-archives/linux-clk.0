Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC9CC32771
	for <linux-clk@archiver.kernel.org>; Wed, 28 Sep 2022 07:34:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232201AbiI1Hen (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 03:34:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233575AbiI1Hee (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 03:34:34 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E780F276A
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 00:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1664350456; x=1695886456;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bjmU5cXxtLNyr/Mv+6E8M8XXv9rX7mjfcBUbuf4TMTs=;
  b=gTIkLhJ7TNtN8iRi9ok9LIBukMxvwI/vWx8muB24RN4MXtaTunlayqo8
   ycrAq5X7M5fct6/IQKwqZJNwwlzWd/2rwhQI+RCtJgG9AXQv0/jrZl3w1
   UphJLu7Y4PtY+qhmiXrHuTtXl2MpnRUQE+/EF3VHyT4HAmensuepELjGJ
   ASEjF0jrUHZ3C825bCdgdugeOwd8Lolt7fQ9GTP9TeCu0zGHH1Z6H+h4j
   YbAv9XFnmCKuXjgZAK4NthC5V1jyfdzalITIqDIKn9pL3iTgaGLoHBguo
   U401uupXowl+1Y5dGmrJRmlWvhgvsRRxK9W9soAZKoiVb/HDj154gNiJR
   A==;
X-IronPort-AV: E=Sophos;i="5.93,351,1654552800"; 
   d="scan'208";a="26445433"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 28 Sep 2022 09:32:42 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 28 Sep 2022 09:32:42 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 28 Sep 2022 09:32:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1664350362; x=1695886362;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bjmU5cXxtLNyr/Mv+6E8M8XXv9rX7mjfcBUbuf4TMTs=;
  b=Yhs2dTsQ53SRCRaULdIHhGX1yT8l1aluXNbt3djiLmGqgEL5/4TlNoSd
   fnJ5Nk90nBND16eWIN+4OIc4eU9nPat+Thdv9AKCvIIzXDgTnSbqbsMxf
   4QCoyR4Mhw0cWrusEtJDPXquVl5OVPPRFqa6Ek3HDHA/iuUJwAShWeHAh
   Ij9Gg2U/Hta3TE3ZcnQ7OeuxGZtCkuHjI5AHC57oLTiNi6QyK59LHPtGU
   dABAPPtOkUJrrtNWW/o3V3Lgjg/kW/jDNWsbYmkc0JwtB04djIRKn3tl9
   XQOAUqBjGXJFskkd+qZJjLH8oklLgEb0KQxeN+J/w0djQUT2X1HWJdorQ
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,351,1654552800"; 
   d="scan'208";a="26445432"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 28 Sep 2022 09:32:42 +0200
Received: from steina-w.localnet (unknown [10.123.49.11])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 1278D280056;
        Wed, 28 Sep 2022 09:32:42 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2] clk: rs9: Fix I2C accessors
Date:   Wed, 28 Sep 2022 09:32:39 +0200
Message-ID: <13108964.uLZWGnKmhe@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <9a13e3ab-6541-7a24-e231-64faeac129c6@denx.de>
References: <20220924164933.393649-1-marex@denx.de> <4745081.GXAFRqVoOG@steina-w> <9a13e3ab-6541-7a24-e231-64faeac129c6@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Marek,

Am Dienstag, 27. September 2022, 21:43:12 CEST schrieb Marek Vasut:
> On 9/26/22 08:36, Alexander Stein wrote:
> > Hi Marek,
> 
> Hi,
> 
> > thanks for the update.
> > To answer your question regarding the cache: With this patch I get the
> > following:
> > $ cat /sys/kernel/debug/regmap/1-0068/registers
> > 0: 00
> > 1: 00
> > 2: 00
> > 3: 00
> > 4: 00
> > 5: 00
> > 6: 00
> > 7: 01
> > 8: 00
> 
> Ah, clear. Thanks for the detailed explanation.
> 
> > Which is obviously wrong. Reason is that the cache is not allocated
> > without a known size. This can be fixed using this patch:
> > ---8<---
> > diff --git a/drivers/clk/clk-renesas-pcie.c
> > b/drivers/clk/clk-renesas-pcie.c index 5b37d6a2e908..f1c185980466 100644
> > --- a/drivers/clk/clk-renesas-pcie.c
> > +++ b/drivers/clk/clk-renesas-pcie.c
> > @@ -140,7 +140,8 @@ static const struct regmap_config rs9_regmap_config =
> > {
> > 
> >          .reg_bits = 8,
> >          .val_bits = 8,
> >          .cache_type = REGCACHE_FLAT,
> > 
> > -       .max_register = 0x8,
> > +       .max_register = 0x7,
> > +       .num_reg_defaults_raw = 0x8,
> > 
> >          .rd_table = &rs9_readable_table,
> >          .wr_table = &rs9_writeable_table,
> >          .reg_write = rs9_regmap_i2c_write,
> > 
> > ---8<---
> > 
> > Unfortunately now the cache is initialized before RS9_REG_BCP is set to 1,
> > resulting in the following panic:
> > [   17.221637] Kernel panic - not syncing: stack-protector: Kernel stack
> > is
> > corrupted in: rs9_regmap_i2c_read+0xb4/0xb4 [clk_renesas_pcie]
> > [   16.862107] CPU: 3 PID: 277 Comm: systemd-udevd Not tainted 6.0.0-rc6-
> > next-20220923+ #764 d22d7e904fab3397adb372dbcb36af4e5b1f49bd
> > [   16.862118] Hardware name: TQ-Systems GmbH i.MX8MM TQMa8MxML on MBa8Mx
> > (DT) [   16.862123] Call trace:
> > [   16.862125]  dump_backtrace+0xd8/0x130
> > [   16.862136]  show_stack+0x14/0x40
> > [   16.862141]  dump_stack_lvl+0x88/0xb0
> > [   16.862147]  dump_stack+0x14/0x2c
> > [   16.862152]  panic+0x19c/0x394
> > [   16.862160]  __stack_chk_fail+0x24/0x30
> > [   16.862167]  rs9_get_common_config+0x0/0x19c [clk_renesas_pcie]
> > [   16.862179]  _regmap_read+0x74/0x164
> > [   16.862188]  regmap_read+0x48/0x70
> > [   16.862193]  regcache_hw_init+0x184/0x2d0
> > [   16.862200]  regcache_init+0x1d4/0x2c0
> > [   16.862206]  __regmap_init+0x864/0x1000
> > [   16.862211]  __devm_regmap_init+0x74/0xc0
> > [   16.862217]  rs9_probe+0x118/0x240 [clk_renesas_pcie]
> > 
> > This is caused by I2C_M_RECV_LEN for the rx i2c transfer. Upon cache
> > initialization the 1st byte received is still set to 8 in hardware. So 8
> > data bytes + len are copied into rx buffer (which is actually only 2
> > bytes). There is 2 ways to fix it: Set the rx buffer to the maximum
> > receivable bytes (8) or only read a fixed size of 2. As reg_read only
> > supports reading 1 register, the latter one is enough.
> > Reading is fixed by the following patch.
> > ---8<---
> > diff --git a/drivers/clk/clk-renesas-pcie.c
> > b/drivers/clk/clk-renesas-pcie.c index c320ce25c11b..5b37d6a2e908 100644
> > --- a/drivers/clk/clk-renesas-pcie.c
> > +++ b/drivers/clk/clk-renesas-pcie.c
> > @@ -122,8 +122,8 @@ static int rs9_regmap_i2c_read(void *context,
> > 
> >          xfer[0].buf = (void *)&txdata;
> >          
> >          xfer[1].addr = i2c->addr;
> > 
> > -       xfer[1].flags = I2C_M_RD | I2C_M_RECV_LEN;
> > -       xfer[1].len = 1;
> > +       xfer[1].flags = I2C_M_RD;
> > +       xfer[1].len = 2;
> > 
> >          xfer[1].buf = (void *)rxdata;
> >          
> >          ret = i2c_transfer(i2c->adapter, xfer, 2);
> > 
> > ---8<---
> > 
> > Putting all together the regmap debug output is like this:
> > $ cat /sys/kernel/debug/regmap/1-0068/registers
> > 0: ff
> > 1: 06
> > 2: ff
> > 3: 5f
> > 4: 00
> > 5: 01
> > 6: 04
> > 7: 01
> 
> What about option 3 -- disable the cache altogether ?

Sure this works as well.

> I can imagine since the chip is configured with like 2-3 I2C writes on
> boot and then never again written to, that might be the simplest approach.

I'm thinking about disabling unused clock outputs later on, so dynamic bit 
flipping at runtime would be required. For this case cache usage seems 
reasonable. For now disabling is ok, IMHO.

> > This is actually a 9FGV0441 using some queued patches on my side.
> 
> Nice, do you plan to send a binding update for this one ?

Sure, but as the DIF bit definition is device specific, I want to settle on 
general access first.

Best regards,
Alexander



