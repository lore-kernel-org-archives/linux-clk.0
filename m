Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41774C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 21 Jun 2022 17:16:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352055AbiFURQ3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Jun 2022 13:16:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352934AbiFURQ3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Jun 2022 13:16:29 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 997C12AE1A
        for <linux-clk@vger.kernel.org>; Tue, 21 Jun 2022 10:16:28 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id y14so16040560qvs.10
        for <linux-clk@vger.kernel.org>; Tue, 21 Jun 2022 10:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/VXF4wZsajiLZ27XUCezGyggM3iqXR+nz/WtobXbYGw=;
        b=yUCgL5NNh5M/w5/KACbTNIRzgoFojv313dbaWlmPUxm/5wNIzvzoKUW/Hkh9d4itlz
         I6QOCZNTwd3EFPTNZSoq8K/mZOwEanuAzV7b+FhbSY9pkV2yfMowiViZ0P7v96k1yxuX
         t06rGa4bikZGGZTKJvInmFV+ufV5yZ2+pXLKS44UpmEDmecFMEnU/eP/StMz8+uwkabm
         FyY66vyuJFTKB4wents0lhn3hW5G5cmlwfWagq+VM/OK3W/KJrrn0uytiGPfQ1lIFdOz
         SUtwp6Wdu/Y5A1qciJsbfSIQfmy4YmTw9xAJe2gf4a7+hP+DTNZhfXD+WKVElSpym6Eh
         FFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/VXF4wZsajiLZ27XUCezGyggM3iqXR+nz/WtobXbYGw=;
        b=aDSQfXNfuKQ7ouLi4+VZYZDwravg5ddXgUSIvgZDxG+Cmf3bcbvDZwL4pzazNFBjOC
         sfek/g+3ncLzSq0d3U6lPwu9sUJOeDKABNOHZNNXqRI9S9UbfzIq09qAR2pVcdFnTXCB
         aVlwGczr0f2OKm3iJeo/k+TWnlzp6+sZ8mvC85LQIK6lKfsalYZoBQ5uM8m+nb5elNXz
         tS287I1+EDeBBe/iSLhH3MlHWKeVO/KLoZZDKJpQ/Huv/hZhS4ChRwEF2vZTkmQ78nBR
         K+C2lQqsYbRFVLbBcR1LwLP+C6UZP1t6Ovr6BlC3iRUZIdaD1LSRVjd4GqqMSIudh8uZ
         TuTw==
X-Gm-Message-State: AJIora8pzkfge5VzeWhsbNlS3OPwrJ/GvmSuAISgNjSpxqIKb1fblSgy
        0loox3eVlVW4ooGr9+fymXZSjD1rt+McoNz39uvnEw==
X-Google-Smtp-Source: AGRyM1stGSNYjI11WE3KDgYEAFNCPA+04rh0ka7mFyaXhv77wFBY0VQijwcZnC+nsOEZwtvWAJcodjISHbYNuzpY9m4=
X-Received: by 2002:ad4:5b81:0:b0:465:ded8:780 with SMTP id
 1-20020ad45b81000000b00465ded80780mr24148932qvp.119.1655831788201; Tue, 21
 Jun 2022 10:16:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220621163326.16858-1-ansuelsmth@gmail.com>
In-Reply-To: <20220621163326.16858-1-ansuelsmth@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 21 Jun 2022 20:16:17 +0300
Message-ID: <CAA8EJpqew-v5PAsecjppCJ=EbaVejqJrWxpAMM8xpu6Cg_qo0w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: add pcm reset for ipq806x lcc
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 21 Jun 2022 at 19:33, Christian Marangi <ansuelsmth@gmail.com> wrote:
>
> Add pcm reset define for ipq806x lcc.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> ---
> v2:
> - Fix Sob tag
>
>  include/dt-bindings/clock/qcom,lcc-ipq806x.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/dt-bindings/clock/qcom,lcc-ipq806x.h b/include/dt-bindings/clock/qcom,lcc-ipq806x.h
> index 25b92bbf0ab4..e0fb4acf4ba8 100644
> --- a/include/dt-bindings/clock/qcom,lcc-ipq806x.h
> +++ b/include/dt-bindings/clock/qcom,lcc-ipq806x.h
> @@ -19,4 +19,6 @@
>  #define SPDIF_CLK                      10
>  #define AHBIX_CLK                      11
>
> +#define LCC_PCM_RESET                  0
> +
>  #endif
> --
> 2.36.1
>


-- 
With best wishes
Dmitry
