Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E3B7C433EF
	for <linux-clk@archiver.kernel.org>; Sat, 18 Jun 2022 13:11:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbiFRNLI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 18 Jun 2022 09:11:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbiFRNLI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 18 Jun 2022 09:11:08 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD50A175BD
        for <linux-clk@vger.kernel.org>; Sat, 18 Jun 2022 06:11:04 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id a184so4951135qkg.5
        for <linux-clk@vger.kernel.org>; Sat, 18 Jun 2022 06:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wquY7m+5u8zDvkgq8g44qdh5YB1CQChX80XVZX2MZ80=;
        b=y8/TAgYKS+Q5inWVBs2qbDR8MhtvK4bYbt0oMqYXbnfgxJmfrtnJpq2hPuYuxTjZwG
         IGgS0lUwm9xIx+rluQP8w4JAFzcj66osBUWz9vMZK0NX/1fNJPI2/wxUCjit8uHIXKaJ
         L9EuFJKZiOB5WpXR9JXxjYWTGvoUvTDiqvZZVUz9ks/SyoYQnCBc835CXwQI2w3lNkwm
         7ezsyhwCxuypfjvqtgO47BxBo9HfARyHhIs4NTkHwwr+EDZ9KU+15WcmcJ7vI/h5kIhH
         S1GyCoEJHWI2bxsfU+1orNDRdiaG/sZDwhzn3CjfLnnxNXadtgdO1k2WBa9C1HgkgzzR
         VVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wquY7m+5u8zDvkgq8g44qdh5YB1CQChX80XVZX2MZ80=;
        b=JM6naMhXWAIIFA3ixTR/vE7mA8u5Qw8qT7LLe1TL53YXwV/A+211+cCbU3bJbfdBh8
         aoRNGgzHRjUiM/uNomt65K8SAQkZXk/twrrv/PKqGYbCDGwuHveDOOdbiud4vOy7l2H1
         8qCFhMoL38yYhAE/NG6/Sw6lxZ/fkDFxwmlDm47R1QGNf5tCL0l64yrKl9uwuilxiiM9
         3QYW5Y9VFhENsQ9HsBiqPkQDG1YwkUdHQR/I4hlwOhHVLIY5EpIQiDn31gx/XmaHxa2o
         DgE1fUmKPK1zMjdx2yISi9Fdv4w2ZBv+1X9QKadDQXHncScKMVzraHTdyO0xPPh8H3JJ
         6ZTQ==
X-Gm-Message-State: AJIora+ICMEeHoxMKqFXgeZ/LYmL/cvL5xs4+FmxGSi04j2kI6c9DFVs
        P3pdjiyxNV6wumbGXHWet7jOSsrBPvxL8MCgQdg5Yg==
X-Google-Smtp-Source: AGRyM1uGZlGNgP9v6/NOxAXr3c9+0O1rleQKWgObtCmYBXh2b+WfMrw9eplCBeMl7qB7irZGPnqWSZKagEMtatzc/Xg=
X-Received: by 2002:a37:a83:0:b0:6a6:7e4d:41dc with SMTP id
 125-20020a370a83000000b006a67e4d41dcmr10567239qkk.59.1655557863865; Sat, 18
 Jun 2022 06:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220617144714.817765-1-dmitry.baryshkov@linaro.org>
 <20220617144714.817765-8-dmitry.baryshkov@linaro.org> <Yqy2YHpl93kEQRYU@gerhold.net>
 <CAA8EJpozu6PoWC-kOpFB9OSZLVZaZt6ZkUpYo=bOr0zhErkWqA@mail.gmail.com> <Yq3MzJ58d0fbsb3L@gerhold.net>
In-Reply-To: <Yq3MzJ58d0fbsb3L@gerhold.net>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 18 Jun 2022 16:10:52 +0300
Message-ID: <CAA8EJpqeCqD32QioE8SHR=D0acA6FGGTtQ0qRtGp4FDTv5bD7A@mail.gmail.com>
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

On Sat, 18 Jun 2022 at 16:02, Stephan Gerhold <stephan@gerhold.net> wrote:
>
> On Fri, Jun 17, 2022 at 11:34:24PM +0300, Dmitry Baryshkov wrote:
> > On Fri, 17 Jun 2022 at 20:14, Stephan Gerhold <stephan@gerhold.net> wrote:
> > >
> > > If we want to change this to the actual votable clock later this should
> > > probably be <&rpmcc RPM_SMD_XO_CLK_SRC>. AFAIK that clock exists in RPM
> > > on MSM8916 but was never added to the clk-smd-rpm driver (for MSM8916).
> > >
> > > Not sure where the pin-controlled BB_CLK1 is coming from here. :)
> >
> > It came from the schematics I had at hand (db410c). It uses the
> > BB_CLK1 together with the enable pin. I'll probably use xo_board for
> > now and postpone changing this to rpmcc clock until the next attempt
> > to read msm-3.x code.
> >
>
> Hmm, you're right - BB_CLK1 goes to CXO on most MSM8916+PM8916 devices.
> I think the msm-3.10 kernel still controls it via the RPM_SMD_XO_CLK_SRC
> though. Quite confusing. :)

I will take a look. Thank you for noticing this.

-- 
With best wishes
Dmitry
