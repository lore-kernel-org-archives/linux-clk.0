Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B796392822;
	Wed, 12 Aug 2026 04:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786507978; cv=none; b=o0Si06d0yD5GIgDEZcFvTAR9pLVa4gmEmp+CZb+zfI3D3CLbefpGkQGjccXECZcZ0yWRK6oILLqgMjln05TM38mBhVjVky44LOLp3vF6doPSCq0UvfswJM7rrRfdEW2n8xoZo2zOAIS3zJjZTxjCpFz//DAEUbZtyXCUp5NSJdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786507978; c=relaxed/simple;
	bh=3GyCG4ENPjU2er/ZD6EGkYAtIY++ZEzzHLnDekFIgjk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Q6d6kpqcT9XIyppp8Rijw9RLJo4tPM6ekeyBxO0QsPZNAd6OYBvfMVnhuaR0UR9Gjd13tyr50ABqiLy5CSlazGWLuTe0e7e1c2ZOKbrahFLEWyi3LW442DB5bnaxokdfTlE0csESzbqg4qFGzsHvVquXpA//LJ3Rg5Yp3K0ImQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O3mIj5F+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O3mIj5F+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E13541F000E9;
	Wed, 12 Aug 2026 04:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786507977;
	bh=RrHE3aGIrKTKDwX3FTWtTlRI2BGruV0cbyers61/ziI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=O3mIj5F+4MY6GAdjIfrFUBGNJPj4AncHaim/thcAVCLfAcLFEDso7WM7HsPL4MlBu
	 1lVaiAyR9TPxbi2ItFYv1D9jdN/+RSD5CufnoZ1RMsZVcwPFLLuL0Ky5OyZ9ZmY9D1
	 61OYpwC6BLpGBuD49SNH9M7b3uCPoGsNdZJs8TpSZ2AvTkjRxVwVo8brNdLoBDDmrE
	 E8RCsqvtAgtrFYQqdVL0kFQyYkzsR4kbEkudvvJ6YEIbQEBn64vQg0EDWZAOuvVxri
	 D3NRt7On3KapAFqe56m/r7+5ibixvSArrNuAffnY20wfTAI4MQFd9N5x11vnHddIOV
	 1tgLNZ+DH5HWg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1786090463.git.geert+renesas@glider.be>
References: <cover.1786090463.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v7.3 (take two)
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Tue, 11 Aug 2026 21:12:55 -0700
Message-ID: <178650797526.5862.14608140389393921420@lazor>
User-Agent: alot/0.12

Quoting Geert Uytterhoeven (2026-08-07 01:19:54)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 2df26b8663b6f315d0e9364927c8503280fe3d=
d3:
>=20
>   clk: r9a08g045: Add clocks and resets for CAN-FD (2026-07-13 13:58:01 +=
0200)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v7.3-tag2
>=20
> for you to fetch changes up to 0fb9083a6e56f688aeeccfc7ef7eeba586e57dc6:
>=20
>   clk: renesas: Add R-Car X5H CPG driver (2026-08-06 10:00:14 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
