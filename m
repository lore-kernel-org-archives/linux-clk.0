Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 062CDC433F5
	for <linux-clk@archiver.kernel.org>; Wed,  8 Sep 2021 15:09:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DDD13611CA
	for <linux-clk@archiver.kernel.org>; Wed,  8 Sep 2021 15:09:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238117AbhIHPLG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Sep 2021 11:11:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbhIHPLF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Sep 2021 11:11:05 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E97FBC061575
        for <linux-clk@vger.kernel.org>; Wed,  8 Sep 2021 08:09:57 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id f6so3756691iox.0
        for <linux-clk@vger.kernel.org>; Wed, 08 Sep 2021 08:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yRPp5IHtHZbh2VaC3A/pPLLamUQg+uMH0n8xJchofN8=;
        b=I2IrUovC0NAik8gQxEeKQbBh/+E3r1Ftc2iriNrtCYRmaOT/WfeH2y3O4YSWdUy8sq
         6jAWU0V6WXZyy9beh89xVm0hzWeWloejNkfBnlYCfYncR05Lt/w1j02hKERMBtQ0dJe9
         1rPWIKVprNObr/nlryClStiA51vf+aQWK6+as=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yRPp5IHtHZbh2VaC3A/pPLLamUQg+uMH0n8xJchofN8=;
        b=Rh4RnIfyuAqXw0QAXJvnCdA2mXX4LwIpOPM+kkBnWsjqCUPcIHwHQgGtec4PVDF4ZY
         ziultEqhv2vGvvC9L2o2y46tWx55/H1JSb2pXs5doDEu0/sTG+Xk8LUnKTIsFCGug+e5
         j5XB/lhnx4DXuEa+ca2Zu98sYiQnwZcl4W/W08fOYxk4dJJNg+npxGCQB7NKSRpMqi4J
         n7slb60KUiS7LGF9DjtpNf3dZS1nqFOT+Hxxe0F3Q8A/3CI7UFFtDF0r9CB3ggaeZuRg
         5CxyZwiKaAmaVssc/md0eJ952SVBmJ6tILilYMhZTZGyqLg/Zo28N8cyIBAmFJq1HJn7
         HRMQ==
X-Gm-Message-State: AOAM5325rPnZAPOhuQEUSlfipTONjW5xNcKaFoQut6D2M0UmPx943yRl
        kHYma3rztX7K8OLcBEjCM+ZhHgrxW2OVzw==
X-Google-Smtp-Source: ABdhPJwYV9Z05vifqVYPjRbLYAmeicKPcUnsFajG+n3VySyxFadeV2g0g2AUqy7MK9YCGf4+2AVEhw==
X-Received: by 2002:a5e:c018:: with SMTP id u24mr313524iol.98.1631113797169;
        Wed, 08 Sep 2021 08:09:57 -0700 (PDT)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com. [209.85.166.171])
        by smtp.gmail.com with ESMTPSA id y26sm1285655iob.37.2021.09.08.08.09.56
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Sep 2021 08:09:56 -0700 (PDT)
Received: by mail-il1-f171.google.com with SMTP id i13so2678146ilm.4
        for <linux-clk@vger.kernel.org>; Wed, 08 Sep 2021 08:09:56 -0700 (PDT)
X-Received: by 2002:a92:cb52:: with SMTP id f18mr274812ilq.120.1631113795742;
 Wed, 08 Sep 2021 08:09:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210907094628.RESEND.1.If29cd838efbcee4450a62b8d84a99b23c86e0a3f@changeid>
 <20210907094628.RESEND.2.Ibc87b4785709543c998cc852c1edaeb7a08edf5c@changeid>
In-Reply-To: <20210907094628.RESEND.2.Ibc87b4785709543c998cc852c1edaeb7a08edf5c@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 8 Sep 2021 08:09:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uo7oK6a8X69KGneP8CvXE127ZxU7U59Rrz+_Dv6D5t3g@mail.gmail.com>
Message-ID: <CAD=FV=Uo7oK6a8X69KGneP8CvXE127ZxU7U59Rrz+_Dv6D5t3g@mail.gmail.com>
Subject: Re: [RESEND PATCH 2/2] arm64: dts: rockchip: add Coresight debug
 range for RK3399
To:     Brian Norris <briannorris@chromium.org>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Tue, Sep 7, 2021 at 9:46 AM Brian Norris <briannorris@chromium.org> wrote:
>
> Per Documentation/devicetree/bindings/arm/coresight-cpu-debug.txt.
>
> This IP block can be used for sampling the PC of any given CPU, which is
> useful in certain panic scenarios where you can't get the CPU to stop
> cleanly (e.g., hard lockup).
>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 48 ++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> index 3871c7fd83b0..c8c62637b600 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> @@ -433,6 +433,54 @@ usbdrd_dwc3_1: usb@fe900000 {
>                 };
>         };
>
> +       debug@fe430000 {

I think your sort order is wrong? 0xfe430000 comes before 0xfe900000?

Other than that this looks good to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
