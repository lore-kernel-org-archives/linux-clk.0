Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C973112B2;
	Wed, 19 Nov 2025 18:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763575540; cv=none; b=a08E2K5181UXlVy5S6OAG3fcpGFaXR/Vxx2FrYSKx8BQjXGIizEPGVLpZ6JgeXRztXx5Li23k4yasVeu7Ia1UnfpV0MfihYOQRq7Ahj8ZTeKQlEYLH45FT4Ic/sGhMxEV0vgiKKDemgO9Q7sarG01S8i6ZUv5C1NR3mhnik7c1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763575540; c=relaxed/simple;
	bh=mZ0TIr63Gf3d4mkQlylA+120TbdwDnF0TXHuxDQ5MNQ=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Nl/g6XoXYW+9Rxw8PQ202LYcZ2jfC3q8WJhSpjVQA9sww+6yZ4WU3zzXf0sv0E9KjBslZaovsB5ImxZD2c3zrm7D4bxfg1JMAS/NVdSzj61+ak8bASGJNu0rjpTsogTmHu/QM/4tDV0i668eFJ4+VD4wWvuCK9EzEusY9s6LggI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aPkKacaa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aPkKacaa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA216C4CEF5;
	Wed, 19 Nov 2025 18:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763575539;
	bh=mZ0TIr63Gf3d4mkQlylA+120TbdwDnF0TXHuxDQ5MNQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=aPkKacaakVemXXRrR8gHK+Pd+jp6GCtT5no+olUp5xpn2po8qLluWoPVrBuNX0Ip5
	 EDFgoDxcntpiVNRwqwTRSz5Hxlq5MSVB/SPr7k0Q45DqnIfw74bn4+u9+hpjcIqFuD
	 KZc+UwcF8RG+n+yNCjxR95UjUIYoDYHxrjNFelUo1+bijY6oCkedBczNX5z4rs/bgL
	 BI3DnO8Cqrs5l0kOkQEOtSdlSAOU3PSGY5m9veXEMmcY4A98rl2DfLXfeIIMlFQYqq
	 oYRmMQ8gNjK3xWBsDGY+mo9sJ4xXW1iov6e6EvDDTiPvNLLmwRINQzLSBspTfQdzwK
	 YSN8mJkT76Krw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aRl9B9SH9bVxcORm@wens.tw>
References: <aRl9B9SH9bVxcORm@wens.tw>
Subject: Re: [GIT PULL] Allwinner clock fixes for 6.18
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org
To: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 19 Nov 2025 10:05:35 -0800
Message-ID: <176357553566.11952.15367812107938066034@lazor>
User-Agent: alot/0.11

Quoting Chen-Yu Tsai (2025-11-15 23:28:07)
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df567=
87:
>=20
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/su=
nxi-clk-fixes-for-6.18
>=20
> for you to fetch changes up to 2050280a4bb660b47f8cccf75a69293ae7cbb087:
>=20
>   clk: sunxi-ng: sun55i-a523-ccu: Lower audio0 pll minimum rate (2025-10-=
23 02:06:47 +0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes
