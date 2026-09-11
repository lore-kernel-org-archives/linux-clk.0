Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833AD3CB911
	for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 06:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789107708; cv=none; b=plvsVa5fnGTNAyd/NNSSVZMEe2tnz+/mMQC1pE2hnGPDJEJy5xM9dvMhhQZBoZLJnByZ/metlp71PWDqAheGrocvYSg1Fgi17VjXQERw7f5gxEC/yqj1pt8jNt+n2QiEbpuX8exhtXYpNZWub9glKD3tLF6qb+yQ1PWYRTws0VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789107708; c=relaxed/simple;
	bh=/D0yQAB52nNFfV1uhI6AJXqF96TkzAI7FMwwSn6TgQ0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pRLuXkc15HGVHso+YFpWXJMJlbP1JqadQ9vukqj6q1sR0uYfNEP5N/v+MfssR6AMgR4pz/GF85CxyfueWSW1jNeB7u+jp3EGF0vTwSVqoGyTjexNYBsRKqk1LCyj7eEHtVj9+wwOnj7HT2E11MBqn+ttj1E7slW+IeDEq188WS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=daXaS/cz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="daXaS/cz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC2E11F000FF;
	Fri, 11 Sep 2026 06:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789107706;
	bh=m/Y5zSACOBDiwRG2AbeWq0xFu4ccYIk3L/Li192PVb4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=daXaS/czcRbEWpOv1m++7qtU1sbp8HCtfp0lQeDlWA9ezN+gY3a32tR9DvD6Yned3
	 zs+Jo8EkwWco4aOFYgRXOuVoV8U9wgKtb8NbWuaf0B/0jaXqGL50rA1PFN/qgCSwd9
	 YjTE0SzkpXTDEWnzor/+UMWQKu5ryBSVSxRN/XPSc8jUh6P1mOmh8NMl20/427QNlM
	 7BGCSRv9AlT0HXMRXkAiEMIF0ClFVjHQ729L1kDcSPwXt97sBiLar7PmQWQzZVYmNj
	 GScWihVm2lcBJbygPsdxrIWd/8HB9408oCUHIx8/bwQSGE9KJQeiimQ3awYTXmxx6P
	 9sIYV4VpB7SFw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC] clk: versaclock7: propagate all xin lookup failures
Reply-To: sashiko-reviews@lists.linux.dev
To: "Slavin Liu" <bolin.liu@seu.edu.cn>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260911060918.94343-1-bolin.liu@seu.edu.cn>
References: <20260911060918.94343-1-bolin.liu@seu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 06:21:45 +0000
Message-Id: <20260911062145.EC2E11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Reading and writing multi-byte device registers into native intege=
r variables via regmap_bulk_read/write causes endianness-dependent behavior=
 and data corruption on big-endian architectures.
- [High] vc7_get_apll_rate() returns negative error codes cast to unsigned =
long, resulting in bogus clock rates being registered on failure.
- [High] Unconditional dereference of client->dev.of_node->name may cause a=
 kernel panic if of_node is NULL.
- [High] Missing error check for regmap_read causes uninitialized stack var=
iable usage.
--

commit 3e1c7db53668b06c3bbde7c57f495f683d910e66
Author: Slavin Liu <bolin.liu@seu.edu.cn>

clk: versaclock7: propagate all xin lookup failures

This commit updates the versaclock7 driver to handle all lookup errors for
the xin clock, propagating failures properly rather than just probe
deferrals.

