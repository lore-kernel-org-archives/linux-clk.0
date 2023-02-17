Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 319DFC636D4
	for <linux-clk@archiver.kernel.org>; Fri, 17 Feb 2023 04:10:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbjBQEKO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Feb 2023 23:10:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbjBQEKN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Feb 2023 23:10:13 -0500
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 329AE35270
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 20:10:11 -0800 (PST)
Received: by mail-ua1-x92b.google.com with SMTP id b18so679541uan.11
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 20:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oGBLPshZPGMrS1uWiQyc0lNEwV+H+9iGELbs6/oqYEE=;
        b=AcI0DMBS+/8O38CDGd3KCIk92zOU6tfwU6NbqMhu2JUhWe77Vhh81T2y1DTRAiwgx+
         2hnqx+Sgd4LCgmOmMAd3UYsr+V98siDYvfRf0eT80lANMitKBGpnwvDiQ3bD7bY3Arbn
         BMkMTihpdrBeQjYAbmMW1a26t+ktCH4Yb5T5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oGBLPshZPGMrS1uWiQyc0lNEwV+H+9iGELbs6/oqYEE=;
        b=csq4AiqcNtLING6VfcntKlvOFT4BbiD2mAxcjp2uBUbRPdlfPHNEKdVGmH7ARZ01gj
         YvuMGygr3l/0YVq/RVNbJwqNIFWOtl6hHxjtCq84DPlK08FItLzyEcVTrbIUOwX4uOD+
         QL4onsZgYhhosaQ0b3k2xA5VV95rtuJV+abmOTZyhZi3kmytNNy7MRGNCpzg3Y54JKFt
         981EY++9KadFa+GKo9D6/R68BEBUqPgvuIocQzh3v2CHyA9AR4GTJaaeq1pqvOC7Wkbp
         LysybcsVBDIclolxMJRW4FfDLVZsOpZWv6yUkXTHWFDCCLt42imMtppKRIe1AUs6vfjG
         OxZg==
X-Gm-Message-State: AO0yUKWpNb23f32aQiIfrRVvqbqfvnOK9cFj/QcNs7SOhu0aUb5W/PVo
        eDj7TbnmJ+Hp5XJmqQ7TaldS6AOM7q+SysDM3JqGHQ==
X-Google-Smtp-Source: AK7set98SeNGl96EZizNQbwyR9dDOavG0wqLsoG9BX82J6+26nzoNTPbkoI/Xm8xERtgLUXiCG8Vl/Crx/a2DbTjOIo=
X-Received: by 2002:ab0:318e:0:b0:688:c23f:c22f with SMTP id
 d14-20020ab0318e000000b00688c23fc22fmr1246817uan.1.1676607010310; Thu, 16 Feb
 2023 20:10:10 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-30-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-30-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 17 Feb 2023 12:09:57 +0800
Message-ID: <CAGXv+5EEO2RMzwkknMEwYZmtO7PbDhOTj_=yRrU0UHeCdc==iw@mail.gmail.com>
Subject: Re: [PATCH v2 29/47] clk: mediatek: Propagate struct device with mtk_clk_register_dividers()
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
> Propagate struct device for divider clocks registered through clk-mtk
> helpers to be able to get runtime PM support for MTK clocks.

Sidenote: I think we still need to call pm_runtime_enable() (or some other
function) on the underlying device before any clk_hw_register() calls are
made for the clk core to pick up runtime PM support?

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
