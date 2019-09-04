Return-Path: <SRS0=96bN=W7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5776DC3A59E
	for <linux-clk@archiver.kernel.org>; Wed,  4 Sep 2019 22:52:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 290B420674
	for <linux-clk@archiver.kernel.org>; Wed,  4 Sep 2019 22:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567637526;
	bh=KjjsNXmfU6/bVaHxOLwPlulfnpjobE+eKeHoWxDEmgo=;
	h=In-Reply-To:References:Cc:Subject:To:From:Date:List-ID:From;
	b=KTOKAkzstBGiHzoo4/mgMLA1exH+nOB6/B9X89T8XXndxbZPD9e4PLk1WotQ3js34
	 QerqUkTlpSCi5thZ6Z/cIz1Zl3aERTdKunHcW5+wa5IP0SiyBYhrlxl14QcFXdD7fo
	 bWstVGr4vYzDPfaFUadnM3MqQlzXu7jgKc+D7Dp4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbfIDWwF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Sep 2019 18:52:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:39956 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728072AbfIDWwF (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 4 Sep 2019 18:52:05 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7289420674;
        Wed,  4 Sep 2019 22:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567637524;
        bh=KjjsNXmfU6/bVaHxOLwPlulfnpjobE+eKeHoWxDEmgo=;
        h=In-Reply-To:References:Cc:Subject:To:From:Date:From;
        b=eTeUD43/+KlrzCmj7/FXDFZAenuM2vYKiXs6HKBozuDJXMvJpT5WofiSnVORRqOQl
         BJu4ApZF1BvUn8Uf15jcHF/Hv7FUyTlTt6b5AiH4/zo4vXRlJLI7Pq813Hfv3iex82
         pZtVxstmOtqtrhbyXfVe5YUGqNZvLMdz2W5tbe5s=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1jsgpivjbu.fsf@starbuckisacylon.baylibre.com>
References: <20190828102012.4493-1-jbrunet@baylibre.com> <20190828102012.4493-5-jbrunet@baylibre.com> <20190828221529.026C522DA7@mail.kernel.org> <1jy2zcv3nd.fsf@starbuckisacylon.baylibre.com> <20190829171743.577932173E@mail.kernel.org> <1jsgpivjbu.fsf@starbuckisacylon.baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH RFC 4/5] clk: add placeholder for clock internal data
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Wed, 04 Sep 2019 15:52:03 -0700
Message-Id: <20190904225204.7289420674@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jerome Brunet (2019-08-30 07:06:29)
> On Thu 29 Aug 2019 at 10:17, Stephen Boyd <sboyd@kernel.org> wrote:
>=20
> > Quoting Jerome Brunet (2019-08-29 00:20:38)
> >> On Wed 28 Aug 2019 at 15:15, Stephen Boyd <sboyd@kernel.org> wrote:
> >>=20
> >> > Quoting Jerome Brunet (2019-08-28 03:20:11)
> >> >> Add placeholder in clock core to save per clock data.
> >> >> Such placeholder could use for clock doing memory allocation in .in=
it().
> >> >> It may also be useful for the save/restore_context() callbacks.
> >> >>=20
> >> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> >> >> ---
> >> >>  drivers/clk/clk.c            | 13 +++++++++++++
> >> >>  include/linux/clk-provider.h |  2 ++
> >> >>  2 files changed, 15 insertions(+)
> >> >>=20
> >> >> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> >> >> index c703aa35ca37..aa77a2a98ea4 100644
> >> >> --- a/drivers/clk/clk.c
> >> >> +++ b/drivers/clk/clk.c
> >> >> @@ -83,6 +83,7 @@ struct clk_core {
> >> >>         struct hlist_node       debug_node;
> >> >>  #endif
> >> >>         struct kref             ref;
> >> >> +       void                    *priv;
> >> >
> >> > Why? We have container structures around clk_hw that can be used to
> >> > store data and clk_ops that should know to deref said clk_hw pointer=
 in
> >> > some way to access that data.
> >>=20
> >> This simple addition give a placeholder to each clock instance that is
> >> hosted under the clock core so we know it can only be accesed from this
> >> particular instance. Seems like a better fit for runtime data, such as
> >> saved context.
> >>=20
> >> It gives a way to avoid mixing the clock description and its runtime
> >> data. In the end, It would be nice if the clock description part could
> >> be made const.
> >>=20
> >> This is a (fairly usual) way to do it=20
> >
> > Maybe you can provide an example or usage? Is that the last patch in
> > this series?
>=20
> Yes, I thought that was in my cover letter
>=20
> > I still don't quite understand why we need this.
> >
> > I imagine that if you wanted to have a const description part you could
> > have a container structure around the clk_hw struct
> >
> >       struct my_clk_foo {
> >               const struct clk_description *desc;
> >               <runtime modifiable members>;
> >               struct clk_hw hw;
> >       };
> >
> > Did I miss something?
>=20
> Not really. As with all C code, there are many way to do things.
> Your way could work, mine too.
>=20
> As explained in the previous mail, what I propose guaranteed to specific
> to each clock instance. It's a fairly usual and simple way to give a
> placeholder to the instance of something.
>=20
> Things gets complicated with your way if the clock declaration uses
> static data and there there multiple instance of it.
>=20
> In the end that was merely a suggestion, so let's spend to much time on
> this. If don't want it, that's fine. I'll just drop it.

Ok. I see that this is how the meson clk driver does clk_regmap structs.
I agree that if the same data exists for many clks then having a pointer
to that data instead of duplicating it is good for saving space, but
that sort of detail can still be put into a void *data member of the
wrapper structure(s) and then passed to some function that knows the
type of the data that's the same. It may require writing a few more
functions to unwrap the data member out of the wrapper struct though so
having a data member of the clk_hw or clk_core pointer may be useful to
make "polymorphic" code that just knows that the data member is some
particular type and can operate on that generically without having to
unwrap the container for each different type.

TL;DR is I'm half convinced that this is a good approach to solving that
sort of problem.

