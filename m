Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:54447 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751321AbeGIG2Y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Jul 2018 02:28:24 -0400
Subject: Re: [PATCH v2 1/4] clk: imx7d: add IMX7D_MU_ROOT_CLK
To: Stephen Boyd <sboyd@kernel.org>,
        "A.s. Dong" <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, dl-linux-imx <linux-imx@nxp.com>,
        kernel@pengutronix.de, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20180615095107.24610-1-o.rempel@pengutronix.de>
 <20180615095107.24610-2-o.rempel@pengutronix.de>
 <153111732039.143105.423209769011221751@swboyd.mtv.corp.google.com>
From: Oleksij Rempel <o.rempel@pengutronix.de>
Message-ID: <263fcac9-7984-810b-1aa8-45353dac0018@pengutronix.de>
Date: Mon, 9 Jul 2018 08:28:22 +0200
MIME-Version: 1.0
In-Reply-To: <153111732039.143105.423209769011221751@swboyd.mtv.corp.google.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="WktTMtSmGRpI04lMMhTyKO2FNDkLLdOvf"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WktTMtSmGRpI04lMMhTyKO2FNDkLLdOvf
Content-Type: multipart/mixed; boundary="8UD2Khoq5QVcvL5rSjYqka6uZYiQt2M7N";
 protected-headers="v1"
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Stephen Boyd <sboyd@kernel.org>, "A.s. Dong" <aisheng.dong@nxp.com>,
 Fabio Estevam <fabio.estevam@nxp.com>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, dl-linux-imx <linux-imx@nxp.com>,
 kernel@pengutronix.de, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-ID: <263fcac9-7984-810b-1aa8-45353dac0018@pengutronix.de>
Subject: Re: [PATCH v2 1/4] clk: imx7d: add IMX7D_MU_ROOT_CLK
References: <20180615095107.24610-1-o.rempel@pengutronix.de>
 <20180615095107.24610-2-o.rempel@pengutronix.de>
 <153111732039.143105.423209769011221751@swboyd.mtv.corp.google.com>
In-Reply-To: <153111732039.143105.423209769011221751@swboyd.mtv.corp.google.com>

--8UD2Khoq5QVcvL5rSjYqka6uZYiQt2M7N
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hallo Fabio,

can you please review it.

On 09.07.2018 08:22, Stephen Boyd wrote:
> Quoting Oleksij Rempel (2018-06-15 02:51:04)
>> This clock is needed for iMX mailbox driver
>>
>> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>> ---
>=20
> Acked-by: Stephen Boyd <sboyd@kernel.org>
>=20
> but I think you'll want some imx maintainer to review it still.
>=20
>=20


--8UD2Khoq5QVcvL5rSjYqka6uZYiQt2M7N--

--WktTMtSmGRpI04lMMhTyKO2FNDkLLdOvf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAltDAIYACgkQdQOiSHVI
77RL7gf/VY4CFEx+SV0auhzTdIZl2ga+nuijtP7DWkiaqkd+8dkagwN4772YhTBs
2sn/p0I4t1wFKwz0irQVAmAQK62EDjropu3QQojiV/S0nCgjPgAya5Le4x517gAh
Yq1cHsMXGN7oWxIZAGs2sCWUrj+gptj3jcekX8NtK/D7Gq8+UU1M7dQGOqsLEUo8
rEyBXk1qFsVBjc8RIg4eKraH8AAXBWe3tPRzZ+uNzenzn8btZ5vo4poeSsfNq1Sv
2hD9X1siWGmqRVCDohjl28DbUJIcRS/BmWUJOPB0GLDgeZwy4N5BWOt23iEp1jaC
LiCr7ClsB9dnTCgibfTPt+Wirp72wA==
=TKqT
-----END PGP SIGNATURE-----

--WktTMtSmGRpI04lMMhTyKO2FNDkLLdOvf--
