Return-Path: <SRS0=fPJi=XW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_SBL,URIBL_SBL_A autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF9EEC4360C
	for <linux-clk@archiver.kernel.org>; Fri, 27 Sep 2019 23:05:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 87E752075D
	for <linux-clk@archiver.kernel.org>; Fri, 27 Sep 2019 23:05:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727273AbfI0XFS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 27 Sep 2019 19:05:18 -0400
Received: from 5.mo4.mail-out.ovh.net ([188.165.44.50]:37563 "EHLO
        5.mo4.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725990AbfI0XFR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 27 Sep 2019 19:05:17 -0400
X-Greylist: delayed 12600 seconds by postgrey-1.27 at vger.kernel.org; Fri, 27 Sep 2019 19:05:17 EDT
Received: from player718.ha.ovh.net (unknown [10.109.159.132])
        by mo4.mail-out.ovh.net (Postfix) with ESMTP id 45E8A208D72
        for <linux-clk@vger.kernel.org>; Fri, 27 Sep 2019 20:18:45 +0200 (CEST)
Received: from RCM-web9.webmail.mail.ovh.net (unknown [109.190.253.11])
        (Authenticated sender: steve@sk2.org)
        by player718.ha.ovh.net (Postfix) with ESMTPSA id DAB08A401549;
        Fri, 27 Sep 2019 18:18:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Fri, 27 Sep 2019 20:18:37 +0200
From:   Stephen Kitt <steve@sk2.org>
To:     Tero Kristo <t-kristo@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-omap@vger.kernel.org,
        linux-clk@vger.kernel.org, Tony Lindgren <tony@atomide.com>
Cc:     linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk/ti/adpll: allocate room for terminating null
In-Reply-To: <20190927180559.18162-1-steve@sk2.org>
References: <cec235b3e2e4e3b206fa9444b643fa56@sk2.org>
 <20190927180559.18162-1-steve@sk2.org>
Message-ID: <8e45c174b787a26eb60762b8ca2e4747@sk2.org>
X-Sender: steve@sk2.org
User-Agent: Roundcube Webmail/1.3.10
X-Originating-IP: 109.190.253.11
X-Webmail-UserID: steve@sk2.org
X-Ovh-Tracer-Id: 5946158883481472455
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrfeeigdduvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Le 27/09/2019 20:05, Stephen Kitt a écrit :
> The buffer allocated in ti_adpll_clk_get_name doesn't account for the
> terminating null. This patch switches to ka_sprintf to avoid

Aargh, devm_kasprintf of course...

> overflowing.
> 
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> ---
>  drivers/clk/ti/adpll.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/ti/adpll.c b/drivers/clk/ti/adpll.c
> index fdfb90058504..021cf9e2b4db 100644
> --- a/drivers/clk/ti/adpll.c
> +++ b/drivers/clk/ti/adpll.c
> @@ -195,14 +195,8 @@ static const char *ti_adpll_clk_get_name(struct
> ti_adpll_data *d,
>  			return NULL;
>  	} else {
>  		const char *base_name = "adpll";
> -		char *buf;
> -
> -		buf = devm_kzalloc(d->dev, 8 + 1 + strlen(base_name) + 1 +
> -				    strlen(postfix), GFP_KERNEL);
> -		if (!buf)
> -			return NULL;
> -		sprintf(buf, "%08lx.%s.%s", d->pa, base_name, postfix);
> -		name = buf;
> +		name = devm_kasprintf(d->dev, GFP_KERNEL, "%08lx.%s.%s",
> +				      d->pa, base_name, postfix);
>  	}
> 
>  	return name;
