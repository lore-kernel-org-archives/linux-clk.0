Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC3714884B
	for <linux-clk@vger.kernel.org>; Mon,  8 Jul 2024 18:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720464996; cv=none; b=FwFA+CqNfhgXIF+Mh6LNP6WVYzafTj9yzAMWPc08eSUo/ml6WkqQaSCbEbVlGgG7CHUddg4cQs13uokmX07+kaZNEa8GdXH1aZbVL8Yji9BYUDZK6nFwWPb2Jo5n7MJMzbdevZoYXw9TM5MUbk7clD8Titgui80PsxIAL7DiMFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720464996; c=relaxed/simple;
	bh=auiFw9awF6KFKSRYHtSJbuHVjTlY6sK/YO7BzeVw8ZA=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=n/wOMdEBdIO/9uNUIBfer/Gi5WaXXn1dLu2FJRQKGzlKXgvHXs9Xlud3mpTAnVyMZtWh2uqRAwUpG8C7t57lppnJ1LLuANsCaRuj+scNZm8OnLy6CvByp87/qiUh0kDzsBLJKNrY5jN2xKllbUzkQwS5vUc9onx+ehXr6Llk1OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q2+KXTCF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q2+KXTCF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EF69C116B1;
	Mon,  8 Jul 2024 18:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720464996;
	bh=auiFw9awF6KFKSRYHtSJbuHVjTlY6sK/YO7BzeVw8ZA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=q2+KXTCFUIzUl2gz3qHDLvrScrBgQdRYrcNG8RKW9FzFqLqNV9+sYr3V91YziR5Fn
	 DZF4YzexK47fgJLS/rrg8gPdoz7VNImWmCtOYbuuZzon41O4LfMpI9KOOlp2XoP4vo
	 7bK8bhuzkaUgX9B7OhFQYbN6WnejqW2E7BNzxTysfx/wJWSY8mKABrw5EOuJNZoGwW
	 3JcsHGNHCtMG5Rc381cXatEfKs75MQ8sGJfEUY9w2rNyxvZiLIFjDbLkeQAYzEqmQR
	 tRcSW9C/5d0jM+4mmWpIMD3j2T87F8RlJ7qbJFzsgC15wsrXr2QE/zyki8UEYCNHQO
	 KLeGIjKGm6tRA==
Message-ID: <b8dbdde2412d974baa24611b16cda5f7.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <MA0P287MB28221A333D852974F55E3228FEC22@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
References: <MA0P287MB28221A333D852974F55E3228FEC22@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Subject: Re: [GIT PULL] RISC-V Sophgo SG2042 clock drivers for v6.11
From: Stephen Boyd <sboyd@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, Inochi Amaoto <inochiama@outlook.com>, Xiaoguang Xing <xiaoguang.xing@sophgo.com>, haijiao.liu@sophgo.com, Chao Wei <chao.wei@sophgo.com>, unicorn_wang@outlook.com
To: Chen Wang <unicorn_wang@outlook.com>, linux-clk@vger.kernel.org
Date: Mon, 08 Jul 2024 11:56:33 -0700
User-Agent: alot/0.10

Quoting Chen Wang (2024-06-14 00:28:22)
> Hey, Stephen,
>=20
> Please pull clock changes for RISC-V/Sophgo/SG2042.
>=20
> For dts part, I will handle it at my side.
>=20
> I send this PR just want to expedite patches for this clock driver. The=20
> patches have gone through 16 rounds of review [1], and I have carefully=20
> checked and revised all of them based on everyone's comments.
>=20
> Link:=20
> https://lore.kernel.org/linux-riscv/cover.1717661798.git.unicorn_wang@out=
look.com/=20
> [1]
>=20
> Thanks,
> Chen.
>=20
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfab=
d0:
>=20
>  =C2=A0 Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
>=20
> are available in the Git repository at:
>=20
>  =C2=A0 https://github.com/sophgo/linux.git tags/riscv-sg2042-clk-for-v6.=
11
>=20
> for you to fetch changes up to 48cf7e01386e7e35ea12255bc401bdd484c34e7d:
>=20
>  =C2=A0 clk: sophgo: Add SG2042 clock driver (2024-06-14 14:49:40 +0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
