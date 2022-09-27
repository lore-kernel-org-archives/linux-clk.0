Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9487C07E9D
	for <linux-clk@archiver.kernel.org>; Tue, 27 Sep 2022 19:43:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231882AbiI0TnQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Sep 2022 15:43:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231706AbiI0TnP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Sep 2022 15:43:15 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D1C3160E40
        for <linux-clk@vger.kernel.org>; Tue, 27 Sep 2022 12:43:14 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 92B9F80759;
        Tue, 27 Sep 2022 21:43:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1664307792;
        bh=O0n/bujq3J/WZzFhxUw7U6jl1sUKsnEwE6RJGlhn7Tk=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=W57nXGHAKPIWkfksdTM63MiTpw9z5t8ZO/rslJnZaCHlDQIAppy5BQhJ3jaF70WrH
         BgEOm2zT5nO1KwTkKEuNlAsGKQkdi6WnC7h01kJb/F+lT8shCRU3Ak11xmSdMBCY8m
         firGyJNAFjxPLJRfjR+7cXtakTXZZDZkOPi+7qwvoBkoS+yOaVhjNA6heDFnvVHlUh
         /uTpsS59z7K1wb8m/9aCTD43wsgYat6j0D5D4oVxMtkftAjS5uY8Eg8EBMRggVnvHN
         zDtuxaVvLJDN1o0BT0cw2e6+ryZspQmt1nqSTevtdsF2ZcZnK0UjhCZkyavvDkcUWt
         eTy/EApnQyjVg==
Message-ID: <9a13e3ab-6541-7a24-e231-64faeac129c6@denx.de>
Date:   Tue, 27 Sep 2022 21:43:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2] clk: rs9: Fix I2C accessors
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
References: <20220924164933.393649-1-marex@denx.de>
 <4745081.GXAFRqVoOG@steina-w>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <4745081.GXAFRqVoOG@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 9/26/22 08:36, Alexander Stein wrote:
> Hi Marek,

Hi,

> thanks for the update.
> To answer your question regarding the cache: With this patch I get the
> following:
> $ cat /sys/kernel/debug/regmap/1-0068/registers
> 0: 00
> 1: 00
> 2: 00
> 3: 00
> 4: 00
> 5: 00
> 6: 00
> 7: 01
> 8: 00

Ah, clear. Thanks for the detailed explanation.

> Which is obviously wrong. Reason is that the cache is not allocated without a
> known size. This can be fixed using this patch:
> ---8<---
> diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
> index 5b37d6a2e908..f1c185980466 100644
> --- a/drivers/clk/clk-renesas-pcie.c
> +++ b/drivers/clk/clk-renesas-pcie.c
> @@ -140,7 +140,8 @@ static const struct regmap_config rs9_regmap_config = {
>          .reg_bits = 8,
>          .val_bits = 8,
>          .cache_type = REGCACHE_FLAT,
> -       .max_register = 0x8,
> +       .max_register = 0x7,
> +       .num_reg_defaults_raw = 0x8,
>          .rd_table = &rs9_readable_table,
>          .wr_table = &rs9_writeable_table,
>          .reg_write = rs9_regmap_i2c_write,
> ---8<---
> 
> Unfortunately now the cache is initialized before RS9_REG_BCP is set to 1,
> resulting in the following panic:
> [   17.221637] Kernel panic - not syncing: stack-protector: Kernel stack is
> corrupted in: rs9_regmap_i2c_read+0xb4/0xb4 [clk_renesas_pcie]
> [   16.862107] CPU: 3 PID: 277 Comm: systemd-udevd Not tainted 6.0.0-rc6-
> next-20220923+ #764 d22d7e904fab3397adb372dbcb36af4e5b1f49bd
> [   16.862118] Hardware name: TQ-Systems GmbH i.MX8MM TQMa8MxML on MBa8Mx (DT)
> [   16.862123] Call trace:
> [   16.862125]  dump_backtrace+0xd8/0x130
> [   16.862136]  show_stack+0x14/0x40
> [   16.862141]  dump_stack_lvl+0x88/0xb0
> [   16.862147]  dump_stack+0x14/0x2c
> [   16.862152]  panic+0x19c/0x394
> [   16.862160]  __stack_chk_fail+0x24/0x30
> [   16.862167]  rs9_get_common_config+0x0/0x19c [clk_renesas_pcie]
> [   16.862179]  _regmap_read+0x74/0x164
> [   16.862188]  regmap_read+0x48/0x70
> [   16.862193]  regcache_hw_init+0x184/0x2d0
> [   16.862200]  regcache_init+0x1d4/0x2c0
> [   16.862206]  __regmap_init+0x864/0x1000
> [   16.862211]  __devm_regmap_init+0x74/0xc0
> [   16.862217]  rs9_probe+0x118/0x240 [clk_renesas_pcie]
> 
> This is caused by I2C_M_RECV_LEN for the rx i2c transfer. Upon cache
> initialization the 1st byte received is still set to 8 in hardware. So 8 data
> bytes + len are copied into rx buffer (which is actually only 2 bytes).
> There is 2 ways to fix it: Set the rx buffer to the maximum receivable bytes
> (8) or only read a fixed size of 2. As reg_read only supports reading 1
> register, the latter one is enough.
> Reading is fixed by the following patch.
> ---8<---
> diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
> index c320ce25c11b..5b37d6a2e908 100644
> --- a/drivers/clk/clk-renesas-pcie.c
> +++ b/drivers/clk/clk-renesas-pcie.c
> @@ -122,8 +122,8 @@ static int rs9_regmap_i2c_read(void *context,
>          xfer[0].buf = (void *)&txdata;
>   
>          xfer[1].addr = i2c->addr;
> -       xfer[1].flags = I2C_M_RD | I2C_M_RECV_LEN;
> -       xfer[1].len = 1;
> +       xfer[1].flags = I2C_M_RD;
> +       xfer[1].len = 2;
>          xfer[1].buf = (void *)rxdata;
>   
>          ret = i2c_transfer(i2c->adapter, xfer, 2);
> ---8<---
> 
> Putting all together the regmap debug output is like this:
> $ cat /sys/kernel/debug/regmap/1-0068/registers
> 0: ff
> 1: 06
> 2: ff
> 3: 5f
> 4: 00
> 5: 01
> 6: 04
> 7: 01

What about option 3 -- disable the cache altogether ?

I can imagine since the chip is configured with like 2-3 I2C writes on 
boot and then never again written to, that might be the simplest approach.

> This is actually a 9FGV0441 using some queued patches on my side.

Nice, do you plan to send a binding update for this one ?
