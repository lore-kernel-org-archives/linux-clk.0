Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A80C43217
	for <linux-clk@archiver.kernel.org>; Mon, 14 Nov 2022 19:00:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235961AbiKNTAC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Nov 2022 14:00:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236281AbiKNTAB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Nov 2022 14:00:01 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 322D926A
        for <linux-clk@vger.kernel.org>; Mon, 14 Nov 2022 11:00:00 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1ouegK-0003lF-RY; Mon, 14 Nov 2022 19:59:44 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1ouegK-00008o-KG; Mon, 14 Nov 2022 19:59:44 +0100
Date:   Mon, 14 Nov 2022 19:59:44 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Claudiu.Beznea@microchip.com
Cc:     linux-arm-kernel@lists.infradead.org,
        alexandre.belloni@bootlin.com, sboyd@kernel.org,
        mturquette@baylibre.com, Ludovic.Desroches@microchip.com,
        kernel@pengutronix.de, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 1/3] clk: at91: rm9200: fix usb device clock id
Message-ID: <20221114185944.GC18924@pengutronix.de>
References: <20221109124638.147270-1-m.grzeschik@pengutronix.de>
 <20221109124638.147270-2-m.grzeschik@pengutronix.de>
 <94c6679c-f518-aa74-5cda-f28f1dc3129a@microchip.com>
 <048269a7-3aea-129f-f4db-4cd321e89fa3@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tqI+Z3u+9OQ7kwn0"
Content-Disposition: inline
In-Reply-To: <048269a7-3aea-129f-f4db-4cd321e89fa3@microchip.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--tqI+Z3u+9OQ7kwn0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 11, 2022 at 11:00:53AM +0000, Claudiu.Beznea@microchip.com wrot=
e:
>On 10.11.2022 12:41, Claudiu Beznea - M18063 wrote:
>> On 09.11.2022 14:46, Michael Grzeschik wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know =
the content is safe
>>>
>>> Referring to the datasheet the index 2 is the MCKUDP. When enabled, it
>>> "Enables the automatic disable of the Master Clock of the USB Device
>>> Port when a suspend condition occurs". We fix the index to the real UDP
>>> id which "Enables the 48 MHz clock of the USB Device Port".
>>>
>>> Cc: mturquette@baylibre.com
>>> Cc: sboyd@kernel.org
>>> Cc: nicolas.ferre@microchip.com
>>> Cc: alexandre.belloni@bootlin.com
>>> Cc: ludovic.desroches@microchip.com
>>> Cc: claudiu.beznea@microchip.com
>>> Cc: linux-clk@vger.kernel.org
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: kernel@pengutronix.de
>>> Fixes: 02ff48e4d7f7 ("clk: at91: add at91rm9200 pmc driver")
>>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>
>> Reviewed-by: Claudiu Beznea <claudiu.beznea@microchip.com>
>
>Actually, looking again at this... I think it is best to squash this patch
>with path 2/3 from this series. Otherwise applying them independently will
>lead to usb driver probe failure. Back porting them (with proper
>dependency) to older kernel version may also lead to failures.


I just send v4.


>>
>>
>>>
>>> ---
>>> v1 -> v2: - removed ; from patch description
>>>           - added fixes tag
>>> v2 -> v3: - updated the fixes tag
>>>
>>>  drivers/clk/at91/at91rm9200.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/clk/at91/at91rm9200.c b/drivers/clk/at91/at91rm920=
0.c
>>> index b174f727a8ef8d..16870943a13e54 100644
>>> --- a/drivers/clk/at91/at91rm9200.c
>>> +++ b/drivers/clk/at91/at91rm9200.c
>>> @@ -40,7 +40,7 @@ static const struct clk_pll_characteristics rm9200_pl=
l_characteristics =3D {
>>>  };
>>>
>>>  static const struct sck at91rm9200_systemck[] =3D {
>>> -       { .n =3D "udpck", .p =3D "usbck",    .id =3D 2 },
>>> +       { .n =3D "udpck", .p =3D "usbck",    .id =3D 1 },
>>>         { .n =3D "uhpck", .p =3D "usbck",    .id =3D 4 },
>>>         { .n =3D "pck0",  .p =3D "prog0",    .id =3D 8 },
>>>         { .n =3D "pck1",  .p =3D "prog1",    .id =3D 9 },
>>> --
>>> 2.30.2
>>>
>>
>
>_______________________________________________
>linux-arm-kernel mailing list
>linux-arm-kernel@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--tqI+Z3u+9OQ7kwn0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmNykBsACgkQC+njFXoe
LGQN4Q//f0+VeZcatgewF/LAlo92vgb1GmdPvoMope4FhnWt30Ng1T/8/Y2btDXl
8w+XTxPYl8HFTkGPiM/14gr+7L7sapShd8dSikjVHd8WK200xBtmEeueKepobpHq
w1SVhqdE9489gjlV8C5fbMY3akdZi3DYbG7S5xyg47j2hWo+oFjnggeVhUJ2wH8H
kpzcT4dTI8CMprvChgnoerSdxU0gWSWZeZmFdnGnZNhdlL9SbwNdZnN183wWt8rh
nWFj9fL/BM0wPifXa5gRR4EsciF+OTrkR68DiD667w6QtPvrrdiWkKHRNz23Ybvo
c5zQP/kR+tmWyJEetmAcjBiRoN4kqSPG3Hq/aYm9v4F09B2pA25/dpl7bt7A1lhq
S41QNcAahzocGHHLyehUvu2WyPj33XMnak/FV5NWm4TNuUvGRikr+ILWjmyIxfNd
oyOeQ07iLrcP8r/MaGtBK+aX2vLnfm0pmNDiWNM+2sWHFRW4luCbjXh1aLT9wksQ
aj14dLRxHZBofJWpc/RZRnp+fNltsjw3I4BPAC01hCJaP7EzzgmeLLsdH+3GfQkc
8rQDlrPesA4i9K103z56vxHxwaLxADAw9+RQJq9eBVMFck0PXK62ryijzcDk0Pbh
q6wbumeZz4PyApg3HKbku5D0Yk3EtKQ/n1jYNq/Z9Te95dkzwPc=
=/nzc
-----END PGP SIGNATURE-----

--tqI+Z3u+9OQ7kwn0--
