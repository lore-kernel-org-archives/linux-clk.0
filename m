Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2ED7C6FA82
	for <linux-clk@archiver.kernel.org>; Mon, 26 Sep 2022 03:23:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233406AbiIZDXq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 25 Sep 2022 23:23:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231176AbiIZDXp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 25 Sep 2022 23:23:45 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20FF66457
        for <linux-clk@vger.kernel.org>; Sun, 25 Sep 2022 20:23:44 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id r18so11269688eja.11
        for <linux-clk@vger.kernel.org>; Sun, 25 Sep 2022 20:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=lxvp+T0nmPNAS5r7Bc6SkAzZFGyMPUN1eLVnGVUBPPc=;
        b=a4B7p662s2cugcXrV/HHOV8DNtByQMTkUBkwzRLjrJ400RI9k5DhbSdm+Y8nvVNGe1
         2GrIMo7f5EMtHnZ8zJ+VxBHnLbFRWe2U8xgptKsM1MnEkOKvXjRwenRDLAezNavD35TP
         4qQawu698yOuRu+1TQMjkGvKS70t8zxTM3a3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=lxvp+T0nmPNAS5r7Bc6SkAzZFGyMPUN1eLVnGVUBPPc=;
        b=aTfWfhfuPZ58Y95HwS9GVtUoyT82pi8SQNAx1VSsDvUa9Ys/Cwla5749XsYrNqOpXe
         IrNbMGXJYu8Yui6a46o+quTjFWWq2RdPY4hyLcspNN3IW37BFKT0+owvVeg+jaLOkJ8k
         AvyOQpwZENXHhRVp1/1mZt84KvfnTWPdNbBbglOwKHhSPHd798xz725vQsrsum2AIWnC
         OvDd8k2HYjy1LhLEaiXifZfvsReceMcK4Z9+l9ZbI78IrLyrLQ0V9SoeTkKkpNnm1d3Y
         AxwHcu6f18Yjxn+mhfsUDLvK9PhBV/64RJhkZbD6blmhw5ZrZ7Ig6ygICQZHS97T6EDd
         DjDg==
X-Gm-Message-State: ACrzQf2aMIxTDvQUI9BbnKds9p8uovkpVappZCz7U2QTay4upUYhH4d5
        UxKRMHQpr8XwK0Nb2sNMOqtb2XT1wg6XoRRIU+PvmA==
X-Google-Smtp-Source: AMsMyM7614BUgahOMwJWu9MHtouT3NLfNy27XW7Lv6OZVc+xsfxGx4XppqGFaREEVBKwAdnU1WmvNJCHo+/NFhY0zHg=
X-Received: by 2002:a17:907:7f93:b0:781:dbee:dece with SMTP id
 qk19-20020a1709077f9300b00781dbeedecemr16502807ejc.323.1664162622513; Sun, 25
 Sep 2022 20:23:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220915072458.18232-1-angelogioacchino.delregno@collabora.com> <20220915072458.18232-11-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220915072458.18232-11-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 26 Sep 2022 11:23:31 +0800
Message-ID: <CAGXv+5EtRTux22ERqCXTDL-Ooo5qa6u=KWO5=m_s4U3sPoLp3g@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] clk: mediatek: clk-mt8192: Add clock mux
 notifier for mfg_pll_sel
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     matthias.bgg@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
        miles.chen@mediatek.com, rex-bc.chen@mediatek.com,
        nfraprado@collabora.com, chun-jie.chen@mediatek.com,
        jose.exposito89@gmail.com, drinkcat@chromium.org,
        weiyi.lu@mediatek.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Sep 15, 2022 at 3:25 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Following the changes that were done for mt8183, add a clock notifier
> for the GPU PLL selector mux: this allows safe clock rate changes by
> temporarily reparenting the GPU to a safe clock (clk26m) while the
> MFGPLL is reprogrammed and stabilizes.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
