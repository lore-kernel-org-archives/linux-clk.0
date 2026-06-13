Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8D7348860;
	Sat, 13 Jun 2026 22:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781391311; cv=none; b=N7O2aLEhTkQE+9VZLnKktNZnfggl0AfBAD6ydUGWTCs0F24IahAMzFKEv15jYIj9OUNdEn7lVM0EsOqnOG1aIes/RCV4MuVwZDHxgzx075pCH5AnelscKTM7hYV4eOxb0C+EAydhhttU4fwEMd1+mfv5YCuDwMAMKW/wjGvLhRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781391311; c=relaxed/simple;
	bh=9HgDSIOh+IPk/7F7FkWleLGWGt9wkoX3ysjJB/epokM=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Y93DgGxVwMj6NOv4EoOQTKIP7LZtr2uUZ8Co6faOeadx7D2/so/sCOS9fWgC6cpMJuXRnYYNM/zHS8L+TQPCFCClt7nackUCgfiHb7cx4XcVyRsVGExO6G2OrUUB8uBegF7IzS/H40fHvFvrkrdIYpNA1DnSN2HZnmnBMSEfYaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GeszxUzG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GeszxUzG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7E061F000E9;
	Sat, 13 Jun 2026 22:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781391309;
	bh=kFm/v8Fkne9Zzw1gl0HAOhSOwY2bIVLPIqywqA2BEIY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=GeszxUzGdoFfGIl3Rg3mVslKGfhdVnmL7xoAsuiKjMN0BhjmfBhkhBOECqf12aKez
	 tqU24lDpT4OEXIo2t/LKi1s8slrMnfS4mg7EZZaaKqqIhEgjJLcuzS4apNxE9W+Do7
	 EY1FLNLNp9brwBQwXb0Rm/OiiVD/8WMffYfBsSM6JSGHo0839A+v6gGTYC7XGq4qG0
	 M+POoprV1E9mufcllrbGQ6PwyHD6EPHKIB3U6kyywieIJeDIMGAfgtVIVzVap6ihsz
	 l6i/VQadBWqUG6fJ5MyBhHTW3ksGD3BLxie3xJtE+oNPac0CDhJJIZfD6+Zg3IuvZS
	 v4WHYJZxwwLMw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260609052422-KYC4837748@kernel.org>
References: <20260609052422-KYC4837748@kernel.org>
Subject: Re: [GIT PULL] clk: spacemit: Updates for v7.2
From: Stephen Boyd <sboyd@kernel.org>
Cc: Yixun Lan <dlan@gentoo.org>, Michael Turquette <mturquette@baylibre.com>, Inochi Amaoto <inochiama@gmail.com>, linux-clk@vger.kernel.org, spacemit@lists.linux.dev, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
To: Yixun Lan <dlan@kernel.org>
Date: Sat, 13 Jun 2026 14:55:19 -0700
Message-ID: <178138771970.819343.13341743695486361093@localhost.localdomain>
User-Agent: alot/0.12

Quoting Yixun Lan (2026-06-08 22:28:09)
> From: Yixun Lan <dlan@gentoo.org>
>=20
> Hi Stephen,
>=20
>    Please pull SpacemiT's clock changes for v7.2
> All clock changes are related to PCIe for K3 SoC.
>    Hope this isn't too late..
>=20
> Yixun Lan
>=20
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e7=
31:
>=20
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/spacemit-com/linux spacemit-clk-for-7.2-1
>=20
> for you to fetch changes up to a37c75d7b5bb7f3344b0e639b313ac5ace6244ff:
>=20
>   clk: spacemit: k3: Add PCIe DBI clock (2026-06-02 07:16:59 +0000)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
