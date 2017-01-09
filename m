Return-Path: <webczat_200@poczta.onet.pl>
Subject: Re: [PATCH] clk: scpi: don't add cpufreq device if the scpi dvfs node
 is disabled
To: Sudeep Holla <sudeep.holla@arm.com>
References: <1483706070-12357-1-git-send-email-sudeep.holla@arm.com>
 <d51628d1-c930-ec13-990c-97cc47d80472@poczta.onet.pl>
 <d1cccb6b-e938-6522-c45f-5b613567cb4e@arm.com>
Cc: linux-clk@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
From: =?UTF-8?Q?Micha=c5=82_Zegan?= <webczat_200@poczta.onet.pl>
Message-ID: <0393387b-8ed5-f75b-7f69-5c0b06c64cca@poczta.onet.pl>
Date: Mon, 9 Jan 2017 11:14:53 +0100
MIME-Version: 1.0
In-Reply-To: <d1cccb6b-e938-6522-c45f-5b613567cb4e@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="IRfoLjtdMOhWHRpeequcwdP7CAieCOXEP"
List-ID: <linux-clk.vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--IRfoLjtdMOhWHRpeequcwdP7CAieCOXEP
Content-Type: multipart/mixed; boundary="Brecu1d6lGD3HCxht2ESgcw2KthvMfX1l";
 protected-headers="v1"
From: =?UTF-8?Q?Micha=c5=82_Zegan?= <webczat_200@poczta.onet.pl>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-clk@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <0393387b-8ed5-f75b-7f69-5c0b06c64cca@poczta.onet.pl>
Subject: Re: [PATCH] clk: scpi: don't add cpufreq device if the scpi dvfs node
 is disabled
References: <1483706070-12357-1-git-send-email-sudeep.holla@arm.com>
 <d51628d1-c930-ec13-990c-97cc47d80472@poczta.onet.pl>
 <d1cccb6b-e938-6522-c45f-5b613567cb4e@arm.com>
In-Reply-To: <d1cccb6b-e938-6522-c45f-5b613567cb4e@arm.com>

--Brecu1d6lGD3HCxht2ESgcw2KthvMfX1l
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Of course.

W dniu 09.01.2017 o 10:58, Sudeep Holla pisze:
>=20
>=20
> On 07/01/17 00:44, Micha=C5=82 Zegan wrote:
>> seems the patch works as intended.
>>
>=20
> So, can we take this as
> Tested-by: Micha=C5=82 Zegan <webczat_200@poczta.onet.pl> ?
>=20
>> W dniu 06.01.2017 o 13:34, Sudeep Holla pisze:
>>> Currently we add the virtual cpufreq device unconditionally even when=

>>> the SCPI DVFS clock provider node is disabled. This will cause cpufre=
q
>>> driver to throw errors when it gets initailised on boot/modprobe and
>>> also when the CPUs are hot-plugged back in.
>>>
>>> This patch fixes the issue by adding the virtual cpufreq device only =
if
>>> the SCPI DVFS clock provider is available and registered.
>>>
>>> Fixes: 9490f01e2471 ("clk: scpi: add support for cpufreq virtual devi=
ce")
>>> Reported-by: Micha=C5=82 Zegan <webczat_200@poczta.onet.pl>
>>> Cc: Neil Armstrong <narmstrong@baylibre.com>
>>> Cc: Michael Turquette <mturquette@baylibre.com>
>>> Cc: Stephen Boyd <sboyd@codeaurora.org>
>>> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
>=20


--Brecu1d6lGD3HCxht2ESgcw2KthvMfX1l--

--IRfoLjtdMOhWHRpeequcwdP7CAieCOXEP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFPBAEBCAA5FiEE8PeJXyv9t1Bfiq63mRxoPZnIFPkFAlhzYp0bHHdlYmN6YXRf
MjAwQHBvY3p0YS5vbmV0LnBsAAoJEJkcaD2ZyBT5WJgIAOBkriOeaXbg9ETYcOyF
sW/ovu2xcKCDtxfQZNxELG/aDRFZXK/03/AaRbzVZkAJb7u+TuxWNAEUt/kBExwl
EODuvUlIcMsVlKKa8L9ToJTztwK2evwIX4P5janO9p/Qkh5hPUOC6lVn55q+NhYp
agBHP5un4RNfM5mVtVgGFvEr+RqFhxEtvJ2LKhsBqnL+6B/V4MTbvJ1sEgK/dpA/
UGJ3uS4FZKGWVdFpv2oXuYAmxZ77M212UimGBXPjkalXWWuDyNyrCLBqLTT7oBEX
gjX+rfZ5nbhXiEoBkH+VNW4rlcyByDaj2hVrPq46WVxwIb5HBSeh8FL+nG+hmblX
+2k=
=A5PK
-----END PGP SIGNATURE-----

--IRfoLjtdMOhWHRpeequcwdP7CAieCOXEP--
