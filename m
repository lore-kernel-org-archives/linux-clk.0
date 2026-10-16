Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B859E4EF15E;
	Fri, 16 Oct 2026 16:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792167305; cv=none; b=FZhUTxzfke2aHhZ/2qMoTlhilWkAvBpJqOyRfyX+NibxWFPXylEnjV1PMbJHAXUHDf3wQxcRsCcWO+Cq8Zn3JZOuj6y0Z3z40VM0T35UUTURXJvwWofoB27QoSI0vRT45tX2P4VM+vYzd089tmx9jjS7LibWl2OYlH99t/AeERs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792167305; c=relaxed/simple;
	bh=lP6gFdVF06YpTjuUyzmNhvig3F87WmoxfTQOfI6QTkc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=QhSlCwnVhd4O7qKz+rt3B/JHFN4xrnrTga8kMQVkfumEPbMJuYtCDozU7nh484UhC359sl68AeXYkcuyo0W7Bw1IZRGBZ+Xmc5eYkaG3v1d0604AwN7gW3qGW76mwG+/oZNL4eCR63p6nK4uV+GwyHTjNcKGfat5jWYVE0ve2lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hJ8HVPOv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hJ8HVPOv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C6DC1F000C4;
	Fri, 16 Oct 2026 16:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792167302;
	bh=JtCmWeDa3J0zF/8ydCf9VzVP9ypkQLPdU5AobI8s4r0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hJ8HVPOvQ6Bw4KRcbdnYDbsgEwkCQQM9Ks8s1uzZeOJuiFsrlX72S0OCYyVplMIH/
	 q+8ITBc0Qdu2reBiE/CA06MU7UhPG5L60KHwkuLAlpBSdfmtqOanRL2enqbKU2mVY5
	 3ZTLhX23qS4rkFf30TxSDvMuHs/7+gumFj4iu7m+7aUSxK/AGlrbV4ot2er/cFAngj
	 if56A6QSFivoMm9gidtxWley3jLn0ToyaECTd/jQYgzJ8odBLLbuS8Cxa7hP1WVKG5
	 Q3sR0xoGtqLiBNUPhjtELYav79oHUInSSKE7dv9iBuCvZr+MV16O5c5PUOLMX9c25m
	 COKUPFJBI2JGg==
Message-ID: <sashiko-outbox-174618@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/8] pmdomain: renesas: r8a78000: Add SCMI remapping
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <2895c8f3cbe718dc597ad25e16c2461f0d681ab6.1792163045.git.geert+renesas@glider.be>
References: <cover.1792163045.git.geert+renesas@glider.be>
 <2895c8f3cbe718dc597ad25e16c2461f0d681ab6.1792163045.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 16:15:01 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] clk: double free of parent clock reference in error path
- [High] pmdomain: renesas: mutation of SCMI genpd and hardcoded index 0 in=
 attach_dev
- [Medium] of: memory leak of scmi_clk_np reference
- [Medium] reset: memory leak of exclusive reset controls on error and unbi=
nd
- [Medium] pmdomain: renesas: out-of-bounds stack read in r8a78000_mdlc_att=
ach_dev()
- [Low] cleanup: mixed goto and scope-based cleanups in attach_dev
--

commit a125fd15fada610e74f2b15cf0cafd68482a5100
Author: Geert Uytterhoeven <geert+renesas@glider.be>

pmdomain: renesas: r8a78000: Add SCMI remapping support

Extend the Module Controller driver for R-Car X5H with SCMI support, to
remap hardware power domain, module, and reset IDs to abstractions
offered by the SCMI firmware. This avoids putting SCMI IDs in DT and
supports fallback to non-SCMI defaults when needed.

