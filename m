Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03EC3DA7C3
	for <linux-clk@vger.kernel.org>; Thu,  3 Sep 2026 10:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788431007; cv=none; b=tgzpgGoA3CZEtJEV6GUNjDK8lNq8UdI8WXJLMIkTjXBmJq+/uVfxtU9p2K0HQ4cDTaevU9fLUly1TfNS/LcdrQAPbWY/txSJgsCZ7naS9As1coWeAlI53e/nINWnOPlfj2LjwQRfTG7SsBtM5akPQzUDoGO7/8IdEXSx5CTnNHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788431007; c=relaxed/simple;
	bh=sxe/Pr63qpDcsJ93VXrRK4JLLu7HTRkUgkktkCpQM54=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=shEpAV/kmAc2FJQtOEHeE5fw5GaGpmbRNa2ZeE1kQfI9gY7a+YmsrSREklJKrsw37yi1r2Im+ZdjUHfvxeZyjG081UP++iiIXqPe7sJAusYTVQAHe2CD3SJyhVGy5dLQLdpv2M9Yi6kz3FpGYExSE4wclFzDE3SExCADgCiJzSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=exVXhtN/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="exVXhtN/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DF161F000E9;
	Thu,  3 Sep 2026 10:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788431005;
	bh=QDbhcr0r1zLEfcZW13r35jlB1X6sawKyYkxNYun4i60=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=exVXhtN/AXir+A71emg3LA0FfDubl7l1q9Z825G0I/6atWSJN2RVKkCIjCKskhoaC
	 HOLU/scbNlLZnCuFPYyvtzyadBMpxo5mIrvZhn4fVV9CndHb+EKr9hJcF7mMIVRO23
	 5RjWhBDHZPsoUqo+2RsUARO4jNBGrSkR5Me6byLLw6Ox6Ar8CES1Z2eKIlI4NwrfK1
	 B8yfU2goZ1ortqVXRO1G66K1p9QzHzAo6V3Pl9uBfoDvw8pldfWrHloc6IyifroIoy
	 GMgvjAuZ+kvi1cnqacvVJeufdiDXMT9YcSR6ypu6FEMtjJFwbXdB2ZMmdK1C6SJPKT
	 I5ihAVqmD7akg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] clk: rs9: Add clock index range check to
 rs9_of_clk_get()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <fe0172a31f5151af4b771a74362c2ec54ab80055.1788429994.git.geert+renesas@glider.be>
References: <cover.1788429994.git.geert+renesas@glider.be>
 <fe0172a31f5151af4b771a74362c2ec54ab80055.1788429994.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 10:23:24 +0000
Message-Id: <20260903102325.0DF161F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Hardware configuration is applied after exposing the clock provide=
r to consumers.
- [High] Stack-allocated buffers are used for I2C transfers, violating DMA =
safety requirements.
- [High] Probe fails entirely if an optional Device Tree property is missin=
g.
--

commit 1a5bae9844abc7b4414cda261d8a9d3cca8fb310
Author: Geert Uytterhoeven <geert+renesas@glider.be>

clk: rs9: Add clock index range check to rs9_of_clk_get()

rs9_of_clk_get() does not validate the clock index in the passed
DT clock specifier.  If DT specifies an incorrect and out-of-range
index, this will access memory beyond the end of the clk_dif[] array.

Fix by this adding a range check to rs9_of_clk_get().

> diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pci=
e.c
> index 564550c803896..f3376c29007aa 100644
> --- a/drivers/clk/clk-renesas-pcie.c
> +++ b/drivers/clk/clk-renesas-pcie.c

[ ... ]

> @@ -276,6 +276,11 @@ rs9_of_clk_get(struct of_phandle_args *clkspec, void=
 *data)
>  	struct rs9_driver_data *rs9 =3D data;
>  	unsigned int idx =3D clkspec->args[0];
> =20
> +	if (idx >=3D rs9->chip_info->num_clks) {
> +		pr_err("%s: Invalid clock index %u\n", __func__, idx);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
>  	return rs9->clk_dif[idx];
>  }

While reviewing this patch, I noticed a few pre-existing issues in the same
file.

drivers/clk/clk-renesas-pcie.c:rs9_probe() {
    ...
	ret =3D devm_of_clk_add_hw_provider(&client->dev, of_clk_hw_onecell_get,
					  &rs9->onecell);
	if (!ret)
		rs9_update_config(rs9);
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but does the hardware
configuration happen too late during probe?

Since rs9_probe() registers the clock provider via
devm_of_clk_add_hw_provider(), exposing it to the system, could a
concurrently probing consumer acquire and use the unconfigured clock before
rs9_update_config() applies the hardware parameters?


drivers/clk/clk-renesas-pcie.c:rs9_regmap_i2c_write() {
    ...
	const u8 data[3] =3D { reg, 1, val };
	const int count =3D ARRAY_SIZE(data);
	int ret;

	ret =3D i2c_master_send(i2c, data, count);
    ...
}

And similarly in rs9_regmap_i2c_read():

drivers/clk/clk-renesas-pcie.c:rs9_regmap_i2c_read() {
    ...
	u8 txdata =3D reg;
	u8 rxdata[2];

	...
	xfer[0].buf =3D (void *)&txdata;

	...
	xfer[1].buf =3D (void *)rxdata;

	ret =3D i2c_transfer(i2c->adapter, xfer, 2);
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but do the custom I2C read and
write functions pass stack-allocated buffers to the I2C core?

If the underlying I2C adapter relies on DMA mapping, could passing these
stack-allocated buffers (data, txdata, rxdata) to i2c_master_send() and
i2c_transfer() trigger a panic or silent memory corruption on architectures
with VMAP_STACK enabled?


drivers/clk/clk-renesas-pcie.c:rs9_get_output_config() {
    ...
	ret =3D of_property_read_u32(np, "renesas,slew-rate", &sr);
	of_node_put(np);
	if (!ret) {
		...
	}

	return ret;
}

[Severity: High]
This isn't a bug introduced by this patch, but can missing an optional
Device Tree property cause the probe to fail entirely?

If the optional "renesas,slew-rate" property is absent from a child node,
of_property_read_u32() returns -EINVAL. Could this unconditionally propagate
back through rs9_probe() and break the clock generator completely, instead
of safely falling back to default settings?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1788429994.gi=
t.geert+renesas@glider.be?part=3D1
