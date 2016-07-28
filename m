Return-Path: <megous@megous.com>
Subject: Re: Changed: sunxi-ng clock code - NKMP clock implementation is wrong
To: Maxime Ripard <maxime.ripard@free-electrons.com>
References: <20160625034511.7966-1-megous@megous.com>
 <20160625034511.7966-7-megous@megous.com> <20160630204001.GC5485@lukather>
 <0b71ed7e-98c9-109e-85e6-ceb95131d88a@megous.com>
 <20160715085356.GR4761@lukather>
 <085e185a-ac76-dd3f-9b0e-a7dc9c0c09f3@megous.com>
 <20160721094852.GI5993@lukather>
 <c46d1af5-9410-402a-7144-48b396ef6da7@megous.com>
 <20160726063253.GW7419@lukather>
 <e1b8127f-c422-46ab-384b-aeee85aa940b@megous.com>
 <20160728210011.GJ6682@lukather>
Cc: dev@linux-sunxi.org, linux-arm-kernel@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>,
 =?UTF-8?Q?Emilio_L=c3=b3pez?= <emilio@elopez.com.ar>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
From: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megous@megous.com>
Message-ID: <7c5f2835-f044-7c18-def9-52af5ce4afc3@megous.com>
Date: Fri, 29 Jul 2016 00:01:09 +0200
MIME-Version: 1.0
In-Reply-To: <20160728210011.GJ6682@lukather>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="TcGMBTmXeop037moXWFojLC2R6KkCbdg0"
List-ID: <linux-clk.vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TcGMBTmXeop037moXWFojLC2R6KkCbdg0
Content-Type: multipart/mixed; boundary="2N9N98jE3bAV3IGrUp03mBtgdVix3nAAm"
From: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megous@megous.com>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: dev@linux-sunxi.org, linux-arm-kernel@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>,
 =?UTF-8?Q?Emilio_L=c3=b3pez?= <emilio@elopez.com.ar>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Message-ID: <7c5f2835-f044-7c18-def9-52af5ce4afc3@megous.com>
Subject: Re: Changed: sunxi-ng clock code - NKMP clock implementation is wrong
References: <20160625034511.7966-1-megous@megous.com>
 <20160625034511.7966-7-megous@megous.com> <20160630204001.GC5485@lukather>
 <0b71ed7e-98c9-109e-85e6-ceb95131d88a@megous.com>
 <20160715085356.GR4761@lukather>
 <085e185a-ac76-dd3f-9b0e-a7dc9c0c09f3@megous.com>
 <20160721094852.GI5993@lukather>
 <c46d1af5-9410-402a-7144-48b396ef6da7@megous.com>
 <20160726063253.GW7419@lukather>
 <e1b8127f-c422-46ab-384b-aeee85aa940b@megous.com>
 <20160728210011.GJ6682@lukather>
In-Reply-To: <20160728210011.GJ6682@lukather>

--2N9N98jE3bAV3IGrUp03mBtgdVix3nAAm
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 28.7.2016 23:00, Maxime Ripard wrote:
> Hi Ondrej,
>=20
> On Thu, Jul 28, 2016 at 01:27:05PM +0200, Ond=C5=99ej Jirman wrote:
>> Hi Maxime,
>>
>> I don't have your sunxi-ng clock patches in my mailbox, so I'm replyin=
g
>> to this.
>=20
> You can find it in the clock maintainers tree:
> https://git.kernel.org/cgit/linux/kernel/git/clk/linux.git/log/?h=3Dclk=
-sunxi-ng
>=20
>> On 26.7.2016 08:32, Maxime Ripard wrote:
>>> On Thu, Jul 21, 2016 at 11:52:15AM +0200, Ond=C5=99ej Jirman wrote:
>>>>>>> If so, then yes, trying to switch to the 24MHz oscillator before
>>>>>>> applying the factors, and then switching back when the PLL is sta=
ble
>>>>>>> would be a nice solution.
>>>>>>>
>>>>>>> I just checked, and all the SoCs we've had so far have that
>>>>>>> possibility, so if it works, for now, I'd like to stick to that.
>>>>>>
>>>>>> It would need to be tested. U-boot does the change only once, whil=
e the
>>>>>> kernel would be doing it all the time and between various frequenc=
ies
>>>>>> and PLL settings. So the issues may show up with this solution too=
=2E
>>>>>
>>>>> That would have the benefit of being quite easy to document, not be=
 a
>>>>> huge amount of code and it would work on all the CPUs PLLs we have =
so
>>>>> far, so still, a pretty big win. If it doesn't, of course, we don't=

>>>>> really have the choice.
>>>>
>>>> It's probably more code though. It has to access different register =
from
>>>> the one that is already defined in dts, which would add a lot of cod=
e
>>>> and require dts changes. The original patch I sent is simpler than t=
hat.
>>>
>>> Why?
>>>
>>> You can use container_of to retrieve the parent structure of the cloc=
k
>>> notifier, and then you get a ccu_common structure pointer, with the
>>> CCU base address, the clock register, its lock, etc.
>>>
>>> Look at what is done in drivers/clk/meson/clk-cpu.c. It's like 20 LoC=
=2E
>>>
>>> I don't really get why anything should be changed in the DT, or why i=
t
>>> would add a lot of code. Or maybe we're not talking about the same
>>> thing?
>>
>> I've looked at the new CCU code, particularly ccu_nkmp.c, and found th=
at
>> it very liberally uses divider parameters, even in situations that are=

