Return-Path: <SRS0=fX0Q=WL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA61C31E40
	for <linux-clk@archiver.kernel.org>; Thu, 15 Aug 2019 08:47:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0858821955
	for <linux-clk@archiver.kernel.org>; Thu, 15 Aug 2019 08:47:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbfHOIrH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Aug 2019 04:47:07 -0400
Received: from mail.thorsis.com ([92.198.35.195]:43144 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725875AbfHOIrH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 15 Aug 2019 04:47:07 -0400
X-Greylist: delayed 546 seconds by postgrey-1.27 at vger.kernel.org; Thu, 15 Aug 2019 04:47:06 EDT
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id 082B1358B
        for <linux-clk@vger.kernel.org>; Thu, 15 Aug 2019 10:38:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id OjhQmSw-FFJG for <linux-clk@vger.kernel.org>;
        Thu, 15 Aug 2019 10:38:42 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id B29F7506F; Thu, 15 Aug 2019 10:38:42 +0200 (CEST)
From:   Alexander Dahl <ada@thorsis.com>
To:     Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <uwe@kleine-koenig.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, kernel@pengutronix.de,
        linux-clk@vger.kernel.org,
        Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] dt-bindings: clk: Make example a bit clearer
Date:   Thu, 15 Aug 2019 10:37:54 +0200
Message-ID: <1870872.EFtpEp3zHr@ada>
In-Reply-To: <20190815074604.5416-1-uwe@kleine-koenig.org>
References: <20190815074604.5416-1-uwe@kleine-koenig.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Uwe,

thanks for your effort on improving this. See below.

Am Donnerstag, 15. August 2019, 09:46:04 CEST schrieb Uwe Kleine-K=F6nig:
> From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Previously the example used <&pll 2> in two places which made it harder
> than necessary to understand why this clock gets the parent of
> <&clkcon 0>.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/clock/clock-bindings.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt
> b/Documentation/devicetree/bindings/clock/clock-bindings.txt index
> b646bbcf7f92..30aa63a2eecb 100644
> --- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
> +++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> @@ -154,11 +154,11 @@ set to 0, or can be omitted if it is not followed by
> any non-zero entry. clock-names =3D "baud", "register";
>=20
>          assigned-clocks =3D <&clkcon 0>, <&pll 2>;
> -        assigned-clock-parents =3D <&pll 2>;
> +        assigned-clock-parents =3D <&pll 1>;
>          assigned-clock-rates =3D <0>, <460800>;
>      };
>=20
> -In this example the <&pll 2> clock is set as parent of clock <&clkcon 0>
> and +In this example the <&pll 1> clock is set as parent of clock <&clkcon
> 0> and the <&pll 2> clock is assigned a frequency value of 460800 Hz.
>=20
>  Configuring a clock's parent and rate through the device node that consu=
mes

With your change the assigned-clock-parent is a clock also listed with the=
=20
clocks a few lines above, don't know if that's less puzzling?

Let me repeat for the audience here (I initially asked on #armlinux IRC=20
channel), what I did not understand, maybe someone else has an idea how to=
=20
better explain it.

