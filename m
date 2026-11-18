Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795004011;
	b=DmiEbAHA/PtrhKdyLhoagcx/CpuylmdSb0Zl4Y4Y0IBClnLbG90q3Rh3XPPjz0bgH9O2
	 HSc1It0F900M4gC/PwOYCzZO+xAEdT3zKblbSGxaZ1uLsb2McIDHdyV9e1h80ioFUubVw
	 1D8lsC+QrHzW7/251dS8Ocm2VoOTSgQhZ6Q4Qq5OxVVTwgVo2+QljxYq7KD6FuGBdQM0z
	 5J/2E+xoDHueZPyf6My59WGdvXTfG+OdMdPS5PLARW7sXt1lXSlesTOF9ysKGqSaMQlY3
	 AUm7mcZZhlhpP7/Nq197h7UIQmHD0Ma64+cE0NtGYtROAcvN15uqE+hif2biIMpW27w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795004011;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pxNUBWRugLDkEW4rmfaOqzWmmS0sIA3SCY81TjkJbLw=;
	b=sJaOPV7B5k6bSgxb2aA9iTWK3N+4Et0ZijSrXYu6+oHTB4oQIw69Tt6xOzCVgVlcujTQ
	 QO77LP6ajBHEiZMLx4aN3tdizHb/j3tOkeAvZ0r2C0+/r0EpAkSJ7Zj/FZ10bU0Zypf/q
	 S3R5nLCwSTGcLYgaPVIMchvPvqKPPeSzk8Z+Cgsd8KTiplmpn/ctgDpdi3IUdQu84mMn8
	 +t6TFcdVpDstR7a6ZUcgC8opPiY3foOssZrv6D8ovHIaaFEmIGqjMJxuxqGDZr37KW0e/
	 JXkwpaK9hehTuU/UnbhjAax55y5QnwBn+V8Tnu7CB93s72YfswCGZBQaJc+hXx6DioQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZHuWV22o;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A681606A333;
	Wed, 18 Nov 2026 12:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZHuWV22o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A461F000C5;
	Wed, 18 Nov 2026 12:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795004011;
	bh=pxNUBWRugLDkEW4rmfaOqzWmmS0sIA3SCY81TjkJbLw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZHuWV22ol0Z+GP3dzMX7fdJQ3wwtddcGl27YsBMEGh+C6cdVAIx/bAhZzoUdlzIwq
	 o0e2iiGGE5dx7iebZGosfDd454ukjyM73nTsJn6bddzJkUC3Jro0bzjIGrwhpvcBK4
	 QXDW51B9B03vQed8usBvmQx2yvKUcWgb0+EEOHNIa5/yzVdic9aLQ2L/5CzxzMIpet
	 /5/srG/RKjBbBOeyMi61AqoZUOeX/R2LsrFkbOiNLQqpo0iruauakWlPyJwZuQ9B2k
	 hSWubQ8Bk2OLKSrZMUgs3sXWtDrFVVtrd/HBcSkGuvtAzC6KM1TEzLJnC8gV1cp7T4
	 s3iLwcaK1NCNQ==
Message-ID: <sashiko-outbox-220889@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/6] soc: st: stm32mp2-syscfg: register the clock
 device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gabriel Fernandez" <gabriel.fernandez@foss.st.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118-ups_mp25_clk_syscfg-v3-4-935de791a4ce@foss.st.com>
References: <20261118-ups_mp25_clk_syscfg-v3-0-935de791a4ce@foss.st.com>
 <20261118-ups_mp25_clk_syscfg-v3-4-935de791a4ce@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 12:13:30 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] soc: st: stm32mp2-syscfg: missing Signed-off-by trailer for
  patch handler
- [Medium] soc: st: stm32mp2-syscfg: dangling syscon regmap on
  stm32mp2_syscfg_probe() error
--

commit 21aab13c70f2bda74a29260c2c7a004a36470fe5
Author: Dario Binacchi <dario.binacchi@amarulasolutions.com>

> soc: st: stm32mp2-syscfg: register the clock device
>
> The STM32MP23x and STM32MP25x SYSCFG provides the LTDC pixel clock mux,
> whose driver is an auxiliary driver since the SYSCFG node is bound to
> this driver.
>
> Create the auxiliary device for the clock driver.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> [gabriel.fernandez@foss.st.com: create the device on STM32MP23x too]

[Severity: High]
Since Gabriel Fernandez modified and handled this patch in the delivery
path, a Signed-off-by trailer from Gabriel Fernandez is required after
the modification note to satisfy the Developer's Certificate of Origin
chain.

> diff --git a/drivers/soc/st/stm32mp2-syscfg.c b/drivers/soc/st/stm32mp2-s=
yscfg.c
> index 0d45fdef46b73..285561fb9f17a 100644
> --- a/drivers/soc/st/stm32mp2-syscfg.c
> +++ b/drivers/soc/st/stm32mp2-syscfg.c
[ ... ]
> @@ -51,7 +52,15 @@ static int stm32mp2_syscfg_probe(struct platform_devic=
e *pdev)
>  	else if (ret)
>  		return dev_err_probe(dev, ret, "failed to register the regmap\n");
> =20
> -	return devm_of_platform_populate(dev);
> +	ret =3D devm_of_platform_populate(dev);
> +	if (ret)
> +		return ret;
> +
> +	if (!devm_auxiliary_device_create(dev, "clk", NULL))
> +		return dev_err_probe(dev, -ENODEV,
> +				     "failed to register the clock device\n");
> +
> +	return 0;
>  }

[Severity: Medium]
Can a failure in devm_of_platform_populate() or
devm_auxiliary_device_create() leave a dangling regmap pointer in the
global syscon_list?

stm32mp2_syscfg_probe() allocates regmap with devm_regmap_init_mmio() and
publishes it to syscon_list via of_syscon_register_regmap(), which has no
unregistration helper.  If either of the later calls fails, devres
releases regmap and unmaps base while syscon_list retains the pointer,
causing a use-after-free on subsequent syscon regmap lookups.  Calling
of_syscon_register_regmap() last in stm32mp2_syscfg_probe() would avoid
publishing the regmap before fallible setup completes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-ups_mp25_c=
lk_syscfg-v3-0-935de791a4ce@foss.st.com?part=3D4
