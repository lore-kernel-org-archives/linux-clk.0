Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 824D9C04FDE
	for <linux-clk@archiver.kernel.org>; Fri,  9 Dec 2022 17:07:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbiLIRHo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Dec 2022 12:07:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbiLIRHG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Dec 2022 12:07:06 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFB93A386F
        for <linux-clk@vger.kernel.org>; Fri,  9 Dec 2022 09:05:37 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id s11so6246373ybe.2
        for <linux-clk@vger.kernel.org>; Fri, 09 Dec 2022 09:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m/9lqzL8oZxDL1569exX5YdO2wK0A/N3Nq2LidbPWQo=;
        b=O2sgNTTpu4+f1z7RaiuywBXHznwKn7oohJ0SsYKciDvJdgz1KByoN+lG65QlQ65EyY
         DnHrPpFnJKtPBoghXu/fMSEWXgaiHpQHTDZLp8EjdKBTVbO5FAtnb+tTEaZWFskrxdI5
         ozFDtWHnzmpO5E7PDdpMmvI0ejkmo6OLd84mpLmuCCYcSrrGSPVaHUgxHSOg4Zj4GpbN
         3kl7jpwez0Q876GntLKTAC+hoDA1hlu/EBmGuCJ04d/MGHcq2zQHuTsW7axepMurTbDT
         1Ui4RhK/5RAh3eLGG6NcZ88Z9oQWEe3rQa5j+R5Tu920AZuCIGpys2nbR1s314W1ovYP
         ch1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m/9lqzL8oZxDL1569exX5YdO2wK0A/N3Nq2LidbPWQo=;
        b=E03FQXiK9lIOxl/f14WnXnvckmjTptlvKx7UPPux+OggeCrWiC0gC4Sibc11cPC9tJ
         5ykTyCdp7q88wmU3Uc3v0QcrG0cHxdG6tms2Y2evRnd1WJQVPmizzQGYsDuxj/DQV3UJ
         OVTFeaDI2w0pZJoL8citciK/0b5zDY5vW4kSx3K8AdlZY58cdKcMv37ygvPZnFLcUGML
         GSmpAsZXKMuEUGraY21F0wo14CGG21TaDUD6K9RDMrhrUqW+nVpt02UVV49fq+xXIv0I
         d32eAvM9dsZ+xqy9QUySmYCWGxa4g4NE1mSKS4KpManU0i6KOi298oiQYQQee8hw9Nlp
         2Acg==
X-Gm-Message-State: ANoB5pmO0gVt+pGL7jIAyd+jpORmDElaxsTsJM5gTPK67PZHcU+WeXdv
        atZOiMlEjFIeZxT6o2Jglyp3gZUF3hXBzskkjrda8g==
X-Google-Smtp-Source: AA0mqf4s3Mtnfz9NzdoiqJVnGJFq75/XQF89HCf1bEvEfT/pCCTHt8Es+waUQ1GO55xwHc+7yR6TVMny+DZWGbLBrrA=
X-Received: by 2002:a5b:e8e:0:b0:712:faac:e6b2 with SMTP id
 z14-20020a5b0e8e000000b00712faace6b2mr1649056ybr.632.1670605536934; Fri, 09
 Dec 2022 09:05:36 -0800 (PST)
MIME-Version: 1.0
References: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
 <20221207001503.93790-3-dmitry.baryshkov@linaro.org> <74af29ba-0eaa-0c20-ea66-c5636162aaaf@linaro.org>
 <CAA8EJpo7+h34YCBc4+vBi22eNNO7xAa8FhwjHkU-4ZvcZx-tvA@mail.gmail.com>
In-Reply-To: <CAA8EJpo7+h34YCBc4+vBi22eNNO7xAa8FhwjHkU-4ZvcZx-tvA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date:   Fri, 9 Dec 2022 18:05:25 +0100
Message-ID: <CAGE=qrpdcBM-s5yx7P4B+QcSsNxvjZZBswymr6Rx3hZA+YtR5w@mail.gmail.com>
Subject: Re: [PATCH v2 02/18] clk: qcom: smd-rpm: enable pin-controlled
 ln_bb_clk clocks on qcs404
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 9 Dec 2022 at 17:28, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, 9 Dec 2022 at 18:14, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > On 07/12/2022 01:14, Dmitry Baryshkov wrote:
> > > The commit eaeee28db289 ("clk: qcom: smd: Add support for QCS404 rpm
> > > clocks") defined the pin-controlled ln_bb_clk clocks, but didn't add
> > > them to the qcs404_clks array. Add them to make these clocks usable to
> > > platform devices.
> > >
> >
> > Please use scripts/get_maintainers.pl to get a list of necessary people
> > and lists to CC.  It might happen, that command when run on an older
> > kernel, gives you outdated entries.  Therefore please be sure you base
> > your patches on recent Linux kernel.
> >
> > > Fixes: eaeee28db289 ("clk: qcom: smd: Add support for QCS404 rpm clocks")
> > > Reviewed-by: Alex Elder <elder@linaro.org?
> >
> > Wrong character at the end.
> >
> > > Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  drivers/clk/qcom/clk-smd-rpm.c         | 2 ++
> > >  include/dt-bindings/clock/qcom,rpmcc.h | 2 ++
> > >  2 files changed, 4 insertions(+)
> > >
> >
> > No, bindings are separate.
>
> Argh, I didn't realise that this piece also goes into your realm.
> Please excuse me.

That's we we have checkpatch:

WARNING: DT binding docs and includes should be a separate patch. See:
Documentation/devicetree/bindings/submitting-patches.rst

Such issues are solved with tools. You will not miss any maintainers
if you automate the sending command (e.g. with identity and
tocmd/cccmd). The same with mixing files - checkpatch tests for it.

Best regards,
Krzysztof
