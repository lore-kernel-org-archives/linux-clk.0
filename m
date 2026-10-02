Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51689477298;
	Fri,  2 Oct 2026 09:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932485; cv=none; b=TOB+kgzER3h0Sp50sgWrfvtdQRle1WBIgXMBceaqy4htvwEZyll6WY4EKbXnemAJSlAm6iWNHwqhmY1v8ChfA5FWRs0lmZpReJrRpMYrgX05OKJrkqcjkw2fIpDiHY2SENVJj76smQo55sqhB6dWfHcOSTDcU2UHRdPp2ul8NHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932485; c=relaxed/simple;
	bh=uuc6pKrAEKYY3FvWFjxKLukIlh0MWtxgEufqW9A1wrI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o4Y2cPydzkqW38kd7DFoNwb6mKigyJAFpZLN3mjOcbZNz88f+IRjq290E0zR0qGkESDpfIr6nerUdi3vDsnkLMX08KZgSo8rR3vjqAXoTyxhxrFN7yyGzbyRx3o41/OqbPWye/K6OE7/IFJhzwxatbLTPNrQPIDbNeg/f0vUufA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BiqL4JgZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BiqL4JgZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6DF91F000FF;
	Fri,  2 Oct 2026 09:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932484;
	bh=8NBmc7gHD8IREiMfCsGpwuAj20F8qkNTUXnFe5yI9H8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BiqL4JgZ8ETIr+E/+pA46bL5ZlsXKA1tmO/UxY7H/cn8VnX3saa9kltyH97OSHw6f
	 5z2YWt6O1t60sIzMU7dox2c8PTEenoKEVeO6p4nSOqNIt5Yxh4JAvCi86YmtSXMReu
	 jcu56WprU9LdIfAtjl0uCBVFnDMwVmUCLtkdDRqBRkk02szrRQnvpjgGILAp0mfV1P
	 ZBBtqDAp1S96/11KNVHrZvHDVxIRvj5kBUYRVEWtQ6JXJgSMfHEVqMzbp7RPfdkQyS
	 CqzapdkBJAiLvT15BiScS282CGXc8XBOOaMQYWLQKwXA77fTKlJxg9Pqc1bEx2sF71
	 visHPs1M8Y6dQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 09/11] clk: realtek: Add RTD1625-CRT clock
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: conor+dt@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261002074331.3066919-10-eleanor.lin@realtek.com>
References: <20261002074331.3066919-1-eleanor.lin@realtek.com>
 <20261002074331.3066919-10-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 09:14:43 +0000
Message-Id: <20261002091443.E6DF91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] clk: realtek: incorrect bitmask FREQ_MNO_MASK truncates O field =
for VODMA PLL
--

commit 0728493fca904449d29102f41b0c4a133dfc60a6
Author: Cheng-Yu Lee <cylee12@realtek.com>

clk: realtek: Add RTD1625-CRT clock controller driver

This commit introduces support for the Realtek RTD1625-CRT clock controller,
adding various clock sources, multiplexers, and gates. It also defines
frequency tables and masks for the PLLs used by the device.

> diff --git a/drivers/clk/realtek/clk-rtd1625-crt.c b/drivers/clk/realtek/=
clk-rtd1625-crt.c
> new file mode 100644
> index 0000000000000..b25717eb6301b
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtd1625-crt.c
> @@ -0,0 +1,822 @@

[ ... ]

> +#define FREQ_NF_MASK     0x7ffff
> +#define FREQ_NF(_r, _nf) {.rate =3D _r, .val =3D (_nf),}
> +
> +/* PLL VODMA: M (11:4) / N (13:12) / O (19:17) */
> +#define FREQ_MNO_MASK            0x63ff0

[Severity: Medium]
Does this mask inadvertently exclude bit 19?

The comment documents the O field as covering bits 19:17, but the value
0x63ff0 (which covers bits 18:17, 13:12, and 11:4) leaves bit 19 unset.

If a bootloader configures the hardware with an O divider that requires
bit 19 to be set, would this cause the driver to incorrectly mask out that
bit, resulting in an incorrect frequency calculation during initialization?
It appears the mask should be 0xe3ff0 to fully cover the O field.

> +#define FREQ_MNO(_r, _m, _n, _o) { .rate =3D (_r), .val =3D ((_m) << 4) =
| \
> +				 ((_n) << 12) | ((_o) << 17), }
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002074331.3066=
919-1-eleanor.lin@realtek.com?part=3D9
