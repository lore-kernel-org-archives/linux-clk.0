Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69D53A6F16
	for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 08:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786351434; cv=none; b=acVm+xyqLP+CXdJ5o2T6rtXRGJ63GW1mXyHauUAa6yilDgPHEoxOOxZuFSH+iCwgNdlB2uPYq8kTvNQ2l6g4SVLG2jPFrDH58B87TueQPkitWZxbTLT/IR8RrvxBZnWql9/rXEhNtaHwBHcPcvgoZeT7lk9yz8zUOwK1nTGMqZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786351434; c=relaxed/simple;
	bh=zfC7lhtC0ZhBcGSHDYbkMlXmarTuC594GkrsxACApUQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=lLqukPxxtXlk9fwlDHj0Ngoi9jLEFDoErInmkw0vtRrNpSRxttaKAco4mqj92V4s5vvRs3wLvip7MOk610N1dpqlA/LdioVb2DNF1oH/8cUAMx+93CCSXigKyW/fQIhguZTxyehV2+FcujmAFp7yEzelfCIYfRP0IFe7tJX3Koc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=YzVpz9fB; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="YzVpz9fB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1786351336;
	bh=9b6ShfMeZe2xAUD9+B2Stmwf48m8aw2mvouvW/AlHHI=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=YzVpz9fBx/BiYsAkfqn4CLVmugnwRJkZF8a7Ha7/tN7OjH+otvDzlh9KqyNZBgC6U
	 6gn8430g/FU1mkYrCtFK6GOKoa+YcKrr2WgWmqA0NGkS3opvvfph0bxN30/iEAcjTV
	 qNFZynqQGVVAMkhMOwAmqANgcNGsa8JfMuMJxaN4=
X-QQ-mid: esmtpgz15t1786351327tc93958f4
X-QQ-Originating-IP: kbLOV7gjYlNvnl0rraFfGXYnouNtT815jhLZiJswT5s=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 10 Aug 2026 16:42:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1439357261299029505
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=5c2444142807e9cfb537af5f4976382a35e3a9d6e77c043f51e0fe45cff4;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 10 Aug 2026 16:42:02 +0800
Message-Id: <DKL4P0ONTLFP.3QG0CCUU76BUG@linux.spacemit.com>
Cc: <linux-clk@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] clk: spacemit: re-enable PLLs after init
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Yao Zi" <me@ziyao.cc>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Brian Masney" <bmasney@redhat.com>,
 "Yixun Lan" <dlan@kernel.org>, "Inochi Amaoto" <inochiama@outlook.com>,
 "Alex Elder" <elder@riscstar.com>, "Haylen Chu" <heylenay@4d2.org>
References: <20260804-k3-pll5-pll8-1800mhz-v1-0-a3a75866ce32@linux.spacemit.com>
	<20260804-k3-pll5-pll8-1800mhz-v1-1-a3a75866ce32@linux.spacemit.com>
	<anGeZk0-YShccqwE@pie>
