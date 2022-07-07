Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 441ECC43334
	for <linux-clk@archiver.kernel.org>; Thu,  7 Jul 2022 00:02:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234644AbiGGAC2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Jul 2022 20:02:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234632AbiGGAC2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Jul 2022 20:02:28 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A36D72D1E0
        for <linux-clk@vger.kernel.org>; Wed,  6 Jul 2022 17:02:27 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id n66so12549311oia.11
        for <linux-clk@vger.kernel.org>; Wed, 06 Jul 2022 17:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=PnPr/1wV1VsDM5AHnYfjPAu3D3lvVU7n3T6uqgg9/R0=;
        b=cy5YW5oK8azkNdczvWFJwyh++jfARujG2dfBKCYuhU29WcT/XmK1mxCRYPxCTDuzHD
         S930YX/X6BdzGqHueKcrrFx+425I4eqBGTp0flDBv9boMS5HM7KjVEznIn2TJd0cJpBS
         pKupIMlhavC4356aVBEbh/9Lt/TaZMJ3fl0C4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=PnPr/1wV1VsDM5AHnYfjPAu3D3lvVU7n3T6uqgg9/R0=;
        b=DeicHjl+L0284S4XaLRskUgz9QbcVuaS7o9lAGb2W4/yPHuQJUE+Tq7R3ExWGHmXal
         BLoyhZnXlB1fvNWzQFFmPhKPtgJIoCalMFvUf4Mx0e9mfVhSLBii6OizvD0p9o2BH/Cy
         ITsHR8bGyorzQbLPkSQkjvC80B7i/+qIWuPV5ZrS40COZSN3muotjOTXTNcfbTTCYnmP
         qiW7Hq0seVgnsAE2HOOoWXLUzjDMBbCKAFGejCORiyTKEpvpQ9uPtFkzpTSfRhyBALUL
         KUYOgYnrPps7SsR/ywZBwB8N6V5TUa9YMrwpLC2sLmkCVxj2b1J1dl+hYr53PPOISrTF
         oBLw==
X-Gm-Message-State: AJIora/hxpyQdAJCMlmDBK491EOSzQV7ihh5Zkr64gPoqwGdv/lz9A/G
        m/2CUvELT2YRxYYWTpsgRxoZy8RzFj8sJBgEtl/0TA==
X-Google-Smtp-Source: AGRyM1vW63Yppk8g9ETKCFgydRa/5t3+pkplkfQ29ri3PaE1IB+DZLPNqhEt4I43L+jR0L5u6CSyYIFc3FbBzB2Bd/k=
X-Received: by 2002:a05:6808:171c:b0:334:9342:63ef with SMTP id
 bc28-20020a056808171c00b00334934263efmr808946oib.63.1657152147038; Wed, 06
 Jul 2022 17:02:27 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Jul 2022 20:02:26 -0400
MIME-Version: 1.0
In-Reply-To: <Yr5xS/HCrBuNrn9N@builder.lan>
References: <20220628201340.3981860-1-swboyd@chromium.org> <Yr5xS/HCrBuNrn9N@builder.lan>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 6 Jul 2022 20:02:26 -0400
Message-ID: <CAE-0n51Ex7T+B0PwwYmH-o9VAy5PYgzGFb=bOTu8ae4t0sGZKw@mail.gmail.com>
Subject: Re: [PATCH/RFC] clk: qcom: rpmh: Block system suspend if XO is enabled
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, patches@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>,
        Mike Tipton <quic_mdtipton@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Bjorn Andersson (2022-06-30 21:00:11)
> On Tue 28 Jun 15:13 CDT 2022, Stephen Boyd wrote:
>
> > Tracking down what RPMh resource is blocking XO shutdown in suspend is
> > hard. Largely because we need external debug tools to dump the RPMh
> > internal state to figure out what resource is enabled. Instead of doing
> > that, let's just block system wide suspend in the kernel if the RPMh XO
> > resource is enabled by something in the kernel. This will help us narrow
> > down XO shutdown failures to the XO clk, and not something else like an
> > interconnect or regulator RPMh resource.
> >
> > I'm sending this as an RFC because it breaks suspend for me on Trogdor
> > boards. I found out that the XO resource is always enabled on these
> > devices because the audio driver leaves an audio clk always on. This
> > means that the XO resource must not be used to determine if XO shutdown
> > is achievable, or we're leaving power savings on the table.
> >
> > Cc: Taniya Das <quic_tdas@quicinc.com>
> > Cc: Mike Tipton <quic_mdtipton@quicinc.com>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> > ---
> >
> > Please don't apply. It will break suspend on Trogdor boards.
> >
>
> This seems like a useful debug feature for people outside of Qualcomm,
> so I assume you're saying that we shouldn't merge it until someone has
> fixed the audio driver? Or did you post it just as a debug tool?
>

I mainly posted it to get a response from Qualcomm on what's going on. I
haven't tried to fix the audio driver so far, but I can certainly look
into it. The audio clk driver keeping XO on doesn't seem to matter for
power because we're hitting the deepest of sleeps on Trogdor boards.

I also realized that due to clk adoption logic we can't be certain that
this driver's suspend function will be called after other clk providers
that consume XO run their suspend functions. We can probably assume clk
consumers that aren't providers will probe after clk-rpmh, so this check
is generally safe because we don't have clk providers disabling clks
during their suspend functions. It's just not totally safe.

Maybe this is a good reason to add some sort of suspend op to clk_ops
and then call that during system wide suspend.
