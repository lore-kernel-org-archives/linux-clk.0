Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F50BC61DB3
	for <linux-clk@archiver.kernel.org>; Thu, 12 Jan 2023 19:44:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240220AbjALToj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Jan 2023 14:44:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238794AbjALToG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Jan 2023 14:44:06 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8945F1057D
        for <linux-clk@vger.kernel.org>; Thu, 12 Jan 2023 11:35:16 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id cf42so29944030lfb.1
        for <linux-clk@vger.kernel.org>; Thu, 12 Jan 2023 11:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yAYjynh/JlSA73SJ+NClSDWR2Z+GwEtREPC4s1NxZeM=;
        b=GHFE1mgKGNMBi88jxaIEXnLBn3cC2pHb7pcv7ZbbS07IdBfH/fjwvLPsOOf4lRc2Ji
         jROi2YaMBZ+BWsbmsa2ANMyBuL41Uca0hOqE1zJFuGSsF9ZFE7s78WymunKIONPk/Mjs
         QxRIizM2TyP/lO0Q1RmLmGTakDIsbT5HT4gB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yAYjynh/JlSA73SJ+NClSDWR2Z+GwEtREPC4s1NxZeM=;
        b=CEwXXq4wP6hn+d52R8mNal1/gKWIK9OWB9lIeQwSp/0vQlwAPT6Iq97Lk4zDAo7RJI
         61MLBb3yI8cPcfx/VUEbgjVYF1p6G0vEHNxyVFhzy2OXzi11ZHP4Cwwh3WGYuHhf9C5h
         9cl+Kmp01qXzRMu5AL9X/E4N9izMszE6c5Ie9I7OQgelq4hZBUsiozq4fhwfNgrMiB1d
         jhMSWrp/bUHo/ubwPb6zDYW6b7Pm0LM8C7Ji0sxGp3OH4ec6aOCStC2Dm7iOpPWjm1Ww
         cqPHgAJiTyOpJXVTO+asO1Inu8wfCJVOuVYqOtinBYsfTAFCP/f40ZIQJD5dJY3qLeo1
         0CWQ==
X-Gm-Message-State: AFqh2kroSBszrE6jqv7VV1sJM6m8eBYs1TTaPNAJLyeSoOTnAmctjm0/
        kU9ZVbGJxHG5ybDxMv82fLN43udSYpE08FWr2wxAvg==
X-Google-Smtp-Source: AMrXdXsiV4/qvAwCS2YzjkQkBI2pWHnV74UvffxWaNqCcnh7r+wpnwzqtGa37hxSn3pp+XeRTd+rObR64w2TTviCRQc=
X-Received: by 2002:a05:6512:ba1:b0:4b5:5f2d:1458 with SMTP id
 b33-20020a0565120ba100b004b55f2d1458mr3475453lfv.253.1673552114933; Thu, 12
 Jan 2023 11:35:14 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 12 Jan 2023 11:35:14 -0800
MIME-Version: 1.0
In-Reply-To: <6cea0a3f-08de-47d5-99d1-74b0d8c7b732@quicinc.com>
References: <1672849297-3116-1-git-send-email-quic_srivasam@quicinc.com>
 <1672849297-3116-5-git-send-email-quic_srivasam@quicinc.com>
 <CAE-0n51AZCa9K_uY=ikTLqV-g_MsSA6Lv=Zq1LMrF-wVhR8_pg@mail.gmail.com> <6cea0a3f-08de-47d5-99d1-74b0d8c7b732@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 12 Jan 2023 11:35:14 -0800
Message-ID: <CAE-0n52ahKMzk0ho5jG1wxebm3ZE+Wfu_BunCaTR1WhN+J5jpw@mail.gmail.com>
Subject: Re: [RESEND v3 4/4] clk: qcom: lpasscc-sc7280: Add resets for audioreach
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, broonie@kernel.org,
        konrad.dybcio@somainline.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        quic_plai@quicinc.com, quic_rohkumar@quicinc.com,
        robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2023-01-11 23:53:23)
>
> On 1/12/2023 2:54 AM, Stephen Boyd wrote:
> Thanks for your time Stephen!!!
> > Quoting Srinivasa Rao Mandadapu (2023-01-04 08:21:37)
> >> diff --git a/drivers/clk/qcom/lpasscc-sc7280.c b/drivers/clk/qcom/lpasscc-sc7280.c
> >> index 85dd5b9..1efb72d 100644
> >> --- a/drivers/clk/qcom/lpasscc-sc7280.c
> >> +++ b/drivers/clk/qcom/lpasscc-sc7280.c
> >> @@ -102,6 +104,18 @@ static const struct qcom_cc_desc lpass_qdsp6ss_sc7280_desc = {
> >>          .num_clks = ARRAY_SIZE(lpass_qdsp6ss_sc7280_clocks),
> >>   };
> >>
> >> +static const struct qcom_reset_map lpass_cc_sc7280_resets[] = {
> >> +       [LPASS_AUDIO_SWR_RX_CGCR] =  { 0xa0, 1 },
> >> +       [LPASS_AUDIO_SWR_TX_CGCR] =  { 0xa8, 1 },
> >> +       [LPASS_AUDIO_SWR_WSA_CGCR] = { 0xb0, 1 },
> > Why are we adding these resets again? These are already exposed in
> > lpassaudiocc-sc7280.c
>
> As explained in previous versions, legacy path nodes are not being used
> in ADSP based platforms, due to conflicts.

What is legacy path nodes?

>
> Hence lpasscc node alone being used exclusively in ADSP based solution,
> resets are added.

I think I understand..

>
> In probe also, these reset controls are enabled based on
> "qcom,adsp-pil-mode" property.
>

but now I'm super confused! Please help me! We shouldn't have two
different device nodes for the same physical hardware registers.
Instead, we should have one node. The "qcom,adsp-pil-mode" property was
supposed to indicate the different mode of operation.

Maybe the audio clk and reset drivers on sc7280 are duplicating each
other and one of them can be removed?
