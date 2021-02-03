Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 588A9C433DB
	for <linux-clk@archiver.kernel.org>; Wed,  3 Feb 2021 14:26:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C6DD64F6C
	for <linux-clk@archiver.kernel.org>; Wed,  3 Feb 2021 14:26:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232417AbhBCO0j (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Feb 2021 09:26:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231905AbhBCO0i (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Feb 2021 09:26:38 -0500
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26A38C061573
        for <linux-clk@vger.kernel.org>; Wed,  3 Feb 2021 06:25:58 -0800 (PST)
Received: by mail-qt1-x831.google.com with SMTP id z32so215428qtd.8
        for <linux-clk@vger.kernel.org>; Wed, 03 Feb 2021 06:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mj7d/khLmSJGOWdA9KEA2tHAZXerllRPwSPFlYrXYDE=;
        b=CLouXu9kdbw5ue3bej+GffpgCOInIG53qraBZ+gFloJTP+x8CeoUdC3+1rQA+AoJsu
         cB79f2y7yBSuvQ9IbVOIQMg8eirhJc98lEOtTsFaQ91cJqJvZ2ZNuULuUFCFPu8x6Laq
         IIgidbwWOO6G+51pZAiY0rHgqpPFjIG/Fl+jcnPYN7lRM0Pg20wO40Xhdvly3z9Nm940
         ySoBqsuVf/AMaqHM8KK8ykDXSTB3KMo0yK8bsoVt7MnIjG75mERJdvglALEysyCxHwIG
         briqhtlIueM7b7hslj+Bm+p8Gt+fUOppSY4XqyO20+gM17WB+ic4tpHxj3xIVvXqRvUd
         lTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mj7d/khLmSJGOWdA9KEA2tHAZXerllRPwSPFlYrXYDE=;
        b=DeIuLzzvwJksHj2rsGcDN1lVQLPjEota6W09DUZqYBn4MK+gkgq4IG2Z0jijVtkhYJ
         vdeKGZ8G0is8olxsbWxXW9YwI+VHa7BkLqWmOoyukPT21mqftvxthNL93FXWcCFv3q+u
         ppHt24qUv6mvJV/Ci6ZcRfY4e64V/Wirl5/RQqaZeeZE/tPILh66dDj+PZhI3lGdhnch
         zVvqGRLqGzig/15XL/9taVSziBbmE0X5yc3uiget2x2Zq2kWXEZd3h4YFHeH/Fl0V0Nz
         xPfwcZhcz4g04kbRVADuOfrZCqdSrawfGbivKf+gaTZsREGbA4qzuFW4LO3v0T0+7z1C
         eiCQ==
X-Gm-Message-State: AOAM531HtxOCjg2AZLlON4tcYWRL/4cAgYjomZO0JJeiRev8DWxyOGsu
        cPRbsm05fxIOXPs/t9cKtcVNiETjnTUkMLX4QUPukw==
X-Google-Smtp-Source: ABdhPJw9rrFCh/eyG9dq2SfkoyV/boCPNgtEDs6i8pzhdhcbg2lz/bQuyt4Npxl5AkxoJ8YYXhazn0GNXLe70AXob/E=
X-Received: by 2002:aed:2821:: with SMTP id r30mr2573930qtd.364.1612362357405;
 Wed, 03 Feb 2021 06:25:57 -0800 (PST)
MIME-Version: 1.0
References: <20210203115456.1072975-1-bryan.odonoghue@linaro.org>
In-Reply-To: <20210203115456.1072975-1-bryan.odonoghue@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 3 Feb 2021 17:25:46 +0300
Message-ID: <CAA8EJpquw_HBT+x=go_378_ZVqLiHmq7y9FvBEgoqESaTosy4Q@mail.gmail.com>
Subject: Re: [RESEND PATCH 0/4] Fixup clocks for venus on sm8250
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 3 Feb 2021 at 14:53, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> - Adds some missing indices to the videocc index
> - Adds videocc clock tree hirearchy for msv0
> - Adds a regulator to power the videocc consistent with downstream
>
> Once done we can move on to enabling these clocks in the DTS and switch on
> the venus.
>
> Bryan O'Donoghue (4):
>   dt-bindings: clock: Add missing SM8250 videoc clock indices
>   clk: qcom: videocc: Add sm8250 VIDEO_CC_MVS0_DIV_CLK_SRC
>   clk: qcom: videocc: Add sm8250 VIDEO_CC_MVS0_CLK
>   clk: qcom: videocc: Add gdsc mmcx-reg supply hook

I remember now the old discussion about these two clocks
(https://lore.kernel.org/linux-arm-msm/160092826778.310579.12225989905897101118@swboyd.mtv.corp.google.com/).

Is the message. reported by Jonathan, solved by the mmcx-reg supply?
Also are these clocks necessary at all?


-- 
With best wishes
Dmitry
