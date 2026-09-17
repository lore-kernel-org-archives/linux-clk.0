Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18D43B38B1;
	Thu, 17 Sep 2026 06:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789628118; cv=none; b=Lc2vkQq4ThytvnwWSnK/zwpEFrenD7FlvE+Ge4T48tgzQ/RTkxEpP6szn/Mrol8ouS5tA1tg5qFBzuSDVxzWYbb6WErMlBKsqt5onMIdZjps5P+mVrQGAS29MQ75CVO/kniTLC27rSYg71Qi+27fbC3XsJwd+CXHz9vwEK5mKl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789628118; c=relaxed/simple;
	bh=HM1fKyYrPv8uf1vivasevvyzAoFBsZ9p3FoIxkBk9HM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FLshU9NxbewZCVRx7Uff5HqqiZEjxnzNxWVzhkDhgxVRNNO3Mnm7YX7U6qZuqzbH7l7PnEjFf/x2g6uhHip57HDVFe8CtZ9i14qHum+VuKwTLp91q8CLsMnfb6LzOno7dOIvTBE1xXspsVH/E5bfApn3wfjXWuOa5VDRraGxHSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K+tHetcK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K+tHetcK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BC1C1F000FF;
	Thu, 17 Sep 2026 06:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789628116;
	bh=0cpgHu6US2Uily33ztbXw+ldbSJYhicXWHuvO/gNsVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K+tHetcK34nXqZBo42umrkNZLCznX3OoUq60qydN7AWoh72XWvcHTY/HcOOnlVtde
	 qVJDbPHGv5E5c68XcmAedHb6xb4daXvABWGiXNaLlYUpAdnbZogBFYd115b3AE+shz
	 lWQfEnWIe6toV9HtZ1f/1chhdhHOg6d1ZtV1Z8ZNoNEaXe+qazVRUDdYXl7shlvtfS
	 aR+wVMFKp+rYB+FgjNa7kjeoqO3gvs/tK0lWB37KVziPoHtKU2JdgCuI5gAlFSvgyp
	 TwNNJ7vybPmM2yKYtZzl/vGyfuN2r2q19v8Ma1zKH8xpqdbIND17H4cD4tByqqW3N9
	 jgF9iWc/O7F2A==
Date: Thu, 17 Sep 2026 08:55:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Dominique Belhachemi <db@domibel.de>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, mfd@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Maud Spierings <maud_spierings@murena.io>, Graham Markall <hello@big-grey.co.uk>, 
	Icenowy Zheng <zhengxingda@iscas.ac.cn>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v4 04/20] dt-bindings: soc: starfive: Add
 starfive,jh7110-vout-syscon
Message-ID: <20260917-crazy-meteoric-trout-3c041d@quoll>
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
 <CGME20260915153220eucas1p1f5b0e03015500d9d66db8993426c8734@eucas1p1.samsung.com>
 <20260915-jh7110-clean-send-v4-4-f0e4fd6f2cc8@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260915-jh7110-clean-send-v4-4-f0e4fd6f2cc8@samsung.com>

On Tue, Sep 15, 2026 at 05:32:12PM +0200, Michal Wilczynski wrote:
> The video output subsystem has its own system controller, documented as
> dom_vout_syscon. Among other things it holds the mux that selects which
> DC8200 output drives the HDMI transmitter, so the HDMI controller needs
> to reach it.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml         | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

