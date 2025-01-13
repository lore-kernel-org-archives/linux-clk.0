Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE081C3F30;
	Mon, 13 Jan 2025 21:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736804337; cv=none; b=ZdK13hXODv8w2kYPqI6B/telaq4dmgFMCHnwZmGnvCdsLqRD5q5dONJCaN1Db8FazOJPHivWDlOvm5devQeJMWxCWEvUSqVIPKtIk3Q2YzL/SYB2e/B8KBYMWVqUTn3bNyG8qzXAJqSZKp2z/iBffz6K5sHBe43zrBNSln3D0Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736804337; c=relaxed/simple;
	bh=m/cvfR4XPjeL5EZLp3gh0FhyWowV/OmMngrC8MfECH0=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=LsnNOwnp4fb6XAowMmrKJshWvzPyTs0f8U1hGsu/USnaIZbcQGbuFzyIXF18yqoWTbe1kB5ObUkbPNP77Ps06LgRd3CIKf7xEcAh+Z3HHg+nL6agKHSq4GG79GTRlNGVfkC98zbqvMLNJ2UgbUVMXH7ysdgn0GFE92p7PQGyAyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YkZIkY1b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YkZIkY1b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D421AC4CED6;
	Mon, 13 Jan 2025 21:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736804336;
	bh=m/cvfR4XPjeL5EZLp3gh0FhyWowV/OmMngrC8MfECH0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=YkZIkY1bxz4WhoT3AehLk18W3BVhppJNfY1e10jsdYcpxxg5dPa5FHDfPmYIhxRhj
	 qRQx9qq0/QmAydOJykOBjFnjkXkNjdnbXoGJ4808rD/4zrqE9/qD9JTehEIm7Nklga
	 ldP0e8e+wMF0wkCzRpnNbWUSXZQzjtw4NGu8ORvd+CsdOuonFiSx0/h+pH20uGQ+eY
	 Jgi1hgimPiTwsUV0dRH/aEbmvtd43CR7GJl8w8U95DgAO4WdHfdNSof3APA8cULyau
	 nOlM3sxUjcyCR9vR1eUjm+9bwIEFREMsEXdsZuHXQQUe/u1Zfyf4PVR5+dZJr0hvEx
	 2U2SZTcNkictA==
Message-ID: <9cc51504129e411dcb69945f15351006.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250113-th1520-clk_ignore_unused-v1-2-0b08fb813438@tenstorrent.com>
References: <20250113-th1520-clk_ignore_unused-v1-0-0b08fb813438@tenstorrent.com> <20250113-th1520-clk_ignore_unused-v1-2-0b08fb813438@tenstorrent.com>
Subject: Re: [PATCH RESEND 2/2] clk: thead: Add CLK_IGNORE_UNUSED to fix TH1520 boot
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
To: Drew Fustini <dfustini@tenstorrent.com>, Drew Fustini <drew@pdp7.com>, Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Yangtao Li <frank.li@vivo.com>
Date: Mon, 13 Jan 2025 13:38:54 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Drew Fustini (2025-01-13 12:31:25)
> Add the CLK_IGNORE_UNUSED flag to apb_pclk, cpu2peri_x2h_clk,
> perisys_apb2_hclk and perisys_apb3_hclk.
>=20
> Without this flag, the boot hangs after "clk: Disabling unused clocks"
> unless clk_ignore_unused is in the kernel cmdline.
>=20
> Fixes: ae81b69fd2b1 ("clk: thead: Add support for T-Head TH1520 AP_SUBSYS=
 clocks")
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---

Applied to clk-next
