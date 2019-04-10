Return-Path: <SRS0=uxtc=SM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE7EDC10F11
	for <linux-clk@archiver.kernel.org>; Wed, 10 Apr 2019 23:37:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 94AC420645
	for <linux-clk@archiver.kernel.org>; Wed, 10 Apr 2019 23:37:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gKV9edpN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbfDJXhu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Apr 2019 19:37:50 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:40788 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726106AbfDJXhu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 Apr 2019 19:37:50 -0400
Received: by mail-ua1-f66.google.com with SMTP id b8so1395923uaq.7
        for <linux-clk@vger.kernel.org>; Wed, 10 Apr 2019 16:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l4kTmN/4EpCXfKlktXPxmYZoD4wd22ktYND8WmTd2+M=;
        b=gKV9edpN/3Rw9mn6MFS/s6E4udpK93gp03sLFedV/wZNOKQxb42wJOZqBKCZ8vRjqY
         vMiBhVzlu8wHSBOQrJnqE3XtsPUyrrLNApauYX3NhvOYa+3wKBNqM2U5SgWoyEdTxAt0
         NPWJAfgDE3G/ep8JyqazMOiSABgZ8caFTvIUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l4kTmN/4EpCXfKlktXPxmYZoD4wd22ktYND8WmTd2+M=;
        b=EKl4W50ra1053oDCPPqEB7Tg/kZKxQm1DW8quzhUp3wBjvOCSYojzh/oBIXgBlYSAq
         KsLzx0O9G32VOrWWkMf+dnRxSwCEX2LrOgjSQjbOS8vaphBoK0+f4/GCbPoWRv7xmOiB
         8xRjR+Xss0MeO7LHITPVO8IOS/+rN7+VgWVg7uhoDJwKZLnBpet7ps4pvo6+Ee8+hzAa
         T5Xfbv7CzEquliW8Deet71ssToaGcdkgmuU7lRutvZoqkMEC+TJAxy3IO9aqbFRpeNTy
         qPfS4imk0DYakCGb1+DCGzBrRTDOVgmoeA58M5PD/yde7UOws39IfeZ7i/feFXz715zt
         watQ==
X-Gm-Message-State: APjAAAUwGpTAuzEg27Jz4VeNc48EbwG8USN5lHih297Gh/eWkIHFjFR2
        +TI/H5Rb9MP7em+sRdSDYeTTi4Ku9eg=
X-Google-Smtp-Source: APXvYqwIlql6QbrELOqDpnL3hJy4syLM/zB8u4ieHTAm+zpwdB8E+gprfE9QdrCaGPxrhB94Pp3IWg==
X-Received: by 2002:a9f:2d99:: with SMTP id v25mr21276344uaj.25.1554939468306;
        Wed, 10 Apr 2019 16:37:48 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 110sm26441885uaq.7.2019.04.10.16.37.46
        for <linux-clk@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Apr 2019 16:37:46 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id a190so2433121vsd.0
        for <linux-clk@vger.kernel.org>; Wed, 10 Apr 2019 16:37:46 -0700 (PDT)
X-Received: by 2002:a67:7f44:: with SMTP id a65mr6232823vsd.179.1554939465887;
 Wed, 10 Apr 2019 16:37:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190329215455.159717-1-dianders@chromium.org>
 <CAD=FV=V22Z2ziNZs5syzd1wpT4AwpXtTHP52wKvN5drgf06Z8Q@mail.gmail.com> <AM3PR03MB09665B2755982816D2FC37E4AC2E0@AM3PR03MB0966.eurprd03.prod.outlook.com>
