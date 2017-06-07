Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hs01.dk-develop.de ([213.136.71.231]:57840 "EHLO
        hs01.dk-develop.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750739AbdFGIVI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Jun 2017 04:21:08 -0400
To: Stefan Wahren <stefan.wahren@i2se.com>,
        Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v2] clk: bcm2835: remove remains from stub clk driver
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Date: Wed, 07 Jun 2017 10:21:10 +0200
From: danilokrummrich@dk-develop.de
Cc: rjui@broadcom.com, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com, sboyd@codeaurora.org,
        linux-clk-owner@vger.kernel.org
In-Reply-To: <978283989.189470.1496796963906@email.1und1.de>
References: <20170606182323.11513-1-danilokrummrich@dk-develop.de>
 <978283989.189470.1496796963906@email.1und1.de>
Message-ID: <2bf353039cd7ccdac7ae4d415e75a569@dk-develop.de>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 2017-06-07 02:56, Stefan Wahren wrote:
>> Danilo Krummrich <danilokrummrich@dk-develop.de> hat am 6. Juni 2017 
>> um 20:23 geschrieben:
>> 
>> 
>> This commit removes the fixed clocks introduced as a stub clock driver
>> added with commit 75fabc3f6448 ("ARM: bcm2835: add stub clock 
>> driver").
>> Originally they were used to drive the AMBA bus and PL011 uart driver.
>> Now these clocks are derived by the CPRMAN clock driver and configured
>> in DT.
>> 
>> Additionally, get rid of init_machine function in bcm2835 board file
>> as there's nothing to do any longer.
>> 
>> Acked-by: Eric Anholt <eric@anholt.net>
>> Signed-off-by: Danilo Krummrich <danilokrummrich@dk-develop.de>
>> ---
> 
> @Eric: How do we want to handle the potential conflict with this patch?
> 
> [PATCH] irqchip/bcm2836: Move SMP startup code to arch/arm
> --
> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Stefan, Eric,

If you like I can upload the patch rebased onto the mentioned one.
