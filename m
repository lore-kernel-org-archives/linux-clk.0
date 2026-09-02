Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498EC46C85A;
	Wed,  2 Sep 2026 11:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788349246; cv=none; b=VwQ7+wjIp0/qa9JlWZt9EcnW7xzxU5vFGcBy9qALxFUeaQkPaIo0tITGiyOViXORcdzw7pvS7QK4eStkSd+JfQl/KQdDJhDbFgjZ1p0OxxBdH0t1fCK4snF9CGaSAqPvut+/GSnc3e28GpfOInfjtqjOAS+arJ/uZiZyL+SPtJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788349246; c=relaxed/simple;
	bh=4eNvlAiraK2gLFNr2h27SGFXT/XzKU6wa7YZY1VeZls=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Vg4e8AMRUYBpIE86C1LL/S/bIh8kYMm5WBga8ue/w7v7CWlFvgCOHZQqT2NNfyzkwYEdEbZ6DWuSxVrfarHtj60nRB8vtq/AeHKc91kUsUO+v92JvHFlv3oaBkFXbeFXTuouuJKojg7BmNyCifK8dlVT2LPsdIqMIArFP4+0C0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kVIMJqjP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kVIMJqjP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D0FA1F000E9;
	Wed,  2 Sep 2026 11:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788349244;
	bh=tiLcdAYjPzOzYonqyzY4EC/Al/ubUVx4LWjrEQjj0Mw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kVIMJqjPcZYgppltcivaTpct/Kbha4rHgZlM0/Hi2wdxJCU5Ivu5KZRTOPvmsrz8Y
	 qAiFTwfzQSX7GHVkHhC0G89r+buWWIKYfHGKvX+rQQdltoFWBcROAptY914Q0S5CbZ
	 WKBTqPhamN9LBhSFS/rCH9Uz8zg2QGWFBQoj3vFf0c9r+MLTUrtCHNYPgvp+eY7+NS
	 riAwBJkWB6w7At022j0bJ+6qepVt9SY9WtBbamJqCZD0/+FJfzrkXg6Mrer3KKv+SU
	 szjikJTHYcf7c7ukZjMIs53Tyd2986lSGJtY2Q3rnRlLPl/jZK53W7Xarw2SQf10kv
	 lLPn18/nnM/dQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 05/12] pmdomain: Make genpd_get_from_provider()
 public
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <1e1b20976fb2b0b78684be315cdf78960efcc403.1788338320.git.geert+renesas@glider.be>
References: <cover.1788338320.git.geert+renesas@glider.be>
 <1e1b20976fb2b0b78684be315cdf78960efcc403.1788338320.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 11:40:44 +0000
Message-Id: <20260902114044.8D0FA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Exporting of_genpd_get_from_provider introduces an unsafe public A=
PI that returns a bare pointer to a generic_pm_domain without reference cou=
nting or external locking, enabling Use-After-Free vulnerabilities.
--

commit 3c8789e2e8b48c33d816b4234b9862d8dcb170e7
Author: Geert Uytterhoeven <geert+renesas@glider.be>

pmdomain: Make genpd_get_from_provider() public

This commit renames genpd_get_from_provider() to of_genpd_get_from_provider=
()
and exports it to allow PM domain drivers to look up providers directly.

> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 842c4169e2906..ac3a07066e7fc 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
[ ... ]
> @@ -2900,8 +2900,7 @@ EXPORT_SYMBOL_GPL(of_genpd_del_provider);
>   * Returns a valid pointer to struct generic_pm_domain on success or ERR=
_PTR()
>   * on failure.
>   */
> -static struct generic_pm_domain *genpd_get_from_provider(
> -					const struct of_phandle_args *genpdspec)
> +struct generic_pm_domain *of_genpd_get_from_provider(const struct of_pha=
ndle_args *genpdspec)
>  {
>  	struct generic_pm_domain *genpd =3D ERR_PTR(-ENOENT);
>  	struct of_genpd_provider *provider;
> @@ -2923,6 +2922,7 @@ static struct generic_pm_domain *genpd_get_from_pro=
vider(
> =20
>  	return genpd;
>  }
> +EXPORT_SYMBOL_GPL(of_genpd_get_from_provider);

[Severity: High]
Could exporting this function introduce a Use-After-Free vulnerability for
callers?

Looking at the implementation of of_genpd_get_from_provider(), it searches
for the provider while holding of_genpd_mutex, but drops the lock before
returning the bare generic_pm_domain pointer. Since generic_pm_domain does
not appear to use a kref or external synchronization mechanism, the returned
pointer is left completely unprotected once the lock is dropped.

If the provider is concurrently unregistered (for example, via unbinding the
device from sysfs), is it possible for pm_genpd_remove() to free the domain
memory while an external caller is still holding or mutating this stale
pointer?

[ ... ]
> @@ -2995,7 +2995,7 @@ int of_genpd_add_child_ids(struct device_node *np,
>  			goto err_unwind;
> =20
>  		/* Get the parent domain */
> -		parent_genpd =3D genpd_get_from_provider(&parent_args);
> +		parent_genpd =3D of_genpd_get_from_provider(&parent_args);
>  		of_node_put(parent_args.np);
>  		if (IS_ERR(parent_genpd)) {
>  			pr_err("Failed to get parent domain for %pOF: %ld\n",

[Severity: High]
Does this sequence present a Time-Of-Check to Time-Of-Use (TOCTOU) race?

Because of_genpd_get_from_provider() drops the lock before returning, there
is a window between retrieving parent_genpd and subsequently using it (such
as passing it to pm_genpd_add_subdomain() later in this function).

Could the parent domain be freed by a concurrent unregistration during this
window, before the necessary locks are acquired by the subsequent operation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1788338320.gi=
t.geert+renesas@glider.be?part=3D5
