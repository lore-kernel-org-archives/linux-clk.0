Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABEF54DAD6;
	Wed, 14 Oct 2026 16:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995557; cv=none; b=lZKijp56k89bkQ21rbJEUvdz58hcuPkHlZJSiViVSDeOO9geLmMNzZBeDwOKhF5FegH1FVN6kcj0UGXqnvkUHYjORGjQooJ3OkxWh+Ti3xSUUKtK39EzwxO8i1Zc0RX4OP1bXBGjq+/c3KZHdQF5MHAT1pNhh79yV6mNMRdGh1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995557; c=relaxed/simple;
	bh=0wGx9WuB0zVmNNCMfYecWTe0N0DvKj0p9f2QogTgOtY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=kwRWFjj076X2HZkhXLpoX4RK1uK6p+I9o/kW1szA3s0YKhCbzrfQZ5IekIO6uxwW3g9fxp7PX8sq5aEpvJ/8yjPpUX9vnXzFgU0I6zKrwmAMkO5S+2PBIm1U8tHgBgVgZ3Ek48oYFgpRz/bQS5BQuGv25N1WRzWYmaFv5ou75ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d7rbNsmt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d7rbNsmt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A07051F000C4;
	Wed, 14 Oct 2026 16:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791995556;
	bh=WugKqNWDagJkCYw+gyR9YtW0vgdFoHCnPeWVVs+DThc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d7rbNsmt0QRNMrSW07NFzav91k33a4AeKdIW/lso/Kz9nHKcUJQEDEnBMjFVdte3A
	 6N64q78dr0VXmZEtbwIzoxE63I54PrV0lzPjCiOo9wZ9grShrzGlvDIDVk7uwWshIy
	 /zcdE9Of0u7QTNA/kZsyu8hOp8DoJhJXz6KSWf9m5CP2bzxTPgyhG9cdF5ChYJPtpL
	 AQrOis453K88sHv3a9H08Clbi9037is9wIf5EsjXtrf+9fEza3py4pHWxbjh5houQA
	 d8rXJvSCtGDVlD2a4J5HlqyuOkvkTkMFHVEHWhBsEw7skh5dPEo2t29n9eOTUo4Rxq
	 gdQiMDGwCaeKg==
Message-ID: <sashiko-outbox-171534@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/5] drm/panel: add Novatek NT36850 panel driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014-sdm845-hdk-v2-2-6d0b4b42f267@oss.qualcomm.com>
References: <20261014-sdm845-hdk-v2-0-6d0b4b42f267@oss.qualcomm.com>
 <20261014-sdm845-hdk-v2-2-6d0b4b42f267@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 16:32:35 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/panel: uninitialized dsi_info causes empty secondary DSI dev=
ice name
--

commit d78556555a8b667c80856e68aa43c5f0f311c5d4
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

drm/panel: add Novatek NT36850 panel driver

This commit adds support for the Truly WQHD dual-DSI command mode panel
using the Novatek NT36850 controller. It configures power sequences,
initialization commands, and secondary host registration.

> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36850.c b/drivers/gpu/=
drm/panel/panel-novatek-nt36850.c
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36850.c
> [ ... ]
> +static const struct panel_desc truly_wqhd_desc =3D {
> +	.mode =3D &truly_wqhd_mode,
> +	.bpc =3D 8,
> +	.lanes =3D 4,
> +	.format =3D MIPI_DSI_FMT_RGB888,
> +	.mode_flags =3D MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM,
> +	.init_sequence =3D truly_wqhd_init_sequence,
> +	.is_dual_dsi =3D true,
> +};

[Severity: Medium]
Because the dsi_info struct field is completely omitted here, it is
zero-initialized by the compiler.

> [ ... ]
> +static int nt36850_probe(struct mipi_dsi_device *dsi)
> +{
> [ ... ]
> +	/* If the panel is dual dsi, register DSI1 */
> +	if (pinfo->desc->is_dual_dsi) {
> +		info =3D &pinfo->desc->dsi_info;
> [ ... ]
> +		dsi1_host =3D of_find_mipi_dsi_host_by_node(dsi1);
> +		of_node_put(dsi1);
> +		if (!dsi1_host)
> +			return dev_err_probe(dev, -EPROBE_DEFER, "cannot get secondary DSI ho=
st\n");
> +
> +		pinfo->dsi[1] =3D devm_mipi_dsi_device_register_full(dev, dsi1_host, i=
nfo);

[Severity: Medium]
Does passing this zero-initialized info struct to
devm_mipi_dsi_device_register_full() cause a malformed sysfs representation?

The MIPI DSI core copies info->type into dsi->name. Since info->type is
empty, it results in an empty string as the device name, creating a broken
uevent modalias of MODALIAS=3Dmipi: with no actual name.

Should truly_wqhd_desc be updated to include a valid string in .dsi_info
so the secondary device is properly represented?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-sdm845-hdk=
-v2-0-6d0b4b42f267@oss.qualcomm.com?part=3D2
