Return-Path: <SRS0=XVLz=WM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69D1DC3A59C
	for <linux-clk@archiver.kernel.org>; Fri, 16 Aug 2019 08:53:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 39B882133F
	for <linux-clk@archiver.kernel.org>; Fri, 16 Aug 2019 08:53:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726872AbfHPIx6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Aug 2019 04:53:58 -0400
Received: from mail.thorsis.com ([92.198.35.195]:36699 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726753AbfHPIx6 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 16 Aug 2019 04:53:58 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id AB0FF4B14
        for <linux-clk@vger.kernel.org>; Fri, 16 Aug 2019 10:54:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 0YJYfWe3J9kc for <linux-clk@vger.kernel.org>;
        Fri, 16 Aug 2019 10:54:41 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id 34F4FA785; Fri, 16 Aug 2019 10:54:39 +0200 (CEST)
From:   Alexander Dahl <ada@thorsis.com>
To:     linux-clk@vger.kernel.org
Cc:     Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        kernel@pengutronix.de
Subject: Re: [PATCH] dt-bindings: clk: Make example a bit clearer
Date:   Fri, 16 Aug 2019 10:53:48 +0200
Message-ID: <87001375.oQs5gUaWZR@ada>
In-Reply-To: <20190815095059.ljqznve6pvqqfl57@pengutronix.de>
References: <20190815074604.5416-1-uwe@kleine-koenig.org> <1870872.EFtpEp3zHr@ada> <20190815095059.ljqznve6pvqqfl57@pengutronix.de>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Uwe,

Am Donnerstag, 15. August 2019, 11:50:59 CEST schrieb Uwe Kleine-K=F6nig:
> Maybe pick <&pll 3> instead of <&pll 1> in my patch and merge the two
> changes? Or drop clocks and clock-names from the example because
> otherwise unrelated clocks are modified which shouldn't be done. The
> result is below.

I like that result below with the dots for the 'clock' properties and the=20
additional explanations. Can we resend that as new patch?

Greets
Alex

> ---->8----
> From: =3D?UTF-8?q?Uwe=3D20Kleine-K=3DC3=3DB6nig?=3D <u.kleine-koenig@peng=
utronix.de>
> Date: Thu, 15 Aug 2019 11:48:25 +0200
> Subject: [PATCH] dt-bindings: clk: Make example a bit clearer
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>=20
> Previously the example used <&pll 2> in two places which made it harder
> than necessary to understand why this clock gets the parent of
> <&clkcon 0>. Also describe why <&pll 2> isn't reparented and <&clkcon 0>
> gets no rate assigned.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  .../devicetree/bindings/clock/clock-bindings.txt     | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt
> b/Documentation/devicetree/bindings/clock/clock-bindings.txt index
> b646bbcf7f92..1d4942380918 100644
> --- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
> +++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> @@ -150,16 +150,18 @@ set to 0, or can be omitted if it is not followed by
> any non-zero entry. compatible =3D "fsl,imx-uart";
>          reg =3D <0xa000 0x1000>;
>          ...
> -        clocks =3D <&osc 0>, <&pll 1>;
> -        clock-names =3D "baud", "register";
> +        clocks =3D ...
> +        clock-names =3D ...
>=20
>          assigned-clocks =3D <&clkcon 0>, <&pll 2>;
> -        assigned-clock-parents =3D <&pll 2>;
> +        assigned-clock-parents =3D <&pll 1>;
>          assigned-clock-rates =3D <0>, <460800>;
>      };
>=20
> -In this example the <&pll 2> clock is set as parent of clock <&clkcon 0>
> and -the <&pll 2> clock is assigned a frequency value of 460800 Hz.
> +In this example the <&pll 1> clock is set as parent of clock <&clkcon 0>
> and +the <&pll 2> clock is assigned a frequency value of 460800 Hz.  A
> parent +setting for <&pll 2> is omitted (end of list) and rate setting for
> <&clkcon 0> +is skipped because set to <0>.
>=20
>  Configuring a clock's parent and rate through the device node that consu=
mes
> the clock can be done only for clocks that have a single user. Specifying


