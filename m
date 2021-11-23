Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 175DBC433F5
	for <linux-clk@archiver.kernel.org>; Tue, 23 Nov 2021 10:09:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234465AbhKWKMu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Nov 2021 05:12:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231838AbhKWKMt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Nov 2021 05:12:49 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E761AC061574;
        Tue, 23 Nov 2021 02:09:41 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id k37so89953124lfv.3;
        Tue, 23 Nov 2021 02:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:to:cc:from:subject
         :content-transfer-encoding;
        bh=gwEBwspvREzZJTFMeBuPWEIoZXwJDVHfgK2gcJ9E8Kg=;
        b=noNUgpvgAau735AzoU/NkU/3YUIf4gtscZ5R3ly/dYNQbGcHtBY59KThSZWmqCQxQQ
         nPcGoKHlPFaaZXmLKEvs1A+4wSMbh2XJx4wH476LWB9UzGai8qrxuuwfwfD8NXu54Nn3
         S3jscg+UFHwpfmv7YsWWf5SHjK/GIeUoXJEoWFcek4weqm67V57E1oOHwsxkHsguCmcZ
         oJB1BGSFaRHzJVQL0g5s91WX4r5GZI6w2otwpMwBVXWbKJ1yIA5XMcTEaXQt07905CH9
         g1LtnYqynygjlN5FFoYmr3RZPD9zdtVjYGtHuk+PDUj0mPpGnqD+ONFwy4I5r27XFueJ
         AT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:to:cc
         :from:subject:content-transfer-encoding;
        bh=gwEBwspvREzZJTFMeBuPWEIoZXwJDVHfgK2gcJ9E8Kg=;
        b=cXNbKMpI6ytc406a0j4hk6AyNAWve54TzRafwO0+i11fWBg/XkRY5SVgJB9cgKeYhr
         f0OK4gJhYIL7AItZ8tTMR62CTQs/dgh66s2Z7nSP1yNFVmvlXkily63CmNaiIarTHXCm
         ORAEtNyjLLmkybbSecgh7gibR8nEELR6CkYN8KyN2fE47ec1bDF1kuFmVxFq9M93vUSM
         aD+MyGyU3m236Ohnuk1WiDoVUIK0SyaI7Rz5ibEuOnHBCNO7hmOgwp7kUts+CzJ73WrR
         PWFgiwevMLzjqHv06VnRbssIohFd9W7K4dXNpZi464XWrK2RKTljiwJ7Z54GW0QYivLD
         7UYw==
X-Gm-Message-State: AOAM531c1qyT3SSg9ExY5g03ca/fjgiRuL1uSeRN4AkdoeqBTk7l4Oqo
        iEtu+Moleluf632QTVjK5VlR2t7rKRQ=
X-Google-Smtp-Source: ABdhPJyk6emSsiVFe4M/f/GxUD/nOEJ9pSh86Xaer47OKeG+AmVU4JHc6vkdhbkaiGthZNBQS+NWbw==
X-Received: by 2002:a19:4312:: with SMTP id q18mr3550523lfa.299.1637662180271;
        Tue, 23 Nov 2021 02:09:40 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id v17sm1242914lfd.287.2021.11.23.02.09.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 02:09:39 -0800 (PST)
Message-ID: <5c540797-deee-4ea9-e479-92f3aeb08c7b@gmail.com>
Date:   Tue, 23 Nov 2021 11:09:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:95.0) Gecko/20100101
 Thunderbird/95.0
To:     linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: clk & clock-controller@ DT nodes: __clk_core_init: clk
 clock-controller already initialized
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

I'm working on Northstar support (ARM platform with multiple clocks
blocks).

I've just noticed that my clocks don't work anymore after the commit:
[PATCH] ARM: dts: BCM5301X: update CRU block description
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20211029160523.2812-1-zajec5@gmail.com/

[    0.000000] __clk_core_init: clk clock-controller already initialized
[    0.000000] ------------[ cut here ]------------
[    0.000000] WARNING: CPU: 0 PID: 0 at drivers/clk/bcm/clk-iproc-pll.c:802 iproc_pll_clk_setup+0x4c8/0x4f4
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.10.80 #0
[    0.000000] Hardware name: BCM5301X
[    0.000000] [<c0108410>] (unwind_backtrace) from [<c0104bc4>] (show_stack+0x10/0x14)
[    0.000000] [<c0104bc4>] (show_stack) from [<c03dca28>] (dump_stack+0x94/0xa8)
[    0.000000] [<c03dca28>] (dump_stack) from [<c0118440>] (__warn+0xb8/0x114)
[    0.000000] [<c0118440>] (__warn) from [<c0118504>] (warn_slowpath_fmt+0x68/0x78)
[    0.000000] [<c0118504>] (warn_slowpath_fmt) from [<c043281c>] (iproc_pll_clk_setup+0x4c8/0x4f4)
[    0.000000] [<c043281c>] (iproc_pll_clk_setup) from [<c0818c04>] (nsp_genpll_clk_init+0x30/0x38)
[    0.000000] [<c0818c04>] (nsp_genpll_clk_init) from [<c0818634>] (of_clk_init+0x118/0x1f8)
[    0.000000] [<c0818634>] (of_clk_init) from [<c08039b0>] (time_init+0x24/0x30)
[    0.000000] [<c08039b0>] (time_init) from [<c0800d14>] (start_kernel+0x398/0x50c)
[    0.000000] [<c0800d14>] (start_kernel) from [<00000000>] (0x0)
[    0.000000] ---[ end trace fe236bfe9559ee50 ]---

It seems that Linux's clock name is derived from DT node. With multiple
clock-controller@ nodes there is a name conflict as seen above.

 From DT perspective I don't think there is anything wrong in having
multiple nodes using the same name prefix.

Could clk subsystem be somehow improved to be more /creative/ at picking
clock names? ;) Would someone be kind to take a look at this, please?
