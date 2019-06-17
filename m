Return-Path: <SRS0=KwYV=UQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68963C31E5B
	for <linux-clk@archiver.kernel.org>; Mon, 17 Jun 2019 14:49:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3CA8220833
	for <linux-clk@archiver.kernel.org>; Mon, 17 Jun 2019 14:49:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="zpLLRFcL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727900AbfFQOtk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Jun 2019 10:49:40 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38798 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726173AbfFQOtk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Jun 2019 10:49:40 -0400
Received: by mail-wm1-f65.google.com with SMTP id s15so9436850wmj.3
        for <linux-clk@vger.kernel.org>; Mon, 17 Jun 2019 07:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=z3Ijq73JvPFinVKvIlXsRKgjHeVTmhxAzaIQ0VNZ8gw=;
        b=zpLLRFcLZX+fxtSYSlFZDM6wvK1u5/4GaYhpCf8nqM0+9eZoadeLGjsOA1IfK2nohV
         LvjGslUhyjY7tJV858930z2+Nk9DZcGRsbsiORXssTyBSqnhBrHz5Qq6PTwcPpKZBpuM
         g2vGyORboxeAQlioKCB3semVvRL5aRTvUP+DE8fRd6iIVOmQEha+e9Lu/IR5gO33QW98
         IphBRAAVMvYCF5BXF+FANUKoaiid/A82c6tdpWVepUQNOp6byt61yaV9hiz+UTl/fpzK
         sHtvAX66bnz2Rnoj6ZzHSesbU7ie81QUdd5YWeWpdJM4h5hc+6TDWvSbyg4KrG983qPy
         khnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=z3Ijq73JvPFinVKvIlXsRKgjHeVTmhxAzaIQ0VNZ8gw=;
        b=A7escnxv+76oDG2yIln8SPlDab10rW2jMYQypQU6NQLSEAJP/ifzeaf1fY6DlkfHgd
         O0FqOaHzocVsR3zT48dbImcMrfr+CBKgxP06LXTMlw3ffARe12VoAkpkigYJjmG1btJh
         0lhWAs5uonkkleDjtnqH11XaoJt0IQRDaWmkidl1yH/302hdfEtTu38b6eQMVzxSNOww
         Ic3iX+qmO/nvxqT828C9RjmE2DrZlJ1nUJ4FDPXWnpvak+Ls9/60OsnoO4smrw4gFg6W
         f/gWaBFJy2J6vZUdozBzcqYwN9xJl9SBF7ko5Xv+fE7W7HDA/K1M/OnR6PGIUufkUBBO
         ivyw==
X-Gm-Message-State: APjAAAWEBh+EeyBakw+umtazWNnh4K0urKhGWLNdgH5jRHcDnGqXMuGd
        iWabDEn0gd3fU2pKj3YQ2yvotg==
X-Google-Smtp-Source: APXvYqwsZ9TPM46fTLGg1cbQZji+1aFLeLmwy4T5p90ZmVpi9hLvKvj3BYlesL1mid6mUlyRBm0sgw==
X-Received: by 2002:a1c:544d:: with SMTP id p13mr20302760wmi.78.1560782977623;
        Mon, 17 Jun 2019 07:49:37 -0700 (PDT)
Received: from boomer.baylibre.com (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id g8sm9907656wmf.17.2019.06.17.07.49.36
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 07:49:37 -0700 (PDT)
Message-ID: <dd09f9d2c05153b9a5e7819acfeefde9428ac1f2.camel@baylibre.com>
Subject: Re: [PATCH] clk: Simplify clk_core_can_round()
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Mon, 17 Jun 2019 16:49:36 +0200
In-Reply-To: <20190617120248.9590-1-geert+renesas@glider.be>
References: <20190617120248.9590-1-geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 2019-06-17 at 14:02 +0200, Geert Uytterhoeven wrote:
> A boolean expression already evaluates to true or false, so there is no
> need to check the result and return true or false explicitly.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/clk/clk.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index aa51756fd4d695b3..c68bc5f695912bf5 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1324,10 +1324,7 @@ static void clk_core_init_rate_req(struct clk_core * const core,
>  
>  static bool clk_core_can_round(struct clk_core * const core)
>  {
> -	if (core->ops->determine_rate || core->ops->round_rate)
> -		return true;
> -
> -	return false;
> +	return core->ops->determine_rate || core->ops->round_rate;
>  }
>  
>  static int clk_core_round_rate_nolock(struct clk_core *core,

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

