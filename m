Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1B53DC4B3
	for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 14:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789656702; cv=none; b=NDjeYF7+GwOUcrryAf8NbgQvB4A51YV3fmm0Ru9cKLYmTil7CtlzPF5Ac59b4IAy5Zvxf8Fg6v/6nE6qVUAPAOMwOahJnoWHWiFjrzASdiaVAOcul4V9Qenmyoa0BcNF7ktPSH3JYvDcXv0e6ccB5Sr4XXWH9u4MYZ4C/aaPwPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789656702; c=relaxed/simple;
	bh=nRW+Dh/T9OOlCe+gd5fNSYYqJmLpddkfGlq/GGrFu5M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hHWUEAegZtUCQdw/mFUrByA3qZXr+usAc/5EKDY9wVKODBk1gZ9mnoRIxsKy8SfaAd+IybjExlpfSAKHz0MC7DHM/cfYTqT0rCvg1i2pfNddt6DVwmQMDlpiETaj1WLn2EmcshpjM/+pwSFpzz86jYY9g1n6cuSx0IKsO4kBrQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y6Qtf8KG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y6Qtf8KG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7135C1F000FF;
	Thu, 17 Sep 2026 14:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789656688;
	bh=ZuWaTLGJBbUAYe5rb163FRZIUs4/pQPa+JsEEwGFDfE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y6Qtf8KGz6y4LRjz8E8y5YFw/g8pOpRFPLAd8vS0UozOvPNNxQaKbtVZO/uYfnaGy
	 Yj0zZyqPpHoEn2XBHFB8POrWLNoLcazHuIwdR2F8Lf6pI8BxE2ISDXklgCU0BZ2QRn
	 JI4TDbT+pzxM2q6TrYukcZz+Ug6Jl/w5EQ26EOTpDmgyNuzKwjmRcSoGod4gFnX9qy
	 UYHSCGMZLckHsJPLwuFuvY2BvD0qQ9RehlLqvxPQnT2A8uUZi6x8V+sAiO+9kOV5hJ
	 IYcHe4mNMp8ub2m/gVJbQsvdbrJtyBViFhNF8T3bPY8bhrUh21IqEdA/Y2Nw6GcGPs
	 1+lkMA+Cm+/ag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: disable unused clocks registered after boot
Reply-To: sashiko-reviews@lists.linux.dev
To: alexandre.belloni@bootlin.com
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260917144011.3014860-1-alexandre.belloni@bootlin.com>
References: <20260917144011.3014860-1-alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 14:51:28 +0000
Message-Id: <20260917145128.7135C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] clk: unused clocks can bypass disable due to TOCTOU race in regi=
stration
--

commit 757dd3574808273e528cadee01291d010712df6b
Author: Alexandre Belloni <alexandre.belloni@bootlin.com>

clk: disable unused clocks registered after boot

This commit introduces a delayed work task to periodically scan for and dis=
able
unused clocks registered by dynamically loaded modules after boot. It uses a
flag, clk_disable_unused_done, to determine whether the initial late_initca=
ll
scan has completed.

> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index fef87167a60b5..f455d2482a5a5 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
[ ... ]
> @@ -1621,10 +1619,31 @@ static int __init clk_disable_unused(void)
>  	clk_prepare_unlock();
> =20
>  	clk_pm_runtime_put_all();
> +}
> +
> +static void clk_disable_unused_workfn(struct work_struct *work)
> +{
> +	clk_disable_unused();
> +}
> +
> +static DECLARE_DELAYED_WORK(clk_disable_unused_work, clk_disable_unused_=
workfn);
> +
> +static int __init clk_disable_unused_init(void)
> +{
> +	if (clk_ignore_unused) {
> +		pr_warn("clk: Not disabling unused clocks\n");
> +		return 0;
> +	}
> +
> +	pr_info("clk: Disabling unused clocks\n");
> +
> +	clk_disable_unused();
> +
> +	WRITE_ONCE(clk_disable_unused_done, true);

[Severity: Medium]
Does setting clk_disable_unused_done after clk_disable_unused() returns and
drops prepare_lock open up a time-of-check to time-of-use race?

If a driver registering a clock (such as via an async probe thread) adds the
clock right after the boot scan completes, could it slip through before this
flag is updated?

> =20
>  	return 0;
>  }
> -late_initcall_sync(clk_disable_unused);
> +late_initcall_sync(clk_disable_unused_init);
[ ... ]
> @@ -4462,8 +4481,13 @@ __clk_register(struct device *dev, struct device_n=
ode *np, struct clk_hw *hw)
>  	clk_core_link_consumer(core, hw->clk);
> =20
>  	ret =3D __clk_core_init(core);
> -	if (!ret)
> +	if (!ret) {
> +		if (READ_ONCE(clk_disable_unused_done))
> +			mod_delayed_work(system_power_efficient_wq,
> +					 &clk_disable_unused_work,
> +					 CLK_DISABLE_UNUSED_DELAY);
>  		return hw->clk;
> +	}

[Severity: Medium]
Can a concurrent registration complete __clk_core_init() after the boot
scan finishes, but read clk_disable_unused_done as false?

In this sequence, __clk_core_init() takes the prepare_lock after
clk_disable_unused() has already dropped it. The clock is added to the
internal lists, but the boot scan has already passed it by.

Then, __clk_register() reads clk_disable_unused_done. If
clk_disable_unused_init() hasn't updated the flag yet, it will read false
and skip scheduling the delayed work.

Would this leave the newly registered unused clock permanently enabled since
it missed both the boot scan and the delayed work?

> =20
>  	clk_prepare_lock();
>  	clk_core_unlink_consumer(hw->clk);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917144011.3014=
860-1-alexandre.belloni@bootlin.com?part=3D1
