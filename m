Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD322459C9;
	Mon, 21 Jul 2025 17:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753118753; cv=none; b=LKF0hP11yDjaZ+/e5GRitrvEWhdBLWbXqj243K5uHOH+vwgc+qEGSNZjGQuDRuwXgqAvTJa9rutvjf56dzNTKQuQHXOhqe70/dnvLdFI4DbkQEhn2JWwDTHjd9MBW3mYiMdErKgYvl5NoTnnZuO3ECXpy51I7gMNHpAVB4ArBgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753118753; c=relaxed/simple;
	bh=Rka394Lu3AN2tiNgLdPUDIY6dEBgvo5J16nEsnhPra0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=VG5gfAw+VwRyeetiZeNlQ2xWACYb9uzMOQIfA/Llqi43Ux/OKDUGExa8KO4tekTplro8qNHAmYOy5Jgnqe3HC1V07VJBR7GFmOgDNkDWL5uruGWDJY82n2u/GtImpKVCUxmBl6sDdKfeF00/8JbyaBj45T9fmHKxVebctbP41Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=elmzHlGn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="elmzHlGn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E998C4CEED;
	Mon, 21 Jul 2025 17:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753118753;
	bh=Rka394Lu3AN2tiNgLdPUDIY6dEBgvo5J16nEsnhPra0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=elmzHlGnw6nWTTgf7WMaDLnxnbHuYtlsRgx9025vMTtR8lVSLtmRSFdLoti4Yd9fV
	 RlKhsJR1TOJSKOj+IUbZq+hR0G0fBXCbEhPGp80mEnAWwLxbdFrIkOihGXSoKfB+fR
	 iuiFKU2ODzATDjbd9RQ/CBqKmHEy6ERXQEAfJf+vIXffoh3ggGe1gu5UtnmmOp4bVY
	 CdL3u9+ovkHrdfJ1wxxExRN7ESuzHld69NbVx3e+QOUl2FXupKer9p3jayAEQ3Wude
	 QxT94Nz3AYGZ8txXK/vzpGRTXi6FeBESwv1jjbifMzEBG9281FgPXotFHC79LzEzcv
	 gtk7XrX/mvFQw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aHaH6omQWoTUxfuV@wens.tw>
References: <aHaH6omQWoTUxfuV@wens.tw>
Subject: Re: [GIT PULL] Allwinner clock fixes for 6.16
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org
To: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 21 Jul 2025 10:25:46 -0700
Message-ID: <175311874651.4111.10710584792094733251@lazor>
User-Agent: alot/0.11

Quoting Chen-Yu Tsai (2025-07-15 09:55:06)
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd13544=
94:
>=20
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/su=
nxi-clk-fixes-for-6.16
>=20
> for you to fetch changes up to 01fdcbc7e5a56c9cba521e0f237cb5c3fd162432:
>=20
>   clk: sunxi-ng: v3s: Fix TCON clock parents (2025-07-03 23:31:05 +0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into to clk-fixes
