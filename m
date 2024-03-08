Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B583D23769;
	Fri,  8 Mar 2024 23:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709939949; cv=none; b=Mwz8D+Ar3GuhO2NUq0Z7qCTe3ToZOWy/mKRAk8rf2ta3JMAeUNn5rFfYOYzgJmJp6DH4+GAd+vKgoHY1cUi8iTRkp6548hyfJfIVJsVl29U0d1WcQF8Rm9MmbG4WVrJYJ/K72bTe9lWeBYA2FNN9nJYn5jUVx1nwuXB+POvhaxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709939949; c=relaxed/simple;
	bh=+cF2mN+9Kj2VFltEP7L8IqJfKKIdKlmHtc0CbN6Wsbw=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=NiSDtQ/hpN13CaErzKBL/dcQWfUPAuFjZ07RAzFiOQPWRg/jHqzsGpfMFpRCRLrlf1g9vjYKVeUM6vri9Vvz+4Stxkk4gBf0QyF6/h0zXlCWPdJUDJxbyC2Tn3FDGBfLjnA+r+kclNzkrPA+XMiajy2udgLlS3KSZdnmijiVDGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BGiqm1gs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BGiqm1gs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E342C433F1;
	Fri,  8 Mar 2024 23:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709939949;
	bh=+cF2mN+9Kj2VFltEP7L8IqJfKKIdKlmHtc0CbN6Wsbw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=BGiqm1gs/+q9tvApSAg3ar2NmXxyx7HVg9dnmYatLEdtF9VGLTrCEiDGFZKi28MV0
	 b1eVxsR8QT4IjfDYNjzVYeafGRQkB9vZP0SxbUCMQkt+u4VmWM2jHQQHW15SVwCVbl
	 TprnpeEPpSC+fdJC/VveZia3dsRoY5pkxezq3S0IiOcVmVscObDASZyOSkrR+aQEJZ
	 +HnPqR+IsV1zx3zXAzgoouV3VR/JzB54Cjn2RC7QL8gdL0SzzS1Q9a2Fyl2O7KVFsw
	 oIoEMFzbicWM3V7ZhNH/063QTqQO/EonPn6rI1y9BloqrOPPcj2aubtxewvvHZUnVS
	 +bMQKQAiQBhBw==
Message-ID: <0b30aad3c2f7676f0e34b2ec5f0a170b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ba373ce7341518216a4940e76ce61d759b912b3d.1709721042.git.u.kleine-koenig@pengutronix.de>
References: <cover.1709721042.git.u.kleine-koenig@pengutronix.de> <ba373ce7341518216a4940e76ce61d759b912b3d.1709721042.git.u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/3] clk: imx: imx8-acm: Convert to platform remove callback returning void
From: Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
To: Michael Turquette <mturquette@baylibre.com>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Date: Fri, 08 Mar 2024 15:19:07 -0800
User-Agent: alot/0.10

Quoting Uwe Kleine-K=C3=B6nig (2024-03-06 02:38:55)
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>=20
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

Applied to clk-next
