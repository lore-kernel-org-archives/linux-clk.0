Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80CACCCA47C
	for <linux-clk@archiver.kernel.org>; Mon, 20 Jun 2022 11:25:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241198AbiFTLZa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Jun 2022 07:25:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240227AbiFTLZ3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Jun 2022 07:25:29 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D80A15FE5
        for <linux-clk@vger.kernel.org>; Mon, 20 Jun 2022 04:25:28 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id t16so10423000qvh.1
        for <linux-clk@vger.kernel.org>; Mon, 20 Jun 2022 04:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5QXZowmyjbre5HBlPw3yqu+8qdh4czis+s/CTNbxfBk=;
        b=mQafKe2Tm9xdswCmldeqcHt1fjBKl9ptnU71Xm/Rw84HrhNZNF80DuTq36zf94ZtJo
         vE07HJ54i72Y9d7NQlxK3V2abLQKr1LyFEAlI1pdFcY3eCwzYer4t32WtdsTBlaDBbJA
         DfzVE9A5eog4x+xrXoZMLVFhD4cE0m9BWJRQsY5V+/F12TmIl8e+EEQstY+glIOBU/zZ
         QcKkI+ORgju03rBX1DDFesHusTYlksgZD4JgJeehdROl2ECH52t8s/gzg71QpuzVHfyR
         iOdANIXfUKG3y3+5QliefCmhczpr1+qs0Ex+fsNFfVHYIvA4aQIva+D81L6qk+bGvGj0
         VHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5QXZowmyjbre5HBlPw3yqu+8qdh4czis+s/CTNbxfBk=;
        b=dka34WjjHZD7wzA6SRzGfcmLJt43PVgkxT178sPhyXbvhYSkZ0FNlSrPepI7wOdWmC
         +YqC1/v8a6/ltoKxSe7ERMYoWA5G+0CoUwug9ghxVE9scAELaOfEMLlA0hES6Q4fTVMB
         nN9lYLunYmdlo8UTtC+Sp8ylCs2+YTDp5ANEU6LP9LEcQ9520fDNdxTP0pMU+sPAeVtS
         sBN/DjOaWNzAwfYBNAygeinlzLdNlfl1rz6Uimy3PWfuf4WVsvX8Z3x5zRVD2sS5QG6W
         MFwmXThAOEdkL7FQ+ieysbUN5VvOzsRAd9D34Ed/hN3EecTtX9Z//V3s161yEX6QU31g
         pQoA==
X-Gm-Message-State: AJIora9uuhoc+S+IvMpxB3LmhdogH/rfIGulrNCF/TNwKNHPKwKOonIo
        YKJn0sO5WSqUncxkAdtK3XLPw35rZXWs22ARHSC6Aw==
X-Google-Smtp-Source: AGRyM1vQQ/H5C3sjvm2Eix6rA9rAxd2onuNFPRmD6ek/uCZhHOyx6DbTyq3GL/pzz23MuJhfJ7hBe3R9FBy/Q7nxuME=
X-Received: by 2002:ad4:5aa4:0:b0:465:2b11:cfd with SMTP id
 u4-20020ad45aa4000000b004652b110cfdmr18934135qvg.55.1655724327833; Mon, 20
 Jun 2022 04:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220620110739.1598514-1-dmitry.baryshkov@linaro.org>
 <20220620110739.1598514-4-dmitry.baryshkov@linaro.org> <d80d2148-cfc2-8f48-56d5-71f4aae03cb6@linaro.org>
In-Reply-To: <d80d2148-cfc2-8f48-56d5-71f4aae03cb6@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 20 Jun 2022 14:25:16 +0300
Message-ID: <CAA8EJpqp92_SOKyU+AjckKC53pDB-i4wsrYx01BySOWNhUaJsA@mail.gmail.com>
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8660: add pxo/cxo clocks to the
 GCC node
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

On Mon, 20 Jun 2022 at 14:17, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 20/06/2022 13:07, Dmitry Baryshkov wrote:
> > Add pxo/cxo clocks to the GCC device tree node.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm/boot/dts/qcom-msm8660.dtsi | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
> > index 47b97daecef1..61e3ab0ebfd3 100644
> > --- a/arch/arm/boot/dts/qcom-msm8660.dtsi
> > +++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
> > @@ -50,13 +50,13 @@ cpu-pmu {
> >       };
> >
> >       clocks {
> > -             cxo_board {
> > +             cxo_board: cxo_board {
>
> If you touch this line, please correct the naming for node - no
> underscores and preferred some prefix or suffix, so:
> cxo-board-clk
> clk-cxo-board

Unfortunately, I don't think it's possible. We are bound by backwards
compatibility. Node name is used as a clock name. And other drivers
might reference the clock using the name. Thus, if you check other DT
files, we also have similar clock node names.

> >                       compatible = "fixed-clock";
> >                       #clock-cells = <0>;
> >                       clock-frequency = <19200000>;
> >               };
> >
> > -             pxo_board {
> > +             pxo_board: pxo_board {
>
> The same
>
> >                       compatible = "fixed-clock";
> >                       #clock-cells = <0>;
> >                       clock-frequency = <27000000>;

-- 
With best wishes
Dmitry
