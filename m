Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B070EA34
	for <linux-clk@vger.kernel.org>; Sat,  4 May 2024 00:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714784173; cv=none; b=Op4iNsBIceN4kw32JCcLBHiYBem+Ldivt85SjW6jhvg+7ymIYunzrdfKBXy44SKnPj9iNdYoZksXdiJoBss7IFISzFR/0SbCOXvPen2y9zn5oqOg19Q2et6q0BtA/2aaahpEGWs1zWz43aUKrg7wRI8bVTp4FIt8aZMxjbksJKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714784173; c=relaxed/simple;
	bh=9WSMtu0V/6YHuVP9mM3uysB5dF4FFFLrwl/Ds/7uIj0=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=owVBb+5Z7lrO4TQEW624Xo96R7Zfrcl3tx/u6jzfElwfz7x9P3nQWinALBkPNhdIrd5L/dwjWvQp6ReNK9AV9Y4zqpduSNG6qvkK+h7h1Wjp81De1FKSqkj8HqJDTMDYzHMWUAW90SilgdlFBFj9KhM5nrZPhJ2auXO9r4Py9Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GYLYAOnC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GYLYAOnC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FB30C116B1;
	Sat,  4 May 2024 00:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714784173;
	bh=9WSMtu0V/6YHuVP9mM3uysB5dF4FFFLrwl/Ds/7uIj0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GYLYAOnCRhsfZZSMF/ek0ZLoGJoaGviOpyF+EcgltQSUE7QA7j4sozRbS246uor6u
	 cuj5GQOUb2ERWynUdwXePtxSnwxcRz+x5MMzxEXg765TZTjtvyfGz7UfudgQGTHPG4
	 8UPp9uX2O5WNPSQSFh3Uawp5/p2rL/D0Ro3bmOiAIle6608AAt6Ifv1QcgBcFBXIhN
	 0ufiNBLDalXXamYh4AZIAxerjrGGE7psX6IP7scNgVlBboRiKrcie9w03pOkWW5yCk
	 vAm8bU6dXGy89tZVGoA0/TBEHWEYdiACO3+EdspjPEhvnKRQGRZnV4L4zBEhoUm+mc
	 3AKc7g1t8jRrg==
Message-ID: <f8250e7b2566b564e9e763ce71ef4a94.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1j8r0r3sf0.fsf@starbuckisacylon.baylibre.com>
References: <1j8r0r3sf0.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: amlogic updates for v6.10
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org <linux-clk@vger.kernel.org>, linux-amlogic@lists.infradead.org <linux-amlogic@lists.infradead.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 03 May 2024 17:56:10 -0700
User-Agent: alot/0.10

Quoting Jerome Brunet (2024-05-03 06:57:49)
>=20
> Hi Stephen,
>=20
> Here is the Amlogic clock update for v6.10.
> There is one new driver for the DSI display pipeline and the rest is
> just house keeping.
>=20
> Please pull.
> Cheers
>=20
> Jerome.
>=20
> The following changes since commit 4cece764965020c22cff7665b18a0120063590=
95:
>=20
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.10-1
>=20
> for you to fetch changes up to 11981485e27c7e5a630ee844a2eae1f1835ba807:
>=20
>   clk: meson: s4: fix module autoloading (2024-05-03 14:27:32 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
