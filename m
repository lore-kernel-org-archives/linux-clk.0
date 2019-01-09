Return-Path: <SRS0=vytI=PR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3E19C43612
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jan 2019 18:49:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C5EBD214C6
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jan 2019 18:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1547059755;
	bh=eqbb7w4X8u1C4KQ+BEa3wxEfDFxzcSp9QUiJkXkq2yg=;
	h=Subject:Cc:To:In-Reply-To:From:References:Date:List-ID:From;
	b=xHBejMhD/4mB15qYn8cC4yaQbB4qg7DqVs6jRCzMRbX+VqPOCrz6UgZS0cZ1ihXv+
	 vgAFyXAdYzKamUOfw8X/pOt1e6LDPwupumTaLx3zbEbjxC5Gzn2OPWoJq7ZgNZaQSV
	 HX/y1yFHv7Xnili2gJx7pHZ5p4EbL+udQtF02U8U=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727690AbfAIStP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Jan 2019 13:49:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:49530 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726469AbfAIStP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 9 Jan 2019 13:49:15 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 89E7420661;
        Wed,  9 Jan 2019 18:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1547059753;
        bh=eqbb7w4X8u1C4KQ+BEa3wxEfDFxzcSp9QUiJkXkq2yg=;
        h=Subject:Cc:To:In-Reply-To:From:References:Date:From;
        b=ugtbc+sZirYZ5lUuRH4Y9rt5MB9S0Aovp0vsSQXKnMfrGN0CPLQB577WTjTfF3ok6
         rQMAuZGV5Ew3KoiUrlVqumDK4CDBrDjg2W5uS8VePUu0+vgEAf2gMMJiHuCCJCl/iY
         +dYw9fp9oy7tjiX8jS2hal9iuOeObussQGJ4hjZs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: vc5: Abort clock configuration without upstream clock
Cc:     Marek Vasut <marek.vasut@gmail.com>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Alexey Firago <alexey_firago@mentor.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
In-Reply-To: <55221313.VLWvnZIo28@avalon>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
References: <20181215005519.3695-1-marek.vasut+renesas@gmail.com> <3220bca0-486d-08a8-7575-34c961ed1261@gmail.com> <154603621662.179992.6055107804025821286@swboyd.mtv.corp.google.com> <55221313.VLWvnZIo28@avalon>
Message-ID: <154705975272.15366.15650647784951992295@swboyd.mtv.corp.google.com>
Date:   Wed, 09 Jan 2019 10:49:12 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Laurent Pinchart (2018-12-29 08:34:18)
> Hi Stephen,
>=20
> On Saturday, 29 December 2018 00:30:16 EET Stephen Boyd wrote:
> > Quoting Marek Vasut (2018-12-16 09:14:29)
> > > On 12/16/2018 08:19 AM, Laurent Pinchart wrote:
> > > > On Saturday, 15 December 2018 02:55:19 EET Marek Vasut wrote:
> > > >> In case the upstream clock are not set, which can happen in case t=
he
> > > >> VC5 has no valid upstream clock, the $src variable is used uninited
> > > >> by regmap_update_bits(). Check for this condition and return -EINV=
AL
> > > >> in such case.
> > > >=20
> > > > Note that the probe() function will fail in this case, so
> > > > vc5_mux_set_parent() won't be reached.
> > > >=20
> > > >> Note that in case the VC5 has no valid upstream clock, the VC5 can
> > > >> not operate correctly. That is a hardware property of the VC5. The
> > > >> internal oscilator present in some VC5 models is also considered
> > > >> upstream clock.
> > > >>=20
> > > >> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> > > >> Cc: Alexey Firago <alexey_firago@mentor.com>
> > > >> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > >> Cc: Stephen Boyd <sboyd@kernel.org>
> > > >> Cc: linux-renesas-soc@vger.kernel.org
> > > >> ---
> > > >>=20
> > > >> NOTE: This is an updated version of:
> > > >>       https://patchwork.kernel.org/patch/10731699/
> > > >>=20
> > > >> ---
> > > >>=20
> > > >>  drivers/clk/clk-versaclock5.c | 4 +++-
> > > >>  1 file changed, 3 insertions(+), 1 deletion(-)
> > > >>=20
> > > >> diff --git a/drivers/clk/clk-versaclock5.c
> > > >> b/drivers/clk/clk-versaclock5.c
> > > >> index 5b393e711e94..b10801506518 100644
> > > >> --- a/drivers/clk/clk-versaclock5.c
> > > >> +++ b/drivers/clk/clk-versaclock5.c
> > > >> @@ -262,8 +262,10 @@ static int vc5_mux_set_parent(struct clk_hw *=
hw,
> > > >> u8> index)
> > > >>=20
> > > >>              if (vc5->clk_mux_ins =3D=3D VC5_MUX_IN_XIN)
> > > >>                      src =3D VC5_PRIM_SRC_SHDN_EN_XTAL;
> > > >> -            if (vc5->clk_mux_ins =3D=3D VC5_MUX_IN_CLKIN)
> > > >> +            else if (vc5->clk_mux_ins =3D=3D VC5_MUX_IN_CLKIN)
> > > >>                      src =3D VC5_PRIM_SRC_SHDN_EN_CLKIN;
> > > >> +            else
> > > >> +                    return -EINVAL;
> > > >>      }
> > > >=20
> > > > I'd rather go for Stephen's approach if the goal is just to silence=
 a
> > > > warning for a condition that can't happen in practice.
> > >=20
> > > Sure, probe will fail, but it's safer to handle the possibility that
> > > probe() is broken and this code is reached by properly handling the
> > > failure instead of doing something obviously wrong (like configuring =
the
> > > hardware with value 0).
> >=20
> > I'm fine with this approach. Laurent?
>=20
> So am I. I might add a comment in the vc5_mu_set_parent() function to exp=
lain=20
> this can't happen.
>=20

Ok. I can add a note and throw this into clk-fixes.

