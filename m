Return-Path: <SRS0=srpp=UF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81018C28EB8
	for <linux-clk@archiver.kernel.org>; Thu,  6 Jun 2019 11:42:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5A5BA20868
	for <linux-clk@archiver.kernel.org>; Thu,  6 Jun 2019 11:42:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A19pqkik"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728630AbfFFLm1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 6 Jun 2019 07:42:27 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42077 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728162AbfFFLm1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Jun 2019 07:42:27 -0400
Received: by mail-wr1-f65.google.com with SMTP id x17so2056829wrl.9;
        Thu, 06 Jun 2019 04:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:subject:to:cc:message-id:in-reply-to:references
         :mime-version;
        bh=Hm8jnVKj/49pMZ/YRr3G6M11770UiUWVYtiApy3hGqI=;
        b=A19pqkikhBtY++OguCINEbIXI3xRn5Ebn3irMyP+Nosg1P/LybZCNSeGYOe/78wG1e
         xZ/b4FDwheBSJPdKvqwbZLY/SI7f8B5LHaBg6eML1m+yBTLhkFm4J2gTFXe9VX+vbUWY
         1Y/wldH9+tuz2h1zbO32ODLH+4KupTa3TjlXA9vGnjn/iFVHj+Umka/15AnyCXQMFa0A
         pWHN1IHZnNuNNLOUHUgHmdStCiWEQRWjxzUgrZPBcVFAw6ogfA0zj8pL+tSeC32JvLEN
         laviVO8m1ZlBYh7UHsJZQfrXfOeQdLbuS+FSbEuuxQNoAYMcJU0MPt2oAxZOOZC1Z0UQ
         FoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:subject:to:cc:message-id:in-reply-to
         :references:mime-version;
        bh=Hm8jnVKj/49pMZ/YRr3G6M11770UiUWVYtiApy3hGqI=;
        b=dMYvvSKgrR6ozqS+GYH98Zo31+/Mo5nusjTCYcz6o00QYxsMGnHxzIC7ybUyVwv3TQ
         G2RiEG+4ttTC5EPev1xBd/5rQfL+Ej8x/098UzfMTI1lpWEDzVeuAd8OKZqihorDDzAc
         4KmdBOYG9F3XG40UfUgBWjb1tLB9hCIofqSulCdQoX7mLvRkKd5ios3NFk5/cohRQupB
         +G8WMPcn3wv/HDwywFu4w5boc9CurKTJkrGSQp8Oyj5+mN5H80lgonPmF0gyMmKLsqdG
         Djmefqw41gPSZAR/mhVCIsUdFvYxtlnrZ71nu6z2SfbzvasLxeDougHTE+s/OsEnxJTB
         FJoQ==
X-Gm-Message-State: APjAAAUwWXDg9p+M0+y8E9mwT0sambBfpzASEL4uSKKUSbJC1eL/1vYL
        xk+1iqX6COdSEkJp7P+2kYI=
X-Google-Smtp-Source: APXvYqyGbeHxc8tZuXHRIYqtw0Bip3jMlyDlc5AEJHsdIvkmwwkH5eFtA6b2PyG0LPf5PvclT2dA+Q==
X-Received: by 2002:adf:9003:: with SMTP id h3mr6206679wrh.172.1559821345407;
        Thu, 06 Jun 2019 04:42:25 -0700 (PDT)
Received: from X555LD ([2a02:85f:1501:7500:4d25:7f51:1663:c28f])
        by smtp.gmail.com with ESMTPSA id o6sm1509958wmc.15.2019.06.06.04.42.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 06 Jun 2019 04:42:24 -0700 (PDT)
Date:   Thu, 06 Jun 2019 14:42:20 +0300
From:   "Leonidas P. Papadakos" <papadakospan@gmail.com>
Subject: Re: [PATCH 1/2] clk: rockchip: add clock for the watchdog pclk on
 rk3328
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     itdaniher@gmail.com, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org
Message-Id: <1559821340.1384.0@gmail.com>
In-Reply-To: <3485393.4UdOu2YNQE@phil>
References: <20190605235714.22432-1-papadakospan@gmail.com>
        <3485393.4UdOu2YNQE@phil>
