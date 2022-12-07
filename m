Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A05C4708E
	for <linux-clk@archiver.kernel.org>; Wed,  7 Dec 2022 15:47:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbiLGPrg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Dec 2022 10:47:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbiLGPrf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Dec 2022 10:47:35 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A010BD4
        for <linux-clk@vger.kernel.org>; Wed,  7 Dec 2022 07:47:33 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id b13-20020a17090a5a0d00b0021906102d05so2036463pjd.5
        for <linux-clk@vger.kernel.org>; Wed, 07 Dec 2022 07:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9GXVtFbyLH9bXbPp6XoAN6tnNePeiBDOdXpTyQdMNU8=;
        b=qBxziTGIEROT7SzFrJFkWDorJCQs/P38DM7vdfqHze/nkpaFKYGBCX14OryUXqwC6U
         0js3/UxKdJRK+y7bI55wnV1GJNiPPxagXJssETECJoLRMa4N+utAOam1dN9EIQFi7M8z
         Yc3sa1SxKfuVxfI9ky3VUawKcgQzJ4PunzOxx4+z15IswpsslAMOjtxtbYMavVoVFOxR
         d/yqfycBOQHg3N3dK9hMSVIACD+xVPqoCTFwp0qPdlssuqjS/NXnseecyzS/SOLdE8J7
         QphHNRlExgkTaUfGepgyxMVI7dEeQKlXawqczZZsB85U45fezwIzFIv6qVRHA8FhDjKp
         +9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9GXVtFbyLH9bXbPp6XoAN6tnNePeiBDOdXpTyQdMNU8=;
        b=rpG9uoZ7w3U+8M/Z9NNZhQL7onpRbzuASdVn4QCzBemGKAngEmG8piJ6ZN2UT/K/dW
         PFT3tAAGURggpIKELThJ8iZaDxke5ZsMP81GCkOzrzLA03bnissGwxKlttRbKPqdMYTt
         BR4ssd1k1kaYspLxGwKznFDiMu0oZAdfrAzRnL3ewZyP4FoD35gnggkyK7qnvypBDu7M
         dBaX70Z4HHQfB7bK446A1G3Zl06OYaCy59fGOa54M0yLyn+QxjljmpPf61k5iPl01N4F
         zaZnzu9MxULMI89GmA5PJXXqrnasO/EilThkz6Aehsxvv2/lMXxwttihCEo7d/MX24HI
         ybDw==
X-Gm-Message-State: ANoB5pk/3IeoUQjbwRO3fX8pCJ7lJZmZUxLDXWab3uuUDwo/D//H96sb
        A3mzvNrEnTtNvbjpIF6v64gwktZrH6hZ3S7IqZ3tYA==
X-Google-Smtp-Source: AA0mqf6zI+5THu783lV/KS0RegQypSJtxXtCFoiK5hcSCkIGi/jqzF9fmfUHD5ZQXNbKUlXI09uuOn20iQQL/GbIT1I=
X-Received: by 2002:a17:90b:268b:b0:219:ff4d:b64b with SMTP id
 pl11-20020a17090b268b00b00219ff4db64bmr8237396pjb.164.1670428053074; Wed, 07
 Dec 2022 07:47:33 -0800 (PST)
MIME-Version: 1.0
References: <1664960824-20951-1-git-send-email-quic_akhilpo@quicinc.com> <20221005143618.v7.4.I5e64ff4b77bb9079eb2edeea8a02585c9e76778f@changeid>
In-Reply-To: <20221005143618.v7.4.I5e64ff4b77bb9079eb2edeea8a02585c9e76778f@changeid>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 7 Dec 2022 16:46:56 +0100
Message-ID: <CAPDyKFp8ynYSyMc+gXWuW8dC1j07X+8k3omsKKnLA_u+4X-vvA@mail.gmail.com>
Subject: Re: [PATCH v7 4/6] clk: qcom: gpucc-sc7280: Add cx collapse reset support
To:     Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Douglas Anderson <dianders@chromium.org>,
        krzysztof.kozlowski@linaro.org, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 5 Oct 2022 at 11:08, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> Allow a consumer driver to poll for cx gdsc collapse through Reset
> framework.

Would you mind extending this commit message, to allow us to better
understand what part is really the consumer part.

I was expecting the consumer part to be the GPU (adreno) driver, but I
may have failed to understand correctly. It would be nice to see an
example of a typical sequence, where the reset is being
asserted/deasserted, from the consumer point of view. Would you mind
explaining this a bit more?

>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Kind regards
Uffe

> ---
>
> (no changes since v3)
>
> Changes in v3:
> - Convert 'struct qcom_reset_ops cx_gdsc_reset' to 'static const' (Krzysztof)
>
> Changes in v2:
> - Minor update to use the updated custom reset ops implementation
>
>  drivers/clk/qcom/gpucc-sc7280.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/clk/qcom/gpucc-sc7280.c b/drivers/clk/qcom/gpucc-sc7280.c
> index 9a832f2..fece3f4 100644
> --- a/drivers/clk/qcom/gpucc-sc7280.c
> +++ b/drivers/clk/qcom/gpucc-sc7280.c
> @@ -433,12 +433,22 @@ static const struct regmap_config gpu_cc_sc7280_regmap_config = {
>         .fast_io = true,
>  };
>
> +static const struct qcom_reset_ops cx_gdsc_reset = {
> +       .reset = gdsc_wait_for_collapse,
> +};
> +
> +static const struct qcom_reset_map gpucc_sc7280_resets[] = {
> +       [GPU_CX_COLLAPSE] = { .ops = &cx_gdsc_reset, .priv = &cx_gdsc },
> +};
> +
>  static const struct qcom_cc_desc gpu_cc_sc7280_desc = {
>         .config = &gpu_cc_sc7280_regmap_config,
>         .clks = gpu_cc_sc7280_clocks,
>         .num_clks = ARRAY_SIZE(gpu_cc_sc7280_clocks),
>         .gdscs = gpu_cc_sc7180_gdscs,
>         .num_gdscs = ARRAY_SIZE(gpu_cc_sc7180_gdscs),
> +       .resets = gpucc_sc7280_resets,
> +       .num_resets = ARRAY_SIZE(gpucc_sc7280_resets),
>  };
>
>  static const struct of_device_id gpu_cc_sc7280_match_table[] = {
> --
> 2.7.4
>
