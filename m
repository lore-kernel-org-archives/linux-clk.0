Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A76BDC11F68
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jun 2021 12:18:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 86BA761997
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jun 2021 12:18:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234358AbhF3MU4 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Jun 2021 08:20:56 -0400
Received: from aposti.net ([89.234.176.197]:54396 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234537AbhF3MUz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 30 Jun 2021 08:20:55 -0400
Date:   Wed, 30 Jun 2021 13:18:14 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 6/6] clk: ingenic: Add support for the JZ4760
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        list@opendingux.net,
        =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Message-Id: <EUKIVQ.JY7MPI8PMAKC3@crapouillou.net>
In-Reply-To: <162484860391.2516444.9536343468022864909@swboyd.mtv.corp.google.com>
References: <20210530164923.18134-1-paul@crapouillou.net>
        <20210530164923.18134-7-paul@crapouillou.net>
        <162484860391.2516444.9536343468022864909@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Thank you Stephen.

-Paul


Le dim., juin 27 2021 at 19:50:03 -0700, Stephen Boyd 
<sboyd@kernel.org> a écrit :
> Quoting Paul Cercueil (2021-05-30 09:49:23)
>>  Add the CGU code and the compatible string to the TCU driver to 
>> support
>>  the JZ4760 SoC.
>> 
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
> 
> Applied to clk-next


