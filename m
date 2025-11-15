Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE95A224F3
	for <linux-clk@vger.kernel.org>; Sat, 15 Nov 2025 17:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763228699; cv=none; b=eSNodxdMjNfkgZ7Bya65KFzAFX8l2P4ij0SJ+Sssh+OjM1nb1A8iA36UiUcpJwIeBFBKQRLAa/wC6ln4cfr3hJfS3hoPrTjJlXTyTpvbyPzcZxfidJ1zFeYjLO9BJ43vXXakDmr3ZCRmDxGCm13YmM1CRk0AnY+y8Rx1LDBUAMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763228699; c=relaxed/simple;
	bh=s+S9pW5x//ou7X1wP3bi3A8Ps+6qeGc9acdcWBpHbU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nvZu0pNK2eQywI0kisCOrJllE+yVvbwdl+212PTWifA+KndJOpDe4E0PbB4gICKLC6Oq056bk2DB5Eafgec8TKQ6HOt20fRUocvjvZNsRSuyiHitEZfsUdgrYHHxo6XkqrBh+3EkztShU05BqL85Z2sp+y0LhbiJ7MIldkDgFv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b737c6c13e1so126537666b.3
        for <linux-clk@vger.kernel.org>; Sat, 15 Nov 2025 09:44:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763228696; x=1763833496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iS8st6S4NEhfwQi2ADWQ0RHyYWa8wB83L+ih+AMC2co=;
        b=UXMfvfsHYyhtlzfM/4bZBVGcY4ic8ogO+N+ZIJNBJJVcPL6OGOjUkc+e/jaY9V6hBu
         H4RR8hpv/Vo4ExqJdBEuZbQV81kDpeYTbjww4ohYDchT69oVS1RyYFYcIbH/ZlmfP42X
         M9hrkmEPP3jpHpqkbZ/7c7qtPC8e0i7L1UFNasTvMhiEEn8YlgdsBVw+3M8Cd7O1Meau
         u7he+J+PnBZ5c5GqSFD2yTcH9jPqbnRq0LFoZspX0syFTuUpM1/LtKRsYGBm0tlUUmhA
         EwSbYbzcc+aSZ6ZMvJziWHIngYmof6ENG6ZDN5F3wi9OESQBPci5UvDV72ZtYLpm/1lQ
         vKgA==
X-Forwarded-Encrypted: i=1; AJvYcCVScayPKA2a6+u1dAyK0AZv6wOr6IwN8lsnvyEkm5HYiWmOiwBhihAs8zQG5WsbSz1ndPurAJEgTEw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFKqpCYmHn35lQtt20DFCA/uExuMv4gxjkgAmjRhqYwVn94dyY
	b94VCNJj7x2FvRF4TbPZDx0v/oEvO7sOE+5PsAGekAu+5OMgL7XRG2DcsN3uisSY
X-Gm-Gg: ASbGncsnqwyxK3bzWTV1SYqHfzbv7Ewx3Wi/mfvVR4XzhhzNcUQONlGqNzm0iwttAxX
	yzmMog71jc+PGqOQ2ssI5IeShpuTxc/2ese8c2Gvp0L9yrecmD/J28ZBGmFNUvZ2SYc3MAtHP1i
	kRcN0dcKeKLGxx/XVYlfkDHGzAVDdHr0dzy8eyTd8L4egYuhz4GTf8OOz3hNJTQDQASHdKzYC4v
	3DotgWD8ZiSlIpph6+iKw5IsTUp+pwlonvP8sYz94/iXahyZ1TcjCOIQgIFF3aTqVIzoRvNDkBP
	BGbRUykumY7DpqozZC/7fLhoq6IY9aRCuPLCCFd2ov9i1ry93WgYwA4eatljoqzRezHWCdD1CaN
	HcrDQZMKdERXVp/Mm3sQMP6Ply0kK0q505fdi6ipFqZ/OfoJlNJU2EhPVynFUd2TrXcQ8vc0heQ
	6fd4R8ep21MGwN2yCloVHRfuj0vMtJ
X-Google-Smtp-Source: AGHT+IGLlqhPeHYBjbS2b2I2C/QeXF768QviVRtQApjJFbwKRtMTWUEFP6krUSu+ZCMEvFR6iv11OQ==
X-Received: by 2002:a17:907:7207:b0:b73:7325:112d with SMTP id a640c23a62f3a-b73732513dbmr571280066b.35.1763228695325;
        Sat, 15 Nov 2025 09:44:55 -0800 (PST)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b737c38c619sm221140866b.1.2025.11.15.09.44.55
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Nov 2025 09:44:55 -0800 (PST)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-640a0812658so4905039a12.0
        for <linux-clk@vger.kernel.org>; Sat, 15 Nov 2025 09:44:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXvyynbAU00qkEUm+H2bFK8+Dhh+GbQrIW3IEweSVofG4S7ABiq11icWfGhYuLGJ5ZXb9gFiifmndc=@vger.kernel.org
