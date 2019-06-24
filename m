Return-Path: <SRS0=7bnF=UX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63410C4646C
	for <linux-clk@archiver.kernel.org>; Mon, 24 Jun 2019 13:57:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3CEB320652
	for <linux-clk@archiver.kernel.org>; Mon, 24 Jun 2019 13:57:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZUFFbp/v"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728380AbfFXN5u (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Jun 2019 09:57:50 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:36753 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728464AbfFXN5u (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Jun 2019 09:57:50 -0400
Received: by mail-qt1-f194.google.com with SMTP id p15so14544279qtl.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2019 06:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QqK3B7nF5SYG8tflVUOWfn/TwUeaesQ9Kp4ntpERzxE=;
        b=ZUFFbp/vqXHm8ROouiCONAXZOuz9SHKSQ2Mg52Y39diFq6ScyeLHHzC3T9upjJCxSw
         R6qOWeXrWvhvwXM6GexvTB7U+tbywAkXOgZkKX7X6BcOfqwNh9szXrMBOBGUil+QPwY0
         qqoviKcCt3/pif8gmhijxBL8cFvVOTgyHUhfM+XRcjJSVWrTcHbCcsBA8bGeFMG6HKM4
         vrXGWThxwhUqF7Uwka2nBex8qU09MJ4sqtOEsLZxjJXJdg7/rlqFOvpWd4Bt7CjPEqYz
         eQhbscP5W2RFfJ1cy7a7TdDTDK+CuBJ0twLpo/mSscJuqbfP2jy2aao/jBfR82CS9znT
         VGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QqK3B7nF5SYG8tflVUOWfn/TwUeaesQ9Kp4ntpERzxE=;
        b=g8q1vr3se48K74LSwlhIiWppDc8V4+gZP4F1tdLbA+2WJ/xS6sGNBHwSXNQ9r66o8+
         lNVdocF7Uwo2fFwlclWxLZXUuqHDzdtBoHvwcpEv1SjySaxJBp417TrfQDpD635Ha69Y
         qr4jkoVgS9qOaWVIT6uZoxKDk/FM5pdc6Nb7V2B7ErKsNlcoPJ0qNKi+Jcm4+XIWFE4I
         vUVPwmvCGZlZ6P2cQ7mOyHgRlO7v11W0o2Q/y6NCTa3L4vLfyUypL5YccSoeKJ+mZNAp
         3jG90F6l19M2Rne5nqBbRwf+oSFCcOLycFjvAUdbceOUsx1cBc6PtTyB97d02xOql+Nm
         +7VQ==
X-Gm-Message-State: APjAAAXTL0/Sz4a+g5ZaQB3ZySqa9nrjv3vLd4gxkG3bAyOabSclrPOl
        JRyqfCV7G7M1vkrV77EpladrcBrb/zfQ2jnRq+OFVTLU
X-Google-Smtp-Source: APXvYqzahao66RH4Ei4UrfD64a+p0ylgYwwI5RitOzNtZRoa6gNBzWpKRI5QtbhqMbGILXLo76TjK48sYxNFYa5Sti0=
X-Received: by 2002:a0c:b885:: with SMTP id y5mr2877647qvf.31.1561384669393;
 Mon, 24 Jun 2019 06:57:49 -0700 (PDT)
MIME-Version: 1.0
References: <d654907d-a3a2-a00f-d6f5-3a34ae25ebcf@free.fr> <f96ab735-1001-5319-a314-b8079efd9046@linaro.org>
 <5d1ff6a7-7b3b-9bbf-f737-5347555a2076@free.fr>
In-Reply-To: <5d1ff6a7-7b3b-9bbf-f737-5347555a2076@free.fr>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Mon, 24 Jun 2019 19:27:38 +0530
Message-ID: <CAP245DWbC8vY1pVuYnGvZ=7LVAAaqAm9TtccCktdxNWuuoxf5w@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: msm8916: Add 2 clk options in defconfig
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Jun 24, 2019 at 6:56 PM Marc Gonzalez <marc.w.gonzalez@free.fr> wrote:
>
> QCOM_A53PLL and QCOM_CLK_APCS_MSM8916 used to be enabled by default
> in drivers/clk/qcom/Kconfig. A recent patch changed that by dropping
> the 'default ARCH_QCOM' directive.
>
> Add the two options explicitly in the arm64 defconfig, to avoid
> functional regressions.
>
> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>

Acked-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
> Bjorn, Andy, I believe you can take this patch through the qcom tree,
> once Stephen takes the parent patch.
> ---
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 5a8e853833cf..3277944626c2 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -658,6 +658,8 @@ CONFIG_CLK_IMX8MQ=y
>  CONFIG_CLK_IMX8QXP=y
>  CONFIG_TI_SCI_CLK=y
>  CONFIG_COMMON_CLK_QCOM=y
> +CONFIG_QCOM_A53PLL=y
> +CONFIG_QCOM_CLK_APCS_MSM8916=y
>  CONFIG_QCOM_CLK_SMD_RPM=y
>  CONFIG_QCOM_CLK_RPMH=y
>  CONFIG_IPQ_GCC_8074=y
> --
> 2.17.1
