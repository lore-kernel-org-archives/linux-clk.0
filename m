Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3F41E2306;
	Mon,  6 Jan 2025 23:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736207308; cv=none; b=jDPmFc7dAt3aA8YUDXLe2FcpGijMXwHQ9Jl3Smt8RZHNZPlZL3FBgzTlaCoXvu727kW7bNTv8wdIFytM0TvAeugzCtyNPmR0KkdPWXoOzT/QBefL9UCeV7N2KpfaWeebOT/1AAt1tdk21DHyjmR3r1cBXI43Byw+1FfvJoz7aAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736207308; c=relaxed/simple;
	bh=2C+piIFBCEMvDxMS2yr7zW+/zN9TQ+BeI1mYmfP1vEs=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=GdgD5lfuDiLlCVPtCbSkwFkSTDD16gJgnb2T9xxt+TAlolHJtkv+8u8MbPDpdPn0fGZR5K+50a/KIrDUczWH2pwXYhbJURKcq/uUzxSKLC7rd0yyaadh9KLvp3w2t9fGeCeVl1ckrw86z/LD5Jm2JzsiTVaBg7W1rE8ET8zLq6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rtx9m59D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rtx9m59D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DAF2C4CED2;
	Mon,  6 Jan 2025 23:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736207308;
	bh=2C+piIFBCEMvDxMS2yr7zW+/zN9TQ+BeI1mYmfP1vEs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=rtx9m59D3tlEqhPXfLZPMQObyYKTgR3aEx9acpP8+qa8iMQD9ajlTJbZhf67LhzYY
	 TSFOweT75yjjrArLJ0mbrH7cVyfRJMw0zN9VuDQ7zsgX1x0MGnQb+S7xWZpbQdEAZn
	 316WXcyUofy0A/CtV3/yXJF4oPXkvjJQhP67qND7JzpdDbJoM7bv/GL6KFlQWdioEl
	 4QR1FQBaCF+lgwz4WQSnCNIVqhFmBc8C+15mga9xtxgYtBcpKQJn5EoQNYmJmruiCP
	 bOdylbVTaFpAP2RwcbzeNk4ubawo46pY/A0y0U90p7Qjhy1+yVbGmWA5jDrrrvDAYS
	 kkGUQ5NrYACrg==
Message-ID: <d7440445064e515e7cb517c80a78820c.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241231150144.4035938-1-dario.binacchi@amarulasolutions.com>
References: <20241231150144.4035938-1-dario.binacchi@amarulasolutions.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: st,stm32mp1-rcc: fix reference paths
From: Stephen Boyd <sboyd@kernel.org>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, linux-kernel@vger.kernel.org
Date: Mon, 06 Jan 2025 15:48:26 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Dario Binacchi (2024-12-31 07:01:40)
> The path of the two files was wrong even at the time they were added.
> Let's fix them so they can be correctly referenced.
>=20
> Fixes: 722dc8a1d5c8 ("dt-bindings: rcc: stm32: add new compatible for STM=
32MP13 SoC")
> Fixes: 20107d7328cc ("dt-bindings: rcc: Convert stm32mp1 rcc bindings to =
json-schema")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---

Applied to clk-next
