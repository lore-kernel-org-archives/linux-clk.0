Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795493035;
	b=S4r4ED1nCcFDf6PWlVa8ACobM00t3qPIBJ1bwHGumBLT8zX2mGaeD2kfyPeWmkWOnIKF
	 jD7nCZ9tubk8//m1HvojEr49MPCyxX2fzq9AAe+XcYM4ORp528vf1S6+3f1B0d8uODp9r
	 qEr2YwwakqwhWxgsDGwQ1+gvBR4duniY/GupCe3mVplZs+I4TFUf4qw8LO4ApQD6bBV6y
	 wFkKXkb0pAqwCbcz+pMoj6lKbJDJw79Rey9SPyF+eaT7QNDLRiiXT/6oilgYQMjW0Avy7
	 altFsivZx6lE9tzYTjk++dofu7Lco7C4+Gx3n5ErgZATofqPRL04ImhVmWzwJh+1D0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795493035;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PT+ZEg/+iwCSWPz8v+jCmHqnkyC/Y0GywwY0Sd2hm1g=;
	b=kwn5pIXW184Pj1T2lDEzTjBrKNBbjuZCfA3/RVnCCtC1XF136jSFNMl5ORV7inG9nlXn
	 HAvPH67eGCsnuL/F/1KFEIx9PnDfqi8xujCMOscHMMuLJYKAqRsO8Gzyj0UOcUBpZ0fpt
	 w5sOLyLu62UzpoXGW4AvUsQyPvXD+6N8n4TUbdKHHPhyx914LKBCSBL3BRfmtxDuGmXja
	 UdN0SD9XFEchiR7koPhaiUudJXNrcDf1J+ccPKto5l5VE5BzH7k6rgt4hHtYsNIBMGEQe
	 91YVIJImDKrzj+h+JTtYP8DfqnWA2e6DqQKrhjw1lObm+VQDG0qB6SMw/sgPc0TGthQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DpqBrKxG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89587606A31E;
	Tue, 24 Nov 2026 04:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DpqBrKxG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B051F000C6;
	Tue, 24 Nov 2026 04:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795493035;
	bh=PT+ZEg/+iwCSWPz8v+jCmHqnkyC/Y0GywwY0Sd2hm1g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DpqBrKxGIppXePF/ZxLpPaYj21Nap0TdhCb4IeGkYGl+2HSOD37s3SzkfeTOPJvxq
	 P71w7m3pRNOFHoWjTpn5fV1jWxh4EIBefHrCbZq3vUROHSYyxrXUUCyi6dx+Trco67
	 2JEZrOcZK/rRHFO0gE1NzP7MJv+Muqlh7wgVsLYk0k060GkSYhpUdPZaffnat1UQDn
	 dMWctxFYvut71Ng3rd2aixwsFhX6GSVwWZMZWK1GWxhexzobQ86XrJo7ISeDeEZszZ
	 1nn7cp8x0e9O9EVFQxUOnbICBjwPqvOigZgM5s18A0wkx9W+bXdenU1iG//UEsKgJV
	 MQmTxt1HoY7wQ==
Message-ID: <sashiko-outbox-230492@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/8] clk: clocking-wizard: Use dev_err_probe() when
 mapping registers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shubhrajyoti Datta" <shubhrajyoti.datta@amd.com>, linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124035613.1968260-7-shubhrajyoti.datta@amd.com>
References: <20261124035613.1968260-1-shubhrajyoti.datta@amd.com>
 <20261124035613.1968260-7-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 04:03:54 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] clk: clocking-wizard: redundant dev_err_probe() in
  clk_wzrd_probe()
--

commit 9f920055133db8d3ece4b65c488f3b559414daaf
Author: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

clk: clocking-wizard: Use dev_err_probe() when mapping registers

This commit wraps the error return from devm_platform_ioremap_resource()
in clk_wzrd_probe() with dev_err_probe().

> diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xil=
inx/clk-xlnx-clock-wizard.c
> index a3f4c5d6495e5..7fe8d0d4cfba2 100644
> --- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> +++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> @@ -1414,7 +1414,8 @@ static int clk_wzrd_probe(struct platform_device *p=
dev)
> =20
>  		clk_wzrd->base =3D devm_platform_ioremap_resource(pdev, 0);
>  		if (IS_ERR(clk_wzrd->base))
> -			return PTR_ERR(clk_wzrd->base);
> +			return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->base),
> +					     "failed to map registers\n");

[Severity: Low]
Does this emit a duplicate error message when mapping the resource fails?
devm_platform_ioremap_resource() calls __devm_ioremap_resource(), which
already logs an error via dev_err_probe() on every failure path and never
returns -EPROBE_DEFER.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124035613.1968=
260-1-shubhrajyoti.datta@amd.com?part=3D6
