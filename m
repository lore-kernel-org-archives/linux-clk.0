Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31FC1C8621;
	Wed, 14 May 2025 15:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235304; cv=none; b=pIYV3bVHJv/fPCA5DjoqwNVajAWRL7jkIgkex3lsMTLTAHfaVJEersOqzHmLdC+DMfpTGFpqaPQXHa439104HZQW+Wy6ikfgLWPYUfm91omLiW1R1GQwyunsxPsjgSqEUXVLaIjUkHXIz0Uu+9/ohbs3uHC6RHo/c1DVmdiZiUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235304; c=relaxed/simple;
	bh=NwS1B7xosoDUO5tvEbjazSqGCbiVpg+Ub8mt/kAm3Y8=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=qa+CTFZI4uJZRkqAG2Gp8Z8XDDyqnTDlSbQNQvrV1AOk9nkef3oL1MyHS8EUO9mo7Y7DWhhiQeNrzMa6yWIEn9P6bqbItiza+mJx8rmsGll7s7XHPuT6brKvVitglDmEmzErT4W1+fFfhHKbA5vtzsbhWfeKrKYq8GhdnOOiv6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aWN/WMdW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aWN/WMdW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B9C5C4CEE3;
	Wed, 14 May 2025 15:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747235304;
	bh=NwS1B7xosoDUO5tvEbjazSqGCbiVpg+Ub8mt/kAm3Y8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=aWN/WMdWE1PCBthnaJXqUMGe1aMIEUcwedLYmMvOqp3gLpWVWDULMhgOdOssGYL7F
	 Ux6eqGHwcD25ra82uYyaDFCffC2Hjg5eRVBd8Zjg5WPp5nERBe0jZ9HNwKk1CGWsmu
	 uRP850sK2HnKUiT6TA1rchg/P9bA/ZNZwPV3d9cJwyNkUUVEXK6YX68PF3sF/63PnW
	 s2YT/hITmGfEmg5iRSqgvGnZ7RwFDACT2KJDDnzuxEi3qMDTccfiM5mzq2xtlG7RQf
	 JURaUBMP/w/k11jm6RWzkMUlRkrrZGsQu0rLJkL6WhPF4xn3EpzhKYLRj6brxaJO5k
	 KVUXH2Uc2g+VQ==
Message-ID: <b628554bb2ebc2e0983bd904b04d790e@kernel.org>
Date: Wed, 14 May 2025 15:08:20 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Ryan Walklin" <ryan@testtoast.com>
Subject: Re: [PATCH v10 02/11] drm: sun4i: de2/de3: refactor mixer
 initialisation
In-Reply-To: <20250511104042.24249-3-ryan@testtoast.com>
References: <20250511104042.24249-3-ryan@testtoast.com>
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

On Sun, 11 May 2025 22:31:11 +1200, Ryan Walklin wrote:
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> Now that the DE variant can be selected by enum, take the oppportunity
> to factor out some common initialisation code to a separate function.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
