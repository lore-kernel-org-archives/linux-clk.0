Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 953C2EC8739
	for <linux-clk@archiver.kernel.org>; Thu,  7 Sep 2023 15:22:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbjIGPWP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Sep 2023 11:22:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbjIGPVT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Sep 2023 11:21:19 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3077F183
        for <linux-clk@vger.kernel.org>; Thu,  7 Sep 2023 08:21:07 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1c1f7f7151fso8185355ad.1
        for <linux-clk@vger.kernel.org>; Thu, 07 Sep 2023 08:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694100031; x=1694704831; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yMRlMwN20QLTSRPs/jI5d8COnV1IkaL0AH6Bo1uSv5s=;
        b=NjWZm6Um6DHzbhWwWeUaizzLAGcxA/hTVSG1Jrsnfa7mPU/v4+9bRccHR2BaAvUroJ
         XoGb1swPl5lLxNvKTxyBNXMlpO4DTRyeOvdDqR7XxgpFgzQyJoa/dDPRMNm7aJk9hwBU
         0M3q1sfdXJQ3N6HQyesa4vSy8yiYOTMyKJJxgwSbPY3XGe7AXJX9eG2hf9FWiQhx0sII
         mFZOy/7mkgceEH2hZk5xS/X/1lxKa3J7WdYyDqzHrozFhRvkOc+UrK9++Lje/Po5XkYt
         fRtq3JUksrcCu5ro77Je4Up0VhV46eh+E0Owic0UKtTTpDHkuH6k3+Z2xtaQaA8EPBUf
         qqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694100031; x=1694704831;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yMRlMwN20QLTSRPs/jI5d8COnV1IkaL0AH6Bo1uSv5s=;
        b=V+85AjWjBNCilhHWHXgADzeEEItDzTsD2Vv7flkrOaZHpRbbGMJlJMa1glTPf0p+/d
         L4BlcZDtZKrVUalgF40ebHXx/PGO6nVlPnv12NTlMZnx6+8bTgPzcyi5TzGZt/QdqO7I
         Dnb/umrRd8DWjMNPBDArUxo/0vqeIVlbOIR2pcKNPehvUp0bUndxCZ1+ILjfBofXyvIo
         KdGvliXuPzMxpLpAvfYJ/NZFGGOfUEN24V5SIf3JT5Aqs8vsIX/s0jX73PhYGMnkQlau
         YpTA8cgV5EyV6kfyERE7v/LwYZxPzqEoPFVE5JRn+uBy7N286DJmSkaw1WrU0GANDu33
         9qug==
X-Gm-Message-State: AOJu0Yx1JducFDgJOQJXOgQiC9Tz6tU2FH4qkSEms+KHam/qXPIETh5R
        jsMddYFg5jUffrkUrooO1wpgSHJ0DA6dsIcE0dnoEcT3+7dhRKGz
X-Google-Smtp-Source: AGHT+IFUuNXZQLnUGxYZ4nwOIc/1ZCmT/RBxdiDK6aXiF/foDyogFPcREcWU6P3R5YT2nx0jFgg2XzMsNGlNNM2BlgA=
X-Received: by 2002:a25:a1e9:0:b0:d78:35cd:7f5c with SMTP id
 a96-20020a25a1e9000000b00d7835cd7f5cmr19661493ybi.46.1694093927719; Thu, 07
 Sep 2023 06:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693996662.git.quic_varada@quicinc.com> <00a5ca23101df1f8f20bdec03be20af9d39c64d1.1693996662.git.quic_varada@quicinc.com>
In-Reply-To: <00a5ca23101df1f8f20bdec03be20af9d39c64d1.1693996662.git.quic_varada@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 7 Sep 2023 16:38:36 +0300
Message-ID: <CAA8EJpqtXw1ukDZ1hXAc3G7LNDwjcduUdNaPHadfSqCuV3fxbg@mail.gmail.com>
Subject: Re: [PATCH v1 02/10] clk: qcom: apss-ipq-pll: Use stromer plus ops
 for stromer plus pll
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     ilia.lin@kernel.org, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, rafael@kernel.org,
        viresh.kumar@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        quic_kathirav@quicinc.com, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 7 Sept 2023 at 08:22, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> The set rate and determine rate operations are different between
> Stromer and Stromer Plus PLLs. Hence, use stromer plus ops for
> ipq_pll_stromer_plus.
>
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>

Fixes tag?

> ---
>  drivers/clk/qcom/apss-ipq-pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/qcom/apss-ipq-pll.c b/drivers/clk/qcom/apss-ipq-pll.c
> index e170331..18c4ffe 100644
> --- a/drivers/clk/qcom/apss-ipq-pll.c
> +++ b/drivers/clk/qcom/apss-ipq-pll.c
> @@ -68,7 +68,7 @@ static struct clk_alpha_pll ipq_pll_stromer_plus = {
>                                 .fw_name = "xo",
>                         },
>                         .num_parents = 1,
> -                       .ops = &clk_alpha_pll_stromer_ops,
> +                       .ops = &clk_alpha_pll_stromer_plus_ops,
>                 },
>         },
>  };
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
