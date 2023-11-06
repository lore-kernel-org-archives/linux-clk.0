Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C155C4332F
	for <linux-clk@archiver.kernel.org>; Mon,  6 Nov 2023 08:58:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231338AbjKFI61 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Nov 2023 03:58:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231324AbjKFI60 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Nov 2023 03:58:26 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BDC2DB
        for <linux-clk@vger.kernel.org>; Mon,  6 Nov 2023 00:58:23 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50939d39d0fso5458712e87.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Nov 2023 00:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699261101; x=1699865901; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BhaNPZ5ALKGhgIwmnk7EA8sPdVUBa/gDuKElje8KGZk=;
        b=JLziYkhUrV+OEVBt7CaBG5mhiS1bY1jxhuk/7vLFvK6BiWMbrjo+n5SiB5vB9Bl15k
         W0AcA2Bi6Sdc5nqiOMYi1JqI3YOJcb21htw6fl3CsCv0fb2b7YTFhph12/2lSUjVvNTn
         eK96/0BbgTfAp8Z9YDuwBpe0X6IESmW2YVVwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699261101; x=1699865901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BhaNPZ5ALKGhgIwmnk7EA8sPdVUBa/gDuKElje8KGZk=;
        b=LyfnsvSwyoPy/4x1wpSSZr1Eo4jx6vjjCzYMH/aIYhQfd4UWVnPrTyW8YiXslqwNM6
         qMZz+TJPTAwRRy2CLUjSBtrX/3qGHiHlfj5sNLmLni2R127VP0PL5fRvzzehG7YDgERV
         3ZJ3HNMK+MTZ3SeoI3ueHYBj0VaWUdfmLgwxQlEjNRL659pM0d6wGXYBn9be80/x3M7A
         xyU15nrXZrLFUjZa3PNG59vSSNja3VkTs0mhQgfBC+P52GqLo+bmt0crq90f1AFbLep5
         OuBvTzYRMItEOjiCDECbY6Cmu+eFDbOBJ4MAJYhCP6qwfhkvt/129oCxj0ARPCEXg77K
         zBOg==
X-Gm-Message-State: AOJu0Yzyfg8I91cOJJtKkBMlv0WeOfovNxTAAiOw1HvCYxAKOkaK27E9
        Fm5QS/rmYCRyuWDl9foUM2Rny3knicaqcIl+uTrjdA==
X-Google-Smtp-Source: AGHT+IFkEVvTTQVRt+p9CHlozj8K2Y8M2HQgxYsSM7s84s2T7tu9AUMdVItvQURRV6ZxtQMxORH9/2hymWtojECviag=
X-Received: by 2002:a05:6512:3245:b0:509:49fc:c25c with SMTP id
 c5-20020a056512324500b0050949fcc25cmr8787028lfr.28.1699261101126; Mon, 06 Nov
 2023 00:58:21 -0800 (PST)
MIME-Version: 1.0
References: <20231103102533.69280-1-angelogioacchino.delregno@collabora.com> <20231103102533.69280-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231103102533.69280-4-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 6 Nov 2023 16:58:09 +0800
Message-ID: <CAGXv+5Hjj1=5Tii1-Pt01oVdPE2qCc8E0DVjzm7UeA_m5cMW=A@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] clk: mediatek: mt8188-topckgen: Refactor parents
 for top_dp/edp muxes
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     sboyd@kernel.org, mturquette@baylibre.com, matthias.bgg@gmail.com,
        msp@baylibre.com, amergnat@baylibre.com, yangyingliang@huawei.com,
        u.kleine-koenig@pengutronix.de, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Nov 3, 2023 at 6:25=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The top_dp and top_edp muxes can be both parented to either TVDPLL1
> or TVDPLL2, two identically specced PLLs for the specific purpose of
> giving out pixel clock: this becomes a problem when the MediaTek
> DisplayPort Interface (DPI) driver tries to set the pixel clock rate.
>
> In the usecase of two simultaneous outputs (using two controllers),
> it was seen that one of the displays would sometimes display garbled
> output (if any at all) and this was because:
>  - top_edp was set to TVDPLL1, outputting X GHz
>  - top_dp was set to TVDPLL2, outputting Y GHz
>    - mtk_dpi calls clk_set_rate(top_edp, Z GHz)
>  - top_dp is switched to TVDPLL1
>  - TVDPLL1 changes its rate, top_edp outputs the wrong rate.
>  - eDP display is garbled
>
> To solve this issue, remove all TVDPLL1 parents from `top_dp` and
> all TVDPLL2 parents from `top_edp`, plus, necessarily switch both
> clocks to use the new MUX_GATE_CLR_SET_UPD_INDEXED() macro to be
> able to use the right bit index for the new parents list.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
