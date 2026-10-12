Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F27B41DED5
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 11:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791803907; cv=none; b=kwbQ5SWwgbghygv8CGFFY6qd68gx02DxKUgJC9boT1h9/foH6sSXQip9zSb8Q8uciWKhVm95xMuYe0mq0xHDbec580MMvtyIN4z1vGRHyTS4M8ECoXYmCMtNIlqG1VhDC3TuKMCeHK/HySBSYes9yI62w9MP/qNb+miPgzgERaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791803907; c=relaxed/simple;
	bh=20jkYx8ujzIk6V8EjzGICADAn/dtFkP5yiHUM8K7JU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MdcMXE/5JX+dVVH0ClMx7f4LQAaF/gmV24UugnQ8LDUdS5W0nYvBCG/mXaa+rCD4Ri70X4EbHUmRzRNlAaBvKyiPqTvYP53UfmqqQsVBl4w9eRgss6uMWhobqXzTkqZYM2wRddeD9nT1R0YnVuo+LXvWAFelVVXydovYnReE3rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Bnf5mhq0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Bnf5mhq0"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a01933b584so15358105e9.0
        for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 04:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791803905; x=1792408705; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ojX3hkGfX4or6LXO9A1AxAUN8SUQm9XePAgC0Ad/Cog=;
        b=Bnf5mhq0tNnn4pixhxuNbrwY7dD+z5pbFI0pSD9ORZa0KAX56bMZTKzMLGJHKvAVSI
         dCdegE1rufjmxQnHpLM+FNp6LD6lr5jvhWtGLruHI/U2ErYJgdEEkB0r3h/73OzkNU+o
         8fT/iJKth2sda1UiO+aBJesZDMyYYKRLhfH9HdJuCXRQWG/EqrhbNsd+P/OwDhXDvpI6
         uRDK58jaYmzbsdHKeJHxESER7hVFpuRHFhsRjBivv0dybDCumoAa8Q4xtMApg89+2BW8
         8nHduOJYcqDPr+My4ipcatjhFBr8DJhRer5gXh8FnRfGDrwB73R2XnWfqjH+ClAROMaY
         lmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791803905; x=1792408705;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ojX3hkGfX4or6LXO9A1AxAUN8SUQm9XePAgC0Ad/Cog=;
        b=YNEg2tLWenAvBq5D0M2ospPpqfZT0CbOQAfMW4ml1AAG8Dekd3NQjL8RIGL1v0vgeN
         b6oDwYtNk9aDlaroseosgtyo6FVAxN34lzB96GO1x9+QQdx88W9XImnxTersWAaXzngi
         2uWPuw45VZjiSzdtB+d7G2vOYIXT1G3CD4UGg65dl+I9gwDWjI2u9vp+8XKyfEPbzZrc
         7EBV+t0ysvCAZ+LG0dZ/vgzEYXJ7g9clRyqO+9V8NUiGRKbSytwpSF5InfDOwP8v2wtz
         GJXJUx07+AiXatpf41TJReimmSUe6N7odbfi7Z1VtwcYAHD9rUouhQnrcKd/CarCVwuD
         o1TQ==
X-Forwarded-Encrypted: i=1; AKwUvBzggM9R4lqEYGntKQ9DaZLwJyoApNp9LVrMnBxHhuSdahEpeQxPsXmh2oXjsuidfKc0bwj/cNOYt+M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcBZ2iHBJwU3GqZVTedju0Vrj569VjvL2y37FRgFgbKJQCEGfO
	NgjBSnpFKIx0kbaPeXwJsIPFH8zG7W9GgFlft4K1kWJzeJ01BTSK1V7N1elVAdDjeNA=
