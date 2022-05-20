Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE965C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 20 May 2022 09:02:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242914AbiETJCi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 May 2022 05:02:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231254AbiETJCh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 May 2022 05:02:37 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B240A2075
        for <linux-clk@vger.kernel.org>; Fri, 20 May 2022 02:02:35 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id n10so14405656ejk.5
        for <linux-clk@vger.kernel.org>; Fri, 20 May 2022 02:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QKmUJF1anHWjOfPQl6wU+ROhTyxsa1Rv/nGtZdce0GY=;
        b=YUHoJjWZPLdgkjzdP8yFhlkh/fh/W2URfrIKZyDrXfA1Bbwfb3Vkeydu7AHkve/yZM
         K2TPKdjupVnpwoirGeGJtiabsY6Jrq3mcqM3sngTxRG62LujWuPRdYQACiNgcg6YuTK0
         eZ29ANkx/HQ/SyIt0dGah38NRE5SQbWbaD6Wg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QKmUJF1anHWjOfPQl6wU+ROhTyxsa1Rv/nGtZdce0GY=;
        b=ozEYpX8NhLvutuwmjWSuE4zFCMar1Oa7WTn/JHC9spm9waYg384CYx1DUKHeMPtORc
         TCUmkHhfpdzHBhXJol+uNYZvrk4e5uTmQqz5UZYm/x9v5gYLLccAluBnBr6mpc69zbFZ
         eOGj4zuVADNZWu/dC0IF7oeLGnDEjZlC8k9nEj+2siTei97Agnzz2WQd7sYIJOd3kwmB
         fBApo3Os2Xnj3lf+03doMyHt+QRoxQXKk5CPQSPGtV4MHpJ3kejviQhaedxw9FU2pOZW
         Wg6QHl3HNtuUEiY577iyAXSy4LV2cvlh+OuhxRnEjWIhwxkq6xGWI3AbxSBwjVu0VCPx
         Ja+w==
X-Gm-Message-State: AOAM530Owjtj2G+V8rdSnEhI04xfmk8s7j+bIeovK4clo6Jmd1zXsL3M
        JZnJ8O/rknNkGH+HxdHJLr07SNHXmJ7M1QBuqXRZ0jszexalIg==
X-Google-Smtp-Source: ABdhPJy95aZ+LA7wg0UbIA4EUwveKTOJRq5Oon3TiS6zl/rD/L/kL0uHtmwU2QuvyiPu4lRoZ8ho7gdJeThP+nOnQz8=
X-Received: by 2002:a17:906:a10e:b0:6f3:e70b:b572 with SMTP id
 t14-20020a170906a10e00b006f3e70bb572mr7549904ejy.546.1653037353979; Fri, 20
 May 2022 02:02:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220519134728.456643-1-y.oudjana@protonmail.com>
 <20220519134728.456643-4-y.oudjana@protonmail.com> <5b5f6656-8694-dc78-ef42-7ce301849aa4@collabora.com>
In-Reply-To: <5b5f6656-8694-dc78-ef42-7ce301849aa4@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 20 May 2022 17:02:22 +0800
Message-ID: <CAGXv+5HDA1QACKrzgWFFboCtK1pz7UeaE7XK4o_tMofy68EyVQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] clk: mediatek: reset: Return reset data pointer on register
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Yassine Oudjana <yassine.oudjana@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Miles Chen <miles.chen@mediatek.com>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
        Rex-BC Chen <rex-bc.chen@mediatek.com>,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, May 20, 2022 at 4:42 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 19/05/22 15:47, Yassine Oudjana ha scritto:
> > From: Yassine Oudjana <y.oudjana@protonmail.com>
> >
> > Return a struct mtk_clk_rst_data * when registering a reset
> > controller in preparation for adding an unregister helper
> > that will take it as an argument. Make the necessary changes
> > in drivers that do not currently discard the return value
> > of register functions.
> >
> > Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>
> Hello Yassine,
>
> Thanks for your efforts on helping to make the MediaTek clocks better - I agree
> (and I'm not the only one..) that there's a lot of work to do on this side.
>
> Though... I don't think that this is the right direction: you're right about
> properly unregistering (in patch 4/6) the reset controllers on rmmod/failure
> but I'm not sure that this kind of noise brings any benefit.

Since Rex is working on cleaning up the reset bits, maybe also coordinate
with him?

> Explaining:
> You definitely saw that there's a new register _with_dev, which uses devm ops
> and that's going to automatically cleanup in case of removal/failure.

I don't think they use devres at the moment. They should, but I haven't
gotten that far with my improvements. *wink*

> This is what we should do.
>
> Hence, my proposal is to drop patch 3/6, 4/6, 5/6 and (slowly, steadily) migrate
> all of the MediaTek clocks from CLK_OF_DECLARE() to platform drivers (which also
> means that we can eventually change them to tristate!), so that we slowly remove
> all users of all functions that are not "_with_dev", and that we finally remove
> all of these then-unused functions as well.

I agree with moving all the drivers off of CLK_OF_DECLARE() if possible.
There are definitely going to be a few ARM32 ones that can't be converted,
likely because they don't have the ARM arch timer, and need a clock
registered before the timers. Been there.

And there's a whole lot of work to be done for all the old drivers so that
they clean up after themselves.

My desire is to clean up the API (the naming and the parameters) so that
they more closely match up with the underlying CCF APIs they call. We can
then add devres variants (and of_ ones for the unfortunate platforms that
need them).

> Making sure that I don't get misunderstood:
>       I'm not implying that this huge migration work is on your shoulders!

Yeah. I'll likely take up quite a bit of it after all my currently planned
cleanup work is done. Unless of course someone beats me to it.

> P.S.: Chen-Yu, Miles: do you also agree? :-)

Yes.


Regards
ChenYu
