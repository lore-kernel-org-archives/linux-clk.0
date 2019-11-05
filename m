Return-Path: <SRS0=Glxp=Y5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E8FCA9ED5
	for <linux-clk@archiver.kernel.org>; Tue,  5 Nov 2019 08:25:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5318821D71
	for <linux-clk@archiver.kernel.org>; Tue,  5 Nov 2019 08:25:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E4swKQdx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387866AbfKEIZQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 Nov 2019 03:25:16 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40816 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387859AbfKEIZM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 5 Nov 2019 03:25:12 -0500
Received: by mail-lj1-f194.google.com with SMTP id q2so14188167ljg.7
        for <linux-clk@vger.kernel.org>; Tue, 05 Nov 2019 00:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+yZGl0XTUJFnBIncZkbSNKc2+2vqsiJzQfis6dIemDY=;
        b=E4swKQdxg99a6Sr3wL+9BfqZTNESaOvMmfCCssXkVyQCJx+FO04pH01TclCxthRcTk
         MrMCbLBEbEBUEQshEn4IgR78+mENEd5E3jaUM2Yais/4AGqwDEqHeK3Vn+l9g4FgVOul
         I6+OJZz+WEt6v6E+7jyEvyzuD2nCjEPHF5FGtJhSbYtIeRGYhylvSC2A2s41X6wSQGFE
         BhRQd4bv4arYeAWAhRc+G8br1yVfFxzs+O42tHDsQsUQXcbG1DwQ4/e2r56b9luV8wAP
         7K8i0BQ21fQAgaLKCZhWj/0yrRUtJCCSZ+uSO+gotww5G8dnHXLqeC/dy5CNuv5pliTf
         An+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+yZGl0XTUJFnBIncZkbSNKc2+2vqsiJzQfis6dIemDY=;
        b=Hr8Yhoa0oPCumSYNbwaGqOwu7Py4q61TmQDE+KwVJdr7ZuLtmY74EvwXjq1Tobjg+n
         SoLGzQHBbZtEYYjWLNo25YMSnbKEzf3nZb4LYV1VTE/cqC0eBJPd3ky4UaZ9tGgnum/s
         mB56yq6X+FjsPq4PoBnxqpV9zrzarYeijcIEBt6W3nEM2VF8l4X9l1Zj3gyYaUtpjzRv
         hDVKQUXcZOpOZH+ikMhzH+vkuqavb84pxs7ki2SuzGe1cSzxjJgK1dmX5jDeJQ4YHYYU
         hekxHion3/yvZMYFVrIYUfScsGXncolBuqEvl5yJjwqqFf/UeIle2GqyfaXBrLUUjdJP
         L6Qw==
X-Gm-Message-State: APjAAAV7NaTaequwTqbpamEGPK3AiuuQFAxt0hpiJGRu+j1i11Yk/dm6
        3cl1QoLSc/B/EfbouVU25WPEN41A5tjDXbBbz/cje00UQ44=
X-Google-Smtp-Source: APXvYqwrkAaSHmqsR1vTyMbihda+HLCHxLkwmQyBbdZYLtm+isUlafOZhJqKte2zL4X7UpXIBjLNmhYePPPyQUkLGlM=
X-Received: by 2002:a2e:96cb:: with SMTP id d11mr15334688ljj.82.1572942310596;
 Tue, 05 Nov 2019 00:25:10 -0800 (PST)
MIME-Version: 1.0
References: <1995139bee5248ff3e9d46dc715968f212cfc4cc.1570520268.git.baolin.wang@linaro.org>
In-Reply-To: <1995139bee5248ff3e9d46dc715968f212cfc4cc.1570520268.git.baolin.wang@linaro.org>
From:   Baolin Wang <baolin.wang@linaro.org>
Date:   Tue, 5 Nov 2019 16:24:58 +0800
Message-ID: <CAMz4kuJcqs5pSyEqZ1v0Eb9-zaRrqoGvPMCEjfpgAmWkDcvrxA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: sprd: Use IS_ERR() to validate the return
 value of syscon_regmap_lookup_by_phandle()
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-clk@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

On Tue, 8 Oct 2019 at 15:41, Baolin Wang <baolin.wang@linaro.org> wrote:
>
> The syscon_regmap_lookup_by_phandle() will never return NULL, thus use
> IS_ERR() to validate the return value instead of IS_ERR_OR_NULL().
>
> Fixes: d41f59fd92f2 ("clk: sprd: Add common infrastructure")
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> ---
> Changes from v1:
>  - Add fixes tag.
> ---

I did not see this patch in your clk tree (you only applied patch 2 in
this patch set), could you apply this patch if no other issues?
Thanks.

>  drivers/clk/sprd/common.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/sprd/common.c b/drivers/clk/sprd/common.c
> index 9d56eac..7ad5ba2 100644
> --- a/drivers/clk/sprd/common.c
> +++ b/drivers/clk/sprd/common.c
> @@ -46,7 +46,7 @@ int sprd_clk_regmap_init(struct platform_device *pdev,
>
>         if (of_find_property(node, "sprd,syscon", NULL)) {
>                 regmap = syscon_regmap_lookup_by_phandle(node, "sprd,syscon");
> -               if (IS_ERR_OR_NULL(regmap)) {
> +               if (IS_ERR(regmap)) {
>                         pr_err("%s: failed to get syscon regmap\n", __func__);
>                         return PTR_ERR(regmap);
>                 }
> --
> 1.7.9.5
>


-- 
Baolin Wang
Best Regards
