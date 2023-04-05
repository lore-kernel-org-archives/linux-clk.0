Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F44C77B6C
	for <linux-clk@archiver.kernel.org>; Wed,  5 Apr 2023 21:07:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231269AbjDEVHD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 5 Apr 2023 17:07:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233294AbjDEVHC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Apr 2023 17:07:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D4486A44;
        Wed,  5 Apr 2023 14:06:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E333E629AF;
        Wed,  5 Apr 2023 21:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B7CC433EF;
        Wed,  5 Apr 2023 21:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680728811;
        bh=fz0oE9b+bDhzOWWOAvv6B6YisnPYx9wmX8/hMqSu9jo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=s50Ds8+mcer6wqL8iE5+a76eX25ZEddQ7rNLtSxRtv8Jn3/CdiL6j3uxH/wqDveOw
         qgL1XvfnKm2+lSpWLQAh8V6/h1ZB8H9CDr7Ae/+1Ar5S9u5LuaQAhLIwrEOBeCs8cK
         foA2pKx8rUuxKmBIT5bMgxZMoL+KCqQNWAUUIfoc3VMQ71wdZfh2SzLQYSdGzOPjg5
         ICNfrjCeFUXxd0wbe/xkWzpicgJL3eY1PUr78B2qN2q+Iv14IBX7lJ3e3o+eH8aSem
         eqfVYml43FLB3TBMy1joQUGmRg94bGjdUBtiv2GMuLSiND7h5RVXiajwHy6mTEMROj
         ZCjJT4e/Ladjw==
Message-ID: <43a469322f1557feb252a08bd4a42f03.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230329075104.165176-3-mmyangfl@gmail.com>
References: <20230329075104.165176-1-mmyangfl@gmail.com> <20230329075104.165176-3-mmyangfl@gmail.com>
Subject: Re: [PATCH v2 2/4] clk: hisilicon: Use helper functions
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Yang <mmyangfl@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>,
        Nick Alcock <nick.alcock@oracle.com>
To:     David Yang <mmyangfl@gmail.com>, linux-clk@vger.kernel.org
Date:   Wed, 05 Apr 2023 14:06:49 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting David Yang (2023-03-29 00:50:51)
> Remove redundant codes.
>=20
> Signed-off-by: David Yang <mmyangfl@gmail.com>
> ---
>  drivers/clk/hisilicon/clk-hi3519.c      | 134 ++----------
>  drivers/clk/hisilicon/clk-hi3559a.c     | 228 +++-----------------
>  drivers/clk/hisilicon/clk-hi3660.c      | 207 ++++++------------
>  drivers/clk/hisilicon/clk-hi3670.c      | 270 +++++++++---------------
>  drivers/clk/hisilicon/crg-hi3516cv300.c | 177 ++--------------
>  drivers/clk/hisilicon/crg-hi3798cv200.c | 206 +++---------------

Maybe you can do this file by file in a different patch? And the commit
text can say that you're migrating to the new way of registering clks
with a device pointer?

>  drivers/clk/hisilicon/crg.h             |   6 -
>  7 files changed, 260 insertions(+), 968 deletions(-)
>=20
> diff --git a/drivers/clk/hisilicon/clk-hi3519.c b/drivers/clk/hisilicon/c=
lk-hi3519.c
> index ad0c7f350cf0..199d1b8c3140 100644
> --- a/drivers/clk/hisilicon/clk-hi3519.c
> +++ b/drivers/clk/hisilicon/clk-hi3519.c
> @@ -6,11 +6,13 @@
>   */
> =20
>  #include <dt-bindings/clock/hi3519-clock.h>
> -#include <linux/clk-provider.h>

It's still a clk provider. Keep this include.

> +
> +#include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/platform_device.h>

Also still a platform driver. Keep this include.

> +#include <linux/of_device.h>

Not sure what this include is for.

> +
>  #include "clk.h"
> -#include "reset.h"
> +#include "crg.h"
