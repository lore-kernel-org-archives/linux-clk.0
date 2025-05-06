Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA6C21C17D
	for <linux-clk@vger.kernel.org>; Tue,  6 May 2025 21:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746567665; cv=none; b=ZpjXGFyKJ0sV7Ojxl3h4T1kTwHGm0+9eiTvp7tHm9lEStKcc6LXpQk0+cLZtPkZqPJTRfmM6eq49PIINQDTNcDsZxB6jCFwyuUXWFnS6PFe0vAlzypI7sfvfc7jXyO24VyUQdTbO/J4haZ9+btw03Te0FTNQtG9xpx2w2ikVTtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746567665; c=relaxed/simple;
	bh=6CxOMIcpv6UU7bDiC8pBqM9CBeRXVyrU0ukgcGoh1PI=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=mw+TbK1bK4DSRyZzkQpj1iqSLXAzKsE3cDJRNf80F4GDhN21jyYazi4X/vZkalbjJCRHMF/M+AHUF3Ps41nn1ftWIHhZQxUiGbk1MEKcz/meR99hZKVT6QMqUEEZz4ZYsKa4Cz2Gp6QPahVQRN4z/Rs65JPLcS+OTVkIOkc9kOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hsDqP3HT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hsDqP3HT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE152C4CEE4;
	Tue,  6 May 2025 21:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746567664;
	bh=6CxOMIcpv6UU7bDiC8pBqM9CBeRXVyrU0ukgcGoh1PI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=hsDqP3HTq9F3YgduRkkoD1jG7NR5pmNiXauc816FjnJfiHybf66sLUg6VoA5HFMnj
	 MBM4buYPnrFnKLcgu5mhv92E3GXUb9KMQw70uQ3i7S3xj6aQ9o23/uIyzwzRMkZKqy
	 38nPeTIyBdk4DoalPfCsgqHue/3nlQCPkC34yRL7ARXivweCYKnGCMMBlWd7k35X1T
	 MbFSo2GvEb5fyAqNMqB+zbBicGzPmgvrxczaXZELjXvkkjvUCktfsXsJ1qh8aH9hiR
	 B4BGEVTOsy+8/eGQ77EqZgNPN6qWq8bZCFg2NXOInIvydgcB1d0iqn0tcP/k8sayNh
	 ByAYq3QE4qf9A==
Message-ID: <600cd2f78ea76dc60960cca8bd69faa5@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250415185614.16292-1-wahrenst@gmx.net>
References: <20250415185614.16292-1-wahrenst@gmx.net>
Subject: Re: [PATCH] clk: bcm: rpi: Drop module alias
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, kernel-list@raspberrypi.com, Stefan Wahren <wahrenst@gmx.net>
To: Florian Fainelli <florian.fainelli@broadcom.com>, Michael Turquette <mturquette@baylibre.com>, Stefan Wahren <wahrenst@gmx.net>
Date: Tue, 06 May 2025 14:41:02 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Stefan Wahren (2025-04-15 11:56:14)
> Since commit fbac2e7787ac ("clk: bcm: rpi: Allow the driver to
> be probed by DT") the module alias isn't necessary anymore. So
> we can drop it.
>=20
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---

Applied to clk-next
