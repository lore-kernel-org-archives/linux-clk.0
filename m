Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB933EFFD2;
	Sun, 27 Sep 2026 13:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790516524; cv=none; b=ZnWRW9zNo2WImMtnIz/xQvKKAB/noehSmJdZj6anFEz1g8gVbhnz4MaYgPaNi2A8nF4D9bvDOJvGoiT2apIUjv73mGlwBJqePdTMG9zhMd+WkJ+YdD3vjzXOnHMHjlW7OyxLu6eUGKLbk78KzWXU2p9eHjrC6doI7D7wcjKzlPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790516524; c=relaxed/simple;
	bh=3RbF8J5GHiFDe0m5GrWK9CBeQJSNR45o2Xvk8o/Qqoc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tpS1G343vhNX4CnY+c1mYZ3PxMdXP70QecgPoTAEcyto1ps5A9AyHE0BZTgxdEocnsJWy2GCrv2tN5OiV8LaG1i1uWQcPgpSWDqSYrMx0WSPN2Q0zHpMyIAPWfhR/h0Um/MfiiQbod1fI9QRnMFDlvWXh6ejoNTW0BI2WrfnFvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k3e64YcE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k3e64YcE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB2F1F000FF;
	Sun, 27 Sep 2026 13:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790516520;
	bh=bn1g1HC2TrgcTr9oAKVof6dffRQLIiZSLmHAksdhAfU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k3e64YcEIhrlTIXmaexRXKF6josnB9V56epdj8ChsJpyxwCkYRJZsifTzIcEAEAsF
	 cbbZmZuSLFkvMU+CXKnDEXNHNzZ0pviSdRRzY4ZmmB2KmvxUsdXRRj5ND4Zxz55/bn
	 BaTElc4FxYWs3X9BvRT1XmWsWQQ90s+yEKLrrZ9fQXcb0M65xPivwqTeh40biMBg0o
	 GtOz0AOgPD8x49lgfktvxRpzkIc62qIY1te6lVU9+oJhdr0cydrZddOmTe1j25kckc
	 C85Sh0r9Aur2BlD5TQzd1cs85DXwK1K5GqVqdPl79r1hBu5l5n3AkTkfpjbbuRzOz7
	 KHMGGocnHN5lw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] clk: Add gpio-locked clock driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vyacheslav Yurkov" <V.Yurkov.EXT@bruker.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-clk@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260927-feature-clock-guard-v6-2-007983b13ec2@bruker.com>
References: <20260927-feature-clock-guard-v6-0-007983b13ec2@bruker.com>
 <20260927-feature-clock-guard-v6-2-007983b13ec2@bruker.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 13:42:00 +0000
Message-Id: <20260927134200.9DB2F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: gpio: locked-clock prepare callback violates API and inverts =
success
--

commit 6568d5231c6cc47d178121c89d700cd8a3a8cf08
Author: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>

clk: Add gpio-locked clock driver

This commit introduces a gpio-locked clock driver where the clock's status
is determined by a GPIO signal. It is intended for FPGA-assisted clocking
designs where consumers can wait until the input clock is locked before
initializing dependent peripherals.

> diff --git a/drivers/clk/clk-gpio.c b/drivers/clk/clk-gpio.c
> index 9099c57e27156..a264ba21baf26 100644
> --- a/drivers/clk/clk-gpio.c
> +++ b/drivers/clk/clk-gpio.c

[ ... ]

> @@ -138,6 +138,19 @@ static const struct clk_ops clk_gpio_mux_ops =3D {
>  	.determine_rate =3D __clk_mux_determine_rate,
>  };
> =20
> +/* We can't prepare the clock, but the Common Clock Framework calls only
> + * prepare() not is_prepared(), therefore we fallback on the actuall GPI=
O value.
> + */
> +static int clk_gpio_locked_prepare(struct clk_hw *hw)
> +{
> +	return clk_sleeping_gpio_gate_is_prepared(hw);
> +}

[Severity: High]
Does this callback violate the Common Clock Framework prepare semantics?

The Common Clock Framework expects the prepare callback to return 0 on
success and a negative error code on failure. However,
clk_sleeping_gpio_gate_is_prepared() returns the instantaneous boolean GPIO
state.

If the clock is successfully locked, this returns 1, which the framework
interprets as an error, aborting the preparation. If it is unlocked, it
returns 0, which the framework interprets as a success.

Additionally, the commit message states consumers can wait until the clock =
is
locked, but this implementation returns the state immediately without block=
ing
or polling for the lock. Will this cause dependent peripherals to initialize
prematurely or fail to initialize at all?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927-feature-cl=
ock-guard-v6-0-007983b13ec2@bruker.com?part=3D2
