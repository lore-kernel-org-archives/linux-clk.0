Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471D116F265;
	Mon,  1 Jul 2024 20:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719865232; cv=none; b=DratVT+es8XacwQy6VvIRyudbUqWTTvZEbZWKgJ8wnYkv6MVevUT6a5Kbo8O5DPG+VV7vN1O7SBg6C2cKUeLFejhXPSzejRzc/P32eGqJmOYiyj7xYJvk49raRniGfq0Kpd1aXf/R7oi1OdJD8n/eSuPG0sBHKB47R5JISSoxzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719865232; c=relaxed/simple;
	bh=ln5DZqMN9sVxtFbCsPgmgtK5W3yfYtcekuUMlck41pg=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=WFbmiC0UZBYh5dGxxrRa0gDIQWfer4OyT4KBM0mUA/JFFIkB3MvsO/rU6k99s4T1lTs9Zgs74Olec2U/mvkBEYaWxOKqbUcAxTZ7vzdUh3AV1A2G+2Uj0gIP7jAhoYRXY74UlUB3IVsA6Ffbbi5IrK4W/4Zv1ZWmPxD6QOSsb8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MGE+9Kj0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MGE+9Kj0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0F35C116B1;
	Mon,  1 Jul 2024 20:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719865231;
	bh=ln5DZqMN9sVxtFbCsPgmgtK5W3yfYtcekuUMlck41pg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=MGE+9Kj0zPc+O/IyNCes62ApTH0o4aftzBuKg/B5XH8s18DtkYZ+Ut7E4+9QVwaGA
	 awPFMFGWB/1T3Z8jvHTxcKOHbiBsHmlsvxageJ7eVUuBH3YlWLVJ8p86FXWiGtnlQt
	 9c5xFHLq5bPd6nhCJb+XCZIVywbXCEHp+eOr2kyEcB8mh4KQ0CAgliUMP0bRNZywG0
	 NqH5PWR9a7Qgx5blCv7DAnicbkTghb7RoWNHnNjx5XKUd1lFHIBfFc4pTSRz/GfvmP
	 KYLnn+2Y29KDJ1ISk8Rle6gzhlECSq5GDKemrduNO8EaWcwCr96iYRdt3NR+KbNV9O
	 Mn5txaAfPzUgA==
Message-ID: <85ecc8484e318a07a8b02f96ad316be5.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ZoLqC7gTDxEkNPsE@wens.tw>
References: <ZoLqC7gTDxEkNPsE@wens.tw>
Subject: Re: [GIT PULL] Allwinner clock fixes for 6.10
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org
To: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 01 Jul 2024 13:20:29 -0700
User-Agent: alot/0.10

Quoting Chen-Yu Tsai (2024-07-01 10:40:27)
> Hi Stephen,
>=20
> We have (hopefully) just one fix for the 6.10 cycle.
>=20
> Please pull.
>=20
>=20
> Thanks
> ChenYu
>=20
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfab=
d0:
>=20
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/su=
nxi-clk-fixes-for-6.10
>=20
> for you to fetch changes up to ea977d742507e534d9fe4f4d74256f6b7f589338:
>=20
>   clk: sunxi-ng: common: Don't call hw_to_ccu_common on hw without common=
 (2024-06-30 23:12:44 +0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes
