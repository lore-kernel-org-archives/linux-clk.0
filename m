Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D354C433FE
	for <linux-clk@archiver.kernel.org>; Sat,  1 Oct 2022 07:00:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbiJAHAU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 1 Oct 2022 03:00:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiJAHAQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 1 Oct 2022 03:00:16 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 972BDEE3B
        for <linux-clk@vger.kernel.org>; Sat,  1 Oct 2022 00:00:05 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id c9so7616446ybf.5
        for <linux-clk@vger.kernel.org>; Sat, 01 Oct 2022 00:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=PJKsBdmry9pp/p4qjkmtTRbPY3WNcZCpKNJJCK49xuc=;
        b=l33IBhwzFr8JMiWB6aVikVWjK/TOsxDzaHohFGJCq62lfESb6uWgORm5Nx1+Bplids
         4pKokXzPrVyJm+gL2Rronk7oBJjfiwEo30yo6rYl+njXmSVggA4hqcGLSe8D1hcejipQ
         TByJsrkkzCv78q16bhSgyTRYQI3xsmpbLmZqhb5xlmKVSiZmLv5gjy5Yk43wcIaUPQlQ
         7yLxJGis5H/eMH5opHarreBzyDZCXoNVN4Hj7YMSYao3au3cTNSu41LWwTDkzu56/X83
         nLB4sC4IivKOaLwiRFznZCv7xN/CumrjQnVvEYx2BpD3zEfWfoawwHlY5BaVkCxFl/uH
         OiIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=PJKsBdmry9pp/p4qjkmtTRbPY3WNcZCpKNJJCK49xuc=;
        b=jmhjP2G/eEsUbfQ2uS+qG0dr+IGq/5T4mvIuFi6AvW2NJl2Qx07WxiDfgWpF7G2uRh
         hHo4z4jyY3CVUb2dSCZerIhamE/Xbs9rl46FZVHjExjmhCrO4ATziSrH3+0fgzdUDqtv
         9LWbmkL9WJOmTvIqasythYXEOb0lOzxEHoAUgCwsA9pWadnvS5oaOVkAe3FLkUF75tQD
         MCYrMGyWgJOtwIYKV2OYoPnzTr7zDED1XSAUmWeP4fjs1EUy2Fo+VroQss1z1fhSm+1Z
         4AtD/kL3e0McMhNSMpB32HOhxHYAQ/56AE8egnyBBKdMiOsmCHh8vDPYCflpWrvo99fi
         mxNQ==
X-Gm-Message-State: ACrzQf15FEb/pesfhxn5PbKSTV++GOKxcCwlDtZiBobyvFack9v+elyV
        El2NH6Ow2g0+Ev+wFGKpekNy1eZxR2z+QZA3xT7DQQ==
X-Google-Smtp-Source: AMsMyM5OzN8oBMlFfj9MHDQboYmmjpF5OxhNHqvlAZcsHyutiAbNkTzvP4NCKy0Mi4D0mrNTDILZrjjl2MWl2AJhDiA=
X-Received: by 2002:a25:a502:0:b0:6bc:2835:a88a with SMTP id
 h2-20020a25a502000000b006bc2835a88amr11254803ybi.15.1664607604880; Sat, 01
 Oct 2022 00:00:04 -0700 (PDT)
MIME-Version: 1.0
References: <20221001030403.27659-1-quic_molvera@quicinc.com> <20221001030403.27659-3-quic_molvera@quicinc.com>
In-Reply-To: <20221001030403.27659-3-quic_molvera@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 1 Oct 2022 09:59:34 +0300
Message-ID: <CAA8EJpr2ZnEC3=WMns8AGNY1DwARM9xnadtaBkzctOyNLv3=Zg@mail.gmail.com>
Subject: Re: [PATCH 2/5] dt-bindings: clock: Add RPMHCC bindings for QDU1000
 and QRU1000
To:     Melody Olvera <quic_molvera@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, 1 Oct 2022 at 06:05, Melody Olvera <quic_molvera@quicinc.com> wrote:
>
> Add compatible strings for RPMHCC for QDU1000 and QRU1000.
>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> index 8fcaf418f84a..d613156eadb0 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> @@ -29,6 +29,8 @@ properties:
>        - qcom,sm8250-rpmh-clk
>        - qcom,sm8350-rpmh-clk
>        - qcom,sm8450-rpmh-clk
> +      - qcom,qdu1000-rpmh-clk
> +      - qcom,qru1000-rpmh-clk

Alphabetic sorting please. Q comes before s.

>
>    clocks:
>      maxItems: 1
> --
> 2.37.3
>


-- 
With best wishes
Dmitry