X-Gm-Gg: AYBFou2J53o+9TTZXunmKdGbgc6/FKbYWheUQOgVYd+W8X+dVvBtX2mqyL40Otb727w
	EdpEauVfynlE/sK5jmgzhzGnTDd9iFLoL9SCYHQZv+Hg5b+4qVeGF3G8EAYy1oasywD/SQLdgVu
	r/hY5fyJJZDGEkXzYIOrKbDEHd70UgOfenJhBbPJ52KRw17hOR3ALXDhVxWjmJHNxhBTzKRuaF2
	uMMUGhG6mkR+boIk/xsbE5KNjhRrciZfJkl5m5BwrImVK3zTxMVddEb4WMyqRJ1DWksN6/Nf03J
	zJiLCuYprN1gWZdcfkb//NCe0/obtiuAkNBxZJMHGM0hnsKJkBdPd+8EdlsWC9L3W5KiBqOifhn
	LKnjgHa9gI59KO68g0v2ixJul2odxfDlyBl1sCOtBzNvXknpRMSTIBxkbH46tumDfhzhsw8loDC
	2dX9a1Kqga3RhQeYt/xLVFBhxk7qpCveD5fFO8zvgpMWfvUDLFjUM2HQ0buH6PEUcLcha7qyJru
	mwNaONjoApeD5pXk8jCC0Gs4uI0xC3uLPnQ2tB4a1yvHD9Hx6rpzs537hfh0A==
X-Received: by 2002:a05:600c:6384:b0:4a1:7741:ec43 with SMTP id 5b1f17b1804b1-4a18e4b8966mr159157835e9.26.1791803904585;
        Mon, 12 Oct 2026 04:18:24 -0700 (PDT)
Received: from localhost (p200300f65f19a904ade4f69ba751c34c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:ade4:f69b:a751:c34c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a18bb68abfsm311754435e9.0.2026.10.12.04.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 04:18:21 -0700 (PDT)
Date: Mon, 12 Oct 2026 13:18:21 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Ying Liu <victor.liu@nxp.com>, Frank Li <frank.li@oss.nxp.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v10 5/9] drm/imx: Add support for i.MX94 DCIF
Message-ID: <aszBIkBXoFIkkeiL@monoceros>
References: <20261006-dcif-upstreaming-v10-0-bcfb28de0aae@oss.nxp.com>
 <20261006-dcif-upstreaming-v10-5-bcfb28de0aae@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cdga4qrbhoxcfsbx"
Content-Disposition: inline
In-Reply-To: <20261006-dcif-upstreaming-v10-5-bcfb28de0aae@oss.nxp.com>


--cdga4qrbhoxcfsbx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v10 5/9] drm/imx: Add support for i.MX94 DCIF
MIME-Version: 1.0

On Tue, Oct 06, 2026 at 12:22:00PM +0000, Laurentiu Palcu wrote:
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>

Please rely on linux/platform_device.h to provide of_device_id and drop
linux/mod_devicetable.h.

> +static const struct of_device_id dcif_dt_ids[] = {
> +	{ .compatible = "nxp,imx94-dcif", },

No , before } please.

> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, dcif_dt_ids);
> +
> +static struct platform_driver dcif_platform_driver = {
> +	.probe	= dcif_probe,
> +	.remove	= dcif_remove,
> +	.shutdown = dcif_shutdown,
> +	.driver	= {
> +		.name		= "imx-dcif-drm",
> +		.of_match_table	= dcif_dt_ids,
> +		.pm		= pm_ptr(&dcif_pm_ops),
> +	},

I generally don't like the effort to keep the = aligned in such
structures and don't recommend to even try it. Still more if it's
inconsitent from the start. Just use a single space before the =.

Best regards
Uwe

--cdga4qrbhoxcfsbx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrMwfoACgkQj4D7WH0S
/k616wgAm56cItlrtTGYJGQMifXXyKIZEbNaNh8obfuoDdC9KTfL6OrQDbETA8n/
83AtYbd6RkC4JP7NX3SK5DlSDS/oLGmxynxAfceKMBWsUcqR4oEpGee8ZRkIFMYn
BL355LaaGTv56+1iWN/tYDLNYYgKV+jwUYXmDJferAy0J0I1aTlYgEYMNoCJGGxb
ciaSMXRD1FzuAb3vpJpUvWltH2+boMSdeaKoj6ZblcP2sHWtw4UWN3b1YEcrSVcl
zMXusjBfMNf3S6BQ3GHOW5axtmRXjnPsqxXPCouSaEqqAahemWk+g7rA/4XF+Xax
302ZWP3FujxCr3/FFyysMyUncNGZnw==
=Kiiw
-----END PGP SIGNATURE-----

--cdga4qrbhoxcfsbx--
