Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A2D0C4167B
	for <linux-clk@archiver.kernel.org>; Thu, 22 Dec 2022 16:06:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbiLVQGD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Dec 2022 11:06:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbiLVQGA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Dec 2022 11:06:00 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEC241AF20
        for <linux-clk@vger.kernel.org>; Thu, 22 Dec 2022 08:05:58 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id t18so1514122pfq.13
        for <linux-clk@vger.kernel.org>; Thu, 22 Dec 2022 08:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yNYj2+faAjMFDKAvbNk2y84zda8I1j/yCB/6Jq35uqw=;
        b=yuaLOWS/FYiY3xwvYVkTZMNK3ghRu+trYkX1lJftsL9e/mHyQwKa6ntkfygZmqBGMj
         H3qCTyo8k46QpqYgbgBC8rftntKZGhaYYbfIx5xLOjMAi4hrlK4aLEmfdYVYPDVjIQpz
         gH4hFznFXTq9L2ENLd5JNb9vBhtuHunRlvOTqkQt1qTUEVtod+3fHRv3GLf+u0ziKNfL
         yO9phnIdzuNhFmlWwuz1UQBBtyOruhm+NI2878FOD85MBskflZHTWXY3OJowCVRRRPUI
         t9I8KjmAhuUD9WlHJJ2fPYaRUYCjUs+h3bQuIrsK+2tZ8t8Q7AFA+N8DN8aPKOHL/b3d
         a7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yNYj2+faAjMFDKAvbNk2y84zda8I1j/yCB/6Jq35uqw=;
        b=NJePiLQrEkjVSiGd9Aluyt5abR4u0UNzFMZ3GBLmICbikrhMjXzPpfZ7xrNREKQXc8
         YFpdBJZFVpAU1s0JvU5dVdQD3daEAanqZGdCnmY26v8hv4On6F34NGFeO5mzSCn5lWIV
         m8bZR5Am/U30P1m1RHmxtqoitrG6akFrjMtjJAdx/OylRhUNPR13I6GmWzSV41rC5ogv
         ChKl2kWVGzK1n7U3VbMc7CkqJ7NhBH4kBasOI3Xe9+PqcXvVYMy6iVcUqKuzq1UVTDt7
         BzBe0j6WO4+xr0hMQw67OWlZChzBaxpvyP8Pu8SqcA2rCPXfklfvwf/4zaBMNBVG/jyb
         QPUQ==
X-Gm-Message-State: AFqh2kpTVi4M89BkYwChmCq4zn8vKIdvrN2sMryMTcNxpH/zOz0n4KUV
        5/+6kHHkE7KmYN2PAPrrTydCaMpiw7ZKkb3aTNKyyA==
X-Google-Smtp-Source: AMrXdXuucHOLti3ekPdYE6Bj1QKKm3rrotVU76QOg85NDX4pWDEjtUAZ1t5qIqPwXfgwa7ckwK0/p6ZVEpkdSq1dQes=
X-Received: by 2002:a63:e4f:0:b0:493:d903:6616 with SMTP id
 15-20020a630e4f000000b00493d9036616mr259913pgo.541.1671725158143; Thu, 22 Dec
 2022 08:05:58 -0800 (PST)
MIME-Version: 1.0
References: <1671642843-5244-1-git-send-email-quic_akhilpo@quicinc.com> <20221221224338.v4.2.Ic128c1df50b7fc9a6b919932a3b41a799b5ed5e8@changeid>
In-Reply-To: <20221221224338.v4.2.Ic128c1df50b7fc9a6b919932a3b41a799b5ed5e8@changeid>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 22 Dec 2022 17:05:21 +0100
Message-ID: <CAPDyKFrKV4aHxTosQHkkbBHS3MOx=-i+sW=jQY=sYE4XnaQHmA@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] clk: qcom: gdsc: Support 'synced_poweroff' genpd flag
To:     Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 21 Dec 2022 at 18:14, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> Add support for the newly added 'synced_poweroff' genpd flag. This allows
> some clients (like adreno gpu driver) to request gdsc driver to ensure
> a votable gdsc (like gpucc cx gdsc) has collapsed at hardware.
>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>
> (no changes since v3)
>
> Changes in v3:
> - Rename the var 'force_sync' to 'wait (Stephen)
>
>  drivers/clk/qcom/gdsc.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index 9e4d6ce891aa..5358e28122ab 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -136,7 +136,8 @@ static int gdsc_update_collapse_bit(struct gdsc *sc, bool val)
>         return 0;
>  }
>
> -static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status)
> +static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status,
> +               bool wait)
>  {
>         int ret;
>
> @@ -149,7 +150,7 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status)
>         ret = gdsc_update_collapse_bit(sc, status == GDSC_OFF);
>
>         /* If disabling votable gdscs, don't poll on status */
> -       if ((sc->flags & VOTABLE) && status == GDSC_OFF) {
> +       if ((sc->flags & VOTABLE) && status == GDSC_OFF && !wait) {
>                 /*
>                  * Add a short delay here to ensure that an enable
>                  * right after it was disabled does not put it in an
> @@ -275,7 +276,7 @@ static int gdsc_enable(struct generic_pm_domain *domain)
>                 gdsc_deassert_clamp_io(sc);
>         }
>
> -       ret = gdsc_toggle_logic(sc, GDSC_ON);
> +       ret = gdsc_toggle_logic(sc, GDSC_ON, false);
>         if (ret)
>                 return ret;
>
> @@ -352,7 +353,7 @@ static int gdsc_disable(struct generic_pm_domain *domain)
>         if (sc->pwrsts == PWRSTS_RET_ON)
>                 return 0;
>
> -       ret = gdsc_toggle_logic(sc, GDSC_OFF);
> +       ret = gdsc_toggle_logic(sc, GDSC_OFF, domain->synced_poweroff);
>         if (ret)
>                 return ret;
>
> @@ -392,7 +393,7 @@ static int gdsc_init(struct gdsc *sc)
>
>         /* Force gdsc ON if only ON state is supported */
>         if (sc->pwrsts == PWRSTS_ON) {
> -               ret = gdsc_toggle_logic(sc, GDSC_ON);
> +               ret = gdsc_toggle_logic(sc, GDSC_ON, false);
>                 if (ret)
>                         return ret;
>         }
> --
> 2.7.4
>
