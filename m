Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F98C07E9D
	for <linux-clk@archiver.kernel.org>; Thu, 29 Sep 2022 04:37:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234515AbiI2EhN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Sep 2022 00:37:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234607AbiI2EhM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Sep 2022 00:37:12 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F8D61280FA
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 21:37:10 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id rk17so364215ejb.1
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 21:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=hCIr6ggWP7k5r3nMA/IQLk+9jq0v0zrFpIbWh0QT22o=;
        b=TR9E4YYcWtROuWGCseBJ1Nn/qTofn8Gd6wa7GsL307BVMqtJP7MrZqakH3Ev6A1VuQ
         6B8V4rsybpf7FKF9lu2f1fSGvfkjsIQJTRydxE4CA1gkhLx5AD+5w+GfffJ36QKRxDGU
         lETxu5SOf2snTa+ovV89JdmA+sHU4titFehnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=hCIr6ggWP7k5r3nMA/IQLk+9jq0v0zrFpIbWh0QT22o=;
        b=rOWsEpSQ3hKxR0wSCmvbebN0R44K8sl5h01ei2DeFy5H3vJGSQd/nQdNDk0x4XKaYf
         sSTYy/9FacI5kxfA0h3t1k/3kbZae5atcdFwI+z22Hg4aKuFA90Lvq+n7SWdn7YJ5Xnb
         +r2pnpq96rKwiXfY7oQxuohFuENVlB84N+EvZtEk8hVarjxWcSnmeEq+7XmOvjiFYYYV
         RBEKjCIP+HT5FCThrQ5udwhE16PB4PBOMtwECIemQefRFmgIb/lRsRB/59kM1FlwFL3L
         HDuyZB/CWAVZmIfl+dmNRGVhIodEoeH2gq1LCKED1xe1cYAA7lda8OSqpn8MUVjLauA3
         rpNg==
X-Gm-Message-State: ACrzQf02QgiF6OjltHOKjx9AH2zIEYcT9M6vHxZpUiu40Qlo17iy8LNa
        JOKpO/IBYC6eKTwLhAVZXw0p2abTMeJvIDCF+4VADA==
X-Google-Smtp-Source: AMsMyM42xVrO9Sdosyvdwfr6CiAqqADoCZ5aeLBLftNjRzyuLAYvUGMUJADYo2U+hcbm0qWMjh4oR+ebBSwFXSkk/9k=
X-Received: by 2002:a17:906:8455:b0:773:c45b:d970 with SMTP id
 e21-20020a170906845500b00773c45bd970mr1070628ejy.46.1664426229162; Wed, 28
 Sep 2022 21:37:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220926102523.2367530-1-wenst@chromium.org>
In-Reply-To: <20220926102523.2367530-1-wenst@chromium.org>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 29 Sep 2022 12:36:57 +0800
Message-ID: <CAGXv+5GC28RHAj=PQyUFyZGwEOuoa3TnT3RxUEmP3SMvYCVEuw@mail.gmail.com>
Subject: Re: [PATCH 0/6] clk: mediatek: More cleanups
To:     Stephen Boyd <sboyd@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Miles Chen <miles.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Sep 26, 2022 at 6:25 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> Here's some more cleanups for the MedaiTek clk drivers.
>
> Patches 1 and 2 fixes and cleans up some parts that were missed in the
> previous clk_hw conversion series.
>
> Patch 3 drops the duplicate registration of the top_early_divs clks for
> MT8192. Currently this only contains a fixed divider.
>
> Patch 4 prevents having a duplicate OF clk provider for the topckgen
> controller, but removing the previously registered instance.
>
> Patch 5 deduplicates the parent clock lists for MT8192.
>
> Patch 6 adds proper error handling to the clock probe functions for
> MT8192.
>
>
> Please have a look.
>
>
> Thanks
> ChenYu
>
>
> Chen-Yu Tsai (6):
>   clk: mediatek: fix unregister function in mtk_clk_register_dividers
>     cleanup
>   clk: mediatek: Migrate remaining clk_unregister_*() to
>     clk_hw_unregister_*()
>   clk: mediatek: mt8192: Do not re-register top_early_divs in probe
>     function
>   clk: mediatek: mt8192: Avoid duplicate OF clk provider for topckgen
>   clk: mediatek: mt8192: deduplicate parent clock lists
>   clk: mediatek: mt8192: Implement error handling in probe functions

I've queued patches 1, 2 and 5 up here [1] and will send a pull request
to the clock maintainer later this week.

The remaining three are related and still under discussion.


ChenYu

[1] https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git/log/?h=clk-mtk-for-6.1
