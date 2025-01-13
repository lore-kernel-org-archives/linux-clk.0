Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768FE1C1AAA;
	Mon, 13 Jan 2025 21:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736803884; cv=none; b=lueIw2Y1SwhTIu8pouaegdFBX2QfiDca3wNHA+IiBZJGXf78RGQ6UGolfShWYbC6Q9xU2rZ3TUsEtXEEUqj0GtjTCE7VHrBVbxJtfmiXkrs89Bq+wIc5xeljkIgGb7T1avBorrXohI0dU1dAjuO1p9nnLTNDOg2wVPJtDj84qmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736803884; c=relaxed/simple;
	bh=YKQ+WpoB1fuMrhlZMKAT/0xT2+KrSbmpeF7IQJwwmwE=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=OWrFuqblNfqMY9iSpoUB4cyZPIpTt/uHCTso8xCm4Atf/DAP+t4RVyoxUxHfcWs0eOimG5TUV3Ek6ZbOZsSphLI5wD5lF1t400HSlp8p6SoM2G+x52rquuh/oRBdBe7PA55FzSdmknAlV9LOVlmgtlpjtd9BcK8nPHIp5d7gC2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J9KPcqHG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J9KPcqHG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03B2DC4CED6;
	Mon, 13 Jan 2025 21:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736803884;
	bh=YKQ+WpoB1fuMrhlZMKAT/0xT2+KrSbmpeF7IQJwwmwE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=J9KPcqHGv+AlK2xNNQebXCALXBqwQiWWhmBXAa1UGZo4moQ7KG0Ge3IAYC4ZZSVEV
	 c+OsnAyk8q9dbY4l8I6tVMnSALvTYRZb3bk7Eq1mAQBvRHptKB14Hu2C6eL9RIJVrF
	 vlKs8FH40KKymAblf16qHpX7q1GjFNJymvlECO9Eqjpsb3ZhwwhsjNFkshfdr1j8sK
	 p5KeJZKkh3jrC7c5x5dT5EWLSJIgNwvCmuuH34KB2xUxPq8KlQ45T29VISnB7bxfB1
	 xplUL1j/XE04cZ2AMm8HdjxyZUurtG5M21a0MtOSm/6axUEucZtONfTwRw8trbxN9X
	 1thbqgfiGNfhg==
Message-ID: <7001f8c9df12790c6a54f9fd52ca2ec9.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250112133953.10404-2-ansuelsmth@gmail.com>
References: <20250112133953.10404-1-ansuelsmth@gmail.com> <20250112133953.10404-2-ansuelsmth@gmail.com>
Subject: Re: [PATCH v5 2/4] dt-bindings: clock: drop NUM_CLOCKS define for EN7581
From: Stephen Boyd <sboyd@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Christian Marangi <ansuelsmth@gmail.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, upstream@airoha.com
Date: Mon, 13 Jan 2025 13:31:22 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Christian Marangi (2025-01-12 05:39:38)
> Drop NUM_CLOCKS define for EN7581 include. This is not a binding and
> should not be placed here. Value is derived internally in the user
> driver.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied to clk-next
