Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB3AEB64DA
	for <linux-clk@archiver.kernel.org>; Wed, 12 Jul 2023 14:16:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233313AbjGLOQC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Jul 2023 10:16:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233289AbjGLOQB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Jul 2023 10:16:01 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 520871739
        for <linux-clk@vger.kernel.org>; Wed, 12 Jul 2023 07:15:59 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-c5ffb6cda23so7808449276.0
        for <linux-clk@vger.kernel.org>; Wed, 12 Jul 2023 07:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689171358; x=1691763358;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rtJ0JCAMmm0LZRc8yotvw33nVmFMyiP4jxZwS9BYrKs=;
        b=DfNLhDuSPRDQZfvG6PecJ8KNkztobYnqEwi9YZxN03DYxQBVzn8foN8f7/Zz+ZXKnh
         bxN3TwP6UfcAuL+TxOf228rjcViXl6baRGEh8IJoZKA0LUK3g/2UjobqzoAkkoSl1E1l
         UGQYqoKPYhdR6Tgtuhh31zhQpNplWCEXGdCINfKxFjI6RstiGWNJdaQ5dorX9zJ6vUl0
         7reqlbfKwpqZkQQSLZek71QenzS0m2C7Z3u/ukszgWAF+Lbt0pGWjGIpyC/XC7D43wTv
         GRyFRuWKAsid0Xq034zOpAdQ7koox1GREvBTTfj7YZqSLkhm6M5MAsDke1UwMSN0Gg8b
         aqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689171358; x=1691763358;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rtJ0JCAMmm0LZRc8yotvw33nVmFMyiP4jxZwS9BYrKs=;
        b=CIdDhNH4Nf7e+0Vb6ZlBbcK4QihkzeuYzyRfkzr6vRZVqfF0RLtuGJoiCVlHHniT6X
         vmF2bSvmOGPUvxf6ilqbw57g3wNqtiOp5DsO7zsjqGJaljSS9AZ4O7GZ8B6REuqxsNp6
         tK5xuh4nMi8AZB9fSx/7t/gfVCOhVwYy49LL3Pru6i08WyjDCk3/+awtT1TGtYorK2ZC
         HBYoLb9N5Odry/SaYlBCqj0mwtXF2SH7FR6/18U7QscOAaPqTpCUhOba+DbGxl+EC1bX
         x/N1O3wx3HeMZ6FCqGx7iSiNj+ZAsgNc1eoBKRMenpwE2EKidUF4pions/WCdVf9v5St
         AM7A==
X-Gm-Message-State: ABy/qLZGFfftLS7Jpymo84TS4uEekI2MzPK/A/9xaxawsrLOvWw39A4x
        ehJyrSctUHa6qokZGiTaIkcI+q3PNJUwIA1Rm2rrtA==
X-Google-Smtp-Source: APBJJlFJUb/gSYa9ONJ3QWGtgk9HEr6LtpVBvFeauDyBKu8n59z+Y2lf0u5pfwq39/QZ/JUqk+SKlkzjSPPSRL/7aUM=
X-Received: by 2002:a5b:54f:0:b0:ba8:6530:d561 with SMTP id
 r15-20020a5b054f000000b00ba86530d561mr15360987ybp.30.1689171358470; Wed, 12
 Jul 2023 07:15:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230712014812.3337992-1-quic_skakitap@quicinc.com>
In-Reply-To: <20230712014812.3337992-1-quic_skakitap@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 12 Jul 2023 17:15:47 +0300
Message-ID: <CAA8EJpqvUH4vhqGsnfKSzbV0xLV70GYuJwdejxQNN37XG68Oww@mail.gmail.com>
Subject: Re: [RESEND] clk: qcom: rcg: Update rcg configuration before enabling it
To:     Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 12 Jul 2023 at 04:49, Satya Priya Kakitapalli
<quic_skakitap@quicinc.com> wrote:
>
> From: Taniya Das <quic_tdas@quicinc.com>
>
> If rcg is in disabled state when clk_rcg2_shared_set_rate is called, the
> new configuration is written to the configuration register but it won't be
> effective in h/w yet because update bit won't be set if rcg is in disabled
> state. Since the new configuration is not yet updated in h/w, dirty bit of
> configuration register will be set in such case. Clear the dirty bit and
> update the rcg to proper new configuration by setting the update bit before
> enabling the rcg.
>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>

I think there should be your S-o-B too, as you are resending this patch.

Next, should there be any Fixes tags? Probably this is a fix for 703db1f5da1e ?

> ---
> Resending this patch as there is no review for 2 months.
>
>  drivers/clk/qcom/clk-rcg2.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index e22baf3a7112..b25635feb617 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -982,7 +982,13 @@ static int clk_rcg2_set_force_enable(struct clk_hw *hw)
>  {
>         struct clk_rcg2 *rcg = to_clk_rcg2(hw);
>         const char *name = clk_hw_get_name(hw);
> -       int ret, count;
> +       int ret, count, val;
> +
> +       if (!__clk_is_enabled(hw->clk)) {

There is clk_hw_is_enabled(). Can you consider using it instead?

Also, I'd like to point out the traditional source of controversy,
confusion and troubles. The clk_rcg2_shared_ops does not have the
is_enabled callback. Will this code work as expected in this case?

> +               regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CMD_REG, &val);
> +               if (val & CMD_DIRTY_CFG)
> +                       update_config(rcg);
> +       }
>
>         ret = regmap_update_bits(rcg->clkr.regmap, rcg->cmd_rcgr + CMD_REG,
>                                  CMD_ROOT_EN, CMD_ROOT_EN);
> --
> 2.25.1
>


-- 
With best wishes
Dmitry
