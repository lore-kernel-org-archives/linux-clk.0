Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BB91A9F8E;
	Sat, 20 Sep 2025 04:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758342605; cv=none; b=rNaIRjICCS6Gqz+R8/nU0D9S9Kx6/E5L+KK8pOQoePf2zok90quD06NjJwimp1howI7qSE6+qDmxLOQvMdIlA0uC5zC86GwfeBY6Eh55uA1ZFKfNPE4AZ1sNUqneWQNmm0GHlXGgA7nAgJj/N84Yy3T2U5sfXtoaRQmkXjlnqfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758342605; c=relaxed/simple;
	bh=WWtb5RmMLMkuX91JUtNIkegxuPuEXNBdboc6g1v5k7k=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Kyt7yaVm3TL6KMZDkxWB0sRB2lvZxHE6GLiA5HjjL/MrTBa/McscRB9QwE9V2ni/TEttLIIEaSFMw0WFFG1FbHyv9h9cBqiNCp3/HymhiPM/TV7mtget2YX2WsXIbQf5RSphPSZODBrcEw8yWj+uj88+xFVholdc+T34XyPDFBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rtxsaKzE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rtxsaKzE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A693AC4CEEB;
	Sat, 20 Sep 2025 04:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758342604;
	bh=WWtb5RmMLMkuX91JUtNIkegxuPuEXNBdboc6g1v5k7k=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=rtxsaKzE6lPTY+7/FvmoXMMZcVILaOTEE/7C8k57aGfBNEh86mmmivNMrRUgwJzxV
	 /VNPhAJX7q9Bb5TPejFzL1s2zNJ86agmmR7HdLxiGgnbseTUBmAdtfnt1WVznBxsO1
	 +fVp6en/DYfnsiDyMe34pcnd6hSPYgX9JHpsO1xbWrE6QlA6I0nXUTmMvWKJ7GJkc/
	 W9CV5YUhrTPtQB5ns3RbFIz0v3i+5FPpN1eA5HvKgE0TPHZ3hMGhcjU4tHSpeKtfUX
	 KYJCRBKJgfat17jgITMK4afPlqVmewLkYNHAVJv7SQwjx7WhUwEz9+8W310mLSn9SO
	 Qddtl6eg5HnMQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aMwv9a0BjBfEsL-3@wens.tw>
References: <aMwv9a0BjBfEsL-3@wens.tw>
Subject: Re: [GIT PULL] Allwinner clock fixes for 6.17
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org
To: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 19 Sep 2025 21:30:03 -0700
Message-ID: <175834260343.4354.15752239467014722270@lazor>
User-Agent: alot/0.11

Quoting Chen-Yu Tsai (2025-09-18 09:14:45)
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d5=
85:
>=20
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/su=
nxi-clk-fixes-for-6.17
>=20
> for you to fetch changes up to 25fbbaf515acd13399589bd5ee6de5f35740cef2:
>=20
>   clk: sunxi-ng: mp: Fix dual-divider clock rate readback (2025-09-10 23:=
45:48 +0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes
