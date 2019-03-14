Return-Path: <SRS0=Z7Th=RR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3415DC43381
	for <linux-clk@archiver.kernel.org>; Thu, 14 Mar 2019 16:10:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 70DAE2184C
	for <linux-clk@archiver.kernel.org>; Thu, 14 Mar 2019 16:10:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727234AbfCNQKe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Mar 2019 12:10:34 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:41997 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726585AbfCNQKd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Mar 2019 12:10:33 -0400
Received: by mail-ed1-f66.google.com with SMTP id j89so5103763edb.9
        for <linux-clk@vger.kernel.org>; Thu, 14 Mar 2019 09:10:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=reBZQ5r1u2El0dJ7xnYcnXJoyLXO/V2VF1ce8Vs2elM=;
        b=jjVuuM//aBJRUY3hTQARBmlrdzhVXES58zdFLIzGCwggQ3mPfNLpgtHmctwMekCg3q
         bF2g68qZJYvWD5PRszoUbcILUCpy9CIifVFiLBm7QI7yeedHNsxPbdh9eijeyVGxvTob
         8bQmDu59Gvf1KR+baMgRxbLicGGJ1M+QYJkPwpleJTAETYhAAQziVtc7cpIJvwG6axQy
         Glj5sSzXJejK8plK4gr4SuRFPn+AunkAue0Ifx0Q2aBwMcu6OLFr4amb4wChl+UfLz8P
         +xOtY17k1M12GTfVFlHrFJUzV+VEnL+b5Y10I1ew5NHzJzZwffPlRoMdk9Zbgg3VQqdg
         vKvA==
X-Gm-Message-State: APjAAAUWuXUDX9h5vlhYI3Kp0G38JFaYXgfOz7U31qPBmL7jNRt5ElrL
        JNfEFH1oG/tsGhn69R8W0YGuEQ==
X-Google-Smtp-Source: APXvYqy5GFsm+0I12t9dNNSE2CKMZZM5Bh74bRxnsZ6XbBSfiLpEjv5i05csFpYotsz+Sz6vSW9voQ==
X-Received: by 2002:a50:8f05:: with SMTP id 5mr1314580edy.113.1552579832138;
        Thu, 14 Mar 2019 09:10:32 -0700 (PDT)
Received: from shalem.localdomain (546A5441.cm-12-3b.dynamic.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id a58sm1572228eda.91.2019.03.14.09.10.31
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Mar 2019 09:10:31 -0700 (PDT)
Subject: Re: clk: x86: Stop marking clocks as CLK_IS_CRITICAL is causing
 non-working hardware.
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?Q?David_M=c3=bcller?= <dave.mueller@gmx.ch>
Cc:     linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
References: <e6e11d5c-988a-aef4-cb8c-9e3bef254b87@gmx.ch>
 <155257844626.20095.2420043618878828782@swboyd.mtv.corp.google.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <73c30c82-1a69-97e6-40e9-3cdd6059e72d@redhat.com>
Date:   Thu, 14 Mar 2019 17:10:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <155257844626.20095.2420043618878828782@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On 14-03-19 16:47, Stephen Boyd wrote:
> Quoting David Müller (2019-03-14 03:18:59)
>> Hello
>>
>> I have a x86 (Bay Trail) based hardware, where pmc_plt_clk0 is used to
>> drive some external hardware (USB HSIC chip attached to the SoC's xHCI
>> root port).
>>
>> Since commit 88659387b9d509ee4bb8f0b0fe9ce2ff00988b46, the pmc_plt_clk0
> 
> Is this a stable tree commit? It's not in Linus' tree.

Likely, I believe the mainline commit being talked about is:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=648e921888ad96ea3dc922739e96716ad3225d7f

>> is unconditionally gated off, resulting in a non-working HSIC chip and
>> all the USB devices behind it.
>>
>> What is the proper way to fix this regression:
>> - revert this commit?
>> - implement some kind of "quirk" in the clk-pmc-atom driver?

So the background here is that the ACPI tables would normally be
responsible for turning on/off the pmc clocks and they are on cherry-trail
but on bay-trail the OS is somehow supposed to figure this all out.

The commit which is causing this problem for you is in essence a revert
of commit d31fd43c0f9a ("clk: x86: Do not gate clocks enabled by the firmware"),
which was an (in hindsight) ill advised fix to fix a similar problem with
a NIC. Since that commit broke entering deep sleep states during suspend
on all Bay Trail devices, I first upstreamed another fix for the NIC:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b1e3454d39f992e5409cd19f97782185950df6e7
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c2f6f3ee7f22521fabc3295f51149bc3f4dd9202

And then I submitted the "clk: x86: Stop marking clocks as CLK_IS_CRITICAL"
which in hindsight I should have submitted as a revert of d31fd43c0f9a,
rather then as a new patch to make sure that this patch was unbreaking things.

TL;DR: we do not want to revert "clk: x86: Stop marking clocks as CLK_IS_CRITICAL"
as that will regress power-consumption during suspend on many devices.

So you will need to do something similar to the 2 commits I did for the r8169.c
problem, but then limited to your board/model since we do not want to be enabling
pmc_plt_clk0 on every Bay Trail machine.

Do you know if the kernel already has some special code-paths to deal with the HSIC
phy in the xhci code ? Then we could just get and enable the clock there.

Otherwise I guess we should probably conditionally register a platform_usb_phy_clk
clock alias (see commit b1e3454d39f992) based on a dmi_system_id table and have
the xhci driver (optionally) request this clock and enable it if present. There are
some interesting probe-ordering issues here though, for this to work the
clk-pmc-atom (builtin) platform driver must bind to the clk-pmc-atom platform-device
*before* the xhci driver tries to get the clock.

Regards,

Hans