X-Received: by 2002:a05:651c:41d5:b0:37a:4c29:3a90 with SMTP id
 38308e7fff4ca-37babac1aa5mr18627811fa.0.1763228257141; Sat, 15 Nov 2025
 09:37:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251115141347.13087-1-jernej.skrabec@gmail.com> <20251115141347.13087-4-jernej.skrabec@gmail.com>
In-Reply-To: <20251115141347.13087-4-jernej.skrabec@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 16 Nov 2025 01:37:24 +0800
X-Gmail-Original-Message-ID: <CAGb2v64xOrLzPYNOfFNFfPckR8EUF_U6xY0J_a3G7b0Ymb4OnA@mail.gmail.com>
X-Gm-Features: AWmQ_bmhcY2-o8gJRo_3ltGzVFP1TpTD5csESojSsWw724bLMcf3HNL8i2V4XHQ
Message-ID: <CAGb2v64xOrLzPYNOfFNFfPckR8EUF_U6xY0J_a3G7b0Ymb4OnA@mail.gmail.com>
Subject: Re: [PATCH 3/7] clk: sunxi-ng: de2: Export register regmap for DE33
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: samuel@sholland.org, mripard@kernel.org, maarten.lankhorst@linux.intel.com, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 15, 2025 at 10:14=E2=80=AFPM Jernej Skrabec
<jernej.skrabec@gmail.com> wrote:
>
> DE33 clock pre-set plane mapping, which is not something that we want
> from clock driver. Export registers instead, so DRM driver can set them
> properly.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 53 ++++++++++++++++++++++++++--
>  1 file changed, 50 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/=
ccu-sun8i-de2.c
> index a6cd0f988859..2841ec922025 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> @@ -6,9 +6,11 @@
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
>  #include <linux/io.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>  #include <linux/reset.h>
>
>  #include "ccu_common.h"
> @@ -250,6 +252,41 @@ static const struct sunxi_ccu_desc sun50i_h616_de33_=
clk_desc =3D {
>         .num_resets     =3D ARRAY_SIZE(sun50i_h5_de2_resets),
>  };
>
> +/*
> + * Add a regmap for the DE33 plane driver to access plane
> + * mapping registers.
> + * Only these registers are allowed to be written, to prevent
> + * overriding clock and reset configuration.
> + */
> +
> +#define SUN50I_DE33_CHN2CORE_REG 0x24
> +#define SUN50I_DE33_PORT02CHN_REG 0x28
> +#define SUN50I_DE33_PORT12CHN_REG 0x2c
> +
> +static bool sun8i_de2_ccu_regmap_accessible_reg(struct device *dev,
> +                                               unsigned int reg)
> +{
> +       switch (reg) {
> +       case SUN50I_DE33_CHN2CORE_REG:
> +       case SUN50I_DE33_PORT02CHN_REG:
> +       case SUN50I_DE33_PORT12CHN_REG:
> +               return true;
> +       default:
> +               return false;
> +       }
> +}

Since the registers are contiguous, I think it makes a bit more sense
to use the .rd_table and .wr_table. A bonus is that the check can be
inlined in the core instead of calling a function pointer.

> +static const struct regmap_config sun8i_de2_ccu_regmap_config =3D {
> +       .reg_bits       =3D 32,
> +       .val_bits       =3D 32,
> +       .reg_stride     =3D 4,
> +       .max_register   =3D 0xe0,

None of the registers past SUN50I_DE33_PORT12CHN_REG are accessible,
so we should probably just put that here.

> +
> +       /* other devices have no business accessing other registers */
> +       .readable_reg   =3D sun8i_de2_ccu_regmap_accessible_reg,
> +       .writeable_reg  =3D sun8i_de2_ccu_regmap_accessible_reg,
> +};
> +
>  static int sunxi_de2_clk_probe(struct platform_device *pdev)
>  {
>         struct clk *bus_clk, *mod_clk;
> @@ -303,13 +340,23 @@ static int sunxi_de2_clk_probe(struct platform_devi=
ce *pdev)
>         }
>
>         /*
> -        * The DE33 requires these additional (unknown) registers set
> +        * The DE33 requires these additional plane mapping registers set
>          * during initialisation.
>          */
>         if (of_device_is_compatible(pdev->dev.of_node,
>                                     "allwinner,sun50i-h616-de33-clk")) {
> -               writel(0, reg + 0x24);
> -               writel(0x0000a980, reg + 0x28);
> +               struct regmap *regmap;
> +
> +               regmap =3D devm_regmap_init_mmio(&pdev->dev, reg,
> +                                              &sun8i_de2_ccu_regmap_conf=
ig);
> +               if (IS_ERR(regmap)) {
> +                       ret =3D PTR_ERR(regmap);
> +                       goto err_assert_reset;
> +               }
> +
> +               ret =3D of_syscon_register_regmap(pdev->dev.of_node, regm=
ap);

dev_of_node(&pdev->dev) instead of directly accessing the member.
IIRC this is the new preferred style.


Thanks
ChenYu

> +               if (ret)
> +                       goto err_assert_reset;
>         }
>
>         ret =3D devm_sunxi_ccu_probe(&pdev->dev, reg, ccu_desc);
> --
> 2.51.2
>
>
