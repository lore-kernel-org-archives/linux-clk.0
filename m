Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160AC18FC8F;
	Thu, 16 Jan 2025 21:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737062942; cv=none; b=WK9ttlit9p89YVYjiNS1SOFvPcb+K+NWbXaLQpHFiU3w0Wt+1ctDZ7N2IbzK7K9u4k09AnSiQ6VDBW9C1O6auy7nWbJqbiK+BTeFzGWbo59b/YZOPE0+Ruxzzvx7NBBLWZ/BtxgEnhiniqzxS7K5UU7he2YrlpBJVlyJStaFKww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737062942; c=relaxed/simple;
	bh=LWDA3nMj2EHfkq6SD127AGQ72zRJ2OTCvKDtzxbe+AA=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=Jd83wf3wJDUkAjEM1uic04o/Bh3Oqc5qkja+HFhD7csUL1O1h82CxB14EI4K8Cf0mgeFhETN5/cEPPxP7voV7spgCKCVeVP7tEVdtgpIgPYJkDIyztryHwfP7B2XstvZCNt5350VR8wV7nCXgRMWS2ZFB5XrWVaCwZKvJj2QLYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uBFBq0i4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uBFBq0i4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 972C1C4CED6;
	Thu, 16 Jan 2025 21:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737062941;
	bh=LWDA3nMj2EHfkq6SD127AGQ72zRJ2OTCvKDtzxbe+AA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=uBFBq0i4I3Olgey8oxTCEmpGq2OZpFuOaYkuDr9S3WnbYSihbJ34oVvWXtlK0kdaw
	 IRCrsQs6Gmc+1RfNW/9huNhW4Q+Ry5ycm+YAJtrfv9MBXO7EqIOx1/Y+VZlJLO90YA
	 aQbDsH1uxVMB9+cP2n5+gYCKv3zhix7f9IxZ3SX/9CdhKyfW/l2Tciptg3E0IahOdY
	 V1TIG45Bn/Q06XBYs88AvMo/Koq3mmkrZDEB1hzqzzex3IppxVKlCN1SbI/c2vmUXs
	 r+9ybwn1KdZd8wicGr5Z/qk0Ga7GI91kYv7qUvIbxHgaxgPQ7PT6B+AcUAYiliZKfR
	 NRmm1CELGMj0Q==
Message-ID: <d0914d3deb933860937fce48805536cc.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250116-bcm2712-clk-updates-v1-3-10bc92ffbf41@raspberrypi.com>
References: <20250116-bcm2712-clk-updates-v1-0-10bc92ffbf41@raspberrypi.com> <20250116-bcm2712-clk-updates-v1-3-10bc92ffbf41@raspberrypi.com>
Subject: Re: [PATCH 3/5] clk: bcm: rpi: Enable minimize for all firmware clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, Dom Cobley <popcornmix@gmail.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Date: Thu, 16 Jan 2025 13:28:59 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Dave Stevenson (2025-01-16 08:24:10)
> From: Dom Cobley <popcornmix@gmail.com>
>=20
> There isn't a reason not to minimise the clocks, and it saves
> some power.
>=20
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---

Applied to clk-next
