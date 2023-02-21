Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72990C61DA3
	for <linux-clk@archiver.kernel.org>; Tue, 21 Feb 2023 03:39:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233049AbjBUDjp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Feb 2023 22:39:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232807AbjBUDjp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Feb 2023 22:39:45 -0500
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D5992200C
        for <linux-clk@vger.kernel.org>; Mon, 20 Feb 2023 19:39:44 -0800 (PST)
Received: by mail-vs1-xe2d.google.com with SMTP id u14so2475937vsp.8
        for <linux-clk@vger.kernel.org>; Mon, 20 Feb 2023 19:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1676950783;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eyR7hb6+4nnohx1Os+xJuDUE4j0WlgtLqxQEIptIJGc=;
        b=EH9Gs94+bMfCqoMpwo0blYpUtwBOlTqv5J56zeGIbkMnPE2IWzW0qkSqhNjrmciPj5
         NinIep+5pkpc1/y6LpPdT66tfyHugn+Tbcr2qiB5AZggTM4yT/xmLE1T5if0wKxoFZgJ
         GfNpN1vpgHOjyrQtbH5Reh1C1Hu8vyf19mdx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676950783;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eyR7hb6+4nnohx1Os+xJuDUE4j0WlgtLqxQEIptIJGc=;
        b=Xg9Ty5U5qhN2GpwQ08yVB877NLW2xChtPM9GRifx5Qbp4snWVAxF2YHy+4yHcUC8vk
         KGiB9xVMCZZ23q3Ln0OlCEYkAkaHpAgFBafDX1OXH5z6j1eb3YLRhwr0EkeBAQKqGrrt
         MY5wSyImk8at60ZieyKJTuQaeEJDXuiu31qp2/0xxdrXkyDYlvFRkLOrtMuVnNKdixIk
         jZcCXjb5f4ZmPBp0PLJgsKg1FVdDpgl5VpIl4wBQ8CZ2+Q7mWNnS1krbb2nX7TDTlmwE
         Kur5HQcVPwMj0spnTe7+V4+Y1HJavY8QkQKMb2LlAp/3OLpzWJ8/hFsQwUIIPE7MYVmu
         jQ4Q==
X-Gm-Message-State: AO0yUKU8I0lxTOXyR5zMxsU9LVtiGbYP6jriCvlkrWV9z+rkQsgy4TBI
        PmudiADJB5RAF5CnbYWj43KrwIHfwQPAVH95kqpqEA==
X-Google-Smtp-Source: AK7set+D349/5265yL0xKdvrfFIsomu5l6hLeBBkm5qE9AONzbCuJgnYXdR0E3W2E+MqupsPm0Wi6fjuhGasUAmEV/k=
X-Received: by 2002:a67:f6c1:0:b0:411:a14d:6bac with SMTP id
 v1-20020a67f6c1000000b00411a14d6bacmr828458vso.44.1676950783217; Mon, 20 Feb
 2023 19:39:43 -0800 (PST)
MIME-Version: 1.0
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com> <20230220150111.77897-20-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230220150111.77897-20-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 21 Feb 2023 11:39:32 +0800
Message-ID: <CAGXv+5FhOnGfCOuWfNY8EgSzJ9Su7peukJh5YGQWJ4ZFV9u0Bw@mail.gmail.com>
Subject: Re: [PATCH v3 19/55] clk: mediatek: mt8183: Move apmixedsys clock
 driver to its own file
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
        johnson.wang@mediatek.com, miles.chen@mediatek.com,
        chun-jie.chen@mediatek.com, daniel@makrotopia.org,
        fparent@baylibre.com, msp@baylibre.com, nfraprado@collabora.com,
        rex-bc.chen@mediatek.com, zhaojh329@gmail.com,
        sam.shih@mediatek.com, edward-jw.yang@mediatek.com,
        yangyingliang@huawei.com, granquet@baylibre.com,
        pablo.sun@mediatek.com, sean.wang@mediatek.com,
        chen.zhong@mediatek.com, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Feb 20, 2023 at 11:01 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In preparation for migrating all other mt8183 clocks to the common
> mtk_clk_simple_probe(), move apmixedsys clocks to a different file.
> While at it, use the builtin_platform_driver() macro for it and fix
> some indentation issues in the PLLs table.
>
> During the conversion, error handling was added to the apmixedsys
> probe function.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