In-Reply-To: <AM3PR03MB09665B2755982816D2FC37E4AC2E0@AM3PR03MB0966.eurprd03.prod.outlook.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 10 Apr 2019 16:37:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W=gPgYNrVAXYa=9bz1e5+KBD1Xu7UK-pPkH25esFiW9A@mail.gmail.com>
Message-ID: <CAD=FV=W=gPgYNrVAXYa=9bz1e5+KBD1Xu7UK-pPkH25esFiW9A@mail.gmail.com>
Subject: Re: [PATCH] clk: rockchip: Fix video codec clocks on rk3288
To:     Jonas Karlman <jonas@kwiboo.se>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Elaine Zhang <zhangqing@rock-chips.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Ziyuan Xu <xzy.xu@rock-chips.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Ryan Case <ryandcase@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Wed, Apr 10, 2019 at 11:38 AM Jonas Karlman <jonas@kwiboo.se> wrote:
>
> On 2019-04-10 17:45, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, Mar 29, 2019 at 2:55 PM Douglas Anderson <dianders@chromium.org> wrote:
> >> It appears that there is a typo in the rk3288 TRM.  For
> >> GRF_SOC_CON0[7] it says that 0 means "vepu" and 1 means "vdpu".  It's
> >> the other way around.
> >>
> >> How do I know?  Here's my evidence:
> >>
> >> 1. Prior to commit 4d3e84f99628 ("clk: rockchip: describe aclk_vcodec
> >>    using the new muxgrf type on rk3288") we always pretended that we
> >>    were using "aclk_vdpu" and the comment in the code said that this
> >>    matched the default setting in the system.  In fact the default
> >>    setting is 0 according to the TRM and according to reading memory
> >>    at bootup.  In addition rk3288-based Chromebooks ran like this and
> >>    the video codecs worked.
> >> 2. With the existing clock code if you boot up and try to enable the
> >>    new VIDEO_ROCKCHIP_VPU as a module (and without "clk_ignore_unused"
> >>    on the command line), you get errors like "failed to get ack on
> >>    domain 'pd_video', val=0x80208".  After flipping vepu/vdpu things
> >>    init OK.
> >> 3. If I export and add both the vepu and vdpu to the list of clocks
> >>    for RK3288_PD_VIDEO I can get past the power domain errors, but now
> >>    I freeze when the vpu_mmu gets initted.
> >> 4. If I just mark the "vdpu" as IGNORE_UNUSED then everything boots up
> >>    and probes OK showing that somehow the "vdpu" was important to keep
> >>    enabled.  This is because we were actually using it as a parent.
> >> 5. After this change I can hack "aclk_vcodec_pre" to parent from
> >>    "aclk_vepu" using assigned-clocks and the video codec still probes
> >>    OK.
> >>
> >> Fixes: 4d3e84f99628 ("clk: rockchip: describe aclk_vcodec using the new muxgrf type on rk3288")
> >> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >> ---
> >> I currently have no way to test the JPEG mem2mem driver, so hopefully
> >> others can test this and make sure it's happy for them.  I'm just
> >> happy not to get strange errors at boot anymore.
> >>
> >>  drivers/clk/rockchip/clk-rk3288.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > Any thoughts about this patch?  I'm 99.9% certain it's correct and
> > it'd be nice to get it landed.  Heiko: I assume you're still
> > collecting Rockchip clock patches and would be the one to apply it and
> > (at some point) send a pull request to the clock tree?
> >
> > -Doug
>
> This clk fix is needed to make MPEG-2 decoding work on my RK3288 Tinker Board using the
> rockchip vpu patchset and a patch to add RK3288 specific MPEG-2 code [1].
>
> Also note that the same change was suggested in a previous patch [2] from by ayaka.
>
> If possible please also add the CLK_SET_RATE_PARENT change from [3] in a possible v2,
> that fixes assigning the aclk_vcodec clk to 400Mhz in the rockchip vpu driver.
>
> [1] https://github.com/Kwiboo/linux-rockchip/commit/1f78093e05c7360515a185f48b7c5cb8ba1e3e15
> [2] https://patchwork.kernel.org/patch/9725553/
> [3] https://github.com/Kwiboo/linux-rockchip/commit/9216da3f1521a0be5889235abe7fa093a4894160

Thanks for the pointers!  Now I'm 99.9999% certain that my patch is
correct instead of just 99.9%.  ;-)

IMO the CLK_SET_RATE_PARENT should probably be a separate patch but it
does seem like we need it.  ...and actually the patch adding it should
have a Fixes tag of the same commit.  Prior to that commit the parent
of "aclk_vcodec" was "aclk_vdpu".  As a gate clock it would
automatically have CLK_SET_RATE_PARENT so you could easily set the
rate.  ...and it looks as if the downstream video codec driver in
Chrome OS relies on this too.

I'm happy to add that in a v2 if Heiko is happy with it.

-Doug
