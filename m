Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB30DC4332F
	for <linux-clk@archiver.kernel.org>; Tue, 29 Nov 2022 07:04:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbiK2HEE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Nov 2022 02:04:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiK2HEC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Nov 2022 02:04:02 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83EE1391D8
        for <linux-clk@vger.kernel.org>; Mon, 28 Nov 2022 23:04:01 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id v3-20020a17090ac90300b00218441ac0f6so762629pjt.0
        for <linux-clk@vger.kernel.org>; Mon, 28 Nov 2022 23:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PO/cDnZZW/RlYHuzoKyfVL5YxwkikYi3mPwl9HeEE7E=;
        b=oTlxBTjxb0OLs3LbtbLfBJy+5BE4R1aiDbHvx7Le4Ike9jM0Ec1TgEe8ZTAv3pACeV
         pc8VkakOjvc3fBYd/f0vQMP0EOWw3WZNUaok6ZRd2zuQL4NAor8HNgA/jeKfxWfO9Cxf
         P25OeRVnt7yFQbez6xPQ07sIqlDzOaQ+pGTvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PO/cDnZZW/RlYHuzoKyfVL5YxwkikYi3mPwl9HeEE7E=;
        b=AFtCJ8vT7edGeBKglyYAyXvX9Jj0Rys4cE2XInDRBSlshoxJ4wf+WlPl9R1F+yVOlX
         /e+I4vW8g7RaO4lv8NWE2WHal1hQY5VE/gtST5TMwhHvmMSHjZlBZkQiUaw3/ObKpMbZ
         pjP5/c0zaRHjFo1Kp4uV0dmrCr6YWthxsGNK4U5c+ifrbgaIr+hHL/CdXiowm8QrKgHh
         G+Lb5jNvarzspHJ8468i6/FDBZTvUsbnbINy6+D1u9wnS4Wyo3lGeIs8v9c6ASmSLx31
         3ZKFK8ktY8bXqDHRk4WnKO7MvANJfZ747a7hG0IrMr3+n5z09E3RU1QG1r+x/I6FUJFd
         IBHw==
X-Gm-Message-State: ANoB5pmGG8HeU4z0SKb1R7W4il8uI1+mhvPuG6kHRoXDJrkib3ydg0LB
        l9gr7SLxUdOtQC9yncLpsvThCA==
X-Google-Smtp-Source: AA0mqf5XVl2scp/GL8QqnK/jwLxKtG6rYycCaa648SfkyfYV/m7xzyJUi6ZoDwIhFKq1LLUDb7xy0w==
X-Received: by 2002:a17:902:f243:b0:189:8046:4335 with SMTP id j3-20020a170902f24300b0018980464335mr12291749plc.152.1669705440997;
        Mon, 28 Nov 2022 23:04:00 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:ac4a:f96:259:b58a])
        by smtp.gmail.com with ESMTPSA id y69-20020a62ce48000000b0056d3b8f530csm9140261pfg.34.2022.11.28.23.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 23:04:00 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     sboyd@kernel.org, angelogioacchino.delregno@collabora.com
Cc:     mturquette@baylibre.com, yangyingliang@huawei.com,
        jose.exposito89@gmail.com, matthias.bgg@gmail.com,
        linux-clk@vger.kernel.org, rex-bc.chen@mediatek.com,
        chun-jie.chen@mediatek.com, msp@baylibre.com,
        nfraprado@collabora.com, linux-arm-kernel@lists.infradead.org,
        miles.chen@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20221024102307.33722-1-angelogioacchino.delregno@collabora.com>
References: <20221024102307.33722-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 00/10] MTK: Undesired set_rate on main PLLs and GPU DVFS
Message-Id: <166970543840.607733.16874108898291986445.b4-ty@chromium.org>
Date:   Tue, 29 Nov 2022 15:03:58 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 24 Oct 2022 12:22:57 +0200, AngeloGioacchino Del Regno wrote:
> There's no reason to declare CLK_SET_RATE_PARENT on main system PLL
> dividers, as any rate change on those (mainpll, syspll, univpll) will
> change clock rates on critical system peripherals and busses.
> 
> This change was performed only on SoCs that I could test... I'm sure
> that the same can (and should) be done on more MTK clock drivers for
> practically all MTK SoCs, but I don't feel confident in pushing things
> that I couldn't test, so that's done only for MT8173/83/86/92/95 and
> on MT6795.
> While at it, I've also added the much needed clock notifier treatment
> on MT8186 for GPU DVFS, like done on other clock drivers in the past.
> 
> [...]

Applied, thanks!

[01/10] clk: mediatek: clk-mtk: Allow specifying flags on mtk_fixed_factor clocks
        commit: 672c779e4cff5f4a103077e9b398f144c85db802
[02/10] clk: mediatek: mt8186-topckgen: Drop flags for main/univpll fixed factors
        commit: 295de9d0d063cc576c5c6322aeeda64d3579d9e5
[03/10] clk: mediatek: mt8183: Compress top_divs array entries
        commit: 23037ab63336a4a1d98645bf7ee76240ed20bc65
[04/10] clk: mediatek: mt8183: Drop flags for sys/univpll fixed factors
        commit: c01d64ca5166fa88d27c7c4a2a294dd10d20f780
[05/10] clk: mediatek: mt8173: Drop flags for main/sys/univpll fixed factors
        commit: f757c9e951b89c40db41592a22785b5a25c58224
[06/10] clk: mediatek: mt6795-topckgen: Drop flags for main/sys/univpll fixed factors
        commit: 0cf308ee3472019539582ee279b637beb34ad2ff
[07/10] clk: mediatek: mt8192: Drop flags for main/univpll fixed factors
        commit: b56603285f7e323591267bec9a9d6950e9bdb7cb
[08/10] clk: mediatek: mt8195-topckgen: Drop flags for main/univpll fixed factors
        commit: 327eeb6c240ab9293ab730789ea651fbc3fe6123
[09/10] clk: mediatek: mt8186-mfg: Propagate rate changes to parent
        commit: ecc639ddbe0d7bf1c66f6c69ee54ee005484d886
[10/10] clk: mediatek: mt8186-topckgen: Add GPU clock mux notifier
        commit: 3256ea4f6582d2cb9b63ad96451957c217a52582

Best regards,
-- 
Chen-Yu Tsai <wenst@chromium.org>
