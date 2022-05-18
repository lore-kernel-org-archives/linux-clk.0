Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F9E8C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 18 May 2022 13:39:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238050AbiERNjc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 May 2022 09:39:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238031AbiERNja (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 May 2022 09:39:30 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3D6D1A90EB
        for <linux-clk@vger.kernel.org>; Wed, 18 May 2022 06:39:27 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id f16so3734900ybk.2
        for <linux-clk@vger.kernel.org>; Wed, 18 May 2022 06:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BhJrvJLn+TzZ+Q8hiTJgSRsblqOxOpTfmvIr/hnkxcU=;
        b=Fr1wEjHLVhbeaVjSnAq2+SspRoi/e2nHtCbxH9sSXmM6/3QABuwEX0A/Bsv0tflvx7
         FeGLTj9FD2gkRu3GbCWe+exRmItXfmUcb0sSDSRZD4+ElF7Rf4cjjxqwhIJimVNkCdOk
         G7KCBSkOvXlptSJIcRhHWmc11F2GcHXFR8+qTkIwKJt/USalM5VXcDoAQc4okcJGsMmX
         F5Pa+wE7uyY0nr89lorDyjvaYa071njtprkgH39qA936CcpcVGNJZnYzLFsDlr8OMsAs
         J7/lUHeHwu2zSymb7v1cPfmgnmY1K97t0ftjofja2ovNQL1w63T81Iy1+EXOY2o6HKTK
         rwtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BhJrvJLn+TzZ+Q8hiTJgSRsblqOxOpTfmvIr/hnkxcU=;
        b=SHHg6w6Of98Cezw//sY+CaHx5PtExzeD6Sxsw2c4Vu/La7SHRSNa7Of+MpmdpVHcTI
         3vXyLH0v3UG6EtWogU6mZr8IEietsMVBDQpqR3Ka7UHH7F0ByDQPCpzgy7Xzflb8Q1EG
         nFJoOnwnLtQ3IcsBKF6rQv4FCwDHvQR7KVOiaKOxj547Ra5KefwcM5iuZdCFBGzGBpDl
         LFm3zafAnEtIJ/SYatAP67szEFyQzSta8Fn/GyHNInTIDgygMY4AMz44JL198m/XyeiE
         C2AwL+LxcP53vb9XdFFJqdvf5JzLh6MfKHBzmtudr6cnW6xTrAc1eiHTvnAgGadSorXv
         wZ2w==
X-Gm-Message-State: AOAM530vrjSqzBtQceWDg7N5asZvDV2yyV2zNYDgRXdaqJsDuwmP8+u6
        ypukC12ty2IMkWzyHI2+okfafFQstiWC9Nd8QoubBQ==
X-Google-Smtp-Source: ABdhPJw0ggPGBcwzy17FZdJk/9wHr1iVA0SjK4e5DeP3olkHLrIVoDC/fZ1dAMLEu7Vv5xwFM8k/Dan+CV+eeyELPlE=
X-Received: by 2002:a05:6902:526:b0:64d:b6ab:f91d with SMTP id
 y6-20020a056902052600b0064db6abf91dmr14325832ybs.295.1652881167023; Wed, 18
 May 2022 06:39:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220518062537.17933-1-hbh25y@gmail.com>
In-Reply-To: <20220518062537.17933-1-hbh25y@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 18 May 2022 15:39:14 +0200
Message-ID: <CACRpkdY4Ynox3qYu_8=ToH_nkXFpC3xOOuN7D4EM5vszDgKMdw@mail.gmail.com>
Subject: Re: [PATCH] clk: ux500: fix a possible off-by-one in u8500_prcc_reset_base()
To:     Hangyu Hua <hbh25y@gmail.com>
Cc:     ulf.hansson@linaro.org, mturquette@baylibre.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, May 18, 2022 at 8:25 AM Hangyu Hua <hbh25y@gmail.com> wrote:

> Off-by-one will happen when index == ARRAY_SIZE(ur->base).
>
> Fixes: b14cbdfd467d ("clk: ux500: Add driver for the reset portions of PRCC")
> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>

Good catch!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
