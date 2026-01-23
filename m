Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A286A2165EA;
	Fri, 23 Jan 2026 01:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769132599; cv=none; b=kdmg56TTpmGxWRIbNX65jelLWhPy0vzhEsqwQ1OJaTlI2g7+yG0pPim5MtCnRncBquoBEqjIOEidJRikl7X0OBvYkIXoMZtf7SjVOyeiQ6T0gjkuCAj43062aaKFCjMv8E8Qw96q6nb0joDlji9cbup2AoUdJ7qvc9vmq/uhcIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769132599; c=relaxed/simple;
	bh=tkthldLffXYVms3wxAD2lbP6j9gBgsHsKO89SXCZQ54=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=d+M6B2L3+IAtIqZa3WZhJi+igyGbgws16l7Y0g1i7A1GwI435iwg1mL4C/aBtYSJeSHnEYEUY/JrzS6q8+C04UM3pxqDeTLQ3xpZM45sUTAnKYmDIFW8mJycrv4pfIMj9oXrcnkMVpujyLMzWEMavOjw+wdBzQTho9aO7MxHRWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uLcTcLra; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uLcTcLra"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FFEDC116C6;
	Fri, 23 Jan 2026 01:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769132598;
	bh=tkthldLffXYVms3wxAD2lbP6j9gBgsHsKO89SXCZQ54=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=uLcTcLran58oZgank16uYJiybGF0GSvNw1wlsmWRmd2bHG458ZEJRs/yn95lUTUKG
	 jEgHvG9TzAM/JYI0kmiLz15iIoqy0S6sZ9z/ThLHQv7bczkT6fKcfvUI3QsbORTAb9
	 A0Dk2RUgIfp49c65Fm9UqVoQ6Fv1uZeLhZUmXyRdVELn9iBbrRIwONnxLVpv5m1tRw
	 GZMADfi3KLM8zVKcPRtppjOtsOluIS++kqv3uyPT2iqth1PCHtmU/u3H1QVBOXCHl2
	 wfSLYrMb7yh+PQ5uKc7HTb7EC9qzbyDuHVlL54NKF6YfziHvdQy6oC8Lm2sKIEe+MH
	 nUY4sL2MTrtWw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251223-mtk-gate-v1-1-e4a489ab33de@collabora.com>
References: <20251223-mtk-gate-v1-1-e4a489ab33de@collabora.com>
Subject: Re: [PATCH] clk: mediatek: Drop __initconst from gates
From: Stephen Boyd <sboyd@kernel.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, stable@vger.kernel.org, Sjoerd Simons <sjoerd@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Laura Nao <laura.nao@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Sjoerd Simons <sjoerd@collabora.com>
Date: Thu, 22 Jan 2026 18:43:16 -0700
Message-ID: <176913259630.4027.12058255654210765589@lazor>
User-Agent: alot/0.11

Quoting Sjoerd Simons (2025-12-23 04:05:17)
> Since commit 8ceff24a754a ("clk: mediatek: clk-gate: Refactor
> mtk_clk_register_gate to use mtk_gate struct") the mtk_gate structs
> are no longer just used for initialization/registration, but also at
> runtime. So drop __initconst annotations.
>=20
> Fixes: 8ceff24a754a ("clk: mediatek: clk-gate: Refactor mtk_clk_register_=
gate to use mtk_gate struct")
> Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
> ---

Applied to clk-next
