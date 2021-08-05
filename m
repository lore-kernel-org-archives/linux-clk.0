Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C3FC4338F
	for <linux-clk@archiver.kernel.org>; Thu,  5 Aug 2021 21:52:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6CE6A61102
	for <linux-clk@archiver.kernel.org>; Thu,  5 Aug 2021 21:52:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbhHEVwp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Aug 2021 17:52:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229987AbhHEVwo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Aug 2021 17:52:44 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23FD3C0613D5
        for <linux-clk@vger.kernel.org>; Thu,  5 Aug 2021 14:52:29 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id c137so11163921ybf.5
        for <linux-clk@vger.kernel.org>; Thu, 05 Aug 2021 14:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/UQ/XHaeIooFE6LdVCRHH8ogFbxbCCOS2tpf69zhkNE=;
        b=dwukpaJ0801S19b/iRaXaWXKAHkyOED36pnTpyc8AjYSHmgJMLD+aMktnliUWW6rEq
         PppEKZ3M+Dnqt2a39XTo24QWO38mo+zFGiBtzu/Ya/9iMFW9XCvTesRkEvPbt3/hx4sZ
         gm0lAKM/sF1MzN1zXeTZSCT5vU5JFyWeSom0wrUD/1pv12A8DvN4VZDtud9Ostr0i9aW
         CSx32++0/FvTz25+HsAFJfAmx7e7VwK+C+akrPRr/iwLbheFfOZToJWOkz32pVyXSbUA
         exM9/ZWaqnBhQJ9LegvH4umDa3j74KhKywouLmYMwAAdch1XWVl9aP+9NqSUZveFmqNR
         w9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/UQ/XHaeIooFE6LdVCRHH8ogFbxbCCOS2tpf69zhkNE=;
        b=lt21e069P4G4jL/yO0vi9sHud5MnbYteB9ZISLQHbt9R0Tf7SakrdMIyYBFIBjRo7T
         mMVBUTKkBq6DjGEwK2t1wmmLM3Lxs6GmJwNawYOGOEgL75m5G9cfnQx11/izlxi+V0wd
         57FvtVJ0jRhk7SsJhD1fIqQ3YzfmCvZzrXqwrkliSrd97NmV7S86RblEThURStf9u+Yt
         T9qtwRZtlyWn6J3ikHQwa8euCW2+A43zSa9U6Zq69i/6wY8PxtDAwsgG6sjIMNQPQnmW
         o7hmTlqb97dKrda+wbvQEzMSjO2/YQae2KcFhKuaWbcyZShkqr4h7CV9n0eNJ0B4WoEW
         sEpw==
X-Gm-Message-State: AOAM530PklokU1cdFSkrQq7Gcxk1zmyHfSmtovCwZKRWthsS03ii0dl9
        hWbZESfTL9vQdhzuXozYOmXCDvfaMBqjCyMrSMol4g==
X-Google-Smtp-Source: ABdhPJw2QbmHUiI/GwToKTEaqQh0Zuz+Twwt1bbE9HNroKUywRwDzkiE+5/3vMcFtQ03MmF306AtYkLK232VndIfrlc=
X-Received: by 2002:a25:8b91:: with SMTP id j17mr8337744ybl.228.1628200348144;
 Thu, 05 Aug 2021 14:52:28 -0700 (PDT)
MIME-Version: 1.0
References: <BYAPR20MB24886765F888A9705CBEB70789E39@BYAPR20MB2488.namprd20.prod.outlook.com>
 <162758560739.714452.5782743329332725952@swboyd.mtv.corp.google.com>
 <CAGETcx8YYrkCV0UObtOqHUnS29Q-raC54KUh14wqyBDMJ4e46g@mail.gmail.com> <16392318.geO5KgaWL5@diego>
In-Reply-To: <16392318.geO5KgaWL5@diego>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 5 Aug 2021 14:51:52 -0700
Message-ID: <CAGETcx-H1U3YPq+Uh4PuKygTut3n0V4Y_YNSdr4JoJexA+KrtA@mail.gmail.com>
Subject: Re: [PATCH] clk: rk3308: make ddrphy4x clock critical
To:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc:     Stephen Boyd <sboyd@kernel.org>, Yunhao Tian <t123yh@outlook.com>,
        t123yh.xyz@gmail.com, Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Aug 2, 2021 at 12:26 PM Heiko St=C3=BCbner <heiko@sntech.de> wrote:
>
> Hi Saravana,
>
> Am Montag, 2. August 2021, 20:24:56 CEST schrieb Saravana Kannan:
> > On Thu, Jul 29, 2021 at 12:06 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Quoting Heiko St=C3=BCbner (2021-07-28 02:53:54)
> > > > Am Dienstag, 27. Juli 2021, 03:08:10 CEST schrieb Stephen Boyd:
> > > > > Quoting Yunhao Tian (2021-07-21 05:48:16)
> > > > > > Currently, no driver support for DDR memory controller (DMC) is=
 present,
