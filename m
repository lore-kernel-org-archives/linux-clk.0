Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F61E37160;
	Sun, 13 Jul 2025 17:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752426414; cv=none; b=broDBO0OtuRDYH8I15B3jbUHu2G3b5RujT0fk3nSPierTXWCfSA85d6k+1YuGJDZMx3P5lp6qvxs3f845TIS7OhErsJTkzGkKxCeZ2zPCcQxdHrQj5scyC59yjnV0/ECgDXmiLPevkNSKXnvThzs7Asq4/dJjWEN8qsFFlwZipg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752426414; c=relaxed/simple;
	bh=OEZ7eLIEFl1LPSh8Fr+hYgEXUccuy8XYoLUfvat4/l0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=jgj6oIhS/espuEZOIxXYKoK0uHqObdIDXb0RhPWUSFqwgXbBhz0u5KNrdLXqN9k3128IZf5qrv9W28iLN7Y1bL/YPDlFcvSauEPAdQMNAKATQqXoTHSfVGz2ihSMA3Zw7RLQv/mmshGwnJGtgyjOjiISUCmGqb1IzllgkGdSEPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BLiOSK48; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BLiOSK48"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 011A0C4CEE3;
	Sun, 13 Jul 2025 17:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752426414;
	bh=OEZ7eLIEFl1LPSh8Fr+hYgEXUccuy8XYoLUfvat4/l0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=BLiOSK48+OPpf6pNNiM/B9DEKnRTymJhOdyHgPRpL5CQ12I5bCS1g+GSDNJMuwOhh
	 04s0XFVwRNpQhZhaNW0eVwppGHfHgKDbPOMr5+ezfVrdicIKC1roDcPWkj2q/hGC04
	 QIQDyRDKRjrqx++BtIlqg9Jk9unSdJH+1UyS7SWls1uwYgANaB5Q9NmVPFUl7ToigZ
	 tP/dcYq6q38u81PTDhDuTsetaVNTY48gsA4giD91n4/MSe1n1uEhz5mEyL08mQVxSa
	 8eXMEaH+TkU16x6n1xl3I44ENC4aAFXazlaq1Leku83ELNbYjWIDVPBYCtXNgr1W/y
	 BnKnk9MDPk7HA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250709011528-GYA487904@gentoo>
References: <20250709011528-GYA487904@gentoo>
Subject: Re: [GIT PULL] clk: spacemit: add changes for v6.17
From: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Alex Elder <elder@riscstar.com>, Philipp Zabel <p.zabel@pengutronix.de>, Haylen Chu <heylenay@4d2.org>, linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
To: Yixun Lan <dlan@gentoo.org>
Date: Sun, 13 Jul 2025 10:06:52 -0700
Message-ID: <175242641282.1004940.6776191948188477776@lazor>
User-Agent: alot/0.11

Quoting Yixun Lan (2025-07-08 18:15:28)
> Hi Stephen,
>=20
>  Here is clock changes for v6.17, please pull.
>=20
>  Basically, what we've added here are two changes:
>=20
>   1) Mark pll1_d8 clock as critical to prevent it from being shut down
>      in the resource withdrawal path once the probe phase fails
>=20
>   2) Extend K1 clock framework to support reset auxiliary devices, and
>      also route the reset driver via clock tree to avoid shared tags,
>      please see discussion here[1] with reset maintainer for more
>      details if needed.
>=20
>   Thank you!
>=20
>=20
> Link: https://lore.kernel.org/r/3732050b6b756868543012c1a1cebbe7cce74d61.=
camel@pengutronix.de [1]
>=20
> Yixun Lan
>=20
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd13544=
94:
>=20
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/spacemit-com/linux tags/spacemit-clk-for-6.17-1
>=20
> for you to fetch changes up to c79550f69f0f21be069385c20cd6490b862ba2a5:
>=20
>   Merge tag 'spacemit-reset-for-6.17-1' of https://github.com/spacemit-co=
m/linux (2025-07-07 22:07:15 +0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into to clk-next
