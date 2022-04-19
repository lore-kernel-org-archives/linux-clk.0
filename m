Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 754ADC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 19 Apr 2022 05:48:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233705AbiDSFvi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Apr 2022 01:51:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233588AbiDSFvh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Apr 2022 01:51:37 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A314727FD1
        for <linux-clk@vger.kernel.org>; Mon, 18 Apr 2022 22:48:56 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id j2so29262044ybu.0
        for <linux-clk@vger.kernel.org>; Mon, 18 Apr 2022 22:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nMJ889Dz0Epk94th8NM3EDZyolTDHRMoctXfRSXxfd0=;
        b=Vx5iJ070v0mFXMFcDOjxZ8J6MVVAEYWG73pK/G8UxwB8GDV0NpdBihuTD+dxl9Tx11
         jA4hOZA9+5GSkKipnXhENUttTKNoejkJjvBQoofj1XjfhYhkbX2W2dxAysPpLeTh3Atn
         61tUCHd474/nb+6j3Muh9EnQYmm9BcBwVWqFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nMJ889Dz0Epk94th8NM3EDZyolTDHRMoctXfRSXxfd0=;
        b=fqYR0TlFWB9505sApwqcNfZapimqf+KlvqG1jokeGckYKPhCFUtSo9ZCIxrCXMsUkS
         /edfRUN8O58YaC+hsZ+4r7rGZB6g/UPm2qGk7iR5NKRmPx05VLc3CBOw3n19smwqdWnO
         9h8Fjy4L5OrHRHHJqHgRan12DBYpGIl+ZDRGzh5mJo1mLTE6pA0efSMBFUqL1mM8po2F
         j33g/mG6YkuB8QCPpN7WenNPcXpMjBfZyPyE7CvFjnfG7o8eDGQVUqQejMA0vANVU2nQ
         cWvxoVJAGi2RwEPXpVe8rlE8m6sUZVltjM1BvJVgEfehSvk3rdgDupZ0Bv3XHT6dm3Y8
         cVJg==
X-Gm-Message-State: AOAM531DTTIZEzHxr8DLn0v9Ba6i3VH8nq8yh3H9v8b62XT+IItY5YyA
        r6K1O5DRy+MBcHbUt47dqzSn9OkSzQ4K6Gn9HqsG8Q==
X-Google-Smtp-Source: ABdhPJxCrtHIsV7KofTQzS7x17ALKuUB39G39gb4IwHCx6860d625lxMWoMCGDPQwz11vBINp5tlTNP0b8aQpGFQwm8=
X-Received: by 2002:a25:8d90:0:b0:634:7136:4570 with SMTP id
 o16-20020a258d90000000b0063471364570mr13323397ybl.582.1650347335888; Mon, 18
 Apr 2022 22:48:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220418132154.7401-1-rex-bc.chen@mediatek.com> <20220418132154.7401-2-rex-bc.chen@mediatek.com>
In-Reply-To: <20220418132154.7401-2-rex-bc.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 19 Apr 2022 13:48:45 +0800
Message-ID: <CAGXv+5FXTft7-E5LnuZdNo8Tq6OKOKwt58GgJD_+z1N5u6B8yw@mail.gmail.com>
Subject: Re: [PATCH 1/7] clk: mediatek: reset: Correct the logic of setting register
To:     Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
        p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com,
        chun-jie.chen@mediatek.com, yong.liang@mediatek.com,
        runyang.chen@mediatek.com, linux-kernel@vger.kernel.org,
        allen-kh.cheng@mediatek.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Mon, Apr 18, 2022 at 9:22 PM Rex-BC Chen <rex-bc.chen@mediatek.com> wrote:
>

The subject could be written as "Fix written reset bit offset" to make it
more specific.

> Original assert/deassert bit is BIT(0), but it's more resonable to modify
> them to BIT(id % 32) which is based on id.
>
> This patch will not influence any previous driver because the reset is
> only used for thermal. The id (MT8183_INFRACFG_AO_THERM_SW_RST) is 0.
>
> Fixes: 64ebb57a3df6 ("clk: reset: Modify reset-controller driver")
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
