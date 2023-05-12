Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAFE4C7EE22
	for <linux-clk@archiver.kernel.org>; Fri, 12 May 2023 00:46:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229654AbjELAq5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 May 2023 20:46:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239565AbjELAqz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 May 2023 20:46:55 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 771AB5BA9
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 17:46:53 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1ac65ab7432so456065ad.0
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 17:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683852413; x=1686444413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T10+eZtv1P+sem5SVFeRBdSEdRHCp+2rjVXG+IX1VZU=;
        b=gIHAFdeEe1rnnfoFGIl/9aXpKSDBFR9XdszD8qHiGqo2Kshj+VfKQZUvxSBhs23kVg
         wNyv9TldElL0ea4PE82pLgbczZDxEKtOZ1oaIfl4YT3q3Oq4drZpUuHBHWhbdeUTLWkx
         O5DzckwPk2Ta4BXxUomEHQnbHOrQBGYXcy6M9GyAUBEbi6YFDSu6lD5mUp4sNxBAzU2c
         Q4aiDwwHkV/SSEQZfpPJDZ8wdNXCjvyO+otiUiWU8a/gPuMT+524O7S0eCPfSQGblDj6
         CW3aoqYZNERuloOxNEfq/787dzrcMaDPh3+Bei/HEVtFVYrU1qiGXGXQoxBPhqOAUB6d
         O1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683852413; x=1686444413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T10+eZtv1P+sem5SVFeRBdSEdRHCp+2rjVXG+IX1VZU=;
        b=NVngMKFxqBJHrL2pLR7GROHC/lvgkgSfNTUws8yGtQNwSc5c0qRUD3L+/B8R7D23Dn
         AwOxzmI6QmS7Z6jOaT9uYkQqppQ23jylB86TMBOsukTacW36c3MTGsm6A3wSfVHdaCmZ
         PFYkc+pXy3liUQZpiRWdSkPzGrVsnjuS9o88j/huJswLCUZrsWfEuTbOYjO2Juu8cL+1
         O8BWxojTBKu54/Rh6QUE8FtZ49MMMMIxUQpW62sgYjhE+Rx9hDTOhhNDJPYvwsax7UED
         lK/+cW8v17fkhxeQH0Ds+I+FadT0sCvzXxSNh/mhEh7ZsAF4nJb8Az72PcVlH6AOrMwd
         q/Zg==
X-Gm-Message-State: AC+VfDxFksc1sMpbOvuMH8159duyVkYivPv9JAajNfWChtTALrEJuE5V
        MGEeCP0vdzIwSfnsI0gh2th7QOjT7+EZzNFSc47Adg==
X-Google-Smtp-Source: ACHHUZ6C90xQqot7Pn5snLVCYUAcVqM4UmA6opiCWqzhJzBIjgxyvC/9CH3mnuUtcd3S6uVRB9XzCnGt/fID8eiOS0Q=
X-Received: by 2002:a17:902:dacd:b0:1ac:8835:b890 with SMTP id
 q13-20020a170902dacd00b001ac8835b890mr117014plx.14.1683852412825; Thu, 11 May
 2023 17:46:52 -0700 (PDT)
MIME-Version: 1.0
References: <20221227204528.1899863-1-abel.vesa@linaro.org>
 <ebc257025ebd641e624ef506ea09c800.sboyd@kernel.org> <Y/OV3CF0ootyooDJ@linaro.org>
 <Y/OfjbxI1tHYJHNv@linaro.org> <CAGETcx_mD3pbAmT5FDZaVAsKb_2PAnrHL8B_6gSR=+a0O4kHfQ@mail.gmail.com>
 <Y/PALlrQpwPlum9M@linaro.org> <CAGETcx_TZN3=GKrEf5fy_tA=JnOfw7m-N=+hD=qhe_yRRpngPw@mail.gmail.com>
 <ZFzmaavGYy4isU7J@linaro.org>
In-Reply-To: <ZFzmaavGYy4isU7J@linaro.org>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 11 May 2023 17:46:16 -0700
Message-ID: <CAGETcx8_maXSCmQcU_UE499pwJRLY4E7yydWsxbU91==vgCoFw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] clk: Add generic sync_state callback for disabling
 unused clocks
