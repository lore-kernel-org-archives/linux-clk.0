Return-Path: <SRS0=TP+b=D2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C044BC433DF
	for <linux-clk@archiver.kernel.org>; Mon, 19 Oct 2020 14:58:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54431222EB
	for <linux-clk@archiver.kernel.org>; Mon, 19 Oct 2020 14:58:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Qr3sJTnt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729646AbgJSO6V (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Oct 2020 10:58:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729075AbgJSO6U (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Oct 2020 10:58:20 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B33B7C0613CE
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2020 07:58:20 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id j21so3279921uak.5
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2020 07:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tXJc1lZhZIvXLyjj/AsZOoOAw4bh6yqivRvcz8+A/WQ=;
        b=Qr3sJTnt+f2P7nYRuso8/yLqIv2Za2b7XL6njSRbfuCMrcIQhgBuERIsu9IPxRQXWf
         zJ2xESOoqgk1xoVfp9i9Wf3NTtLy5s76hO2KwkzeKUauLwgTswhFQU/H0vwCYl8u10Hm
         Or/vhOIqKLH14d6G9D0ILiVULu0Lntjndshn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tXJc1lZhZIvXLyjj/AsZOoOAw4bh6yqivRvcz8+A/WQ=;
        b=dkaCui7nOAw+ER/RumnsqCsdfnfYwRFszbD8DbdWwXRGKgL18CX8AGOZTxhF9ca61C
         7BM5nX9pZ3qjxSgp1qh3cAYR9gydXHSL4b14EIzuXCRwihSk8MeWbND2Gehtvqw0f127
         esxz7yVmktPTsb4fisQsylH29zgsJVp0qsGDXwT0LeXfmLWI5YFLHLc0DWjGw1IWGe9u
         5C+qdIjBo5hOYdN2296extSRePRCVGwWH7OHrZlV+Qj2mmA8FzwjCJZswbBL4R8M7Gk+
         u+VKMdPftl5AtdEjaGkxPJ7XAo3DW+7LOabuOipKmccqU1Vko0EfyBjFurJ0HhK9xly8
         z4+g==
X-Gm-Message-State: AOAM5312ziXsK+VrbrCGxUMFPQbc6sd11vfm1GCbazybUl5/uVpZmimS
        CQFYTOdxNS3aeVnKcOzhV/WL3YeWTKg2iw==
X-Google-Smtp-Source: ABdhPJzdiW61E6rc62ZmrPX54ocIsSVAwz1MeXIxULku8k3YFhvTLg8C4U+eHMJ1hyBLRKM6onTqPg==
X-Received: by 2002:ab0:2e3:: with SMTP id 90mr6483705uah.128.1603119499724;
        Mon, 19 Oct 2020 07:58:19 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id b197sm4552vkb.52.2020.10.19.07.58.18
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2020 07:58:18 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id r24so48314vsp.8
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2020 07:58:18 -0700 (PDT)
X-Received: by 2002:a67:ec9a:: with SMTP id h26mr331585vsp.34.1603119498344;
 Mon, 19 Oct 2020 07:58:18 -0700 (PDT)
MIME-Version: 1.0
References: <20201017020137.1251319-1-sboyd@kernel.org>
In-Reply-To: <20201017020137.1251319-1-sboyd@kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 19 Oct 2020 07:58:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WYFTu-J5L6usJNWtjH-FWe+o8JYWNxVYBdg5-coWaQag@mail.gmail.com>
Message-ID: <CAD=FV=WYFTu-J5L6usJNWtjH-FWe+o8JYWNxVYBdg5-coWaQag@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: gdsc: Keep RETAIN_FF bit set if gdsc is
 already on
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Fri, Oct 16, 2020 at 7:01 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> If the GDSC is enabled out of boot but doesn't have the retain ff bit
> set we will get confusing results where the registers that are powered
> by the GDSC lose their contents on the first power off of the GDSC but
> thereafter they retain their contents. This is because gdsc_init() fails
> to make sure the RETAIN_FF bit is set when it probes the GDSC the first
> time and thus powering off the GDSC causes the register contents to be
> reset. We do set the RETAIN_FF bit the next time we power on the GDSC,
> see gdsc_enable(), so that subsequent GDSC power off's don't lose
> register contents state.
>
> Forcibly set the bit at device probe time so that the kernel's assumed
> view of the GDSC is consistent with the state of the hardware. This
> fixes a problem where the audio PLL doesn't work on sc7180 when the
> bootloader leaves the lpass_core_hm GDSC enabled at boot (e.g. to make a
> noise) but critically doesn't set the RETAIN_FF bit.
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Taniya Das <tdas@codeaurora.org>
> Cc: Rajendra Nayak <rnayak@codeaurora.org>
> Fixes: 173722995cdb ("clk: qcom: gdsc: Add support to enable retention of GSDCR")
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---
>  drivers/clk/qcom/gdsc.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>
