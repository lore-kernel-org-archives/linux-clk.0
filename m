Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E351C04EBF
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 18:09:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DAD8B2082B
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 18:09:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="pUckvOOR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAD8B2082B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725880AbeLDSJH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 13:09:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:37814 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725839AbeLDSJH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 4 Dec 2018 13:09:07 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8A3972081C;
        Tue,  4 Dec 2018 18:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1543946946;
        bh=P4eXm/PXBfRIU2x7u2O188XXFONqF2ec5UpaXxGS6As=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=pUckvOORWwDidKythEbvwv43ukHDrULRKlQPeAr0BXAi+fQ/Nz4HSQE8fmeG9APft
         kHd16555MHVjtO7kJn6rTHkv9uVMMD7dnGzCus6v48G2mg11yE621lii55nFyObiEi
         bHM3SHiy9HbisEDCHiE5pSt9bPoje1fPnenC5hec=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Andrew Jeffery <andrew@aj.id.au>,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Joel Stanley <joel@jms.id.au>,
        Michael Turquette <mturquette@baylibre.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20181204172357.23665-1-jae.hyun.yoo@linux.intel.com>
Cc:     Vijay Khemka <vijaykhemka@fb.com>,
        Samuel Jiang <chyishian.jiang@gmail.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        stable@vger.kernel.org
References: <20181204172357.23665-1-jae.hyun.yoo@linux.intel.com>
Message-ID: <154394694584.88331.12700815292714558990@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH] clk: aspeed: Mark lclk (LPC) and espiclk (eSPI) as critical
Date:   Tue, 04 Dec 2018 10:09:05 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jae Hyun Yoo (2018-12-04 09:23:57)
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index 596136793fc4..01633ad85683 100644
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
 NULL,   CLK_IS_CRITICAL }, /* LPC */
>         [ASPEED_CLK_GATE_USBUHCICLK] =3D  {  9, 15, "usb-uhci-gate",     =
 NULL,   0 }, /* USB1.1 (requires port 2 enabled) */
>         [ASPEED_CLK_GATE_D1CLK] =3D       { 10, 13, "d1clk-gate",        =
 NULL,   0 }, /* GFX CRT */
>         [ASPEED_CLK_GATE_YCLK] =3D        { 13,  4, "yclk-gate",         =
 NULL,   0 }, /* HAC */
> @@ -103,7 +103,7 @@ static const struct aspeed_gate_data aspeed_gates[] =
=3D {
>         [ASPEED_CLK_GATE_UART1CLK] =3D    { 15, -1, "uart1clk-gate",     =
 "uart", 0 }, /* UART1 */
>         [ASPEED_CLK_GATE_UART2CLK] =3D    { 16, -1, "uart2clk-gate",     =
 "uart", 0 }, /* UART2 */
>         [ASPEED_CLK_GATE_UART5CLK] =3D    { 17, -1, "uart5clk-gate",     =
 "uart", 0 }, /* UART5 */
> -       [ASPEED_CLK_GATE_ESPICLK] =3D     { 19, -1, "espiclk-gate",      =
 NULL,   0 }, /* eSPI */
> +       [ASPEED_CLK_GATE_ESPICLK] =3D     { 19, -1, "espiclk-gate",      =
 NULL,   CLK_IS_CRITICAL }, /* eSPI */

Can you please add a comment in the code as well so that we can easily
recall why such clks are marked critical a year from now without having
to do git archaeology.