=46irst: I'm experimenting on a SAMA5D27-SOM1-EK board and want to use one =
of=20
the PCKx to output on some easy accessible pin (to see the signal on a scop=
e).=20
On our real hardware that clock will be input for another IC on the board=20
connected to the EBI external memory interface. I wrote a dummy driver to=20
prepare/enable that clock, nothing sophisticated. The dts nodes working now=
=20
are these:

	ahb {
        ebi: ebi@10000000 {                                                =
                                                                           =
                                        =20
            status =3D "okay";                                             =
                                                                           =
                                          =20
                                                                           =
                                                                           =
                                        =20
            dummy_fpga: dummy-fpga@2 {                                     =
                                                                           =
                                        =20
                compatible =3D "thorsis,dummy-fpga";                       =
                                                                           =
                                          =20
                pinctrl-names =3D "default";                               =
                                                                           =
                                          =20
                pinctrl-0 =3D <&pinctrl_dummy_fpga_default>;               =
                                                                           =
                                          =20
                status =3D "okay";                                         =
                                                                           =
                                          =20
                reg =3D <0x2 0x0 0x10000>;                                 =
                                                                           =
                                          =20
                clocks =3D <&pck1>;                                        =
                                                                           =
                                          =20
                assigned-clocks =3D <&prog1>;                              =
                                                                           =
                                          =20
                assigned-clock-parents =3D <&main>;                        =
                                                                           =
                                          =20
                assigned-clock-rates =3D <6000000>;                        =
                                                                           =
                                          =20
                /*                                                         =
                                                                           =
                                        =20
                assigned-clock-parents =3D <&clk32k>;                      =
                                                                           =
                                          =20
                assigned-clock-rates =3D <16384>;                          =
                                                                           =
                                          =20
                */                                                         =
                                                                           =
                                        =20
                                                                           =
                                                                           =
                                        =20
                atmel,smc-bus-width =3D <8>;                               =
                                                                           =
                                          =20
                atmel,smc-read-mode =3D "nrd";                             =
                                                                           =
                                          =20
                atmel,smc-write-mode =3D "nwe";                            =
                                                                           =
                                          =20
                atmel,smc-exnw-mode =3D "disabled";                        =
                                                                           =
                                          =20
                                                                           =
                                                                           =
                                        =20
                atmel,smc-ncs-rd-setup-ns =3D <20>;                        =
                                                                           =
                                          =20
                atmel,smc-nrd-setup-ns =3D <20>;                           =
                                                                           =
                                          =20
                atmel,smc-ncs-wr-setup-ns =3D <20>;                        =
                                                                           =
                                          =20
                atmel,smc-nwe-setup-ns =3D <20>;                           =
                                                                           =
                                          =20
                                                                           =
                                                                           =
                                        =20
                atmel,smc-ncs-rd-pulse-ns =3D <40>;                        =
                                                                           =
                                          =20
                atmel,smc-nrd-pulse-ns =3D <40>;                           =
                                                                           =
                                          =20
                atmel,smc-ncs-wr-pulse-ns =3D <40>;                        =
                                                                           =
                                          =20
                atmel,smc-nwe-pulse-ns =3D <40>;                           =
                                                                           =
                                          =20
                                                                           =
                                                                           =
                                        =20
                atmel,smc-nwe-cycle-ns =3D <110>;                          =
                                                                           =
                                          =20
                atmel,smc-nrd-cycle-ns =3D <110>;                          =
                                                                           =
                                          =20
                                                                           =
                                                                           =
                                        =20
                atmel,smc-tdf-ns =3D <0>;                                  =
                                                                           =
                                          =20
            };                                                             =
                                                                           =
                                        =20
        };                                                                 =
                                                                           =
                                        =20

		apb {
            pinctrl@fc038000 {                                             =
                                                                           =
                                        =20
                pinctrl_dummy_fpga_default: dummy_fpga_default {           =
                                                                           =
                                        =20
                    pinmux =3D <PIN_PD6__PCK1>;                            =
                                                                           =
                                          =20
                    bias-disable;                                          =
                                                                           =
                                        =20
                };                                                         =
                                                                           =
                                        =20
			};
		};
	};

The chain (desired) is like this: crystal -> mainck -> prog1 -> pck1 -> fpg=
ack

You can choose slck, mainck, pllack, upllck, mck, or audiopllck (names from=
=20
sama5d2 series datasheet) as source clock for each channel of the programma=
ble=20
clock controller. That controller is modelled as prog0, prog1, prog2 and pc=
k0,=20
pck1, pck2 in dts.

Now the three puzzling things from the clock-bindings docs:

There are in fact three lists, assigned-clocks contains clocks you want to=
=20
assign parent or rate, those don't need to be the clocks your node uses, bu=
t=20
may be any clock higher up in the chain which affects your node. Right? Tha=
t=20
in itself is puzzling.=20

Beyond that: could I have added those properties to the nodes pck1 or prog1=
 as=20
well and which one would be the right node to choose?

The last hard to understand part from the example code (not the describing=
=20
text) is the linkage between those three lists. Each entry in assigned-cloc=
k-
parents and assigned-clock-rates must correspond to the same index list mem=
ber=20
of assigned-clocks, but you can omit entries in the back. Suggestion to=20
improve the example:


diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b/
Documentation/devicetree/bindings/clock/clock-bindings.txt
index 2ec489eebe72..df098f73e901 100644
=2D-- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
+++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
@@ -159,7 +159,9 @@ set to 0, or can be omitted if it is not followed by an=
y=20
non-zero entry.
     };
=20
 In this example the <&pll 2> clock is set as parent of clock <&clkcon 0> a=
nd
=2Dthe <&pll 2> clock is assigned a frequency value of 460800 Hz.
+the <&pll 2> clock is assigned a frequency value of 460800 Hz. A parent
+setting for <&pll 2> is omitted (end of list) and rate setting for <&clkco=
n=20
0>
+is skipped because set to <0>.
=20
 Configuring a clock's parent and rate through the device node that consumes
 the clock can be done only for clocks that have a single user. Specifying


Kind regards
Alex

