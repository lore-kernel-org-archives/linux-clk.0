Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 453D8C4338F
	for <linux-clk@archiver.kernel.org>; Mon,  2 Aug 2021 18:25:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1047D610A2
	for <linux-clk@archiver.kernel.org>; Mon,  2 Aug 2021 18:25:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbhHBSZn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 2 Aug 2021 14:25:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbhHBSZm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 2 Aug 2021 14:25:42 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D6C2C061760
        for <linux-clk@vger.kernel.org>; Mon,  2 Aug 2021 11:25:33 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id e4so16311163ybn.2
        for <linux-clk@vger.kernel.org>; Mon, 02 Aug 2021 11:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rgyhSNBwjVthGes2RpVRtUuo2LAriKbUmW6hz5Qrd9g=;
        b=gaQkvuDdgBKlEs/PlVOGa5TvgBNYLqsuhBXb7qPQEWqwFw0fxDTevKR0X3fI29/nh0
         SC+Os2urDnjCdcEGHBHLP05n6tYnRfqqQSiTELHjJZMT8HFgIlbfXJL/53kmi4GidZ+3
         J24lKZiFMjscgFzpGci1rlpIUATL2IItj32Bg4MFfn8khqb6ETjh6I+hGvdVaQTEnF9+
         yqwo3hq0MsMpQUaV+2/Hwly4fJ0T16kKOSfajcTOgbPgbBd6BGw0LQwWWJYy1//zQViQ
         fLN3mhVGs4nmX9S3tQ0VF18jo7XhdJs5aho1JTnxuk/g0JIMj/N526STboFf/5mKvEx2
         sRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rgyhSNBwjVthGes2RpVRtUuo2LAriKbUmW6hz5Qrd9g=;
        b=kOz27txBuJea4LvXWHZwpTyrZNCmk5R6vPEupHDxHNXw7WRnDw+QH47oR+hBJbRYGr
         BQq0naXVTdmbNSuBcwfkVgdqp8S07aevJhQD5VmSgRiBXLh8Is+9Q84IKmzWUaPgNWih
         vAe+KuEHtsm8uRUhtU3xfbQMbnAw+at/wKG19boQwhKrWFcAaJSbhTiGxD6fCtfq70lM
         K8UpK/ALgAYHygv12IYex3nYcu52Dyt1/QPDWosBjZtl2vlL5PdGwwEaeMTMBKgenaZr
         UAMXithah1OcszNYE4s7OChtpvSzGl2GEGrWev1RLMKrS5EVBYKQWq0c/9Lr4zMlywEH
         jV+A==
X-Gm-Message-State: AOAM5317NWA+0TIGBTe7o/WaumsVNJ1JL2oDxb8I5aZHM7NlxLpBQxDE
        V+5gvOyEqOtUIyq07gWNuSsltCIyxyn1zPMpuMd+4g==
X-Google-Smtp-Source: ABdhPJwb8GQepycTGtRZVWRW/lbjOjz53+1MJjH4bGCrQdaw9Iwp2WHacVzvngEPy1NIM59b1otMYQBEG/RUVQrwYNY=
X-Received: by 2002:a25:53c9:: with SMTP id h192mr21521085ybb.310.1627928732246;
 Mon, 02 Aug 2021 11:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <BYAPR20MB24886765F888A9705CBEB70789E39@BYAPR20MB2488.namprd20.prod.outlook.com>
 <162734809017.2368309.7901135942001140161@swboyd.mtv.corp.google.com>
 <2634451.ElGaqSPkdT@diego> <162758560739.714452.5782743329332725952@swboyd.mtv.corp.google.com>
In-Reply-To: <162758560739.714452.5782743329332725952@swboyd.mtv.corp.google.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Mon, 2 Aug 2021 11:24:56 -0700
Message-ID: <CAGETcx8YYrkCV0UObtOqHUnS29Q-raC54KUh14wqyBDMJ4e46g@mail.gmail.com>
Subject: Re: [PATCH] clk: rk3308: make ddrphy4x clock critical
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Yunhao Tian <t123yh@outlook.com>, t123yh.xyz@gmail.com,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jul 29, 2021 at 12:06 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Heiko St=C3=BCbner (2021-07-28 02:53:54)
> > Am Dienstag, 27. Juli 2021, 03:08:10 CEST schrieb Stephen Boyd:
> > > Quoting Yunhao Tian (2021-07-21 05:48:16)
> > > > Currently, no driver support for DDR memory controller (DMC) is pre=
sent,
> > > > as a result, no driver is explicitly consuming the ddrphy clock. Th=
is means
> > > > that VPLL1 (parent of ddr clock) will be shutdown if we enable
> > > > and then disable any child clock of VPLL1 (e.g. SCLK_I2S0_8CH_TX).
> > > > If VPLL1 is disabled, the whole system will freeze, because the DDR
> > > > controller will lose its clock. So, it's necessary to prevent VPLL1=
 from
> > > > shutting down, by marking the ddrphy4x CLK_IS_CRITICAL.
> > > >
> > > > This bug was discovered when I was porting rockchip_i2s_tdm driver =
to
> > > > mainline kernel from Rockchip 4.4 kernel. I guess that other Rockch=
ip
> > > > SoCs without DMC driver may need the same patch. If this applies to
> > > > other devices, please let us know.
> > > >
> > > > Signed-off-by: Yunhao Tian <t123yh@outlook.com>
> > > > ---
> > > >  drivers/clk/rockchip/clk-rk3308.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/clk/rockchip/clk-rk3308.c b/drivers/clk/rockch=
ip/clk-rk3308.c
> > > > index 2c3bd0c749f2..6be077166330 100644
> > > > --- a/drivers/clk/rockchip/clk-rk3308.c
> > > > +++ b/drivers/clk/rockchip/clk-rk3308.c
> > > > @@ -564,7 +564,7 @@ static struct rockchip_clk_branch rk3308_clk_br=
anches[] __initdata =3D {
> > > >         COMPOSITE(SCLK_DDRCLK, "clk_ddrphy4x_src", mux_dpll_vpll0_v=
pll1_p, CLK_IGNORE_UNUSED,
> > > >                         RK3308_CLKSEL_CON(1), 6, 2, MFLAGS, 0, 3, D=
FLAGS,
> > > >                         RK3308_CLKGATE_CON(0), 10, GFLAGS),
> > > > -       GATE(0, "clk_ddrphy4x", "clk_ddrphy4x_src", CLK_IGNORE_UNUS=
ED,
> > > > +       GATE(0, "clk_ddrphy4x", "clk_ddrphy4x_src", CLK_IGNORE_UNUS=
ED | CLK_IS_CRITICAL,
> > >
> > > Is it not enabled by default?
> >
> > All gates are enabled by default, but this gate shares a common parent
> > tree down to a pll, so if another leaf-user is disabling their part, th=
is
> > untracked clock would get disabled as well.
>
> Right, this problem is cropping up in different places for various
> drivers.
>
> >
> > On that note, I remember a sort of CLK_HANDOFF was planned way back
> > in the past, meaning clock is critical until a driver picks it up, afte=
r this the
> > driver is responsible for it. Did that get any momentum?
> >
>
> Last I saw Saravana sent a patch to sort of connect CLK_HANDOFF to
> device driver sync_state() callback. I think we need to at least stash
> away that a clk is enabled at boot and then figure out how to tie in
> sync_state and/or something else.

Yeah, my clk_sync_state() series should do that. I'll get back on that
patch this week or next.

Yunhao,

Is there at least some DT device that consumes the DDR phy clock? Can
you point me to the DT for this board (not the SoC) so I can take a
look at it later?

Thanks,
Saravana
