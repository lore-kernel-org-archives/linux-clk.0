Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B78EC7EE43
	for <linux-clk@archiver.kernel.org>; Mon, 12 Jun 2023 20:05:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233804AbjFLUFX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jun 2023 16:05:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234982AbjFLUEm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 16:04:42 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67AC810CE
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 13:04:40 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-30e53cacc10so3058450f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 13:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686600279; x=1689192279;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=YzNsZC6f0ahxcqJoEVkr3mmh3LhtJkgOMa+jSW4jW4w=;
        b=Bf7pNtCF/I7e3eWMOv6SyG52CdpbOvoHwSlm74rGPTi0sdpPC5Xm2EU1eb2u2exmi5
         VQYrRpwns3q4FMFWvCysI1lQC78YYuPi41xQ5jbvO78hzMN/IC6uoBDK/9RHY5chnSPP
         v4Y76tVi+eYetxsQmh8lVUkyls4uhh3oH7n2FCjYv3DVqHjz6HmByWfLgI1xSma3GsvV
         n6CEGg/H2X4y5vHSMKug5EY8rkNH/8EajTI/1t6BhbAUucSiY54Ce3wnRGXHe9N0/1vy
         kVGvZX2QYB2KPKR7cOLweqyKOg61L9MJrPm1cfK5iiUBZteYlHJEkM0wkQ8sHVFlepS1
         Jo4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686600279; x=1689192279;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YzNsZC6f0ahxcqJoEVkr3mmh3LhtJkgOMa+jSW4jW4w=;
        b=fh5OTxd65HiEFTOOyapX8JKFU6epCthoFxtULjmV806K/iTpPZt6gXsDUyIClZ88Gs
         2qdKRXhJhhHBJHhgXkWYsAPCEiLxTvroJpBM6EREa35NfnuLNBSLqigudC9znSs11bGE
         wv0xzokioNSRoBHm0Nl8UkIrASytpgH30tEnDfH8tIMOosK0GNAlCIRYz4ZK8nMIG2eA
         +34s3ycCGg7uhXKpsRnXofG1wm/lG+Q4agv9PQPOl3Ro06hn6rL3Q1m1aNI7854wOUCs
         0VWBPJ2zvYqOTZf6lsExsVY6duINwZIlHA7dxx4ydwrSy8HDhYFe2pcOEMUPogR5DnoG
         o5Gw==
X-Gm-Message-State: AC+VfDxCb7H40V5EALJMmneI2xmKWTA8c/bPVMpg+CO1W92/rZB1yUy0
        tny6d5Rb7ZTvKxHo5KENhk/2vMgWa7tJsDsSRH8=
X-Google-Smtp-Source: ACHHUZ4u9yNXmp6fhE5G8NnIfX3V5/d6Zvn8rSRouBJFVjUSo4oN1ZFCeTUbWQfFUxGOVTVzl54GQg==
X-Received: by 2002:adf:f410:0:b0:30f:bc8f:6d49 with SMTP id g16-20020adff410000000b0030fbc8f6d49mr4131648wro.13.1686600278783;
        Mon, 12 Jun 2023 13:04:38 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id i17-20020a5d6311000000b0030fae360f14sm8035712wru.68.2023.06.12.13.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 13:04:37 -0700 (PDT)
References: <20230612182332.371003-1-sboyd@kernel.org>
User-agent: mu4e 1.8.13; emacs 28.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        patches@lists.linux.dev, Jian Hu <jian.hu@amlogic.com>,
        Dmitry Rokosov <ddrokosov@sberdevices.ru>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] clk: meson: a1: Staticize rtc clk
Date:   Mon, 12 Jun 2023 22:03:11 +0200
In-reply-to: <20230612182332.371003-1-sboyd@kernel.org>
Message-ID: <1jzg54fnvw.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Mon 12 Jun 2023 at 11:23, Stephen Boyd <sboyd@kernel.org> wrote:

> Sparse rightly complains that this symbol is supposed to be static.
>
> Cc: Jian Hu <jian.hu@amlogic.com>
> Cc: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Fixes: 84af914404db ("clk: meson: a1: add Amlogic A1 Peripherals clock controller driver")
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

Sorry this got through.

> ---
>  drivers/clk/meson/a1-peripherals.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/meson/a1-peripherals.c b/drivers/clk/meson/a1-peripherals.c
> index b320134fefeb..75dfae210fe5 100644
> --- a/drivers/clk/meson/a1-peripherals.c
> +++ b/drivers/clk/meson/a1-peripherals.c
> @@ -218,7 +218,7 @@ static struct clk_regmap rtc_32k_sel = {
>  	},
>  };
>  
> -struct clk_regmap rtc = {
> +static struct clk_regmap rtc = {
>  	.data = &(struct clk_regmap_gate_data){
>  		.offset = RTC_BY_OSCIN_CTRL0,
>  		.bit_idx = 30,

