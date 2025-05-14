Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56DF8488;
	Wed, 14 May 2025 15:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235281; cv=none; b=WCQsewxbto7eopqGV6g9hN5biC6po7XG1IvJLxUtHfIBTGTvYPQl7lCzY5UFscyrscZ+BbUCwVrkifg+u5UI58WqMVZQbhcQHx0wzgXWbUPfKYcHUQRUCMGNnj1MxtG/QbSlgGa4WV2IjWj2jCOsbEiIoK5Ix277FD8vfZi22gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235281; c=relaxed/simple;
	bh=jMsr9BmmdCkE0Abau89NyQKZWBTl9u7x3Di10p0ErLQ=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=RysPra96Sh7tkQMBDBV0jSVCTLX/BBpnhKDdInW/w5Lv+Vbo7bPDosE3fn8SWYZOwMKiXe4CuyBSW5vriB0iT1qexuRWOhgvucZH9Nk3hwXLMJzK8Y6jQWu8ev9+IdbH5tJ84A7skB6uAwH5n0sgWCB1gVGA/L+YC0Kb/mfAm+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IrXsS288; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IrXsS288"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8C29C4CEE9;
	Wed, 14 May 2025 15:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747235280;
	bh=jMsr9BmmdCkE0Abau89NyQKZWBTl9u7x3Di10p0ErLQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=IrXsS288P1rcLWS/VkVu7VWFpLKe+W0B7IBNPDv/SlK5ZOyMzwjwRE+WH/LgbnGJX
	 bQiEP8Zjc5dlI4OtebcC84iMHhVqXtBobKBa+M4jnKDyJdb2/SseMITsI2dTDfGiOU
	 GFZAJtp5k367KcBV9uvsXw4IaQJhSGDrX0DUMZtWa+yMGvT+mFVUkZ4TQ3ebaWHZb0
	 EwYILOpGhGitFujf2Pm9d2IR3kwGWO7nmGOGK7l+7iIKvnsCGRxn5KMpT4QXyovHuu
	 oUYLTIoAqdNHEmV2yT4HL+sB65H776f8ZWtR1Sq2ML3qP4/AOZZEzOcwsuU7FNvY4J
	 xsd+re7szMYgQ==
Message-ID: <e6065744c7d70b5b93bd8f9ffe720771@kernel.org>
Date: Wed, 14 May 2025 15:07:57 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Ryan Walklin" <ryan@testtoast.com>
Subject: Re: [PATCH v10 09/11] drm: sun4i: de33: vi_scaler: add Display
 Engine 3.3 (DE33) support
In-Reply-To: <20250511104042.24249-10-ryan@testtoast.com>
References: <20250511104042.24249-10-ryan@testtoast.com>
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

On Sun, 11 May 2025 22:31:18 +1200, Ryan Walklin wrote:
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> The vi_scaler appears to be used in preference to the ui_scaler module
> for hardware video scaling in the DE33.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
