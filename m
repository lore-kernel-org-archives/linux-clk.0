Return-Path: <SRS0=1mk2=2X=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2FC3C3276C
	for <linux-clk@archiver.kernel.org>; Thu,  2 Jan 2020 12:48:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C8DC520863
	for <linux-clk@archiver.kernel.org>; Thu,  2 Jan 2020 12:48:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GNJfKR2B"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728288AbgABMsA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 Jan 2020 07:48:00 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40436 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728302AbgABMr6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Jan 2020 07:47:58 -0500
Received: by mail-wr1-f65.google.com with SMTP id c14so39093524wrn.7
        for <linux-clk@vger.kernel.org>; Thu, 02 Jan 2020 04:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=ZPjjlsLBRy/AsEOd+5TSLn081vD0O0nsEFO/LF3ENuo=;
        b=GNJfKR2BW87CUTDAdER/HrYYLqseSgCIl1bZUDk4RmYZCp4/Z0iULdGwZYN6A8LFIU
         NVpa5uSYKjQ5lujMZfT+b1X0G8kamQVGs1ru8vVPMk/Ka5Sh1/uHDyrkuLKsINdOnOcB
         N1DK/TgTCX3jezUlxvz4SnkpByciHZZjGYtImSdU11ikysE6tfwlY8B67ctRZ4ewZryC
         Dro6n8qznNkXTgbbbScuLuZA5Lit5zdyN8C1+Yj26GmrK9vduR6HLXsq/0iYZTVepNgV
         FOIfYu8f/pv8p01ABASWH6H8VUow27wT2bg2Oq+LXE5D1gY9QG28+VD549EP4RO/b8sI
         fEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=ZPjjlsLBRy/AsEOd+5TSLn081vD0O0nsEFO/LF3ENuo=;
        b=I+dmLeLY4rRMt6kQ2JTwjiI8ne2z/nSKXJ5RbUvUag8087UJh3pvRk7SIPa0JpQHBO
         tRiZ6dzaNK+I9VY4deFEU63pjaNZu7Dblg/z8tX6ijZIVPtOi7JGnrNqgvX4MF1KHOTN
         BKyczBc2m1qv+NyrJK6NbGs3doUGkKOD6YX7gSY9OpqXSgDWesOUpA84TRqKBaUqm8Bi
         Kc85G6QofoGUtPd7eWlFijjQBQ4oS4Yvfehs1rlHcvp1U9rNmuQDISnaKiXgRy4h9L3f
         naJTkVU1QRPMW/PNMiSh9obs8Qn+F4UkocKVVb5abgopkgkNQ1ppRFzpGqFd3oZ7lm/l
         5ckg==
X-Gm-Message-State: APjAAAVEZhat84Zw/WmnmW6CHWRKnKJggHO0Y5DqYuZa1PFkAbl+/7MG
        1SJ/M4yhwlEXj8Pf6dnaP2kwFA==
X-Google-Smtp-Source: APXvYqzwGUgWcvkkN8gOC3/lVJJr0Lne8X1G54XU++EANytHtRvN2z6E9NP6cuFHkOL/vDpXUUvwFg==
X-Received: by 2002:adf:d846:: with SMTP id k6mr78632937wrl.337.1577969275854;
        Thu, 02 Jan 2020 04:47:55 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id t8sm54509968wrp.69.2020.01.02.04.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2020 04:47:54 -0800 (PST)
References: <20200102005503.71923-1-sboyd@kernel.org>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2] clk: Warn about critical clks that fail to enable
In-reply-to: <20200102005503.71923-1-sboyd@kernel.org>
Date:   Thu, 02 Jan 2020 13:47:53 +0100
Message-ID: <1j8smqja86.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Thu 02 Jan 2020 at 01:55, Stephen Boyd <sboyd@kernel.org> wrote:

> If we don't warn here users of the CLK_IS_CRITICAL flag may not know
> that their clk isn't actually enabled because it silently fails to
> enable. Let's print a warning in that case so developers find these
> problems faster.

Thanks Stephen !
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

>
> Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---
>
> Changes from v1:
>  * Switched to pr_warn and indicated clk name
>
>  drivers/clk/clk.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 772258de2d1f..b03c2be4014b 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -3427,13 +3427,18 @@ static int __clk_core_init(struct clk_core *core)
>  		unsigned long flags;
>  
>  		ret = clk_core_prepare(core);
> -		if (ret)
> +		if (ret) {
> +			pr_warn("%s: critical clk '%s' failed to prepare\n",
> +			       __func__, core->name);
>  			goto out;
> +		}
>  
>  		flags = clk_enable_lock();
>  		ret = clk_core_enable(core);
>  		clk_enable_unlock(flags);
>  		if (ret) {
> +			pr_warn("%s: critical clk '%s' failed to enable\n",
> +			       __func__, core->name);
>  			clk_core_unprepare(core);
>  			goto out;
>  		}
>
> base-commit: 12ead77432f2ce32dea797742316d15c5800cb32

