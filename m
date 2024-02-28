Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9739386241
	for <linux-clk@vger.kernel.org>; Wed, 28 Feb 2024 21:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709157573; cv=none; b=lUo5zNzv1Cb8TFrfKgD0b7vWiVmdzrSW0wak+K1lehAfFB9cLTOiNT7d0j3cv1GD9UQ3RxkfQG46jJHrLkbDeuQFkIl5+3nCVxUOk7iP0NWEVPvNkSK4UOQ5TOMrwVQBGvCdJXIz6NbzjmsYLvBNn/2+xGqKqM/pBpaX6cPBVZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709157573; c=relaxed/simple;
	bh=MiBk1miMfpbCTAE6/v5GmbIq1g6eyhk1G5oZN/8HAC0=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=q1P1ONOJBws+1sFwwEAzqRTSOviX1d1SAI+vUeX39A0yKgA/zgfIl/yarooqdKOQxMXuA6ZDEObRLyZhnF9tWO0F9GMECkLFHbViZGublrulWZk+DA0CtCNkWUK3CeEaaDR7XCwML4kxJHuyBhuIQQCWSF/5npMl74EkMeaHZq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jkBZM1bz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jkBZM1bz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00F6EC433F1;
	Wed, 28 Feb 2024 21:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709157573;
	bh=MiBk1miMfpbCTAE6/v5GmbIq1g6eyhk1G5oZN/8HAC0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=jkBZM1bzFm0CIlDuNyIQurZDJ4/6k++brmWhSk7b8ABNM6SAM3udmwFi0gH1z5d/P
	 kLuYjCsV9FH+kX+5VWKnNWT7GFLDFNc7r50XAciPTVbemyYsobBuZyM5G8y84UcLGZ
	 0qQAHj+lpro4QroGIoukCQoVqJpgT4VjE42VI+AAUeAn707JeODg2yEey699Fs38ye
	 b8s/nmQ4QoaGUuhmoiZLWR1WMdGwgjY+iLDdFKGkcVS7XmhnZu49y/DbEEXBSRNqxG
	 RuQ7CYgfp1MEKKgtU801tGnnnSiPhCgy43B8z/aZKDw4os79FGJTSkaKsbMSYhergQ
	 8PFSanxsaizCQ==
Message-ID: <6ef4172aeae6ea47b56fd012de653932.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4130821.6PsWsQAL7t@diego>
References: <4130821.6PsWsQAL7t@diego>
Subject: Re: [GIT PULL] Rockchip clock changes for 6.9 #1
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
Date: Wed, 28 Feb 2024 13:59:30 -0800
User-Agent: alot/0.10

Quoting Heiko Stuebner (2024-02-28 00:33:17)
> Hi Mike, Stephen,
>=20
> please find below a pull-request with some Rockchip clock changes for 6.9
>=20
> I guess the most interesting change is the removal of the CLK_NR_CLKS
> constant from the rk3588 binding. While it was nice to define the upper
> limit of clocks for array-search purposes, it was noted that changing this
> when adding new clocks actually breaks the ABI.
>=20
> Thankfully Sebastian invested the time to find a solution to not need that
> constant in the driver anymore.
>=20
> That change also got the needed review by dt-maintainers and people
> also checked the usage in i.e. u-boot, so it's better to do this now than
> later :-) .
>=20
>=20
> Please pull.
>=20
> Thanks
> Heiko
>=20
>=20
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd3=
3d:
>=20
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v6.9-rockchip-clk1
>=20
> for you to fetch changes up to 1361d75503fccc0e6b3ecbcd5bb53bbdfdc52f0a:
>=20
>   clk: rockchip: rk3399: Allow to set rate of clk_i2s0_frac's parent (202=
4-02-27 23:45:53 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
