Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F142F872;
	Sat, 20 Sep 2025 04:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758344169; cv=none; b=OB4BhICcVPqtlMwe6uosCZV8Yxlq3x1vNnp6uI6vm59oAdcrH758ByULzy8DahILysI+TCH+arbLaAUUXGF7Gnw1EAOQ5zye2nBNozXRSEUnUDnoSqAdfvxvrslDtD2HBErCsiezujBlM2YXqTDRab8Y3ES/6Dqzl3Xh79n79Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758344169; c=relaxed/simple;
	bh=Biu5/nSCam/FzFzH8JNl9oaXp+deF2hXBG6jQYyiLho=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=U3/MBjGayRuQFEJyXJMsur92jzDj6OKQr70++aA4F3ULkEYjzzZGlBJzOS485mA41EqZvdl5LSZA3qnPueSMoXTcs1gsPQfxfwkAdRIunyB7sYAsFQei81zuCsD/wMsFi2VSx77kMiT7NJYxlYJy2vTz72LIfikbedF6LwTBEBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KR/rSk8v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KR/rSk8v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50109C4CEEB;
	Sat, 20 Sep 2025 04:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758344169;
	bh=Biu5/nSCam/FzFzH8JNl9oaXp+deF2hXBG6jQYyiLho=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=KR/rSk8vwcuEgNinJuRzFYBdKSb2yo2RURiv7olE/CtuMxgMRHDyB95VwQob7NLJF
	 uK6yMFsqfaI/stgUzpvNla3ZPLuzJU3ytPkE/9ha04U7Y+qARSl/Yez0rY8RlkOARa
	 9k6dX8ResNW1l4HA/B0nmSEze4O7QDdElSBkATChulxCCPGezNSF8Sa/+eilepH5EG
	 SPjAc+NhoPbrQVEHMPJ6s2sJ4BEm9zYbwfiagsKfEbj1oLaYczmYrMx7CUOfKm7T+w
	 5Ks2M5zjS0/n4SsRl12Sv3s0+6udOHYu/3LsatBIuHCPF0bbHakQCAULAxkBtCXZvY
	 4gP9iRwnmnxEQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aMwwDAnj4QshEHdI@wens.tw>
References: <aMwwDAnj4QshEHdI@wens.tw>
Subject: Re: [GIT PULL] Allwinner clock changes for 6.18
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org
To: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 19 Sep 2025 21:56:08 -0700
Message-ID: <175834416841.4354.1771947113977046836@lazor>
User-Agent: alot/0.11

Quoting Chen-Yu Tsai (2025-09-18 09:15:08)
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d5=
85:
>=20
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/su=
nxi-clk-for-6.18
>=20
> for you to fetch changes up to 598e4b6713b54267acc257b3c66a269079ee4d8f:
>=20
>   clk: sunxi-ng: add support for the A523/T527 MCU CCU (2025-09-13 13:50:=
52 +0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
