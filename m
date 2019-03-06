Return-Path: <SRS0=wiT5=RJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58305C43381
	for <linux-clk@archiver.kernel.org>; Wed,  6 Mar 2019 17:20:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 280E420842
	for <linux-clk@archiver.kernel.org>; Wed,  6 Mar 2019 17:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1551892843;
	bh=MT71fMATCuz2XZX1ybMXgIrXaeYpKKAzQ6zbd902jwI=;
	h=In-Reply-To:References:From:Subject:Cc:To:Date:List-ID:From;
	b=pkchJKSQj/oJn0eNOHHFY5ygttk2EFeiVm0zWW5U83HKM7M+KoYNQgrSCTrsnEe5w
	 V58UGb6XyY3CuWtvgsLok/CufoeF/PuLEuLcaMe5nGT0OzedxOQ0Kao7cbHLIn020S
	 REUyWVQqmsFgEYP/+RRs3cbvCbMB6fkuCXuOvtfg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727133AbfCFRUm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Mar 2019 12:20:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:37562 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726446AbfCFRUm (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 6 Mar 2019 12:20:42 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AF23820684;
        Wed,  6 Mar 2019 17:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1551892841;
        bh=MT71fMATCuz2XZX1ybMXgIrXaeYpKKAzQ6zbd902jwI=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=BJVUY58nY/QVO8yUQYkAt2SgIBaqwZE31IKr8JtbAzp8BmW914nY56oujEtDzIFzC
         scaqK7qs6b1jEHY3envbHvNyGTrCAywESl5enSLUUj1hYK0IHHkHUuFKX9DBfnmqM3
         J21/IRJNqpnzd3D8rMi4HFcgqhmlvXJghAWeS4+I=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87wolcbhy4.wl-kuninori.morimoto.gx@renesas.com>
References: <877edcczwl.wl-kuninori.morimoto.gx@renesas.com> <87wolcbhy4.wl-kuninori.morimoto.gx@renesas.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: Question about devm_get_clk_from_child()
Cc:     Linux-ALSA <alsa-devel@alsa-project.org>,
        <linux-clk@vger.kernel.org>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <155189284090.20095.14047212664009518639@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Wed, 06 Mar 2019 09:20:40 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Kuninori Morimoto (2019-03-05 23:18:28)
>=20
> of_clk_get_by_name() is using -1 for __of_clk_get() index.
> It will goes to of_parse_clkspec(), and be used for
> of_parse_phandle_with_args().
> Here, if user doesn't specified clock name
> (=3D of_clk_get_by_name(np, NULL)), this index is still -1,
> and of_parse_phandle_with_args() will return -EINVAL
> (This index will be updated if if it had clock name).
> clk_get_by_name(np, NULL) should work, then, default index
> should be 0 instead of -1.
> This patch fixup it.
>=20
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/clk/clk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 14cbf23..96053a9 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -4213,7 +4213,7 @@ struct clk *of_clk_get_by_name(struct device_node *=
np, const char *name)
>         if (!np)
>                 return ERR_PTR(-ENOENT);
> =20
> -       return __of_clk_get(np, -1, np->full_name, name);
> +       return __of_clk_get(np, 0, np->full_name, name);
>  }

Yes this is correct. Thanks for debugging and fixing my thinko here. I
was thinking that nobody would call of_clk_get_by_name() unless they
wanted to find some clk that had a matching name, but it seems that we
also allow NULL to be passed as the name to mean the typical "wildcard
match" thing that clkdev has done for years. I'll throw this patch on
top of the merge commit so the breakage window is small as I'd rather
not rewrite the series just for this. Thanks.

