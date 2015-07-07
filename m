Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from gabe.freedesktop.org ([131.252.210.177]:57753 "EHLO
	gabe.freedesktop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932790AbbGGUNv (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 7 Jul 2015 16:13:51 -0400
From: Eric Anholt <eric@anholt.net>
To: Lee Jones <lee@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stephen Warren <swarren@wwwdotorg.org>,
	linux-clk@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v3 1/7] dt/bindings: Add binding for the Raspberry Pi clock provider
In-Reply-To: <20150609100326.GQ2982@x1>
References: <1433807940-15328-1-git-send-email-eric@anholt.net> <20150609100326.GQ2982@x1>
Date: Tue, 07 Jul 2015 13:13:48 -0700
Message-ID: <87egkj914z.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Lee Jones <lee@kernel.org> writes:

> If I were the Clock Maintainer, I would have probably missed this
> patch.  You _must_ intimate which subsystem you are submitting to.
>
>> The hardware clocks are not controllable by the ARM, so we have to
>> make requests to the firmware to do so from the VPU side.  This will
>> let us replace fixed clocks in our DT with actual clock control (and
>> correct frequency information).
>>=20
>> v2: Include the dt-bindings header in this commit instead of the next
>>     one.  Make the clock indices match the firmware clock IDs.  Rename
>>     the binding's compat string.  Move the firmware phandle to be
>>     under a vendor-specific namespace.
>>=20
>> Signed-off-by: Eric Anholt <eric@anholt.net>
>> ---
>>  .../clock/raspberrypi,bcm2835-firmware-clocks.txt  | 25 +++++++++++++++=
+++++++
>>  include/dt-bindings/clk/raspberrypi.h              | 23 +++++++++++++++=
+++++
>>  2 files changed, 48 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/raspberrypi,=
bcm2835-firmware-clocks.txt
>>  create mode 100644 include/dt-bindings/clk/raspberrypi.h
>>=20
>> diff --git a/Documentation/devicetree/bindings/clock/raspberrypi,bcm2835=
-firmware-clocks.txt b/Documentation/devicetree/bindings/clock/raspberrypi,=
bcm2835-firmware-clocks.txt
>> new file mode 100644
>> index 0000000..0972602
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/raspberrypi,bcm2835-firmwa=
re-clocks.txt
>> @@ -0,0 +1,25 @@
>> +Raspberry Pi firmware clock provider.
>> +
>> +The Raspberry Pi architecture doesn't provide direct access to the
>> +CLOCKMAN peripheral from the ARM side, so Linux has to make requests
>> +to the VPU firmware to program them.
>> +
>> +This binding uses the common clock binding:
>> +Documentation/devicetree/bindings/clock/clock-bindings.txt
>> +
>> +Required properties:
>> +- compatible:		Should be "raspberrypi,bcm2835-firmware-clocks"
>> +
>> +- #clock-cells:		Shall have value <1>.  The permitted clock-specifier
>> +			  values can be found in
>> +			  include/dt-bindings/clk/raspberrypi.h.
>> +
>> +- raspberrypi,firmware:	Phandle to the firmware driver node.
>
> I think 'firmware' is a candidate for a generic phandle name.

Stephen Warren asked in the last version that I change it from
"firmware" to "raspberrypi,firmware", which made sense to me since we're
not some core infrastructure using these references.  Which should it
be?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVnDL9AAoJELXWKTbR/J7oo6YP/3NKOCv/9ib/ejvgkjd2yT9K
np+EFQRPKmWaHoC4AqHamL1JzeRBD2dGpYbRknDIYND9vbocLEbaOaFRi7hkBbrr
3fC9cvdtUZwo7AG8ZcJhtR+ynk4G31vA5ue7yUSzUAvpM9N6shsKxOsD2XmLSlzs
FCTow3Psnvgn7VgAp8UW3lYvdcQilDyh5E81shGV48ymgbt7eFn1bjd98G6WjZ4A
DjzMbyyvOvV6iZptm/+Zgnpr4H8hb1PO4ds0qaCkhLFxckW/d3NdZKhn21hZJO3o
1aOk7s7KJUV51H/TtZkMrE31XGCMzWltMsbQRjiRA9Ea1DK5KgwP+lm/wJekbr3Z
8u5UGPf2jaWSKU2y/O22hb4o2CbDj/P90PeTUacyUd8EDBTITgd+Ai3J7K4HAnPS
vLhkSFKX45jYxTMoqm1AD8ZASmXJp5qyDE6xcEgFThA2GqJRUdMU9GNx2Vxg0VR6
UXetEcFMbvrQE1S/FTmCNuNxDzp9oYvOg9fy/40bHKAEtTO9ilM+/LCbBi+l/tXW
6qwmjdeEMbQ/uPz8lVCkEo84ISo898czsPP4JHmKr3sMduioQYls9gPn9i6/nzgc
nsygiEUm+BohA7AHzh+qbBHLSkywUQi1gOLsSbB8WoK3SyCd8rYhpStPk+qPBdgr
w4l0890m+YxANrkITXcB
=2twm
-----END PGP SIGNATURE-----
--=-=-=--
