Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3676A2620C3
	for <linux-clk@vger.kernel.org>; Tue, 11 Mar 2025 18:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741716353; cv=none; b=PZt/uTIRNwIMZ29kS7F6LO+UtEkGekd1xCZaFpquSdQ/qDdlPM9lt9u+GDFZTsLLxoM85BxEE4i0Nlv2LYAo9d18LEXbQbVb2i0DJObREBnW71m9p/ZWWcO5ahaaPkeofknX93xsVMwjtffmIwxjBJro/QIBZJ8u3wzPsKwtMMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741716353; c=relaxed/simple;
	bh=UiJD4WfkyLfCbR2ZJLLU8WXPTcPUoC5Ue3GNIH9PRo8=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=NLzCQBMtd0NzKcyGPLx2qsWFUxdN/BJQpyf4Qzdf8QfXFf7TwtWdMOcc+MPkBRdguBuCdMM1lOWu5dnFs993LwniUs5yTwADMpMqIp4dj6H0C8Q1w8TaqAsuXc2wvqzThGdlUE7J/EOYsqs/+bqlfF8nC7Jaw5ha2DPy4BIVv+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AjA+qXP9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AjA+qXP9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 016F2C4CEE9;
	Tue, 11 Mar 2025 18:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741716353;
	bh=UiJD4WfkyLfCbR2ZJLLU8WXPTcPUoC5Ue3GNIH9PRo8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=AjA+qXP9Ju/93iEYW8zIT5GUGWy9J4D3JM44IsC5ht6nUGIvPwqPO6JJxu9ejSwpr
	 T2A5rrRI8U0/AOHDvZmFh1hfrz1dUtjEpcXBMzphk6zEcWcoZsMLoeK9mPl9Hz9lnT
	 9aUn/maga/AM6A31ExMIX5SNn+v8+URTXAHWc0OgggVaVhJT7kGl4AIvBtLtnyzL9q
	 zF+OrOjIwW4L7qpMpAmWHQrR33/4uVE8I0EIBQcg2Bimb2oVaKio1eVKEknU9Xt3kW
	 KYw5FxiEkOnMlGiP0ToOyxRstHpbdg09DkjPI9B7m+rxbGKuYnCXRyRV70zwMF6Q4m
	 Fd3TyVdbwVqrA==
Message-ID: <33a5e73e9c3919dd0554f9dcbee8b733.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <8574162.T7Z3S40VBb@phil>
References: <8574162.T7Z3S40VBb@phil>
Subject: Re: [GIT PULL] Rockchip clock changes for 6.15 #1
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
Date: Tue, 11 Mar 2025 11:05:50 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Heiko Stuebner (2025-03-08 10:23:39)
> Hi Mike, Stephen,
>=20
> please find below a pull-request with Rockchip clock change for 6.15
> The new year started with a flurry of activity it seems :-) .
>=20
>=20
> Please pull.
>=20
> Thanks
> Heiko
>=20
>=20
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f0=
5b:
>=20
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v6.15-rockchip-clk1
>=20
> for you to fetch changes up to f863d4cc79a7e2f8c734d1fac84dc275805f41c7:
>=20
>   clk: rockchip: Add clock controller for the RK3562 (2025-03-02 17:51:51=
 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

Did you see this warning?

drivers/clk/rockchip/rst-rk3562.c:21:57: error: initialized field overwritt=
en [-Werror=3Doverride-init]
   21 | #define RK3562_DDRCRU_RESET_OFFSET(id, reg, bit) [id] =3D (0x20000*=
4 + reg * 16 + bit)
      |                                                         ^
drivers/clk/rockchip/rst-rk3562.c:266:9: note: in expansion of macro 'RK356=
2_DDRCRU_RESET_OFFSET'
  266 |         RK3562_DDRCRU_RESET_OFFSET(SRST_P_DDR_PHY, 0, 8),
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/clk/rockchip/rst-rk3562.c:21:57: note: (near initialization for 'rk=
3562_register_offset[173]')
   21 | #define RK3562_DDRCRU_RESET_OFFSET(id, reg, bit) [id] =3D (0x20000*=
4 + reg * 16 + bit)
      |                                                         ^
drivers/clk/rockchip/rst-rk3562.c:266:9: note: in expansion of macro 'RK356=
2_DDRCRU_RESET_OFFSET'
  266 |         RK3562_DDRCRU_RESET_OFFSET(SRST_P_DDR_PHY, 0, 8),
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
