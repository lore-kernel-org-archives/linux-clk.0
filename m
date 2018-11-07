Return-Path: <SRS0=FPSA=NS=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF70C0044C
	for <linux-clk@archiver.kernel.org>; Wed,  7 Nov 2018 17:36:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 362D920862
	for <linux-clk@archiver.kernel.org>; Wed,  7 Nov 2018 17:36:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="ZKMcN8J2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 362D920862
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731340AbeKHDHk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Nov 2018 22:07:40 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40356 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731318AbeKHDHj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Nov 2018 22:07:39 -0500
Received: by mail-lj1-f195.google.com with SMTP id t22-v6so15483979lji.7
        for <linux-clk@vger.kernel.org>; Wed, 07 Nov 2018 09:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=94VwVroRz8OsQAeOpOtXrrHyWiA98PnE8gQ8bs66pwo=;
        b=ZKMcN8J2/l2cZ3FGpvfYIsp32gIvXAYX7ncuk3iTSj8Lc3Lxb0YpTqeW6elvM+evQ0
         FaR/OQlDRRlCVAIgB2xWBYamib1gMatV5SYlzScvZbEJiWaagvI3x3yQOcWizM3Mvfny
         sfcofHDnQqsrcMiLs10+W9+smK8rU+SM1nHPQcJjuv7p4trqF810BxmlX8fAXAd8riH+
         we5MTiQC7hyFfSik7plzvnAjcQfrh5wxwelBuPELyOPZhSROsN2oRKSUnjaiE1t+Ummj
         31XyDRSBQ/jF5VtKNlqIAX/T62rjLu1vIgICVTDSb+zc2Al5mPtLFHSrows1+yt8dcrX
         4wcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=94VwVroRz8OsQAeOpOtXrrHyWiA98PnE8gQ8bs66pwo=;
        b=Jt8Z7e/mArBQ34t6QWsf86apVZDHKPnWqlZzUp/kI52wDmUR7n08NJn6UQTj6bRMlP
         6u47sCmOEjyPnPzczS83MWMbPfRgO0s+zMQLz/Nfd94mhslZmkZV1MGVd9BcTRHN/AdW
         ABIMWKHn9Ssh4BtvZjlMHzs1F7UUTT0SUankfNwxihvE+IVx2mMd5ZRPjYsSq6RxDAcZ
         OzgfRCG5OrsTsHIzYOncukZ0hKpREhbTUGtMegklpyd8YFU+lSZ9vOgFKAn03/9djzqb
         tp+qeAsUJP7WYKZPyjCfONmb5/GpBxZ02+1HvoHaVabUGM+DLFI0q7OJsgN1xMKHqN4W
         rJrQ==
X-Gm-Message-State: AGRZ1gKTmuUS9uAbX/ienNdJszXPixoq8V/576z9pTFseRuz+00vkEH7
        x+KWowvIyfd5NSTGw9KVpGe2WeyuhmEMJcRXTEB/og==
X-Google-Smtp-Source: AJdET5dFIb2fmt9q2LrEYHJOS7KwJc2OyQYHMrRN/YjSk+1FbyKoKnrqmNKJrhgz2SKSKjAZer9XbVJqSYDf73eOlqo=
X-Received: by 2002:a2e:90ca:: with SMTP id o10-v6mr720453ljg.134.1541612174263;
 Wed, 07 Nov 2018 09:36:14 -0800 (PST)
MIME-Version: 1.0
References: <CAOesGMgVPsK9YsV2nGoBptWwtHYv=3yMytLx2_tF_ujS5c5p3Q@mail.gmail.com>
 <3189677.9XQFCzzJyO@avalon>
In-Reply-To: <3189677.9XQFCzzJyO@avalon>
From:   Olof Johansson <olof@lixom.net>
Date:   Wed, 7 Nov 2018 09:36:02 -0800
Message-ID: <CAOesGMi84d+ZSK49Cf26Wvy5mU8D8VkUK1zvfs-a=eSYD+4osw@mail.gmail.com>
Subject: Re: [Ksummit-discuss] [TECH TOPIC] SoC maintainer group
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     ksummit <ksummit-discuss@lists.linuxfoundation.org>,
        Russell King <rmk@armlinux.org.uk>,
        Kevin Hilman <khilman@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Palmer Dabbelt <palmer@sifive.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Nov 6, 2018 at 3:32 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Olof,
>
> On Wednesday, 7 November 2018 00:16:27 EET Olof Johansson wrote:
> > Hi KS organizers (and others),
> >
> > This is a late topic proposal, hopefully there is still time on the age=
nda.
> >
> > We=E2=80=99ve recently been discussing some maintainer model changes as
> > described below, and would like a slot to discuss the idea and solicit
> > feedback/comments from the others there.
> >
> >
> > This started with Arnd and I finally being in one place at the same
> > time, and talking about how we want to evolve arm-soc maintainership
> > moving forward. We've been independently thinking of ways to expand
> > the group and making it more self-service for everybody, but there's a
> > bunch of tooling needed to make it run smoothly beyond the smaller
> > group we have now.
> >
> > In the end, we ended up looking at it from a slightly different angle:
> > Right now, when contributors show up with new platform support, the
> > first hill they need to climb is figuring out how they need to carve
> > up their platform among all the various maintainers, how to make sure
> > they're all handshaking on keeping things stable, and get code
> > submitted. It's awkward, not well documented and one of the biggest
> > overheads we have on our side as well.
> >
> > When we started talking to other maintainers, we're also realizing
> > that we are currently duplicating a lot of work. In particular, we
> > often all get cc:d on patch series, so we all need to read and filter,
> > and assume that other maintainers spot the right patches, etc.
> >
> > We have discussed a few different options, and it seems like pooling
> > more of the contribution flow to a group of co-maintainers is a useful
> > approach. Initially, we're considering the arm-soc platforms, clock
> > drivers and pinctrl drivers, which all tend to be affected by new
> > platform contributions in this way, and often end up cross-cc:d on
> > everything. Additionally, the flow for successfully merging a new
> > platform or SoC needs to be documented and advertised. This is true
> > whether or not we change the way that maintainers coordinate amongst
> > themselves, or whether or not we change the current workflow used by
> > platform contributors today.
> >
> > So, we're planning to change things up a bit. We're starting a new
> > group that pools current arm-soc, clk and pinctrl drivers and
> > maintainers into one funnel. We'll set up a new mail alias for the
> > maintainer group, and one shared patchwork to collect contributions.
> > We still expect developers to use existing mailing lists, and we still
> > expect for example ARM platform maintainers to keep their workflow of
> > collecting patches for their platform like they do today. Down the
> > road it might make sense to incorporate other driver subsystems as
> > well.
> >
> > Beyond this, we're going to keep a close eye on the drm-misc tree,
> > which is exploring a move to gitlab (and working with gitlab on adding
> > the features they need to move over). If they get a broad maintainer
> > model working well in that environment it could be something we reuse
> > for ourselves too.
>
> gitlab is an umbrella term that covers many features proposed by the prod=
uct.
> Are there particular features that you already think you would be interes=
ted
> in, or features that you already know you wouldn't want to use ?

To be honest, I haven't looked closely yet and I'm looking forward to
learning about what the DRM plans are during LPC.


-Olof
