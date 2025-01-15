Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251821DD884;
	Wed, 15 Jan 2025 23:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736983392; cv=none; b=WNUSjoKjY/oa30/KrnTibkPyQ0tUdGeY3odfcn2QrvH0AQJtENHZEHlWfPiWecfrNNkExx+Kf9dli7oNuHY4vXASj8UCqHl0LzO8lh+Z56zaD2SkXExeO/iREjQqBPGZWZXilbbPbr7ZZw5Yu03O8dBR4gPoCmbtNFHcuyf9A1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736983392; c=relaxed/simple;
	bh=CXIOzY822ZbNj6Zi0lXst7TJoBz0pxnoTDtcL7T3MoE=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=kdMD/IhG7Qlg0qBvBkgYv3idi2roR+nQ/TEtjiOrcbLfun2R8pn7hDYevUEg16nTmXSh2rn8B/Hf8RkSl/cWoHK5VKmcxAi1R+D+J4RmhrQeHcAEYXNLqSq2O1NP75Uc81uJ8oBFgB972ZZIsYEvw8QltWdM4qhlZCGvGpVq5ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EP0NUy+P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EP0NUy+P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91373C4CED1;
	Wed, 15 Jan 2025 23:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736983391;
	bh=CXIOzY822ZbNj6Zi0lXst7TJoBz0pxnoTDtcL7T3MoE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=EP0NUy+PlrO9mL2q+KmyUaDXGhAHDEt1C605a2XWvc+sQ44xay7Yhtnm4LpeWImGr
	 XJhq9HRdISRK4rTqfq+VtM/3LUnoOlHoLqH/WB6fqWGaM4b0XT6whDwV+RMXhN6qdV
	 RjjnMFmoZ1M6gy4qMNAVGUZbPwzNZccediyx1hp7rLU15QFpvkv4PAbEAGcUGHyWbK
	 ceJ/JYdve1Ee8ENRE2gy+PySLsO3FBGeZjXXNC9E7nMC12fb2gp2ImgzA5p9L7Njv2
	 NCmgSyVWJLTa122EJtNYAiGGuwqYRb0qU0uQRo4qQt9OMezpmhVgfTcNHH1UX/ApCn
	 YjrKxwx8Lqxpw==
Message-ID: <4af9d643e1f0d3b291d7cbe7445bfd2b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250114182021.670435-5-dario.binacchi@amarulasolutions.com>
References: <20250114182021.670435-1-dario.binacchi@amarulasolutions.com> <20250114182021.670435-5-dario.binacchi@amarulasolutions.com>
Subject: Re: [PATCH v4 4/4] clk: stm32f4: support spread spectrum clock generation
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-amarula@amarulasolutions.com, Dario Binacchi <dario.binacchi@amarulasolutions.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, linux-kernel@vger.kernel.org
Date: Wed, 15 Jan 2025 15:23:09 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Dario Binacchi (2025-01-14 10:19:49)
> Support spread spectrum clock generation for the main PLL, the only one
> for which this functionality is available.
>=20
> Tested on the STM32F469I-DISCO board.
>=20
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>=20
> ---

Applied to clk-next
