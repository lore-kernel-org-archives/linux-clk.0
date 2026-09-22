Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C815813CF82;
	Tue, 22 Sep 2026 00:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790036323; cv=none; b=gOodRwLQTMfixd6FdqCSji7eavXPVA8HxnJCNryukVMYlZYAwiFcFhEBfOHNpK0rWMvGj8AwpzJ6hNTG9TC5bDzUukaPFreqKdrs5KpkIsX9AaTZmtxhZXfAA2wzb9Q4q0olOPqlrgSMsHYg307NEhCtLtK8Tr0r9al4N6pIu7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790036323; c=relaxed/simple;
	bh=pvc6/1j9qU8HbwQFNVUgZW0eY8OyUTimPcf1koNEntc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C/qkJebUNwPdGYC1jwDTmtrghevkT7IOt0zBz/Wclr4plz9Sio42JF4hYBOPaocOh37lNxcqpFaOSnt4S1YVPSBLhPuOxR47vmanei30gNVoTw7fJG4SrtrmqkJmkjMuLvPfZ7fDc/taqdSC09ZrSOlYe9d3rhRFYs+cOZXY5dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hzJQcBvv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hzJQcBvv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0899F1F000FF;
	Tue, 22 Sep 2026 00:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790036321;
	bh=5ZHngNieuS9uw/XLBPZt/ACTqGt3k8RJIU+jATF3kmY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hzJQcBvvQ+8H5PJgn+XmMD4jbnPO6uwrYr5sjgmYu6DnmBSpqGN9cdQMAvxE1AjZ7
	 uS6qmdduhQwTSms2NY6JBtMTfGwKv1G8ca7DN7JqIMlGkUuLGZ8kD0J1tUN8wYICE+
	 DVYUZWNVMjaV+akqY6T+v3Fn1GsrJmQZcvi7Kv2oW66mD3Hsz9VwFEWuo5yiS8gfsi
	 DgeGVLx8oBNUriNh2e0XN5ywjNHZkNQt7vNnWlg5qmYr6XyuSRj02p/D4euLPkzBeu
	 BdURAXeScfzon7GpG+QkF8MAFVZ7gtN4itpdnp74XtH+h+p5Bn8y/GcaFTe2hRW22S
	 iq9HkEduyR7fQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 3/5] pwm: sun8i: export the bypass outputs as clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260921-h616-pwm-v8-v9-3-37bec6201ff5@gmail.com>
References: <20260921-h616-pwm-v8-v9-0-37bec6201ff5@gmail.com>
 <20260921-h616-pwm-v8-v9-3-37bec6201ff5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 00:18:40 +0000
Message-Id: <20260922001841.0899F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] clk: missing args_count validation in sun8i_pwm_get_clk_hw() rea=
ds uninitialized memory
--

commit 68e6d29bee94ba15c085b933d17a7299032ead6b
Author: Richard Genoud <richard.genoud@bootlin.com>

pwm: sun8i: export the bypass outputs as clocks

This commit exposes each H616 PWM channel's hardware bypass as a CCF clock
for consumers that need a clock rather than PWM duty control. It arbitrates
ownership between PWM requests and clock prepare, using CLK_IGNORE_UNUSED
to preserve unclaimed bypass outputs.

> diff --git a/drivers/pwm/pwm-sun8i.c b/drivers/pwm/pwm-sun8i.c
> index 7e6c39815c183..fd81c5f5e3267 100644
> --- a/drivers/pwm/pwm-sun8i.c
> +++ b/drivers/pwm/pwm-sun8i.c

[ ... ]

> @@ -1012,6 +1169,17 @@ sun8i_pwm_sanitize_disabled_pairs(struct sun8i_pwm=
_chip *sun8i_chip)
>  	sun8i_pwm_writel(sun8i_chip, per, SUN8I_PWM_PER);
>  }
> =20
> +static struct clk_hw *sun8i_pwm_get_clk_hw(struct of_phandle_args *clksp=
ec,
> +					   void *data)
> +{
> +	struct sun8i_pwm_chip *sun8i_chip =3D data;
> +
> +	if (clkspec->args[0] >=3D SUN8I_PWM_NPWM)

[Severity: Medium]
Is it possible to read uninitialized memory here if the device tree is
incorrectly configured?=20

If a consumer device requests a clock from this provider but specifies zero
clock cells (#clock-cells =3D <0>), of_parse_phandle_with_args() might leave
the args array uninitialized.

Should this code verify clkspec->args_count >=3D 1 before accessing
clkspec->args[0]?

> +		return ERR_PTR(-EINVAL);
> +
> +	return &sun8i_chip->channels[clkspec->args[0]].bypass_hw;
> +}
> +
>  static int sun8i_pwm_probe(struct platform_device *pdev)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-h616-pwm-v=
8-v9-0-37bec6201ff5@gmail.com?part=3D3
