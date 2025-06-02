Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8CA54763;
	Mon,  2 Jun 2025 08:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748851214; cv=none; b=m5duDNFTLg+OyBBgTkDUn0Z7rY5mCL69fLWigLtS7qt0Zy3RdfOkYxfKGhT3gCr6Obmn74lk0j0HJk2csIwKfqaSyxBajtkknn8hKyKwN0pFZTM6eOkq6Qqb8fJ9HDy1ARXDMrKPmyko0mcuI39SnnpDGi9zkc4Yc1fcu/W9TQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748851214; c=relaxed/simple;
	bh=umrm4OPqCUR6IKXG+EjkwiowxcFgqtY7vo6Ql4O92rc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ysjt2PScpL/HFzxNRiJ26kn6slqs3ODL1VmH/bjlJuJ9VoimzHdseLIu/a3KxKxguatRZdnB+x7PFrjW6XErJFYFtgWCTZoXQKdC5dnaTp3pcOQps8wWqKALTiVej0jjDGpB0rncjILmRwdr/zV+Uh1+BTE+fuppmOKlXJDVwhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=igZtv5ly; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="igZtv5ly"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03E2AC4CEEB;
	Mon,  2 Jun 2025 08:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748851213;
	bh=umrm4OPqCUR6IKXG+EjkwiowxcFgqtY7vo6Ql4O92rc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=igZtv5lycita2pdB9vUCKQn5Ot2DDWRDKERLJ/3TdR9WcUbz3l4FEY91MH2aVk7uI
	 edvI/pA8tUlZMo4dAKcfrwiObxreKUQT0dGoA8oDU/N4/zwzLqIBV6A9WnOalg9qkA
	 9EPR9NPgJJxm+Y6DstkM0RFi+VYklNuZlrhde3ulzBaa3/jx2DfjN4CX//Rh/1ynCQ
	 QE+mm77FGxt8gapFwpn9Nnc/FjNo5aLqy45j+oZd8WS5JfZ36OolJe2nDEtG60thsD
	 EqnIqofYBnHtlea6WcL0RlcQyj+Lx1WDsRxAFepYHUySKK/jjNAIBQct6ELQFmJLYM
	 gTbTROOWoxawg==
From: Maxime Ripard <mripard@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v12 0/8] drm: sun4i: add Display Engine 3.3 (DE33) support
Date: Mon,  2 Jun 2025 10:00:09 +0200
Message-ID: <174885120812.425793.9126435244511372625.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528092431.28825-1-ryan@testtoast.com>
References: <20250528092431.28825-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 28 May 2025 21:22:05 +1200, Ryan Walklin wrote:
> V12 of this patch adding Allwinner DE33 Display Engine support. Just a single change from V11 to add missing documentation for a new sun8i_mixer_cfg struct member, and add Reviewed-by tags recieved on the previous version.
> 
> Regards,
> 
> Ryan
> 
> Jernej Skrabec (7):
>   drm: sun4i: de2/de3: add mixer version enum
>   drm: sun4i: de2/de3: refactor mixer initialisation
>   drm: sun4i: de2/de3: add generic blender register reference function
>   drm: sun4i: de2/de3: use generic register reference function for layer
>     configuration
>   drm: sun4i: de33: mixer: add Display Engine 3.3 (DE33) support
>   drm: sun4i: de33: vi_scaler: add Display Engine 3.3 (DE33) support
>   drm: sun4i: de33: mixer: add mixer configuration for the H616
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
