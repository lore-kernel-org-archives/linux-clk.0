Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78806C00140
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jul 2022 16:48:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239539AbiGZQso (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Jul 2022 12:48:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239481AbiGZQsf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Jul 2022 12:48:35 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5343D26123
        for <linux-clk@vger.kernel.org>; Tue, 26 Jul 2022 09:48:34 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id u12so10880765qtk.0
        for <linux-clk@vger.kernel.org>; Tue, 26 Jul 2022 09:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d55skeM4MmgFUfCiTeEJDFYaJC6xKxNo35w6mzrGP+g=;
        b=n4MuAymIchLUx8QBvL/QTx5QA+6PfOFPGtNIfUovn6s/J5vSbT0dvLKZW0tLLBpduP
         js6ZX+YETo/VZfDb2pAk7RltO8k2PfdyRMI9kk+VlhJuQ7CmoPyYObfcQHPlhDoZvuu0
         9QNXMyfHTQ4khY6+x1o5iRMZz31leW4a/6NUcabCAvfprfhrH7TT+uOi41mQTrMtQWxb
         p69OPQ+uJhORMetG3s/8PGz102CAkopUY/Q1CZNO6QZ8GFhLP/XhQ2nVqnQleFlSjRjk
         Hd5KQU3tcqJJvr8G4kfRQ2tTPErfbnsvdLeBgZmhmyjX4Mzn40cMKdOMI2WG3r4Vs3Yl
         odwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d55skeM4MmgFUfCiTeEJDFYaJC6xKxNo35w6mzrGP+g=;
        b=EjfNxcFKkyTISiuw6VdSFrt2HEqqR4qvxB0pCI7Cn+dVtc76ncExE6UMfNlP72dA8Y
         1BtYqF3/zrSooQGuTxyZ9cwFKZD6rVyZubJ2XzvWlvHr3OSwhzQgbDKbAfKOE4gy9xyo
         jhkPgDiiC2AoeAd0F70CKys0pKDkbzGFkzC+tfOUmWpge7ysWCyOBRsFKr5bHNC7zFYH
         cdegyLtqk/gOomw4eI28K+Vn7vYSLP1bM5EkqoF2cb150nCinG5LxGFdXWDzPhEgSbSu
         fXNJBx/qenideo1BvcGbvkjS8TGRx3NqIHwbgNHUM2VuzzkOLcmh+0sWzyNlecJWka+J
         QZGA==
X-Gm-Message-State: AJIora8I+NfVyUn2j4j6SX4xtOZx33kjU1je8zTGiIwYbKa6oHuzpZz9
        tuLm4okaIjy6e4rKRPqwlNDUiHJQkN3ywjP6PqaX5A==
X-Google-Smtp-Source: AGRyM1vhmuv0mCM1ZrW2Y1qJDJZKsI+4TTGB5uIo187UYnvAsIDZEXwmWK+76gXk1LuuYBOyqcsIh+2CkUGr1lb+rIU=
X-Received: by 2002:a05:622a:178a:b0:31e:f9ff:c685 with SMTP id
 s10-20020a05622a178a00b0031ef9ffc685mr15655785qtk.62.1658854113483; Tue, 26
 Jul 2022 09:48:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220726142303.4126434-1-abel.vesa@linaro.org> <20220726142303.4126434-7-abel.vesa@linaro.org>
In-Reply-To: <20220726142303.4126434-7-abel.vesa@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 26 Jul 2022 19:48:22 +0300
Message-ID: <CAA8EJpoGkC44wM8ZQnEtQ29YjOr_ALN2kHDSL793TKE4a080cA@mail.gmail.com>
Subject: Re: [RFC 6/9] clk: qcom: common: Add macro wrapper for all clock types
To:     Abel Vesa <abel.vesa@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 26 Jul 2022 at 17:23, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> Add a generic macro that uses the clk_type to figure out which
> clock type specific macro to call.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/clk/qcom/common.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
> index 9c8f7b798d9f..475febd19dba 100644
> --- a/drivers/clk/qcom/common.h
> +++ b/drivers/clk/qcom/common.h
> @@ -19,6 +19,9 @@ struct clk_hw;
>  #define PLL_VOTE_FSM_ENA       BIT(20)
>  #define PLL_VOTE_FSM_RESET     BIT(21)
>
> +#define DEFINE_QCOM_CC_CLK(clk_type, ...)      \
> +       DEFINE_QCOM_CC_CLK_##clk_type(__VA_ARGS__)

Please drop this macro. It would make extremely hard to follow the
definitions. Without it I can just jump-tag to follow the
DEFINE_QCOM_CC_CLK_RCG2_SHARED_SOMETHING_EXTRA. With this macro in
place there would be no way to do this.

-- 
With best wishes
Dmitry
