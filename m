Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 991BEC4332F
	for <linux-clk@archiver.kernel.org>; Fri,  9 Dec 2022 16:28:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbiLIQ26 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Dec 2022 11:28:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiLIQ24 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Dec 2022 11:28:56 -0500
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A84A86F60
        for <linux-clk@vger.kernel.org>; Fri,  9 Dec 2022 08:28:54 -0800 (PST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-3cbdd6c00adso58815947b3.11
        for <linux-clk@vger.kernel.org>; Fri, 09 Dec 2022 08:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KwUr6L0Dg5AexDWlnJDonhDDUddaY6L+83QoeCbsL6w=;
        b=IJKobng0dU7tuEUHviEk+CoMH7eMgCrfzpJ4jYnAzBkOEqGMBhPE/sjKJ13PhqyAIE
         oXkxPvPIPpHI4VBSMRDtWTG4aRkcOB5WhWSP3xOiv/rf/kicv9EsR4UNKdl3XHaAG0Iw
         o3rim5zBRrpQ7ZNXED6sJ0UrUdblacX80XBM/RQS190ZXPfFjzHeTOrR+h1tnBi9DbIH
         Eg+yRHm7a5qFA0ETC7jO/c3dxMWRlYkzkdarPtQ+O1JaHApABO4Y46GJy2zpyB+dLx3v
         c/ijQ8hHtxCWQUsqrWYmx17TxQuWCbH4Vr/euCQVVn1KeZVPtHmEE9UaG07VItcO6QRH
         x+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KwUr6L0Dg5AexDWlnJDonhDDUddaY6L+83QoeCbsL6w=;
        b=30YSitcdIoMh8tB7T3uAVMC4FmHsLQymh+fMKBGbpDslE/deBe1htd66MGIjkDNCoS
         f7t3N49QWGgYWhfqnF4cw3sEl2BdoZ+xd0h7nx6gkwAJXdyJqEtts4U6eLRPmg/m5Tuf
         cY2M3ecEz243Bp2nJoy5bP6nlhLYAfEyUrGRPiCak4f0/0rZfK1St6pintDAmtEGZCke
         1zd/T+Ow3E5WD92jlg1iXnbVupVlu+X804h2yeQcxfPwqPSXrBc/ClwHEYGgNGvJzFn9
         zL8cxLL21fvHKqko+IPWMYgRNOt9CC1ZMd504WODU9lH1J/bKrVGsMtXfpcT4XLU3UGj
         k23Q==
X-Gm-Message-State: ANoB5pmjTJ2MH6sVr3d1YgDKig+1BVIFghF1XNL2gnOi1+5aSa+xvDgp
        JmsT4SvZyAPdipdRrMyA+1EXo7R1O6hOcXIjw5lE+A==
X-Google-Smtp-Source: AA0mqf5JioR0tlkYsUfBOYPggxjH5nJhi6FqwWPFYXy7wZYWLeI99NpwomjbnOUpTdaEDlYnQ7/PvdsejSaSqaqmNzc=
X-Received: by 2002:a81:6c52:0:b0:370:4c23:eacc with SMTP id
 h79-20020a816c52000000b003704c23eaccmr24817663ywc.127.1670603333277; Fri, 09
 Dec 2022 08:28:53 -0800 (PST)
MIME-Version: 1.0
References: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
 <20221207001503.93790-3-dmitry.baryshkov@linaro.org> <74af29ba-0eaa-0c20-ea66-c5636162aaaf@linaro.org>
In-Reply-To: <74af29ba-0eaa-0c20-ea66-c5636162aaaf@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 9 Dec 2022 18:28:42 +0200
Message-ID: <CAA8EJpo7+h34YCBc4+vBi22eNNO7xAa8FhwjHkU-4ZvcZx-tvA@mail.gmail.com>
Subject: Re: [PATCH v2 02/18] clk: qcom: smd-rpm: enable pin-controlled
 ln_bb_clk clocks on qcs404
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

On Fri, 9 Dec 2022 at 18:14, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 07/12/2022 01:14, Dmitry Baryshkov wrote:
> > The commit eaeee28db289 ("clk: qcom: smd: Add support for QCS404 rpm
> > clocks") defined the pin-controlled ln_bb_clk clocks, but didn't add
> > them to the qcs404_clks array. Add them to make these clocks usable to
> > platform devices.
> >
>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC.  It might happen, that command when run on an older
> kernel, gives you outdated entries.  Therefore please be sure you base
> your patches on recent Linux kernel.
>
> > Fixes: eaeee28db289 ("clk: qcom: smd: Add support for QCS404 rpm clocks")
> > Reviewed-by: Alex Elder <elder@linaro.org?
>
> Wrong character at the end.
>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/clk/qcom/clk-smd-rpm.c         | 2 ++
> >  include/dt-bindings/clock/qcom,rpmcc.h | 2 ++
> >  2 files changed, 4 insertions(+)
> >
>
> No, bindings are separate.

Argh, I didn't realise that this piece also goes into your realm.
Please excuse me.

I'll send v2.

-- 
With best wishes
Dmitry
