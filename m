Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4330FC04FF3
	for <linux-clk@archiver.kernel.org>; Mon, 24 May 2021 10:58:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18645610C8
	for <linux-clk@archiver.kernel.org>; Mon, 24 May 2021 10:58:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232494AbhEXK73 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 May 2021 06:59:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232422AbhEXK72 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 May 2021 06:59:28 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4E76C061574
        for <linux-clk@vger.kernel.org>; Mon, 24 May 2021 03:58:00 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id y14so25988368wrm.13
        for <linux-clk@vger.kernel.org>; Mon, 24 May 2021 03:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=ca+wrM4nB27tPYpaZYyNnd8UcG3q9suStj34yK6Un7E=;
        b=p3yXEgVCpGPrz9zkR6Zzuc5sDlLkQsKfiO/YoCMpdgz/ppvHr3bBjfNdf6c8SO4Iy/
         3K4Me5eoSg1GfVsQ+vl+Y8h6tAZRQVkZywVQW5HfemqRb7oCD97DOP+vOIqdUH195DMh
         kdA+6kLyl0Tih2LJxM6s5zJ0PFppcWT8ZCKu4RkERu18521jybeh+W8iaxywnLDYA7ui
         drnCnPOOJbqicvtdRs4n8+qTlrAQj5mp9jvT586dbNovojbzqEXQOF4kctU7Wed5h2uz
         zFswvwM0itvuQUWyz8vMVw25IzZmSTm/CiT5BJh5J1x9E5xoOZ3QAvXkfqie/QFTIkDf
         R0qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=ca+wrM4nB27tPYpaZYyNnd8UcG3q9suStj34yK6Un7E=;
        b=PkUOsHs7in8JUn+xP/f8I4Jd08O+q9vmadS3nBgVOK4Am+InOQLguqr4iqg451qenr
         v1fqLA4qgtwFysE5K+v0yU5HPJr1LT4GNYwzM+OGRF8gBTVuqICjeckYxWn5vHDXL+gr
         AkX0LugRsNNsMs3xOEknTEdjZw9g3azTIpT82my1kzX3mL8btuexdQD4h4dRXLBlh5/D
         8yCodoc044QKrdZfdo04TOAFfX/TkxZgILSRy9FK81MQyW4ciZ8MfwrPfkWkTySu0fHN
         9zvV7C3bHhwiu8/seLoDKFAkPfD9eeKSjB31InQJbHn7QCL4ywEICEZ4pNDw5Ce6icLp
         GNFw==
X-Gm-Message-State: AOAM531cGR4zWohEIE3IMdrdtNRu8IhWSoRuMktzvoqmsjYVk+P5UULN
        rYGXA8FIrvHGs6JuuIHy/Hloiw==
X-Google-Smtp-Source: ABdhPJwnA1Tof4wfbC4fiInMwYqNaO7wHn6JjxWaZbqPVDjThgdzOsS0GgofwNSeJB8C0OKQ3zGdGg==
X-Received: by 2002:adf:ce02:: with SMTP id p2mr21626617wrn.156.1621853879397;
        Mon, 24 May 2021 03:57:59 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id o15sm7636877wmh.36.2021.05.24.03.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 03:57:58 -0700 (PDT)
References: <20210524104533.555953-1-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.4.15; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org
Cc:     narmstrong@baylibre.com, mturquette@baylibre.com, sboyd@kernel.org,
        khilman@baylibre.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: meson: meson8b: Don't use MPLL1 as parent of
 vclk_in_sel
In-reply-to: <20210524104533.555953-1-martin.blumenstingl@googlemail.com>
Message-ID: <1jsg2cbdqh.fsf@starbuckisacylon.baylibre.com>
Date:   Mon, 24 May 2021 12:57:58 +0200
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Mon 24 May 2021 at 12:45, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> MPLL1 is needed for audio output. Drop it from the vclk_in_sel parent
> list so we only use the (mutable) vid_pll_final_div tree or one of the
> (fixed) FCLK_DIV{3,4,5} clocks.

Are the fixed ones actually needed ?

If the consumer actually lives on the vid_pll only, I'd prefer if you
could add CLK_SET_RATE_NOREPARENT and assign the proper parent in DT with
`assigned-clock-parents`

>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/clk/meson/meson8b.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> index a844d35b553a..f8bd211db720 100644
> --- a/drivers/clk/meson/meson8b.c
> +++ b/drivers/clk/meson/meson8b.c
> @@ -1154,6 +1154,10 @@ static struct clk_regmap meson8b_vid_pll_final_div = {
>  	},
>  };
>  
> +/*
> + * parent 0x6 is meson8b_mpll1 but we don't use it here because it's reserved
> + * for the audio outputs.
> + */
>  static const struct clk_hw *meson8b_vclk_mux_parent_hws[] = {
>  	&meson8b_vid_pll_final_div.hw,
>  	&meson8b_fclk_div4.hw,
> @@ -1161,7 +1165,6 @@ static const struct clk_hw *meson8b_vclk_mux_parent_hws[] = {
>  	&meson8b_fclk_div5.hw,
>  	&meson8b_vid_pll_final_div.hw,
>  	&meson8b_fclk_div7.hw,
> -	&meson8b_mpll1.hw,
>  };
>  
>  static struct clk_regmap meson8b_vclk_in_sel = {

