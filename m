Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B54C7EE22
	for <linux-clk@archiver.kernel.org>; Wed,  3 May 2023 13:20:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbjECNU5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 May 2023 09:20:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbjECNU4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 May 2023 09:20:56 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BE9E4EEC
        for <linux-clk@vger.kernel.org>; Wed,  3 May 2023 06:20:55 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-b9d8e8898eeso7352834276.1
        for <linux-clk@vger.kernel.org>; Wed, 03 May 2023 06:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683120054; x=1685712054;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g8H4m7MGt+su7+10/lYMCAl9QOLw46q6hdO8dx63EUE=;
        b=t79OfBudepsK/zR0nsck2S922UOg3QnaVq7cGtaeCh19/1eypPx8TN0PrGMpM275kk
         hBPFQWL0ueU83m3sKaAt65NMuQMESP4Gi2pmw+jDiYD7Rm/O7EN7BYlaPziMZbmF60hU
         IpBehTj/eKIEki99cNEAlxHTtQVJpEB4NMVU9DfuozAwkm+HtgtkbDJNVKBedGASjSNW
         9HVT+nmmDNB9giCew2HMxzAIFjOIU6nRJ0xK5Z3QqvhlobJFzm/HJwbIWXXzDS1+YYts
         PTs7ZnyJM5vZHnciRuIKxuOfyWje7kORsI6AGlQIj7p42ZzC+T0qOyojaRqCXUtCjSth
         3SGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683120054; x=1685712054;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g8H4m7MGt+su7+10/lYMCAl9QOLw46q6hdO8dx63EUE=;
        b=L1zVWRF4fYXIWnztNWTojwGLIRUrWgO1BID68XIAFatxquhRexWKl6KwnO4MBp66CX
         M+wsjDoD1l0awYDP7bsln4QO9M9HmwQ8CMlSxjElLgJlJVngyUprL785MHhFvu/5DCZO
         MMMSrc1mTdhYSoGsUDiWMjOMUg/enpPzwgva4JXJUDhuMQ8A2jtZJwrAl+O0XlHCr9Fh
         vbwVfj2aqIfOZxSxsZPONvRANaoGUAVEvXfxcOLB42VBfS6RKn8CS2SbMVdthhKbxXM9
         s3nYunW0mkptNwh7RLWG7r9cPMARoIliZ0B7xFTxeqlJZCrF8Fco6kssVXyQ7frt65AQ
         jlwA==
X-Gm-Message-State: AC+VfDyu7NB2wAw+IrV1NFoO+uYD1bovdgiNI5ve/ylr7Vj/AzvaPmL/
        U5otujUvcCkXvwHNGUQwecRFosG5cIp11qa7Siz6YXoEzDIZP7kF
X-Google-Smtp-Source: ACHHUZ4hnho8a+7ZQDOULz2pcCX6NP+k11dkc37fRvtjWdRRI9WPq0fbqIPAZT+WzaIkLo9wnSpXF+lwQy0Zy9MQkSQ=
X-Received: by 2002:a81:7757:0:b0:55a:105e:1a1 with SMTP id
 s84-20020a817757000000b0055a105e01a1mr13518998ywc.13.1683120054659; Wed, 03
 May 2023 06:20:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230503130051.144708-1-y.oudjana@protonmail.com> <20230503130051.144708-3-y.oudjana@protonmail.com>
In-Reply-To: <20230503130051.144708-3-y.oudjana@protonmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 3 May 2023 16:20:43 +0300
Message-ID: <CAA8EJpoYT7WhG5MPMyXFESNoRZs5U=KyYw-k4A2de2CEnLntcg@mail.gmail.com>
Subject: Re: [PATCH RESEND 2/3] arm64: dts: qcom: msm8996pro: Add CBF scaling support
To:     Yassine Oudjana <yassine.oudjana@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 3 May 2023 at 16:02, Yassine Oudjana <yassine.oudjana@gmail.com> wrote:
>
> From: Yassine Oudjana <y.oudjana@protonmail.com>
>
> Add opp-peak-kBps to CPU OPPs to allow for CBF scaling, and change the
> CBF compatible to reflect the difference between it and the one on MSM8996.
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8996pro.dtsi | 51 ++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
