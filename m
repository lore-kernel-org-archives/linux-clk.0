Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF993F88BE;
	Mon, 10 Aug 2026 14:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786372422; cv=none; b=Tb323gc45l3Ki2UZLESxj1pJuCKCQee47wPO1Aan870jhEBRc6/UFtJeiFFDxlLFTsq1dsO1wqYxWfAuff7rRGLPI3q2r/6CcqSrAMPCYaq67+fxw3IlAzXxi73CEOgUOBToEZR9USfmLjMYmtGtH5ZQEFLRl7kZ9RFsF4jpNRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786372422; c=relaxed/simple;
	bh=6Q1STfe2jMAZ0UhfQVEDdEhq2E/G0sJRHfRKIGSGV3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KiSceZOpDHFTyHkiidpRhWT8AY5gLBgZHSA7yQG5cZ8i4eU1rPOvIuo5gi6gELhF/gAdJGiSROKeavnnESk0nJzKkaTg2XGpZyObV9/2rTTDvnoxuFiq7YwiN90nYDx9prJ3gQOUREupWr0Wpdegaeo9YB9Bll+UKuoxqtckKdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q6eYx7au; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q6eYx7au"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 241771F000E9;
	Mon, 10 Aug 2026 14:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786372421;
	bh=hvqH9zZ0i4FPAUMO7qs3uRLITXvW0VP0smlftrvm8ng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q6eYx7auuQQBo0fTkxCZn47vcAUPbK53UbhiJTjVpgzAx4C7ES7Rh0RjFCmScVITv
	 pbSMZEkDr8HpmGzsnfXBW8kVdwTK2gUrTAUfoVfn/fJRK9ffbR5MWlQoeL/WIne6lv
	 CVSRnkHCT5k1Twnr66dVu6EM87yr2aPRvPXN1Bb6EmA2x6qDpur79/bDfieq5s83My
	 NiA3UwYj+eH9mfWgHJ9Kmy5HF4Lj0aj9Mod6WzEvBG5eJQPXO6KSAe1tMY2EV03Jk/
	 HeC+gL4wEh4XJ6CIxKsQeJd1nj6khJfip6BIq64yBLNSrKjYtpl9EjJQbYyFt5TU0s
	 VN4+deX82Opmw==
Date: Mon, 10 Aug 2026 09:33:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cody Kang <codykang.hk@gmail.com>
Cc: linux-clk@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	Haylen Chu <heylenay@4d2.org>, spacemit@lists.linux.dev,
	Michael Turquette <mturquette@baylibre.com>,
	Yixun Lan <dlan@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
	linux-phy@lists.infradead.org, Simona Vetter <simona@ffwll.ch>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Thomas Zimmermann <tzimmermann@suse.de>, Yao Zi <me@ziyao.cc>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Guodong Xu <docular.xu@gmail.com>, linux-riscv@lists.infradead.org,
	Paul Walmsley <pjw@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Brian Masney <bmasney@redhat.com>, David Airlie <airlied@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v2 04/17] dt-bindings: soc: spacemit: allow eDP/DP PHY
 PLL pixel clocks on K3 APMU
Message-ID: <178637241975.1573687.15895967704569553501.robh@kernel.org>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-4-327d7910bf71@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260809-k3-display-v2-4-327d7910bf71@gmail.com>


On Sun, 09 Aug 2026 21:14:13 +0800, Cody Kang wrote:
> The APMU's eDP pixel-clock muxes select the DP PHY PLLs as parents, so the
> K3 syscon takes two clock inputs the other variants do not have.
> 
> Gate them behind the K3 compatible instead of widening the shared clock
> list, so a non-K3 syscon cannot silently accept clocks it has no mux for.
> 
> Signed-off-by: Cody Kang <codykang.hk@gmail.com>
> 
> ---
> v2:
> - drop the redundant minItems: 4; four is already the minimum
>   (Rob Herring)
> ---
>  .../bindings/soc/spacemit/spacemit,k1-syscon.yaml   | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

