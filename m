Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87467FA373D
	for <linux-clk@archiver.kernel.org>; Mon, 24 Oct 2022 23:39:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbiJXXj4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Oct 2022 19:39:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230033AbiJXXjf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Oct 2022 19:39:35 -0400
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49A4E30102E
        for <linux-clk@vger.kernel.org>; Mon, 24 Oct 2022 14:58:48 -0700 (PDT)
Received: by mail-vs1-xe2b.google.com with SMTP id q127so4322561vsa.7
        for <linux-clk@vger.kernel.org>; Mon, 24 Oct 2022 14:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BzSJYeJmaTtTxu26Xk7PIR207/FtZbc1yEGzfOkJ+8U=;
        b=AFR5IkY1THjsaMBnZeQKwLYzIr9rrM6ni3gipAZKPDAEIe/ZGpVLpuD4pUFK0izrIU
         Iexsw5MQ6s8SqjK8P+TyE7pURsY+RfYmeh+5VhtJliGnTKLRWXxdcK3KfafIdF9EtDd5
         3ONuGx+5L5V0soyNKdJYLdTlJvp3MlQxIyxms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BzSJYeJmaTtTxu26Xk7PIR207/FtZbc1yEGzfOkJ+8U=;
        b=VCt10Ogfq7HXk/M+VYQH6TJzQdt1sr7e3OP6CcHgxtTKntWOB7JxEnewt8RM6VwzJo
         jfsFBK7jPK20GQ7wBi+1WYFsl5VrzyZXHRSFZwacr152ri9NfrJS/vIHccHij9gaSLgk
         GBOWvdmsPb4VE7Z+mVzrTad6+1yls2xgDwoZiyJv0IIEdjuJcFwlNu0yLwCfNVdV7Yae
         6OAjqYKXEnawjpOzY8caKmrWSGKuCW9qSCexONA7t9Q/wrFyN8FzCjDtFVcM3JQFLkdF
         ZBpMtyg5d5ku4VeDHTXE7MH/H6MNmugOqDIcDKRFl+Mfe06UXBLqswxpsXJS2+SIQGD6
         MrLg==
X-Gm-Message-State: ACrzQf11HCbbZYLT3nDwkhD2HqjkiL2H2ubddF18Pwm/Fx8juI1lHH9l
        Ec1RNV4AL/leouJ2fxyu1yuC72dIAXk6Bc3cRB1WLDY3PB60hA==
X-Google-Smtp-Source: AMsMyM7xsfjKi9PBasDfAnPzuNevqgPkwVbkWIklAY6Btc1FAexcrTrDwOWAJj+nVch8ctcQNpEKCIhfuV4+G7aJBn0=
X-Received: by 2002:a05:6102:3a4d:b0:3aa:762:5933 with SMTP id
 c13-20020a0561023a4d00b003aa07625933mr9658131vsu.17.1666648719970; Mon, 24
 Oct 2022 14:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <20221024102307.33722-1-angelogioacchino.delregno@collabora.com> <20221024102307.33722-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221024102307.33722-3-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 24 Oct 2022 14:58:29 -0700
Message-ID: <CAGXv+5FPUchS36ObBZQ73zh7cR5wyfk6bpNO4u5h3AH1GzSP0Q@mail.gmail.com>
Subject: Re: [PATCH 02/10] clk: mediatek: mt8186-topckgen: Drop flags for
 main/univpll fixed factors
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
> The mainpll and univpll clocks are used as clock sources for multiple
> peripherals of different kind, some of which are critical (like AXIs);
> a rate change on any of these two will produce a rate change on many
> devices and that's likely to produce system instability if not done
> correctly: this is the reason why we have "fixed factor" clocks, used
> by MUX clocks to provide different rates based on PLL output dividers.
>
> Though, there's one fundamental issue that must be resolved somehow:
>
> When performing GPU DVFS, we get a rate request that will try to change
> the frequency of MAINPLL due to the CLK_TOP_MFG mux having clk26m,
> mfgpll (the GPU dedicated PLL), mainpll_d3, mainpll_d5 (fixed factor
> dividers) as possible parents.
>
> In order to solve that, there are two ways:
>  1. Add new "fake" mainpll_d3_fixed, mainpll_d5_fixed clocks, clones
>     of mainpll_d3, mainpll_d5 clocks, for the only purpose of not
>     declaring CLK_SET_RATE_PARENT; or
>  2. Simply drop said flag from the original dividers.
>
> After some careful validation, I cannot see anything calling a rate
> change request during runtime for MAINPLL, nor for UNIVPLL (which would,
> again, mean that we're reclocking lots of peripherals at once!), so it
> is safe *and sane* to simply remove the CLK_SET_RATE_PARENT flag to all
> of the main/univpll fixed factor divider clocks.
>
> Besides, if for any (doubtful) reason main/univpll rate change will be
> required in the future, it's still possible to call that on the PLL main
> clocks, so we're still covered anyway.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

AFAIK this matches what we do for some other SoC families, so

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
