Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B253343F4A6
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 06:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789452237; cv=none; b=fZqBJycg3wlEWSS1F8LMMxQwRB5OiiLnz6cjgyya3oE8dwYxbRJZxGRG6L0Umwy4viJjWecbDlGCyhd7qk224AKT2gd5iqVQipYpzUi2DBtFokHFeuu4JpTVEF1gFGByRuvSQXqRl3c8Ynt+ptljyvEp4mESrelw+a10h+jkDo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789452237; c=relaxed/simple;
	bh=bCG6Hay0/01jqjw70xVBYS2qlnGvTH7w+3Ndjb9Y4nw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GayUEewnIyd7NjAGgSB2CHcqGpXtn/rMs6YjNRjMbIgPjXMNsB0HRdj3pMyLLXQMNKZte4Ybe5t2tOs990aOM8rMf3WB8YnwV1yjGjHENHTmAX0Tggdo6QrbOBg1B5WzBt9RE5xAlN36j8tcNVReyb8FfEOefpAQ4PD6PwVxrVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QyIV/YwR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QyIV/YwR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D61191F000FF;
	Tue, 15 Sep 2026 06:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789452235;
	bh=e9ikOpBD2osUQxqwgVe7ppnncR+2Uup3djjM/wl0cDA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QyIV/YwR57JZUfs33p0USz2rXrR3aWYuRRDap+j2mNL1AB0uh8tbj7udIrApl6F0I
	 XoHoZe6mYvRjrIjFyHXvT3lKlmoW3P5Z+gjP0d/+LKNk8dpyCVlP6fDvkUZuwq+7Dr
	 xzIGws30UgAPNS9e5YDk0Jm2y5yy4Vb5YVq6gO3ssQuacT/7gijAC5X5vhkKywz71t
	 Dvy5V7hr9uUKAnLg85NhUdW7Y3xOQIMG74ezzMZ9qybOBm2b6ZkowXkekid8fJiM1K
	 v8DnayUAVTDnf+iCbENH42YO0X5l79OGmYu4uQAA0do4GTg7Wygy7N2q4GHQqxrlxE
	 LLD5rmA+6yYDw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: samsung: Fix parent clock reference leak on enable
 failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wentao Liang" <vulab@iscas.ac.cn>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260915055343.1730045-1-vulab@iscas.ac.cn>
References: <20260915055343.1730045-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 06:03:54 +0000
Message-Id: <20260915060354.D61191F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: samsung: use-after-free in suspend/resume due to dangling dat=
a->clk
--

commit 24f91a497fb993e31220f4d3d97ab6c013f81744
Author: Wentao Liang <vulab@iscas.ac.cn>

clk: samsung: Fix parent clock reference leak on enable failure

In exynos_arm64_enable_bus_clk(), when dev is NULL the parent clock is
obtained with of_clk_get_by_name() and then handed to
clk_prepare_enable(). On the enable failure path the function returns
directly without clk_put(), leaking the consumer reference.

Store the clk_prepare_enable() return value and release the reference
with clk_put() before returning on failure.

> diff --git a/drivers/clk/samsung/clk-exynos-arm64.c b/drivers/clk/samsung=
/clk-exynos-arm64.c
> index 35d4de233cc1b..05c4a15dfe993 100644
> --- a/drivers/clk/samsung/clk-exynos-arm64.c
> +++ b/drivers/clk/samsung/clk-exynos-arm64.c
> @@ -149,6 +149,7 @@ static int __init exynos_arm64_enable_bus_clk(struct =
device *dev,
>  		struct device_node *np, const struct samsung_cmu_info *cmu)
>  {
>  	struct clk *parent_clk;
> +	int ret;
> =20
>  	if (!cmu->clk_name)
>  		return 0;

[ ... ]

> @@ -167,7 +168,11 @@ static int __init exynos_arm64_enable_bus_clk(struct=
 device *dev,
>  	if (IS_ERR(parent_clk))
>  		return PTR_ERR(parent_clk);
> =20
> -	return clk_prepare_enable(parent_clk);
> +	ret =3D clk_prepare_enable(parent_clk);
> +	if (ret)
> +		clk_put(parent_clk);
> +
> +	return ret;
>  }

[Severity: High]
Does this error path leave a dangling pointer in the device's PM data
structure?

Earlier in exynos_arm64_enable_bus_clk(), if dev is not NULL, the parent_clk
is saved to data->clk:

drivers/clk/samsung/clk-exynos-arm64.c:exynos_arm64_enable_bus_clk() {
	...
	if (dev) {
		...
		parent_clk =3D clk_get(dev, cmu->clk_name);
		data =3D dev_get_drvdata(dev);
		if (data)
			data->clk =3D parent_clk;
	}
	...
}

When clk_prepare_enable() fails, the caller exynos_arm64_register_cmu_pm()
intentionally ignores the failure and proceeds with initialization:

drivers/clk/samsung/clk-exynos-arm64.c:exynos_arm64_register_cmu_pm() {
	...
	ret =3D exynos_arm64_enable_bus_clk(dev, NULL, cmu);
	if (ret)
		dev_err(dev, "%s: could not enable bus clock %s; err =3D %d\n",
		        __func__, cmu->clk_name, ret);
	...
}

During system suspend, exynos_arm64_cmu_suspend() unconditionally references
data->clk:

drivers/clk/samsung/clk-exynos-arm64.c:exynos_arm64_cmu_suspend() {
	...
	clk_disable_unprepare(data->clk);
}

Could this cause a use-after-free and a kernel panic during system suspend =
if
the clock enablement fails during probe, since the newly added clk_put() fr=
ees
the clock object but data->clk is never cleared?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915055343.1730=
045-1-vulab@iscas.ac.cn?part=3D1
