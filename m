Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 616A1C2D0E4
	for <linux-clk@archiver.kernel.org>; Wed, 18 Nov 2020 01:42:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F103124248
	for <linux-clk@archiver.kernel.org>; Wed, 18 Nov 2020 01:42:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="GtqXQbqP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbgKRBmR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 Nov 2020 20:42:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:35262 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725767AbgKRBmR (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 17 Nov 2020 20:42:17 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DC857208CA;
        Wed, 18 Nov 2020 01:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605663737;
        bh=8vdUHJx6QdVqwIXSt3q/abygMXVBbcnI4fiQGK9hEdw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=GtqXQbqPMuvnbSVNd1sQInUwGh1w1X5+nzaxp6jpkMgvakpVNlyAW1EeyoYl0MNva
         HZtisoXZkTojQvVcb3Ysi9K8vU65WHUiosAPtKIOt5S+QCLUQMR4v0stApNpR28Dig
         obtwuV4SNepeHzLG05W4HkygKXD8NVmpZL+5dBRg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201117160306.21760-1-info@metux.net>
References: <20201117160306.21760-1-info@metux.net>
Subject: Re: [PATCH] (v2) drivers: clk: make gpio-gated clock support optional
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, matthias.bgg@gmail.com,
        linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org
Date:   Tue, 17 Nov 2020 17:42:15 -0800
Message-ID: <160566373556.60232.14730664139007414312@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Enrico Weigelt, metux IT consult (2020-11-17 08:03:06)
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index c715d4681a0b..99e0188a15be 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -38,6 +38,14 @@ menuconfig COMMON_CLK
> =20
>  if COMMON_CLK
> =20
> +config COMMON_CLK_GPIO
> +       tristate "GPIO gated clock support"
> +       default y

Maybe 'default GPIOLIB'?

> +       select gpiolib

Does lowercase work here?

> +       help
> +         Supports gpio gated clocks, which can be enabled/disabled via
> +         gpio output.
> +
>  config COMMON_CLK_WM831X
>         tristate "Clock driver for WM831x/2x PMICs"
>         depends on MFD_WM831X
