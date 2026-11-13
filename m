Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577265;
	b=yXhgl5SZAxkwDr+13bBE6BGl1UmeDMwerMskbCgnT70Txwo7rNIFsOlmsGaq/vSa6J44
	 8rtLsh3ZLcZN8S1m/iRFKytYUONc9r71TEg6JKzYJ6rTyKfGX0dPSwxdz3Sc/FOx33fnw
	 qUCit8Y8jfX/vodN6PFPHuhfJWeEWNfY4Hpvd2hUC84XoTTVdXkv/6t6ylCJ8/H5WHEXn
	 srnoYn5mDlSrb42EhSLfzV6WW6sUnSVGKcPC/7HQAaGcAdMO3DFd6UczMneSU6OALtMOx
	 Mz9eX6zMfndpCPzXNEh2h6hQFbgs5D74n/I+T2+8z9w8ggTRcb8o3VfDyKJDMFdIn8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577265;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aGIgCT2XLPOAbhqgptBw6fw1WJ13dYXLnhaEMNGCQQE=;
	b=Rv2P7FChEXn0kT1G/3A6d1s7UEwBphVX7LQ//k/a9jUaOKzZkCd6GNOHVwlEdkd504AS
	 mgkPz5U4NULlL/5tv1HhKMN5w1QPZ0jJJIS3BRg+uMwgA9y9KZcV5Xj5VOZNDmF+G8WJU
	 FyHM5m0fjUPKnLN+puLbEmLecM0XHXEV7ZV6Cw1r9NJFT2RL1mZSr6SE3LUr8SLoPs10y
	 5STDg8ucdnh/tGIVub0momrzxym/U1sSK2Y04lTtO2mQNSmoYFgIC4q2+55Jj7Dgfewn/
	 DZHgGeewvFiUqkqw5Bc6B0zGdwG2t3I4dWS+xp3pUfLAT3gs8VGi0XMA7hpsyve7j8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jt96ETE9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDF5606A327
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 13:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jt96ETE9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDC941F000C4;
	Fri, 13 Nov 2026 13:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794577264;
	bh=aGIgCT2XLPOAbhqgptBw6fw1WJ13dYXLnhaEMNGCQQE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jt96ETE9sktQI52f4FmQWS9eqOjAc7ejjp7AHZzKjkY+A22Au6I9151rIMVVbWLHy
	 FgxAryc1CnvsqADXGDohxw8m4ih8VdPIjVMfeO36Gt/S1FtqG3UDCcoTPVeABNoq3U
	 Rss4YBCDazSGWQi6PT7WHoQoPJ3cuBtB5H9PvDJIjus/HOEec/T/V1z4N3uimgDa1S
	 HsZbUczwWV+Y5x2u4BVJlN/Kozj+UGutnVbvqydi1OghaVUMQWLKor6jrFdU0LJaMb
	 9la0t03DaFhTmlhaPiUxGsVM3FqyhBdbcTp2/b9BMrJaMNE7AHu7oaoNOEVSi5ewTp
	 7rbzN8YXFVKhg==
Message-ID: <sashiko-outbox-212912@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 2/2] clk: scmi: optionally register only clocks
 referenced in the device tree
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ghennadi Procopciuc" <ghennadi.procopciuc@oss.nxp.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20261113-b4-scmi-clk-on-demand-v1-2-7fd162097b57@oss.nxp.com>
References: <20261113-b4-scmi-clk-on-demand-v1-0-7fd162097b57@oss.nxp.com>
 <20261113-b4-scmi-clk-on-demand-v1-2-7fd162097b57@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 13:41:04 +0000
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
- [Medium] clk: scmi: ERR_PTR(-EINVAL) from scmi_clk_get_hw() turned
  into -ENOENT by clk_get()
--

commit 37cea3339cbbcf997cf01fad1c4be8bccecc21cd
Author: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>

clk: scmi: optionally register only clocks referenced in the device tree

This commit adds the dt_referenced_only module parameter and Kconfig
option to register only the SCMI clocks referenced by enabled device tree
nodes and their parents, setting omitted entries in clk_data->hws to
ERR_PTR(-EINVAL).

> diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
> index 2dd50c5b4ea8f..a8ec782ac279b 100644
> --- a/drivers/clk/clk-scmi.c
> +++ b/drivers/clk/clk-scmi.c

[ ... ]

> @@ -391,14 +480,31 @@ static int scmi_clocks_probe(struct scmi_device *sd=
ev)
>  	transport_is_atomic =3D handle->is_transport_atomic(handle,
>  							  &atomic_threshold_us);
> =20
> +	unsigned long *ids __free(bitmap) =3D bitmap_zalloc(count, GFP_KERNEL);
> +
> +	if (!ids)
> +		return -ENOMEM;
> +
> +	if (dt_referenced_only && np) {
> +		scmi_clk_mark_dt_refs(np, ids, count);
> +		err =3D scmi_clk_mark_parents(ph, ids, count);
> +		if (err)
> +			return err;
> +
> +		if (bitmap_empty(ids, count))
> +			dev_warn(dev, "no clock referenced in the device tree, none registere=
d\n");
> +	} else {
> +		bitmap_fill(ids, count);
> +	}
> +
>  	sclks =3D devm_kcalloc(dev, count, sizeof(*sclks), GFP_KERNEL);
>  	if (!sclks)
>  		return -ENOMEM;
> =20
>  	for (idx =3D 0; idx < count; idx++)
> -		hws[idx] =3D &sclks[idx].hw;
> +		hws[idx] =3D test_bit(idx, ids) ? &sclks[idx].hw : ERR_PTR(-EINVAL);

[Severity: Medium]
Does setting hws[idx] to ERR_PTR(-EINVAL) actually prevent
clk_get_optional() from returning a NULL clock?

When a consumer looks up a clock via clk_get() (including
devm_clk_get_optional()), clk_get() ignores any error from
of_clk_get_hw() other than -EPROBE_DEFER and falls back to
__clk_get_sys():

drivers/clk/clkdev.c:clk_get() {
	if (dev && dev->of_node) {
		hw =3D of_clk_get_hw(dev->of_node, 0, con_id);
		if (!IS_ERR(hw) || PTR_ERR(hw) =3D=3D -EPROBE_DEFER)
			return clk_hw_create_clk(dev, hw, dev_id, con_id, NULL);
	}

	return __clk_get_sys(dev, dev_id, con_id);
}

__clk_get_sys() then fails to find a matching clkdev entry and returns
ERR_PTR(-ENOENT), which clk_get_optional() turns into NULL instead of
failing the lookup with -EINVAL.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-b4-scmi-cl=
k-on-demand-v1-0-7fd162097b57@oss.nxp.com?part=3D2
