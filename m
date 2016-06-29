Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from megous.com ([83.167.254.221]:43658 "EHLO xff.cz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753158AbcF2PbM (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Wed, 29 Jun 2016 11:31:12 -0400
Subject: Re: [linux-sunxi] [PATCH 1/3] clk: sunxi: Add a driver for the CCU
To: Jean-Francois Moine <moinejf@free.fr>
References: <bfb8ceb4-5445-3f43-0a16-bd0e83f2af22@xff.cz>
 <536aa072-d110-1b08-fa25-72c1645e2459@xff.cz>
 <20160629085116.caf701e214440cdf4b1045c8@free.fr>
Cc: Emilio Lopez <emilio@elopez.com.ar>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
From: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megi@xff.cz>
Message-ID: <a827aa49-dde3-23fb-7c44-0dc8fd61948b@xff.cz>
Date: Wed, 29 Jun 2016 17:30:51 +0200
MIME-Version: 1.0
In-Reply-To: <20160629085116.caf701e214440cdf4b1045c8@free.fr>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="LoODOGpSOk12oujmvfl7aam9dBfHCdMOf"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LoODOGpSOk12oujmvfl7aam9dBfHCdMOf
Content-Type: multipart/mixed; boundary="hXcJvOOn5AsDVFOvwof6UlmOg30EUtxNs"
From: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megi@xff.cz>
To: Jean-Francois Moine <moinejf@free.fr>
Cc: Emilio Lopez <emilio@elopez.com.ar>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Message-ID: <a827aa49-dde3-23fb-7c44-0dc8fd61948b@xff.cz>
Subject: Re: [linux-sunxi] [PATCH 1/3] clk: sunxi: Add a driver for the CCU
References: <bfb8ceb4-5445-3f43-0a16-bd0e83f2af22@xff.cz>
 <536aa072-d110-1b08-fa25-72c1645e2459@xff.cz>
 <20160629085116.caf701e214440cdf4b1045c8@free.fr>
In-Reply-To: <20160629085116.caf701e214440cdf4b1045c8@free.fr>

--hXcJvOOn5AsDVFOvwof6UlmOg30EUtxNs
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 29.6.2016 08:51, Jean-Francois Moine wrote:
> On Tue, 28 Jun 2016 21:31:06 +0200
> Ond=C5=99ej Jirman <megi@xff.cz> wrote:
>=20
>>
>> On 28.6.2016 17:37, Jean-Francois Moine wrote:
>>> Most of the clocks in the Allwinner's SoCs are configured in the CCU
>>> (Clock Configuration Unit).
>>>
>>> The PLL clocks are driven from the main clock. Their rates are contro=
lled
>>> by a set of multiply and divide factors, named from the Allwinner's
>>> documentation:
>>> - multipliers: 'n' and 'k'
>>> - dividers: 'd1', 'd2', 'm' and 'p'
>>>
>>> The peripheral clocks may receive their inputs from one or more paren=
ts,
>>> thanks to a mux. Their rates are controlled by a set of divide factor=
s
>>> only, named 'm' and 'p'.
>>>
>>> This driver also handles:
>>> - fixed clocks,
>>> - the phase delays for the MMCs,
>>> - the clock gates,
>>> - the bus gates,
>>> - and the resets.
>>>
>>> Signed-off-by: Jean-Francois Moine <moinejf@free.fr>
>>> ---
>>>  drivers/clk/sunxi/Makefile |   2 +
>>>  drivers/clk/sunxi/ccu.c    | 980 +++++++++++++++++++++++++++++++++++=
++++++++++
>>>  drivers/clk/sunxi/ccu.h    | 153 +++++++
>>>  3 files changed, 1135 insertions(+)
>>>  create mode 100644 drivers/clk/sunxi/ccu.c
>>>  create mode 100644 drivers/clk/sunxi/ccu.h
> 	[snip]
>>> diff --git a/drivers/clk/sunxi/ccu.c b/drivers/clk/sunxi/ccu.c
>>> new file mode 100644
>>> index 0000000..5749f9c
>>> --- /dev/null
>>> +++ b/drivers/clk/sunxi/ccu.c
> 	[snip]
>>> +static void ccu_pll_set_flat_factors(struct ccu *ccu, u32 mask, u32 =
val)
>>> +{
>>> +	u32 reg, m_val, p_val;
>>> +	u32 m_mask =3D (1 << ccu->m_width) - 1;
>>> +	u32 p_mask =3D (1 << ccu->p_width) - 1;
>>
>> I see you have shifted the factor values to be set in the caller of th=
is
>> function, but then you have to shift masks too, to match. It might be
>> clearer to do both shifts in this function.
>=20
> Oops, yes. Thanks. (I did not test yet your patch about the CPU
> frequency)
>=20
>>> +	reg =3D readl(ccu->base + ccu->reg);
>>> +	m_val =3D reg & m_mask;
>>> +	p_val =3D reg & p_mask;
>>> +
>>> +	spin_lock(&ccu_lock);
>>> +
>>> +	/* increase p, then m */
>>> +	if (ccu->p_width && p_val < (val & p_mask)) {
>>> +		reg &=3D ~p_mask;
>>> +		reg |=3D val & p_mask;
>>> +		writel(reg, ccu->base + ccu->reg);
>>> +		udelay(10);
>>> +	}
>>> +	if (ccu->m_width && m_val < (val & m_mask)) {
>>> +		reg &=3D ~m_mask;
>>> +		reg |=3D val & m_mask;
>>> +		writel(reg, ccu->base + ccu->reg);
>>> +		udelay(10);
>>> +	}
>>> +
>>> +	/* set other factors */
>>> +	reg &=3D ~(mask & ~(p_mask | m_mask));
>>> +	reg |=3D val & ~(p_mask | m_mask);
>>> +	writel(reg, ccu->base + ccu->reg);
>>> +
>>> +	/* decrease m */
>>> +	if (ccu->m_width && m_val > (val & m_mask)) {
>>> +		reg &=3D ~m_mask;
>>> +		reg |=3D val & m_mask;
>>> +		writel(reg, ccu->base + ccu->reg);
>>> +		udelay(10);
>>> +	}
>>> +
>>> +	/* wait for PLL stable */
>>> +	if (ccu->lock_reg) {
>>> +		u32 lock;
>>> +
>>> +		lock =3D BIT(ccu->lock_bit);
>>> +		WARN_ON(readl_relaxed_poll_timeout(ccu->base + ccu->lock_reg,
>>> +							reg, !(reg & lock),
>>> +							100, 70000));
>>> +	}
> 	[snip]
>>
>> Any reason why you're waiting for the lock after decreasing m and not
>> before? PLL output may till run too fast before reducing the postdivid=
er
>> potentially causing a crash. But I might be misunderstanding what m is=

>> exactly.
>=20
> I just followed what is done in the function
>  sunxi_clk_factors_set_flat_facotrs() from Allwinnertech:
>=20
> 	1).try to increase factor p first
> 	2).try to increase factor m first
> 	3. write factor n & k
> 	4. do pair things for 2). decease factor m
> 	5. wait for PLL state stable
> 	6.do pair things for 1).  decease factor p
>=20
> As this is written, it seems m is a pre-divider.
>=20

