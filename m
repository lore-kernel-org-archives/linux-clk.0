Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C146C44C64E
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 10:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307189; cv=none; b=X8+Ni3Y5xJ2sLqqOKXdSp+KkC2xz3zy90fTWz7SzJosgnW/jp8xrpeLdqiTjANxjILBf9FaS8ixwQxHCYQv4Ve2sHV8yhDVK08V3e2M5Ahy7Hu7QAsZ+89U05fP5jzX24MfhYKna6nOYmGvNcfOw6fDA6/Z5lKR6giMhdlezVzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307189; c=relaxed/simple;
	bh=8pC7PA4lc9s8n7fOCZER3tfFW4s89186AtR+SSkc4pQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NOVwKEjgDpPjNMRhHp963M+rmvlQesoAMn0vt5bcZXX4v+nLO9ah0X7AU8PZDanmLkTH7LrqIypOa1jMYyXQtQN2GouRLEGMF0IxWj1INOlr8JrNjvxUp7Gf5ZiuBar/ke3/0O2HuhkavkxNZWNOSfK2/9tf+7vY5DAMBDkKgDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k0oczg1m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k0oczg1m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 868DE1F000E9;
	Fri, 21 Aug 2026 10:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787307175;
	bh=kOG4ERltZsnXEuBjZMbKKMspab5e/f/d2qnoIl21lyI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k0oczg1mov4RB64ukbh/ifDzH4QUhLEoGm8xLlSuXK1FquYseKOWMPDaf3N1ZUaJT
	 vABYNA9Rspifwtu9p1MGYVw40N/ZeISYjL1RMRLfdbJMP1gpEKgqi8d5dULzf5XGLC
	 yn5m6AwmTirGayigqx10DXMwTilDtnWlVyUGlnX06xCmE0+fu8SXhHKhILElYu/pOR
	 mdRMEnGZambCQmUDMoE7jHbxtPoM9Z5+Zz+1jgbe1jR0Q0pglbTQBwHIsq7xg+LHsq
	 xx8l4tMzSWpXi2AVPsSiyCw6RKwpfJwZswbw23C/csE7lA83PorafSI7oyKFZt4qZG
	 8y97Ylo4SmYVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] i2c: bcm2835: Make sure clk_init_data is fully
 initialized
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <9f82f37e6d6c069cd44326bcd5e5a2a8069a13a9.1787239980.git.geert+renesas@glider.be>
References: <9f82f37e6d6c069cd44326bcd5e5a2a8069a13a9.1787239980.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 10:12:55 +0000
Message-Id: <20260821101255.868DE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but a `clk_lookup` s=
tructure is leaked and leaves a dangling pointer because `clk_hw_register_c=
lkdev()` is used without corresponding cleanup in the driver's unbind path.
--

--- Patch [1]: [PATCH] i2c: bcm2835: Make sure clk_init_data is fully initi=
alized ---
commit 35c539831bc7c233af46e5999f9512b0c93741f6
Author: Geert Uytterhoeven <geert+renesas@glider.be>

i2c: bcm2835: Make sure clk_init_data is fully initialized

This commit fully initializes the clk_init_data structure to avoid subtle
issues caused by uninitialized members. This prevents breakage when
converting drivers to different methods for specifying clock parents.

> diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bc=
m2835.c
> index 09a077b31bfe1..0e52d76cd6baf 100644
> --- a/drivers/i2c/busses/i2c-bcm2835.c
> +++ b/drivers/i2c/busses/i2c-bcm2835.c
> @@ -164,7 +164,7 @@ static struct clk *bcm2835_i2c_register_div(struct de=
vice *dev,
>  					struct clk *mclk,
>  					struct bcm2835_i2c_dev *i2c_dev)
>  {
> -	struct clk_init_data init;
> +	struct clk_init_data init =3D {};

[Severity: High]
This isn't a bug introduced by this patch, but looking at the rest of
bcm2835_i2c_register_div(), it registers a clock lookup globally using
clk_hw_register_clkdev() without managed devres or manual cleanup.

If the driver is repeatedly unbound and bound, such as via sysfs,
bcm2835_i2c_remove() is called and the hardware context (priv) allocated
via devm_kzalloc() is freed. However, because the unbind path does not
call clkdev_drop(), doesn't this leave a dangling clk_hw pointer in the
global clock lookup list?

Could this cause a use-after-free if the clk framework subsequently searches
for this clock, in addition to leaking the clk_lookup structures? Would
switching to devm_clk_hw_register_clkdev() instead resolve this lifecycle
mismatch?

>  	struct clk_bcm2835_i2c *priv;
>  	char name[32];
>  	const char *mclk_name;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/9f82f37e6d6c069cd44=
326bcd5e5a2a8069a13a9.1787239980.git.geert+renesas@glider.be?part=3D1
