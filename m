Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7FF1FF1B5;
	Fri, 14 Aug 2026 00:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786668251; cv=none; b=FXKGPqLWK3FTixU815dEHn/MPvFZmtX+mZlh3rlhTW1CMPfYMhHPjIRX2CfslhKZF4Dq9LPRh0J9ImSOVnKbp2u885fzexmSTB+dG7U9WFSiI/24ruHAfVZLclH6LLye96iY1116tB0YaolyB+y60Z0JFVbLmAG1o+KBuP9TIdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786668251; c=relaxed/simple;
	bh=4YPdD/LnqlYZaInvb0kdldMApMTgBO1YlcYMWGx9HKk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=mYyzcp2unYhvynZhAfWR3AdG6gyIXaopEV221CT4PqAT3kaNWPBPqMKZJCMc1zg9cU8t02lSs/wmA6H7JvKyYkb4PJsZjvhWisNEzDwmSB1Ct4ImCtyCtBLwJrJWQZrrUu5OwahkRCj+mIKYWHBkppHWWWFOa3dMSq/8m++RMl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=fail (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cgQkybjt reason="signature verification failed"; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cgQkybjt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 986A71F000E9;
	Fri, 14 Aug 2026 00:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786668250;
	bh=Y3xQ2gamupgkK3lEUJb4u0c2UmktznTFKvz4iLp/Eug=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=cgQkybjtZxJuhyNJvoeJqmvb+4nOosYjGJjKW+M55+nDc64CQonlNWHE22OvSnICC
	 wcl2bjBTcj8B7hIC4Y41VJO5SpMZK6iEqpy1aRbHsdYw4jlkShkxkIg3FVazYBMghs
	 eyZXB9HctR2wywmkLzzRUyVGQVeOrrawMhYRtO7mWqoRuU/jnPuWQbxkCthQEaWqIi
	 TC6Szqr8EIkt9kEwMrvVzYNB4sAFvOjieAK12D8vWUfQizqZljp6P0dxwyaLb/xVvt
	 np0kTL1zcQbk4hUOUiTp3znowqxoHnH2a1lVkVx6gWGyBD59B4JgMEPw/rmwFbdzjj
	 igS1IBvkJCMVQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <amjbNiVjm5HkPRu9@redhat.com>
References: <amjbNiVjm5HkPRu9@redhat.com>
Subject: Re: [GIT PULL] clk: Clock driver updates for v7.3 (round two)
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Ni <nichen@iscas.ac.cn>, Chen-Yu Tsai <wenst@chromium.org>, Christian Marangi <ansuelsmth@gmail.com>, Colin Foster <colin.foster@in-advantage.com>, Dan Carpenter <error27@gmail.com>, Dmitry Osipenko <digetx@gmail.com>, Guangshuo Li <lgs201920130244@gmail.com>, Herve Codina <herve.codina@bootlin.com>, Jerome Brunet <jbrunet@baylibre.com>, Jia Wang <wangjia@ultrarisc.com>, Joakim Zhang <joakim.zhang@cixtech.com>, Kostas Damaskinakis <kostas.damaskinakis@gmail.com>, longlong yan <yanlonglong@kylinos.cn>, Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Myeonghun Pak <mhun512@gmail.com>, Pavel =?utf-8?q?L=C3=B6bl?= <pavel@loebl.cz>, Pengpeng Hou <pengpeng@iscas.ac.cn>, Rosen Penev <rosenp@gmail.com>, Ryan Chen <ryan_chen@aspeedtech.com>, Sang-Heon Jeon <ekffu200098@gmail.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Suraj Gupta <suraj.gupta2@amd.com>, Svyatoslav Ryh
 el <clamor95@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Brian Masney <bmasney@redhat.com>, Michael Turquette <mturquette@baylibre.com>
Date: Thu, 13 Aug 2026 17:44:07 -0700
Message-ID: <178666824783.5897.18058807615411677719@lazor>
User-Agent: alot/0.12

Quoting Brian Masney (2026-07-28 09:39:18)
> Hi Stephen and Michael,
>=20
> Here's some changes that were posted since June 29th that I feel are read=
y to
> be picked up. These are changes where a clk submaintainer typically won't=
 send
> the changes in via a separate pull.
>=20
> Note that I have a separate outstanding pull for some changes posted duri=
ng
> the last merge window that I feel is also ready for inclusion.
>=20
>     https://lore.kernel.org/linux-clk/akLzCVzbMbUsgDda@redhat.com/
>=20
> There is a minor conflict in drivers/clk/clk-si544.c between these two pu=
lls.
> You'll need to add the .name and .driver_data name initializers like the
> following based on the work from Uwe Kleine-K=C3=B6nig:
>=20
> -        { "si544a", (kernel_ulong_t)&clk_si544a_info },
> +        { .name =3D "si544a", .driver_data =3D (kernel_ulong_t)&clk_si54=
4a_info },
>=20
> With the conflict resolved, I verified that both merges can go in togethe=
r, or
> individually.
>=20
>=20
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e524917774=
82:
>=20
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/masneyb/linux tags/clk-misc-round-two-for-v7.3
>=20
> for you to fetch changes up to cf561283254dd9f55805800237e6f82f08d91497:
>=20
>   clk: tegra: set up proper EMC clock implementation for Tegra114 (2026-0=
7-28 11:31:34 -0400)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
