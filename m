Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A1AC636D4
	for <linux-clk@archiver.kernel.org>; Fri, 17 Feb 2023 04:23:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbjBQEXE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Feb 2023 23:23:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbjBQEXC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Feb 2023 23:23:02 -0500
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A45562917E
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 20:23:00 -0800 (PST)
Received: by mail-vs1-xe2e.google.com with SMTP id j5so4311377vsc.8
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 20:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qMJrW3rbhiV2WpI8udS44p8yxQXPp4OR7zwWUWrBLQY=;
        b=cb+NU7/hOrbeIcSAvzvU+tZuwXMCxS0dDxTkUfSdzU72XQQPcT8u+iahlUuOdzU6G+
         untKhF7BuSkJYwsQTHm2q81nQF5w/Vk7P/NK54b2hAojRwwkWbK/gDWpIWeVE6Wxlhyx
         yTIo8iQGaV/K4usRg+HpQ1zTWM40TWLc9vt3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qMJrW3rbhiV2WpI8udS44p8yxQXPp4OR7zwWUWrBLQY=;
        b=MoIYOFBabczgeGr4lVqA0X2rucl05c7MWAz/6cw24xp8NR5sK4GXS67XTWnG3ipf+p
         C41gAm74Bv3g9McWThbwkrYlhOWURl8yQLwh01kqi1k7ve83ba1pnaPeAPnG74gBn5Jr
         V/yf8bmxdsLMpWfs5oNPsypChE4NT89RJx1i5AzvzRZGMfBToXKFNoiWFNSHs52k8WVp
         EKbG4kNSXLZImSPaCWQMJdR4dLbxf7t7nrWR6jzv7iY3k0fLn2VV1bqJH5yIrN9dXJsv
         XXLWHrDFsciPfgOtOcWvcYY36+CBDxzuOUj6t1R618iqslQQBKsBeghGRZJhHzoRl0S/
         cW9A==
X-Gm-Message-State: AO0yUKX59OeDD1NsCknXfRAT4A5xtaSk5iRsHF27W6Mt4wVYG6yqXz45
        qvb53IHTv29mno4JKoM0aXT5PAFrLIUyVm3DoEPAcw==
X-Google-Smtp-Source: AK7set9vsLwX+gthcvL2Wxef+YafrTV4xzfWZkMbI8ss4V/DiE2fTut21H1Wtq3OHhxIlP71d2IMxXbDSdVrl7GcBi0=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1529005vso.60.1676607779821; Thu, 16 Feb
 2023 20:22:59 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-36-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-36-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 17 Feb 2023 12:22:48 +0800
Message-ID: <CAGXv+5HHQ+ZQt6CVOKKvef5CQVWe1AW6N07GSUCBuFZc5P=59Q@mail.gmail.com>
Subject: Re: [PATCH v2 35/47] clk: mediatek: Add MODULE_LICENSE() where missing
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
        linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In order to successfully build clock drivers as modules it is required
> to declare a module license: add it where missing.
> While at it, also change the MODULE_LICENSE text from "GPL v2" to
> "GPL" (which means the same) on clk-mt7981-eth.c.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Looks like all files have it now.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