In-Reply-To: <anGeZk0-YShccqwE@pie>
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mg1D4hNPaN4xNs8K0vq3tEv8dgERJCWMB9LOGp5Bj2xPYvHj/+zoldkR
	POwCaG4rKK3apn7ZzuXnwCLPsgBq2dP7PuzsXJm2DK6r9Or+ezbWnf52zq06d01HFpUU02k
	8te73QVb6+IBr+kgolvyc9LAuxuYLR38V3fNv7mmzoyDfjLVXUTZk2Kdh0TTWVjrltR/EeU
	AI/iB5Wm8TOonI8Yle/UeQf6mx8FasLAXBNZVgGVOLci6xrCCAU/rFOIoYFwPV62CGvVYU1
	tlX5hyWSRl4D/Q5JTdxj8s4WUK+xFqMXOGOxDMC0MLqIugORSYaylC/Vcjchk7eyKH3Al+Z
	mdiacvaheDmFPaA8rNkJxgVcUHzaQzdE7xK8gDiqSLR80MQOczv3yi6Jn3XWaWO3C/bQqgF
	Cp8mudDd1xSsCeptElIAdsI/C4m9XAhUoM/Es0comzm0kA3An2MAGbxKOoybjiroYvBDuIR
	N/hVmuFN3uRRBG0vQKelcHJCRhBoAsZf5FuT0IgJpd6m9QUjy4pN2bmi4Vetd0EdohtEIK2
	2YW9lpyxHyvT77gSXKc+J1Ru44EGAkrezF/dI/CqvJMwyZTkjM5GFgkTwe7xEiQ5V/q6x6/
	JzzrO/czLW++L3e8bQFiQ9nTjTQzsV1ntj5yAArktIZGUi9LuCAn6LFIKT5WLeA3SubOBy5
	ag1c0IaOa/JknG7QD0uxagJIFObnF+n7GDVc3JL/KQ1iNsGRHdE47QtB0IdRfSroWLPovtx
	XoFiZTvY4ws4hvhg+zw07o7d2FdJtMETDmmvpK+EqA/qpWgN2EOJxDtLIBHQPnaUtXtQTgJ
	Ir18g6oKm1TXlQKjQKslu579Kbzv3E4yLj8xlZ9PyXeriyoduWP0xgZnRb4fe9tIWF7UkOm
	CXrWNwOsDWE/5w2haymcFC3EyOFj48WpXusatS052skmw6sGOxhSbeV5zm2p4YZSVF1/tur
	ZtJwFk71wkfYrbf/qGydSyhUEMCMfHLhcRlXELzbGgh5WD6fnfpC5hB5I4CbtRre2tQK7hO
	KG9MD98K3lUvPqgPDdF8yYXm/MHvbuuvZ6tZGLAY32Vbg8pK3UXguzVaXmukuEStjkMHpbG
	X+Gq85LhXnVTx2BXsYAUh4=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

--5c2444142807e9cfb537af5f4976382a35e3a9d6e77c043f51e0fe45cff4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

> I don't think this patch makes sense.
>
> If this PLL is essential for some components of the systems to work,
> there's no chance to re-program it safely after the kernel gets started,
> since all the PLLs in K1 and K3 are specified as CLK_SET_RATE_GATE.
>
> If the essential clocks could be re-parented glitchlessly, registering
> a notifier and re-parenting it before the PLL disables might be a
> solution. In this case, we need to delay the operation in
> ccu_pll*_init() until clock registration fully completes.
>
> Otherwise, re-enabling the PLL seems totally extra here, they could be
> enabled on the fly when it's going to be used.

You are right. In both hunks, ccu_pll*_disable() has already gated the
PLL before the newly added ccu_pll*_enable() can run:

> @@ -148,7 +148,7 @@ static int ccu_pll_init(struct clk_hw *hw)
> 	ccu_pll_disable(hw);
> 	ccu_pll_update_param(pll, &pll->config.rate_tbl[0]);
>
> -	return 0;
> +	return ccu_pll_enable(hw);
>  }

> [...]
>
> @@ -252,7 +252,7 @@ static int ccu_plla_init(struct clk_hw *hw)
> 	ccu_plla_disable(hw);
> 	ccu_plla_update_param(pll, &pll->config.rate_tbl[0]);
>
> -	return 0;
> +	return ccu_plla_enable(hw);
>  }

Re-enabling the PLL afterwards therefore does not make reprogramming
safe for a live consumer. I will drop this patch, "[PATCH 1/2]
clk: spacemit: re-enable PLLs after init", from v2.

To avoid delaying the 1.8 GHz rate-table update while this broader issue
is investigated, I will resend the current "[PATCH 2/2] clk: spacemit:
k3: add 1.8 GHz PLL5 and PLL8 rates" as a standalone patch. It only adds
the firmware-selected 1.8 GHz settings to the rate tables.

The existing problem of reprogramming an unmatched PLL from
ccu_pll*_init() needs a broader solution and is independent of the rate
table update. I will address this issue in a separate patch series.

                                            - Troy

--5c2444142807e9cfb537af5f4976382a35e3a9d6e77c043f51e0fe45cff4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCanmO2g0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvCy8A/3AS+h5VxUd4a+hzLwgWTitmdjKz5AQxKY9ffa9g
0PEaAP46TDFaDGtlJxZlgxExHbHVjyTZ7P44F33VqpOtqO4bBw==
=9C3d
-----END PGP SIGNATURE-----

--5c2444142807e9cfb537af5f4976382a35e3a9d6e77c043f51e0fe45cff4--
