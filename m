Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA72134A9;
	Sat,  6 Jul 2024 04:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720241327; cv=none; b=rfVyV/gNOLNNyZ9hQzYtqMjQKMs/SAFUMeVQWYFiaAYrdyXA3PAIlJYPQRowmjGAkJ7eRfBYvphmJVi1YOSux8wgP37vymgZHAGMy42rR1RVIQPt+eBLPFmGiTca6KnULN2oh6cdzPCo/wDzmzn2i7/ipma+EAOsGaFsoxC3wmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720241327; c=relaxed/simple;
	bh=13EXoUAPq38Cmaa3H/MBeovfbKWJYnIG97tCkbnyKZs=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=QVHlZIeyXIzIMU/5FgYOWl/+xvZvBbRnAxxiOEU7EcEM6CfQRIO3/RrAO4ws1VhCPQsZtNP8uxEMOdujHdJlIs42wbBDftkLOy+tfw7qULQL12wrfCJnVQAxPYJ2fUpEJBXC8nsfDyXSSRT6QJ4kNZgQWy5qCVRu3uiZdHbp6Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lESmbGVD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lESmbGVD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBF37C2BD10;
	Sat,  6 Jul 2024 04:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720241327;
	bh=13EXoUAPq38Cmaa3H/MBeovfbKWJYnIG97tCkbnyKZs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=lESmbGVDMqXRU6rKjwgbcYKIlx2y+C9Lxjl6cPb+GfjTdeGkvYFj38pXSAt79OHIj
	 t7xSxAM9n6sbwsv1x+L9u2JzvI1hyLmWuXUhhb2hYIVeIZzZpWCaR2t4aEMqSEBfsT
	 1slxt7TOuTEDjWzOkaV22IEsPqWFNC14+F29hjN7YZV/dKu4KVL2f8g09uTiSs4oaT
	 rfhEyi4al9FLz3h7iIkJGdjkupatGAyr39OiSvzCLy2I/RIh5osMkXEkUF0q0lNYnv
	 Et6wf2LXZ2l4pHZY/kc/l3lErNf/xTXAZVVIxmcgulemnALe3nKHG8dxtYnuYur9lz
	 P4wjBQSSuS10g==
Message-ID: <0986ea357075df5779f4b9cd90e298cb.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e041466e-cfdc-46db-ae83-dcc04ed1af42@app.fastmail.com>
References: <20240703105454.41254-1-ryan@testtoast.com> <20240703105454.41254-20-ryan@testtoast.com> <dc00b9daafe6a88ffaaaf4aace29e136.sboyd@kernel.org> <e041466e-cfdc-46db-ae83-dcc04ed1af42@app.fastmail.com>
Subject: Re: [PATCH v2 19/23] clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>, John Watts <contact@jookia.org>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>, Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Ryan Walklin <ryan@testtoast.com>, Samuel Holland <samuel@sholland.org>, Thomas Zimmermann <tzimmermann@suse.de>
Date: Fri, 05 Jul 2024 21:48:44 -0700
User-Agent: alot/0.10

Quoting Ryan Walklin (2024-07-05 01:39:15)
> Hi Stephen, thanks for reviewing.
>=20
> On Thu, 4 Jul 2024, at 11:02 AM, Stephen Boyd wrote:
> > Quoting Ryan Walklin (2024-07-03 03:51:09)
> >> +#include <linux/of_address.h>
> >
> > What is this include for?
> >
> for writel, however have confirmed this should instead be #include <asm/i=
o.h>, will correct for v3.

Include linux/io.h then.
