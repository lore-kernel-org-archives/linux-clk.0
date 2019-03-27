Return-Path: <SRS0=c6wZ=R6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 271BAC43381
	for <linux-clk@archiver.kernel.org>; Wed, 27 Mar 2019 10:51:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D2B8220811
	for <linux-clk@archiver.kernel.org>; Wed, 27 Mar 2019 10:51:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="cgDzqEBl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732384AbfC0Kvs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 27 Mar 2019 06:51:48 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41250 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732026AbfC0Kvs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 27 Mar 2019 06:51:48 -0400
Received: by mail-wr1-f66.google.com with SMTP id r4so10275524wrq.8
        for <linux-clk@vger.kernel.org>; Wed, 27 Mar 2019 03:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=whkKhI+tBkxQ3DBj/1BujfBmXUt+Yvq0OEuaSpUdaxU=;
        b=cgDzqEBlkFT09bW3V4y+a0i+SLRqvC7ch6Lofmji0KkEcPv1p5eOBK6cOfu/hQ2k2n
         +0WoU/Q8Kn1A3vnA11vMaBhed9zkgkEm5HRh/TajARE9KARPaVldIFtyxVaha0VlFaMm
         TDWR1f0w3TxtCvXvKQ5Cm4Hrza365zLwp+EuVYIXTzOz5YeH8yYLoBLd3p7x4DInbHw3
         sgProb3it7GVP7iT1aEUrqNr7vf/lVQP6KYzPFaeV2+NU+H4gEpLcQqXlq1Vch7RNvQE
         PLy0hdnUyKEazJnd9xP0O5q0HCjxtxobqEqXbR28wY/WVYOBDK3xAJXBCFmEuIqOTQjf
         c74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=whkKhI+tBkxQ3DBj/1BujfBmXUt+Yvq0OEuaSpUdaxU=;
        b=OCjJJ75SBvgxYDLzoM6y3rnyOzQfNT2rRSICsy1RCD0sosnDYryJnqtFDr9VI4r9Ce
         mKuaEiP+GAbg1nAnW/ita93n8maqWAOdfQmAzWZs9TPeXq7NSL2as5/aAlLGjSU1jXLU
         kAaOjBiBHJPGpE5RfjQo8SG/QWGElACaQfe6npYfVvOChzu1zRKfxqbw2l8D5mkbf+eL
         Srxrr9NPjLmAXSZtJ3MPfHnWjOVfi9i/hAYhGBPsBT240FhIqTFcW7Y3W+yww2pUHQy1
         spWeJfXuxNLJcD3HkQ2XW0PQmQvWB2KCY9rpaH52BAOerekxRuGHXYoesZ83KBTeqTg7
         g2BA==
X-Gm-Message-State: APjAAAXKK8iYZzNnxWpagkRxid+eyfwsAAYPvXO3XKFsIG3YXUd+LdLZ
        ANSMsix8YeqWNk5Sm97A4gl4uw==
X-Google-Smtp-Source: APXvYqxGefO8AtgH30eo/0x87l2ofD2BKnceDI9gln8NsdNB7wdd/mruh3hD/f1eKcJNPAp9twAFGg==
X-Received: by 2002:adf:d84d:: with SMTP id k13mr25301283wrl.154.1553683906216;
        Wed, 27 Mar 2019 03:51:46 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
        by smtp.gmail.com with ESMTPSA id n189sm33090938wmb.28.2019.03.27.03.51.44
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 27 Mar 2019 03:51:45 -0700 (PDT)
Message-ID: <345dd7e287ed07f4a84847ff024fce237c1380a1.camel@baylibre.com>
Subject: Re: [PATCH RFC 3/6] clk: meson: g12a: mark fclk_div3 as critical
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com
Cc:     linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Date:   Wed, 27 Mar 2019 11:51:42 +0100
In-Reply-To: <20190327103308.25058-4-narmstrong@baylibre.com>
References: <20190327103308.25058-1-narmstrong@baylibre.com>
         <20190327103308.25058-4-narmstrong@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 2019-03-27 at 11:33 +0100, Neil Armstrong wrote:
> On Amlogic Meson G12b platform, the fclk_div3 seems to be necessary for
> the system to operate correctly.
> 
> Disabling it cause the entire system to freeze, including peripherals.
> 
> This patch patch marks this clock as critical, fixing boot on G12b platforms.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/clk/meson/g12a.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index 03b4c78f558f..d62ebcd2162d 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -1062,6 +1062,16 @@ static struct clk_fixed_factor g12a_fclk_div3_div = {
>  		.ops = &clk_fixed_factor_ops,
>  		.parent_names = (const char *[]){ "fixed_pll" },
>  		.num_parents = 1,
> +		/*
> +		 * This clock is used by the resident firmware and is required
> +		 * by the platform to operate correctly.
> +		 * Until the following condition are met, we need this clock to
> +		 * be marked as critical:
> +		 * a) Mark the clock used by a firmware resource, if possible
> +		 * b) CCF has a clock hand-off mechanism to make the sure the
> +		 *    clock stays on until the proper driver comes along
> +		 */
> +		.flags = CLK_IS_CRITICAL,

The gate should be critical then, not the fixed_divider clock.
the fdiv3 gate is a child of this clock, so fdiv3 should still be able to gate
with this


>  	},
>  };
> 
>  

Could you CC me of the whole series next time, I prefer getting the all
context.

