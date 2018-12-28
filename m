Return-Path: <SRS0=9SV/=PF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 625FBC43444
	for <linux-clk@archiver.kernel.org>; Fri, 28 Dec 2018 22:30:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 31FA2218E0
	for <linux-clk@archiver.kernel.org>; Fri, 28 Dec 2018 22:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1546036219;
	bh=QaAmJsokl68cIkcjurmGwr9Cyfqu8hRvXr+giYr7hI4=;
	h=To:References:Subject:Cc:From:In-Reply-To:Date:List-ID:From;
	b=MqiOzJ9l8zPa7zx2jO+15+eT4/j7FKkfFv0+SSp4YMCExcpcJEcnSUV7zDZWeR6nM
	 j1C5pwTAmOwKvsCUXvvQmVnT3dxN/y33qeDwbWIOLXawJPuh5nwmYIbgqKoJn1o5ZA
	 DE1l3VXgIQJdyHDDxevbN4XBgC1CYPXRG5wnsnto=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726083AbeL1WaS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Dec 2018 17:30:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:46850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726022AbeL1WaS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 28 Dec 2018 17:30:18 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8399E206C0;
        Fri, 28 Dec 2018 22:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1546036217;
        bh=QaAmJsokl68cIkcjurmGwr9Cyfqu8hRvXr+giYr7hI4=;
        h=To:References:Subject:Cc:From:In-Reply-To:Date:From;
        b=HvZ95QaAG26EoLTxMKJ8dF+k6dfSUyQfSGlx5eZ3we1jM999DpT8DEP5HUkqV4ITq
         f0YM77NjGDs3tOOTGO1yqS7NKgftagTLHZMQARvSyN+2Js725CNwAoDKITTRkoW/Sy
         l7/GyAvxXcHSpEC//Iijxzay+SjdshRWduekOFp8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Marek Vasut <marek.vasut@gmail.com>
Message-ID: <154603621662.179992.6055107804025821286@swboyd.mtv.corp.google.com>
References: <20181215005519.3695-1-marek.vasut+renesas@gmail.com> <13438812.kSL9ZioSIq@avalon> <3220bca0-486d-08a8-7575-34c961ed1261@gmail.com>
Subject: Re: [PATCH] clk: vc5: Abort clock configuration without upstream clock
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Alexey Firago <alexey_firago@mentor.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
In-Reply-To: <3220bca0-486d-08a8-7575-34c961ed1261@gmail.com>
Date:   Fri, 28 Dec 2018 14:30:16 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Vasut (2018-12-16 09:14:29)
> On 12/16/2018 08:19 AM, Laurent Pinchart wrote:
> > Hi Marek,
> >=20
> > Thank you for the patch.
> >=20
> > On Saturday, 15 December 2018 02:55:19 EET Marek Vasut wrote:
> >> In case the upstream clock are not set, which can happen in case the
> >> VC5 has no valid upstream clock, the $src variable is used uninited
> >> by regmap_update_bits(). Check for this condition and return -EINVAL
> >> in such case.
> >=20
> > Note that the probe() function will fail in this case, so vc5_mux_set_p=
arent()=20
> > won't be reached.
> >=20
> >> Note that in case the VC5 has no valid upstream clock, the VC5 can
> >> not operate correctly. That is a hardware property of the VC5. The
> >> internal oscilator present in some VC5 models is also considered
> >> upstream clock.
> >>
> >> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> >> Cc: Alexey Firago <alexey_firago@mentor.com>
> >> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> Cc: Stephen Boyd <sboyd@kernel.org>
> >> Cc: linux-renesas-soc@vger.kernel.org
> >> ---
> >> NOTE: This is an updated version of:
> >>       https://patchwork.kernel.org/patch/10731699/
> >> ---
> >>  drivers/clk/clk-versaclock5.c | 4 +++-
> >>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versacloc=
k5.c
> >> index 5b393e711e94..b10801506518 100644
> >> --- a/drivers/clk/clk-versaclock5.c
> >> +++ b/drivers/clk/clk-versaclock5.c
> >> @@ -262,8 +262,10 @@ static int vc5_mux_set_parent(struct clk_hw *hw, =
u8
> >> index)
> >>
> >>              if (vc5->clk_mux_ins =3D=3D VC5_MUX_IN_XIN)
> >>                      src =3D VC5_PRIM_SRC_SHDN_EN_XTAL;
> >> -            if (vc5->clk_mux_ins =3D=3D VC5_MUX_IN_CLKIN)
> >> +            else if (vc5->clk_mux_ins =3D=3D VC5_MUX_IN_CLKIN)
> >>                      src =3D VC5_PRIM_SRC_SHDN_EN_CLKIN;
> >> +            else
> >> +                    return -EINVAL;
> >>      }
> >=20
> > I'd rather go for Stephen's approach if the goal is just to silence a w=
arning=20
> > for a condition that can't happen in practice.
>=20
> Sure, probe will fail, but it's safer to handle the possibility that
> probe() is broken and this code is reached by properly handling the
> failure instead of doing something obviously wrong (like configuring the
> hardware with value 0).

I'm fine with this approach. Laurent?