> --- a/drivers/pmdomain/renesas/r8a78000-mdlc.c
> +++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
[ ... ]
> +static int r8a78000_mdlc_attach_dev(struct generic_pm_domain *domain,
> +				    struct device *dev)
> +{
> +	struct device_node *np =3D dev->of_node;
> +	struct r8a78000_mdlc_priv *priv;
> +	struct clk *clk, *parent =3D NULL;
> +	struct of_phandle_args pd_spec;

[Severity: Medium]
Is pd_spec guaranteed to be fully initialized?

If the device tree node has a malformed #power-domain-cells < 2, could we
end up with uninitialized stack memory in pd_spec.args[1] that is later
used as a module ID?

> +	const struct mod_map *map;
> +	unsigned int id;
> +	int ret;
> +
> +	ret =3D of_parse_phandle_with_args(np, "power-domains",
> +					 "#power-domain-cells", 0, &pd_spec);

[Severity: High]
Is it intended to unconditionally parse index 0 here, even if the domain
being attached is at a higher index?

If a non-MDLC device uses multiple domains and the MDLC domain is not at
index 0, could this look up the wrong provider or silently fail to attach
the correct clocks?

> +	if (ret < 0)
> +		return ret;
> +
> +	scoped_guard(mutex, &r8a78000_mdlc_lock) {

[Severity: Low]
Does this mix of scope-based cleanup and goto violate the cleanup subsystem
guidelines?

This function uses scoped_guard() here, but also manually manages cleanup
using goto-based error handling labels later in the function (e.g.,
goto fail_put_parent). The guidelines suggest converting either all or none
of the resources in a given routine to avoid LIFO ordering bugs.

> +		hlist_for_each_entry(priv, &r8a78000_mdlc_list, link) {
> +			if (priv->np =3D=3D pd_spec.np)
> +				break;
> +		}
> +	}
[ ... ]
> +	if (parent)
> +		ret =3D pm_clk_add_clk(dev, parent);
> +	if (!ret)
> +		ret =3D pm_clk_add_clk(dev, clk);
> +	if (ret)
> +		goto fail_destroy;
> +
> +	return 0;
> +
> +fail_destroy:
> +	pm_clk_destroy(dev);
> +fail_put_parent:
> +	clk_put(parent);

[Severity: High]
Will this result in a double free of the parent clock?

pm_clk_destroy() destroys all clocks attached to the device, which includes
cleanly removing the successfully added parent clock (and internally calling
clk_put() on it). Falling through to fail_put_parent seems to call
clk_put(parent) a second time.

> +fail_put_clk:
> +	clk_put(clk);
> +	return ret;
> +}
[ ... ]
> +static const struct power_map *fill_power_map(struct r8a78000_mdlc_priv =
*priv,
> +					      const struct power_map_in *map_in,
> +					      struct device_node *scmi_power_np)
> +{
[ ... ]
> +		genpd =3D of_genpd_get_from_provider(&scmi_spec);
> +		if (IS_ERR(genpd))
> +			return dev_err_cast_probe(dev, genpd,
> +					"Failed to get SCMI power domain %u\n",
> +					map[i].fw_id);
> +
> +		dev_dbg(dev, "SCMI power domain %u is %s\n", map[i].fw_id,
> +			genpd->name);
> +
> +		map[i].genpd =3D genpd;
> +
> +		/* Hook up clock domain support */
> +		genpd->attach_dev =3D r8a78000_mdlc_attach_dev;
> +		genpd->detach_dev =3D r8a78000_mdlc_detach_dev;
> +		/* Setting flags this late has no impact, but does not hurt */
> +		genpd->flags |=3D GENPD_FLAG_PM_CLK;
> +		genpd->dev_ops.stop =3D pm_clk_suspend;
> +		genpd->dev_ops.start =3D pm_clk_resume;

[Severity: High]
Is it safe to mutate the genpd struct of the SCMI provider directly?

Modifying genpd->attach_dev and genpd->dev_ops here changes the behavior
for all consumers of the shared SCMI domain. Could this cause
cross-subsystem state corruption or spurious warnings when non-MDLC devices
use this SCMI domain?

> +	}
> +
> +	return map;
> +}
> +
> +static const struct mod_map *fill_mod_map(struct r8a78000_mdlc_priv *pri=
v,
> +					  const struct mod_map_in *map_in,
> +					  struct fwnode_handle *scmi_reset_fwnode)
> +{
[ ... ]
> +		scmi_spec.args[0] =3D map[i].fw_id;
> +
> +		rstc =3D reset_control_get_from_provider_exclusive(&scmi_spec);
> +		if (IS_ERR(rstc))
> +			return dev_err_cast_probe(dev, rstc,
> +					"Failed to get SCMI reset %u\n",
> +					map[i].fw_id);
> +
> +		map[i].rstc =3D rstc;

[Severity: Medium]
Does this error path leak the previously acquired exclusive reset controls?

If an allocation fails mid-loop, IS_ERR(rstc) evaluates to true and the
function immediately returns an error pointer, leaving no mechanism to free
map entries from earlier iterations.

Furthermore, the driver does not appear to iterate through this map and
release these controls during driver unbind or teardown.

> +	}
> +
> +	return map;
>  }
> =20
>  static void r8a78000_mdlc_unlink(void *data)
>  {
>  	struct r8a78000_mdlc_priv *priv =3D data;
> =20
>  	scoped_guard(mutex, &r8a78000_mdlc_lock) {
>  		hlist_del(&priv->link);
>  	}
>  }

[Severity: Medium]
Does this teardown sequence leak the priv->scmi_clk_np reference?

The reference was previously acquired using scmi_find_proto() with
SCMI_PROTOCOL_CLOCK, which returns an incremented reference count, but
of_node_put() does not appear to be called during unbind.

[ ... ]
>  static int r8a78000_mdlc_probe(struct platform_device *pdev)
>  {
> +	struct device_node *scmi_reset_np __free(device_node) =3D NULL;
> +	struct device_node *scmi_power_np __free(device_node) =3D NULL;
> +	struct device_node *scmi __free(device_node) =3D NULL;
[ ... ]
> +	scmi_clk_np =3D scmi_find_proto(scmi, SCMI_PROTOCOL_CLOCK);
> +	if (!scmi_clk_np) {
> +		dev_dbg(dev, "Cannot find SCMI clock management protocol\n");
> +		goto fallback;
> +	}
> +
> +	scmi_reset_np =3D scmi_find_proto(scmi, SCMI_PROTOCOL_RESET);
> +	if (!scmi_reset_np) {
> +		dev_dbg(dev, "Cannot find SCMI reset management protocol\n");
> +		goto fallback;
> +	}
> +
> +	priv->scmi_clk_np =3D scmi_clk_np;
> +	info =3D mdlc_data->fw_info;
> +
> +fallback:

[Severity: Medium]
If the jump to the fallback label occurs after successfully assigning
scmi_clk_np (e.g., when scmi_reset_np is missing), does this leak the
scmi_clk_np reference?

Since scmi_clk_np is not annotated with __free(device_node) like
scmi_power_np and scmi_reset_np, it requires explicit cleanup on error
paths.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1792163045.gi=
t.geert+renesas@glider.be?part=3D7
