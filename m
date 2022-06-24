Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73EB7C43334
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jun 2022 01:09:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbiFXBJd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Jun 2022 21:09:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiFXBJc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Jun 2022 21:09:32 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D45B0522E9
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 18:09:30 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-101dc639636so1781674fac.6
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 18:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=OCHZxokmpPS3ghyjxdWAlsOmOJoJ7RkmN7lu9vpq/qc=;
        b=mgmCgBe5WxBpH89yuOr301hjK5lL5qvKpX+q0WY3Kvk8Uct1ju85U3VL84gbnUbFGm
         umtfp93y0TObeGA/vX0kAbt5pmZnBdQTd3LOEemB+ztk752fsZT48g2k4qF4gTuG3BxW
         yMWg66ompzCQcsliNLhBFppZ8A6TCE7euehNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=OCHZxokmpPS3ghyjxdWAlsOmOJoJ7RkmN7lu9vpq/qc=;
        b=Pbv3Zigiz9XDgSQtBekmbVR/9cULaTonEWIPhSyjJWw6ZjlMdpeqms6rrmwy5Kd2I9
         xNn3UnIpJ0dytC1gqGagsj3mNnT+U2lCvkOHVVKET7lndoUf5fMGRNFgx6W3A5jAN+c5
         CYf2uGVuCzGApyYhj0JPyPl53QJKazQAVLlM3tRgpsTQY0dZ0rdz5RprF7FtnhSh6yZN
         4OdM5qpFN725SrhwUuW1CbQe4aYTwFfi+76aCuiQHmCTVd7swNFxUsYaI52V4SAJmrTy
         5cvNQedltH7dSPqaLtU9kehjIrx68zIe3mI02xYSO/bqcveIYR4oQgGyDFXR4gIyDM55
         dnfw==
X-Gm-Message-State: AJIora/E11J1jQgolpIaxyHw20ykXM6EPepAiERWFfSTuXcxyRJohLYw
        25CipELF/mffrQhujkv3ytw/HJfZl9rn5ZF1dOX8lQ==
X-Google-Smtp-Source: AGRyM1tXirInAlabjW2wEws7IJSezLdoi0NAHbcTGFYyFOOwxy2J/0t4iXkfHnq/bVhSuIcagOvo549caWEkIJTT/0w=
X-Received: by 2002:a05:6870:b627:b0:102:f25:a460 with SMTP id
 cm39-20020a056870b62700b001020f25a460mr481377oab.193.1656032970163; Thu, 23
 Jun 2022 18:09:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Jun 2022 18:09:29 -0700
MIME-Version: 1.0
In-Reply-To: <20220620153956.1723269-2-dmitry.baryshkov@linaro.org>
References: <20220620153956.1723269-1-dmitry.baryshkov@linaro.org> <20220620153956.1723269-2-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 23 Jun 2022 18:09:29 -0700
Message-ID: <CAE-0n50P1sre19Vn76m2JuyNV1dLsBt7dOA30rnGPS_z3=aVjw@mail.gmail.com>
Subject: Re: [PATCH 2/2] phy: qcom-qmp-ufs: provide symbol clocks
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Baryshkov (2022-06-20 08:39:56)
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> index a2526068232b..0f31d3255897 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> @@ -1167,6 +1167,54 @@ static int qcom_qmp_phy_ufs_clk_init(struct device *dev, const struct qmp_phy_cf
>         return devm_clk_bulk_get(dev, num, qmp->clks);
>  }
>
> +static void phy_clk_release_provider(void *res)
> +{
> +       of_clk_del_provider(res);
> +}
> +
> +#define UFS_SYMBOL_CLOCKS 3
> +
> +static int phy_symbols_clk_register(struct qcom_qmp *qmp, struct device_node *np)
> +{
> +       struct clk_hw_onecell_data *clk_data;
> +       struct clk_hw *hw;
> +       int ret;
> +
> +       clk_data = devm_kzalloc(qmp->dev, struct_size(clk_data, hws, UFS_SYMBOL_CLOCKS), GFP_KERNEL);
> +       clk_data->num = UFS_SYMBOL_CLOCKS;
> +
> +       hw = devm_clk_hw_register_fixed_rate(qmp->dev, "ufs_rx_symbol_0_clk_src",
> +                                                          NULL, 0, 0);
> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +
> +       clk_data->hws[0] = hw;
> +
> +       hw = devm_clk_hw_register_fixed_rate(qmp->dev, "ufs_rx_symbol_1_clk_src",
> +                                                          NULL, 0, 0);
> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +
> +       clk_data->hws[1] = hw;
> +
> +       hw = devm_clk_hw_register_fixed_rate(qmp->dev, "ufs_tx_symbol_0_clk_src",
> +                                                          NULL, 0, 0);

This line should be aligned with the opening parenthesis. Same for the
above other two.

> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +
> +       clk_data->hws[2] = hw;
> +
> +       ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data);
> +       if (ret)
> +               return ret;
> +
> +        /*

This is tabbed weird. It doesn't align with the if above.


> +         * Roll a devm action because the clock provider is the child node, but
> +         * the child node is not actually a device.
> +         */
> +        return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
> +}
> +
>  static const struct phy_ops qcom_qmp_ufs_ops = {
>         .power_on       = qcom_qmp_phy_ufs_enable,
>         .power_off      = qcom_qmp_phy_ufs_disable,
