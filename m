Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD18F47607C
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 10:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307506; cv=none; b=M7MIamWxK6xcGAoUcJZyXuB59/g5sjlGZ1YTI6G9tCdv2+dwRav0AaOqVZZ1XJJgkf+UWp3k6Rwbh0+yuWeMj7d2Gp3UmkTYvb2hyV4YeAV/PZF88FVX4Oda6uU+AQW+pXHvcvjaqtt+iVbYmgP3ARWR+DmNvcd1hZdsehfuW8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307506; c=relaxed/simple;
	bh=UwzabSCv70RAiIUIKV3RJFkTPkv9hHyljirEgN9ilXc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GaWalL/lu7JOH4uFlFkvBZpuZEQo16z8xHRO/1Rv0lReytoVTyZvK9xXsAIhMF79rI9fQwbDfXnDmCPYmZvEO+rO95AK8HyHIbxdi9fn+5PZSNHQV2LR8WufxBd+OMpn+bK/7AcfSEjtHjptFz2jfiDWBcqGRJLiQmvqTPPxUZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XogmDiCD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XogmDiCD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D012A1F000E9;
	Fri, 21 Aug 2026 10:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787307501;
	bh=whinKhOnbBpFaLiJHM5JFGDjF73h4ClZ7n5vppHJv8c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XogmDiCDZCbN29RyE+PEREi0zxt3OlYeYf3yJGtNU/mNla/0qeQeqoLvO5Y3tGWK+
	 BtBG6dv27MM//JfJLrYeTD76+K8hl3P6nCGgUjYyHGAapkviNRBiFt0mTt21Jw0I/f
	 z5SAOC3IhuK595CAvZN+5M7hNLd1jM0F7NR2bj2bK87f+iy0LDicTDz/FFH1xE8vWQ
	 zT4ntlyswSHh9OFvtEVU3AtkZ64AJTEBn4jQMl1114xe2mh7g1ReqaoO+shNCCG7Dp
	 hGyutxET2Xb3CDZSKsi3C1sB2ayg6jJNbioJV6uBNKkenI9J/pIDEyxTu71Q39JZP/
	 za76CqE4hTG3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] mmc: meson-gx: FIXME: Make sure clk_init_data is
 fully initialized
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <4b9a377a810b69a4eb885fc00cb34ef63e7fc1f1.1787240090.git.geert+renesas@glider.be>
References: <cover.1787240090.git.geert+renesas@glider.be>
 <4b9a377a810b69a4eb885fc00cb34ef63e7fc1f1.1787240090.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 10:18:20 +0000
Message-Id: <20260821101820.D012A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Uninitialized spinlock access in interrupt handler
--

--- Patch [1]: [PATCH 1/2] mmc: meson-gx: FIXME: Make sure clk_init_data is=
 fully initialized ---
commit 20368821444f654f1165c58c0816283a3774d376
Author: Geert Uytterhoeven <geert+renesas@glider.be>

mmc: meson-gx: FIXME: Make sure clk_init_data is fully initialized

This commit fully initializes the clk_init_data structure to avoid subtle
initialization issues. By ensuring all members are zeroed, it prevents bugs
when specific stack initialization configs are enabled.

> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-=
mmc.c
> index 694bb443d5f3f..698febdcd4988 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -418,7 +418,7 @@ static int meson_mmc_clk_set(struct meson_host *host,=
 unsigned long rate,
>   */
>  static int meson_mmc_clk_init(struct meson_host *host)
>  {
> -	struct clk_init_data init;
> +	struct clk_init_data init =3D {};
>  	struct clk_mux *mux;
>  	struct clk_divider *div;
>  	char clk_name[32];

[Severity: High]
This is a pre-existing issue, but I noticed a potential problem in how the
interrupt handler is registered relative to lock initialization in this dri=
ver.

In drivers/mmc/host/meson-gx-mmc.c:meson_mmc_probe(), the interrupt is
requested before the spinlock is initialized:

	ret =3D request_threaded_irq(host->irq, meson_mmc_irq,
				   meson_mmc_irq_thread, IRQF_ONESHOT,
				   dev_name(&pdev->dev), host);
	if (ret)
		goto err_init_clk;

	spin_lock_init(&host->lock);

If an interrupt fires immediately upon registration, the interrupt handler
can begin execution and attempt to acquire the uninitialized lock:

drivers/mmc/host/meson-gx-mmc.c:meson_mmc_irq() {
	...
	if (status & IRQ_SDIO) {
		spin_lock(&host->lock);
		__meson_mmc_enable_sdio_irq(host->mmc, 0);
		sdio_signal_irq(host->mmc);
		spin_unlock(&host->lock);
	...
}

Could this result in a lockdep warning or kernel oops if a spurious interru=
pt
or pending hardware event triggers before spin_lock_init() completes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787240090.gi=
t.geert+renesas@glider.be?part=3D1
