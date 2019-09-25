Return-Path: <SRS0=5BEl=XU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 128A9C432C2
	for <linux-clk@archiver.kernel.org>; Wed, 25 Sep 2019 13:44:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D8BFD2146E
	for <linux-clk@archiver.kernel.org>; Wed, 25 Sep 2019 13:44:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406583AbfIYNoU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Sep 2019 09:44:20 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:49590 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406357AbfIYNoU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Sep 2019 09:44:20 -0400
Received: from [78.40.148.177] (helo=localhost)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iD7aa-0007gd-TH; Wed, 25 Sep 2019 14:44:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 25 Sep 2019 14:44:16 +0100
From:   Ben Dooks <ben.dooks@codethink.co.uk>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH 1/2] clk: hisilicon: fix sparse warnings in clk-hi3670.c
In-Reply-To: <20190925131443.0B1A520640@mail.kernel.org>
References: <20190925112347.14141-1-ben.dooks@codethink.co.uk>
 <20190925131443.0B1A520640@mail.kernel.org>
Message-ID: <20c08a1299306c5f58449c21118a306a@codethink.co.uk>
X-Sender: ben.dooks@codethink.co.uk
User-Agent: Roundcube Webmail/1.3.10
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 2019-09-25 14:14, Stephen Boyd wrote:
> Quoting Ben Dooks (2019-09-25 04:23:46)
>> Fix the following warnings from sparse by removing the 0 initialiser
>> that is actually a pointer.
>> 
>> drivers/clk/hisilicon/clk-hi3670.c:298:64: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:300:64: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:302:64: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:304:64: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:306:63: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:308:63: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:310:63: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:312:63: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:314:64: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:316:64: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:318:64: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:320:64: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:322:63: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:324:64: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:326:64: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:328:63: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:330:64: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:332:63: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:334:63: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:336:64: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:338:64: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:340:64: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:342:64: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:344:63: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:346:64: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:348:65: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:350:64: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:352:64: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:488:69: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:490:70: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:492:70: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:494:69: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:496:70: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:498:69: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:500:69: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:502:70: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:504:69: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:506:69: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:508:69: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:510:70: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:512:69: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:514:70: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:516:69: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:518:70: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:520:69: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:522:69: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:524:70: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:526:70: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:528:69: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:530:69: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:532:70: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:534:71: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:536:71: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:538:69: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:611:64: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:614:64: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:616:64: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:653:70: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:655:70: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:657:70: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:659:70: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:661:70: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:663:70: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:665:70: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:735:63: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:737:63: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:739:63: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:741:63: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:743:64: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:745:64: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:802:69: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:804:69: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:806:69: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:808:69: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:810:70: warning: Using plain 
>> integer as NULL pointer
>> drivers/clk/hisilicon/clk-hi3670.c:812:69: warning: Using plain 
>> integer as NULL pointer
>> 
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> 
> Did you compile and confirm that the binary is the same before and
> after? It would give me more confidence if that was stated in the 
> commit
> text, otherwise I'll have to build the code before and after to make
> sure myself.

yes, get the same binary output pre and post patching.
