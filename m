Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B970834BA2E;
	Sun, 21 Sep 2025 19:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758484698; cv=none; b=GVSpVT+dKfgBk+Yb8HXdzrlF00YXo0p4l+m98SFzrahTS78tP4NId7KLDtYxDyMeAGluEOZrZ3TlbLz+db9wLpxvydFiDW3tIdzBfVYlN6wkuIMfEE2C/F4j+2zUnQIZDokSMPYpVOV12384p6at00dOZf4BJV1uf1PbsNYg3xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758484698; c=relaxed/simple;
	bh=zltGFf/iswHLioFD+7yrHPrDgYZxBlcwDu6SYUJNQg4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=HK737z07tFbjsrI+DGWdVPpMPZflYEwxXdYF1KIKno6HzreUFsTA82egxh2qzVg1UTtJTC9LVM7HZVMwvzISWSnssE15dI0UJ+NYeWExAajTDANt0Fr6rPgp4hkbXX/cD/8vuQFFMaTwhLpvqKq9nN8PNdybO979CIv+WC1P88A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=USeqBhhl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="USeqBhhl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED896C4CEE7;
	Sun, 21 Sep 2025 19:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758484698;
	bh=zltGFf/iswHLioFD+7yrHPrDgYZxBlcwDu6SYUJNQg4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=USeqBhhlqudd2ayH26X/wWpf9M65wlqMolkJtsZiT8n/tGFNAmdpDa9E5vfdHq8nq
	 sWmham3lJfgTG5+vY5dchand2nK+CyAKd1YfvZbePRSANlbxK/Q8hdNR8OX42HaH+K
	 eu1rwPZ6hu9JWvdiC4JH5ZXFVRiKAJO0sb7h4at02SHGjChF1VlWHrHF+7UlyHrTJu
	 REifoKLTyt/Ap9IMk0Oo4lvv70PCMIlTTUdC7vE5oDbbADqsZ9NeFUeYsOU2GMcf+j
	 bYlOGE0DrSB/g77uJ9k+q4RUqWqRsY/DCLTJ1UOVGhR4rmF+/GK02ebwNkH2O6oYDQ
	 YIFFMuZuvyXmA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250706201158.1371209-1-alok.a.tiwari@oracle.com>
References: <20250706201158.1371209-1-alok.a.tiwari@oracle.com>
Subject: Re: [PATCH] clk: nxp: Fix pll0 rate check condition in LPC18xx CGU driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: alok.a.tiwari@oracle.com, darren.kenny@oracle.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To: Alok Tiwari <alok.a.tiwari@oracle.com>, linux-clk@vger.kernel.org, vz@mleia.com
Date: Sun, 21 Sep 2025 12:58:16 -0700
Message-ID: <175848469633.4354.18141546693422292683@lazor>
User-Agent: alot/0.11

Quoting Alok Tiwari (2025-07-06 13:11:55)
> The conditional check for the PLL0 multiplier 'm' used a logical AND
> instead of OR, making the range check ineffective. This patch replaces
> && with || to correctly reject invalid values of 'm' that are either
> less than or equal to 0 or greater than LPC18XX_PLL0_MSEL_MAX.
>=20
> This ensures proper bounds checking during clk rate setting and rounding.
>=20
> Fixes: b04e0b8fd544 ("clk: add lpc18xx cgu clk driver")
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---

Applied to clk-next
