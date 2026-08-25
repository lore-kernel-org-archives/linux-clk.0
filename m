Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACD236308A;
	Tue, 25 Aug 2026 05:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787635333; cv=none; b=TxwmhV3n00cMYdk1Z87n5PguqzTMRlrWI8S3LsDhHYc7BiVNnBRdr+x+TPilZqkvMDfnIyFx1l7Mu9hQRPvEDk1N0AwPHIZAQ6cxZ1l+uFMRkKnn7eqacCVPnhR7FBG5Bdm/BqdnpZ4sgO2O6pj3fSgDmkItjfwH5W8wc1VA1cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787635333; c=relaxed/simple;
	bh=sUUiYh0j3M8iXfz41iXTg1LoNqEoq05LaGM8ZNw9Bsk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=arLuSSwACI+OU/GZ2U74ERUF1x04E8bB+bu3648wwWEiNJLnR92frQ1wncVOgyqFa0loFerzc2eP0vWErL7BusKYRwnAczfi+05eYpettomLxiHsbnOKlmczamW1f/HId0mw+tH+E8F4ubgZdjpfHesxAE4YgGEIjNtGt/+1Imc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fTr48+Ty; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fTr48+Ty"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 775701F000E9;
	Tue, 25 Aug 2026 05:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787635331;
	bh=sUUiYh0j3M8iXfz41iXTg1LoNqEoq05LaGM8ZNw9Bsk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fTr48+TyspsGdfZUAvphGn4YEOsPdFZs0aize1QPoVVdRU8eEzgjsDuq0DIBSkbSl
	 s3CqieS1axirdbgrpNQZdYt521acym7g+JI+57Z0MCn9FMbwinNbWjfZXlE0xLikpk
	 CeoZ1c8eOYdsRGTu1vYW0hbf6oBmTbOQFkVAXQKRREY66b3N039hh3qqygBY4Nwsi6
	 75mBZdJ6Ftp/GqQT7PfDQCiRZfozkD1LEwb98WMN72w2zd+OZaqnisQ/xYngQG1eZp
	 p2kMoOAkU1IR0j4QrCvFEEczkuqT7Dq1zZZ5eRYplyHboPBef/eyW8iMSt9daXJ+vW
	 iekgrXZsDC27A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] clk: rk808: Select the clock function of
 CLK32KOUT2 on the RK818
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rudraksha Gupta" <guptarud@gmail.com>
Cc: linux-clk@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260824-ppp_connectivity-v2-2-a4b0e11cd62c@gmail.com>
References: <20260824-ppp_connectivity-v2-0-a4b0e11cd62c@gmail.com>
 <20260824-ppp_connectivity-v2-2-a4b0e11cd62c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 05:22:11 +0000
Message-Id: <20260825052211.775701F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> From: Martijn Braam <martijn@brixit.nl>
>=20
> On the RK818 the CLK32KOUT2 pin is shared between the 32.768 kHz clock
> output and a recovery function, selected by bit 1 of RK808_CLK32OUT_REG.
> CLK32KOUT2_EN only takes effect on the clock function, so the output can
> be enabled and still be silent. The datasheet resets the register to
> zero, but that cannot be relied on: on the Pine64 PinePhone Pro it reads
> 0x03 once Linux is up, leaving the wifi and bluetooth without their
> 32.768 kHz reference.
>=20
> Select the clock function when the output is prepared, so that it can
> also be given back, and report the output as prepared only when it is
> enabled and on the clock function. The bit is not defined on the other
> variants, so give the RK818 its own clk_ops. Boards that never take the
> clock are unaffected.
>=20
> Based on an out-of-tree patch by Martijn Braam & Kamil Trzci=C5=84ski,
> carried by Ondrej Jirman.
>=20
> Signed-off-by: Martijn Braam <martijn@brixit.nl>
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-ppp_connec=
tivity-v2-0-a4b0e11cd62c@gmail.com?part=3D2

