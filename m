Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-ot0-f196.google.com ([74.125.82.196]:35894 "EHLO
        mail-ot0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750725AbeBVSvN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Feb 2018 13:51:13 -0500
Received: by mail-ot0-f196.google.com with SMTP id b15so5555942otf.3
        for <linux-clk@vger.kernel.org>; Thu, 22 Feb 2018 10:51:13 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1519319846-18246-1-git-send-email-festevam@gmail.com>
References: <1519319846-18246-1-git-send-email-festevam@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 22 Feb 2018 15:51:12 -0300
Message-ID: <CAOMZO5AkEOgfrCC3wJWia5ovnVBusFrtc2=Xf3Dy7BK5s1Txow@mail.gmail.com>
Subject: Re: [PATCH] clk: imx6sl: Include "common.h" header file
To: Shawn Guo <shawnguo@kernel.org>
Cc: sboyd@kernel.org, linux-clk <linux-clk@vger.kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, Feb 22, 2018 at 2:17 PM, Fabio Estevam <festevam@gmail.com> wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
>
> The prototype for the imx6sl_set_wait_clk() function is provided
> by the "common.h" header file, so include it to avoid the following
> sparse warning:
>
> drivers/clk/imx/clk-imx6sl.c:163:6: warning: symbol 'imx6sl_set_wait_clk' was not declared. Should it be static?
>
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  drivers/clk/imx/clk-imx6sl.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/imx/clk-imx6sl.c b/drivers/clk/imx/clk-imx6sl.c
> index 9642cdf..bdda77b 100644
> --- a/drivers/clk/imx/clk-imx6sl.c
> +++ b/drivers/clk/imx/clk-imx6sl.c
> @@ -16,6 +16,7 @@
>  #include <dt-bindings/clock/imx6sl-clock.h>
>
>  #include "clk.h"
> +#include "common.h"

Ops, this causes issues. Please ignore this one.
