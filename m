Received: from mout.perfora.net (mout.perfora.net [74.208.4.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED5320DD72;
	Mon,  5 Jan 2026 22:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.208.4.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767651376; cv=none; b=PiVoRvrraqPyXWJfsJaCCfV8RdWJvhGsYDkoiUR2ytOP1X6MC6PaH9J79RGoxn2niT2did/PLSHpu7DSJpwTIN2dQ3RCRMTLBS1YgDaFpfj6eLjOQBgcxfPXjodnbd0ebE+FlwiPjfDU3S22ttqWQiXHx1gcIZ8SOnBRMh3enfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767651376; c=relaxed/simple;
	bh=8e2dZgeyhJlSkCTzL1IOjiKmTNcjngu01WsSxCQbR10=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MqYhr64VCKNPJ5IPt+KFbeQyymztFD0tuYIHp1F7895SUyLzCLNqLx1tSi1z4dG7HSKuTtr59Ye5jdAVv3Z2gjaZt5afbtIGX35VFlquX0TMdvZhQpl0Ow5HY6Fe/hKkMKeQE/l62gRqIRyhBcNzLMH3mgN0bIQngE7FGO0VIqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziswiler.com; spf=pass smtp.mailfrom=ziswiler.com; dkim=pass (2048-bit key) header.d=ziswiler.com header.i=marcel@ziswiler.com header.b=2z/aTDhH; arc=none smtp.client-ip=74.208.4.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziswiler.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziswiler.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziswiler.com header.i=marcel@ziswiler.com header.b="2z/aTDhH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziswiler.com;
	s=s1-ionos; t=1767651337; x=1768256137; i=marcel@ziswiler.com;
	bh=Y6HJq4OhR0K8CkEt79OYGigmyf/NkQlnBfoQsVERq6c=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=2z/aTDhHrB0X0/fYaSsDmHDINo8EABmBj+xXRDWIizKlBKqLmbQQqnAZEw8rq4TU
	 qC2IsYVIYX+IWHXHlXOtltr0HkbmgZwXseU5eqOhumQsuMo3PNN+WvprNWHB0RRzG
	 SQxRjuiFd96fi8iprBZy9Ypp7DY2jB9/0cOJA+lGsQlEb36W++H0kx8mDSMkB4k2T
	 0UhZ238koYktLPcSgws8r8uW3lYZpiFO9sP/m8/Py/OkpbW9y7WVs/En9gl1RSVii
	 GJY9joPHQEd8MynHf/ofJ2njqaXOKp/9QBy6CNDzW+6wULvtNlaNpK+YYay8hfF9k
	 +vJn3vibCFmDhaZniA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [10.13.73.253] ([213.55.223.158]) by mrelay.perfora.net
 (mreueus002 [74.208.5.2]) with ESMTPSA (Nemesis) id 0MQgyx-1vR5iH12pJ-00K0zY;
 Mon, 05 Jan 2026 23:15:36 +0100
Message-ID: <819b2f6e5db5411b3ea923bca70482617464594c.camel@ziswiler.com>
Subject: Re: Re: [PATCH v9 2/3] clock: eswin: Add eic7700 clock driver
From: Marcel Ziswiler <marcel@ziswiler.com>
To: Xuyang Dong <dongxuyang@eswincomputing.com>, mturquette@baylibre.com, 
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, troy.mitchell@linux.dev, bmasney@redhat.com
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com, 
	huangyifeng@eswincomputing.com, pinkesh.vaghela@einfochips.com, 
	ganboing@gmail.com
Date: Mon, 05 Jan 2026 23:15:29 +0100
In-Reply-To: <480d671d.1db1.19b8707eb98.Coremail.dongxuyang@eswincomputing.com>
References: <20251229105844.1089-1-dongxuyang@eswincomputing.com>
	 <20251229105949.1202-1-dongxuyang@eswincomputing.com>
	 <a7f4cf00b396096512d6947612031207c4d4459b.camel@ziswiler.com>
	 <480d671d.1db1.19b8707eb98.Coremail.dongxuyang@eswincomputing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:/nB+dkILdDoZDzC9GCjB3kbknd63+3kWkUoF4DEeqF9TQrt+RP+
 3It2QgjW0hPs1HN0A9zU6vvVI8AKgWKEQId4iwwnZwX+rFGVUg+PPUSbw3ut+cD2a2EtMDl
 c3nwyWl/ByYLOb+dcIVG+aygRLBDCEm3L4DhQhrd22FQ1Zhua15ClrbU6mRooGpwQsxmy2y
 lxuA+0kXl30zZvEXkNFIw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zCdJ8JVYXbM=;yohgFPbjlABC+ZJhh//NVoJg9qA
 klY98Einnj0+/so1FJ95GDJSZ2eg1sW0ibF6p4bxrdq7CSN15EZfjKow2Mo5UIU8C2B8wlmX9
 M/1ZBXqR6PiTDpVNmOfjDLzxyx5fraeaSKIGeYW3Y8ogy1XveovpPAKqTR+cjtsfEjpKnERo0
 ANIMWXS2anoxd7wfH0xfrMDDt+/9jbLBPRE0j3Fa1dXc6oCu0sSdVJqKL0+jMD2FBgKfMY2tn
 4MFCVNXhx6i6bAaIK3q225lITHUA4/yXLakdP6ni+MBVgauKkM3ry+ukpPqLmuSCINtK9CbDj
 Mz1+UdVOjgNYfF1448EjBM4f3YYrjvEPse7z9M8w1BCWspbWd9y8CrNgK9gUGfP0La85uvvFa
 PP2fvuClC26wuHBMSYgjjqKKqIuwX+f2UsX3pDhXFrpv554jVJDqqzVUPuKse6mKJM8m27yi9
 NgZ652y2RHemVfZlWZoqG4PknhYjfYCNwJdYC+st3P1ssE42veoS86hwuc1aNnPOoAF1bPf2W
 mAdRGHwZZ13FkEY9UgRjaxS/fUIprNaXZBvkd9AAromgGvYFf5mdK9b+Rdpo4rPi7Udsw/amY
 QXBsNIGmuD4JNRLF5nEA+ZBEIJqAkF3ebOmfkfag7tSSVWiaN1FAigVJW9NZwZG6uhZ4NjSM6
 A/W+6S6EQwKJ4oZSsfp84vdXgiueG/qAUhE1p8Rli/qvsuSpitexy43dHifaO3g5fm3l2AUPA
 Nw9pyYeAObHa+/kjz6WbKgXwARPc2BanOhlbrXhETU8zJPwzs8n1scxww6hZGs9ATg0T7L71y
 L35lHv23i3/kSAz6C2R1a1KZTGLfcfPHwTx2VNzTi0v5aDHSwrLGssTnc73+5/zX600YGFPR2
 8uNm3sU4yU2mMb7n4q1szI0dpfJMl7OiOlH8Wi5tVvLfm8uVgSbl/zxZIm7/4I/3gU6cda0zb
 VuoYANKcgXF/YfwU2ZlRBvH9ed4nxrbkqlM6vvOpzL39S5KOvy4Wmf2ooUvrccUXqBGuNTj/4
 3RaAm6z9Qtb031881wGNyeMTnJyoUyi2fYmtLOBk/xzRfda1R8M4WIHnA9EGSnlviXPxRkUYy
 MKkm+tzSAvBdbIWjQB2VxvB/9LeOeere1+X7kgivdXUUp3lzvx4JSPlDxHdFIanKBH+OHziFQ
 OSjM7cv0xvYM9y5EA5v9OgunuiHQJHmgbXfebgZ7PUzg0f4vJ6bzpnXiA/B/BNnDELHsBaR7Q
 hK72F3woYwd8cYWoABLfAWqr28QMDovlb8ya87Ta44DI6b0QMyIBJkgSDPb0vQJnUb7aV6fpF
 9CXOv6SBsbWiWmWnC+HQ2Wx6odf6GcEZdDfAYqT0eCNpX0mblI0/cXzD9w9mb10zCgwmtsAO8
 oUjVjSqh8EeOliNYl29PrroFJMI8RUKepultkde9lJdhU+Ai9Yq12V9x/We8H7lw66IZb1Idu
 31DhrLHxazYthfOehKI6t2BqJoGCpcO+JFLAnDxhhibXi32x9j2gUofWm51VvNSAf2hjy9Lj9
 QKbXfj/nAapgEfhTMAYNsrSyZThspQJYN1abHqU+FGj9T04v5vE38MPTrhyjeAYjh8RqVBTV9
 QbXMFm7ZpLiIYy1L1k4kyNlLPclkh8KG3R4CzQVKhYAOg167L+f5KJUkD5L1xTZvcfrDdKIcR
 X4D5474X4KF/ij+ssRS0WMRqyMp9oZxM1eaWtbkStAx5TdMsJV4A/Y5ZVa2TM3eNV9Po3gBDO
 2DOEqQAtV97Rl7kdvmLCI7ezdKinEknLqS5xmK/3ywlK4U90ikdvWkQHxQUt3AiGRQkBr3xM6
 87iy

Hi Xuyang Dong

On Sun, 2026-01-04 at 11:23 +0800, Xuyang Dong wrote:
> > > +
> > > +/* divider clocks */
> > > +static struct eswin_divider_clock eic7700_div_clks[] =3D {
> > > +	EIC7700_DIV(EIC7700_CLK_DIV_SYS_CFG_DYNM, "divider_sys_cfg_div_dynm=
",
> > > +		=C2=A0=C2=A0=C2=A0 "fixed_rate_clk_spll0_fout3", 0,
> > > +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_SYSCFG_CTRL, 4, 3,
> > > +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED),
> > > +	EIC7700_DIV(EIC7700_CLK_DIV_NOC_NSP_DYNM, "divider_noc_nsp_div_dynm=
",
> > > +		=C2=A0=C2=A0=C2=A0 "fixed_rate_clk_spll2_fout1", 0,
> > > +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_NOC_CTRL, 0, 3, CLK_DIVIDER_=
ONE_BASED),
> > > +	EIC7700_DIV(EIC7700_CLK_DIV_BOOTSPI_DYNM, "divider_bootspi_div_dynm=
",
> > > +		=C2=A0=C2=A0=C2=A0 "gate_clk_spll0_fout2", 0, EIC7700_REG_OFFSET_B=
OOTSPI_CTRL,
> > > +		=C2=A0=C2=A0=C2=A0 4, 6, CLK_DIVIDER_ONE_BASED),
> > > +	EIC7700_DIV(EIC7700_CLK_DIV_SCPU_CORE_DYNM,
> > > +		=C2=A0=C2=A0=C2=A0 "divider_scpu_core_div_dynm", "fixed_rate_clk_s=
pll0_fout1",
> > > +		=C2=A0=C2=A0=C2=A0 0, EIC7700_REG_OFFSET_SCPU_CORE_CTRL, 4, 4,
> > > +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED),
> > > +	EIC7700_DIV(EIC7700_CLK_DIV_LPCPU_CORE_DYNM,
> > > +		=C2=A0=C2=A0=C2=A0 "divider_lpcpu_core_div_dynm", "fixed_rate_clk_=
spll0_fout1",
> > > +		=C2=A0=C2=A0=C2=A0 0, EIC7700_REG_OFFSET_LPCPU_CORE_CTRL, 4, 4,
> > > +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED),
> >=20
> > During testing on top of next-20251219 I got the following:
> >=20
> > [=C2=A0=C2=A0=C2=A0 0.126102] divider_lpcpu_core_div_dynm: Zero divisor=
 and CLK_DIVIDER_ALLOW_ZERO not set
> > [=C2=A0=C2=A0=C2=A0 0.126194] WARNING: drivers/clk/clk-divider.c:145 at=
 divider_recalc_rate+0x8a/0x9c, CPU#0: swapper/0/1
> >=20
> > Therefore I suggest for above line needing to be:
> >=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED | CLK_DIVIDER=
_ALLOW_ZERO),
>=20
> Hi Marcel,
>=20
> Thank you! This is indeed a bug and will be fixed in the next version.=C2=
=A0
> Could you please share the detailed testing methods with me so that I=C2=
=A0
> can reproduce this issue on my side?

Sure, this was first tested on top of next-20251219, then I re-based it on =
top of next-20260105 and finally I
ported it to v6.19-rc4 as part of the yocto project integration for the esw=
in-ebc77-mainline machine [1].

I will further refine this for one of my talks at FOSDEM'26 [2].

Let me know if you have any further questions.

Thanks!

[1] https://github.com/ziswiler/meta-riscv/tree/add-eswin-ebc77-support
[2] https://fosdem.org/2026/schedule/event/LX3NNU-upstream-embedded-linux-o=
n-risc-v-sbcs

> Best regards,
> Xuyang Dong

Cheers

Marcel
