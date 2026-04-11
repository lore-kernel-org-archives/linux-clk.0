Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFC025392A;
	Sat, 11 Apr 2026 23:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775950736; cv=none; b=ipcbCCRx77jk/Xk1hUIvtmbNPdfwE6+TEOJ338WVpr+6g0vf9GllghDLyqqqx6Dvo8prNNf/PFCvbz2nq6Nmll9q7uBJ2Vd40AUD8Xz3hAshQOB/U479hDEsV61aC+adWSe7NeC5qZUpGJKO7ag3CsGJRkMA16csYHCmz7NQrls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775950736; c=relaxed/simple;
	bh=l2VcwxsSAr9x5y3aKU4A1/44ughIiDrX1V9J5uhH0Ts=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=o8A1Kvyrb0GuLGaBBrdV2Rh3eElMti2SoqIibmTKPjbnJcffVIH4GeyQtz+KMEqrY2RxLCfNZ5lWO/+IIJBaFmvofedv6zFH8W9f48NwZmvWXwVOKQrUQRtSYeD2jcb8nCwjpNCeLtVsC9liOsfNjQ0lfCsR1xS+M8Cvpffas0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VPfD8W+D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VPfD8W+D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D13F8C116C6;
	Sat, 11 Apr 2026 23:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775950735;
	bh=l2VcwxsSAr9x5y3aKU4A1/44ughIiDrX1V9J5uhH0Ts=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=VPfD8W+Df43r9A0T/RiN3AusAlp+hU7GQB0kLw+Ncwr5mXgRz1bMwlvYZ10z1iUQl
	 Xh3plgtZRUcGoBgx65iu9NWEyxVkXu1hFlq32FYqQ5lFTpse9sVMnxj0dFV60OZ0LX
	 8okqnhI/7c8XBO357xLgl1dNV53YwL0Ck4vMzZST/hs92+5mIKf1eYPOuVNGVHmh+e
	 rVOKv+RYzy4u/KOgYZ0rDKBk9cq6nbwOGqTbNtvMEEB2JYdgLpE3IXbCQQL2leRCBk
	 KidOYHQW5mLJ40VnJE1YH+xrLmTumC1Kt+79w/3CZLTRQCFDim3DZJ7WejTnukW/6I
	 5VY+FMyLeJw5A==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aZuK4-QJCXUeSxtL@redhat.com>
References: <aZuK4-QJCXUeSxtL@redhat.com>
Subject: Re: [GIT PULL] clk: remove deprecated round_rate functions from the clk core for v7.1
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To: Brian Masney <bmasney@redhat.com>, Michael Turquette <mturquette@baylibre.com>
Date: Sat, 11 Apr 2026 16:38:53 -0700
Message-ID: <177595073393.5403.14055981948733048563@lazor>
User-Agent: alot/0.12

Quoting Brian Masney (2026-02-22 15:01:55)
> Hi Stephen,
>=20
> Here's a small pull for patches that I previously posted that removes
> several deprecated APIs from the clk core. Details are in the signed
> tag. I assembled this pull with the following b4 commands:
>=20
>     b4 am 20251212-clk-remove-round-rate-v1-0-5c3d5f3edc78@redhat.com
>     b4 am --cherry-pick 26-27 20260108-clk-divider-round-rate-v1-0-535a3e=
d73bf3@redhat.com
>=20
>=20
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f2=
7f:
>=20
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/masneyb/linux tags/clk-remove-deprecated-apis-v7.1
>=20
> for you to fetch changes up to d4851759742c1322f498021dab882d322fc34a1d:
>=20
>   clk: divider: remove divider_round_rate() and divider_round_rate_parent=
() (2026-02-22 17:38:37 -0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
