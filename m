Return-Path: <SRS0=DelH=WE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A69E4C433FF
	for <linux-clk@archiver.kernel.org>; Thu,  8 Aug 2019 21:18:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6A8192173E
	for <linux-clk@archiver.kernel.org>; Thu,  8 Aug 2019 21:18:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="yVsG+UlR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730768AbfHHVS7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Aug 2019 17:18:59 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36625 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730678AbfHHVS7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Aug 2019 17:18:59 -0400
Received: by mail-pf1-f196.google.com with SMTP id r7so44798129pfl.3
        for <linux-clk@vger.kernel.org>; Thu, 08 Aug 2019 14:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=vwaIEfS1FAZl0r/hGbrJVWd7+Oh098wPSMDgW6Rp92k=;
        b=yVsG+UlRQMtUxQczwRr+tGNXUpgb5JuGIZ9Hfs14iduOWR4txHlXpZxwWUtDpHEICM
         0MfbhxhGzwCJYtqk5hFjfeD7f431qxlD05AvrQtalNSTduDiqTXEzg9UGnLeuDvICMHA
         amsVyPWg0D2y/C8YKdGFbHSa+zooR1bVvWW6htALbJFbSc6XmTp7bdV5UlaBBO7BnVib
         Dw7ZdWKCoPW25wvAOjSzgAlahac71LGMqXF2ZndJhZxbF2KxWBMg6tW8x75BCxGLlWci
         qvlzvbM2kfW6rShIo0jnFME52p2//RFT4yhtncWCGiQOIjt9x5fflNeS7IbAM10OkQf+
         hL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=vwaIEfS1FAZl0r/hGbrJVWd7+Oh098wPSMDgW6Rp92k=;
        b=Tycf1TbIkw9WYrNPi/QFh+JGx0Wyye7rUmxOHDbmR/S3H3auFLvIbb7VJyGvwFUv5v
         2SR8DAz6Tb0QvW1p90Pbu4pOqP8MKayc3UrLXY8IscJX+lJSml7uUjEE4KH8IzwFMtR+
         0CJVb6BhQr73YEa6BBaWjhGB2zbjYsGPXE0moAGRM9xFmwpz4nJqwkHkNqUnsJ5j2AeW
         q9HZxIw1PwM8UoLD7KKADvbp9WFR7L2AQ+qdg6ln3rpdIvbOmHfQqTghfi1C/nKwBbhr
         A9efSIxE63zsjS9+qJJMgb9wxP6+XlrFyWNT9t+p/jz0HUGhA8KpX5v1Dd7VcTYWv7aq
         M9IA==
X-Gm-Message-State: APjAAAUnk01Uo4l0T8tfeiLhw8qIy7dfaW3mVIWtG6il9IRjVhDQLGC+
        bmQZGa8Grsv1/r7TzSlMRb9dEg==
X-Google-Smtp-Source: APXvYqyy4N7d0TMp06csDZZcZzQG4KzhyFYusr8lIgCgQLzqwyDXrb7dFwjXWCDy+6BWpdpaIBvNUw==
X-Received: by 2002:aa7:8705:: with SMTP id b5mr18439724pfo.27.1565299138091;
        Thu, 08 Aug 2019 14:18:58 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id s5sm79644816pfm.97.2019.08.08.14.18.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2019 14:18:57 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>, sboyd@kernel.org,
        jbrunet@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/4] clk: meson: g12a: add support for DVFS
In-Reply-To: <20190731084019.8451-1-narmstrong@baylibre.com>
References: <20190731084019.8451-1-narmstrong@baylibre.com>
Date:   Thu, 08 Aug 2019 14:18:56 -0700
Message-ID: <7hzhkje4ov.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> The G12A/G12B Socs embeds a specific clock tree for each CPU cluster :
> cpu_clk / cpub_clk
> |   \- cpu_clk_dyn
> |      |  \- cpu_clk_premux0
> |      |        |- cpu_clk_postmux0
> |      |        |    |- cpu_clk_dyn0_div
> |      |        |    \- xtal/fclk_div2/fclk_div3
> |      |        \- xtal/fclk_div2/fclk_div3
> |      \- cpu_clk_premux1
> |            |- cpu_clk_postmux1
> |            |    |- cpu_clk_dyn1_div
> |            |    \- xtal/fclk_div2/fclk_div3
> |            \- xtal/fclk_div2/fclk_div3
> \ sys_pll / sys1_pll
>
> This patchset adds notifiers on cpu_clk / cpub_clk, cpu_clk_dyn,
> cpu_clk_premux0 and sys_pll / sys1_pll to permit change frequency of
> the CPU clock in a safe way as recommended by the vendor Documentation
> and reference code.
>
> This patchset :
> - introduces needed core and meson clk changes
> - adds the clock notifiers
>
> Dependencies:
> - None

nit: this doesn't apply to v5.3-rc, but appears to apply on
clk-meson/v5.4/drivers, so it appears to be dependent on the cleanups
from Alex.

Kevin
