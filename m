Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB184C636D7
	for <linux-clk@archiver.kernel.org>; Tue, 21 Feb 2023 03:43:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233074AbjBUDnV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Feb 2023 22:43:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233140AbjBUDnU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Feb 2023 22:43:20 -0500
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEEDF244BF
        for <linux-clk@vger.kernel.org>; Mon, 20 Feb 2023 19:42:32 -0800 (PST)
Received: by mail-vs1-xe2e.google.com with SMTP id 6so3059880vsv.7
        for <linux-clk@vger.kernel.org>; Mon, 20 Feb 2023 19:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1676950947;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ULibvphzro1D/98vWvfLMdiA81XUXKtqF+j4eYxfmic=;
        b=CaOM5YB4iZnIvNmgu7WWEY1Axx37zudaWsr7ZFhe+E8rAJJY88Qgu42VCYNZnzG8eA
         FNv4LTyy2b3xusy/T3zF7ByXkY34hW/V7gfny6LgnSuTFVgKa2XcgcCXXdfsAggJB3d1
         LlFaSlzwjAoXIHImNkWEFyR5zHnl0rP8dIsA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676950947;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ULibvphzro1D/98vWvfLMdiA81XUXKtqF+j4eYxfmic=;
        b=6AGRHaw6jpMRt2QicE5EAphFZ00F80TlxXnIRT5TgggJdbLc0sw+AZ5tCPudcLux4x
         8O/cw9ZJTTC8NOXjVHGVblKjuIjiTY7kd22LBHkqIbU7MxBBYow7vH2MwbuRfyVUtyUI
         8mI4wM4PZfRNiSzAcJdmqoITieVjekLjQpLSRlCfYy7f4ZplUIYJV/6gZA2X1ARV5jA4
         VO0/l3Auyh6DeN93OV3VcJkXLwcz3eHVVkdiUK5001gv40eBnBPwE7NcvX7FX7PE6wTM
         IRnE+riwU2c1wO1uMUBCO19pFzWahWgbotfKUKCvFbLmN4lcnixeWBODwWxBrK5H92Yi
         eu2Q==
X-Gm-Message-State: AO0yUKUVm4/CwDzS0gt28DCufEbMYB0Va7xgC02V5w2uNKJbDPTDfVac
        OocGHodrUjGMlyLRrTjza1vfQS1wh3nZGMklHS2ZBA==
X-Google-Smtp-Source: AK7set9Q3lgwHVzF0syYp34gQZFO/Wte245q8zd/k4th0GEwW7W3ggn8c4BEtNK75Xiff4H41OKOyL6E6Myn9WzQCZU=
X-Received: by 2002:a67:f6c1:0:b0:411:a14d:6bac with SMTP id
 v1-20020a67f6c1000000b00411a14d6bacmr829329vso.44.1676950947315; Mon, 20 Feb
 2023 19:42:27 -0800 (PST)
MIME-Version: 1.0
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com> <20230220150111.77897-26-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230220150111.77897-26-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 21 Feb 2023 11:42:16 +0800
Message-ID: <CAGXv+5Gt+05x4ZnuW0Bda=eEbqSyG+3fArpvq6-Qi41FO4wH9w@mail.gmail.com>
Subject: Re: [PATCH v3 25/55] clk: mediatek: mt7622-apmixedsys: Add .remove()
 callback for module build
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
> Add a .remove() callback to the apmixedsys driver to allow full module
> build; while at it, also change the usage of builtin_platform_driver()
> to module_platform_driver() to actually make use of the new callback.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
