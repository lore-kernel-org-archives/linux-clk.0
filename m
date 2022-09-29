Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC4CC433FE
	for <linux-clk@archiver.kernel.org>; Thu, 29 Sep 2022 19:53:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbiI2Tx1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Sep 2022 15:53:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbiI2Tx0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Sep 2022 15:53:26 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DB2E1E277F
        for <linux-clk@vger.kernel.org>; Thu, 29 Sep 2022 12:53:23 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 8852E84461;
        Thu, 29 Sep 2022 21:53:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1664481200;
        bh=CfEMWGM1D6H9dwZNvdsj74A3JDQQnF8wGOceed5RCf8=;
        h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
        b=awWlXabitcfcAmjN2i++RuYut/7aU9fIgkWQ3l9my7coEtzr8kZh91VYoyz9RyJmT
         FHb8m28OKPnc9hJNRBmS+gC8I54a6gqfe9MkQD2FpcezKOEh0/ZQLqr2RolyHDjebV
         IWloLio/6qjuMC+WM9JlsNzMyL6Qtad958Yxt+jr8g24XoluZoWBMSgYwDjfDS/fTp
         hscZbw84ALxDS/co+n8Bc6I/8DSRXyNRyX5UFU5sk6rj+9uUK4IKamLvtlQ3s7C3LY
         dnJqefem93NP8lPgF1xQBEE4IzfYGCB/FFfSmh43YRcYY0Had1gQVSci/xJ0k59CWe
         cTWoSlgdAKGbg==
Message-ID: <d8f4060c-5bc3-ddb0-3385-0d4b927d135a@denx.de>
Date:   Thu, 29 Sep 2022 21:53:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From:   Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v3] clk: rs9: Fix I2C accessors
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
References: <20220927214415.418140-1-marex@denx.de>
 <3198374.44csPzL39Z@steina-w> <bb942700-af09-e510-8b56-236a6ec8e43c@denx.de>
 <8330403.GXAFRqVoOG@steina-w>
Content-Language: en-US
In-Reply-To: <8330403.GXAFRqVoOG@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 9/29/22 09:17, Alexander Stein wrote:
> Hi Marek,

Hi,

>>> I'm still in favor of removing I2C_M_RECV_LEN and setting len=2. This
>>> currently works only, because there is no read access between
>>> devm_regmap_init() call and regmap_write() to RS9_REG_BCP.
>>> Enabling cache later on again this will corrupt the stack.
>>
>> The device does send you the amount of data in first byte of I2C READ,
>> so I think I2C_M_RECV_LEN is the right flag here.
> 
> But you'll need to take I2C_M_RECV_LEN into account, and store at least
> I2C_SMBUS_BLOCK_MAX + length byte in the reception buffer, see [1].
> Otherwise bad things can happen, see below.

Oh, I missed that, fixed in V4.

>> I had a look into the above topic too before sending V3, and I think you
>> can use regcache_cache_bypass(..., true) right after devm_regmap_init()
>> and then again regcache_cache_bypass(..., false) close to the end of
>> probe() callback to deal with the problem you're describing.
>>
>> Would that work ?
> 
> Unfortunately no, if cache is enabled and cache size is set as well, you'll
> read from hardware from within devm_regmap_init call, no way to enable cache
> bypassing (yet).

I can imagine that could be fixed by a small patch to regmap though, 
maybe just add another bool flag into struct regmap_config .

> --8<--
> diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
> index 4e627855583f..99e5fd867efc 100644
> --- a/drivers/clk/clk-renesas-pcie.c
> +++ b/drivers/clk/clk-renesas-pcie.c
> @@ -139,8 +139,9 @@ static int rs9_regmap_i2c_read(void *context,
>   static const struct regmap_config rs9_regmap_config = {
>          .reg_bits = 8,
>          .val_bits = 8,
> -       .cache_type = REGCACHE_NONE,
> +       .cache_type = REGCACHE_FLAT,
>          .max_register = RS9_REG_BCP,
> +       .num_reg_defaults_raw = 0x8,
>          .rd_table = &rs9_readable_table,
>          .wr_table = &rs9_writeable_table,
>          .reg_write = rs9_regmap_i2c_write,
> --8<--
> 
> This results in the following kernel panic:
> 
> clk-renesas-pcie-9series 1-0068: No cache defaults, reading back from HW
> Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in:
> rs9_regmap_i2c_read+0xb4/0xb4 [clk_renesas_pcie]
> CPU: 1 PID: 278 Comm: systemd-udevd Not tainted 6.0.0-rc7-next-20220927+ #816
> 5af64c0444274ab7984baf7c2d7f82d1e1bca080
> Hardware name: TQ-Systems GmbH i.MX8MQ TQMa8MQ on MBa8Mx (DT)
> Call trace:
>   dump_backtrace+0xd4/0x130
>   show_stack+0x14/0x40
>   dump_stack_lvl+0x64/0x7c
>   dump_stack+0x14/0x2c
>   panic+0x19c/0x364
>   __stack_chk_fail+0x24/0x30
>   rs9_get_common_config+0x0/0x19c [clk_renesas_pcie
> 0f42365202f6346c1b8a6cb8867a1ff0d4899aee]
>   _regmap_read+0x74/0x160
>   regmap_read+0x48/0x70
>   regcache_hw_init+0x184/0x2d0
>   regcache_init+0x1d4/0x2c0
>   __regmap_init+0x7dc/0xf30
>   __devm_regmap_init+0x74/0xc0
>   rs9_probe+0x110/0x298 [clk_renesas_pcie
> 0f42365202f6346c1b8a6cb8867a1ff0d4899aee]
>   i2c_device_probe+0x100/0x340
>   call_driver_probe+0x28/0x140
>   really_probe+0xc0/0x334
>   __driver_probe_device+0x84/0x144
>   driver_probe_device+0x38/0x150
>   __driver_attach+0xac/0x244
>   bus_for_each_dev+0x6c/0xc0
>   driver_attach+0x20/0x30
>   bus_add_driver+0x174/0x244
>   driver_register+0x74/0x120
>   i2c_register_driver+0x50/0xf0
>   rs9_driver_init+0x20/0x1000 [clk_renesas_pcie
> 0f42365202f6346c1b8a6cb8867a1ff0d4899aee]
>   do_one_initcall+0x58/0x200
>   do_init_module+0x40/0x1d4
>   load_module+0x634/0x6e4
>   __do_sys_finit_module+0xc0/0x140
>   __arm64_sys_finit_module+0x1c/0x24
>   invoke_syscall+0x6c/0xf0
>   el0_svc_common.constprop.0+0xc0/0xe0
>   do_el0_svc+0x24/0x30
>   el0_svc+0x1c/0x50
>   el0t_64_sync_handler+0xb0/0xb4
>   el0t_64_sync+0x148/0x14c
> SMP: stopping secondary CPUs
> Kernel Offset: disabled
> CPU features: 0x00000,00800084,0000420b
> Memory Limit: none
> ---[ end Kernel panic - not syncing: stack-protector: Kernel stack is
> corrupted in: rs9_regmap_i2c_read+0xb4/0xb4 [clk_renesas_pcie] ]---
> 
> IMHO, I2C_M_RECV_LEN makes only sense for regmap's (raw) 'read' callback which
> supports reading multiple registers.
> But for a single register read, there is no need to take length into account,
> just read 2 bytes (length + data).

All right, let's do that.
