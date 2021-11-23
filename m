Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E328FC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 23 Nov 2021 17:02:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233715AbhKWRGF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Nov 2021 12:06:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236804AbhKWRGE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Nov 2021 12:06:04 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30FCFC061746
        for <linux-clk@vger.kernel.org>; Tue, 23 Nov 2021 09:02:56 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id q17so17576795plr.11
        for <linux-clk@vger.kernel.org>; Tue, 23 Nov 2021 09:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6owNqcDoaPPSgoDjdbesWq57uvbLFPnsWIEPdW/px0Y=;
        b=c9d8xUe/qOtuuioWpxS12A7KI9r3l4VMIXBgcGzpznWs0Z7OcN0I4loL/PTCu/UxS5
         ddHAgBFAiLNy4HVFTUJfJgFawfhKcZMV4IqUQlX8hHmx8imjpHkXB/05UCzUTd9hZ+cM
         H5R+4ROxvg+Y9eIXumRe0zLb1crOVseNnB+eGU5IwaVnf3HSCX4I+/rRHUNp7JXgRpON
         gke3LRwzPRPRZzNa9aTuyIjo7iWhATMnE8BViCFYEdFkVI5rHv83SfK7c93u3qx80tPJ
         j4N+tjk8bGBvDSGc2JaSzL/6Nwe6p8Bysk9bmwZbNnahGEYiZe4GPCESO79yevFbhZRY
         qZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6owNqcDoaPPSgoDjdbesWq57uvbLFPnsWIEPdW/px0Y=;
        b=JWAatn6AvVboRG6tCCPm9J+De/Ci0iTwYC/aIxf1P2Frzlln/AuzqU0TJNl678p/fv
         9A3RVxeWMmjB7LC26bIT6o5D0whnUVbHEvA8YubTy7qeui5roJl2BwCNjecUKCN3KbVQ
         9J1tajHfn64zJ0s9jhMDW4WTM//0RT8B2zPuXfwwK4P621o9d8uvZRJ5e8RauJ/N0dX3
         GEmU9pDJoKGK+76w8jFnxPw40NJEcyBz+XUOek9gGbkiRBqsnQOoz1V+m5FDU9pibKJx
         B0E10iJDSpw7L48G90WMd/is8wpc4Sh+EB4KaGJJ/azlErRdndpfILkW6xmUO60Ud+Jd
         18gA==
X-Gm-Message-State: AOAM533P7r65c+oPsFUzOakQYE+Ysb0fEKSloccj+luAOPRQ9lssCUK6
        xpOh63qwNyA8q2QMM6CTj9voD8ybw19tpzdEx3CQXg==
X-Google-Smtp-Source: ABdhPJwtC9yJlhnYSPMNvmxu7MqpYmoigPcHG8h5MiPYBe/ro3thUy9VrOdP/Yt2YsoF0GVD49p0yUtPiYGvL0ZSwMA=
X-Received: by 2002:a17:90b:3e8c:: with SMTP id rj12mr4745975pjb.152.1637686975331;
 Tue, 23 Nov 2021 09:02:55 -0800 (PST)
MIME-Version: 1.0
References: <20211123161630.123222-1-bjorn.andersson@linaro.org> <20211123162508.153711-1-bjorn.andersson@linaro.org>
In-Reply-To: <20211123162508.153711-1-bjorn.andersson@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 23 Nov 2021 18:02:44 +0100
Message-ID: <CAG3jFyv4uhEN9zO0Kt9QU+0i93YoT7ccpSN-amncQM=zM9r6JQ@mail.gmail.com>
Subject: Re: [PATCH v2] clk: qcom: clk-alpha-pll: Don't reconfigure running Trion
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hey Bjorn,

On Tue, 23 Nov 2021 at 17:23, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> In the event that the bootloader has configured the Trion PLL as source
> for the display clocks, e.g. for the continuous splashscreen, then there
> will also be RCGs that are clocked by this instance.
>
> Reconfiguring, and in particular disabling the output of, the PLL will
> cause issues for these downstream RCGs and has been shown to prevent
> them from being re-parented.
>
> Follow downstream and skip configuration if it's determined that the PLL
> is already running.
>
> Fixes: 59128c20a6a9 ("clk: qcom: clk-alpha-pll: Add support for controlling Lucid PLLs")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> Changes since v1:
> - Forgot to commit the last minute s/pr_dbg/pr_debug/
>
>  drivers/clk/qcom/clk-alpha-pll.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index eaedcceb766f..8f65b9bdafce 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -1429,6 +1429,15 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_fabia_ops);
>  void clk_trion_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>                              const struct alpha_pll_config *config)
>  {
> +       /*
> +        * If the bootloader left the PLL enabled it's likely that there are
> +        * RCGs that will lock up if we disable the PLL below.
> +        */
> +       if (trion_pll_is_enabled(pll, regmap)) {
> +               pr_debug("Trion PLL is already enabled, skipping configuration\n");
> +               return;
> +       }
> +
>         clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), config->l);
>         regmap_write(regmap, PLL_CAL_L_VAL(pll), TRION_PLL_CAL_VAL);
>         clk_alpha_pll_write_config(regmap, PLL_ALPHA_VAL(pll), config->alpha);
> --
> 2.33.1

This resolves an issue I was seeing related to clocks not being able
to get updated.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
