Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12695C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 23 Nov 2021 12:09:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232746AbhKWMM7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Nov 2021 07:12:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230428AbhKWMM6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Nov 2021 07:12:58 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A630C061574;
        Tue, 23 Nov 2021 04:09:50 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id l9so5425949ljq.5;
        Tue, 23 Nov 2021 04:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:from:to:cc
         :references:in-reply-to:content-transfer-encoding;
        bh=jInrbIK2q6UNhLl71Os2qZMGSSIhq1YBVqVqs2WDB0s=;
        b=UdS46lB4VhqHcLKLzz5PIKsDh/gVbkcvv6ogkyOnoYMT+rUPbyBl6I6A7kh1NP4G5M
         7ZqiMQjjyVOZEE0q1KzBDveZuhxrYcCaFLZifinDEblM+L4dA7i9hmpgCM13tmLT3nX0
         RDn5HH/SGT7t8s8e6R6YG2dZr7LvBTCD/CWmB4o4eeyJ6zUxyBZaXlVPbp8bcQw5jDax
         jE0fADOXGGtKEUxR+Uc2uzhjHsWDmc8OSVfszpy7k4s8XFtPnba+ToQuGWd9z+HJqhun
         hPsd6iQ4vtO12za87vhIxP3ehgQs4nvE+qMEJ0zp9q1fg5pryRczKnDJNuqTFPhbLeUi
         xjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=jInrbIK2q6UNhLl71Os2qZMGSSIhq1YBVqVqs2WDB0s=;
        b=U86bYAs4WugoydXCZYS5u9ezTXT8vXdx1wcCfh5ueUjrboCmD0a8n3Xw+y2YYpnViD
         oHa9HtcZDodzZjiA7hQY5BnMFqh8h4w8tHe9RC2pwgWw8afBE/EUW/mvHLGM74M2jTnN
         hF38mJAyuOY9hD9IQWmS1AtEo9Dc2DHmB1ZTGc9j0a7dqbBS0AqYbt//VE4hE3v+Rpx9
         r2QIRX/BeaqA79re0HwNCZU6JFoxdZ151WyM8g1PKR6ZI2Okv8dKNdLvVGDwQ0CGkv2a
         GM5BA/vl+XcXHCwu7maj0VqFrBGZYEuipvWmGU7ncDyuDXID7y6eAQSwIyfoc9HD2MAC
         xY6Q==
X-Gm-Message-State: AOAM531zLOOerBMYdqIIklvHhFi/U6T2Tpa2AP9y8o7jImMTrkIDgPY5
        rNdMgrinZhqMnuI9YMxOGxUufv/BP8I=
X-Google-Smtp-Source: ABdhPJzEUc1882xH6Ro41Nfgck6vHEnif8CITGXl7OVcg8j5J6ttxYxrE3J4Oa1XE7Kj1n9/5Gu2Bw==
X-Received: by 2002:a2e:a451:: with SMTP id v17mr4512896ljn.85.1637669388887;
        Tue, 23 Nov 2021 04:09:48 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id f23sm1464974ljg.90.2021.11.23.04.09.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 04:09:48 -0800 (PST)
Message-ID: <51926a0e-4d01-7361-8f18-62d56eaaa398@gmail.com>
Date:   Tue, 23 Nov 2021 13:09:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:95.0) Gecko/20100101
 Thunderbird/95.0
Subject: Re: clk & clock-controller@ DT nodes: __clk_core_init: clk
 clock-controller already initialized
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To:     linux-clk@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>
References: <5c540797-deee-4ea9-e479-92f3aeb08c7b@gmail.com>
 <67ebc933-3c93-99b1-9dfc-7166cfa1f7a8@gmail.com>
