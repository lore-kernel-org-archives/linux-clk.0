Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1788112C499;
	Wed, 14 May 2025 15:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235273; cv=none; b=h1JUO93m+R03NQtbbm8u4BVKnzwLdYwsOP/e18gi3ugIWC6aoxyysi6B+53e3wiez7KqIbjTilP7r0Ts4/Q235/PBAZwmHP6ZVV/ilnB+nYDqqsS6OMHiuo8zA/gq1FqblqPeAwL0L6YIZRgDPtlxfRilgWGYXHVczjRQ+DxsKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235273; c=relaxed/simple;
	bh=Je7z9K7ymRrYfxtdg0xKNmBIQNr0pJcc9qkLjyd7sDI=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=Z0uBE4C559+LYYOrkQ0MWwjhRZnLtV4pYruxdvbea4CIShHuwPcDyL7GfY2BrC8CIgt4ZfCShAfCJxNXc6byhHprPnZOSm2vZcZAAvxOFJ+6A9adyllqQTOM6oryutJ99+2SaGwjKcJyG7Q9/4lmaAl05W6N17ajSkkpmbArDok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KAVtp2mj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KAVtp2mj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D76F3C4CEE3;
	Wed, 14 May 2025 15:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747235272;
	bh=Je7z9K7ymRrYfxtdg0xKNmBIQNr0pJcc9qkLjyd7sDI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=KAVtp2mj5jVTvUPkfQvXVYs5GBS/tfo0+4jmu/du+cJOJe816t7PMik1ZpRyi68aX
	 o2aZMaDoLKyhncXAMp8odvjJpLxnlc7yVwYcZm20rtV/QCKI7zfhlM2ts5xzsy0ccq
	 dYUi4qYrvP1WSsgqUZ4cWYiKQZZ4L0T9+jVtMUTy3XYYhWo/U2nTN6qBi5VnJWCq3j
	 Vq0RX9/KG/qagXke2tspF1B42xo0ONN0DqFXBn6N0YXFc2FQCoTCdU/U4Yhej1HOEo
	 qST+5BBXFrMOBCymjT6Xftdn959wvPiEqbXZDn6B3AmslVQkL/ENE5hjtXLIn0QD/K
	 Sj9GWsgrKK7rA==
Message-ID: <4d4c8f0ec82bba6bea02dd2ec5f2dc39@kernel.org>
Date: Wed, 14 May 2025 15:07:48 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Ryan Walklin" <ryan@testtoast.com>
Subject: Re: [PATCH v10 11/11] drm: sun4i: de33: mixer: add mixer
 configuration for the H616
In-Reply-To: <20250511104042.24249-12-ryan@testtoast.com>
References: <20250511104042.24249-12-ryan@testtoast.com>
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

On Sun, 11 May 2025 22:31:20 +1200, Ryan Walklin wrote:
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> The H616 (and related SoC packages sharing the same die) carry the new
> DE33 display engine.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
