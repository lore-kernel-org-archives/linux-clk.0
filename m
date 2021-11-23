Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB943C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 23 Nov 2021 10:20:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233888AbhKWKXP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Nov 2021 05:23:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231221AbhKWKXP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Nov 2021 05:23:15 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E41DC061574;
        Tue, 23 Nov 2021 02:20:07 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id t11so10074714ljh.6;
        Tue, 23 Nov 2021 02:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:from:to:cc
         :references:in-reply-to:content-transfer-encoding;
        bh=y3KpO1ygUCqvqHIy+xNIjmbrg8t93ar3XkEXGFBoMBM=;
        b=Yhn4cL/M72rBgdnhT/qOb5OXW0HOX6xFL0jRC4nqtyLrvNWVyXQfsLNBdtHkoCDpDH
         QzMKADA9GzfIS8CHdlQ4qsJd5oqq39SFkVmFg5XIGWBNb7vNagKFw1M0pKRDirrI5Po1
         fVKbKp/rOrWp2dfWfcWk8TzoH1YPAsiXQDiZLdcPgu6foVOxxfLBfdTt+JQEMmdF9Dcz
         ef1N8McnD/5Y21rgvVeLIQHfk4FFbkTshDHv7emBkdo6PHNYjfdwbCzWHrxmpfFCsL8O
         IsJdabq6LRcZfKEbx6JcCWlWdiwSVhYpanKicdGvuM7brsMxA35cj2e57l9QfwOnXKYI
         qPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=y3KpO1ygUCqvqHIy+xNIjmbrg8t93ar3XkEXGFBoMBM=;
        b=WgIB1S+m0llhLMOw3cdJR5HXas+zqdyXxo9YmioivbaCEtvNlgNz+kZjj1qHSQ4FSi
         BV2CQUekUsWFwfYyzNnu6hmPlpt4O83Aa/ODMq8ihgAdTFcOmyzdYkXlJXYNnOo/lpjM
         WcT9+eDbF2hDnGq3oEx5m678geEdWZ3MSGGTaGcKtOWCHjP9hfyTyXfboSE2j71Cqpjy
         nw79WyxKjYYyue8PNIlxnkbALEE+NPqpy8yN9owgnDlM+TSeH0l805L6c3fTfRBd/xX0
         SylQ5mnKzqN7CG2esfOZkgnMaasO0IEqsISt5GNIp58hUnSEEb8mo0PLoq4FFhbpZUUG
         +jRw==
X-Gm-Message-State: AOAM531SYmLDnFWi05EQoF5GFZiORjaKosPBny0u7tjiz2Hdury1cLQM
        IF7D6Bj4PpDlrL4znd4jN6WECMn4V0Q=
X-Google-Smtp-Source: ABdhPJzjdnfZuBWmRhsXQWKm2FPNNBDQxmng5ASPB87+Sz4pV6L5iKS/b0vCgc6gUZUcr6YQqQrpgQ==
X-Received: by 2002:a2e:9355:: with SMTP id m21mr3782448ljh.419.1637662805915;
        Tue, 23 Nov 2021 02:20:05 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id p13sm990647lfu.130.2021.11.23.02.20.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 02:20:05 -0800 (PST)
Message-ID: <67ebc933-3c93-99b1-9dfc-7166cfa1f7a8@gmail.com>
Date:   Tue, 23 Nov 2021 11:20:04 +0100
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
In-Reply-To: <5c540797-deee-4ea9-e479-92f3aeb08c7b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23.11.2021 11:09, Rafał Miłecki wrote:
> [    0.000000] __clk_core_init: clk clock-controller already initialized
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] WARNING: CPU: 0 PID: 0 at drivers/clk/bcm/clk-iproc-pll.c:802 iproc_pll_clk_setup+0x4c8/0x4f4
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.10.80 #0
> [    0.000000] Hardware name: BCM5301X
> [    0.000000] [<c0108410>] (unwind_backtrace) from [<c0104bc4>] (show_stack+0x10/0x14)
> [    0.000000] [<c0104bc4>] (show_stack) from [<c03dca28>] (dump_stack+0x94/0xa8)
> [    0.000000] [<c03dca28>] (dump_stack) from [<c0118440>] (__warn+0xb8/0x114)
> [    0.000000] [<c0118440>] (__warn) from [<c0118504>] (warn_slowpath_fmt+0x68/0x78)
> [    0.000000] [<c0118504>] (warn_slowpath_fmt) from [<c043281c>] (iproc_pll_clk_setup+0x4c8/0x4f4)
> [    0.000000] [<c043281c>] (iproc_pll_clk_setup) from [<c0818c04>] (nsp_genpll_clk_init+0x30/0x38)
> [    0.000000] [<c0818c04>] (nsp_genpll_clk_init) from [<c0818634>] (of_clk_init+0x118/0x1f8)
> [    0.000000] [<c0818634>] (of_clk_init) from [<c08039b0>] (time_init+0x24/0x30)
> [    0.000000] [<c08039b0>] (time_init) from [<c0800d14>] (start_kernel+0x398/0x50c)
> [    0.000000] [<c0800d14>] (start_kernel) from [<00000000>] (0x0)
> [    0.000000] ---[ end trace fe236bfe9559ee50 ]---
> 
> It seems that Linux's clock name is derived from DT node. With multiple
> clock-controller@ nodes there is a name conflict as seen above.
> 
>  From DT perspective I don't think there is anything wrong in having
> multiple nodes using the same name prefix.
> 
> Could clk subsystem be somehow improved to be more /creative/ at picking
> clock names? ;) Would someone be kind to take a look at this, please?

Ah, I've just realized it's not clk subsystem but actually a clk driver
that picks up a name based on DT node name.

iproc_pll_clk_setup() does:
init.name = node->name;

I should have double check that before sending my e-mail.

I can't see any helper picking a clock unique name based on DT node.
Any advise how to proceed with that?
