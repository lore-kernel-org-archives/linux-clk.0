Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668441CEAB2;
	Wed, 14 May 2025 15:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235299; cv=none; b=Y+BMeVGvjiXYZYHgn7NHNBqXTSQ4Ghw3aqJjKKzjo/W4ENKBYlxhgZr0O+ftq0JgxXicQRLzID9PizJZCGQjZC6KrmeeG7vhKf2ecO09VQ9aqubU16WV3ljFqAQVR1CUU8k8eNCiNL7J4aJQFYCDuzndZpx2stMNQYUaIdBse9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235299; c=relaxed/simple;
	bh=eoORac1gBP0K24jAQNXvarZwHndAx8L/gcj9v3uvkaE=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=ElEdqOY9MwUaSz6lqr786BSaPWksCHekukt6nB6LkQAxUHRwNLa9KktyJlZV6yJ8eMJMZcYAn0pMnvPR92Qh1F+o6kw2mX9xONj+S3MbcLyZWhCV6P88g1gylTvluhZ97ki1JtroFncN35bv7Y2rpMm7bJ6demFsSYpL9JMSt1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gtmGolZz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gtmGolZz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DACAC4CEE9;
	Wed, 14 May 2025 15:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747235295;
	bh=eoORac1gBP0K24jAQNXvarZwHndAx8L/gcj9v3uvkaE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=gtmGolZzqjU/IW/AW8Fo0tSG9niKnfJv/4iEDRupVvGE2fi1Jf7/B4+wfpehDhZqY
	 37EjgzJEIAp1KAXH3cBoaOQlgKe1wCxiayDTft+4lnwMB3A0hVie2UEybV9QbTmhBB
	 DhMFcVmtk9qWHYh04tG7wxdvYbLX5vtbUOU1+LJCBgsHxkhCPxBI9yYmvJ1PPXToXD
	 GWW/lFUMcfzWOgVoP0I/Gje5cTMPdFY0Ldbe9t4WZa1MDM24YveCrkFVAVc7PwPAFf
	 Z+2btScigTXgXV1PpG4b8MHctVfXvbFfJ++r/W0ery9PLDmXNmR+TsWtWEiC0Qw5re
	 6bnjqdNJ3kvGw==
Message-ID: <9c56a24fed529c79f5946f7ddf743b98@kernel.org>
Date: Wed, 14 May 2025 15:08:11 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Ryan Walklin" <ryan@testtoast.com>
Subject: Re: [PATCH v10 03/11] drm: sun4i: de2/de3: add generic blender
 register reference function
In-Reply-To: <20250511104042.24249-4-ryan@testtoast.com>
References: <20250511104042.24249-4-ryan@testtoast.com>
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

On Sun, 11 May 2025 22:31:12 +1200, Ryan Walklin wrote:
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> The DE2 and DE3 engines have a blender register range within the
> mixer engine register map, whereas the DE33 separates this out into
> a separate display group.
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
