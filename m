Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66CC2C433EF
	for <linux-clk@archiver.kernel.org>; Sun, 27 Feb 2022 03:29:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbiB0D3k (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 26 Feb 2022 22:29:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229841AbiB0D3k (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 26 Feb 2022 22:29:40 -0500
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1797D21F5CE
        for <linux-clk@vger.kernel.org>; Sat, 26 Feb 2022 19:29:04 -0800 (PST)
Received: by mail-qv1-xf2a.google.com with SMTP id a1so9874187qvl.6
        for <linux-clk@vger.kernel.org>; Sat, 26 Feb 2022 19:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7uVsTdS9A3VvM3V9jvyobaIfl/vvSxzX/obLWEqItyo=;
        b=Gus3oS9RSn7V1sr7kHl81y1aya0zl1pkxCw11w+XDvu9TPjWigg3K7tlfZovWKB4ae
         LoFSKEOnw1/CPf1ue5bg4+ZnXYbF9Y+zkicAyImn/QMeG0xf8RkYkMwE7td7V+XucgUg
         0gDiET8OWcLiR/uTHn2wUh3WcY8POKYYZw/O/qikdZt/B8Oxa+/h0kWL0zlh0jNugHBG
         Rv5B++uhoDoF5bNd2dF70oz4vn2VMV+FnUr/zAIOwkrn52j00Kfgxx5zPdTqm8q/d8vi
         I5UERrNvI3oCAHu2jLszQfE2Ir4z01/zstiDc3a//KS3VlYN7Eft03BJzMvOQq3z/VZH
         WOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7uVsTdS9A3VvM3V9jvyobaIfl/vvSxzX/obLWEqItyo=;
        b=tSrW68ObogPMHvcUI6oKWe7a6QoeZXvKr0kxqXOsuS462FH4yAFtwFWvat/y36KEbL
         /ZCJyy8gfwgr5IY621ikYZEY25sQVG9y4bt0tsdup65iaSH9GhSUe9CR7fakQNfFFjMl
         OMPxsCzd3T3bsKvv0k2EQIYG6UR/GUOtOOfHMTCdaQeriOQLP3bkRvlu/Vb0ghP31bgb
         p5O+oXJRJkXMGYBPOkkNCZXWJQeE9G+4GhFPxf2TeZFdJBFsEspAGCrpkVOI/xVqJpJL
         2YsQOHUp7MbbQK1mhz/QFMZgGfdkhXf7IprudWsDHGEWRzmSh9nmFSMPImw5pElpjrtX
         +wJA==
X-Gm-Message-State: AOAM5316lKNm5QuCziVxyl3QmpBKhsWbWNUNJUB4TRB+ww6OOlm3msT5
        h0iPqCFQCwncu/GaIONM7a9ENdAw3qS7qUcl1ReTPA==
X-Google-Smtp-Source: ABdhPJy7XFThPExoHd3VFYJIkPak1UpwZE6oPWxM0M9mvJOEkCCe6XwmadvukE4ueQzyWqWGH926oT69VQqrOB0s4xU=
X-Received: by 2002:a0c:d807:0:b0:42c:1ff7:7242 with SMTP id
 h7-20020a0cd807000000b0042c1ff77242mr10578010qvj.119.1645932543232; Sat, 26
 Feb 2022 19:29:03 -0800 (PST)
MIME-Version: 1.0
References: <20220226200911.230030-1-marijn.suijten@somainline.org> <20220226200911.230030-2-marijn.suijten@somainline.org>
In-Reply-To: <20220226200911.230030-2-marijn.suijten@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 27 Feb 2022 06:28:52 +0300
Message-ID: <CAA8EJppH2AKe7DK7mPhtz2CCW19WdJ0-NJihmFPDswRwTtKcfw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] clk: qcom: Fix sorting of SDX_GCC_65 in Makefile
 and Kconfig
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Vamsi Krishna Lanka <quic_vamslank@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, 27 Feb 2022 at 02:38, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> In order to keep at least the list of `CONFIG_SM_` drivers sorted
> alphabetically, SDX_GCC_65 should have been moved one line up.  This in
> turn makes it easier and cleaner to add the followup SM_DISPCC_6125
> driver in the right place, right before SM_DISPCC_8250.
>
> Fixes: d79afa201328 ("clk: qcom: Add SDX65 GCC support")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/clk/qcom/Kconfig  | 14 +++++++-------
>  drivers/clk/qcom/Makefile |  2 +-
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index f5b54bfc992f..161b257da9ca 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -574,13 +574,6 @@ config SDX_GCC_55
>           Say Y if you want to use peripheral devices such as UART,
>           SPI, I2C, USB, SD/UFS, PCIe etc.
>
> -config SM_CAMCC_8250
> -       tristate "SM8250 Camera Clock Controller"
> -       select SM_GCC_8250
> -       help
> -         Support for the camera clock controller on SM8250 devices.
> -         Say Y if you want to support camera devices and camera functionality.
> -
>  config SDX_GCC_65
>         tristate "SDX65 Global Clock Controller"
>         select QCOM_GDSC
> @@ -589,6 +582,13 @@ config SDX_GCC_65
>           Say Y if you want to use peripheral devices such as UART,
>           SPI, I2C, USB, SD/UFS, PCIe etc.
>
> +config SM_CAMCC_8250
> +       tristate "SM8250 Camera Clock Controller"
> +       select SM_GCC_8250
> +       help
> +         Support for the camera clock controller on SM8250 devices.
> +         Say Y if you want to support camera devices and camera functionality.
> +
>  config SM_DISPCC_8250
>         tristate "SM8150 and SM8250 Display Clock Controller"
>         depends on SM_GCC_8150 || SM_GCC_8250
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index d96d6793fc7d..3e4eb843b8d2 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -84,8 +84,8 @@ obj-$(CONFIG_SDM_GPUCC_845) += gpucc-sdm845.o
>  obj-$(CONFIG_SDM_LPASSCC_845) += lpasscc-sdm845.o
>  obj-$(CONFIG_SDM_VIDEOCC_845) += videocc-sdm845.o
>  obj-$(CONFIG_SDX_GCC_55) += gcc-sdx55.o
> -obj-$(CONFIG_SM_CAMCC_8250) += camcc-sm8250.o
>  obj-$(CONFIG_SDX_GCC_65) += gcc-sdx65.o
> +obj-$(CONFIG_SM_CAMCC_8250) += camcc-sm8250.o
>  obj-$(CONFIG_SM_DISPCC_8250) += dispcc-sm8250.o
>  obj-$(CONFIG_SM_GCC_6115) += gcc-sm6115.o
>  obj-$(CONFIG_SM_GCC_6125) += gcc-sm6125.o
> --
> 2.35.1
>


-- 
With best wishes
Dmitry