Interesting. :) I've reverse engineered their arisc code, and there the
order for setting up/changing PLL1 is:

1. try to increase factor p first
2. try to increase factor m first
3. write factor n & k
4. wait for PLL state stable
5. do pair things for 2). decease factor m
6. do pair things for 1).  decease factor p

That's why I asked.

So all this depends on the design of this clock source. It may be
different for different PLLs.

Hard to know what to believe. Perhaps it would be possible to create a
PLL stress tester that would try both approaches and see whether one of
them is more stable/leads to creashes?

regards,
  Ondrej


--hXcJvOOn5AsDVFOvwof6UlmOg30EUtxNs--

--LoODOGpSOk12oujmvfl7aam9dBfHCdMOf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXc+mzAAoJEG5kJsZ3z+/xcs4QAJXQHnO6DpjB+t7XGq0yLebE
emWbpsq+ornVUCk50SBN7G/55l3FgFAo2VkQYieg+hsKq23+cTtZG5+0L89XIgHQ
Hi8TExDKNfy6qOzi9pv86drQbrgXmGragW1ZhTsjH1Xu5fsoE6wEBZOOtkFP+jkl
inIYrLmh6UGnL00zhFWd1oeJ3U4u8hrcWdaB2Z21MLTXvk0q6M553nFs012LLFFM
ZC3EArW6wSiHzUqpBJcA5WlQiWMhSA8Q/IcGV3nQW10oTcPRHH5ILa4bmNgL+sG3
jrb81BaDrxeKwXC63Vm6a4+pDiBR0OpS67BRQIRZSro1fZcBbIQDeBxiExXgQRh9
5vEJaq5lV9jDEL0/xjAYcpALyVw7+apHC1hs+WwI7yboryikA8MVd9UagXq7NS6+
ishe/rF/xVBk2x+JQMivqzlKSg+zHfhEvUVJ8hHbfB5/QzFoGptLSXF3X+LszhBN
CXE0CxrU++jq82a0qckTgqjhTnECQjU/Ia3Cidd/RqtWu04uTxhPJFbJo44uZ+Zb
HQ8wmpRH2slaBMJQvNU6I1Oam6weSzqFQc4gHApCdgjFPf/QaRMgUnEKr1qMb/Tb
OoZSPizVSDexYpdpQNpHKLTXs2L1SzPx645LDgLWf/L3EvKL3y9U460Cd7cLG8Iz
40RL7J7BHjkOnzy7x2NP
=K+Oc
-----END PGP SIGNATURE-----

--LoODOGpSOk12oujmvfl7aam9dBfHCdMOf--
