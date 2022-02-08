Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29FFEC433EF
	for <linux-clk@archiver.kernel.org>; Tue,  8 Feb 2022 03:50:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344131AbiBHDuz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Feb 2022 22:50:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245562AbiBHDuz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Feb 2022 22:50:55 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D032C0401E5
        for <linux-clk@vger.kernel.org>; Mon,  7 Feb 2022 19:50:54 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id y129so9842792ybe.7
        for <linux-clk@vger.kernel.org>; Mon, 07 Feb 2022 19:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gGJv0AFVdfHzUa0yHqnma3btGQlzXWk1wSqSnWWw9Dk=;
        b=mJm2SUkp44PAeoyfQimwj06GljPK6ZlqDXI5AuQfTSigjQ8pV5o1ebijkpLq4WG/Gp
         IMzFiyeYTiPnV9e/8k+G2x9dJnUo4cXsJQZN66aXlRdWYuZXJrMfHg7zybpBtcAi6Xqn
         kL1U1hw+GGReC6MiCpqdsZ/N7V4pxLg3Zj3Tw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gGJv0AFVdfHzUa0yHqnma3btGQlzXWk1wSqSnWWw9Dk=;
        b=nowlgbt6z82bH6exDQQe10os+g5/t/OBhMD08bzapSrNremXlXUdC6FsQxAahGu58Q
         mK8zmGUlKOSOqJnvAm8tXDGyVLmN7MMSW+Xg1mkjnM34u46C7/24d1Lyyk1SKcDwdx89
         uTtQ3LYopkNZbConw/R2jofqxoKg4rFUYBde8QwizAzKCZf650z1wBXXZlrKdv2I+RCS
         QssTOV1PIA75SISvmTA13RG1PVZ9v7SSgjgyswqHMdSTJ8Tqgvgv45RnRtsWnzFcRqj2
         24cJbTrX7BwI2Ram++gAzBU4p6lRUmpTD2j2YCktM8CjhUDxX8KkVWMzN3F3G63goIPv
         HG/Q==
X-Gm-Message-State: AOAM5326RkQkDvhHYixUFNAHWgCADsusrD0AIVCyeHpRGiQTVD97CdEi
        w5vsrKoUrN/W/0eeyo8tZ+jn7ozUfOgrTRacePUx2A==
X-Google-Smtp-Source: ABdhPJzBnKRYSQxz0sUuAXLlIdIIDiufeVnpjx8TXskOYyz1WTj3X8uhPzwU+v2jw3moTuLJEUn06yrPSPGxjYtAf04=
X-Received: by 2002:a81:1b4e:: with SMTP id b75mr2986110ywb.295.1644292253418;
 Mon, 07 Feb 2022 19:50:53 -0800 (PST)
MIME-Version: 1.0
References: <20220202134834.690675-1-wenst@chromium.org> <20220202134834.690675-16-wenst@chromium.org>
 <752d5d00-4e05-1bd6-564f-3bce21a35713@collabora.com>
In-Reply-To: <752d5d00-4e05-1bd6-564f-3bce21a35713@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 8 Feb 2022 11:50:42 +0800
Message-ID: <CAGXv+5HSLh0OgJc=EU=wvB4DaOMDLjsgJ6qnHY423d1L5+DixQ@mail.gmail.com>
Subject: Re: [PATCH v2 15/31] clk: mediatek: Implement mtk_clk_unregister_fixed_clks()
 API
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Thu, Feb 3, 2022 at 5:47 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 02/02/22 14:48, Chen-Yu Tsai ha scritto:
> > mtk_clk_register_fixed_clks(), as the name suggests, is used to register
> > a given list of fixed rate clks. However it is lacking a counterpart
> > unregister API.
> >
> > Implement said unregister API so that the various clock platform drivers
> > can utilize it to do proper unregistration, cleanup and removal.
> >
> > In the header file, the register function's declaration is also
> > reformatted to fit code style guidelines.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > Reviewed-by: Miles Chen <miles.chen@mediatek.com>
>
> Hello Chen-Yu,
>
> I like this entire series, but I had to manually apply this patch (and some of
> the other ones)...

This was based on linux-next, which already has a couple clk patches queued
up.

> Especially for the ones that will be touching MT8195 clock drivers, can you
> please rebase over series [1] by Chun-Jie?

I think this series supersedes the first patch in that series? As for the
other two, I think the discussion about the bindings is ongoing, which
might affect the third patch as well?

ChenYu

> [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=603955
>
> Thanks,
> Angelo
>
