Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94133DA7CC;
	Fri,  4 Sep 2026 16:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788538672; cv=none; b=cj3IxQh4j5TWyO0Iv28tIaSq+EawSxluPy/hZEmav8VSSsBXsDXd+4V3dQ9flr2jQBirLnV/XXt0POvqtdYQmsAyRsVD2RapModCIfj9FPCvMiKkOAHlGdcGdrPU9WCZjRuw+WIPCymqCb1yJNUuKBvJVzP3zTR3cl0MEHtlURs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788538672; c=relaxed/simple;
	bh=NPBncP+LCJ0JMkOfhExpJlxFiRewZO37osrqT3bFxgo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AJy3gbxsJVZ3ihqJI5OuD6UDSndfo4cVWcuOFo/4QN6KzhpDNaBKQTjN9l7hWjadKcIcKBa2+o4G/GpHqKz8WNlAxWCVYjQ936ufhpRjJ0TYJ79tDEbJX7H4eLZZpQgoJEm2af00mTxIXGx+EQeZ2JRGpsE3sHrMYcfSWbH+t9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TQKU6bSw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TQKU6bSw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6986B1F00A3D;
	Fri,  4 Sep 2026 16:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788538670;
	bh=N556bIflvNq0b9A02jCveNw0/bTmCCR/PnvnIQjxG7M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TQKU6bSwwPo4oviP6gebVg7YFPsNGfoR2xe5bQV9ow3LAKGzuIHOcaRFZ09H2zfk+
	 eMTIDDXvaKbqNr+XC1mjkw6g1aMv+Q2VLA+wEBxMd72HRRpPB07McvwETjwDu7bFm4
	 aCSKLvLWEDFTPk1CdQ61K00msowwB/Tj6qklc3zGKnY2Iy9J4GeYApla/AQeB0tK9R
	 HxUz5UdUoBqxQnqYBJljsFMh56MPNfTHwzFz3i1YHhX5tXV7huY8CVFg7m5KQl4NWL
	 f3JVNMa5KC78rixmgOGsokVvVAN6UGW0fIz9FTjDgPEt9suJRDRwKh5j1/2d2YWiUc
	 xxRWVzshlCaYg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 18/27] clk: mediatek: Add MT8189 apmixedsys clock
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: linux-clk@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260904-mt8189-clocks-system-base-v6-18-5df247f56938@collabora.com>
References: <20260904-mt8189-clocks-system-base-v6-0-5df247f56938@collabora.com>
 <20260904-mt8189-clocks-system-base-v6-18-5df247f56938@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 16:17:49 +0000
Message-Id: <20260904161750.6986B1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Uninitialized variables cause potential hardware corruption due to=
 ignored return values.
- [High] Memory leak of the fhctl I/O mapping on early probe failure.
--

commit 899c77c67da66015b28a154ffd13a738ef18913e
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

clk: mediatek: Add MT8189 apmixedsys clock support

Add support for the MT8189 apmixedsys clock controller, which provides
PLLs generated from SoC 26m.

> diff --git a/drivers/clk/mediatek/clk-mt8189-apmixedsys.c b/drivers/clk/m=
ediatek/clk-mt8189-apmixedsys.c
> new file mode 100644
> index 0000000000000..7399a444ec4d4
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-apmixedsys.c

[ ... ]

> +static int clk_mt8189_apmixed_probe(struct platform_device *pdev)
> +{
> +	const u8 *fhctl_node =3D "mediatek,mt8189-fhctl";
> +	struct device_node *node =3D pdev->dev.of_node;
> +	struct clk_hw_onecell_data *clk_data;
> +	int r;
> +
> +	clk_data =3D mtk_alloc_clk_data(ARRAY_SIZE(apmixed_plls));
> +	if (!clk_data)
> +		return -ENOMEM;
> +
> +	r =3D mtk_clk_register_pllfhs(&pdev->dev, fhctl_node, apmixed_plls,
> +				    ARRAY_SIZE(apmixed_plls), pllfhs,
> +				    ARRAY_SIZE(pllfhs), clk_data);

[Severity: High]
This is a pre-existing issue, but does this call expose a potential memory
leak of the fhctl I/O mapping on early probe failure?

If of_iomap() fails in mtk_clk_register_pllfhs(), it returns -EINVAL and
leaks the fhctl_base mapped earlier in fhctl_parse_dt():

drivers/clk/mediatek/clk-pllfh.c:mtk_clk_register_pllfhs() {
    fhctl_parse_dt(fhctl_node, pllfhs, num_fhs);

    base =3D of_iomap(dev->of_node, 0);
    if (!base) {
        pr_err("%s(): ioremap failed\n", __func__);
        return -EINVAL;
    }
    ...
}

Similarly, if the loop fails on the very first iteration, it branches to the
error path and calls mtk_clk_cleanup_pllfhs() with a loop counter of 0.
Because the cleanup loop relies on the loop counter to discover fhctl_base
from the state array, the loop is skipped, fhctl_base remains NULL, and the
reference is overwritten without calling iounmap().

Is there a way to ensure this mapping is correctly cleaned up if probe
fails during testing or device bind/unbind?

[Severity: High]
This is another pre-existing issue exposed by this call, but does
fhctl_parse_dt() ignore the return values of of_property_read_u32_index(),
leading to uninitialized stack variables being passed to get_pllfh_by_id()?

drivers/clk/mediatek/clk-pllfh.c:fhctl_parse_dt() {
        of_property_read_u32_index(node, "clocks", offset + 1, &pll_id);
        of_property_read_u32_index(node,
                                   "mediatek,hopping-ssc-percent",
                                   i, &ssc_rate);

        pllfh =3D get_pllfh_by_id(pllfhs, num_fhs, pll_id);
    ...
}

If the device tree is missing the 'clocks' or 'mediatek,hopping-ssc-percent'
properties, of_property_read_u32_index() returns an error without initializ=
ing
pll_id and ssc_rate. These uninitialized stack variables are then used to l=
ook
up a PLL and configure its SSC rate, which could lead to hardware state
corruption.

Could we add error checking for these device tree reads?

> +	if (r)
> +		goto free_apmixed_data;
> +
> +	r =3D of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
> +	if (r)
> +		goto unregister_plls;
> +
> +	platform_set_drvdata(pdev, clk_data);
> +
> +	return 0;
> +
> +unregister_plls:
> +	mtk_clk_unregister_pllfhs(apmixed_plls, ARRAY_SIZE(apmixed_plls), pllfh=
s,
> +				  ARRAY_SIZE(pllfhs), clk_data);
> +free_apmixed_data:
> +	mtk_free_clk_data(clk_data);
> +	return r;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-mt8189-clo=
cks-system-base-v6-0-5df247f56938@collabora.com?part=3D18
