Return-Path: <SRS0=zV46=WZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE96C3A59F
	for <linux-clk@archiver.kernel.org>; Thu, 29 Aug 2019 17:17:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D449E2173E
	for <linux-clk@archiver.kernel.org>; Thu, 29 Aug 2019 17:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567099064;
	bh=wBgawV0LXEgMrYNhfpovu+vgFyTPueS3RG+5pYUYpEY=;
	h=In-Reply-To:References:Cc:Subject:To:From:Date:List-ID:From;
	b=D8bd4k9HnwMy1zWRMrJtIK3kyorU8THaCTOlfRxkuBUy4WzAcwydWt3BhIzYZwoZH
	 uzQmkagt4Ytmq6z4ahNxbnztx408SAeeL21n8mMQBfr5i+e1Yf7APt227AYInPF8JQ
	 ai+RPDLG7/Y59Hw/lLEBUW5bANIfM135csJqTOX4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727118AbfH2RRo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Aug 2019 13:17:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:34610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726973AbfH2RRo (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 29 Aug 2019 13:17:44 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 577932173E;
        Thu, 29 Aug 2019 17:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567099063;
        bh=wBgawV0LXEgMrYNhfpovu+vgFyTPueS3RG+5pYUYpEY=;
        h=In-Reply-To:References:Cc:Subject:To:From:Date:From;
        b=LumDKJ3rG3KB8cdDbuuKWsE6I9NLOzYbSxiRNFKTBP3hB7eLpRFjwCR2FICRfPb9Q
         U4GTuDRcU2JoFPwM9Ove1OL1yWlL0oQYTfpgi1X5wwHPr/fQety0XWCtyWGGegZSzl
         qxmThHQmnSgi9OELeYH9aWuWs3Wg7a1Bn07j4TDw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1jy2zcv3nd.fsf@starbuckisacylon.baylibre.com>
References: <20190828102012.4493-1-jbrunet@baylibre.com> <20190828102012.4493-5-jbrunet@baylibre.com> <20190828221529.026C522DA7@mail.kernel.org> <1jy2zcv3nd.fsf@starbuckisacylon.baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH RFC 4/5] clk: add placeholder for clock internal data
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Thu, 29 Aug 2019 10:17:42 -0700
Message-Id: <20190829171743.577932173E@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jerome Brunet (2019-08-29 00:20:38)
> On Wed 28 Aug 2019 at 15:15, Stephen Boyd <sboyd@kernel.org> wrote:
>=20
> > Quoting Jerome Brunet (2019-08-28 03:20:11)
> >> Add placeholder in clock core to save per clock data.
> >> Such placeholder could use for clock doing memory allocation in .init(=
).
> >> It may also be useful for the save/restore_context() callbacks.
> >>=20
> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> >> ---
> >>  drivers/clk/clk.c            | 13 +++++++++++++
> >>  include/linux/clk-provider.h |  2 ++
> >>  2 files changed, 15 insertions(+)
> >>=20
> >> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> >> index c703aa35ca37..aa77a2a98ea4 100644
> >> --- a/drivers/clk/clk.c
> >> +++ b/drivers/clk/clk.c
> >> @@ -83,6 +83,7 @@ struct clk_core {
> >>         struct hlist_node       debug_node;
> >>  #endif
> >>         struct kref             ref;
> >> +       void                    *priv;
> >
> > Why? We have container structures around clk_hw that can be used to
> > store data and clk_ops that should know to deref said clk_hw pointer in
> > some way to access that data.
>=20
> This simple addition give a placeholder to each clock instance that is
> hosted under the clock core so we know it can only be accesed from this
> particular instance. Seems like a better fit for runtime data, such as
> saved context.
>=20
> It gives a way to avoid mixing the clock description and its runtime
> data. In the end, It would be nice if the clock description part could
> be made const.
>=20
> This is a (fairly usual) way to do it=20

Maybe you can provide an example or usage? Is that the last patch in
this series? I still don't quite understand why we need this.

I imagine that if you wanted to have a const description part you could
have a container structure around the clk_hw struct

	struct my_clk_foo {
		const struct clk_description *desc;
		<runtime modifiable members>;
		struct clk_hw hw;
	};

Did I miss something?

