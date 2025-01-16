Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4302419FC;
	Thu, 16 Jan 2025 21:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737062960; cv=none; b=rAgzM/mzX9QJnfkFif9/dQJQclmcqc0gJ9hlS1T69celiGgr0bJLjr7AwuG9MFZFWCdD79jiR9RBPvKWvjjL9qhSwWoMg6ySCfrsjpCCup8XLAIsdTiibmD948Z7dUSHFNfiNjirTxS54Hf8LSbIXZnEK7tqwfXK+OvS37g6vFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737062960; c=relaxed/simple;
	bh=KlAS5F590NglDo4EfCac5zFlGtiwAR/Us4/0af6GVkQ=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=VCnkFa9hoEx4B9QbkWBJBg4fbzeVG4+XMh8qkU8RPjidQnY7nFfyXn73hPNNX8fFO5tcSGXh9pTzw7T+o5A4nTUYByWmRwjgcax1yUTEJ4poMrH0DKb9jEvtc6wUcOMs17sOHX6EZXH2q01xX5SwcvGfI//Dh9CmwBAavT2JVTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M4t5F9k0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M4t5F9k0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3716C4CEDD;
	Thu, 16 Jan 2025 21:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737062958;
	bh=KlAS5F590NglDo4EfCac5zFlGtiwAR/Us4/0af6GVkQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=M4t5F9k0RPopTpZtkBJJbqz2DF6k6rtXh/lH5xI6i2G5ctrjfxS3erEsxNHH/EqJl
	 ELNarA+8nbat6jDQLnzfA0ydnzUODJi2IEhcY+t7RNBChemEBmf3Am6sEOHtG7Gf7Y
	 1F02y8HqFKIwBgzsmF5lWcLKb5agPkWnYIadSmJUBGsOMdM55IKTyxGxyTS636LcmU
	 u7rVFKalwtW/lbS8VGLYlB3CeIs0K3wXo/sRYdT/mTr4NwDz7he7/WGEIbNGYZrtke
	 f1IsH5oBgQQ434+36mu/Qll2gbgPjUjiLRqICjIZ52gF6oDWh3rprsfbWZ/R60kJX+
	 q1V74WhD/eQFw==
Message-ID: <248177c8973f35db3d6b1532c86909ae.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250116-bcm2712-clk-updates-v1-5-10bc92ffbf41@raspberrypi.com>
References: <20250116-bcm2712-clk-updates-v1-0-10bc92ffbf41@raspberrypi.com> <20250116-bcm2712-clk-updates-v1-5-10bc92ffbf41@raspberrypi.com>
Subject: Re: [PATCH 5/5] clk: bcm: rpi: Add disp clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, Maxime Ripard <mripard@kernel.org>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Date: Thu, 16 Jan 2025 13:29:16 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Dave Stevenson (2025-01-16 08:24:12)
> From: Maxime Ripard <mripard@kernel.org>
>=20
> BCM2712 has an extra clock exposed by the firmware called DISP, and used
> by (at least) the HVS. Let's add it to the list of clocks to register in
> Linux.
>=20
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---

Applied to clk-next
