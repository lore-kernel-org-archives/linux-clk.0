Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D0B18FC8F;
	Thu, 16 Jan 2025 21:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737062933; cv=none; b=sTqJvfYYz8zusR/Ui/sTYJKmj3MLfKn11jP2WgBf5iRHEJ1qlt67iw7ovwht79Bfsox0YggEUj0u1mcjyGXrXA90k0AoYPqcIZFW8oIB8oL8jUMQGiWIT8dZCkjKQ2FQyEz19UZxhbCY/reLxM+1wHM8Ia5amxO0NuCGcKdak0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737062933; c=relaxed/simple;
	bh=KdJfmelLSkMJPOzL2hd/ZujQ/SrlvACrCrxN1yL9R88=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=M+uAIFuDtzQYaqel6fS8fP97p8BXsSwUr7gD6uiOIMpwYRr/vKOTWaFFKo0CZTfbOUX12XggeR9rKQ9lzQiFRT6CxZnh1Cpy132HBChfdVp4pXtz95s3cXdRJMphkjnke0kpJXcxbPrOEJEaXIFZYwde3MuGFS3XfXHIKRhXtyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CYHNtcJj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CYHNtcJj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17318C4CED6;
	Thu, 16 Jan 2025 21:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737062933;
	bh=KdJfmelLSkMJPOzL2hd/ZujQ/SrlvACrCrxN1yL9R88=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=CYHNtcJj/CtwrPuayKy3Ej7UoMhJih4GlUU2rEL3xLDK98J6m3sTdvPq6oA0ew6AF
	 5yGwbg799QYxeCfGRIL75eTsfXawMUOqv/oVAq+iqnPvCzs/OZWb05mzTSGryJWatb
	 kZkGm13w9u7qnZ4RcGupM7qQSlgHbypAlirnMQJoS521eYG3vjM/tRapOqAn78EGfw
	 maJAUYNKNYER7gvy4wlvA7RJ+Wu4G/5q+nD36oWBh8w9IO476T+QYfp8q0kaubPybU
	 e+nItOKarFHthDTGLwg5j+Efj+nVMAbfJtiXu/B6cwLa5Td/q6qhryAVJ8grv6qKpC
	 W3updLNY3X6OA==
Message-ID: <5bb7a992ed936fba79a408475471e621.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250116-bcm2712-clk-updates-v1-2-10bc92ffbf41@raspberrypi.com>
References: <20250116-bcm2712-clk-updates-v1-0-10bc92ffbf41@raspberrypi.com> <20250116-bcm2712-clk-updates-v1-2-10bc92ffbf41@raspberrypi.com>
Subject: Re: [PATCH 2/5] clk: bcm: rpi: Allow cpufreq driver to also adjust gpu clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, Dom Cobley <popcornmix@gmail.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Date: Thu, 16 Jan 2025 13:28:51 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Dave Stevenson (2025-01-16 08:24:09)
> From: Dom Cobley <popcornmix@gmail.com>
>=20
> For performance/power it is beneficial to adjust gpu clocks with arm cloc=
k.
> This is how the downstream cpufreq driver works
>=20
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---

Applied to clk-next
