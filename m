Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785371DBB0C;
	Wed, 15 Jan 2025 23:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736983373; cv=none; b=lBSLsyoeM5OQMhdiDcjA/r0GLyNVYnPpgiW2y3xR9oAU1jVMfOOVCPXXpJSezRJCMJun7C70hC9MKKXXS2rbDu0TBFxL9aWIU6k4aFTG2Q/AFNr2bsWyYWJZy5D0bTZ7ged5L0be0Wj5GG1xLG/bdVdMZhamBQVMC264VC5SmhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736983373; c=relaxed/simple;
	bh=gDsUCcNE70y/yn8sOeA5bMJxrpQ7o8msQoyV1ERAOy4=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=NKVg6+PwB9+dU0MP4AbJL7F4CyIoW4fcy2ZJunCS8PQt15UywkWvV23UNYmJwGirai3b0ASkYduKEiiQDSeoUx/ZQP49Z5ZwoUd6wIjBCKrVf5puitHluVx6YQtnzUaSOapL09MC0rFBDKn2jZu6aFtrKptnjKu3F5eXAubQ+bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lWVCD3Tj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lWVCD3Tj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0EF8C4CED1;
	Wed, 15 Jan 2025 23:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736983373;
	bh=gDsUCcNE70y/yn8sOeA5bMJxrpQ7o8msQoyV1ERAOy4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=lWVCD3Tjz7opmsSI2dw686R2teeoII75k3kdRqU4e/L7HZFOA4BwAQykQ2/zgDOKw
	 bDn+u1mxL7tzWoUId5R/G2kwHMvkQs+8RKc3pRLXusVHsKleK7kB2XFYKptrIFnq1R
	 tc5zEB8a/OMz7hVwD9L9rx7+Y7PM2axRG5YUEG3hBQn4M9KdGTxaiwVWB7x5IribCd
	 6E86tbcznS/VpwF/uM3VFClpDlOd3QwcGs8azEPHuruGkYMK+5AQaaTH3uMI0pF7yw
	 dv8QICbOvLdM+VYonvYtzxUvMKligqXsvyc6aVlwsTzoq6rXUbxPBqh2kFeIIEpY/S
	 9pvgMiLPER4RA==
Message-ID: <73ad1336d9fbfa020ba666eef340f784.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250114182021.670435-3-dario.binacchi@amarulasolutions.com>
References: <20250114182021.670435-1-dario.binacchi@amarulasolutions.com> <20250114182021.670435-3-dario.binacchi@amarulasolutions.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: clock: st,stm32-rcc: support spread spectrum clocking
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-amarula@amarulasolutions.com, Dario Binacchi <dario.binacchi@amarulasolutions.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, linux-kernel@vger.kernel.org
Date: Wed, 15 Jan 2025 15:22:51 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Dario Binacchi (2025-01-14 10:19:47)
> The addition of DT bindings for enabling and tuning spread spectrum
> clocking generation is available only for the main PLL of stm32f{4,7}
> platforms.
>=20
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> ---

Applied to clk-next
