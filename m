Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD4726F475;
	Thu, 22 May 2025 22:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747952417; cv=none; b=u8z2m0hZvsM+4m3jhZwxWgIF9nzz2CWSe5gc6RDDDh7xLD0x2Wo6FeZye0bgYLwaKUtsxoNQU2P9SO3A6EwHFosbKnbmJLWIu4/IBdTHXgYKOUA6DQMoAWULGVawmP3Nq7KpsYvkBI6Nb4FYW4Ti2By2GUa9eCBB4JiIoczdoGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747952417; c=relaxed/simple;
	bh=4pfRJM2Cisntvrl6mJz5uuoZDwcCDlg6+v8ugcnqxGI=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=nc9BRYwjFPyEzlHPl7UFvEWmlm/zJicmPcwLAQTVYK8mx3tkktGmsxkXDPZKWQBggwn4jaFYYhNkpllCrs/4eGL+v6lOjb8SSBhakYGBTjO38fjzUQKXMWGhu7MlzDYoBH+ipVZ02OnYIzqfCO8oj2K3MnTBVi+PbKowERFnhAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fa3BkRUF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fa3BkRUF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58A9FC4CEEB;
	Thu, 22 May 2025 22:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747952417;
	bh=4pfRJM2Cisntvrl6mJz5uuoZDwcCDlg6+v8ugcnqxGI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Fa3BkRUFRaTtdoDEV9Xs9IPvAmWFjVUL5FtIUaPn+bliOUXD9oQLod1HnKRcu8apm
	 3YFSvgwVCRFJ4GLk64kcTRxbZ1l6gUsPTFgFEB9B2kfhWX55/b8gsxSIfQa5pEgM5s
	 j/LxjbC8u5UiQ3R8ZJFC0AG4kIVyBJk+Ukr78HKCYATbdnr2ucDf9VupiGRvYG66Kr
	 z8LBb7jEil7YfjRdgKPhCd4NdUln8NO8yKhIGjIR6aWDOuKnh8P1ux33ly7LsLDDbL
	 jElAj6V3UePMzCWn1/xHoWVM8MXaVdfCQEmXLIK+oQnFsgsQbNxoOSzhWYm1oJQNEb
	 kup+EVqujhKpg==
Message-ID: <98b0268e7d3ac759402ebbe0f3c51f42@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <MA0P287MB226259FA30EF915465BE2759FE88A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
References: <MA0P287MB226259FA30EF915465BE2759FE88A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Subject: Re: [GIT PULL] RISC-V Sophgo clock drivers for v6.16
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, sophgo@lists.linux.dev, Inochi Amaoto <inochiama@gmail.com>, Chen Wang <unicorn_wang@outlook.com>
To: Chen Wang <unicorn_wang@outlook.com>, linux-clk@vger.kernel.org
Date: Thu, 22 May 2025 15:20:15 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Chen Wang (2025-05-06 18:42:46)
> Hey, Stephen,
>=20
> Please pull clock changes for RISC-V/Sophgo.
>=20
> I send this PR just want to expedite patches for these clock drivers.=20
> The patches have gone through several rounds of review.
>=20
> CV1800 series: [c-v1] [c-v2]
>=20
> Link:=20
> https://lore.kernel.org/linux-clk/20250430020932.307198-1-inochiama@gmail=
.com/=20
> [c-v1]
>=20
> Link:=20
> https://lore.kernel.org/linux-clk/20250504104553.1447819-1-inochiama@gmai=
l.com/=20
> [c-v2]
>=20
> SG2044 part: [s-v1], [s-v2], [s-v3] [s-v4] [s-v5]
>=20
> Link:=20
> https://lore.kernel.org/linux-clk/20241209082132.752775-1-inochiama@gmail=
.com/=20
> [s-v1]
>=20
> Link:=20
> https://lore.kernel.org/linux-clk/20250204084439.1602440-1-inochiama@gmai=
l.com/=20
> [s-v2]
>=20
> Link:=20
> https://lore.kernel.org/linux-clk/20250226232320.93791-1-inochiama@gmail.=
com/=20
> [s-v3]
>=20
> Link:=20
> https://lore.kernel.org/linux-clk/20250413224450.67244-1-inochiama@gmail.=
com/=20
> [s-v4]
>=20
> Link:=20
> https://lore.kernel.org/linux-clk/20250418020325.421257-1-inochiama@gmail=
.com/=20
> [s-v5]
>=20
> Thanks,
>=20
> Chen
>=20
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089a=
c8:
>=20
>  =C2=A0 Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
>=20
> are available in the Git repository at:
>=20
>  =C2=A0 https://github.com/sophgo/linux.git tags/riscv-sophgo-clk-for-v6.=
16
>=20
> for you to fetch changes up to 41b08610dd262dc4a5e1eff993b2d21eab8b8ba3:
>=20
>  =C2=A0 clk: sophgo: Add clock controller support for SG2044 SoC (2025-05=
-07=20
> 08:00:09 +0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
