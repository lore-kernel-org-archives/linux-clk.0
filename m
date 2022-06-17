Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61753C43334
	for <linux-clk@archiver.kernel.org>; Fri, 17 Jun 2022 20:38:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380988AbiFQUiT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Jun 2022 16:38:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383451AbiFQUhv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Jun 2022 16:37:51 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6579062CDC
        for <linux-clk@vger.kernel.org>; Fri, 17 Jun 2022 13:34:54 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id 43so8063311qvb.3
        for <linux-clk@vger.kernel.org>; Fri, 17 Jun 2022 13:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WGHL7WjNLqD3YEDXO1vrsqgtsGl62CAfBugSKIsxPxU=;
        b=cv2r4yXkHLvtqCXoPhTFcG1riYBBF5Kc9CwQxrBxiOqHHo1j2zt96Z+UPpK/d0vYjT
         QAKszsSLwTOvcHDnf8kSUe4XAWy7MHdHeLhBv7n83WyTsivH7mvGi8V5MFaNxRB0ZCpe
         0695dC3x1z/Y8Qwk90ZzRmtKbyg8bD4E7jmkAtpoZBEhHUv0jx6zVzUznJiC3CLZlIqb
         7UPNh+xGdNmiYkaqJVB3W8prl6jYY4Y+HrYQGwVjTxLJkPnfpIDJqCK4QHhjs+nqtn0N
         fo8LQUk3cAjTPtnMqbImMaIIRo5lUIIlX5ddqCcyWiFQ9efSaPh29wGfoCBmRlm4mEuN
         1WTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WGHL7WjNLqD3YEDXO1vrsqgtsGl62CAfBugSKIsxPxU=;
        b=LasNAz3podOqTFbP7Zoi0i47AHaUDEZI92gIHSozmtBdX1qM8VIjOR9AXDR0C9emMD
         JW2IAP6l5UlM1pQ2u+IcbMbj98EzCXm6Iipg3Iv2Iqjjy1UotIF8wY7XjZbAw1CB4ndi
         BejyUuExkxA/7g+ZbCP49Jp3cFckMaVChjv3iBGyvqUiu0AkikHdF8gSAH+NcPxulXxh
         FZyqcGftZ11cvusirQlBJnXq2LZOvOI665g79Xepe9LKjxJ1THc3ewAKQ9MxvLLHL6PR
         iTLWohlfMDjHhoS/CvUgvGKVL7RqCV8pZF8OhDfH271rPS8XpWzWeAaAR6joLe4eJQuS
         6YUA==
X-Gm-Message-State: AJIora9jBoqGUgddy8+3f7hgOptImnsPFEtqJmdN4uf0dH5f/rm5Neje
        NLV02CVgGl1lfFiJYmj4Kn2PpjtC4VAK610eZaL3pA==
X-Google-Smtp-Source: AGRyM1v1dl9Ik0o1hcC8TstCh11I+Up1jTnlCPJuDlc0Pv5THsRcNLs3/HX/N2TDNDkhjKWfpAIeQ5ODqcdIrs8eZZk=
X-Received: by 2002:a05:622a:487:b0:304:fbfc:9933 with SMTP id
 p7-20020a05622a048700b00304fbfc9933mr10445999qtx.682.1655498075238; Fri, 17
 Jun 2022 13:34:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220617144714.817765-1-dmitry.baryshkov@linaro.org>
 <20220617144714.817765-8-dmitry.baryshkov@linaro.org> <Yqy2YHpl93kEQRYU@gerhold.net>
In-Reply-To: <Yqy2YHpl93kEQRYU@gerhold.net>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 17 Jun 2022 23:34:24 +0300
Message-ID: <CAA8EJpozu6PoWC-kOpFB9OSZLVZaZt6ZkUpYo=bOr0zhErkWqA@mail.gmail.com>
Subject: Re: [PATCH 7/7] arm64: dts: qcom: msm8916: add clocks to the GCC
 device node
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 17 Jun 2022 at 20:14, Stephan Gerhold <stephan@gerhold.net> wrote:
>
> Hi Dmitry,
>
> Thanks for cleaning up MSM8916! :)
>
> On Fri, Jun 17, 2022 at 05:47:14PM +0300, Dmitry Baryshkov wrote:
> > As we are converting this platform to use DT clock bindings, add clocks
> > and clock-names properties to the MMCC device tree node.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/msm8916.dtsi | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > index 05472510e29d..e905415b3456 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > @@ -934,6 +934,20 @@ gcc: clock-controller@1800000 {
> >                       #reset-cells = <1>;
> >                       #power-domain-cells = <1>;
> >                       reg = <0x01800000 0x80000>;
> > +                     clocks = <&rpmcc RPM_SMD_BB_CLK1_PIN>,
>
> This should be <&xo_board> to avoid functional changes.

Ack, thanks for the suggestion.

>
> If we want to change this to the actual votable clock later this should
> probably be <&rpmcc RPM_SMD_XO_CLK_SRC>. AFAIK that clock exists in RPM
> on MSM8916 but was never added to the clk-smd-rpm driver (for MSM8916).
>
> Not sure where the pin-controlled BB_CLK1 is coming from here. :)

It came from the schematics I had at hand (db410c). It uses the
BB_CLK1 together with the enable pin. I'll probably use xo_board for
now and postpone changing this to rpmcc clock until the next attempt
to read msm-3.x code.

-- 
With best wishes
Dmitry
