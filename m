Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6436432BF4B;
	Sat, 11 Apr 2026 23:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775949866; cv=none; b=HILUvaU+qPtwerkNLAGhwXUjSuPoMjZ9Wz7mV382iwqX+qwzLA4pB0OMY5Dzk35YSZhzw6VnxdY8zwtvVOkicdTBDlAjtA2keeFZPVdSbkfh9vhi/ynUfg3SMcn+jyODUV324b5l19mwToUIp4xeYCoEwX4OJpDT2m2SoBPBAFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775949866; c=relaxed/simple;
	bh=RQCJ+fj6WdO8hfeSNAkecBI8UWI0eKm/Metutfq54YY=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=gItNV4IkkxeHwyFjvBq4PbjzlazcDcr2meeVIpn2NzsGIKtiwtCyoFlQY314kzvyLEw8hrH42IaQEOwRdDAeLOF1d4uYVegTb05vQ3xeValwJR5CMZ1hdSlceikODgMAAe/zTdRyKZdmIpWd7Q/gCQebddEqiJIDDRFoHi0Q5Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kFl5gg7b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kFl5gg7b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F146FC116C6;
	Sat, 11 Apr 2026 23:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775949866;
	bh=RQCJ+fj6WdO8hfeSNAkecBI8UWI0eKm/Metutfq54YY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=kFl5gg7baURuiEnE4bzO1c7O5+EC5kZjwAxokvQEWRh9aJqOAwCMjGucSIjO0PD6N
	 3eci2qbCCFQ0en5DRdRfXr2M+mzh/Fmj/8Ro5oiG6eQmtZ7N75tIk7IGqvr1W8X/ox
	 SOkYrwRO5GOShFzjSBMlR6fV1W3a0qwou5fXI8tF/d/l0xUg/82osh5yUNokABFQUW
	 u+amtDrerXeRGeMkzkGLfrLny6vDbKiHI1YBrRW0B3daJRVlRTOLkLVzkYLCWTX5yk
	 VRPS1LDT0oHtWaidq0kANYyy+s46oNPbVQqyHY4vnhFfTEj3fbJ6VoXVOtBCN57u3G
	 bv8Hn7I9IJvEQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <adJu-NeYb70E-1yS@home.wens.tw>
References: <adJu-NeYb70E-1yS@home.wens.tw>
Subject: Re: [GIT PULL] Allwinner Clock Changes for 7.1
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
To: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 11 Apr 2026 16:24:24 -0700
Message-ID: <177594986409.5403.8384720945242145842@lazor>
User-Agent: alot/0.12

Quoting Chen-Yu Tsai (2026-04-05 07:17:28)
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f2=
7f:
>=20
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/su=
nxi-clk-for-7.1
>=20
> for you to fetch changes up to fb20ccf70cf695f178d7c32e2d33b376560df0ff:
>=20
>   clk: sunxi-ng: sun55i-a523-r: Add missing r-spi module clock (2026-02-2=
5 00:26:12 +0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
