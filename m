Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E31E4A5EBA;
	Wed,  2 Sep 2026 14:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788361153; cv=pass; b=XOpAAf3j2d5A6VFPcwAyOj7I32OaO2zTsUoK0jY3V/XPEQJzy+jhvLwUdLJ5CCRp1VM1MxlAQS6f2uVOykKq1jFy/fNS4xGUK5toTlfF1OV8hx934J5dQSzkTvu6+r5LzP+l4nx0KO2cBnW7fBDhhM/R/+PHnRIx8WlfxlQPGG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788361153; c=relaxed/simple;
	bh=du7i2CkkuXhTACL5xjLwkLIqGU9AdyAp19y9A1xZak4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=DDvPGacX8hfjKiCZAjy9WcSDXBcD+ABYh+iw7McGqdk6ojXir3UATKUFHqGVU5UArfRgF05bJtFe1oQJ7i3S1ANFQxJYNflLGbvyJj5kiG0r/EQ4i1UbDKwIRuXTcLaIcHDSNy8HmDMABImS+AXqgo5USJAc3a3VxNwU9kpJ7gQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=qACYkUGw; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="qACYkUGw"
ARC-Seal: i=1; a=rsa-sha256; t=1788361100; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S3QT2xnqapjWCt5br7N62PuBrrk/9qtRhbUZ0tLdJjAkdyn8BujS1mrgqWyhz07dljw/NP7WOK3LteyREHuSegPaB5HM29ePvLQs4r1wudYTm+IrRSBq7gQy8IwMEE1QVvw7mO6P8negJYTImrNpaXiBHH05Hr+vnsaF9DcCyoE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788361100; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8HO2oXDKMUH/IBYP69UiPRfT2MLlZ9mi40/eACWvXEM=; 
	b=b92bjwNpEO9fBCluP9ciiZ5sWudULCQpXOFi2mYF4ha9xqOIknar1RRQ4885UiWT33ZunTU/XrFg3p2vfcwW+7xf/qLGjF8cqJOG9OiahalSpCoHfA03PRfmxeLMecwV3em/6GPCWpE+zPbMA+Pb4gweYjN7wKrtrYnEk4nXKKw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788361100;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:Subject:Subject:From:From:To:To:In-Reply-To:Reply-To;
	bh=8HO2oXDKMUH/IBYP69UiPRfT2MLlZ9mi40/eACWvXEM=;
	b=qACYkUGwqEncwBwGhite6gjWfNXt9JXXjby68YUe1+OEKSieU1l/UGTyYe1eVbiE
	uUD6/jVuQd9uCyHa3zLpJH3HkdbW4TcY7yS9vSmIY7Yg1W9m3LPCzt5WPMLNnSDn2R/
	Z/LzbdirePQ+PKEk8zcitTJFlU0IiS4moaKyGCpM=
Received: by mx.zohomail.com with SMTPS id 178836109677887.78200468721616;
	Wed, 2 Sep 2026 07:58:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Sep 2026 22:58:04 +0800
Message-Id: <DL4X3G8EL12W.GCHSR93W77W3@pigmoral.tech>
Cc: "Stephen Boyd" <sboyd@kernel.org>, "Brian Masney" <bmasney@redhat.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Samuel Holland"
 <samuel@sholland.org>, "Philipp Zabel" <p.zabel@pengutronix.de>,
 <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, "Jerome Brunet" <jbrunet@baylibre.com>
Subject: Re: [PATCH v2 4/8] clk: sunxi-ng: a733: Add PLL clocks support
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: <wens@kernel.org>, "Junhui Liu" <junhui.liu@pigmoral.tech>
X-Mailer: aerc 0.21.0
References: <20260711-a733-clk-v2-0-974d188cbe0c@pigmoral.tech>
 <20260711-a733-clk-v2-4-974d188cbe0c@pigmoral.tech>
 <CAGb2v65KKifCUYUxnZ5Vm=XNqNdiNC1i+U9mgX2djtPkwvtN2g@mail.gmail.com>
In-Reply-To: <CAGb2v65KKifCUYUxnZ5Vm=XNqNdiNC1i+U9mgX2djtPkwvtN2g@mail.gmail.com>
X-ZohoMailClient: External

Hi Chen-Yu,
Thanks for your review. I will address the comments in v3.

On Sun Aug 23, 2026 at 5:38 PM CST, Chen-Yu Tsai wrote:
> (trimmed recipient list a bit)
>
> On Sat, Jul 11, 2026 at 4:12=E2=80=AFPM Junhui Liu <junhui.liu@pigmoral.t=
ech> wrote:
>>
>> Add PLL clock support for the main CCU of the Allwinner A733 SoC. The
>> structure is mostly similar to the sun55i, with the addition of a
>> PLL_REF clock that normalizes the hardware-detected DCXO/hosc frequency
>> (19.2MHz, 24MHz, or 26MHz) into a consistent 24MHz reference for all
>> subsequent PLLs.
>>
>> The behaviors of PLL_AUDIO0 and PLL_AUDIO1 are ported from the vendor
>> driver. Specifically, PLL_AUDIO0 is configured with SDM parameters to
>> provide a 22.5792MHz * 4 output, while PLL_AUDIO1 is integrated into
>> the main CCU without using SDM.
>>
>> Tested-by: Jerome Brunet <jbrunet@baylibre.com>
>> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>> ---
>>  drivers/clk/sunxi-ng/Kconfig           |   5 +
>>  drivers/clk/sunxi-ng/Makefile          |   2 +
>>  drivers/clk/sunxi-ng/ccu-sun60i-a733.c | 539 ++++++++++++++++++++++++++=
+++++++
>>  3 files changed, 546 insertions(+)

