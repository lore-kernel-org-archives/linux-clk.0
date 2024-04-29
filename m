Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8730019067B;
	Mon, 29 Apr 2024 21:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714427786; cv=none; b=gYVgnx3xd6HwVuH3+PhfoovV0yD2sqyDDigu/6kz/0Zgpw7+hUKJ+vlM339YRJ8M0sG/PXRauPex+Fn5l7Bn8G9Tt6rUkrTlCimTb4JgSc8D1KrFBhUvQtorIy2X4CQlwWaBKjRXCuuWi905GJ2x99DKZgHd5rgNL/bZ6sUcrNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714427786; c=relaxed/simple;
	bh=n7WAMG/cs4ZuFMqyG3XTj1nK38EjamP1TtmTGNsElKM=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=rEm652REr5gsLh9TBu4iT51n5/AIi21g4FENp/2RPLFV4NVk35EB8TswV5NlTVvRajOyl23ZR8JeHmHiX98EiBXS90Ea/niH7S3oaY/c+StB5bmeEMm8UIRvMZo74ttBDZU6ZNxUf5/sK2+rTlwdIDFcc8RrNXjenOORbH31jh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W/Q8gZsa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W/Q8gZsa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01FB5C113CD;
	Mon, 29 Apr 2024 21:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714427786;
	bh=n7WAMG/cs4ZuFMqyG3XTj1nK38EjamP1TtmTGNsElKM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=W/Q8gZsaT6ksPKNk1SiWKwTkdNhwHDPCI4Yd0iDh4Rxahco5ELr3XH5rQpvfvspxi
	 w5olg7i3iSytvyy1qr6Bgzq4FOzMxRM94/3WXjxEe45UkLU3oHAqGjBtf8qZEZLrmT
	 QGNgrCirb8aFAsWjEz1m9nL0LNbmrLjF53J6nv8d5K68Xum3HT69CCE0V1riFxU8yy
	 tYCKYMeYWBtubW/FMs9X2jFaiW+/AVzVe6oDipKop7wHI0sVppQZP2nyD5mKoKi6Xd
	 4/2ZJsYEbOWT30fLRw/Qexi4uMSZmNsrUo2bCJrdyDeG2UAUL698YJVMYw++K9l2SH
	 49CkLrnzIQOEQ==
Message-ID: <528b179051f2d5aaa2652c0adc358eb3.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240426164235.GA100991@jernej-laptop>
References: <20240426164235.GA100991@jernej-laptop>
Subject: Re: [GIT PULL] Allwinner clock changes for 6.10
From: Stephen Boyd <sboyd@kernel.org>
Cc: wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev
To: Jernej Skrabec <jernej@kernel.org>, mturquette@baylibre.com
Date: Mon, 29 Apr 2024 14:56:23 -0700
User-Agent: alot/0.10

Quoting Jernej Skrabec (2024-04-26 09:42:35)
> Hi!
>=20
> Please pull following clock changes for 6.10.
>=20
> Best regards,
> Jernej
>=20
> The following changes since commit 4cece764965020c22cff7665b18a0120063590=
95:
>=20
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/su=
nxi-clk-for-6.10-1
>=20
> for you to fetch changes up to c60f68047e1996bc1b2fb386d3b383aab8900c1b:
>=20
>   clk: sunxi-ng: fix module autoloading (2024-04-15 23:29:50 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
