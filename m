Return-Path: <SRS0=UrzD=QE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA3E4C282C8
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 09:11:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A73AF20989
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 09:11:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="mIp0uOku"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726772AbfA1JLi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Jan 2019 04:11:38 -0500
Received: from mail-it1-f194.google.com ([209.85.166.194]:54004 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726647AbfA1JLh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Jan 2019 04:11:37 -0500
Received: by mail-it1-f194.google.com with SMTP id g85so19505213ita.3
        for <linux-clk@vger.kernel.org>; Mon, 28 Jan 2019 01:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=er9/I+TyhaggJajko2FO0SWawCUPwizjJ0agacJS0Pk=;
        b=mIp0uOkuyPs9FBNfudGyqmnrOZcJ6xYYS0pLHOz5eFRNaEYAE1M+MyzJ2LYAmqB2Nn
         NMsIzzOC9Ql5OE4IPThfq/Q3neXkAFDvJcb0hBck7hPd522Ddx4ym5GqOLija2grJhSR
         wnQi7k3wm431IY72t5zH/wlm1IfCw3qCiVQfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=er9/I+TyhaggJajko2FO0SWawCUPwizjJ0agacJS0Pk=;
        b=HVWx/0sbFHh4/e1F/Np88QJ8TMTIgavvsx8pJoh2VGDgcqppJg+IJPid7T3RrZUHn0
         ML8lw0iszpbstLQM7/MeZmURMJkkm/g6d3r/It5g4RC+qKl7goOBRCaVMvc1FtWVfcr2
         IukQGkG0Z1McBeG3Gu9E4gF47C+rPvQO0fU5RFKsxbY5pjGHAxQxZIfcucpd4u7/x+V4
         AeSIDfmbkCm0CurItAyFrQYZmsts6CkrbolNjvmoacAcpseBfnwQFOpxrI+tiZjGtwEX
         fzuZ8vSqopWYlmwKaeawKT7fUVfyDe4LCaXVEBTkTL/4XiPwUsF77m/zH1ebCZc1YaNZ
         y0Kg==
X-Gm-Message-State: AJcUukfilHfNBZy+sOw4DITR/Wwyc6e5KZlaZ9VlvUE/nQisfSQ2FYWF
        d4xBVbR91n4y55L0aWBro6gm76WU3d8LdOcUGifdRA==
X-Google-Smtp-Source: ALg8bN7L6MXqfpULu9ND2ngnThuAu7s7vqf/t98FgrqZEuAOpvXA46hxZ3oPCapa8ePZHHhoOsRsQ6/yEnP0PsKF5xk=
X-Received: by 2002:a24:385:: with SMTP id e127mr9201443ite.32.1548666697022;
 Mon, 28 Jan 2019 01:11:37 -0800 (PST)
MIME-Version: 1.0
References: <20190125032314.20915-1-wens@csie.org> <20190125032314.20915-2-wens@csie.org>
In-Reply-To: <20190125032314.20915-2-wens@csie.org>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Mon, 28 Jan 2019 14:41:25 +0530
Message-ID: <CAMty3ZAB99yMQj33XkBV-EXDN7RkapbOTaO0chYwaz=aFYto=w@mail.gmail.com>
Subject: Re: [PATCH 01/11] clk: sunxi-ng: sun8i-a23: Enable PLL-MIPI LDOs when
 ungating it
To:     Chen-Yu Tsai <wens@csie.org>
Cc:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Jan 25, 2019 at 8:54 AM Chen-Yu Tsai <wens@csie.org> wrote:
>
> The PLL-MIPI clock is somewhat special as it has its own LDOs which
> need to be turned on for this PLL to actually work and output a clock
> signal.
>
> Add the 2 LDO enable bits to the gate bits.
>
> Fixes: 5690879d93e8 ("clk: sunxi-ng: Add A23 CCU")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  drivers/clk/sunxi-ng/ccu-sun8i-a23.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-a23.c b/drivers/clk/sunxi-ng/ccu-sun8i-a23.c
> index a4fa2945f230..4b5f8f4e4ab8 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun8i-a23.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-a23.c
> @@ -144,7 +144,7 @@ static SUNXI_CCU_NKM_WITH_GATE_LOCK(pll_mipi_clk, "pll-mipi",
>                                     8, 4,               /* N */
>                                     4, 2,               /* K */
>                                     0, 4,               /* M */
> -                                   BIT(31),            /* gate */
> +                                   BIT(31) | BIT(23) | BIT(22), /* gate */

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
