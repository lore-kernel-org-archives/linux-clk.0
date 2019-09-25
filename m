Return-Path: <SRS0=5BEl=XU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C71A4C432C2
	for <linux-clk@archiver.kernel.org>; Wed, 25 Sep 2019 13:42:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A24892146E
	for <linux-clk@archiver.kernel.org>; Wed, 25 Sep 2019 13:42:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406566AbfIYNmV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Sep 2019 09:42:21 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:49557 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406357AbfIYNmV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Sep 2019 09:42:21 -0400
Received: from [78.40.148.177] (helo=localhost)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iD7Yg-0007ef-Rk; Wed, 25 Sep 2019 14:42:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 25 Sep 2019 14:42:18 +0100
From:   Ben Dooks <ben.dooks@codethink.co.uk>
To:     linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/2] clk: hisilicon: fix sparse warnings in clk-hi3660.c
In-Reply-To: <20190925112347.14141-2-ben.dooks@codethink.co.uk>
References: <20190925112347.14141-1-ben.dooks@codethink.co.uk>
 <20190925112347.14141-2-ben.dooks@codethink.co.uk>
Message-ID: <9fa57fc3efb26268e4b24f230329009a@codethink.co.uk>
X-Sender: ben.dooks@codethink.co.uk
User-Agent: Roundcube Webmail/1.3.10
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 2019-09-25 12:23, Ben Dooks wrote:
> Fix sparse warnings of a 0 being used for a pointer by removing it from
> the initialiser.
> 
> drivers/clk/hisilicon/clk-hi3660.c:336:69: warning: Using plain
> integer as NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:338:69: warning: Using plain
> integer as NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:340:70: warning: Using plain
> integer as NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:342:69: warning: Using plain
> integer as NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:344:69: warning: Using plain
> integer as NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:346:69: warning: Using plain
> integer as NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:348:70: warning: Using plain
> integer as NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:350:69: warning: Using plain
> integer as NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:352:69: warning: Using plain
> integer as NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:354:70: warning: Using plain
> integer as NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:356:69: warning: Using plain
> integer as NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:358:69: warning: Using plain
> integer as NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:360:69: warning: Using plain
> integer as NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:362:69: warning: Using plain
> integer as NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:364:69: warning: Using plain
> integer as NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:366:69: warning: Using plain
> integer as NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:368:69: warning: Using plain
> integer as NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:370:69: warning: Using plain
> integer as NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:372:70: warning: Using plain
> integer as NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:374:70: warning: Using plain
> integer as NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:376:70: warning: Using plain
> integer as NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:378:71: warning: Using plain
> integer as NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:423:68: warning: Using plain
> integer as NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:425:68: warning: Using plain
> integer as NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:427:68: warning: Using plain
> integer as NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:429:68: warning: Using plain
> integer as NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:449:70: warning: Using plain
> integer as NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:451:71: warning: Using plain
> integer as NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:453:71: warning: Using plain
> integer as NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:455:71: warning: Using plain
> integer as NULL pointer


Compile testing show same object from both pre and post patch.
