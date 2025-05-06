Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CD62459F0;
	Tue,  6 May 2025 18:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746554530; cv=none; b=FX5pnVKPtp9/RY7jMbDdUKs987SzdM9f4rGmrmdQXE0WH6kl39Y/9kPgcWVRWZFAjdKXiumZYwN/DhCBS9UW5OHnOZc07QuZMuzlw1xb1/Ab7o+ZVoTxudjoQ9Xk0A3z/qDig1R/S/a5oByWQK8gOlyA6B7stJKohqaEKoNG92A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746554530; c=relaxed/simple;
	bh=G1aAgIJtzzc73TTKS2uIpwQA5CYlGrgkkGROGjWiHJc=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=cngn/855OgPnxIpCfdBeoZxkl7IcpTilUOyn9Pb8bVjFfBcs2vRf0fNwVybHGL21N0JLgwEXkAXVWrUZxzyOHjshzcR69JzLxaDKBMQovA3h2lWQDeh2Z16F9AsBOLLVx1Dx77qkMl2kFSEi6/+D7S1GpP27DAsHtGe87+S/jEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i4SvuSe0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i4SvuSe0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4AC2C4CEE4;
	Tue,  6 May 2025 18:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746554529;
	bh=G1aAgIJtzzc73TTKS2uIpwQA5CYlGrgkkGROGjWiHJc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=i4SvuSe0YE8MMNUJxcCVHkmGXKZbd6WaRRQhWFLObz9I6aPU+2v6xuBzi441ddLXp
	 WTRpCGegaBLcNbYhl4JwxITBh5lbWwSvZZLPpSAVFTLe2gej/7I3GgQTTLOgrhJMlB
	 uFMatuCF56OIwrgds16aBKk/2abnG46sKh6xh3EfTDrH+Ar6oItNpHZBk0ttxcLfU3
	 N+l3eQ9beE/mGxUloJ7BMnoyDlPY8qvJ4KDBvfF25a5FdtikmGae3qkTFCYxN5sxr2
	 fL/5hcVCmrMwkkXfl2x//7f8lHaiAthvn0ksThAe/ytgGK1Xg+E1ZXo0gk+kcAMVLr
	 0Ps6rElpiCQRw==
Message-ID: <a28e4eca6e2a9522cb8e707845a9117b@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250430012941-GYA288294@gentoo>
References: <20250430012941-GYA288294@gentoo>
Subject: Re: [GIT PULL] clk: spacemit: Add K1 SoC clk driver for v6.16
From: Stephen Boyd <sboyd@kernel.org>
Cc: spacemit@lists.linux.dev, linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, Haylen Chu <heylenay@4d2.org>, Inochi Amaoto <inochiama@gmail.com>, Alex Elder <elder@riscstar.com>
To: Michael Turquette <mturquette@baylibre.com>, Yixun Lan <dlan@gentoo.org>
Date: Tue, 06 May 2025 11:02:07 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Yixun Lan (2025-04-29 18:29:41)
> Hi Stephen, Mike
>=20
>   Here is clock driver added for SpacemiT K1 SoC, please pull for v6.16
>=20
> Yixun Lan (dlan)
>=20
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089a=
c8:
>=20
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/spacemit-com/linux tags/spacemit-clk-for-6.16-1
>=20
> for you to fetch changes up to 49625c6e4d90a9221127c49a11eb8c95732bb690:
>=20
>   clk: spacemit: k1: Add TWSI8 bus and function clocks (2025-04-17 03:22:=
56 +0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