X-Mailer: geary/3.32.1
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


Hi,
> 
> Am Donnerstag, 6. Juni 2019, 01:57:13 CEST schrieb Leonidas P. 
> Papadakos:
>>  From: <itdaniher@gmail.com>
> 
> Why is the From different from the Signed-off-by? Would also need a 
> full name.
> If the patch is from you, please just use the same From as for the 
> Signed-off-by.
> 

I mistakenly though this was the way to credit someone for a patch, but 
it seems to be different.
I'll Cc: the author of this patch

>> 
>>  Following the discussion here:
>>  https://github.com/rockchip-linux/kernel/issues/123
>> 
>>  it can be seen that these are the changes needed to enable the use 
>> of the hardware watchdog in the rk3328 SoC.
>> 
>>  This is in line with past changes for the rk3288:
>>  
>> http://lists.infradead.org/pipermail/linux-rockchip/2015-January/002314.html
>> 
>>  Signed-off-by: Leonidas P. Papadakos <papadakospan@gmail.com>
>>  ---
>>   drivers/clk/rockchip/clk-rk3328.c      | 9 +++++++++
>>   include/dt-bindings/clock/rk3328-cru.h | 1 +
>>   2 files changed, 10 insertions(+)
>> 
>>  diff --git a/drivers/clk/rockchip/clk-rk3328.c 
>> b/drivers/clk/rockchip/clk-rk3328.c
>>  index 076b9777a..546ee0ab7 100644
>>  --- a/drivers/clk/rockchip/clk-rk3328.c
>>  +++ b/drivers/clk/rockchip/clk-rk3328.c
>>  @@ -876,6 +876,8 @@ static const char *const 
>> rk3328_critical_clocks[] __initconst = {
>> 
>>   static void __init rk3328_clk_init(struct device_node *np)
>>   {
>>  +	struct clk *clk;
>>  +
>>   	struct rockchip_clk_provider *ctx;
>>   	void __iomem *reg_base;
>> 
>>  @@ -892,6 +894,13 @@ static void __init rk3328_clk_init(struct 
>> device_node *np)
>>   		return;
>>   	}
>> 
>>  +	clk = clk_register_fixed_factor(NULL, "pclk_wdt", "pclk_bus", 0, 
>> 1, 1);
>>  +	if (IS_ERR(clk))
>>  +		pr_warn("%s: could not register clock pclk_wdt: %ld\n",
>>  +			__func__, PTR_ERR(clk));
>>  +	else
>>  +		rockchip_clk_add_lookup(ctx, clk, PCLK_WDT);
>>  +
> 
> I've just Cc'ed you on 2 patches adding a SGRF_GATE clock-type. Please
> use that as base for you rk3328-wdt-clock, so that we don't introduce 
> more
> boilderplate code.
> 
> 
>>   	rockchip_clk_register_plls(ctx, rk3328_pll_clks,
>>   				   ARRAY_SIZE(rk3328_pll_clks),
>>   				   RK3328_GRF_SOC_STATUS0);
> 
>>  diff --git a/include/dt-bindings/clock/rk3328-cru.h 
>> b/include/dt-bindings/clock/rk3328-cru.h
>>  index afb811340..555b4ff66 100644
>>  --- a/include/dt-bindings/clock/rk3328-cru.h
>>  +++ b/include/dt-bindings/clock/rk3328-cru.h
>>  @@ -164,6 +164,7 @@
>>   #define PCLK_DCF		233
>>   #define PCLK_SARADC		234
>>   #define PCLK_ACODECPHY		235
>>  +#define PCLK_WDT		236
>> 
>>   /* hclk gates */
>>   #define HCLK_PERI		308
> 
> please split the addition of the clock-id into a separate patch only 
> adding
> said id.
> 
> 
> Thanks
> Heiko
> 

I know less than him on this, but I want the feedback to be visible in 
the Cc:


