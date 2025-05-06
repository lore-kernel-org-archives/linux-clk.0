Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8647C139E
	for <linux-clk@vger.kernel.org>; Tue,  6 May 2025 21:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746565804; cv=none; b=eR8f2v+N5B+9LZ2eFSTirxbkqOcKELmTqa7JlPXVvmYUCvRibEYC8Qo/rpg7vvQSy1di7cs5b+caOtA92zatcCitv9a+DKW8d9C4rT4K9naeYGWVP5MM3REMZNASwyB5oFjrYqfdzMK/CMsq57YhLmLRYEEeCSehl7wadqy4hso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746565804; c=relaxed/simple;
	bh=x2RtCiL0ifwL4EY5K0Ngbx+DtOeymI4c9bAZgvvdVfM=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=cmdpbnpVIuKTKRN5a+ujQdpCm6YfvCiMX7s0Ve+0RmLUwlrQ6Hb/codmD+x9UcBFA4yB9G4C5JbpzWVdLod51amsikpylk6CzDMZGi/gao9Vdv4Zk+WqSOP2PuD+Alez1ZEf0DITSxGaXyjGWkMiaw87BF5YxiocOp0hXl75GYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zb95le6f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zb95le6f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E255FC4CEE4;
	Tue,  6 May 2025 21:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746565804;
	bh=x2RtCiL0ifwL4EY5K0Ngbx+DtOeymI4c9bAZgvvdVfM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Zb95le6fCCUYUC7CYE/nf1JCPE3hd10Si5WXW1qxWZHXXMFCJnUQFoSkC5xqIgSU+
	 wnkmIbkRhxsk7MBXcRfuQCRkn8bDIxf+5OpWYKhxofBNqxLvV2EYj6V7ePUEaBU9Vf
	 iSBQU61tmgMRt6eE0zXkbLGt5zRv+Shr+4oCnoiQroaYmrPVkDl9i7flTO63kxutJI
	 m1jGNF0hmPZRXUi18u4hQd9A1KwP11WEZ4waaHJaScIytAtQxIo+XKw4tcUV04+kZN
	 KNJQ46YwLfq2DN7+EmZ/OdBRD+9YpieGjPdkAl3y8fhoNZgUfmFYyai9+go9jQYKWe
	 9YLDH5MEINWbQ==
Message-ID: <8be14931dffbe69af0135962f7917d0b@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3034384.VdNmn5OnKV@diego>
References: <3034384.VdNmn5OnKV@diego>
Subject: Re: [GIT PULL] Rockchip clock fixes for 6.15
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
Date: Tue, 06 May 2025 14:10:01 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Heiko Stuebner (2025-05-04 15:08:50)
> Hi Mike, Stephen,
>=20
> for once I do have a fix for the running 6.15-rc round.
> The nvmem support for the rk3576 encountered a number of mishaps.
>=20
> First the clk patch was marked as applied with the driver patches [0], th=
en
> on the way from the nvmem tree to GregKH's tree something went wrong which
> caused the whole nvmem patches to reach Greg after the merge-window [1]
> which in turn meant that the otp driver change landed only after 6.15-rc3=
 .
>=20
>=20
> So right now, both the driver change as well as the devicetree parts are =
in
> 6.15-rc, but that one gate definition from below is missing for everything
> to work.
>=20
> So, please pull :-)=20
>=20
> Thanks a lot
> Heiko
>=20
>=20
>=20
> [0] https://lore.kernel.org/all/173978599692.25901.15315285566342669137.b=
4-ty@linaro.org/
> [1] https://lore.kernel.org/all/20250411112251.68002-1-srinivas.kandagatl=
a@linaro.org/
>=20
>=20
>=20
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089a=
c8:
>=20
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v6.15-rockchip-clkfixes1
>=20
> for you to fetch changes up to d934a93bbcccd551c142206b8129903d18126261:
>=20
>   clk: rockchip: rk3576: define clk_otp_phy_g (2025-04-26 00:04:49 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes
