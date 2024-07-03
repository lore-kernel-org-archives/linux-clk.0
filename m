Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0D74964E;
	Wed,  3 Jul 2024 23:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720047737; cv=none; b=j9GblyqmqkSKR0Y8vAVRM0vC/axNNC920wh5yf9Mg3y58J7QyG56zmZL2o6VpW6/Pwc0mPp5pTOQE8SR4XF6AhVJaNe6f6jJSs9STINmZNdwVMN9HWIoX+dMoKHXWQW3MGgqY1ZG+vOwG54vHDM0MDSCalqZzjNqEAcORP64EI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720047737; c=relaxed/simple;
	bh=323AARVAbsuqgisnRvoVpG6coTMv5pU6DvWTb8N8kDs=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=KH1pt8dIIEGbmgDnt6CnrwIqAVcyZKE/Uc3q87aHYNsxW7wkwteFpeQsrbys2TOa539BhLo8qQevRaMKybUZNgxedaI/JVYUJzpWex8ijrjn3BdUqUD8b8MQjSm+3QsLA1HLE4TnojqFKWRttLgutbs9bdREifhsDsLBYaW2ReA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SyW7zLRQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SyW7zLRQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39878C2BD10;
	Wed,  3 Jul 2024 23:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720047737;
	bh=323AARVAbsuqgisnRvoVpG6coTMv5pU6DvWTb8N8kDs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=SyW7zLRQqEUsF3R7njKMze0tJN6sYAo2v3HfdCpIhTKysCzrL4GfENdHiWwE8dNMD
	 wpI9kxWE9iFgKz74LTQQv7D4FaqQHsi9XbIOP6/SvmzrJxbL6ScbaC/cFT8AZIXFzq
	 NRAaN3muBi4sVDM30qmdX4gdNcMH5MQQ9vo4a5XuvmGq6b5vQAjLjn0FAimCWjbvER
	 69/S9sZvWykTB6EsjfwWTB68SXYyXxQa8iBLQe1hNNiKRudLeYZ157U2Ln+nG6G3cH
	 u8JU5G5yo196FznjoasDSsIaYmzbKEag9ARgW7RhGWQFr6QGxcpMizQw2I6aQDobfL
	 9HI9Mp+N/ewyA==
Message-ID: <dc00b9daafe6a88ffaaaf4aace29e136.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240703105454.41254-20-ryan@testtoast.com>
References: <20240703105454.41254-1-ryan@testtoast.com> <20240703105454.41254-20-ryan@testtoast.com>
Subject: Re: [PATCH v2 19/23] clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>, John Watts <contact@jookia.org>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Ryan Walklin <ryan@testtoast.com>
To: Chen-Yu Tsai <wens@csie.org>, Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Ryan Walklin <ryan@testtoast.com>, Samuel Holland <samuel@sholland.org>, Thomas Zimmermann <tzimmermann@suse.de>
Date: Wed, 03 Jul 2024 16:02:15 -0700
User-Agent: alot/0.10

Quoting Ryan Walklin (2024-07-03 03:51:09)
> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/=
ccu-sun8i-de2.c
> index b0b8dba239aec..36b9eadb80bb5 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> @@ -7,6 +7,7 @@
>  #include <linux/clk-provider.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_address.h>

What is this include for?

>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
> =20
> @@ -290,6 +301,16 @@ static int sunxi_de2_clk_probe(struct platform_devic=
e *pdev)
>                         "Couldn't deassert reset control: %d\n", ret);
>                 goto err_disable_mod_clk;
>         }
> +=20
> +       /*
> +        * The DE33 requires these additional (unknown) registers set
> +        * during initialisation.
> +        */
> +       if (of_device_is_compatible(pdev->dev.of_node,
> +                                   "allwinner,sun50i-h616-de33-clk")) {
> +               writel(0, reg + 0x24);
> +               writel(0x0000A980, reg + 0x28);

Lowercase hex please. Did the downstream driver have names for these
register offsets by way of some sort of #define?

> +       }
> =20
>         ret =3D devm_sunxi_ccu_probe(&pdev->dev, reg, ccu_desc);
>         if (ret)
