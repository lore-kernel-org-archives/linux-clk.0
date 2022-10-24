Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33183C38A2D
	for <linux-clk@archiver.kernel.org>; Mon, 24 Oct 2022 23:52:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230426AbiJXXw6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Oct 2022 19:52:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229933AbiJXXwf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Oct 2022 19:52:35 -0400
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02012DFA9
        for <linux-clk@vger.kernel.org>; Mon, 24 Oct 2022 15:10:31 -0700 (PDT)
Received: by mail-vs1-xe2e.google.com with SMTP id s28so9230694vsr.10
        for <linux-clk@vger.kernel.org>; Mon, 24 Oct 2022 15:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=stUhgmxHOajI9uqfx7NpPsmu7P60GiPKRF/7gBID+dg=;
        b=aI7jghSe4eTqhLetWbp1CUXeviJT+nB0niZcj1EYJhDL5AD7HaUHBIBnjyFt5wHzMX
         kuoy1TdwweW1mYpeAVavBgwSy7Cv65g5xnnQB6RTCg6Ou9V1otGvwMjJixkYCFuabC5v
         yIqXOu/FOjlFETGXBPo0qK53a/g8ByJg0I/uI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=stUhgmxHOajI9uqfx7NpPsmu7P60GiPKRF/7gBID+dg=;
        b=TbRlrV+vlGNGObXorcmxHn8bVsRLacT1GN5hCePDM4nrQKpCsekJaDcARqNvWoxD2Z
         607RCIwVfUl7ZBjqrgNIk3hrRrt3aJeXq/x/FIOASEpvMAJ/7odwA+jTjTk/AMlG3ied
         sdgR3r2QZk0tbXd4kmCnRUtztdWK+aP2hjCRco6w3Yb4rUjOROgk5w2cUXV120BrAFRI
         8TDpwPCKYEIw8YxM+kik/UUjUOE6A4IXDbVPvQSZkJFtyLL1A0SasrRZlpYd6q0g1ayf
         JwjZQzFyuiN+7f6itXyHeEqKpZvahdtiGB7aI8CpOFUxQvListidMNIaWBmndBSZsWBa
         JXMQ==
X-Gm-Message-State: ACrzQf058XsW1kUXjAtiAQhK/nyKPsJFddfSP7N5/U2ktyDK+K/TzwqJ
        1P8tkTyr5fk+G8ttIunVVUSJnGMwsHLR0OEfx9CAQg==
X-Google-Smtp-Source: AMsMyM4mF8OtH43I5lB0/0j3s/Xrw1R6qcOOGU77MvOGbIdfp4X/GbRrXsUymIVx+BbzSWL5HqwmMg4nQImm+z6TjYI=
X-Received: by 2002:a67:f684:0:b0:392:ac17:f9b0 with SMTP id
 n4-20020a67f684000000b00392ac17f9b0mr20569192vso.85.1666649420213; Mon, 24
 Oct 2022 15:10:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221024102307.33722-1-angelogioacchino.delregno@collabora.com> <20221024102307.33722-8-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221024102307.33722-8-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 24 Oct 2022 15:10:09 -0700
Message-ID: <CAGXv+5GLWLcG8n0vVjKV2rNHpVOxGfz_63OmZSfjqk503gADLw@mail.gmail.com>
Subject: Re: [PATCH 07/10] clk: mediatek: mt8192: Drop flags for main/univpll
 fixed factors
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
> The main/univpll clocks are used as clock sources for multiple
> peripherals of different kind, some of which are critical (like AXIs);
> a rate change on any of these two will produce a rate change on many
> devices and that's likely to produce system instability if not done
> correctly: this is the reason why we have (a lot of) "fixed factor"
> main/univpll divider clocks, used by MUX clocks to provide different
> rates based on PLL output dividers.
>
> Following what was done on clk-mt8186-topckgen and also preventing the
> same GPU DVFS issue, drop CLK_SET_RATE_PARENT from the aforementioned
> clocks.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