To:     Abel Vesa <abel.vesa@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, mka@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, May 11, 2023 at 5:58=E2=80=AFAM Abel Vesa <abel.vesa@linaro.org> wr=
ote:
>
> On 23-02-21 11:58:24, Saravana Kannan wrote:
> > On Mon, Feb 20, 2023 at 10:47 AM Abel Vesa <abel.vesa@linaro.org> wrote=
:
> > >
> > > On 23-02-20 09:51:55, Saravana Kannan wrote:
> > > > On Mon, Feb 20, 2023 at 8:28 AM Abel Vesa <abel.vesa@linaro.org> wr=
ote:
> > > > >
> > > > > On 23-02-20 17:46:36, Abel Vesa wrote:
> > > > > > On 23-02-17 21:38:22, Stephen Boyd wrote:
> > > > > > > Quoting Abel Vesa (2022-12-27 12:45:27)
> > > > > > > > There are unused clocks that need to remain untouched by cl=
k_disable_unused,
> > > > > > > > and most likely could be disabled later on sync_state. So p=
rovide a generic
> > > > > > > > sync_state callback for the clock providers that register s=
uch clocks.
> > > > > > > > Then, use the same mechanism as clk_disable_unused from tha=
t generic
> > > > > > > > callback, but pass the device to make sure only the clocks =
belonging to
> > > > > > > > the current clock provider get disabled, if unused. Also, d=
uring the
> > > > > > > > default clk_disable_unused, if the driver that registered t=
he clock has
> > > > > > > > the generic clk_sync_state_disable_unused callback set for =
sync_state,
> > > > > > > > skip disabling its clocks.
> > > >
> > > > Hi Abel,
> > > >
> > > > We have the day off today, so I'll respond more later. Also, please=
 cc
> > > > me on all sync_state() related patches in the future.
> > > >
> > >
> > > Sure thing.
> > >
> > > > I haven't taken a close look at your series yet, but at a glance it
> > > > seems incomplete.
> > > >
> > > > Any reason you didn't just try to revive my series[1] or nudge me?
> > > > [1]- https://lore.kernel.org/lkml/20210407034456.516204-3-saravanak=
@google.com/
> > >
> > > This patchset is heavily reworked and much more simpler as it relies
> > > strictly on the sync_state being registered by the clock provider.
> >
> > It's simpler because it's not complete. It for sure doesn't handle
> > orphan-reparenting. It also doesn't make a lot of sense for only some
> > clock providers registering for sync_state(). If CC-A is feeding a
> > clock signal that's used as a root for clocks in CC-B, then what
> > happens if only CC-B implements sync_state() but CC-A doesn't. The
> > clocks from CC-B are still going to turn off when CC-A turns off its
> > PLL before CC-B registers.
>
> I gave your patchset a try and it breaks the uart for qcom platforms.
> That is because your patchset enables the clock on __clk_core_init and
> does not take into account the fact that 'boot enabled' clocks should be
> left untouched.

Those are probably just hacks when we didn't have sync_state(). But
sure, we can make sure existing drivers aren't broken if the flag is
set.

> This also means the orphan-reparenting enabling should
> be dropped as well.

No, maybe for boot enabled clocks, but not for all clocks in general.
You need this for sync_state() to work correctly for clocks left on at
boot but "boot enabled" isn't set.

> As for the second part, related to providers that might not have a
> registered sync_state(), your patchset sets the clock core generic
> one. This is also wrong because it doesn't take into account the fact
> that there might be providers that need to do their own stuff on
> sync_state() and should do that by registering their own implementation
> of it.

Right, in which case, they can set theirs or they get the default one.

> Therefore, I'll respin your patchset and use only the skipping of
> disabling the unused clocks, but I'll drop all the enable on init and orp=
han
> reparenting changes.

I think it'll result in a broken patch.

Sorry, I've been a bit busy with some other work and I haven't been
able to get to the clk_sync_state(). I'll try to rebase it soon and
send it out too.

-Saravana