> > > > > > as a result, no driver is explicitly consuming the ddrphy clock=
. This means
> > > > > > that VPLL1 (parent of ddr clock) will be shutdown if we enable
> > > > > > and then disable any child clock of VPLL1 (e.g. SCLK_I2S0_8CH_T=
X).
> > > > > > If VPLL1 is disabled, the whole system will freeze, because the=
 DDR
> > > > > > controller will lose its clock. So, it's necessary to prevent V=
PLL1 from
> > > > > > shutting down, by marking the ddrphy4x CLK_IS_CRITICAL.
> > > > > >
> > > > > > This bug was discovered when I was porting rockchip_i2s_tdm dri=
ver to
> > > > > > mainline kernel from Rockchip 4.4 kernel. I guess that other Ro=
ckchip
> > > > > > SoCs without DMC driver may need the same patch. If this applie=
s to
> > > > > > other devices, please let us know.
> > > > > >
> > > > > > Signed-off-by: Yunhao Tian <t123yh@outlook.com>
> > > > > > ---
> > > > > >  drivers/clk/rockchip/clk-rk3308.c | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/clk/rockchip/clk-rk3308.c b/drivers/clk/ro=
ckchip/clk-rk3308.c
> > > > > > index 2c3bd0c749f2..6be077166330 100644
> > > > > > --- a/drivers/clk/rockchip/clk-rk3308.c
> > > > > > +++ b/drivers/clk/rockchip/clk-rk3308.c
> > > > > > @@ -564,7 +564,7 @@ static struct rockchip_clk_branch rk3308_cl=
k_branches[] __initdata =3D {
> > > > > >         COMPOSITE(SCLK_DDRCLK, "clk_ddrphy4x_src", mux_dpll_vpl=
l0_vpll1_p, CLK_IGNORE_UNUSED,
> > > > > >                         RK3308_CLKSEL_CON(1), 6, 2, MFLAGS, 0, =
3, DFLAGS,
> > > > > >                         RK3308_CLKGATE_CON(0), 10, GFLAGS),
> > > > > > -       GATE(0, "clk_ddrphy4x", "clk_ddrphy4x_src", CLK_IGNORE_=
UNUSED,
> > > > > > +       GATE(0, "clk_ddrphy4x", "clk_ddrphy4x_src", CLK_IGNORE_=
UNUSED | CLK_IS_CRITICAL,
> > > > >
> > > > > Is it not enabled by default?
> > > >
> > > > All gates are enabled by default, but this gate shares a common par=
ent
> > > > tree down to a pll, so if another leaf-user is disabling their part=
, this
> > > > untracked clock would get disabled as well.
> > >
> > > Right, this problem is cropping up in different places for various
> > > drivers.
> > >
> > > >
> > > > On that note, I remember a sort of CLK_HANDOFF was planned way back
> > > > in the past, meaning clock is critical until a driver picks it up, =
after this the
> > > > driver is responsible for it. Did that get any momentum?
> > > >
> > >
> > > Last I saw Saravana sent a patch to sort of connect CLK_HANDOFF to
> > > device driver sync_state() callback. I think we need to at least stas=
h
> > > away that a clk is enabled at boot and then figure out how to tie in
> > > sync_state and/or something else.
> >
> > Yeah, my clk_sync_state() series should do that. I'll get back on that
> > patch this week or next.
> >
> > Yunhao,
> >
> > Is there at least some DT device that consumes the DDR phy clock? Can
> > you point me to the DT for this board (not the SoC) so I can take a
> > look at it later?
>
> Not for the rk3308. If you're looking for live-examples of handoff clocks=
,
> I can provide another examples though:
>
>
> rockchip/clk-rk3288.c - pclk_rkpwm (in the separate critical clock list) =
... with
> arch/arm/boot/dts/rk3288.dtsi - clock is supplying pwm nodes.
>
> As the comment in the clock driver suggests (line 850), some boards use
> pwm-regulators for central components. The pwm-regulators are configured
> at boot already, so the clock shouldn't be disabled till the pwm-regulato=
r takes
> over.

If you can reproduce the issue on your end if you remove the
pclk_rkpwm clock from the critical clock list, then can you try this
series?
https://lore.kernel.org/lkml/20210407034456.516204-1-saravanak@google.com/

It should keep the pclk_rkpwm clock on till all the consumers of the
clock have probed. And after that it'll actually allow the clock to be
turned off instead of keeping it on forever.

-Saravana
