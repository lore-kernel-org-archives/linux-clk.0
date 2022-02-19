Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C31CC433EF
	for <linux-clk@archiver.kernel.org>; Sat, 19 Feb 2022 02:22:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241090AbiBSCXK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Feb 2022 21:23:10 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240107AbiBSCXJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Feb 2022 21:23:09 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A235258466
        for <linux-clk@vger.kernel.org>; Fri, 18 Feb 2022 18:22:50 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1F18C62041
        for <linux-clk@vger.kernel.org>; Sat, 19 Feb 2022 02:22:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 663F3C340E9;
        Sat, 19 Feb 2022 02:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645237369;
        bh=JIfWwGj3h2C8+NH7ZVy3Yj2COJfABgpuMBYI5MHOeRk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=pIPQQjvmmVk+z0YSJQU/SzWwz2SXL+EIoKCkxZML82yNw1JKjQKy6mU2Ce8JyhbOt
         Y9QIHCnXyf92nEeJSOSudUtnKhKk8UQrS7NLUuwuzxX6xTMcgIPjnWKmLn0fOJ8TbB
         9vZ1LMNiieru9Uh4O+JcBFQSPPOhFe/S8/ErFDDbFQEVVfsdFdNBG6vuWHMa/bZzIb
         KcIGBNIQyZDQZGNJ0nbn9QblB5+KcAAe7V/ANCWGex0tOGSGSokMhFPno8UQuboJVh
         VoCKf92UoG+u8NZf/buaqrnUecgsDJQVmH4Vun6CmlVytmZRsv1eGVa/MrOqTlW1KL
         cAtN6DcmT1KdA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220125141549.747889-6-maxime@cerno.tech>
References: <20220125141549.747889-1-maxime@cerno.tech> <20220125141549.747889-6-maxime@cerno.tech>
Subject: Re: [PATCH v4 05/10] clk: Add clk_drop_range
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        Maxime Ripard <maxime@cerno.tech>
To:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>
Date:   Fri, 18 Feb 2022 18:22:47 -0800
User-Agent: alot/0.10
Message-Id: <20220219022249.663F3C340E9@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2022-01-25 06:15:44)
> index 266e8de3cb51..f365dac7be17 100644
> --- a/include/linux/clk.h
> +++ b/include/linux/clk.h
> @@ -1005,6 +1005,17 @@ static inline struct clk *clk_get_optional(struct =
device *dev, const char *id)
>         return clk;
>  }
> =20
> +/**
> + * clk_drop_range - Reset any range set on that clock
> + * @clk: clock source
> + *
> + * Returns success (0) or negative errno.
> + */
> +static inline int clk_drop_range(struct clk *clk)
> +{
> +       return clk_set_rate_range(clk, 0, ULONG_MAX);
> +}

Please move this above clk_get_optional() as this is the "clk_get" zone
of this file.

> +
>  #if defined(CONFIG_OF) && defined(CONFIG_COMMON_CLK)
>  struct clk *of_clk_get(struct device_node *np, int index);
