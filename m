Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C2C2EC090;
	Sat, 11 Apr 2026 23:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775949448; cv=none; b=g+jCuQAzLPNEnGuZJa7/LgiRZnaBQXVetWaZTgO/kAyi95IbpKj94DJfHxGYrP+OPSAiXMyuiKL7zyIPd7AxGbLbcWBF/FEXP+L8Y0vtqo1FtPgcJuyI0UEOES82T0rxDstke77bbPtyOFjugIT99/eigjajQKe/CW0TLR6N1ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775949448; c=relaxed/simple;
	bh=OX/nzZN5SAA0QFjT4IF/RShVX+VWRxp0IK0EMcX+ATQ=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=uVnd/wxq6FT5+6h/Gi2JNNpP0ePRjyED+6VcFKHysJ02N+LyC49GTphvVM0kvZA/MswHTv6jy1KmXqzHJI2qepHCuNwI8pzW3kAdNgHo3lYzU04I0sdfQgt6I4kSosYoebkaHLXGI9DIbg6gSoecuN0Mnm0kZsYPnTgfss0EcMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gCTh3Eo4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gCTh3Eo4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D496AC116C6;
	Sat, 11 Apr 2026 23:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775949447;
	bh=OX/nzZN5SAA0QFjT4IF/RShVX+VWRxp0IK0EMcX+ATQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=gCTh3Eo4LoMbCnZlGQRSguGBhLR08EOofW6K4r5cdZX0+TuBNDabBjsBbMPPXijA1
	 5SjY2CvscGepKRuy18Q+kFxInJ511DKiMNVs7zRTeGSaqMH+gz9LkMvRjjT0o6FE0P
	 4weopu2riojPRY4QDkZdh12IeMsSHej9Nm0hr2YRj/q7Me6D2iKvL7ePZOfz8zZ6+e
	 aUSgY0MZCmRoEbrniziX+f+oRAcBxtrVWy6SuhYm7lbGNV0HJJk61G1xwnwiq1u1q4
	 J9btkTyoP3S5IzJzK9SfL1X8s8V0VYOIVjKPihNcOx04j+Z6xSmc+DexrchAaUMTCX
	 E97l/S2oU/16g==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260402134107.1528450-1-abel.vesa@oss.qualcomm.com>
References: <20260402134107.1528450-1-abel.vesa@oss.qualcomm.com>
Subject: Re: [GIT PULL] clk: imx: Updates for v7.1
From: Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev, NXP Linux Team <linux-imx@nxp.com>, linux-clk@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Mike Turquette <mturquette@baylibre.com>
Date: Sat, 11 Apr 2026 16:17:25 -0700
Message-ID: <177594944564.5403.2078123937513330845@lazor>
User-Agent: alot/0.12

Quoting Abel Vesa (2026-04-02 06:41:07)
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f2=
7f:
>=20
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/=
clk-imx-7.1
>=20
> for you to fetch changes up to d16f57caa78776e6e8a88b96cb2597797b376138:
>=20
>   clk: imx8mq: Correct the CSI PHY sels (2026-03-19 16:15:32 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