In-Reply-To: <67ebc933-3c93-99b1-9dfc-7166cfa1f7a8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23.11.2021 11:20, Rafał Miłecki wrote:
> On 23.11.2021 11:09, Rafał Miłecki wrote:
>> [    0.000000] __clk_core_init: clk clock-controller already initialized
>> [    0.000000] ------------[ cut here ]------------
>> [    0.000000] WARNING: CPU: 0 PID: 0 at drivers/clk/bcm/clk-iproc-pll.c:802 iproc_pll_clk_setup+0x4c8/0x4f4
>> [    0.000000] Modules linked in:
>> [    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.10.80 #0
>> [    0.000000] Hardware name: BCM5301X
>> [    0.000000] [<c0108410>] (unwind_backtrace) from [<c0104bc4>] (show_stack+0x10/0x14)
>> [    0.000000] [<c0104bc4>] (show_stack) from [<c03dca28>] (dump_stack+0x94/0xa8)
>> [    0.000000] [<c03dca28>] (dump_stack) from [<c0118440>] (__warn+0xb8/0x114)
>> [    0.000000] [<c0118440>] (__warn) from [<c0118504>] (warn_slowpath_fmt+0x68/0x78)
>> [    0.000000] [<c0118504>] (warn_slowpath_fmt) from [<c043281c>] (iproc_pll_clk_setup+0x4c8/0x4f4)
>> [    0.000000] [<c043281c>] (iproc_pll_clk_setup) from [<c0818c04>] (nsp_genpll_clk_init+0x30/0x38)
>> [    0.000000] [<c0818c04>] (nsp_genpll_clk_init) from [<c0818634>] (of_clk_init+0x118/0x1f8)
>> [    0.000000] [<c0818634>] (of_clk_init) from [<c08039b0>] (time_init+0x24/0x30)
>> [    0.000000] [<c08039b0>] (time_init) from [<c0800d14>] (start_kernel+0x398/0x50c)
>> [    0.000000] [<c0800d14>] (start_kernel) from [<00000000>] (0x0)
>> [    0.000000] ---[ end trace fe236bfe9559ee50 ]---
>>
>> It seems that Linux's clock name is derived from DT node. With multiple
>> clock-controller@ nodes there is a name conflict as seen above.
>>
>>  From DT perspective I don't think there is anything wrong in having
>> multiple nodes using the same name prefix.
>>
>> Could clk subsystem be somehow improved to be more /creative/ at picking
>> clock names? ;) Would someone be kind to take a look at this, please?
> 
> Ah, I've just realized it's not clk subsystem but actually a clk driver
> that picks up a name based on DT node name.
> 
> iproc_pll_clk_setup() does:
> init.name = node->name;
> 
> I should have double check that before sending my e-mail.
> 
> I can't see any helper picking a clock unique name based on DT node.
> Any advise how to proceed with that?

I've tried a simple patch switching from "name" to "full_name".

That results in registering "clock-controller@100" and
"clock-controller@160" clocks (I can see them in /sys/kernel/debug/clk/)

They seem to work fine:
# cat /sys/kernel/debug/clk/clock-controller@140/clk_rate
2000000000
# cat /sys/kernel/debug/clk/clock-controller@100/clk_rate
3200000000

It seems however that output clocks are broken:
# cat /sys/kernel/debug/clk/usbclk/clk_rate
0

For some reason iproc_clk_recalc_rate() gets called with "parent_rate"
argument 0 whenever clocks aren't named "lcpll0" and "genpll". I'm not
sure why it happens. I don't see any code referencing clocks by
hardcoded names "lcpll0" and "genpll".


--- a/drivers/clk/bcm/clk-iproc-pll.c
+++ b/drivers/clk/bcm/clk-iproc-pll.c
@@ -783,7 +783,7 @@ void iproc_pll_clk_setup(struct device_n
  	iclk = &iclk_array[0];
  	iclk->pll = pll;

-	init.name = node->name;
+	init.name = node->full_name;
  	init.ops = &iproc_pll_ops;
  	init.flags = 0;
  	parent_name = of_clk_get_parent_name(node, 0);

