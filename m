Return-Path: <megous@megous.com>
Subject: Re: [PATCH v2 06/14] ARM: sun8i: clk: Add clk-factor rate application
 method
To: Jean-Francois Moine <moinejf@free.fr>
References: <20160625034511.7966-1-megous@megous.com>
 <20160625034511.7966-7-megous@megous.com> <20160630204001.GC5485@lukather>
 <0b71ed7e-98c9-109e-85e6-ceb95131d88a@megous.com>
 <20160715085356.GR4761@lukather>
 <085e185a-ac76-dd3f-9b0e-a7dc9c0c09f3@megous.com>
 <20160715152756.db7375a7109fed18c2fbf43a@free.fr>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, dev@linux-sunxi.org,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, open list
 <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Emilio_L=c3=b3pez?=
 <emilio@elopez.com.ar>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org
From: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megous@megous.com>
Message-ID: <98fd2ab2-9b1d-1494-5867-7701780fd471@megous.com>
Date: Fri, 15 Jul 2016 15:48:45 +0200
MIME-Version: 1.0
In-Reply-To: <20160715152756.db7375a7109fed18c2fbf43a@free.fr>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="KmgnLmkqgdgnO5bMbpkTqKQqxG8nCQ41j"
List-ID: <linux-clk.vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KmgnLmkqgdgnO5bMbpkTqKQqxG8nCQ41j
Content-Type: multipart/mixed; boundary="miiIr03PtmOqRMm3Pe6HI9wjTxPb1P1Ie"
From: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megous@megous.com>
To: Jean-Francois Moine <moinejf@free.fr>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, dev@linux-sunxi.org,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, open list
 <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Emilio_L=c3=b3pez?=
 <emilio@elopez.com.ar>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org
Message-ID: <98fd2ab2-9b1d-1494-5867-7701780fd471@megous.com>
Subject: Re: [PATCH v2 06/14] ARM: sun8i: clk: Add clk-factor rate application
 method
References: <20160625034511.7966-1-megous@megous.com>
 <20160625034511.7966-7-megous@megous.com> <20160630204001.GC5485@lukather>
 <0b71ed7e-98c9-109e-85e6-ceb95131d88a@megous.com>
 <20160715085356.GR4761@lukather>
 <085e185a-ac76-dd3f-9b0e-a7dc9c0c09f3@megous.com>
 <20160715152756.db7375a7109fed18c2fbf43a@free.fr>
In-Reply-To: <20160715152756.db7375a7109fed18c2fbf43a@free.fr>

--miiIr03PtmOqRMm3Pe6HI9wjTxPb1P1Ie
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 15.7.2016 15:27, Jean-Francois Moine wrote:
> On Fri, 15 Jul 2016 12:38:54 +0200
> Ond=C5=99ej Jirman <megous@megous.com> wrote:
>=20
>>> If so, then yes, trying to switch to the 24MHz oscillator before
>>> applying the factors, and then switching back when the PLL is stable
>>> would be a nice solution.
>>>
>>> I just checked, and all the SoCs we've had so far have that
>>> possibility, so if it works, for now, I'd like to stick to that.
>>
>> It would need to be tested. U-boot does the change only once, while th=
e
>> kernel would be doing it all the time and between various frequencies
>> and PLL settings. So the issues may show up with this solution too.
>=20
> I don't think this is a good idea: the CPU clock may be changed at any
> time with the CPUFreq governor. I don't see the system moving from
> 1008MHz to 24MHz and then to 1200MHz when some computation is needed!

PLL lock time is around 10-20us, I'd guess based on the number of loops
in the PLL lock wait loop. So unless you'll be switching frequencies
many times per second, this should be barely noticeable.

But I'd like a different solution too.

> BTW, Ond=C5=99ej, in my BPi M2+, I tried to change the CPU clock with y=
our
> code at kernel start time from 792MHz to 1008MHz, but the hardware
> (arisc?) set an other value, and the system speed was lower than before=

> (the PLL-CPUx register is 0x90031521 on boot, I want to set it to
> xxxx1410 and I read 0x91031f33 - sorry, I did not have a look at the
> CPU SD pattern). Do you know why?

No idea. Arisc shouldn't do anything, unless you load some firmware into
it, and release its reset line.


--miiIr03PtmOqRMm3Pe6HI9wjTxPb1P1Ie--

--KmgnLmkqgdgnO5bMbpkTqKQqxG8nCQ41j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXiOnAAAoJEG5kJsZ3z+/xrzAQAJoyDUll8xflmcvzSA49xaGN
9bZLflgmdzc7fQhN0eb1fgwU1SKQJI0LLHsRBOXE6mG7Vhoa5KuJkCfsCg4fGPYV
LLz92dUUMB9/Rjakv984uJ3I5tU7UI55caf3gmwv+foZ37UlTbN6vRpoA95eUY2C
NqqsSsanPhSDXZSXhThc+UTjfFpETpiCCef0tcGe/w1sjnE/vqblalsFw1FIBIki
HRdqURwTqVmhZZgGJy6jSTleKdR1/LEMk+5BhYRKIWFUEgEgslsu7Zhi2PBPA9Z/
zH2g+m3Q+ubvzkf26KqxywkLQHZWojNU08hHPUgRicNd+Yv7nsvF7WNgT0qryIBX
GhTVmJ7/py1oVtycgYIL3DnMKyUL/d+iZh23nZ74EtKAxDpWdJ0SKDIiCSUvZDCq
0zz7ynpdSlF5nSSMcGqzRRL1/JofQqZP4bxd/xGbn64G5oaUWvlNve+Vd8FHZyDO
//Qg0VJhAcqkS9I5FNfJCysg1mMDZf66qTZcsW5XDy3kBOADR3MQp2uZco2Fut0P
G+5mYwGzX18XnFp6XMEdntqyn3rEOV7RLQSXoxWyuptQz4MiRU3zsQJaGoH5x7U3
qzm4QUNQC8lTtU1iJO27anStLiXUVMqMGf7OCGgp5NgsLZyQHTztedu3OhK3pcjl
/CXubrQdwQO7+um4C8BP
=x2AH
-----END PGP SIGNATURE-----

--KmgnLmkqgdgnO5bMbpkTqKQqxG8nCQ41j--
