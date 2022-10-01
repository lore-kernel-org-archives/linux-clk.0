Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EB1BC433F5
	for <linux-clk@archiver.kernel.org>; Sat,  1 Oct 2022 06:59:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbiJAG7H (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 1 Oct 2022 02:59:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiJAG7G (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 1 Oct 2022 02:59:06 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 595221A0D25
        for <linux-clk@vger.kernel.org>; Fri, 30 Sep 2022 23:59:05 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id l76so4739807ybl.2
        for <linux-clk@vger.kernel.org>; Fri, 30 Sep 2022 23:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=/17Sp9BcM/K21ZegnhdQ4++78L7Xj9RZxBq1LvHMm0s=;
        b=LL/ZnwIU+6rPgEcoBpLtalknoiI5HIXEFBp31J/zCF5e1oXQMYTYgiV+Ud4WP8XxLS
         pCkR3Fhcb7z8S089SvvAeort1q/IWu32XkRFeomqordIV9LFqHHZqmq0w8B0vdatdm2U
         uAjUs4v78BFpnfl/X06k/LTT4KolLm1H0E6EJbRznF0/TE5frJaL9GAAxE1tnraplvuc
         mjkFPZvNHt90ilVLbXomWsx6vFUQU6t9iR0R+xY8lublmkAim70EddHfxnoDH2hEcLh7
         g8tOTxOYCi1pKtiXK6K+Csqpo20byu2lZeb7cbcifgXlVJCqA3dsCAacNRUpwhcHcHnB
         NF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=/17Sp9BcM/K21ZegnhdQ4++78L7Xj9RZxBq1LvHMm0s=;
        b=n2jLaD54C6jZSrDHLqqWo9Lr2uO/JgGmiE2Oy13hkw8hd1pG3gqsxaKiuq+mPRZzjy
         IZGFNP9N8F5GukerBoWswIovfGJuRTYE8hiDJR7UlSWzoKL8Ppa58op+CP+0HR5CvuiE
         F82CsdCOrhq3D+Byw840JYw07XQWLXelblwcgcg/aG/tYEqBhmzlXZv5TYygWX43anBh
         Pn/V+EiKWY2Tf/Is1zM4Ty91fm4EqNsr5v5GMLltmmwOBs2EZgmR1CNcZ/HyAVqrs4hs
         AEXeBZeFKCCFJsOVpiInW9R64LPfwMTn7kHrqWTcDO+nhV0YBBRI0XRANvLCWWxxbn/Q
         VWdw==
X-Gm-Message-State: ACrzQf3uCiyQ5vF0RAMqGVpqAYktBOADEnluj2l3peW85sV4qKC1zeip
        F71d9KjwMi/tpll1OfSh/Uvqs7fdi5jBaqIniRjn8Q==
X-Google-Smtp-Source: AMsMyM4KvrH0ZWXXGRicwrHKndSMkvbisTW6ycJvZzbQe17GicrRUb8kp0Je4DojuLPvtEZuyfZvph552bkPGEz1OKs=
X-Received: by 2002:a25:af13:0:b0:6ae:3166:1aee with SMTP id
 a19-20020a25af13000000b006ae31661aeemr11281737ybh.288.1664607544566; Fri, 30
 Sep 2022 23:59:04 -0700 (PDT)
MIME-Version: 1.0
References: <20221001030403.27659-1-quic_molvera@quicinc.com> <20221001030403.27659-6-quic_molvera@quicinc.com>
In-Reply-To: <20221001030403.27659-6-quic_molvera@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 1 Oct 2022 09:58:51 +0300
Message-ID: <CAA8EJpof5JFDN978t98JxJgd2e+8VVDkXbexvNegA+2jY+tN=Q@mail.gmail.com>
Subject: Re: [PATCH 5/5] dt-bindings: clock: Introduce pdc bindings for
 QDU1000 and QRU1000
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

On Sat, 1 Oct 2022 at 06:04, Melody Olvera <quic_molvera@quicinc.com> wrote:
>
> Add compatible fields for QDU1000 and QRU1000 pdcs.
>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml      | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
> index b6f56cf5fbe3..5c7b790db7e0 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
> @@ -33,6 +33,8 @@ properties:
>            - qcom,sm8150-pdc
>            - qcom,sm8250-pdc
>            - qcom,sm8350-pdc
> +          - qcom,qdu1000-pdc
> +          - qcom,qru1000-pdc

Alphabetic sorting please. q comes before s.

>        - const: qcom,pdc
>
>    reg:
> --
> 2.37.3
>


-- 
With best wishes
Dmitry
