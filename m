Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31CB6CCA481
	for <linux-clk@archiver.kernel.org>; Mon, 11 Jul 2022 14:39:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231444AbiGKOjT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Jul 2022 10:39:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbiGKOi6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2022 10:38:58 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 711671F2CD
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 07:38:57 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id v6so3959684qkh.2
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 07:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7XItuS7mxG3PZJmkt2lhJ3OfdyNaqBYJhSMEwOH7X7w=;
        b=PGyjfvKcWdQwelKW6M8EqUThfSKyzL47vHKiHrDemhJsneuC3ixvwPZpeXfEyG1cyR
         8KPrFdjBv/Zo/II3/JPlKy7mGsa/Q39PbpljtC0/8lm35MvZ59axYT/uPaRIMgX9amIJ
         29LaT0QCehH9Gf75ZQ8XofHL0rVkoyfgT6kbmYyLplJ+ehLCi7JEgTL1PUAkKsne9olR
         57KCROb94QPPQ0c5q70I3lEHA3Bg024JIZk74fnO2fy/HCGafLSK6XsKQLJpcd84ExE3
         YZKXT6W3Ajosz5UBCZitdo0YHcT8u+cFy+WCGW2YlQr9to7dOQd96GGGA54qbzgrtpXh
         lB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7XItuS7mxG3PZJmkt2lhJ3OfdyNaqBYJhSMEwOH7X7w=;
        b=EWKXh5myGQhRjwpzCuOL8vpv8L93ldRR64F48vl7vGW1Iui0j19nacefTry04Ky4y6
         CteAjDOhtyGphdMvnmpJL49lCOhmFcASKc/7iP78brTBSr3TDw3Wo+g33UioK4ctbfvi
         GhcQZvmxH6SZ1AF4dceqBJ5y7B5lXB+J/h0et1CFBTxTc3JVh2Ai70WURnbsJntSfE7n
         6XrR4hKnw4svwYp8t3jFYZzRUaNgS2kyKo8z8JcRUYnIPg2QnZkz3DdKCixhgAHpxnS4
         OtGDrM3giIrRK2XFiB5bl5G2+6y77PcO18ovY5kQHRoncMqFR4g7wvLm07hzEfVz8wi7
         sa5A==
X-Gm-Message-State: AJIora8A0c/Y24Sjog3bLlhaODPo+/s1oIYEPdSFkLH8JsJMYhP3TKE/
        G2KU/fPCzBQDbSWd3R9hCw4LT2skA5ia31F8KZq3YQ==
X-Google-Smtp-Source: AGRyM1v7KwvPv0nm/D8OzJicPsfijYOWEzwiJQg1F3Z9hxTc1QBfSx++f0Z1WbfPChzH+yJTRZEFC3fssklptShCyNk=
X-Received: by 2002:a05:620a:d5b:b0:6b5:660b:2939 with SMTP id
 o27-20020a05620a0d5b00b006b5660b2939mr10691619qkl.30.1657550336362; Mon, 11
 Jul 2022 07:38:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220711104719.40939-1-robimarko@gmail.com>
In-Reply-To: <20220711104719.40939-1-robimarko@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 11 Jul 2022 17:38:45 +0300
Message-ID: <CAA8EJpo-83y=z_uRePLg0upUuhWc439FKBq_sy_Z=5kriD7unw@mail.gmail.com>
Subject: Re: [PATCH 1/6] clk: qcom: clk-rcg2: add rcg2 mux ops
To:     Robert Marko <robimarko@gmail.com>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, sivaprak@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 11 Jul 2022 at 14:22, Robert Marko <robimarko@gmail.com> wrote:
>
> From: Christian Marangi <ansuelsmth@gmail.com>
>
> An RCG may act as a mux that switch between 2 parents.
> This is the case on IPQ6018 and IPQ8074 where the APCS core clk that feeds
> the CPU cluster clock just switches between XO and the PLL that feeds it.
>
> Add the required ops to add support for this special configuration and use
> the generic mux function to determine the rate.
>
> This way we dont have to keep a essentially dummy frequency table to use
> RCG2 as a mux.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/clk/qcom/clk-rcg.h  | 1 +
>  drivers/clk/qcom/clk-rcg2.c | 7 +++++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
> index 012e745794fd..01581f4d2c39 100644
> --- a/drivers/clk/qcom/clk-rcg.h
> +++ b/drivers/clk/qcom/clk-rcg.h
> @@ -167,6 +167,7 @@ struct clk_rcg2_gfx3d {
>
>  extern const struct clk_ops clk_rcg2_ops;
>  extern const struct clk_ops clk_rcg2_floor_ops;
> +extern const struct clk_ops clk_rcg2_mux_closest_ops;
>  extern const struct clk_ops clk_edp_pixel_ops;
>  extern const struct clk_ops clk_byte_ops;
>  extern const struct clk_ops clk_byte2_ops;
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index 28019edd2a50..609c10f8d0d9 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -509,6 +509,13 @@ const struct clk_ops clk_rcg2_floor_ops = {
>  };
>  EXPORT_SYMBOL_GPL(clk_rcg2_floor_ops);
>
> +const struct clk_ops clk_rcg2_mux_closest_ops = {
> +       .determine_rate = __clk_mux_determine_rate_closest,
> +       .get_parent = clk_rcg2_get_parent,
> +       .set_parent = clk_rcg2_set_parent,
> +};
> +EXPORT_SYMBOL_GPL(clk_rcg2_mux_closest_ops);
> +
>  struct frac_entry {
>         int num;
>         int den;
> --
> 2.36.1
>


-- 
With best wishes
Dmitry
