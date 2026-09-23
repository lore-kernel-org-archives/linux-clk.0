Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8BC530DFF;
	Wed, 23 Sep 2026 18:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790188856; cv=none; b=l4mvDeU92BgZ8pAVMEui6eFjuJdahxk4vdX5MSBa0XLC342/JpaD4FcTrym/Q4N+PRfVx6seA0E//Zx8HQqmBgkAVye+Vdpm9pdf5LkBg6gmLTL0yergXYZ1Dx4gI5aw+xCMItnSGAdB0XiVVUFei8NYj6QpxJiO1+0ymkj8VaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790188856; c=relaxed/simple;
	bh=fufgafUjt5ss16o0es0hiwBt60ZX7JQfj3DkvX16e0M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t4CWFzNtyKFIzSwTsU6smL4z4Af14iy+7/G6Vy+fEG47ugYSQuBaKinqRWt8YHus5aPVYwsB41JMtSrGaTL/Ewbl9fag19BJA+fyb51FIc1l4smemroEfOjwsDNNsr1i7iGm2bVxXTPtqxqnalFqcMFpP2Np0RGotU65U939TwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PTxzIYJw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PTxzIYJw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BA291F0089E;
	Wed, 23 Sep 2026 18:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790188851;
	bh=S/W2Po2BbF5aq98WhvE/IfdysqS3aPARdILD9rgtljQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PTxzIYJw9OCK0Dbv1BWI/GJin4ZmTvnbH+9ja8Y0VBEW22iMifb5qzEEo0VI4Eqmv
	 nhbQ06WCWtnoOnwm93dYH44E5AGzTGq7CLgIUvy0am1tpnHhUoZhHhPz+g0aG9Cixd
	 IPKHPZWErBK3nzrPR+vOg8KnzqLiBXiBbnW6Avz2O/P1rItyD7KtX2DJpkBRhW03J+
	 s+uOn1HHXjc27M776anNxxZ8Cp3ywXdK9otBwJOiZoy5ZLaAWbDb2xK4eOxx/YX0j6
	 glIBwBXDmnfjpGE69Zwez+6TH2KQRsCBbVVcUApcN/m9lFv+Fad2Z6qy3CdHOL+WqP
	 G+CsMSblha3MQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 09/12] clk: zte: Introduce a driver for zx297520v3
 matrix clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: lee@kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, linux-clk@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, olteanv@gmail.com
In-Reply-To: <20260923-zx29clk-v12-9-9c243796b6d2@gmail.com>
References: <20260923-zx29clk-v12-0-9c243796b6d2@gmail.com>
 <20260923-zx29clk-v12-9-9c243796b6d2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 18:40:50 +0000
Message-Id: <20260923184051.0BA291F0089E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] clk: zte: missing DT export for ZX297520V3_RFFE_WCLK
--

commit 4d2c5025ee60ae5cdf0e636caff70b2cdc8a3e60
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

clk: zte: Introduce a driver for zx297520v3 matrix clocks

This clock controller controls high speed devices: CPU, DMA, RAM, SDIO,
Ethernet. The only non-clock, non-reset registers I have spotted here
are hardware spinlocks.

> diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297=
520v3.c
> index 68bfeab84d745..92b56571b1556 100644
> --- a/drivers/clk/zte/clk-zx297520v3.c
> +++ b/drivers/clk/zte/clk-zx297520v3.c

[ ... ]

> +static const unsigned int zx297520v3_matrix_exports[] =3D {
> +	[ZX297520V3_SYS_TIMER_WCLK] =3D		ZX_CLK_SYS_TIMER_WCLK,
> +	[ZX297520V3_CPU_WCLK] =3D			ZX_CLK_CPU_WCLK,

[ ... ]

> +	[ZX297520V3_PDCFG_WCLK] =3D		ZX_CLK_PDCFG_WCLK,
> +	[ZX297520V3_PDCFG_PCLK] =3D		ZX_CLK_PDCFG_PCLK,
> +	[ZX297520V3_SSC_WCLK] =3D			ZX_CLK_SSC_WCLK,
> +	[ZX297520V3_SSC_PCLK] =3D			ZX_CLK_SSC_PCLK,

[Severity: Medium]
Is the mapping for ZX297520V3_RFFE_WCLK intentionally missing from
zx297520v3_matrix_exports?

Because this mapping is omitted, any device querying for the RFFE work clock
via the device tree will be silently mapped to index 0. This index correspo=
nds
to the ZX_CLK_MATRIX_OSC26M_D4 clock rather than the intended rffe-wclk.

Could this incorrect mapping break the LTE radio hardware and potentially
disrupt actual consumers of the 6.5 MHz matrix-osc26m-d4 clock when a driver
probes and operates on the hardware block?

> +	[ZX297520V3_AXI_WCLK] =3D			ZX_CLK_AXI_WCLK,
> +	[ZX297520V3_GMAC_WCLK] =3D		ZX_CLK_GMAC_WCLK,
> +	[ZX297520V3_GMAC_PCLK] =3D		ZX_CLK_GMAC_PCLK,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-zx29clk-v1=
2-0-9c243796b6d2@gmail.com?part=3D9
