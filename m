Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC15A375F9C;
	Fri, 16 Oct 2026 16:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166994; cv=none; b=O4ooBDlosuJTJparzq2WMnuQsWVLLFsi1fJPi4+Uwm0Y6IvnvMO/EcL7b7s27JmrM/y/Y15aupFUzBRxUYo4XSEJh20Zkvr8nU4r7zHIdeRwzRbXVfFng/Mn/MJD/VfTp902QHwZodiDxWAQaQPuePJY3XLKmG+3hUd8X2yf7rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166994; c=relaxed/simple;
	bh=HvIDoCcGFiTande0G0/KBPMuyS5zrzay+reTFQMs1P8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=B3wUrxim/td8jR1WVrmUZXbCggGTZOsE5YSvBm54svGoiSq0jqPCbdjkPyA4rLRwuuobBxCOmKnQPwvLemWSyGIkYvYupROJTL3qWT/kNI0gIV8DtLpwWIM+YCpAJdCVGjnvOSAyKpWrlO4cBTlx97NRHJj5nCsJHJ6RJuRvf5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SDsain6c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SDsain6c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 107FE1F000C4;
	Fri, 16 Oct 2026 16:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792166990;
	bh=VR2r+Imq4kVg3djfIN234TsHVwpi2PHKQ+3s+qd6rgU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SDsain6cwQyB6hiuP46qTc1B8L+siwDZHOlFCpXqL3PpvvJ7j8SiQlFjWAnxTUTfv
	 r8C8Gqnxfr05BCznbxyQ1+17nJFRwGHBJeoxYcq0VuSdjAJhOcpCquvFz2UArSTktP
	 sDGp42Xbk0CN7QRYIRfegcCt4QqO7/een4MJWxbR3SofJ4x6CJhgQR5hoREV6sPWLI
	 v0G5dPc7/J3JQQvYX3yoBFnzxotw5Sgd90Ev/Of6fCfd9s8A2AnMjud9R5+GiR91RX
	 vQlQx3wsagENmLn4X49b6DVPRcSOCi5f80u9BLtHEm0KbKOh9+mS9uM8LEuSFc+MYd
	 JhQCA7MPxxrow==
Message-ID: <sashiko-outbox-174605@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/8] pmdomain: Make genpd_get_from_provider() return
 -EPROBE_DEFER
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <4524363679c1f2163aca3b3dda2bfbde170d095a.1792163045.git.geert+renesas@glider.be>
References: <cover.1792163045.git.geert+renesas@glider.be>
 <4524363679c1f2163aca3b3dda2bfbde170d095a.1792163045.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 16:09:49 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] pmdomain: unnecessary probe deferral on invalid domain index
--

commit c105920d803c0cf9396fb90d8428fdc4d83e8655
Author: Geert Uytterhoeven <geert+renesas@glider.be>

pmdomain: Make genpd_get_from_provider() return -EPROBE_DEFER

Unlike provider-based look-up functions in other subsystems[1],
genpd_get_from_provider() returns -ENOENT instead of -EPROBE_DEFER when
the provider is not found, thus not supporting probe deferral.
Currently this is worked around in of_genpd_add_subdomain() by remapping
-ENOENT[2].

Fix this for all current and future callers by returning -EPROBE_DEFER
instead, and drop the no longer needed remapping code.

> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 964e44c2f78f1..88c886814a5b9 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -3021,7 +3021,7 @@ EXPORT_SYMBOL_GPL(of_genpd_del_provider);
>  static struct generic_pm_domain *genpd_get_from_provider(
>  					const struct of_phandle_args *genpdspec)
>  {
> -	struct generic_pm_domain *genpd =3D ERR_PTR(-ENOENT);
> +	struct generic_pm_domain *genpd =3D ERR_PTR(-EPROBE_DEFER);
>  	struct of_genpd_provider *provider;
> =20
>  	if (!genpdspec)

[ ... ]

> @@ -3276,7 +3276,7 @@ int of_genpd_add_subdomain(const struct of_phandle_=
args *parent_spec,
>  out:
>  	mutex_unlock(&gpd_list_lock);
> =20
> -	return ret =3D=3D -ENOENT ? -EPROBE_DEFER : ret;
> +	return ret;
>  }

[Severity: Low]
Does this change leave an unnecessary probe deferral in __genpd_dev_pm_atta=
ch()?

If a device specifies a valid PM domain provider but an invalid domain inde=
x,
genpd_get_from_provider() returns the specific error code from the provider=
's
xlate callback, such as -ENOENT.

However, __genpd_dev_pm_attach() still unconditionally routes all errors
through driver_deferred_probe_check_state():

drivers/pmdomain/core.c:__genpd_dev_pm_attach() {
	...
	pd =3D genpd_get_from_provider(&pd_args);
	of_node_put(pd_args.np);
	if (IS_ERR(pd)) {
		mutex_unlock(&gpd_list_lock);
		dev_dbg(dev, "%s() failed to find PM domain: %ld\n",
			__func__, PTR_ERR(pd));
		return driver_deferred_probe_check_state(base_dev);
	}
	...
}

Could this unnecessarily delay boot and error reporting for devices with
permanently invalid PM domain IDs by forcing a wait until late_initcall?

Should __genpd_dev_pm_attach() be updated to only call
driver_deferred_probe_check_state() when PTR_ERR(pd) is -EPROBE_DEFER?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1792163045.gi=
t.geert+renesas@glider.be?part=3D5
