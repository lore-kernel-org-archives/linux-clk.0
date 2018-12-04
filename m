Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13807C04EB8
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 20:50:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BFDAC20834
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 20:50:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="eO1lAWQG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFDAC20834
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbeLDUur (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 15:50:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:40342 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725867AbeLDUur (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 4 Dec 2018 15:50:47 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9E66D206B7;
        Tue,  4 Dec 2018 20:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1543956646;
        bh=g+aiLKHkeZM364wFgITwqkLDVLGaFWqxe2ynn/FnpFs=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=eO1lAWQGNcwVZvJe36aqOwrbNTem0b/DUiOssSf8Vy4K2HwJml9eL4UknKA8cCd2Z
         koM7BA9/YbWeuNfUHYHz9vDrBZxii5fP2a25+UHIBs6GVSj9D5WbE3cENBYu5619Kf
         c4Y3GEUp7A6WJPkqnTYdAo5lQTgqX8lEsOb/xi1U=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Andrew Jeffery <andrew@aj.id.au>,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Joel Stanley <joel@jms.id.au>,
        Michael Turquette <mturquette@baylibre.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20181204185054.24053-1-jae.hyun.yoo@linux.intel.com>
Cc:     Vijay Khemka <vijaykhemka@fb.com>,
        Samuel Jiang <chyishian.jiang@gmail.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        stable@vger.kernel.org
References: <20181204185054.24053-1-jae.hyun.yoo@linux.intel.com>
Message-ID: <154395664604.88331.16833135233042073777@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH v2] clk: aspeed: Mark lclk (LPC) and espiclk (eSPI) as critical
Date:   Tue, 04 Dec 2018 12:50:46 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jae Hyun Yoo (2018-12-04 10:50:53)
> These interfaces are used by host to talk to BMC, and the clock
> source is from the host, usually from PCH. So this commit marks
> the lclk as critical to make it able to be enabled. Also, it marks
> espiclk too because eSPI is sharing the same interface with LPC.
> =

> Fixes: 15ed8ce5f84e ("clk: aspeed: Register gated clocks")
> Cc: stable@vger.kernel.org
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  drivers/clk/clk-aspeed.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index 596136793fc4..df9504427246 100644
> --- a/drivers/clk/clk-aspeed.c
> +++ b/drivers/clk/clk-aspeed.c
> @@ -95,7 +95,7 @@ static const struct aspeed_gate_data aspeed_gates[] =3D=
 {
>         [ASPEED_CLK_GATE_DCLK] =3D        {  5, -1, "dclk-gate",         =
 NULL,   CLK_IS_CRITICAL }, /* DAC */
>         [ASPEED_CLK_GATE_REFCLK] =3D      {  6, -1, "refclk-gate",       =
 "clkin", CLK_IS_CRITICAL },
>         [ASPEED_CLK_GATE_USBPORT2CLK] =3D {  7,  3, "usb-port2-gate",    =
 NULL,   0 }, /* USB2.0 Host port 2 */
> -       [ASPEED_CLK_GATE_LCLK] =3D        {  8,  5, "lclk-gate",         =
 NULL,   0 }, /* LPC */
> +       [ASPEED_CLK_GATE_LCLK] =3D        {  8,  5, "lclk-gate",         =
 NULL,   CLK_IS_CRITICAL }, /* LPC clock from host. No parent dependency */

What does "No parent dependency" mean? I was hoping to see something
like the commit text, "lclk is used to talk to BMC which can happen at
anytime" or something like that.

