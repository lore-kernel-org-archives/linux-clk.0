Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5723B5E10;
	Mon, 17 Aug 2026 11:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786964670; cv=none; b=BSfFwgvaRk5YqVkCYOyRrr3sQOqBW/gSGVH8zRIprdU7JlepPL3QacVnQhOPmXMTSbBkrHbwWWA2PYv9NskKFq/cXTmN1wbch+XeWTqyovmI76dtACcIedneUpAp3Uqm8Zs9F2TKmMQqyWg7KBgI0JvfV8FADy/ABGY3Hh62Fxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786964670; c=relaxed/simple;
	bh=irnNjx3e0FOtVcEMGfJisVf7ott3iX8fYmQin2kc7K4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m0bbO6vrERRXF8o4A4U8ZmUk8EJ7KXebpNUXJ/pgmGEZJMtfc4orY3oVEIgGcwa4HqSWwnqC1qR8xPzs5ka5LiBZl6qSCWVe4QWK2RP/pIfP7F39wInqmuGf/j0QJJSANp3YdSG30u93W+fTpJLm24uBoWR/aqOw/dRSsY6JRG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FjOqVBOA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FjOqVBOA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC6B41F000E9;
	Mon, 17 Aug 2026 11:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786964669;
	bh=2DcuPFieXGNfzuXh0N9JAegpBPETZZgMSk47QAwYqSg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FjOqVBOAlNeYU6mq7tIeRiz1QfO0+oc7ZCwxdc40hZ9sGwWTMkIV9Bbedk1gmGi5L
	 26udl5+OdTInJtR8H+TYn/IeS1r1L6Mh0yOAdeGCDpoGwGHyVLJYE0R72hmyIS1tRB
	 bZyFymJ6F5I9PwsMDWeIlG73sK+O7XsLJOq0rJr68e4uCSR12M/211Jm57h+NHoYgX
	 W91st/SQXKv6rSp4UlbIgiUIPu5HXM3FzHyXmyGyn9vZ7trC7Inq5ot01s8HwawPvh
	 lJ+e6J2xRh680+4Jb8gla5pDgSrjKXExqF6sk+T+kbyyvi8dwz3o4lBbIy55Saeefp
	 xrdatx7QZ3lMQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 2/6] clk: Introduce clk_hw_set_spread_spectrum
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260817-clk-v11-v11-2-36e9bc701b11@nxp.com>
References: <20260817-clk-v11-v11-0-36e9bc701b11@nxp.com>
 <20260817-clk-v11-v11-2-36e9bc701b11@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 11:04:28 +0000
Message-Id: <20260817110428.BC6B41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The clock's PM domain is unconditionally resumed before checking=
 if the `set_spread_spectrum` callback is supported, causing an unnecessary=
 hardware wakeup.
--

--- Patch [2]: [PATCH v11 2/6] clk: Introduce clk_hw_set_spread_spectrum ---
commit f5617081c24679334412209893c7d5c3a6321d1f
Author: Peng Fan <peng.fan@nxp.com>

clk: Introduce clk_hw_set_spread_spectrum

This commit introduces the clk_hw_set_spread_spectrum API to allow clock
drivers to configure spread spectrum features. It adds a set_spread_spectrum
callback to clk_ops for hardware-specific implementations.

> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 048adfa86a5d0..8c78621cde253 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c

[ ... ]

> @@ -2774,6 +2774,33 @@ int clk_set_max_rate(struct clk *clk, unsigned lon=
g rate)
>  }
>  EXPORT_SYMBOL_GPL(clk_set_max_rate);
> =20
> +int clk_hw_set_spread_spectrum(struct clk_hw *hw, const struct clk_sprea=
d_spectrum *ss_conf)
> +{
> +	struct clk_core *core;
> +	int ret;
> +
> +	if (!hw)
> +		return 0;
> +
> +	core =3D hw->core;
> +
> +	clk_prepare_lock();
> +
> +	ret =3D clk_pm_runtime_get(core);
> +	if (ret)
> +		goto fail;
> +
> +	if (core->ops->set_spread_spectrum)
> +		ret =3D core->ops->set_spread_spectrum(hw, ss_conf);

[Severity: Medium]
Is it necessary to wake up the device via PM runtime before verifying that
the set_spread_spectrum callback is supported? Waking up the device might
involve slow hardware communication or powering up a PM domain.

Also, if the callback is not populated, ret will remain 0 from the
successful clk_pm_runtime_get call. Does this mean the function will return
success when it actually failed to set the spread spectrum, instead of
returning an error like -EOPNOTSUPP?

> +
> +	clk_pm_runtime_put(core);
> +
> +fail:
> +	clk_prepare_unlock();
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(clk_hw_set_spread_spectrum);
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-clk-v11-v1=
1-0-36e9bc701b11@nxp.com?part=3D2
