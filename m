Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E54D4C63697
	for <linux-clk@archiver.kernel.org>; Wed, 18 Nov 2020 10:46:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 82241206A5
	for <linux-clk@archiver.kernel.org>; Wed, 18 Nov 2020 10:46:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uXqRFBrT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726297AbgKRKp5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Nov 2020 05:45:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:53616 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725497AbgKRKp5 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 18 Nov 2020 05:45:57 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EEB0F206A5;
        Wed, 18 Nov 2020 10:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1605696356;
        bh=j4uvHGTFctCprHqBoNueHK6h27uBAYaG5XLupDLfzaU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uXqRFBrTIfnCHj5VSLEb8YrFpigYq/5tv+re9UAt3qXeLpEIO6aLZNKahi38YEj5+
         FucMnJbjohYXdWYIwHn50Nqp1kjBg9d2TyEmhIZqvNtR4RMvrAxKwvWACEm4BC8cbj
         yOgIfGR9mFJBWtZf7cpOpAm6h95Qw1F3z+am2g9w=
Date:   Wed, 18 Nov 2020 11:46:43 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Wiebe, Wladislav (Nokia - DE/Ulm)" <wladislav.wiebe@nokia.com>
Cc:     "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] clk: move orphan_list back to DEBUG_FS section
Message-ID: <X7T7kxuY1fuAtlqX@kroah.com>
References: <AM7PR07MB67076EAED784F061D17AC015FAE10@AM7PR07MB6707.eurprd07.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM7PR07MB67076EAED784F061D17AC015FAE10@AM7PR07MB6707.eurprd07.prod.outlook.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Nov 18, 2020 at 10:23:02AM +0000, Wiebe, Wladislav (Nokia - DE/Ulm) wrote:
> commit 903c6bd937ca ("clk: Evict unregistered clks from parent caches")
> in v4.19.142 moves orphan_list to global section which is not used when
> CONFIG_DEBUG_FS is disabled.
> 
> Fixes:
> drivers/clk/clk.c:49:27: error: 'orphan_list' defined but not used
> [-Werror=unused-variable]
>  static struct hlist_head *orphan_list[] = {
>                            ^~~~~~~~~~~
> 
> Fixes: 903c6bd937ca ("clk: Evict unregistered clks from parent caches")
> 
> Signed-off-by: Wladislav Wiebe <wladislav.wiebe@nokia.com>
> 
> ---
>  drivers/clk/clk.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
