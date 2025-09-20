Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7EA214204;
	Sat, 20 Sep 2025 05:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758347439; cv=none; b=UbpgNT/lDw9O8odqD+gkoFdf437aQi5kcmDyffm/eB3gKBilFnKm7K0wygbPzFMlU7Gnwj+p0njl74N9t3pfuIxUG0fnVb4LaZ+axOvr6xbUk8hRYpI0WRJj9gm9Db1YWXlu33+evOyeccbWsjxvSkhT5YBPTWpDeO4n6yjv5ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758347439; c=relaxed/simple;
	bh=Iem50jJYwR/hmi6++magwhX1fEYgWmzgZ0K87gHbmao=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=iGs4XjPKVJGr8zNbIn/oF8jUSlx1WB9aR2+se/oayTBC7G2iqRLnS3dEfgYzyI6fsAAMc5e7lRCuoqsnH989m110Xv7r8wMP0W+/XSpGUjWRb/L0HRAInh9TLNndqRqx0FYgxPahUcJutkyYSmOsylmYDZS8iIsOb0jMvPU0BCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U9EUZMsq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U9EUZMsq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4DD4C4CEEB;
	Sat, 20 Sep 2025 05:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758347438;
	bh=Iem50jJYwR/hmi6++magwhX1fEYgWmzgZ0K87gHbmao=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=U9EUZMsqdrtF+r4nqA8DGSHjcJCH+wh37RuQIdT1/D/KSRXUB9B4HrV01MST6tiJa
	 nPmz3xx7S5k0usLpyZVINcf3Fxh+wMUVdtAXtczcn8ru+jbzou/ynEtcw17zu13+5i
	 8WOwh7T6xPNuUwV+FZnYVTZI/wWdY/6WZyO6qRtW19zFH5mtB9HP9NCy1iXjAN0Dl/
	 SXTchGXhs12p6Kt5h8dhFV+fSJwdaUJWyEL1+o8go89UF96m++nB//k+E65dNw8+xi
	 PsSjE7lQgazRrPwgn0j0FYiqH9NWXBklwFRZdkm2JhqtU9O6yg6gZTZMJGGY4xfe8w
	 mcSdAhXgJRxAQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250728070446.949095-1-ping.bai@nxp.com>
References: <20250728070446.949095-1-ping.bai@nxp.com>
Subject: Re: [PATCH] clk: scmi: Add duty cycle ops only when duty cycle is supported
From: Stephen Boyd <sboyd@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, imx@lists.linux.dev
To: Jacky Bai <ping.bai@nxp.com>, cristian.marussi@arm.com, mturquette@baylibre.com, sudeep.holla@arm.com
Date: Fri, 19 Sep 2025 22:50:37 -0700
Message-ID: <175834743791.4354.15798053146130121164@lazor>
User-Agent: alot/0.11

Quoting Jacky Bai (2025-07-28 00:04:46)
> For some of the SCMI based platforms, the oem extended config may be
> supported, but not for duty cycle purpose. Skip the duty cycle ops if
> err return when trying to get duty cycle info.
>=20
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---

Applied to clk-next
