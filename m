Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3882113632B;
	Tue, 28 Jan 2025 20:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738095931; cv=none; b=CEpJgBLF/4O05SeY0orMM4xEitz+42R5m2OdkgYNQoV366OCfdfKkvivN9kwcdTWia1I+N85lWX9T40rojiwZyKnLVj8/Jga0t97r6hxEB00GlYTaUNcNZxbT39yBQ+N8z9HOOjF9acZ9wHY/7mKCgkEOqSbPHsJFS05/oKA3Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738095931; c=relaxed/simple;
	bh=vsE8IFVrzUvktukSA+TorUfPU/BVdbA/l2O5s9pg3UQ=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=iqd3mvfXVMnzvCZ2Nbuvfcbb2l6bubKKkVQBTyLG9qNaw6o42swG+fyv9csPIUKTIFMRbxHLdHsadjAHD9QDychVHVplupbLrgdjohO8eB/MLfHMym1OcKi7YDobg2GN9vfUrccfuMipuWjohGSQNOgA/zDeCmi3hi8ZGsf0dY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WfeGp7x7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WfeGp7x7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD4BC4CED3;
	Tue, 28 Jan 2025 20:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738095930;
	bh=vsE8IFVrzUvktukSA+TorUfPU/BVdbA/l2O5s9pg3UQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=WfeGp7x7LRpK0MQbXzwGZNO+zX9Z2ydtAlj60oBAqLR6E6fHVLnmXpMKevOBWJ9cq
	 UnPvWNvMo/e+cu/PWf9rYx+UhMQFWknRd43z0stLEqYt9sxT1idroeB9f2wJp25dai
	 CHOWfedXslPW+L70bOJDBV5r9afQNlDBvFwXuMFAJyKzfOH7YzAUPAP271XJiDC8gb
	 4RTPupnAsqpxoerFDjlPA1B+WULohj4NS0NB7AdCHt2MJBV97AsP6DgcluJEEQg6qw
	 b5rO++8Y/bzk9BqbpgJEIF2TF/r8+CV6y65dJKvlw0cmLItjYAN3oXb+QvsVxw471A
	 KS47V0T+5GAkA==
Message-ID: <ff801714249c492abc3781da55675a38.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250124-clk-ssc-v1-1-2d39f6baf2af@nxp.com>
References: <20250124-clk-ssc-v1-0-2d39f6baf2af@nxp.com> <20250124-clk-ssc-v1-1-2d39f6baf2af@nxp.com>
Subject: Re: [PATCH 1/3] clk: Introduce clk_set_spread_spectrum
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>, Michael Turquette <mturquette@baylibre.com>, Peng Fan (OSS) <peng.fan@oss.nxp.com>, Russell King <linux@armlinux.org.uk>, Sudeep Holla <sudeep.holla@arm.com>
Date: Tue, 28 Jan 2025 12:25:28 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Peng Fan (OSS) (2025-01-24 06:25:17)
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index cf7720b9172ff223d86227aad144e15375ddfd86..a4fe4a60f839244b736e3c275=
1eeb38dc4577b1f 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2790,6 +2790,45 @@ int clk_set_max_rate(struct clk *clk, unsigned lon=
g rate)
>  }
>  EXPORT_SYMBOL_GPL(clk_set_max_rate);
> =20
> +int clk_set_spread_spectrum(struct clk *clk, unsigned int modfreq,
> +                           unsigned int spreadpercent, unsigned int meth=
od,
> +                           bool enable)
> +{
> +       struct clk_spread_spectrum clk_ss;
> +       struct clk_core *core;
> +       int ret =3D 0;

The assignment looks unnecessary.

> +
> +       if (!clk || !clk->core)

How do you not have clk->core?

> +               return 0;
> +
> +       clk_ss.modfreq =3D modfreq;
> +       clk_ss.spreadpercent =3D spreadpercent;
> +       clk_ss.method =3D method;
> +       clk_ss.enable =3D enable;
> +
> +       clk_prepare_lock();
> +
> +       core =3D clk->core;

Why do we need to get the core under the lock?

> +
> +       if (core->prepare_count) {

Why does prepare count matter?

> +               ret =3D -EBUSY;
> +               goto fail;

We just left without releasing the lock.

> +       }
> +
> +       ret =3D clk_pm_runtime_get(core);
> +       if (ret)
> +               goto fail;

We just left without releasing the lock.

> +
> +       if (core->ops->set_spread_spectrum)
> +               ret =3D core->ops->set_spread_spectrum(core->hw, &clk_ss);
> +
> +       clk_pm_runtime_put(core);
> +       clk_prepare_unlock();
> +fail:
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(clk_set_spread_spectrum);
> +
> diff --git a/include/linux/clk.h b/include/linux/clk.h
> index b607482ca77e987b9344c38f25ebb5c8d35c1d39..49a7f7eb8b03233e11cd3b927=
68896c4e45c4e7c 100644
> --- a/include/linux/clk.h
> +++ b/include/linux/clk.h
> @@ -858,6 +858,21 @@ int clk_set_rate(struct clk *clk, unsigned long rate=
);
>   */
>  int clk_set_rate_exclusive(struct clk *clk, unsigned long rate);
> =20
> +/**
> + * clk_set_spread_spectrum - set the spread spectrum for a clock
> + * @clk: clock source
> + * @modfreq: modulation freq
> + * @spreadpercent: modulation percentage
> + * @method: down spread, up spread, center spread or else

Did we get cut off?

> + * @enable: enable or disable

Isn't 'disable' equal to spread_percent of zero?

> + *
> + * Configure the spread spectrum parameters for a clock.
> + *
> + * Returns success (0) or negative errno.
> + */
> +int clk_set_spread_spectrum(struct clk *clk, unsigned int modfreq,

Does this need to be a consumer API at all? Usually SSC is figured out
when making a board and you have to pass some certification testing
because some harmonics are interfering. Is the DT property sufficient
for now and then we can do it when the driver probes in the framework?

> +                           unsigned int spreadpercent, unsigned int meth=
od,

I'd assume 'method' would be some sort of enum?

> +                           bool enable);
>  /**
>   * clk_has_parent - check if a clock is a possible parent for another
>   * @clk: clock source
