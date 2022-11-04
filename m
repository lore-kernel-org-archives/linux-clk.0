Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A92DC4332F
	for <linux-clk@archiver.kernel.org>; Fri,  4 Nov 2022 21:19:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230112AbiKDVTP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Nov 2022 17:19:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbiKDVTO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Nov 2022 17:19:14 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 927EDF59
        for <linux-clk@vger.kernel.org>; Fri,  4 Nov 2022 14:19:12 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id c1so7366394lfi.7
        for <linux-clk@vger.kernel.org>; Fri, 04 Nov 2022 14:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L+pen+bclyorb8ogf6bpxsI2tvXi5ZuGCYXqmAjFI/g=;
        b=XJNITXPyNkcNnI4VfJNFhxvsGcNZ0rAQl0ZqqMYKQh4nUReBgcc4uXnwTAwLDZQRs4
         LYZANwCEbW5F9+854u1PG1+tjER3XnwothDcaJKX4mCwz3DTRsjRB2M7lnZBEOp9HL1J
         upmnQMir3Q6QiUDlmnP85/moEVRKqPt3t+hqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+pen+bclyorb8ogf6bpxsI2tvXi5ZuGCYXqmAjFI/g=;
        b=H1aJbcXzm1QTl4yEqEGsgrUwUDiyaT8bytcKsR+XgWjy5CQnogXL5QmJIsvU/rYGSI
         N8nFmHH2go9shhF5yKWaOYkWt818PoeUTs3MUzbRNOBDaM/QENHqy8dcWWUDiQYU9TCC
         eD1YmnvXyChgWbnPsBnI7ynQ83roYYUJJuVrW1iHRc3wTvMAlLQ4e0JyDeHP/YfjMCOi
         E63Rtli+oqySf1/9kOmeeGoNWTnKCu7lulIMF66jFYMquv7Re8RQu4yYDHcl05uSQS4Q
         1CksGV5WEI0nfuMu0O3BaLRWk27bbDZaUQLAXpQfrxVwBmajSaMGByK4AsLqj/UGhwlr
         iZ0A==
X-Gm-Message-State: ACrzQf3xck4mHSt/UhmNAg9PSNArLl/+xWMHLoGodc7VggLlO9kPJVVG
        E6PszwskT4NG3/8QgkgwHQ1/uqxoFp1Icq87GJnD0w==
X-Google-Smtp-Source: AMsMyM7hO7tIh7DUGKYkxLwL5wT6J+jrjdD8MBfAHIk43j8UcT87F7EAGjbtaoEX4G1b90StxBn3SpTuz37UP7/InaQ=
X-Received: by 2002:ac2:4d81:0:b0:4b2:11d:fa0e with SMTP id
 g1-20020ac24d81000000b004b2011dfa0emr1166848lfe.309.1667596750945; Fri, 04
 Nov 2022 14:19:10 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 4 Nov 2022 14:19:10 -0700
MIME-Version: 1.0
In-Reply-To: <20221104064055.3.I90ba14a47683a484f26531a08f7b46ace7f0a8a9@changeid>
References: <20221104064055.1.I00a0e4564a25489e85328ec41636497775627564@changeid>
 <20221104064055.3.I90ba14a47683a484f26531a08f7b46ace7f0a8a9@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 4 Nov 2022 14:19:10 -0700
Message-ID: <CAE-0n53=YeA+sFkS0EVESwq60rQTyXisOY1gcPTXDG9Zm1zoYA@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: qcom: lpass-sc7180: Avoid an extra "struct dev_pm_ops"
To:     Bjorn Andersson <andersson@kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Cc:     Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Douglas Anderson (2022-11-04 06:56:30)
> The two devices managed by lpasscorecc-sc7180.c each had their own
> "struct dev_pm_ops". This is not needed. They are exactly the same and
> the structure is "static const" so it can't possible change. combine
> the two. This matches what's done for sc7280.
>
> This should be a noop other than saving a few bytes.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
