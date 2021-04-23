Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C34C433ED
	for <linux-clk@archiver.kernel.org>; Fri, 23 Apr 2021 08:49:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D27F613C9
	for <linux-clk@archiver.kernel.org>; Fri, 23 Apr 2021 08:49:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230147AbhDWIu2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Apr 2021 04:50:28 -0400
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:32043 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbhDWIu2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Apr 2021 04:50:28 -0400
Received: from [192.168.1.18] ([86.243.172.93])
        by mwinf5d05 with ME
        id w8pq2400Q21Fzsu038pqH9; Fri, 23 Apr 2021 10:49:51 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 23 Apr 2021 10:49:51 +0200
X-ME-IP: 86.243.172.93
Subject: Re: [PATCH 0/4] clk: mvebu: Fix some error handling paths + do some
 clean-up
To:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        gregory.clement@bootlin.com, thomas.petazzoni@free-electrons.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <cover.1619157996.git.christophe.jaillet@wanadoo.fr>
 <20210423092700.6a857460@windsurf>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <dd6f8b77-ac24-0339-0b38-4f62b004dc9c@wanadoo.fr>
Date:   Fri, 23 Apr 2021 10:49:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210423092700.6a857460@windsurf>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Le 23/04/2021 à 09:27, Thomas Petazzoni a écrit :
> Hello,
> 
> On Fri, 23 Apr 2021 08:24:52 +0200
> Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:
> 
>> Also, I wonder if the drivers in drivers/clk/mvebu are used by anyone.
>> In order to compile-test the changes, I also had to change the 'bool' in Kconfig
>> by 'bool "blah"'. Without this change, it was not possible to set
>> CONFIG_MVEBU_CLK_CPU required by Makefile.
> 
> CONFIG_MVEBU_CLK_CPU is selected by ARMADA_370_CLK and ARMADA_XP_CLK,
> which themselves are selected by MACH_ARMADA_370 and MACH_ARMADA_XP
> respectively.

Hi, thanks for the clarification.

Usually, only slightly modifying dependencies in Kconfig is enough for 
me to trigger a built, even if I don't have the correct toolchain for 
this architecture. In this case, the tweak I had to do was "spurious" 
and Kconfig "looked strange" to me, hence my comment.

Glad to here that this code is still alive. So, my patches may make 
sense :).

CJ

> 
> So unless I'm missing something, this code is definitely reachable and
> compiled. You can use the mvebu_v7_defconfig of ARM32, and the code
> will be built.
> 
> Best regards,
> 
> Thomas
> 

