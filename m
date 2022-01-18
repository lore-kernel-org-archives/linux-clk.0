Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A095CC433F5
	for <linux-clk@archiver.kernel.org>; Tue, 18 Jan 2022 07:19:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244578AbiARHTy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Jan 2022 02:19:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbiARHTx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Jan 2022 02:19:53 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F6F7C061574
        for <linux-clk@vger.kernel.org>; Mon, 17 Jan 2022 23:19:53 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id o15so66896999lfo.11
        for <linux-clk@vger.kernel.org>; Mon, 17 Jan 2022 23:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QErlBlCXc+a1jsNeHhAG3QvKs8DThEwDqqGrTQJEmKM=;
        b=Cjars/H6j45gYLQkoPMsEllTMBG70C1LHa06SGInYCzXmoS9ijngx+PwY1cWhsnV69
         67f28Y8J8i3CWhggCTKFSIppeyJizkiI/eHKsQ1CvQl3hxZl7oDW9MzjhA1XilWmuXdd
         OuqkvduOPVXfWSYLn/rrthFHAgqKX1wsAIhy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QErlBlCXc+a1jsNeHhAG3QvKs8DThEwDqqGrTQJEmKM=;
        b=04XQaO6tgFcrpwukkBZyYruoNA+yP3msfEQ7djtTY85a4D4HemA00HOZ80HMZlrNZX
         TtrPftKAassKS0055XR0W2uGwZgz4cB/kIGEadF1ID5oAhEP5hK+kg8YQ84MHTyykTJD
         Yg5TIfJsrndgm/8mW20XmhUkAnALMnkzjwH7pXZCT8d2UmTeQgmrEQkj8/MjbDJyk5vM
         rNu5FIMQ/AfA5NKViBBt3juHL7TwchbDsQJqAElPAxUP5cwiSrXOckY+B6pEPg9YxunH
         sBkDo6GlXx2z+VXu+0Wyfg6D07an80CjPkIbuuridgAipdPfZoSc3+vu0enZ8TcTcZD4
         cMpw==
X-Gm-Message-State: AOAM532zxRJyUm/8Fwie8T4sA0xkU8PjwoLZQPqwo8N40PqwLGzWaTHa
        lxo0Te1RgTKwVpslcGIKbUF4VCu1gFygdS0rNZWK6Q==
X-Google-Smtp-Source: ABdhPJwXqSU3eM+obWywWHyddOWfpjQDK/HtlFI7KumYOm8sZXw1tbMN6njQNPqs6dDTjFNH7waDHttj7UPplBOmsPg=
X-Received: by 2002:a2e:b70a:: with SMTP id j10mr15365829ljo.376.1642490391444;
 Mon, 17 Jan 2022 23:19:51 -0800 (PST)
MIME-Version: 1.0
References: <20220110181330.3224-1-alyssa.rosenzweig@collabora.com>
 <eb6d11af-ff48-a366-d428-77bcaa250a8a@arm.com> <YeF/AYZ0DuKGwLLk@maud>
In-Reply-To: <YeF/AYZ0DuKGwLLk@maud>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 18 Jan 2022 15:19:40 +0800
Message-ID: <CAGXv+5H9BsNUdiY6zMH6THKKMvRdPypNtUEVviMHQEjgNGDk_A@mail.gmail.com>
Subject: Re: [PATCH] clk: mediatek: Disable ACP to fix 3D on MT8192
To:     Alyssa Rosenzweig <alyssa@collabora.com>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        linux-mediatek@lists.infradead.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Ikjoon Jang <ikjn@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Weiyi Lu <weiyi.lu@mediatek.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Nick Fan <Nick.Fan@mediatek.com>,
        Nicolas Boichat <drinkcat@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Fri, Jan 14, 2022 at 9:47 PM Alyssa Rosenzweig <alyssa@collabora.com> wrote:
>
> > > That links to an internal Google issue tracker which I assume has more
> > > information on the bug. I would appreciate if someone from Google or
> > > MediaTek could explain what this change actually does and why it's
> > > necessary on MT8192.
> > >
> > > At any rate, this register logically belongs to the MT8192 "infra" clock
> > > device, so it makes sense to set it there too. This avoids adding any
> > > platform-specific hacks to the 3D driver, either mainline (Panfrost) or
> > > legacy (kbase).
> >
> > Does this really have anything to do with clocks?
>
> I have no idea. MediaTek, Google, please explain.
>
> > In particular, "ACP" usually refers to the Accelerator Coherency Port
> > of a CPU cluster or DSU, and given the stated symptom of the issue
> > affected by it, my first guess would be that this bit might indeed
> > control routing of GPU traffic either to the ACP or the (presumably
> > non-coherent) main interconnect.
>
> I'd easily believe that.

As Robin guessed, "ACP" here does refer to the Accelerator Coherency Port.
And the bit in infracfg toggles whether ACP is used or not.

Explanation from MediaTek in verbatim:

-------------------------------------------------------------------------
The ACP path on MT8192 is just for experimental only.
We are not intended to enable ACP by design.

But due to an unexpected operation, it was accidently opened by default.
So we need a patch to disable the ACP for MT8192.
-------------------------------------------------------------------------


Regards
ChenYu

> > If that is the case, I think this would logically belong as a SoC-specific
> > quirk in panfrost, where we'd need to retrieve the syscon regmap for
> > ourselves (see around line 800 of drivers/iommu/mtk_iommu.c for a similar
> > example).
>
> Alright. Doing this in panfrost seems ugly but if that's the right place
> for it, that's the right place for it.
