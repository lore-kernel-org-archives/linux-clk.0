Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795808004;
	b=TZgiP3QjYxEjrwjzyQQ5iJQ9NWILNfRcWDSHmwlGohnowBb/wYpedMxiG42kAhripxNn
	 wtm+EowyuRDOQyjCIRd5HSV+eVL6itxfyrin0HyVLQpiE/SI+wwtuJoWb8j87MztkWbg2
	 7KDbmMSJMtA+zgtvzlUiZIhMD0Zo7Iqfg6Su7FjzSKqQpBi8IEhicPLmxLp002q8JmChJ
	 MGs2G/gVDRXQ2WYPGRKdCIRh87tLgZfmlFtrC4EXpBlUULO0CdVyPZDayZxD4yiJnQNj7
	 msTWWnPu9RsMA6RPlF4UagWQjmgHNFWCuC7hY5oFy5oGMGrxLhCgwOY1XBf37tiwobw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795808004;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+o12a201AA9zFeBuaWfcBRfOYJehbEaWoT+Jy8CLvB8=;
	b=BG3yW+35D+rO3BbIptjoWq8q3tYmJlwN9rs5Z2Nw7qe31mWJ197V63CVtY/wpVtxNUl7
	 zifbo+xJBbd/8bEPlT/UML9+oRM7BR57TwWoJ2DwkqM7fZkyRYeJj1kekTGh/tZVbRZQX
	 Pf27cQf5gesUSSBYM71DnHqm9DbqGO8IRezM2EOW6iEwntv8kwXCIs1SAgflF5vdqIxBl
	 HmMq3f80i+4FztHBSALQegAv71cDdUSb1xmgtmrRIXrx/c3EcT28Joj8LY2ttfI047qaZ
	 uFB8ZH3vfNRfJTz1umhnWgY+dGtk/3YKCGZhRCcJLF4BYnCq1rz0wO3h7n+vcxU7SUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IquE9xHB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1210606A31C
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 19:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IquE9xHB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55AD81F00893;
	Fri, 27 Nov 2026 19:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795808003;
	bh=+o12a201AA9zFeBuaWfcBRfOYJehbEaWoT+Jy8CLvB8=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=IquE9xHBa2MBmUqotaOirfYjgbnGink5mNYAF61RsiGPYwjznBECKGfgL7eqyNFxe
	 WXXcafhz05eWzZmhXl/Vl64lZi/r/X/R8tBUh2iauiOJiH/eD9HP94zaHFoXm+yd1F
	 f7kacJQpSNv5kSMxmrIcylzGdRVO/0+b+2lktMh6P/h/yqUk504YLKSc0zvuKFhADn
	 exRkX4r5uP6DJyFT/mqj2IXV+aHUYeM5tJFYKmdWDT7kO8S9FAyooatNMKrj7QrbYu
	 WGOzM6ySXmomrFXj0jFqcdCnDvhXpoZDWC/qsKWw4Weqme32EHL/+PcshhkVQIaCCS
	 dWg653ETx21JA==
Message-ID: <sashiko-outbox-238165@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/10] clk: rockchip: cpu: Allocate rate_table before
 registering notifier
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, linux-clk@vger.kernel.org
In-Reply-To: <20261127192620.3443537-6-lee@kernel.org>
References: <20261127192620.3443537-1-lee@kernel.org>
 <20261127192620.3443537-6-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 19:33:22 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [High] clk: rockchip: leaked notifier in
  rockchip_clk_register_cpuclk_multi_pll() [1]
--

commit 87431f3421888170ed6b1c77970113743924cab9
Author: Lee Jones <lee@kernel.org>

clk: rockchip: cpu: Allocate rate_table before registering notifier

This commit allocates and populates cpuclk->rate_table before calling
clk_notifier_register() in rockchip_clk_register_cpuclk(), and reverses the
error teardown order so the notifier is unregistered before rate_table is
freed.

> diff --git a/drivers/clk/rockchip/clk-cpu.c b/drivers/clk/rockchip/clk-cp=
u.c
> index eb6b8b878e4db..27d5b6f6987db 100644
> --- a/drivers/clk/rockchip/clk-cpu.c
> +++ b/drivers/clk/rockchip/clk-cpu.c
> @@ -360,36 +360,36 @@ struct clk *rockchip_clk_register_cpuclk(const char=
 *name,
>  		goto free_alt_parent;
>  	}
> =20
> -	ret =3D clk_notifier_register(clk, &cpuclk->clk_nb);
> -	if (ret) {
> -		pr_err("%s: failed to register clock notifier for %s\n",
> -				__func__, name);
> -		goto free_alt_parent;
> -	}
> -
>  	if (nrates > 0) {
> -		cpuclk->rate_count =3D nrates;
>  		cpuclk->rate_table =3D kmemdup_array(rates, nrates, sizeof(*rates),
>  						   GFP_KERNEL);
>  		if (!cpuclk->rate_table) {
>  			ret =3D -ENOMEM;
> -			goto unregister_notifier;
> +			goto free_alt_parent;
>  		}
> +		cpuclk->rate_count =3D nrates;
> +	}
> +
> +	ret =3D clk_notifier_register(clk, &cpuclk->clk_nb);
> +	if (ret) {
> +		pr_err("%s: failed to register clock notifier for %s\n",
> +		       __func__, name);
> +		goto free_rate_table;
>  	}
> =20
>  	cclk =3D clk_register(NULL, &cpuclk->hw);
>  	if (IS_ERR(cclk)) {
> -		pr_err("%s: could not register cpuclk %s\n", __func__,	name);
> +		pr_err("%s: could not register cpuclk %s\n", __func__, name);
>  		ret =3D PTR_ERR(cclk);
> -		goto free_rate_table;
> +		goto unregister_notifier;
>  	}
> =20
>  	return cclk;
> =20
> -free_rate_table:
> -	kfree(cpuclk->rate_table);
>  unregister_notifier:
>  	clk_notifier_unregister(clk, &cpuclk->clk_nb);
> +free_rate_table:
> +	kfree(cpuclk->rate_table);
>  free_alt_parent:
>  	clk_disable_unprepare(cpuclk->alt_parent);
>  free_cpuclk:

[Severity: High]
This problem wasn't introduced by this patch, but does
rockchip_clk_register_cpuclk_multi_pll() in the same file also register
cpuclk->clk_nb before allocating cpuclk->rate_table, and leak the notifier
[1] if kmemdup() fails?

drivers/clk/rockchip/clk-cpu.c:rockchip_clk_register_cpuclk_multi_pll() {
    ...
	ret =3D clk_notifier_register(hw->clk, &cpuclk->clk_nb);
	if (ret) {
		pr_err("%s: failed to register clock notifier for %s\n",
		       __func__, name);
		goto free_cpuclk;
	}

	if (nrates > 0) {
		cpuclk->rate_count =3D nrates;
		cpuclk->rate_table =3D kmemdup(rates,
					     sizeof(*rates) * nrates,
					     GFP_KERNEL);
		if (!cpuclk->rate_table) {
			ret =3D -ENOMEM;
			goto free_cpuclk;
		}
	}

	return hw->clk;

free_cpuclk:
	kfree(cpuclk);
    ...
}

Jumping directly to free_cpuclk without calling clk_notifier_unregister()
leaves the freed cpuclk->clk_nb linked in clk_notifier_list, which can cause
a use-after-free or list corruption when the notifier chain is later
traversed or modified.

[1] https://sashiko.dev/#/bug/linux-1bafb3ff-a5b6-4219-9489-1455c756f137

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127192620.3443=
537-1-lee@kernel.org?part=3D5
