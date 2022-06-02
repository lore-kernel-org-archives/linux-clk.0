Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2FADC433EF
	for <linux-clk@archiver.kernel.org>; Thu,  2 Jun 2022 10:15:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233481AbiFBKPJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 Jun 2022 06:15:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233189AbiFBKPI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Jun 2022 06:15:08 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6268B2AD5CA
        for <linux-clk@vger.kernel.org>; Thu,  2 Jun 2022 03:15:05 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id o68so3275240qkf.13
        for <linux-clk@vger.kernel.org>; Thu, 02 Jun 2022 03:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fOHitFVtUhQxQeGoTHoG0OzFq0ZzrGiczbq+UxLc2qw=;
        b=JWryxprqeUxNU1XZR95MlHVGT7qDBnT1Ot3ZVtcYjVhIAQGizQ4cLaxHFqn92wHQdR
         eA3+lrQlnmvH3tLvzz3gKCMHBYSa0XUYOP1v8m+fWNANYgzmckyp9Xgiy5aVFbX47zIq
         x6NRqvlWDNLibNbKuwKmcZ4ofxZlW7tP0VnbmlDx30GfjrZgQkSNKNokN8lEYLyqdrk8
         kStDk6tMe5YgSu0FwDg7iUFg7VejnB9qXCKwXo132VZs4XqeSjyNnkD4k4Gyw0fR4SD+
         qdOg+UWMF+y75RBbC5BTWTgwaoELK0hVrRkyr1Tw8oFOFOFNXFkr22r0yeNj2rKXoSw9
         vO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fOHitFVtUhQxQeGoTHoG0OzFq0ZzrGiczbq+UxLc2qw=;
        b=cGTB+blRfJCcODli7jRfAD+ZCU2o59gQ7XVygHXfsL/CmQtymKJbBvzLjJIHXA4Mc0
         WnkYA+x33vx8URSNd2Al8tKIobZZcBnKN47p4kxkNUetSYkofwAQ0Q/aKsY7aYcc8y8f
         aK1Znt56STZOoWfBOPzs/VhZkviGnn0q1GfuVrxsjsZUSBKSzjIt9hEj7Hrv6p+ERAeI
         4/uR+Sb+SJ598ZGv0EWszSWhhLrUYv5bThq/ooF5xMwWib3fEwB1g1Bb03XenGHRUYL4
         mQZPfnOmxUdXFhr60UC73kU0R1xaDmcigortRoSzQGTXG9s0i92mTK9FXqvQTxbnpt+2
         UAQA==
X-Gm-Message-State: AOAM531djTeVVlPZMqizU3gm5zBB7PgaEA56AlOA/YdhlWehK27vbLpT
        3LlJ2QkUVIVMB23U7AiuF37a47H/JuhFSF/H2ETJOg==
X-Google-Smtp-Source: ABdhPJw2bRmHzQbnAYbZakDLi24fc4qCFs5O5K0MkvKDsfdY7N70JVb+c0+aHohWoM0U4fwyizCr+zLCSn4np4A52Z4=
X-Received: by 2002:a05:620a:2a06:b0:6a5:b090:65c0 with SMTP id
 o6-20020a05620a2a0600b006a5b09065c0mr2438054qkp.593.1654164904535; Thu, 02
 Jun 2022 03:15:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220601220747.1145095-1-marijn.suijten@somainline.org> <20220601220747.1145095-2-marijn.suijten@somainline.org>
In-Reply-To: <20220601220747.1145095-2-marijn.suijten@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 2 Jun 2022 13:14:53 +0300
Message-ID: <CAA8EJprRhoE+MMWSx69O+s=Zvoq=HKtaoe7xx+kCmtZas1woCw@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] clk: divider: Introduce devm_clk_hw_register_divider_parent_hw()
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rajeev Nandan <quic_rajeevny@quicinc.com>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Marek <jonathan@marek.ca>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 2 Jun 2022 at 01:07, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> Add the devres variant of clk_hw_register_divider_parent_hw() for
> registering a divider clock with clk_hw parent pointer instead of parent
> name.
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  include/linux/clk-provider.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index c10dc4c659e2..4e07621849e6 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -831,6 +831,25 @@ struct clk *clk_register_divider_table(struct device *dev, const char *name,
>         __devm_clk_hw_register_divider((dev), NULL, (name), (parent_name), NULL,   \
>                                   NULL, (flags), (reg), (shift), (width),     \
>                                   (clk_divider_flags), NULL, (lock))
> +/**
> + * devm_clk_hw_register_divider_parent_hw - register a divider clock with the clock framework
> + * @dev: device registering this clock
> + * @name: name of this clock
> + * @parent_hw: pointer to parent clk
> + * @flags: framework-specific flags
> + * @reg: register address to adjust divider
> + * @shift: number of bits to shift the bitfield
> + * @width: width of the bitfield
> + * @clk_divider_flags: divider-specific flags for this clock
> + * @lock: shared register lock for this clock
> + */
> +#define devm_clk_hw_register_divider_parent_hw(dev, name, parent_hw, flags,   \
> +                                              reg, shift, width,             \
> +                                              clk_divider_flags, lock)       \
> +       __devm_clk_hw_register_divider((dev), NULL, (name), NULL,             \
> +                                      (parent_hw), NULL, (flags), (reg),     \
> +                                      (shift), (width), (clk_divider_flags), \
> +                                      NULL, (lock))
>  /**
>   * devm_clk_hw_register_divider_table - register a table based divider clock
>   * with the clock framework (devres variant)
> --
> 2.36.1
>


-- 
With best wishes
Dmitry
