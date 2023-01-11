Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A14C5479D
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 21:24:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235157AbjAKVY1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 16:24:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235155AbjAKVYW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 16:24:22 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 665B21929B
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 13:24:21 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id s22so17372982ljp.5
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 13:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E3ouReEkUi6rpeaDUi73MWa8zDe8GfIZfYqDVIXiGL8=;
        b=n1B1osc8MSidHzm9DzPZDwklg/mTFKXmP7yRtNAjdNwX8cQ5ir/AdtR/oCEaTSe7hD
         MaYDksh6tMioZ2uNwNdl5KPR5jpaHMsJNkAFtmSE8LbnkX4ouQw7nkxTXW4ESTiKG/tY
         xRej9CC0YxSKJsvA2gXsdw6sfdbV2/rmtCH5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E3ouReEkUi6rpeaDUi73MWa8zDe8GfIZfYqDVIXiGL8=;
        b=K1LAfLDgeRmlzXiPx5yl6bNzGQId0jpKjqtU8omFVGHhaMcb6GaPSNAiyT7FCA7aFt
         sjVK77UEuBHX2KLBgixii3BOCxdnRIqwpNxIBXnqUu8tsvrU8BqF6ldycCy4VOyTbHaX
         JQjUwasn4U4QkxQ5jlHEctCI08wQOpmj+7gdkGFrEgo9KaTUqEFk2Z+rQfQPwnnJkDZp
         JoCkEjtqMhyUG0z37lGfyvUQLo7t3TB4vQeB8FnN2kbVSlZtQSmLl/iyGMo+wb8H4hDH
         l0oSJWpXIT8dFsKZnTMaaQed4VHwLkf/F7oEqlxhXuvVQdMNr30eAP10UKxXISb1UPzm
         NVmg==
X-Gm-Message-State: AFqh2kpchb7B1teS3au7gnoAJ7IkPFQKHktcC4rHX33szTT1nKmbss7U
        vV6YAltNvwqoB1cdeCyeMzVOD0ZYgVXVnOcpmKMYKA==
X-Google-Smtp-Source: AMrXdXuMNICL9YpyiTa9tdbBFuIGRzDSVubjSkk9E9X3C1ZtxuNdgu97gzWZ8c+eZp/ov7qiTd7PqItMmYqyqc9bz7E=
X-Received: by 2002:a2e:2ac4:0:b0:27f:cc03:496a with SMTP id
 q187-20020a2e2ac4000000b0027fcc03496amr4183575ljq.359.1673472259758; Wed, 11
 Jan 2023 13:24:19 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Jan 2023 13:24:19 -0800
MIME-Version: 1.0
In-Reply-To: <1672849297-3116-5-git-send-email-quic_srivasam@quicinc.com>
References: <1672849297-3116-1-git-send-email-quic_srivasam@quicinc.com> <1672849297-3116-5-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 11 Jan 2023 13:24:19 -0800
Message-ID: <CAE-0n51AZCa9K_uY=ikTLqV-g_MsSA6Lv=Zq1LMrF-wVhR8_pg@mail.gmail.com>
Subject: Re: [RESEND v3 4/4] clk: qcom: lpasscc-sc7280: Add resets for audioreach
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, broonie@kernel.org,
        konrad.dybcio@somainline.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        quic_plai@quicinc.com, quic_rohkumar@quicinc.com,
        robh+dt@kernel.org, swboyd@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2023-01-04 08:21:37)
> The clock gating control for TX/RX/WSA core bus clocks would be required
> to be reset(moved from hardware control) from audio core driver. Thus
> add the support for the reset clocks in audioreach based clock driver.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
>  drivers/clk/qcom/lpasscc-sc7280.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/drivers/clk/qcom/lpasscc-sc7280.c b/drivers/clk/qcom/lpasscc-sc7280.c
> index 85dd5b9..1efb72d 100644
> --- a/drivers/clk/qcom/lpasscc-sc7280.c
> +++ b/drivers/clk/qcom/lpasscc-sc7280.c
> @@ -12,10 +12,12 @@
>  #include <linux/regmap.h>
>
>  #include <dt-bindings/clock/qcom,lpass-sc7280.h>
> +#include <dt-bindings/clock/qcom,lpassaudiocc-sc7280.h>
>
>  #include "clk-regmap.h"
>  #include "clk-branch.h"
>  #include "common.h"
> +#include "reset.h"
>
>  static struct clk_branch lpass_top_cc_lpi_q6_axim_hs_clk = {
>         .halt_reg = 0x0,
> @@ -102,6 +104,18 @@ static const struct qcom_cc_desc lpass_qdsp6ss_sc7280_desc = {
>         .num_clks = ARRAY_SIZE(lpass_qdsp6ss_sc7280_clocks),
>  };
>
> +static const struct qcom_reset_map lpass_cc_sc7280_resets[] = {
> +       [LPASS_AUDIO_SWR_RX_CGCR] =  { 0xa0, 1 },
> +       [LPASS_AUDIO_SWR_TX_CGCR] =  { 0xa8, 1 },
> +       [LPASS_AUDIO_SWR_WSA_CGCR] = { 0xb0, 1 },

Why are we adding these resets again? These are already exposed in
lpassaudiocc-sc7280.c
