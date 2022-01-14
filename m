Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED053C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 14 Jan 2022 22:20:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbiANWUP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Jan 2022 17:20:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiANWUP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Jan 2022 17:20:15 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13AA9C061574
        for <linux-clk@vger.kernel.org>; Fri, 14 Jan 2022 14:20:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A4EFB6203D
        for <linux-clk@vger.kernel.org>; Fri, 14 Jan 2022 22:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F35AAC36AE7;
        Fri, 14 Jan 2022 22:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642198814;
        bh=Kf62ANi68V8yt2UdyzSoWZj1vpHQ0KX3I9htIx6r0yE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=DwUBA+dJDbXoX7i7acUKUkOto1dZ14raK/pEA+TaHKHsTe/B+dj7SCmOWTQlriN3g
         5LsjxrlrTuONLpc9dlb8wqZjiBVpmr/SlMVJK0H52qOHEytThSCJR7ZpN663Czla7t
         cnMiRC/mPDyBK08hF+7DEfdLqJfswFCs6hII7ZTkRi4wBh4pVptArpXZOP4UEL1aqu
         /Wnuk9mHF/ZbDldbpKwDOq2cevqreqX6Zsu3FTxJy3qRyJuTrj5RZq9ev//ag7MzZQ
         099fFGi7Xph2KTJcLrNZoz7RiP2M3SAswTpegBzepU6sHGpawg9u3nNpFmftCl0JcR
         ZA0azxgvu0lmw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220114081442.GR26783@pengutronix.de>
References: <20220112141229.700708-1-m.tretter@pengutronix.de> <20220112202937.034D9C36AE5@smtp.kernel.org> <20220114081442.GR26783@pengutronix.de>
Subject: Re: [PATCH] clk: zynqmp: warn always when a clock op fails
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        mturquette@baylibre.com, michal.simek@xilinx.com,
        rajan.vaja@xilinx.com, kernel@pengutronix.de
To:     Michael Tretter <m.tretter@pengutronix.de>
Date:   Fri, 14 Jan 2022 14:20:12 -0800
User-Agent: alot/0.10
Message-Id: <20220114222013.F35AAC36AE7@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michael Tretter (2022-01-14 00:14:42)
> On Wed, 12 Jan 2022 12:29:35 -0800, Stephen Boyd wrote:
> > Quoting Michael Tretter (2022-01-12 06:12:29)
> > > The warning that a clock operation failed is only printed once. Howev=
er,
> > > the function is called for various different clocks. The limit hides
> > > warnings if different clock are affected by the failures.
> > >=20
> > > Print the warning every time when a clock operation fails.
> > >=20
> > > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > > ---
> > >  drivers/clk/zynqmp/clk-gate-zynqmp.c | 12 +++++------
> > >  drivers/clk/zynqmp/clk-mux-zynqmp.c  |  8 +++----
> > >  drivers/clk/zynqmp/divider.c         | 12 +++++------
> > >  drivers/clk/zynqmp/pll.c             | 32 ++++++++++++++------------=
--
> > >  4 files changed, 32 insertions(+), 32 deletions(-)
> > >=20
> > > diff --git a/drivers/clk/zynqmp/clk-gate-zynqmp.c b/drivers/clk/zynqm=
p/clk-gate-zynqmp.c
> > > index 565ed67a0430..0d9a39110f29 100644
> > > --- a/drivers/clk/zynqmp/clk-gate-zynqmp.c
> > > +++ b/drivers/clk/zynqmp/clk-gate-zynqmp.c
> > > @@ -41,8 +41,8 @@ static int zynqmp_clk_gate_enable(struct clk_hw *hw)
> > >         ret =3D zynqmp_pm_clock_enable(clk_id);
> > > =20
> > >         if (ret)
> > > -               pr_warn_once("%s() clock enabled failed for %s, ret =
=3D %d\n",
> > > -                            __func__, clk_name, ret);
> > > +               pr_warn("%s() clock enable failed for %s (id %d), ret=
 =3D %d\n",
> > > +                       __func__, clk_name, clk_id, ret);
> >=20
> > Can we just remove these prints entirely? The driver that calls
> > clk_enable() should be checking the return value and taking proper
> > action. What is the user going to do with these messages?
> >=20
>=20
> The clocks are handled by a firmware, which checks if the Linux system ha=
s the
> permission to change certain clocks. The warnings help users to identify =
an
> unexpected configuration of the firmware. However, I guess it would make =
sense
> to change the warnings to pr_debug.
>=20

Sure pr_debug() sounds fine.
