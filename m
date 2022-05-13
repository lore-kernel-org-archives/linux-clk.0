Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C5DAC433EF
	for <linux-clk@archiver.kernel.org>; Fri, 13 May 2022 03:24:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376707AbiEMDYr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 May 2022 23:24:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376589AbiEMDYn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 May 2022 23:24:43 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A9C528FE9F
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 20:24:41 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id a21so8467119edb.1
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 20:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dsUfqE+Asp1gNUkJYB0COTXKbzgCWxG3zxsJ5TkJHqU=;
        b=AFPRfp+LmQIDkPXMKr02tf0SObEzYQ9vjFxnrPp/pI7us+kD0uO22lsQPf+kEah98i
         JIrxehfF4eXsHUeE6eJHZZfStVWALFfBwoz0rniInbdBCZn834Cj3q+x4Rof2PES77Pz
         7Cn/vnjdT3dB0amG/DWEQYycMmqlaSRCcwO3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dsUfqE+Asp1gNUkJYB0COTXKbzgCWxG3zxsJ5TkJHqU=;
        b=YTfK9mXEmXttm/iAajggoPfIDBhIqDw2QlDm10bieKlKekjXCDFP5o/TvJ9dMRlYge
         Wss8ig96Ly19WGz+nNGOiEKgBDSiqn0zIb/Ghd03GtRkIBzOTNcoM9qvEh931m3roFKg
         UfmzwoPp1BccB4pJZ8P6gyozxJBAzqgButCl5GuTO7K5PdW/yoaS+KcBBGlUKg1M83+M
         vu3gkcqa2WtE12bAptPPWihRmoK5mrjpiZvbMijeOGfCldrPrjXpcZHbRpN3KG5jCZif
         lEmZ6d1imKB1K9iHavhbnPWK7BSQlauWUZfe5sMDRBItiLV7Pnr4p2rKujxRCRCZlG7T
         VuQg==
X-Gm-Message-State: AOAM531RFi1hQVcL5U+hUUErQmEZaoe7RUbJfTRf9x6lP9A1miKMzRI7
        cztykOjTszXGKuaTPjwH5t/WFflmVb0kpNKmLwJKCs3wv7U=
X-Google-Smtp-Source: ABdhPJyemQEQJ87mCvmVJk9JNFNVUXVKoddMhChDbRfTDCX1kw/pVm0m1xb0vuVB4JDhcv8QsmzONfgYGd3OsK04Qlw=
X-Received: by 2002:a05:6402:34d6:b0:427:cc9d:a130 with SMTP id
 w22-20020a05640234d600b00427cc9da130mr38203722edc.356.1652412279705; Thu, 12
 May 2022 20:24:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220510104804.544597-6-wenst@chromium.org> <20220512144924.4114-1-miles.chen@mediatek.com>
In-Reply-To: <20220512144924.4114-1-miles.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 13 May 2022 11:24:28 +0800
Message-ID: <CAGXv+5Fipb2Sjypv8ayRbHqNfiLxtaFXatM-vMRtX2UNFzZ-3g@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] clk: mediatek: mt27xx: Replace 'struct clk' with
 'struct clk_hw'
To:     Miles Chen <miles.chen@mediatek.com>
Cc:     angelogioacchino.delregno@collabora.com,
        chun-jie.chen@mediatek.com, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
        mturquette@baylibre.com, rex-bc.chen@mediatek.com, sboyd@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, May 12, 2022 at 10:49 PM Miles Chen <miles.chen@mediatek.com> wrote:
>
> >  static int clk_mt2701_bdp_probe(struct platform_device *pdev)
> >  {
> > -     struct clk_onecell_data *clk_data;
> > +     struct clk_hw_onecell_data *clk_data;
> >       int r;
> >       struct device_node *node = pdev->dev.of_node;
> >
> > @@ -110,7 +110,7 @@ static int clk_mt2701_bdp_probe(struct platform_device *pdev)
> >       mtk_clk_register_gates(node, bdp_clks, ARRAY_SIZE(bdp_clks),
> >                                               clk_data);
> >
> > -     r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> > +     r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
>
> We have of_clk_add_provider() and of_clk_add_hw_provider() the same time,
> so we can convert of_clk_add_provider to of_clk_add_hw_provider by 2xxx, 6xxx, 8xxx,
> without introducing build breaks.
>
> However, there is no mtk_alloc_hw_clk_data() for mtk_alloc_clk_data() in [1]. (03/11 in this series).
> For bisectability, patch 3~8 should be one patch, or we should have mtk_alloc_hw_clk_data()
> to help us?

As mentioned in the cover letter, the patch is split between the manually
edited parts and the coccinelle converted parts. This should help with
review, especially trying to identify which part of the coccinelle scripts
failed. The split also reduces the size of each patch so that they don't
get blocked.

I opted not to add additional APIs, as we would just be removing them at
the end, and that just results in even more code churn.


ChenYu

> [1] https://lore.kernel.org/lkml/20220510104804.544597-4-wenst@chromium.org/
