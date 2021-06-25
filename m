Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B195FC2B9F4
	for <linux-clk@archiver.kernel.org>; Fri, 25 Jun 2021 23:13:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8DE7961949
	for <linux-clk@archiver.kernel.org>; Fri, 25 Jun 2021 23:13:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbhFYXP1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Jun 2021 19:15:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:43222 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229816AbhFYXP0 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 25 Jun 2021 19:15:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8ADF161454;
        Fri, 25 Jun 2021 23:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624662785;
        bh=za446qtMjFrRKoRwUyfgV+7tEPSUfKpj2TmBNzZpQko=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=a5yjzZTTsErrkX8mC8kfeNe6K5U0WOBARtzBS8JiyFpt9ZmvKchREJJI3jog6O+jZ
         XWXVJlNzGDv+unKTKXgwMNPXT3wVLMNgk4VMZqbu1O2LH4vmn9cG3ZJztsYF1pbHNn
         KnUo5z6pGAjVSdixZDgpx73siNxNEpRnBcCub70ggBFaFyuSkVnKZet5xSeIJFQBy3
         Mck831w7N2sy6YdM0xxsV2gb0ZSxQYZcv8SYXt9Uu6r8YwxoIP89RjecI94pJ8/7LK
         UBpg05X5TktOo39NB6L1al+rq7FH0QJT6DILm45Akf3kHRMmJNud3vJFTI3rgNZXoS
         hbraATPOd4Ajw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1620122886-13349-1-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1620122886-13349-1-git-send-email-shubhrajyoti.datta@xilinx.com>
Subject: Re: [PATCH] clk: zynqmp: Check the return type
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, michal.simek@xilinx.com,
        shubhrajyoti.datta@gmail.com, git@xilix.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-clk@vger.kernel.org
Date:   Fri, 25 Jun 2021 16:13:04 -0700
Message-ID: <162466278425.3259633.17117251914154899652@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shubhrajyoti Datta (2021-05-04 03:08:06)
> Currently the return value of of_clk_add_hw_provider is ignored.
> lets check and return value.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
>  drivers/clk/zynqmp/clkc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/clk/zynqmp/clkc.c b/drivers/clk/zynqmp/clkc.c
> index db8d0d7..5f674c5 100644
> --- a/drivers/clk/zynqmp/clkc.c
> +++ b/drivers/clk/zynqmp/clkc.c
> @@ -739,9 +739,7 @@ static int zynqmp_clk_setup(struct device_node *np)
>         zynqmp_register_clocks(np);
> =20
>         zynqmp_data->num =3D clock_max_idx;
> -       of_clk_add_hw_provider(np, of_clk_hw_onecell_get, zynqmp_data);
> -
> -       return 0;
> +       return of_clk_add_hw_provider(np, of_clk_hw_onecell_get, zynqmp_d=
ata);

Please free allocations on error. Also it would be useful to inline this
whole function into the probe function and then use devm. With all that
done this patch will become superb! I'm looking forward to it.

>  }
> =20
>  static int zynqmp_clock_probe(struct platform_device *pdev)
> --=20
> 2.1.1
>
