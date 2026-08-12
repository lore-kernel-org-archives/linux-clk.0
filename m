Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB26B1E0E14;
	Wed, 12 Aug 2026 06:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786514978; cv=none; b=Gdkj7HDQXkuprosElklvrJimkORdudgj1Ftg1E5S7zn8yuB1a1aP829rniLnuYaGZmGWLdbLxIvpESLagh3wDcWOpSI6Wie3wQJgHc9l1OYC0VwxmcI1HoWr9OqfNV6Isw+gVfi8z2NM7IqqHEGbZosJrqUETnvQiSu9mgmdHa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786514978; c=relaxed/simple;
	bh=09JDyGpGABByQ891+j/YlWfMJ2C1YmmvIH1j+vZjDko=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=OgPKEJbRmI27sXJz1BG4suzn3UGi0jIYfrnYW2kkxFRmd5zASfbxkLm4G1k26XfZX+R+EiFVDjAoYMEA8o/rpgmRs8OotFia7BNfahV/OJdhCfeRw0SGR2qOWg3n4ySEszUN92joGzyxG222p2QNfq8i2LfntAQ8z0SChNdjb2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cxrs+pqY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cxrs+pqY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 607D61F000E9;
	Wed, 12 Aug 2026 06:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786514977;
	bh=bRs+rpiC3/VhrQsbrr9qvxe1fpYZixcXZE7qLlDooM4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=Cxrs+pqYOdzHdNvsJf2TXj7j7wEU0yjx6Tm+uOTQnX9+II7HDgEuFacnHFuXcdRiL
	 g+gxF2Q1WFL4O14R+/QO7aUyd7l/KkzSR6oHeE8CLn896uwpBmOZ9w7Tuy74y12TNK
	 fZPvyZt08vCvnsqutQQrq/l1Y+1jOPyUxlk+fq2UoGjWxX1yNegAiD+MBOCJHD2qNC
	 Jbnts5dBtfb8XCjamnxNVAy9/mMG5WN6cogmDY3PYgtotOW5V8K0t/1dxatJMfbMzB
	 cF6XVbrQQb1/tfBkPfKaX94g+56xNDb7CYwGUjnrTBKBfTym3cwIOPWy0k+FqW1XqY
	 psBrtjuGdXntQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <anhkNLxcGaC41mgN@home.wens.tw>
References: <anhkNLxcGaC41mgN@home.wens.tw>
Subject: Re: [GIT PULL] Allwinner Clock Changes for 7.3
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
To: Brian Masney <bmasney@redhat.com>, Chen-Yu Tsai <wens@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 11 Aug 2026 23:09:35 -0700
Message-ID: <178651497559.5862.10057160570958744364@lazor>
User-Agent: alot/0.12

Quoting Chen-Yu Tsai (2026-08-09 04:27:48)
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e524917774=
82:
>=20
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/su=
nxi-clk-for-7.3
>=20
> for you to fetch changes up to 0a136efc0fc2d53b1b1389b3c3fb0f76edca38bf:
>=20
>   clk: sunxi-ng: sun6i-rtc: add a733 support (2026-07-24 00:02:02 +0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
