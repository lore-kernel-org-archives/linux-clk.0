Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D70F3C063A;
	Thu, 13 Aug 2026 23:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786662020; cv=none; b=S4B8i6c4Xfsu6UuWwTukQg7xZVcDDbe/S6hSxnOKy+3/JoJRkuH/ggnB85mbRfnYCrJEiLUO7bvLJ2YUO0tbQXvD8PbBM2UibMfSqrK4GCVCYAWiiubHmmYEnwQ9YyjT2DkHHbdwskg8cMAncmjFIWORw7aFLjL9mVojLSB4MAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786662020; c=relaxed/simple;
	bh=vCuD0gJk7BDs51E86E4whfyqMe5g5+C/jpXmmwuitjw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NVJQjdEDARRpZ432e/jR2baa0lL2zkqqmZRETHYovUXWVfTIKfcLeo9t5od3REEkGnD5nTOQzQppCL/G39swbDJ/hndUcZwkUwQG9MDe31NbqyumK/pYDKICXM3icZiAUdhG1s99d9v1B7cFpuzUH5pvaJXfg4JvCypUwcE0UZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iSWTc14I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iSWTc14I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 812221F000E9;
	Thu, 13 Aug 2026 23:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786662018;
	bh=YYEru6m3IQxsef7wGemhNlaqmEokgUl3rXTpfs3WNbQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iSWTc14II88fMEa1WD4trLC5M+4v+da1vzh8MEAnwIFqiCuUZl/BtvQuS+QC8tDC8
	 zXfaCsyAPM8gaKi29Mh5gDrh2I2xyGj4tXjtsoPlCR8uQcE6WSkZXxabRDRQ29XYom
	 EFTOkTfssTDRWLgTGuRo8DRy7w9wqjLmTwNoNKZ2upvNEU0FmpEuT6YBkW7VV19Dr1
	 /DMU4XqvoZGNTzCL44NzsMoge42I09h0nVZZhDYVllVcNMiWf6ysr9vl8yhu4gjDbG
	 RUGJaL9w98lrEThFqfz6WLiV6ImQZml2PF46DVisTPT3Kgd2Umn2Yp+JDGEafKNEKp
	 InHYu2vrEf7Zg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/11] mfd: rz-mtu3: store &pdev->dev in local variable
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cosmin Tanislav" <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-clk@vger.kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org
In-Reply-To: <20260327192425.438263-5-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20260327192425.438263-5-cosmin-gabriel.tanislav.xa@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 23:00:18 +0000
Message-Id: <20260813230018.812221F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The parent driver exports numerous bespoke accessors (e.g., rz_mtu=
3_shared_reg_read, rz_mtu3_enable) for child drivers, violating MFD subsyst=
em guidelines.
- [High] The driver passes 0 instead of PLATFORM_DEVID_AUTO as the ID in de=
vm_mfd_add_devices, risking sysfs naming collisions.
--

--- Patch [4]: [PATCH 04/11] mfd: rz-mtu3: store &pdev->dev in local variab=
le ---
commit 99cfbc12a5f5e788a17b9baa33f5115c64650afc
Author: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

mfd: rz-mtu3: store &pdev->dev in local variable

This commit introduces a local dev variable in rz_mtu3_probe() to store
&pdev->dev. It replaces multiple occurrences of &pdev->dev with this new
variable to simplify the code.

> diff --git a/drivers/mfd/rz-mtu3.c b/drivers/mfd/rz-mtu3.c
> index 3be6f6c900b82..37d12030e069c 100644
> --- a/drivers/mfd/rz-mtu3.c
> +++ b/drivers/mfd/rz-mtu3.c
[ ... ]
> @@ -347,7 +348,7 @@ static int rz_mtu3_probe(struct platform_device *pdev)
>  		mutex_init(&ddata->channels[i].lock);
>  	}
> =20
> -	return devm_mfd_add_devices(&pdev->dev, 0, rz_mtu3_devs,
> +	return devm_mfd_add_devices(dev, 0, rz_mtu3_devs,
>  				    ARRAY_SIZE(rz_mtu3_devs), NULL, 0, NULL);
>  }

[Severity: High]
This isn't a bug introduced by this patch, but is a pre-existing API violat=
ion.
Does passing 0 instead of PLATFORM_DEVID_AUTO as the ID in
devm_mfd_add_devices() risk sysfs naming collisions?

According to MFD subsystem guidelines, using hard-coded IDs maps all cell
IDs to instance numbers, which can lead to device naming collisions in sysfs
and driver load failures.

While reviewing the file, I also noticed another pre-existing issue in the
parent driver:

[Severity: High]
This is a pre-existing issue, but the parent driver exports bespoke accesso=
rs
for child drivers. For example:

drivers/mfd/rz-mtu3.c:rz_mtu3_shared_reg_read() {
	struct rz_mtu3 *mtu =3D dev_get_drvdata(ch->dev->parent);
	struct rz_mtu3_priv *priv =3D mtu->priv_data;
...
}

Does exporting custom accessors like rz_mtu3_shared_reg_read() create tight
coupling between parent and child drivers?

The MFD guidelines indicate that custom parent-child accessors make refacto=
ring
fragile and can lead to silent use-after-free bugs if lifetime mismatches
occur. Child drivers should prefer using standard APIs directly instead.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260327192425.4382=
63-1-cosmin-gabriel.tanislav.xa@renesas.com?part=3D4
