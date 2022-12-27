Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93E6FC4332F
	for <linux-clk@archiver.kernel.org>; Tue, 27 Dec 2022 12:22:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232201AbiL0MVq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Dec 2022 07:21:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbiL0MVW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Dec 2022 07:21:22 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F4040B4A4
        for <linux-clk@vger.kernel.org>; Tue, 27 Dec 2022 04:18:13 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id o127so14211842yba.5
        for <linux-clk@vger.kernel.org>; Tue, 27 Dec 2022 04:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MT35Wy/vgyGsnQSdR3P4BkZLQ4sxrgSNujIQe36ifI4=;
        b=GHlNjtZ1ePZDamd4yQr1QhXhgYvBVOGXYO6WQK3vzD+8bNWX8KMwePtqzetxWSjkna
         zotwJtMSzFIE6KZtzWk/HkNXjtLHGgIaah6XlDWW21iQobfyx2Yd5ZpO+DU6AdvHd6Hf
         qkAqPyjuc0GuFgLw2xFO6ncJu/Ubf4DOGGRtYUatJatt7T9P6daSXN6dSoFzEez0opZA
         1Jeo3JkVN7tT/WVXvfNJsKc2W7no3bYh5OQbcpF5JHf0eSCNlhVo3HURUe++sZzHkRDF
         C+vgjMdF0ozXq4RMdQ/kQ0PUsii38tGeMQSEsTgid6VYuD72QAMGiMRYgMWhMsZktxx4
         9scw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MT35Wy/vgyGsnQSdR3P4BkZLQ4sxrgSNujIQe36ifI4=;
        b=kcQt6zknZGQK69I7m9HIgZK0Y+6L4cFwtfY+inlSxeYRhxRvEwAkAylqNu3WQ6rMnF
         TPSNTga0z/da5Vp8KOfLkM1b+M4e6HwAZpZcYwo5TOTT9N16uucaOeC1pjvgsgsVI+K5
         4YkHTOBy6TpwTqm7fWXwLLZ1RZ+p1SfWY51q4wMeNQC883QsdpUsaiYVR6BN9M+WRLzv
         XAshiJrv9WcnbikVw5bYXhx77YbVOFv7yRzayn/dTOdn7hWi5NSQxsCh5q3N/HOFvOtB
         m2xBeZF3jELxxdANBNeHhd2AJWl5JXUGCKm2pfAgeujUo9a31XgTN47eFJSEDlFGlDFv
         Is7g==
X-Gm-Message-State: AFqh2krKt3+pTI/1HgnkSLnWdcwGCbu1RQSY0oPHo7bPGjTFlMKte/Js
        HNSWX7kjKR/MfJ0xwLwI2hivkwO55SD9XHFKGfh38w==
X-Google-Smtp-Source: AMrXdXt6WexlgjyQ0WqJ/qZOzu56fpjkePyD8ACuFjYqrdT6ADKBN8MgyXd9S6GPUl76lCZMr/d+jXQ8MlDepkFmkI0=
X-Received: by 2002:a25:aa0d:0:b0:76d:bea0:8a05 with SMTP id
 s13-20020a25aa0d000000b0076dbea08a05mr1356971ybi.153.1672143488604; Tue, 27
 Dec 2022 04:18:08 -0800 (PST)
MIME-Version: 1.0
References: <20221227013225.2847382-1-dmitry.baryshkov@linaro.org>
 <20221227013225.2847382-8-dmitry.baryshkov@linaro.org> <b3696a4b-4ddf-9ddf-a096-ccc43f1230a7@linaro.org>
In-Reply-To: <b3696a4b-4ddf-9ddf-a096-ccc43f1230a7@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 27 Dec 2022 14:17:57 +0200
Message-ID: <CAA8EJprLwjE0woynmRsB2yn961Kdt4SpawB8rrk=tTdQPp-srQ@mail.gmail.com>
Subject: Re: [RFC PATCH 07/12] clk: qcom: gcc-apq8084: add GCC_MMSS_GPLL0_CLK_SRC
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
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

On Tue, 27 Dec 2022 at 13:58, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 27.12.2022 02:32, Dmitry Baryshkov wrote:
> > Add the GCC_MMSS_GPLL0_CLK_SRC, the branch clock gating gpll0 clock for
> > the multimedia subsystem.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> I'm thinking whether it would maybe make sense to put 8974
> and 8084 clocks in a single driver.. They seem close to identical.

Unfortunately the bindings are quite different. So even if we pack
both gcc drivers into a single one, we'd still have to cope with
different numeric ids.
The only sensible solution that  I have in mind is to have a common C
file, containing common clock definitions.

>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>
> Konrad
> >  drivers/clk/qcom/gcc-apq8084.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/drivers/clk/qcom/gcc-apq8084.c b/drivers/clk/qcom/gcc-apq8084.c
> > index c26e222c78d4..7085d2ccae49 100644
> > --- a/drivers/clk/qcom/gcc-apq8084.c
> > +++ b/drivers/clk/qcom/gcc-apq8084.c
> > @@ -1382,6 +1382,19 @@ static struct clk_rcg2 usb_hsic_system_clk_src = {
> >       },
> >  };
> >
> > +static struct clk_regmap gcc_mmss_gpll0_clk_src = {
> > +     .enable_reg = 0x1484,
> > +     .enable_mask = BIT(26),
> > +     .hw.init = &(struct clk_init_data){
> > +             .name = "mmss_gpll0_vote",
> > +             .parent_hws = (const struct clk_hw*[]){
> > +                     &gpll0_vote.hw,
> > +             },
> > +             .num_parents = 1,
> > +             .ops = &clk_branch_simple_ops,
> > +     },
> > +};
> > +
> >  static struct clk_branch gcc_bam_dma_ahb_clk = {
> >       .halt_reg = 0x0d44,
> >       .halt_check = BRANCH_HALT_VOTED,
> > @@ -3480,6 +3493,7 @@ static struct clk_regmap *gcc_apq8084_clocks[] = {
> >       [GCC_USB_HSIC_IO_CAL_SLEEP_CLK] = &gcc_usb_hsic_io_cal_sleep_clk.clkr,
> >       [GCC_USB_HSIC_MOCK_UTMI_CLK] = &gcc_usb_hsic_mock_utmi_clk.clkr,
> >       [GCC_USB_HSIC_SYSTEM_CLK] = &gcc_usb_hsic_system_clk.clkr,
> > +     [GCC_MMSS_GPLL0_CLK_SRC] = &gcc_mmss_gpll0_clk_src,
> >  };
> >
> >  static struct gdsc *gcc_apq8084_gdscs[] = {



-- 
With best wishes
Dmitry