> diff --git a/drivers/clk/clk-versaclock7.c b/drivers/clk/clk-versaclock7.c
> index 1340d2f512be5..5f32d3fb807a0 100644
> --- a/drivers/clk/clk-versaclock7.c
> +++ b/drivers/clk/clk-versaclock7.c
> @@ -515,10 +515,10 @@ static int vc7_read_apll(struct vc7_driver_data *vc=
7)
>  {
>  	int err;
>  	u32 val32;
>  	u16 val16;
> =20
>  	err =3D regmap_bulk_read(vc7->regmap,
>  			       VC7_REG_XO_CNFG,
>  			       (u32 *)&val32,
>  			       VC7_REG_XO_CNFG_COUNT);

[Severity: High]
This is a pre-existing issue, but does using regmap_bulk_read() to read raw
bytes sequentially into native integer variables like u32 and u64 cause
endianness-dependent behavior?

On big-endian architectures, reading raw bytes sequentially into a native
integer will alias incorrectly. This appears to also occur in
vc7_read_fod(), vc7_write_fod(), vc7_read_iod(), and vc7_write_iod().

[ ... ]

> @@ -725,10 +725,10 @@ static unsigned long vc7_get_apll_rate(struct vc7_d=
river_data *vc7)
>  {
>  	int err;
>  	unsigned long xtal_rate;
>  	u64 refin_div, apll_rate;
> =20
>  	xtal_rate =3D clk_get_rate(vc7->pin_xin);
>  	err =3D vc7_read_apll(vc7);
>  	if (err) {
>  		dev_err(&vc7->client->dev, "unable to read apll\n");
>  		return err;
>  	}

[Severity: High]
This is a pre-existing issue, but does returning a negative error code
as an unsigned long produce a bogus clock rate?

When vc7_read_apll() fails (e.g., due to an I2C transaction timeout), it
returns a negative error code which gets cast to a large unsigned value.
This value is then silently accepted by the caller in vc7_probe() and
passed to clk_register_fixed_rate() as the apll_rate.

[ ... ]

> @@ -1117,17 +1117,17 @@ static int vc7_probe(struct i2c_client *client)
>  	vc7->chip_info =3D i2c_get_match_data(client);
> =20
>  	vc7->pin_xin =3D devm_clk_get(&client->dev, "xin");
> -	if (PTR_ERR(vc7->pin_xin) =3D=3D -EPROBE_DEFER) {
> -		return dev_err_probe(&client->dev, -EPROBE_DEFER,
> +	if (IS_ERR(vc7->pin_xin)) {
> +		return dev_err_probe(&client->dev, PTR_ERR(vc7->pin_xin),
>  				     "xin not specified\n");
>  	}
> =20
>  	vc7->regmap =3D devm_regmap_init_i2c(client, &vc7_regmap_config);
>  	if (IS_ERR(vc7->regmap)) {
>  		return dev_err_probe(&client->dev, PTR_ERR(vc7->regmap),
>  				     "failed to allocate register map\n");
>  	}
> =20
>  	if (of_property_read_string(client->dev.of_node, "clock-output-names",
>  				    &node_name))
>  		node_name =3D client->dev.of_node->name;

[Severity: High]
This is a pre-existing issue, but could this unconditionally dereference a
NULL pointer if client->dev.of_node is NULL?

If the device is instantiated outside of device tree (e.g., via I2C board
info or ACPI without an explicit OF node), of_property_read_string() handles
the NULL of_node safely by returning an error.  However, the fallback path
then unconditionally dereferences client->dev.of_node->name, which would
cause a kernel panic.

[ ... ]

> @@ -1186,8 +1186,8 @@ static int vc7_probe(struct i2c_client *client)
>  		/*
>  		 * This driver does not support remapping FOD/IOD to banks.
>  		 * The device state is read and the driver is setup to match
>  		 * the device's existing mapping.
>  		 */
>  		bank_idx =3D output_bank_mapping[out_num];
> =20
>  		regmap_read(vc7->regmap, VC7_REG_OUT_BANK_CNFG(bank_idx), &val);
>  		val &=3D VC7_REG_OUTPUT_BANK_SRC_MASK;

[Severity: High]
This isn't a bug introduced by this patch, but does the lack of an error ch=
eck
on regmap_read() cause the use of an uninitialized stack variable?

If regmap_read() fails, it returns an error code without modifying val.
The uninitialized stack garbage in val is then used in a bitwise AND and
subsequently passed to vc7_get_bank_clk(), which could cause unpredictable
device configuration or out-of-bounds array mapping.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911060918.9434=
3-1-bolin.liu@seu.edu.cn?part=3D1