>> out of spec compared to the current code in the kernel.
>>
>> In the current code and especially in the original vendor code, divide=
r
>> parameters are used as last resort only. Presumably because, of the
>> inherent trouble in changing them, as I described to you in other emai=
l.
>>
>> The new ccu code uses dividers often and even at very high frequencies=
,
>> which goes against the spec.
>>
>> In the vendor code M is never anything else but 0, and P is used only
>> for frequencies below 288MHz, which matches the H3 datasheet, which sa=
ys:
>=20
> In the vendor code, P is never used either. All the boards we had so
> far don't go that low, so we cannot make any of these assumptions,
> especially since the vendor code has had the bad habit of doing
> something wrong and / or useless in the past.

P is used in the arisc firmware according to the spec for the lower
frequencies.

> However, this implementation is a new thing, and it was using the H3
> precisely because of its early stage of support to use it as a testbed
> for the more established.
>=20
> If you feel like we should use a different formula to favour the
> multipliers over the dividers (or want to change the class of the CPU
> PLL to an NKM or something else, this is totally doable.

I think the original formula that's currently in the mainline kernel is
better and avoids fiddling with dividers too much.

>> "The P factor only use in the condition that PLL output less than 288
>> MHz."
>=20
> And the datasheet also had some issues, either misleading or wrong
> comments in the past. Don't get me wrong, I'm not saying that this is
> wrong, just that we should not follow it religiously, and that we
> should trust more the experiments than the datasheet.

I can believe that. :) Regardless, I think the reasons given for
avoiding dividers are quite reasonable. It's based on how PLL block
works, not what manual says.

>> Also other datasheets of similar socs from Allwinner state that M shou=
ld
>> not be used in production code.
>=20
> Which ones specifically?

A83T for example. You can search for "only for test" phrase.

https://github.com/allwinner-zh/documents/blob/master/A83T/A83T_User_Manu=
al_v1.5.1_20150513.pdf

Those PLLs are a bit different though.


regards,
  Ondrej

>> So it may be that they either forgot to state it in the H3
>> datasheet, or it can be used. In any case, they never use M in their
>> code, so it may be wise to keep to that.
>>
>> When I boot with the new CCU code I get this:
>>
>> PLL_CPUX =3D 0x00001B21 : M =3D 2, K =3D 3, N =3D 28, P =3D 1, EN =3D =
0
>> PLL_CPUX : freq =3D 1008MHz
>>
>> Mathematically it works, but it is against the spec.
>>
>> Also, this:
>>
>> analyzing CPU 0:
>>   driver: cpufreq-dt
>>   CPUs which run at the same hardware frequency: 0 1 2 3
>>   CPUs which need to have their frequency coordinated by software: 0 1=
 2 3
>>   maximum transition latency: 1.74 ms
>>   hardware limits: 120 MHz - 1.37 GHz
>>   available frequency steps:  120 MHz, 240 MHz, 480 MHz, 648 MHz, 816
>> MHz, 960 MHz, 1.01 GHz, 1.06 GHz, 1.10 GHz, 1.15 GHz, 1.20 GHz, 1.22
>> GHz, 1.25 GHz, 1.30 GHz, 1.34 GHz, 1.37 GHz
>>   available cpufreq governors: conservative ondemand userspace powersa=
ve
>> performance
>>   current policy: frequency should be within 240 MHz and 240 MHz.
>>                   The governor "performance" may decide which speed to=
 use
>>                   within this range.
>>   current CPU frequency: 24.0 MHz (asserted by call to hardware)
>>
>>
>> Somehow, the new CCU code sets the CPUX to 24MHz no matter what.
>>
>> I'm using your pen/clk-rework branch without any other patches that we=
re
>> later sent to the mailing list.
>=20
> It's probably because of CLK_SET_RATE_PARENT on the CPU clock missing,
> as Chen-Yu suggested.
>=20
> Maxime
>=20


--2N9N98jE3bAV3IGrUp03mBtgdVix3nAAm--

--TcGMBTmXeop037moXWFojLC2R6KkCbdg0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXmoCoAAoJEG5kJsZ3z+/xJ9IP/3H3sw47EW4WOZ/SQ3frrQQA
6rcYKNDxTQZhg4rwOmwm/9BoKnXNY8SNElEUFwZgJ4hqcdLkCEssBVoP2eD9CI3w
g76aRlp3Rm5dmKnkCvq5qjTFcX9B0A9efTer75jTh0+i0ksC4NUqWAsHyABV2+zJ
fP2CAPw0rG2u1Kan2vRBx8d969MFdW868DMHA8nYNMBDSLdb3HoLrZamjgG3Vi0e
A8DsSB9Ezki9fus5bIs6CdoER1V99snrpoKB1K9biGIVZ4rmINikwvuyuIZhxBnX
832GbeRKi/KOFo4T46I/9BuC0dsNa4wnV7E9PINHogTLUwCdIdv6IkWVwJc0Jqr/
4nmgnL8yaEKO/7pZL7kWeg1jOwJthmD+z1dNqI5SSPm0HfQ7OxW+13y3eCwUADE8
14FWztwyL90XcBI3RKCi0j5pMyKMdIRkGPCH3WVNtN4rNptCu7TPqmrMopxxpGxE
NE5yQP+61EiO7WJQSItXhFIUsffAhbaXTNEbWi2WwcfI3lVv8Ggqs44IXRRsp0yy
7AxZI3dFuXWORskdliXfDZGr9BQZGmXPKPm0Hg95d5f5EmOxEP7k8V0KuCRtKceQ
iPzWhaC1Q50OKbcztHYzkx0F/tu8KbcdISY+27IQ8xdIs3It5ZA1BnPjd9JKQptg
V9ddyEaGH9ivVU5INClT
=YeDw
-----END PGP SIGNATURE-----

--TcGMBTmXeop037moXWFojLC2R6KkCbdg0--
