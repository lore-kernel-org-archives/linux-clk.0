Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:59673 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935205AbeFML7c (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Jun 2018 07:59:32 -0400
Subject: Re: [PATCH v1 2/4] dt-bindings: mailbox: provide imx-mailbox
 documentation
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
        kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20180601065821.28234-1-o.rempel@pengutronix.de>
 <20180601065821.28234-3-o.rempel@pengutronix.de>
 <20180612194142.GA16521@rob-hp-laptop>
From: Oleksij Rempel <o.rempel@pengutronix.de>
Message-ID: <034f77a2-88b5-716b-d9c8-10d73beec9d4@pengutronix.de>
Date: Wed, 13 Jun 2018 13:59:30 +0200
MIME-Version: 1.0
In-Reply-To: <20180612194142.GA16521@rob-hp-laptop>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="xuj5q6BFURq7uLv6iHKz5G9mUEdcWpaMa"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xuj5q6BFURq7uLv6iHKz5G9mUEdcWpaMa
Content-Type: multipart/mixed; boundary="UARG5G5UM8s9o4uOrIrWHpGcmIMxuDahX";
 protected-headers="v1"
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-ID: <034f77a2-88b5-716b-d9c8-10d73beec9d4@pengutronix.de>
Subject: Re: [PATCH v1 2/4] dt-bindings: mailbox: provide imx-mailbox
 documentation
References: <20180601065821.28234-1-o.rempel@pengutronix.de>
 <20180601065821.28234-3-o.rempel@pengutronix.de>
 <20180612194142.GA16521@rob-hp-laptop>
In-Reply-To: <20180612194142.GA16521@rob-hp-laptop>

--UARG5G5UM8s9o4uOrIrWHpGcmIMxuDahX
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 12.06.2018 21:41, Rob Herring wrote:
> On Fri, Jun 01, 2018 at 08:58:19AM +0200, Oleksij Rempel wrote:
>> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>> ---
>>  .../bindings/mailbox/imx-mailbox.txt          | 35 ++++++++++++++++++=
+
>>  1 file changed, 35 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mailbox/imx-mail=
box.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/imx-mailbox.txt=
 b/Documentation/devicetree/bindings/mailbox/imx-mailbox.txt
>> new file mode 100644
>> index 000000000000..a45604b33039
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mailbox/imx-mailbox.txt
>> @@ -0,0 +1,35 @@
>> +i.MX Messaging Unit
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +The i.MX Messaging Unit (MU) contains two register sets: "A" and "B".=
 In most cases
>> +they are accessible from all Processor Units. On one hand, at least f=
or mailbox functionality,
>> +it makes no difference which application or processor is using which =
set of the MU. On
>=20
> Please wrap lines correctly (<80).
>=20
>> +other hand, the register sets for each of the MU parts are not identi=
cal.
>> +
>> +Required properties:
>> +- compatible :	Shell be one of:
>> +                    "fsl,imx7s-mu-a" and "fsl,imx7s-mu-b" for i.MX7S =
or i.MX7D
>> +- reg : 	physical base address of the mailbox and length of
>=20
> Mix of space and tab.
>=20
>> +		memory mapped region.
>> +- #mbox-cells:	Common mailbox binding property to identify the number=

>> +		of cells required for the mailbox specifier. Should be 1.
>> +- interrupts :	interrupt number. The interrupt specifier format
>> +		depends on the interrupt controller parent.
>=20
> Just need to say how many interrupts and what they are if more than 1.
>=20
>> +- clocks     :  phandle to the input clock.
>> +
>> +Example:
>> +	mu0a: mu@30aa0000 {
>=20
> mailbox@...
>=20
>> +		compatible =3D "fsl,imx7s-mu-a";
>> +		reg =3D <0x30aa0000 0x28>;
>> +		interrupts =3D <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
>> +		clocks =3D <&clks IMX7D_MU_ROOT_CLK>;
>> +		#mbox-cells =3D <1>;
>> +	};
>> +
>> +	mu0b: mu@30ab0000 {
>=20
> mailbox@...
>=20
>> +		compatible =3D "fsl,imx7s-mu-b";
>> +		reg =3D <0x30ab0000 0x28>;
>> +		interrupts =3D <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
>> +		clocks =3D <&clks IMX7D_MU_ROOT_CLK>;
>> +		#mbox-cells =3D <1>;
>> +	};

thx. will fix it.


--UARG5G5UM8s9o4uOrIrWHpGcmIMxuDahX--

--xuj5q6BFURq7uLv6iHKz5G9mUEdcWpaMa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAlshByIACgkQdQOiSHVI
77TSrAf/ZVVYcY2pqsC4A1YzKZkWOHH6zki7Wfw6McNGevfuZRCOmfseQdpvONOr
ILtjM6xjDNt8MhDYiijzf6nWOuBbLFqOgrXIp/pMDamDJLqfwy5hjFyq7L5GjXN4
s9sgRxfQiZyMQO2/XFRzUvMFz6pxI20a6lgtm67jTJ9relCtijG6VtooVdOZHrKC
xuSo+60nUIiPRWlrlqF02bTWy/uF25Z4NCDxKe+PFa37P/MLhyBy6Ecx/fVMalo9
0slZXPkQ0e0aPyHHriLZaMEyYZKRBWgJJFg1NtGCvpfPNiUxbAnkA9RX07BmImFi
HtSwtFD94Y2K8KXD/flzVnBywrkS6A==
=tuHO
-----END PGP SIGNATURE-----

--xuj5q6BFURq7uLv6iHKz5G9mUEdcWpaMa--
