Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F74FA373D
	for <linux-clk@archiver.kernel.org>; Mon, 24 Oct 2022 23:54:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbiJXXyL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Oct 2022 19:54:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbiJXXxo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Oct 2022 19:53:44 -0400
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 190432FFA76
        for <linux-clk@vger.kernel.org>; Mon, 24 Oct 2022 15:11:04 -0700 (PDT)
Received: by mail-vs1-xe2b.google.com with SMTP id 189so7971411vsi.9
        for <linux-clk@vger.kernel.org>; Mon, 24 Oct 2022 15:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=stUhgmxHOajI9uqfx7NpPsmu7P60GiPKRF/7gBID+dg=;
        b=bEFddOpdoZI+TExGmAdpUfmJNoo8dPBXr0GJGSgul5kqwh++/sgfJQl8+oGEvFD2ne
         kpz6K8eWDmAVOCEWOuk3k3vaLpcYn1giG0Y4laOx4hW3kM36CeJfyuYRXRoygTCeOInv
         vgzrStxX8eomyhmjrg03uh7HfE8n1gEyEMRiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=stUhgmxHOajI9uqfx7NpPsmu7P60GiPKRF/7gBID+dg=;
        b=LrP8GP89h3LQ5sH6DAWpSPGdduv4gK3tc/f8ERPODPQ2/TJZ7zULStBEJ+d3iozyQg
         yrZzj90PsVy3fMOdEvwFQ22Wm01CMDF0kPXBImo6pNS/Guz8TEnnUhFjR5jH75As/8IX
         Bqiy1/mXwtaSQB1CG74KtfYub505HNM+G/3RouHDXiul+voWoq17XH/2j++lf74yvmr0
         WvLzzwbuvAz3FPtQ/ryrdxtd/PKRlkk/n/wgucenYPWpjfOgj5kOPrSAvT/zH20rnG45
         Ebl4TvvuIDJkjt/I1H4qOOLxDFkJm0L6DixZpdNyZxRko8shpRDLLD0AYGfuJg8a2X4G
         Mh3g==
X-Gm-Message-State: ACrzQf3HIqxppsehG52STrEBbgFGhbb5kVwAac57Nn/skT8MuZ//X/5b
        gTSUUPi+wT1Wtdz459R3f2kGa3jWHRiOBOkx40EVqA==
X-Google-Smtp-Source: AMsMyM4Efc9ufDsXBeEA5wir0gCDCtXUofm53iFeyXJEoyskf089urS75VK07NTr4nbtrLk6Bk5gGbtapSYnxvi7JQg=
X-Received: by 2002:a67:f106:0:b0:3aa:efc:8610 with SMTP id
 n6-20020a67f106000000b003aa0efc8610mr6032143vsk.65.1666649460086; Mon, 24 Oct
 2022 15:11:00 -0700 (PDT)
MIME-Version: 1.0
References: <20221024102307.33722-1-angelogioacchino.delregno@collabora.com> <20221024102307.33722-9-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221024102307.33722-9-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 24 Oct 2022 15:10:48 -0700
Message-ID: <CAGXv+5EG0TwE6pEyEb3sK3bU8DWzbtQqPgtWcudJ0KpbR3XrCg@mail.gmail.com>
Subject: Re: [PATCH 08/10] clk: mediatek: mt8195-topckgen: Drop flags for
 main/univpll fixed factors
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     sboyd@kernel.org, mturquette@baylibre.com, matthias.bgg@gmail.com,
        miles.chen@mediatek.com, nfraprado@collabora.com,
        rex-bc.chen@mediatek.com, chun-jie.chen@mediatek.com,
        jose.exposito89@gmail.com, yangyingliang@huawei.com,
        msp@baylibre.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Oct 24, 2022 at 3:23 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The main/univpll clocks are used as clock sources for multiple
> peripherals of different kind, some of which are critical (like AXIs);
> a rate change on any of these two will produce a rate change on many
> devices and that's likely to produce system instability if not done
> correctly: this is the reason why we have (a lot of) "fixed factor"
> main/univpll divider clocks, used by MUX clocks to provide different
> rates based on PLL output dividers.
>
> Following what was done on clk-mt8186-topckgen and also preventing the
> same GPU DVFS issue, drop CLK_SET_RATE_PARENT from the aforementioned
> clocks.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
