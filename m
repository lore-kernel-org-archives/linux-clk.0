Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235774E56C2;
	Fri, 16 Oct 2026 16:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166898; cv=none; b=UyFlzzQm3ZGrNIVJF+63nqpRWbQ4rL0AD9cqiM4PhN4irSprX5EzZ/kqIsfj8DE7JBxkLFuPvv+f4VWbgppDi2b++WMqJeyWMBGVz+zRd8zLAJ+NIM/PDXDmh/SbJAIG3rM8BI2k0iX3m1IWcvFPG/2pV+EoBtZAkHYpaXR1dGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166898; c=relaxed/simple;
	bh=dcl83JYpIkKVKj948/p5AuzFQcrGQPQpANQckrFclP4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=fCtCn1hZ1vHDgXnDNebQkfl+hZn4f1Bd71R/kPdx7I3uKl8tmHCwpWzahnbLm35Q4rKT9XydluFFs/9RQctGAh4zZR6t290nXp+80I5VfNeftblxNLPORIg19+L5VmUQ32kaDG6bnK1ODT7aXQcd0ea06c8XOtEXJYrl549UsFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yon9xHih; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yon9xHih"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D2911F000C4;
	Fri, 16 Oct 2026 16:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792166897;
	bh=o+Sh4+38DdSxCwG0/e9frFam7m8SJGRvpwPYjothMRg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yon9xHihuLN1zpCYRwgkTNAofOGdI3OYySf0MgRnIg4L1/9SOXVjwsBoiDJB5ytiR
	 WmY49lk5WHmswhK1RadIzlKxt4Zhtd66IQ87XuNVOd2u3+H3bSiqA6iW7LyXjmdSwp
	 FgUIFhhcFnRxuw7bWkJx8aqhBGAXRLwUutEsOG04tCpl7QlRleP5curtV2AWwU+uwj
	 ecCIUf6njFmt0lVilCjg5PN0EG4f33ICpbimlkL9HNQc37klVLt0URZwBBWHEMBs8U
	 VgdfyDuvWIczv1FeMFP7Ud0IVANhm86pXE5XfuYr4mynG7wWYctU9CsGLWNdg7rPO9
	 LNE6NkhFf4pTQ==
Message-ID: <sashiko-outbox-174603@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/8] pmdomain: Make genpd_get_from_provider() public
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <e3b9d76d5b4a254d561b6e734423063e94225a28.1792163045.git.geert+renesas@glider.be>
References: <cover.1792163045.git.geert+renesas@glider.be>
 <e3b9d76d5b4a254d561b6e734423063e94225a28.1792163045.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 16:08:16 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] pmdomain: UAF due to un-refcounted genpd pointer export
--

commit a7a3a37d2be118bab420ebff1f13629dfa676eb6
Author: Geert Uytterhoeven <geert+renesas@glider.be>

pmdomain: Make genpd_get_from_provider() public

This commit makes genpd_get_from_provider() public as
of_genpd_get_from_provider(), allowing PM Domain drivers to look up
generic_pm_domain structures directly.

> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 88c886814a5b9..4136368456d99 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -3018,8 +3018,7 @@ EXPORT_SYMBOL_GPL(of_genpd_del_provider);
>   * Returns a valid pointer to struct generic_pm_domain on success or ERR=
_PTR()
>   * on failure.
>   */
> -static struct generic_pm_domain *genpd_get_from_provider(
> -					const struct of_phandle_args *genpdspec)
> +struct generic_pm_domain *of_genpd_get_from_provider(const struct of_pha=
ndle_args *genpdspec)
>  {
>  	struct generic_pm_domain *genpd =3D ERR_PTR(-EPROBE_DEFER);
>  	struct of_genpd_provider *provider;
> @@ -3041,6 +3040,7 @@ static struct generic_pm_domain *genpd_get_from_pro=
vider(
> =20
>  	return genpd;
>  }
> +EXPORT_SYMBOL_GPL(of_genpd_get_from_provider);

[Severity: High]
Can exporting this API lead to a use-after-free regression?

of_genpd_get_from_provider() returns an unpinned, un-refcounted pointer to
struct generic_pm_domain whose lifetime is managed by the provider. While t=
he
commit message compares this to the clock subsystem, clock pointers are
refcounted or uniquely allocated.

The follow-up r8a78000-mdlc patch demonstrates caching these genpd pointers=
 in
its power_map without acquiring any locks (since gpd_list_lock is internal).
Because the SCMI provider is looked up dynamically via
of_find_compatible_node(), fw_devlink cannot automatically detect the
dependency to create a device link.

If the SCMI driver is unbound (via sysfs or module unload), pm_genpd_remove=
()
will free the genpd structures, leaving dangling pointers. Furthermore,
overwriting the attach_dev and detach_dev function pointers of the SCMI gen=
pd
objects will lead to invalid execution if the module is unloaded.

[ ... ]

> @@ -3113,7 +3113,7 @@ int of_genpd_add_child_ids(struct device_node *np,
>  			goto err_unwind;
> =20
>  		/* Get the parent domain */
> -		parent_genpd =3D genpd_get_from_provider(&parent_args);
> +		parent_genpd =3D of_genpd_get_from_provider(&parent_args);

[Severity: High]
This problem wasn't introduced by this patch, but does this internal caller
have a time-of-check to time-of-use (TOCTOU) race?

Fetching parent_genpd locklessly in of_genpd_add_child_ids() allows a
concurrent pm_genpd_remove() to free the domain before gpd_list_lock is
subsequently acquired.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1792163045.gi=
t.geert+renesas@glider.be?part=3D6
