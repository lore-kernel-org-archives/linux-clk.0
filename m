Return-Path: <SRS0=MqlC=IF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C47C433E0
	for <linux-clk@archiver.kernel.org>; Sun,  7 Mar 2021 14:30:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B90C650F8
	for <linux-clk@archiver.kernel.org>; Sun,  7 Mar 2021 14:30:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230390AbhCGO3o convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 7 Mar 2021 09:29:44 -0500
Received: from aposti.net ([89.234.176.197]:53130 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230346AbhCGO3U (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 7 Mar 2021 09:29:20 -0500
Date:   Sun, 07 Mar 2021 14:29:07 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] clk: Fix doc of clk_get_parent
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     od@zcrc.me, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <J8SLPQ.MXUB9SDIPWN13@crapouillou.net>
In-Reply-To: <20210307142701.GD1463@shell.armlinux.org.uk>
References: <20210307140626.22699-1-paul@crapouillou.net>
        <20210307142701.GD1463@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

Le dim. 7 mars 2021 à 14:27, Russell King - ARM Linux admin 
<linux@armlinux.org.uk> a écrit :
> On Sun, Mar 07, 2021 at 02:06:26PM +0000, Paul Cercueil wrote:
>>  On error, or when the passed parameter is NULL, the return value is 
>> NULL
>>  and not a PTR_ERR()-encoded value.
> 
> No, the documentation is accurate. The CCF is just an implementation
> of the API, the file you are modifying is the definitive API
> documentation.

Well, then the code has to be fixed, because right now it returns NULL 
on error, since the 2.6 days.

Cheers,
-Paul


