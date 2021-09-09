Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D87EC433F5
	for <linux-clk@archiver.kernel.org>; Thu,  9 Sep 2021 21:13:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 599AE61100
	for <linux-clk@archiver.kernel.org>; Thu,  9 Sep 2021 21:13:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235679AbhIIVOK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 9 Sep 2021 17:14:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:59354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233991AbhIIVOK (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 9 Sep 2021 17:14:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 78FCC6103E;
        Thu,  9 Sep 2021 21:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631221980;
        bh=khWc9tixsuTt0aYiREyLbPn2gecAXQnAcd2rS3+M82I=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ns6dz4Q6/Ksjf9GQLYsIuAMmn8hmEGK4jREqlVgIytdVp3n4iFookmpZ6JKJCO8Qx
         7sNpxrxqxMI4SiFezwEK3TOyry4K0VsEOmsDeIWB6UWCMeqbJTE4aUTkoq30P2J8JO
         7yrrpwfRv5rKn4NdaZL2+j8+IeZ+unNxnSTSIUyFu1xlvdmWnHo5d49tWQ7roM0M+L
         aAZsprGlrAewev7GqW6PnLu1L4AcYkw0zux7NioTJcq15H9OngtB1l+kQPmvRm0W8d
         9RCRYpelkokX+W2YU/uYSo6YG1H61DA+J4Vluk4Z92bshngw9TyumLlE/PQUXtDJ7Z
         zuq45+etFF+Qg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210907090920.2620-1-shubhrajyoti.datta@xilinx.com>
References: <20210907090920.2620-1-shubhrajyoti.datta@xilinx.com>
Subject: Re: [PATCH] clk: zynqmp: Replaced strncpy() with strscpy()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     git-dev@xilinx.com, michal.simek@xilinx.com
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-clk@vger.kernel.org
Date:   Thu, 09 Sep 2021 14:12:59 -0700
Message-ID: <163122197920.1821005.15545429119086077225@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shubhrajyoti Datta (2021-09-07 02:09:20)
> Replaced strncpy() with strscpy() as the clock names are supposed to

And what if they aren't?

> be NULL terminated.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
>  drivers/clk/zynqmp/clkc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/zynqmp/clkc.c b/drivers/clk/zynqmp/clkc.c
> index eb25303eefed..40fbd2517016 100644
> --- a/drivers/clk/zynqmp/clkc.c
> +++ b/drivers/clk/zynqmp/clkc.c
> @@ -163,7 +163,7 @@ static int zynqmp_get_clock_name(u32 clk_id, char *cl=
k_name)
> =20
>         ret =3D zynqmp_is_valid_clock(clk_id);
>         if (ret =3D=3D 1) {
> -               strncpy(clk_name, clock[clk_id].clk_name, MAX_NAME_LEN);
> +               strscpy(clk_name, clock[clk_id].clk_name, MAX_NAME_LEN);
>                 return 0;
>         }
> =20
> @@ -712,7 +712,7 @@ static void zynqmp_get_clock_info(void)
>                 zynqmp_pm_clock_get_name(clock[i].clk_id, &name);
>                 if (!strcmp(name.name, RESERVED_CLK_NAME))
>                         continue;
> -               strncpy(clock[i].clk_name, name.name, MAX_NAME_LEN);
> +               strscpy(clock[i].clk_name, name.name, MAX_NAME_LEN);
>         }
> =20
>         /* Get topology of all clock */
> --=20
> 2.17.1
>
