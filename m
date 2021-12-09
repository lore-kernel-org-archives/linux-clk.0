Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F2EC433EF
	for <linux-clk@archiver.kernel.org>; Thu,  9 Dec 2021 14:11:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238405AbhLIOOz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 9 Dec 2021 09:14:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238398AbhLIOOx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 9 Dec 2021 09:14:53 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18796C061746
        for <linux-clk@vger.kernel.org>; Thu,  9 Dec 2021 06:11:20 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id m15so5167116pgu.11
        for <linux-clk@vger.kernel.org>; Thu, 09 Dec 2021 06:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hxC5857k0/x0qpfripe0OcZLA0Jpy5Tn91k/gBvRbfY=;
        b=QiLgkAxE+huWLx88a165wLHKu3m2OwUDbthXC8zx18V1Re2FnAvenu1xqhelM6d/KL
         nht/pqG+yw3uDOoFnVB7ErN1d5/0QcDt2NkYKagUrNJEs9Fq1rFItG1xLZZlFvAMZGvB
         ViQutqWOYoleAj6FQ0O/iJQprwCcTt9Gi7PRhpvzeBwKbQkRcu11/F7YH2G0LdZS6hJy
         bUBfR9A+Xl5Rz7FcF5J+sZ1dh1qsCyW+XNSPtM4fBvq39rO+qCgxCGd7y3TbRpGphs1n
         kNG5e12iXDBa21C/Z7mCGv423sbsJuBB1F3LXXshF1uskUmVuLg2dQwQld6nRb3RjzOq
         hndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hxC5857k0/x0qpfripe0OcZLA0Jpy5Tn91k/gBvRbfY=;
        b=S2/S+gMh2RMCHYMwCGUzAcGxDzcbxKnj8Eap+uyg1RUCyqlSuQnj9NRTYz4FI3oktJ
         q6EOStrSIrLOi07WwEplGe/XsnWl8x5I2iWYnZQxh5c4SDyCmEszv3xvP1Aw3kx5tz52
         SO4Op+MPukRL3R1z42MJ7cIx3rfLFQiWh4XKJTivrNpdpR2waX29Tq3PA0mAB3y77P06
         TY74RgvyObtTxFphjM0bB1p1JOR9vnXmzUIL2So6uh2/dT9O5uC2mI7tna2WngQRfpBv
         K0PsozJJ/pozG+MDvjlJ4lRkVTryiQ99Isp70v5jSTzXJKHp93eRnUF6s9bnzGaa7GZb
         RFxg==
X-Gm-Message-State: AOAM531IIHVXTyoRk0QKA9NMsMgpfmcOXc083xEVn9OgSZSYFUVsK6Rv
        1KQGld5GQveqG0yccbak/ArEkz0ksl56wP1qrgNhXw==
X-Google-Smtp-Source: ABdhPJxSj9OSlrbLZlOQWBlk5VcpcFqZ5rMrICHi3obpWZAvx5XrQuSiXQFCDEUGjqkCmBs5yr+D2M4XkST0GDA/exY=
X-Received: by 2002:a63:1564:: with SMTP id 36mr25236610pgv.324.1639059079400;
 Thu, 09 Dec 2021 06:11:19 -0800 (PST)
MIME-Version: 1.0
References: <20211208022210.1300773-1-dmitry.baryshkov@linaro.org> <20211208022210.1300773-3-dmitry.baryshkov@linaro.org>
In-Reply-To: <20211208022210.1300773-3-dmitry.baryshkov@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 9 Dec 2021 15:11:08 +0100
Message-ID: <CAG3jFyvuudxc_6Vh-24WcvgBDa0G2_uAtPYYtuBFoYosE3Ld1A@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: qcom: dispcc-sdm845: park disp_cc_mdss_mdp_clk_src
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 8 Dec 2021 at 03:22, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> To stop disp_cc_mdss_mdp_clk_src from getting stuck during boot if it
> was enabled by the bootloader, part it to the TCXO clock source.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/dispcc-sdm845.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
> index 735adfefc379..f2afbba7bc72 100644
> --- a/drivers/clk/qcom/dispcc-sdm845.c
> +++ b/drivers/clk/qcom/dispcc-sdm845.c
> @@ -858,6 +858,9 @@ static int disp_cc_sdm845_probe(struct platform_device *pdev)
>
>         clk_fabia_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
>
> +       /* Park disp_cc_mdss_mdp_clk_src */
> +       clk_rcg2_park_safely(regmap, 0x2088, 0);

Could the hardcoded number be replaced with
disp_cc_mdss_mdp_clk_src.cmd_rcgr just to make this easier to read?
Maybe the comment isn't needed with this change.

> +
>         /* Enable hardware clock gating for DSI and MDP clocks */
>         regmap_update_bits(regmap, 0x8000, 0x7f0, 0x7f0);
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
