Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8543F9F2F;
	Mon, 17 Aug 2026 11:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786965379; cv=none; b=JVvi3KG/JWKfGHB9KG2Zz8BQTX5AewzdeMiRKY4FDAA0YswUdPannrzl+NH1Vvu1PDdtXs27I+PbbusJHOGNzaCO7UzOSYaTOUENN6yu7Uue6BFaV8OwsJJYlVRIRvbzUtGn2CSZLwqopICWUF4iWea9lnStDSOHaMj2Z+yWTuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786965379; c=relaxed/simple;
	bh=ixXrvmLac5mcXf8w06xZpNXv/DmsU50PVeohINrOBRY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mrt6gUydpjjzMSZq2Kil5GDG/x0ccT5XE9j+1xvzz2gg+5chiiluG1Wlg7iwArbjKfV/ZeSeK2qpv6NTd8iSHLrn4W4bsgfCxd4lmxCHYorxUenp4TFC39T09U0+iBTYVHAZ/LBkFhsVJTtX8X27MC5mtK04rXSc67t3+CDhu4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kZzJwnQ+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kZzJwnQ+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC02E1F000E9;
	Mon, 17 Aug 2026 11:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786965377;
	bh=hrSaXuikHYf0QZyx+RxS4PeXEYGd1kuGoMAzL2F4eXA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kZzJwnQ+YnzlzRvRuizihX74dpwf5EGGA7Flnfw8OLMtRUByHfj8K+QhGbsBQNOPV
	 ldNDAFu2ih5w9V3bRUWJgmF0zl+92LNL+UaL/fB5EhjTRrzYdJ3dHctx9Ia1bX2l3J
	 AFer2/3uFfCSdXRAgsHW3xiWdHDMNbI5Eicm7hKrd4JVqGcV4t3Am4lGKNE/sGBLsn
	 SUs1L8I4veHm6fezpr367BUlx8ldzFryTA56/SD8H051zvhrToXz1u33EnGNqxKuJd
	 /+YGAXGu3Bb/q1jGLpDyeEax52Th7Ea54rFVKSAcR/PIHucuCMTDfJcjbavvLmYnJH
	 xuvmQeeo9iB5A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 6/6] clk: scmi: Add i.MX95 OEM extension support for
 SCMI clock driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-clk@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260817-clk-v11-v11-6-36e9bc701b11@nxp.com>
References: <20260817-clk-v11-v11-0-36e9bc701b11@nxp.com>
 <20260817-clk-v11-v11-6-36e9bc701b11@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 11:16:16 +0000
Message-Id: <20260817111616.AC02E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Out-of-bounds read on `hws` array due to missing bounds check on f=
irmware-supplied parent indices.
--

--- Patch [6]: [PATCH v11 6/6] clk: scmi: Add i.MX95 OEM extension support =
for SCMI clock driver ---
commit d5aa65b1d50040a18c4b3cc2d72d625cca785922
Author: Peng Fan <peng.fan@nxp.com>

clk: scmi: Add i.MX95 OEM extension support for SCMI clock driver
   =20
This commit introduces OEM extension support for the SCMI clock driver to
allow vendor-specific features like spread spectrum configuration. It adds
a new file clk-scmi-oem.c, initializes the extensions via scmi_clk_oem_init=
(),
and passes the scmi_device to scmi_clk_ops_select() for OEM data access.

> diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
> index d88e78cc9a12e..2dd50c5b4ea8f 100644
> --- a/drivers/clk/clk-scmi.c
> +++ b/drivers/clk/clk-scmi.c

[ ... ]

> @@ -406,7 +419,7 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
>  		 * to avoid sharing the devm_ allocated clk_ops between multiple
>  		 * SCMI clk driver instances.
>  		 */
> -		scmi_ops =3D scmi_clk_ops_select(sclk, transport_is_atomic,
> +		scmi_ops =3D scmi_clk_ops_select(sdev, sclk, transport_is_atomic,
>  					       atomic_threshold_us,
>  					       scmi_clk_ops_db,
>  					       ARRAY_SIZE(scmi_clk_ops_db));

[Severity: High]
This is a pre-existing issue, but does this function lack bounds checking on
the firmware-supplied parent indices?

In scmi_clocks_probe(), the total number of clocks is retrieved from the SC=
MI
firmware, and the hws array is allocated to that size. During clock
initialization, the firmware is queried for possible parent clocks:

	if (sclk->info->num_parents > 0) {
		sclk->parent_data =3D devm_kcalloc(dev, sclk->info->num_parents,
						 sizeof(*sclk->parent_data), GFP_KERNEL);
		if (!sclk->parent_data)
			return -ENOMEM;

		for (int i =3D 0; i < sclk->info->num_parents; i++) {
			sclk->parent_data[i].index =3D sclk->info->parents[i];
			sclk->parent_data[i].hw =3D hws[sclk->info->parents[i]];
		}
	}

If the firmware returns a parent clock identifier (sclk->info->parents[i])
that is greater than or equal to the clock count, wouldn't the driver use it
without validation as an array index into the hws array?

Could this lead to an out-of-bounds memory read and a kernel crash when the
clock framework later dereferences the invalid pointer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-clk-v11-v1=
1-0-36e9bc701b11@nxp.com?part=3D6
