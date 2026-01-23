Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2F9242D91;
	Fri, 23 Jan 2026 01:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769132716; cv=none; b=ZcsHaae5fCxD5I0GAW5kMoP3zBkJZFpFc9ms0PGbXC2+vKMBs0ol8uFjadtmBE4pyhlf5QqmBQjlPnf6PRGpVLacSbElFPmztBmcPaOekdp4eiVbeqxiaw9v43r2qhmimJVw8kIhBZixzk9K3BXj1TwKjTKx4+FhJZmi0oLr6Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769132716; c=relaxed/simple;
	bh=sY4/2c8C+DeLPYZmSS72l0HDYcRT8AK2R4LsC3Dy15Y=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=qfWM966+12nynRZsRORJhedaA8cU6XBAgmgT5Qyr+fQxWT669ka3dMjliEqDI+0pcx0SZU+lEDbI3HZFDaGa4/rUyA4xWoLji930zXdgntFR3aQejaPcLQuBFqi79R+p1+TQjhOZdStk64dKi1y4yLQcvDKmPJs+UfNPevrs8HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OP2tzqpr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OP2tzqpr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0251BC116C6;
	Fri, 23 Jan 2026 01:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769132711;
	bh=sY4/2c8C+DeLPYZmSS72l0HDYcRT8AK2R4LsC3Dy15Y=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=OP2tzqpr3RzeOOos1pyEkrshJ6SxS8YupTvMFbSp50IMcStUP9IbeznNaSUyV6Ion
	 fsMrmRP3fD3y3GfEb5cxlmbPfPTdp2EMB0o8t9cKS7c5WwH3TV9R1+r/wdfTgbu3On
	 fOqxMBgKwy+V6Dk4fvDwthqwsOJT4SWLU23GP7sETmzAusrLxxaVxyS5pjWRRJM7BV
	 BFbdnHjEOaPEva9mNY8LwwndXwRokEfwu7sfdaG9nQpd+sk24uRhLKG3b2+2HhVTNs
	 iNq14oZoeErw/PgAVDRcwjbEYLF6jWNQnxa4ZN/J37l7QyJER8h25ICXs/QwWlwdje
	 fncW8NgJIaklQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251215-mtk-pll-rpm-v3-4-5afb3191e869@collabora.com>
References: <20251215-mtk-pll-rpm-v3-0-5afb3191e869@collabora.com> <20251215-mtk-pll-rpm-v3-4-5afb3191e869@collabora.com>
Subject: Re: [PATCH RESEND v3 4/5] clk: mediatek: Refactor pllfh registration to pass device
From: Stephen Boyd <sboyd@kernel.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>, Laura Nao <laura.nao@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F. R. A. Prado <nfraprado@collabora.com>, Yassine Oudjana <y.oudjana@protonmail.com>
Date: Thu, 22 Jan 2026 18:45:09 -0700
Message-ID: <176913270925.4027.3070477572441104376@lazor>
User-Agent: alot/0.11

Quoting Nicolas Frattaroli (2025-12-15 03:24:01)
> After refactoring all of PLL to pass the device, it's now fairly easy to
> refactor pllfh and its users, as pllfh registration wraps PLL
> registration.
>=20
> Do this refactor and move all of the pllfh users to pass the device as
> well.
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---

Applied to clk-next