[...]

>> +
>> +/*
>> + * There is no actual clock output with that frequency (2.4 GHz), inste=
ad it
>> + * has multiple outputs with adjustable dividers from that base frequen=
cy.
>> + * Model them separately as divider clocks based on that parent here.
>> + */
>> +#define SUN60I_A733_PLL_PERIPH0_REG    0x0a0
>> +static struct ccu_nm pll_periph0_4x_clk =3D {
>> +       .enable         =3D BIT(25) | BIT(26) | BIT(27),
>
> The gate helper sort of expects this to be just one bit. And the three
> bits here are for the three individual outputs (2x, 800M, 480M). I think
> you should move the bits to the individual outputs, and use BIT(31) here
> instead (or just leave out the enable bit for this one).

I will leave out the enable bit for the PLL core and move the three
output gate bits to their corresponding child clocks.

[...]

>> +
>> +static const struct clk_hw *pll_audio1_hws[] =3D {
>> +       &pll_audio1_clk.common.hw
>> +};
>> +static SUNXI_CCU_M_HWS(pll_audio1_div2_clk, "pll-audio1-div2", pll_audi=
o1_hws,
>> +                      SUN60I_A733_PLL_AUDIO1_REG, 20, 3, 0);
>> +static SUNXI_CCU_M_HWS(pll_audio1_div5_clk, "pll-audio1-div5", pll_audi=
o1_hws,
>> +                      SUN60I_A733_PLL_AUDIO1_REG, 16, 3, 0);
>
> Perhaps these should be made fixed? Otherwise the names don't apply corre=
ctly.

Agreed. Since the names explicitly describe fixed /2 and /5 divisions,
I will model these two outputs as fixed-factor clocks and initialize the
corresponding divider fields accordingly.

[...]

>> +       .lock           =3D BIT(28),
>> +       .n              =3D _SUNXI_CCU_MULT_MIN(8, 8, 11),
>> +       .m              =3D _SUNXI_CCU_DIV(1, 1), /* input divider */
>> +       .common         =3D {
>> +               .reg            =3D SUN60I_A733_PLL_DE_REG,
>> +               .hw.init        =3D CLK_HW_INIT_PARENTS_HW("pll-de-12x",=
 pll_ref_hws,
>> +                                                        &ccu_nm_ops,
>> +                                                        CLK_SET_RATE_GA=
TE),
>> +       },
>> +};
>> +
>> +static const struct clk_hw *pll_de_hws[] =3D {
>> +       &pll_de_12x_clk.common.hw
>> +};
>> +static SUNXI_CCU_M_HWS(pll_de_4x_clk, "pll-de-4x", pll_de_hws,
>> +                      SUN60I_A733_PLL_DE_REG, 20, 3, 0);
>> +static SUNXI_CCU_M_HWS(pll_de_3x_clk, "pll-de-3x", pll_de_hws,
>> +                      SUN60I_A733_PLL_DE_REG, 16, 3, 0);
>
> Should we make the values fixed or the divider read-only?

After checking the manual again, I don't think these dividers should be
fixed or read-only.

The 4X and 3X suffixes appear to be hardware output names rather than
fixed multiplication factors. The manual describes both P0 and P1 as
programmable dividers and only gives their default frequencies; it does
not say that their values must remain fixed.

For example, the default frequencies of DEPLL4X and DEPLL3X are
1044 MHz and 696 MHz, respectively. If the suffixes represented
multiples of a common base frequency, 1044 MHz / 4 * 3 would be
783 MHz, not 696 MHz.

[...]

>> +
>> +       /*
>> +        * The PLL clock code does not model all bits, for instance it d=
oes
>> +        * not support a separate enable and gate bit. We present the
>> +        * gate bit(27) as the enable bit, but then have to set the
>> +        * PLL Enable, LDO Enable, and Lock Enable bits on all PLLs here=
.
>> +        */
>> +       for (i =3D 0; i < ARRAY_SIZE(pll_regs); i++) {
>> +               val =3D readl(reg + pll_regs[i]);
>> +               val |=3D BIT(31) | BIT(30) | BIT(29);
>> +               writel(val, reg + pll_regs[i]);
>> +       }
>> +
>> +       /* Enforce m1 =3D 0 for PLL_AUDIO0 */
>> +       val =3D readl(reg + SUN60I_A733_PLL_AUDIO0_REG);
>> +       val &=3D ~BIT(1);
>> +       writel(val, reg + SUN60I_A733_PLL_AUDIO0_REG);
>
> We should also force the divider for all the divN or Nx outputs.

For the reasons above, I plan to force the divider values only for the
divN outputs, whose names explicitly specify their division ratios, and
leave the Nx output dividers programmable.

>
>
> Thanks
> ChenYu
>

--=20
Best regards,
Junhui Liu
