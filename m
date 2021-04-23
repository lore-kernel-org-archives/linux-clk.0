Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6F64C433B4
	for <linux-clk@archiver.kernel.org>; Fri, 23 Apr 2021 07:27:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 65E8661404
	for <linux-clk@archiver.kernel.org>; Fri, 23 Apr 2021 07:27:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbhDWH1j (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Apr 2021 03:27:39 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:43521 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbhDWH1j (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Apr 2021 03:27:39 -0400
Received: from windsurf (unknown [91.174.235.35])
        (Authenticated sender: thomas.petazzoni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 107A7200004;
        Fri, 23 Apr 2021 07:27:00 +0000 (UTC)
Date:   Fri, 23 Apr 2021 09:27:00 +0200
From:   Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        gregory.clement@bootlin.com, thomas.petazzoni@free-electrons.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 0/4] clk: mvebu: Fix some error handling paths + do some
 clean-up
Message-ID: <20210423092700.6a857460@windsurf>
In-Reply-To: <cover.1619157996.git.christophe.jaillet@wanadoo.fr>
References: <cover.1619157996.git.christophe.jaillet@wanadoo.fr>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello,

On Fri, 23 Apr 2021 08:24:52 +0200
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> Also, I wonder if the drivers in drivers/clk/mvebu are used by anyone.
> In order to compile-test the changes, I also had to change the 'bool' in Kconfig
> by 'bool "blah"'. Without this change, it was not possible to set
> CONFIG_MVEBU_CLK_CPU required by Makefile.

CONFIG_MVEBU_CLK_CPU is selected by ARMADA_370_CLK and ARMADA_XP_CLK,
which themselves are selected by MACH_ARMADA_370 and MACH_ARMADA_XP
respectively.

So unless I'm missing something, this code is definitely reachable and
compiled. You can use the mvebu_v7_defconfig of ARM32, and the code
will be built.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
