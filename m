Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE302940D;
	Sun, 21 Sep 2025 18:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758478034; cv=none; b=kpg/Mjzo0ZEHldcM/R+uY9gp21ayQi6EEJ15kwRson8ykKHPQsS4JaJd8W7Hm8i5QsuJ34kRp5P3lMW8Z0CB3oea9ZMaxkReeMRGjYEQSMFaP0TJdFOl77YCO+z9nLyINmdxUzBGaS4QZXg1T9sCSkwImEkogWTrzNTF2u0D8GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758478034; c=relaxed/simple;
	bh=pa2WC7yfAfVWbt4k6CeSwbBCdF7ZFQ7FE81XX8Dk+dM=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=gHeAGb9AKq90Bb8wN6c5SkxIvKlwFNvq4cHEq3xRnZsytEOX7P/uv5WTBB6O+fU307Kg1KcHnjwN305fWW1V0/J835QRVWaCctMBqi4OG3O73NFNLp0k8BVsZwpPQqIVwQ03/3NCYTliwShR+C29SDOQ7OlkOKMtysC9yRTSGq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f+urJkm+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f+urJkm+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7225C4CEE7;
	Sun, 21 Sep 2025 18:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758478033;
	bh=pa2WC7yfAfVWbt4k6CeSwbBCdF7ZFQ7FE81XX8Dk+dM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=f+urJkm+WQud0i0WqDcilhtMS9pfJ63ZGprvZbvGxHPn7WAi1DO81Mwt61Ip0bZJO
	 3Jle5HhrtCoqdeL5pYQ2EyGiKUIOZoWM4xRNpstuh3zgyo6xHMI0XvGHxEijZEaLEJ
	 wC6Vimin1D4byn1AjCYXI8/QXMGmsT5svIELYHSsgM5Ij9eU0dkDLFnXchgi4q2NFA
	 Z1W93IungxB2z1c280zupjdwW9h0c/h1agKQZeIjna7fYPxIMiEpbmOGwMjs9OQshb
	 lF4wZW8iXXoWIk2oQd0H7D3umaR72J4CPo4tU2833pF4z4ElmDVS7Bgzyheg2DxU/z
	 rKOFeIETT1siw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <175847754602.596.4377149237007455593@166871acc15a>
References: <175847754602.596.4377149237007455593@166871acc15a>
Subject: Re: [REGRESSION] clk/clk-next: (build) =?utf-8?b?4oCYbXRrX3BsbF9yb3VuZF9yYXRl4oCZ?= undeclared here (not in a function); did you ...
From: Stephen Boyd <sboyd@kernel.org>
Cc: gus@collabora.com, linux-clk@vger.kernel.org
To: KernelCI bot <bot@kernelci.org>, kernelci-results@groups.io, kernelci@lists.linux.dev
Date: Sun, 21 Sep 2025 11:07:12 -0700
Message-ID: <175847803221.4354.483699676036796745@lazor>
User-Agent: alot/0.11

Quoting KernelCI bot (2025-09-21 10:59:06)
>=20
>=20
>=20
>=20
> Hello,
>=20
> New build issue found on clk/clk-next:
>=20
> ---
>  =E2=80=98mtk_pll_round_rate=E2=80=99 undeclared here (not in a function)=
; did you mean =E2=80=98mtk_pll_set_rate=E2=80=99? in drivers/clk/mediatek/=
clk-pll.o (drivers/clk/mediatek/clk-pll.c) [logspec:kbuild,kbuild.compiler.=
error]
> ---

Thanks. I'll fix it in the merge.
