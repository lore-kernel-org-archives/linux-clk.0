Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F982C04A95
	for <linux-clk@archiver.kernel.org>; Wed, 28 Sep 2022 07:52:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233691AbiI1HwD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 03:52:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233524AbiI1Hvf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 03:51:35 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19CADFF3EC
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 00:50:20 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id z13so16100500edb.13
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 00:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=QiNIg/zYZ38dNte35yIrwLt22pv5Z8LWSBq+qCcfUtU=;
        b=NtzNSjvY4vyAUbLC8Ii0LP3f102njHedYSBGeDzF/hkB810Z7nZG7cmefrAHtpFxhe
         Zp9te2hkWiDhTDlHfjC2QXAsRum0CWIfAidozvY7YrY5zd9bMeLp3BBUkbc21Pm4fwYD
         bKKKOWtXTMb7XcHcBJO0GQJ2gYygtC4R68NE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=QiNIg/zYZ38dNte35yIrwLt22pv5Z8LWSBq+qCcfUtU=;
        b=E4F8GZAYlxep52oZIDnE9w3e2qG8FfZue+of2kc6mZw0YquII4xtyPwI+gkyJkBwj0
         1tcUkc+0AgPGSGnW9X5328aIXNRzCJ63jGc6TYM/b4wif9lfva/qjzsbI4TAS3bRebxS
         d6RqWdppngnL+4un8PG8fEeJL1Ev9bSR+R/ap6KhFR/D3PslQoOJfgdix2ALrj1nQE2I
         8GqnxyBGX7czs5RN7FJn95v8ZsDAwGoeVqpr5HwweGtyyN21c9LDFy887eSJldalK072
         etZch7bclnzop+5etOOOIMFJ0giVEhitcoczik/K5LU4badrMQ6n3zunbmKOQpNg2nMn
         9MoA==
X-Gm-Message-State: ACrzQf2h1aTheRCDlyilg0P1AJfXBR6P6lqgO49fsljH1JZA4TxLYwr7
        XHKBNECMK/IC4qhGgLDQNjoPU5pG/hJId5DituOYMA==
X-Google-Smtp-Source: AMsMyM6tdHhfxNIYTWCDrGO48E5DQKirqL+MmjRR/T8+Ih7026PNLiu8XfmJTZnxopqbAP43SYNBrqxzsdSO9XaLHp4=
X-Received: by 2002:a05:6402:1298:b0:457:c38a:2f10 with SMTP id
 w24-20020a056402129800b00457c38a2f10mr6387160edv.264.1664351418958; Wed, 28
 Sep 2022 00:50:18 -0700 (PDT)
MIME-Version: 1.0
References: <0a1618c4-b808-56bd-e89f-560b0423191d@collabora.com> <20220928015507.17206-1-miles.chen@mediatek.com>
In-Reply-To: <20220928015507.17206-1-miles.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Wed, 28 Sep 2022 15:50:07 +0800
Message-ID: <CAGXv+5FLwrE-kiZ_opjB3NA=e2_tDoNUs6hKE-o9m_DXcQmcGA@mail.gmail.com>
Subject: Re: [PATCH 3/6] clk: mediatek: mt8192: Do not re-register
 top_early_divs in probe function
To:     Miles Chen <miles.chen@mediatek.com>
Cc:     angelogioacchino.delregno@collabora.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        matthias.bgg@gmail.com, mturquette@baylibre.com, sboyd@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Sep 28, 2022 at 9:55 AM Miles Chen <miles.chen@mediatek.com> wrote:
>
> >> top_early_divs are registered in the CLK_OF_DECLARE_DRIVER() half of the
> >> topckgen clk driver. Don't try to register it again in the actual probe
> >> function. This gets rid of the "Trying to register duplicate clock ..."
> >> warning.
> >>
> >> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> >
> >Can't we simply remove the CLK_OF_DECLARE_DRIVER() and top_init_early entirely,
> >and transfer TOP_CSW_F26M_D2 to top_divs[] instead?
> >I get that systimer concern and we have something similar in MT8195, where the
> >TOP_CLK26M_D2 is registered "late".
>
> Another reason for this:
> Removing the CLK_OF_DECLARE_DRIVER() is good when we want to build our driver as
> kernel modules because it does not work with kernel modules.

I agree. But as I mentioned in my other reply, we need to fix the clock
user first before dropping that clock. And there's also the matter of
DT backward compatibility. So we need to do it incrementally.


ChenYu
