Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4811F419F;
	Fri, 23 Jan 2026 18:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769194608; cv=none; b=hOtgsW4T5as9EqK+Q9dczaPPFSP4Fc2e68e+OqddfhTgQrGbiijli4lZlyNknvQN+4uDWTwDOQzhkWKL+AkzZJVlpPeLQamxH19yvvU+Bi/Ng2AmJtJ0qV0w2of0ApYPsAJ30tzdFarcHCOFMXIEEYkoHU1hx0daN+CpVrk5P9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769194608; c=relaxed/simple;
	bh=3jLGXGox4MZrx+SHfO34OvVQtWxyUAdZt4Q/wRaq6LU=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=TIshnwQ98lIV1lmXcK3NGBHzNTqeT9B6pz10dyUFKLJzH2nWk9I0ylqbK6LKbAI9Ys6Uwutnb0eo4DF3MVBMYB4lHmkorPUMqG5xV4xBAez0c31Wc58XsX3xi/rbsjhz9ZbJ8EwJGP5wZLaaBttTI0/RJZfo/mGnOzRKOkQlPY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NOM8EgWs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NOM8EgWs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3DF6C4CEF1;
	Fri, 23 Jan 2026 18:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769194608;
	bh=3jLGXGox4MZrx+SHfO34OvVQtWxyUAdZt4Q/wRaq6LU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=NOM8EgWsvkdiZ4I53S7ypYxOkEaP3qgxMNqTan34yjNXQ6IdNAvfZDMjJGD4j5qdB
	 ccct8gX5Uj+urPxTX9DsIDQhcQSEiW0rIG3fSryf6K4shr+X4Q7waTBPpur3DtOBb5
	 V+5BBotFCTOMGTSsdKLNt3VMWo0tZcFsescFEJhvicF/Sxxx1oZj53/hcpiybVuRz9
	 94GlDJu8w1+qDm9xK2DHahTwb8D81Xf+UZBzS1V8rR6evsSDgh7WstshUcGFpT3pwW
	 XsOgWPvSpfxDTybuKvxrPqtX2yn1aVhQdkc7zEaWqQHBJya4fct9k9ff1xd81cpUFz
	 btKcQnLEbp6nA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251224114210.139817-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224114210.139817-4-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] clk: zynqmp: divider: Fix zynqmp_clk_divider_determine_rate kerneldoc
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>, Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Michael Turquette <mturquette@baylibre.com>, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 23 Jan 2026 11:56:46 -0700
Message-ID: <176919460602.4027.12516602174485090561@lazor>
User-Agent: alot/0.11

Quoting Krzysztof Kozlowski (2025-12-24 04:42:11)
> After renaming round_rate->determine, kerneldoc does not match anymore,
> causing W=3D1 warnings:
>=20
>   Warning: drivers/clk/zynqmp/divider.c:122 function parameter 'req' not =
described in 'zynqmp_clk_divider_determine_rate'
>   Warning: drivers/clk/zynqmp/divider.c:122 expecting prototype for zynqm=
p_clk_divider_round_rate(). Prototype was for zynqmp_clk_divider_determine_=
rate() instead
>=20
> Fixes: 0f9cf96a01fd ("clk: zynqmp: divider: convert from round_rate() to =
determine_rate()")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Applied to clk-next
