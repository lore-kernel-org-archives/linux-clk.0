Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81B2AC05027
	for <linux-clk@archiver.kernel.org>; Mon,  6 Feb 2023 11:18:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbjBFLSE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Feb 2023 06:18:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbjBFLSE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Feb 2023 06:18:04 -0500
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F31893EF
        for <linux-clk@vger.kernel.org>; Mon,  6 Feb 2023 03:18:03 -0800 (PST)
Received: by mail-vs1-xe2f.google.com with SMTP id y8so12308224vsq.0
        for <linux-clk@vger.kernel.org>; Mon, 06 Feb 2023 03:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/rwXX77gDObBsNSKOYPKq8KrSqNKeQDtYRqpUJ33YBs=;
        b=jCUFeCsz6BfoHukI2ABxuTMF6frheMup3DbNltf74R+lX5vdhqT82KSrIsPkTmAlqH
         P9WTfXjQBNReHstzUK5VCcyNK8sTRGc5acp/3EmbWQzJlaJUOh88/8ukFH33dUUZDNq2
         VvrIM7vGnUvJtzPpLYx5Lu6VhhkmPBtsUaij8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/rwXX77gDObBsNSKOYPKq8KrSqNKeQDtYRqpUJ33YBs=;
        b=31urQv+58rp1uGjHCb1pMZbdke9f1nAyj2YjZQtiBM0J3w6rtKJys/805N6RLFbe/A
         VXQtm7emuHFL2DkmHHoS3e5r0RHD4/Fgx3OhwFbFEbZb/4oPfbW7Z9YV6K4LxxS/PDbV
         AvzVgU19e0ZTsA+00jI5bpftHBJ2Qrx3KOdZ7z+wJpvnwB6ufsh8v+hKSxJWEva2ln9j
         nEokATYyLErFeWCl6rtlLl0NArl7TZn1TfIuQSsjb0fiKvj5GEiHvPFnZfzThEyt1d0q
         7zoe366zrUhjIRpv1A5F4089DAsigkyYzhFbLfQzRL5dwbuklxMtkiQEINhKLf9f3gzT
         mfMA==
X-Gm-Message-State: AO0yUKVIfRFK3mMKHRettPQkLeZuWpVbVLDEKnUhhY0/y9g9LNM/IZ9S
        aGiRUWhtouqq/ElDmHwYVN6r1EpY5vBhmtbBNF7r4Q==
X-Google-Smtp-Source: AK7set/KGmltEInT6XzqPPO0IQbyeDjR6qLXf6JqdQTYRJiNedxftxWZahdnYF2TPrmK1NolkMQXMg26ZTZ9DH7wHKs=
X-Received: by 2002:a67:d21a:0:b0:3ed:2cd6:deed with SMTP id
 y26-20020a67d21a000000b003ed2cd6deedmr3458075vsi.65.1675682282519; Mon, 06
 Feb 2023 03:18:02 -0800 (PST)
MIME-Version: 1.0
References: <20230206091109.1324-1-moudy.ho@mediatek.com> <20230206091109.1324-6-moudy.ho@mediatek.com>
In-Reply-To: <20230206091109.1324-6-moudy.ho@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 6 Feb 2023 19:17:51 +0800
Message-ID: <CAGXv+5GFkNmH=Ltb1o+9eB=4+FfuNk2T3OGk1zWjsrweGbzKkA@mail.gmail.com>
Subject: Re: [PATCH v7 5/6] soc: mediatek: mutex: Add mtk_mutex_set_mod
 support to set MOD1
To:     Moudy Ho <moudy.ho@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Feb 6, 2023 at 5:11 PM Moudy Ho <moudy.ho@mediatek.com> wrote:
>
> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
>
> Add mtk_mutex_set_mod support to set MOD1
>
> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
