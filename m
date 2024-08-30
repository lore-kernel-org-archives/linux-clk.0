Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D1D17107F
	for <linux-clk@vger.kernel.org>; Fri, 30 Aug 2024 22:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725056045; cv=none; b=W0O+SyeO7TPdadodbVBQJiblx4rmdy/MgM3OLGZnZHM2YAkmdCTUBge0Ccl+66D0WokxIhlZwdoXIDsJ8wpG0yILke+jP8CLcvdzCmLpAHtQeRQH5/jcA5XlN0HSdB2NNSipH4GayQXxHKOtMzPLrmSRJDL52JHE41GL0EsSobg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725056045; c=relaxed/simple;
	bh=StanZoQhjUwVn41s1l4nMF2nNzp2KU0H1T+0p+ZKEDc=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=hXlvwF6QFrHh59cLL5CxwkRUEVr1EnI6mQTSS1LDTm+t7uE9GZI6QBYdn03Y6WQofCRQjx1uMatPmPnF+dDbqT8VSi7qSj+RQFuDwRuvvtpXkpWLDvbQmfdg3G3rF6e8oO1Oy2obkPP9RPnsjdebkmPJ2Y0q/AbI0gYPSIeWOg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ok/fxmw4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ok/fxmw4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73C39C4CEC2;
	Fri, 30 Aug 2024 22:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725056044;
	bh=StanZoQhjUwVn41s1l4nMF2nNzp2KU0H1T+0p+ZKEDc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Ok/fxmw4rBfheEBuKO5mVPC95HmaSKF54mvbgSWZZ7/BVQu3bkw5RW9ZPiZ9SLz2A
	 APlL5USmi8wmVoJGO/4v17uV+y5o/H9vlnJ55exJegPdslKnF9XPMu7SO4HeqXSD2U
	 AoIM0KS9h5u2DjxsrBCCMMo/KrBTkNUYPMtdRZ1AyCi+kU0gXgGPEE6Dh84buUWz8H
	 +1+zgPXqqxdWSWWnRsLx4T/ueEvEP4lSmfl2DEO+UJWe2npQpg4l+fiqB99CLfo7PX
	 ng6HH/qR4RkMYHYhYYfLLWSfzFFo5tzyuVoHL/m7ax0y+2ao9/27nINE69TtoRZglw
	 +fiHGTyxPpe7w==
Message-ID: <5e1b26c3b20241562c202bbfc1da4f8c.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1jjzfyrsbh.fsf@starbuckisacylon.baylibre.com>
References: <1jjzfyrsbh.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: amlogic clock updates for v6.12
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org <linux-clk@vger.kernel.org>, linux-amlogic@lists.infradead.org <linux-amlogic@lists.infradead.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 30 Aug 2024 15:14:02 -0700
User-Agent: alot/0.10

Quoting Jerome Brunet (2024-08-30 07:36:18)
>=20
> Hi Stephen,
>=20
> Here is the Amlogic clock update for v6.12.
> Nothing out of the ordinary: adding some clocks and bit of clean-up.
> The only notable change might be the use symbol namespace for exported
> symbols specific to Amlogic clocks. Those won't pollute the global
> namespace anymore and will not be accessible to other modules that have
> reason to use them.
>=20
> Please pull.
> Cheers
>=20
> Jerome
>=20
> The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f01=
7b:
>=20
>   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.12-1
>=20
> for you to fetch changes up to adac147c6a32e2919cb04555387e12e738991a19:
>=20
>   clk: meson: introduce symbol namespace for amlogic clocks (2024-07-29 1=
6:47:33 +0200)
>=20
> ----------------------------------------------------------------

Applied to clk-next
