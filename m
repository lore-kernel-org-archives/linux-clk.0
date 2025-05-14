Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4A31CDFAC;
	Wed, 14 May 2025 15:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235289; cv=none; b=kR1i31/zR1mjUcb8dGSKHU/eVqglfERHT5z9gzjnouDh9MfplLveyb2jHrXfHWUQaIWFM9La7GiJd6G1KNpC8+0DokhSXI3kXtMjNymmbyOJnso4FMc7oKPef8iwwRvJpkj6owrsEURgN4uVK744rjpnpak51T9qgidb8nV5jew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235289; c=relaxed/simple;
	bh=FwP8uryXOsUK+TKg53CoKmdnuxln2EK5xDiRjRLSGZI=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=AKSLgoLnJjIowBFw8TAPp65+5mmgwSu7/pQqw4Q123krusp2q4IV6E9JeBy8Ux2+fnSj8BZL058Viofgg76aGhNm9oiTBkdyW3AnV9aTrtqKEOBwrBJEnud8TmQg0MOpEuiahyLQ/zaAkhuGk/8IRs+EbYZlhb9h8kEHpLKOdQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fuXPIW9/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fuXPIW9/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F0EFC4CEE9;
	Wed, 14 May 2025 15:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747235288;
	bh=FwP8uryXOsUK+TKg53CoKmdnuxln2EK5xDiRjRLSGZI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=fuXPIW9/1iuCaAuWi6VNcHOkDoB306E14Fn2sjd4B0pwxFNwPbPEdIOs2/vRlAT2C
	 HxqyMfLwPgK06uYzoPSHWyPHlM87EZPnuH41UzxbrypLU005mSIO/F2/fH4GGnLBgM
	 Dpv2kH09qWBsF/fTxi4sIlhmrhfAFUF6zpYnrACIHbkNXLUvzqbM/BVYU+R5IG4sFf
	 YXn98suvuLuOTm3geIRQd2fo9fIO7PJclsl1NObGC78/XjKa1fbDOI/0ZtTbhiHTjm
	 ZjOZUC+Z1u2xC66O8TzbRAaaDRhcHzgJVyc29vJXsAP+/l1V89I4Q6bxRYPQfkOdP7
	 79c1XND+SFiKA==
Message-ID: <8d835eecfcd7d7b4ef88d06b7bd9ed21@kernel.org>
Date: Wed, 14 May 2025 15:08:04 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Ryan Walklin" <ryan@testtoast.com>
Subject: Re: [PATCH v10 04/11] drm: sun4i: de2/de3: use generic register
 reference function for layer configuration
In-Reply-To: <20250511104042.24249-5-ryan@testtoast.com>
References: <20250511104042.24249-5-ryan@testtoast.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev, "Andre
 Przywara" <andre.przywara@arm.com>, "Chen-Yu Tsai" <wens@csie.org>, "Chris
 Morgan" <macroalpha82@gmail.com>, "Conor Dooley" <conor+dt@kernel.org>, "Daniel
 Vetter" <daniel@ffwll.ch>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, "Hironori KIKUCHI" <kikuchan98@gmail.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, "Philippe Simons" <simons.philippe@gmail.com>, "Rob
 Herring" <robh@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Stephen
 Boyd" <sboyd@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

On Sun, 11 May 2025 22:31:13 +1200, Ryan Walklin wrote:
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> Use the new blender register lookup function where required in the layer
> commit and update code.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
