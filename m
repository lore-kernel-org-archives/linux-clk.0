Return-Path: <SRS0=HIww=U3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39795C4321A
	for <linux-clk@archiver.kernel.org>; Fri, 28 Jun 2019 19:35:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 04367208E3
	for <linux-clk@archiver.kernel.org>; Fri, 28 Jun 2019 19:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561750558;
	bh=+f+wmqDt7OEzXd5WamzVHMgvUtZ43luLwvAdtczdRY8=;
	h=In-Reply-To:References:To:From:Subject:Cc:Date:List-ID:From;
	b=0T5huO/3R+mT+R7y7P4zyhRUnsWbkHO/JVE8S1FcaFVAdlChBV58qxVPWU7QsOnsd
	 1fnoHm1p1c9jJW1ORiacp6e+r9jxKT/g7oRFK9o7zjutmPPkI5T4Tckh5s8RvGEoeY
	 /E/GqP223+06E6429TdIW1n6xRADw77qoftkeNtw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbfF1Tf5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Jun 2019 15:35:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:49864 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726819AbfF1Tf5 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 28 Jun 2019 15:35:57 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BC814208CB;
        Fri, 28 Jun 2019 19:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561750556;
        bh=+f+wmqDt7OEzXd5WamzVHMgvUtZ43luLwvAdtczdRY8=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=iL0s/4YikWl3EPOokIoNf34p44svd7uNFw7JGPiX49tbjgIyR+hhfFRDMJD79BseK
         IjOkipIq8Ufc42HhIIhhkJJEa2xB33lie/9hOGBvjYIMjm+9o7X+6UpOsHrdwWf+Xo
         PFlh/nhPESvbgA5Opxw9Chj+brSaFXlWd4dx1w30=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMuHMdWVoYPZFZPmfTWMU3pZc633uqkn70MyApcPhgUSgmCW-A@mail.gmail.com>
References: <0c12208398cadb7450b6b7745e99c55770c0ccf8.1561709827.git.leonard.crestez@nxp.com> <CAMuHMdWVoYPZFZPmfTWMU3pZc633uqkn70MyApcPhgUSgmCW-A@mail.gmail.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Leonard Crestez <leonard.crestez@nxp.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2] clk: Add clk_min/max_rate entries in debugfs
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
User-Agent: alot/0.8.1
Date:   Fri, 28 Jun 2019 12:35:55 -0700
Message-Id: <20190628193556.BC814208CB@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Geert Uytterhoeven (2019-06-28 04:58:27)
> On Fri, Jun 28, 2019 at 10:19 AM Leonard Crestez
>=20
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -591,10 +591,12 @@ static void clk_core_get_boundaries(struct clk_co=
re *core,
> >                                     unsigned long *min_rate,
> >                                     unsigned long *max_rate)
> >  {
> >         struct clk *clk_user;
> >
> > +       lockdep_assert_held(&prepare_lock);
> > +
>=20
> I guess the clock maintainers want to see the addition of this check
> spun off into a separate patch....

Yes. I'm not sure we should have the assertion in there. I seem to
recall that we thought it might not always be necessary to have the
lock, but maybe that was wrong.

