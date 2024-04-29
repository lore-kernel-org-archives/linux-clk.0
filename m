Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511AA18028;
	Mon, 29 Apr 2024 22:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714430372; cv=none; b=JvgOx9Oc2Qu8w8m13sbb+lOzH9boq5TaAR3HWtuhbm6a8zKW+TFrVsGyCawT6zNv2e2dU3hVc089w/ngKrZp4O/m2Sx/6N5HML1hGXLaad8aeTJIAmG4dCeILXwsX4/I+imK/ortU/l6t/p9Q3Efycfqx+9SEDl+rLRXz40jPt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714430372; c=relaxed/simple;
	bh=W0+95iUV3yb5yab+ZP0TUdcqDa3SOq4aR6vvs5xkuTA=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=NeRQiaxIDscSmOYXR4oZiRqdT6LCgkU015iZC0jRxUf0txLkBKbufoY5g0sBrqiMk0mT6/SU6Ys039Fy7+BlS5o8hkhEv9uV9LnHfWS0f2sx7R8ZDOhRmwzORpZV6AS/o4/4I54DmjWiMlpywqJlhtY7K7p8+fCJHVHsjAOR7RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DpNPJ/j8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DpNPJ/j8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1585EC113CD;
	Mon, 29 Apr 2024 22:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714430372;
	bh=W0+95iUV3yb5yab+ZP0TUdcqDa3SOq4aR6vvs5xkuTA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=DpNPJ/j8+GcqrW5TacAKLw0065Iumqv3dtgoVaH8VvsgXxbCAVWBIi2GDItqpgiCl
	 B2OgLN2SC7QDFCx4iTMhrvBexrqBliRC0BNS2A0bAAdCYFB6p+GF/mH2n/qG7R1cGo
	 stMdC2T5kT7N1pz7cyQcU14cZ/NpZDaZwDQugZoioo/ZUAmSLLlk74AnXpX/4OK+Bn
	 jae67WuDTC0+IepDr1jbS4NJpmENMzP4m1fP0BGnum0X/hshDc+rAEi4NqAg7ACVKK
	 nSJfbhyqt/8YSTww9ibpduH3VWUwfjxtrEK4Zs2JJ+0qHnzFtC6RFb4N8uzORNaOmU
	 1lP73XONV1Y2A==
Message-ID: <77b33dc53b7027eaec55c37833d13f83.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240426164144.GA100911@jernej-laptop>
References: <20240426164144.GA100911@jernej-laptop>
Subject: Re: [GIT PULL] Allwinner clock fixes for 6.9
From: Stephen Boyd <sboyd@kernel.org>
Cc: wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev
To: Jernej Skrabec <jernej@kernel.org>, mturquette@baylibre.com
Date: Mon, 29 Apr 2024 15:39:30 -0700
User-Agent: alot/0.10

Quoting Jernej Skrabec (2024-04-26 09:41:44)
> Hi!
>=20
> Please pull following clock fixes for 6.9.
>=20
> Best regards,
> Jernej
>=20
> The following changes since commit 4cece764965020c22cff7665b18a0120063590=
95:
>=20
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/su=
nxi-clk-fixes-for-6.9-1
>=20
> for you to fetch changes up to 69f16d9b789821183d342719d2ebd4a5ac7178bc:
>=20
>   clk: sunxi-ng: a64: Set minimum and maximum rate for PLL-MIPI (2024-04-=
15 23:21:56 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes
