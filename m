Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:57150 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750766AbdFGA4o (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Jun 2017 20:56:44 -0400
Date: Wed, 7 Jun 2017 02:56:03 +0200 (CEST)
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Eric Anholt <eric@anholt.net>
Cc: rjui@broadcom.com, linux-clk@vger.kernel.org,
        Danilo Krummrich <danilokrummrich@dk-develop.de>,
        linux-rpi-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com, sboyd@codeaurora.org
Message-ID: <978283989.189470.1496796963906@email.1und1.de>
In-Reply-To: <20170606182323.11513-1-danilokrummrich@dk-develop.de>
References: <20170606182323.11513-1-danilokrummrich@dk-develop.de>
Subject: Re: [PATCH v2] clk: bcm2835: remove remains from stub clk driver
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


> Danilo Krummrich <danilokrummrich@dk-develop.de> hat am 6. Juni 2017 um 20:23 geschrieben:
> 
> 
> This commit removes the fixed clocks introduced as a stub clock driver
> added with commit 75fabc3f6448 ("ARM: bcm2835: add stub clock driver").
> Originally they were used to drive the AMBA bus and PL011 uart driver.
> Now these clocks are derived by the CPRMAN clock driver and configured
> in DT.
> 
> Additionally, get rid of init_machine function in bcm2835 board file
> as there's nothing to do any longer.
> 
> Acked-by: Eric Anholt <eric@anholt.net>
> Signed-off-by: Danilo Krummrich <danilokrummrich@dk-develop.de>
> ---

@Eric: How do we want to handle the potential conflict with this patch?

[PATCH] irqchip/bcm2836: Move SMP startup code to arch/arm
