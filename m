Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98F03D5241;
	Wed, 21 Jan 2026 19:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769022577; cv=none; b=SJA5kUzbKLG4zlYCTbQKwjcdy0mj4vkVgJIBKifLVJhadjU4pz9jJHwofKKYpX/IL6WQHjca0+WXwuKQjSq0/7VhAR7Q8GIqUt3vK5u4wus9UNXYHkIRRykpK9GxkjSPE1V9PWWQDo43m9+KRzNbxROOPHRgZ8p8RUbsCRvq+Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769022577; c=relaxed/simple;
	bh=KL2Tnen2kIHUY1dDWeymZfKFuD7uZ9MVUAn4QAyYmQY=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=nDHmheWSEPkX9u/91jlwLY9ue/4Q5M+fF8CCLesqOv+DGh+BWfcFPJvR4Qo/pi6hKUcMRnzF/wi5ZlFNEzbBwWz4nksAYCckyqzmA+x+Bm5XYWOhPBB7vyEMpNogblURS0fV0xiGh2BiBjfJWnSj2zHgKeUrYqiCgDJtWBzZIew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=epqsfxKN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="epqsfxKN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0D7DC16AAE;
	Wed, 21 Jan 2026 19:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769022576;
	bh=KL2Tnen2kIHUY1dDWeymZfKFuD7uZ9MVUAn4QAyYmQY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=epqsfxKNElJEjtN923mwMr2GHF1jdmCb4xW1reHHsNLfGSV3iEsHeW+4Ndg2Sz7LB
	 yOoiA1vhsRPvQIQOWmIaQgjUA1IhkgbN22F/LiwkEA4QjmCTigAzjSHdBkZQRKwj3P
	 Igdak/kw+aEpDoxoBtVoYkrnmy66QLEWk8es/oFDZCBBYOZu0DN5nGQD1Gbp+ebqKm
	 kgXfezilIh2pTcS/lppl6gEjUJrnKc45JF/ZQAKYCdugQ98/YZWr0147OUOfE3Bkxf
	 UW/CkXeKLKa/81bvmo43xU3GhzbWIeAQFldc+D2S3I5mTQGFejgW6J3MNYZPqua8hp
	 3mcofaaw8JnHw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260114092742-GYC7933267@gentoo.org>
References: <20260114092742-GYC7933267@gentoo.org>
Subject: Re: [GIT PULL] clk: spacemit: Updates for v6.20
From: Stephen Boyd <sboyd@kernel.org>
Cc: Yixun Lan <dlan@gentoo.org>, Michael Turquette <mturquette@baylibre.com>, Guodong Xu <guodong@riscstar.com>, linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
To: Yixun Lan <dlan@gentoo.org>
Date: Wed, 21 Jan 2026 12:09:34 -0700
Message-ID: <176902257445.4027.5972559722832621691@lazor>
User-Agent: alot/0.11

Quoting Yixun Lan (2026-01-13 18:43:33)
>=20
> Hi Stephen,
>=20
>    Please pull SpacemiT's clock changes for v6.20, This PR basically adds
> support for SpacemiT new K3 SoC, while doing this I've created an immutab=
le
> tag (spacemit-clkrst-v6.20-3) for reset driver in case it also needs to be
> merged during same merge window, otherwise everything is normal.
>=20
> Yixun Lan
>=20
>=20
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1=
e8:
>=20
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/spacemit-com/linux tags/spacemit-clk-for-6.20-1
>=20
> for you to fetch changes up to e371a77255b837f5d64c9d2520f87e41ea5350b9:
>=20
>   clk: spacemit: k3: add the clock tree (2026-01-09 10:48:17 +0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
