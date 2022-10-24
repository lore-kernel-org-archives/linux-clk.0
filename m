Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B9DC67871
	for <linux-clk@archiver.kernel.org>; Mon, 24 Oct 2022 23:37:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbiJXXhw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Oct 2022 19:37:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbiJXXh2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Oct 2022 19:37:28 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EDCC103278
        for <linux-clk@vger.kernel.org>; Mon, 24 Oct 2022 14:57:40 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id s28so9201996vsr.10
        for <linux-clk@vger.kernel.org>; Mon, 24 Oct 2022 14:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Mie0dwILOoL5NP5Cg3Tf9BLyHE4I1j5avRUFdQRyJZQ=;
        b=gNXcO91AfhdJU+tqEckzPK3JYjWSz1Js/FUQZO3PvIsUgwYmnA80qUARF9QI7nqyrK
         7aDzrWPVkNNS9jt3kjz3H/2gbEyMAFDMxioj5GYU9tN+InKZaAywQuBlsdxCD8up/ZC1
         cARm+ZNoI+B5/t+4cl+QXzAJHzscPydD8zxqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mie0dwILOoL5NP5Cg3Tf9BLyHE4I1j5avRUFdQRyJZQ=;
        b=J43nI0061T7f4T4w23pUzUHxVgQZ6BsEA0qqy036TYmd8s8QENolFF3dL2Pc7wLVYi
         7Es46DCTHC9rht6tZk/QEClrtwTEhvQusbElUr41ReO38o2HBbRuHW7NMdxj0mMBveJN
         R+FdRh524HQ0ysHysbWxi7P6Fsv8s7x6yNQKHUr0+S4SIknJymwXbxIoMXXbuTxK/UL1
         vN51WYZNEdHq2YnXXWU7Ty48yFliyx0hABg5l9oExgsbO3rQsUbgFgPtvIwJWMRl0CYE
         HmwuSBJ+CSDG6ZTfhW8LAdh+XfKxLli5ZCUiAkUMoPQuhADeR0GjUN0eG5i9qabZukih
         eJJg==
X-Gm-Message-State: ACrzQf2JzEJL1AUePqM0aYoEpmrkZlbISLq1/MR0yWA6oBOC9ddhcEGp
        g55L9It8uyB6aWcDjbuA5/lA2eJOrfDYET8PKhJ40Q==
X-Google-Smtp-Source: AMsMyM6PPYTAcOUSy3ZKM+pzj2N+X3xlMfiu8aQLbFXu3p60GkgOWzwhnMJsay3y56pkP1gHlZx4uqvmP7yqCYRajpU=
X-Received: by 2002:a67:fa14:0:b0:3aa:1ba5:4ab0 with SMTP id
 i20-20020a67fa14000000b003aa1ba54ab0mr3994142vsq.77.1666648640519; Mon, 24
 Oct 2022 14:57:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221024102307.33722-1-angelogioacchino.delregno@collabora.com> <20221024102307.33722-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221024102307.33722-2-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 24 Oct 2022 14:57:09 -0700
Message-ID: <CAGXv+5HnJgmoX=8596OJZki_0qDaipP+cbbTWpkVxuOkErSBdA@mail.gmail.com>
Subject: Re: [PATCH 01/10] clk: mediatek: clk-mtk: Allow specifying flags on
 mtk_fixed_factor clocks
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     sboyd@kernel.org, mturquette@baylibre.com, matthias.bgg@gmail.com,
        miles.chen@mediatek.com, nfraprado@collabora.com,
        rex-bc.chen@mediatek.com, chun-jie.chen@mediatek.com,
        jose.exposito89@gmail.com, yangyingliang@huawei.com,
        msp@baylibre.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Oct 24, 2022 at 3:23 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Before this change, every mtk_fixed_factor clock forced clock flags to
> CLK_SET_RATE_PARENT: while this is harmless in some cases, it may not
> be desired in some others, especially when performing clock muxing on
> a clock having multiple parents of which one is a dedicated PLL and the
> others are not.
>
> This is especially seen on the GPU clocks on some SoCs, where we are
> muxing between multiple parents: a fixed clock (crystal), a programmable
> GPU PLL and one or more dividers for the MAINPLL, used for a number of
> devices; it happens that when a rate change is called for the GPU, the
> clock framework will try to satisfy the rate request by using one of the
> MAINPLL dividers, which have CLK_SET_RATE_PARENT and will set the rate
> on MAINPLL itself - overclocking or underclocking many devices in the
> system - and making it to lock up.
>
> Logically, it should be harmless (and would only reduce possible bugs)
> to change all of the univpll and mainpll related fixed factor clocks
> to not declare the CLK_SET_RATE_PARENT by default but, on some SoCs,
> this is also used for dividers of other PLLs for which a rate change
> based on the divider may be desired, hence introduce a new FACTOR_FLAGS()
> macro to use custom flags (or none) on selected fixed factor clocks.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
