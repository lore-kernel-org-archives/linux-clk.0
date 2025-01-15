Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC011D90A9;
	Wed, 15 Jan 2025 20:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736972894; cv=none; b=ATZG3Mawaj4UpyAoE7mcd+67RMLCRTKjfjmc11v7DC2EHbUn6ksJ6306sfg4gs08b5d06z81ZIcuTsbInIlB9bBzRfaw8jcGgONShzRplpr2FvfnZObqbVwtmtLQ0SZ4m5RVOUHmUoKtU/BAoOxuphkJ4w95FWNtKSOdZREnEBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736972894; c=relaxed/simple;
	bh=BuVzpvILdAaeWiohTckBjCJz4gutxwWzYynDXNfUv24=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=vBLsohXtmrqxAhVblkhAn0C+vN25Lm+aO3ukJt6OkzjlxBuI+E0kcRSaRNPg0eQ4Dwkgc0b+YPM+CB/ay5y09cOJ1FmPzIcpp+VFAgiLIB6Ur9SJKoOmyMydMT/BBpzkg7OVPXnABbnxicK7a3ykzoEtDZOHdGiC/wDwxklPYTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JIGS752z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JIGS752z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25B95C4CED1;
	Wed, 15 Jan 2025 20:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736972894;
	bh=BuVzpvILdAaeWiohTckBjCJz4gutxwWzYynDXNfUv24=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=JIGS752zcGJ33aeet7RDXbScYhUxTFkrTLhKhsvOhRGsur5dyVmi5xlDOizhiVr71
	 zlf+WkPqsdngRS9+uk/DtPOxgvBGD0lwDQ4+BoMpk1YxhkXBLtrxSMofia/ohLhsD/
	 EoTYb0c+qMXfKvx7zzLVFargVWj31MluHApnGqGxirNbWzsevx2RYVNNchlI2pu5ht
	 7PJqSBp8d5LfD2V1QWnBhGCvgqzI5eCrrKwN8CTBvQAuSbiL2LNuZUl+ZwM4LuEY+7
	 lepZOqMAgdgQneCsMsxHFQYZiSmLXpBejJ8YqD6sPcH3/ZVByafMkCU8ibwe/GPyps
	 o6Cj0GFvCSJsg==
Message-ID: <22ee938049e518a40161f9953a6ca7aa.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250115081914.12841-1-krzysztof.kozlowski@linaro.org>
References: <20250115081914.12841-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] clk: nomadik: Correct str_enabled_disabled() SXTALO case
From: Stephen Boyd <sboyd@kernel.org>
Cc: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Michael Turquette <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 15 Jan 2025 12:28:11 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Krzysztof Kozlowski (2025-01-15 00:19:14)
> Commit 1cd1c8f400e9 ("clk: Use str_enable_disable-like helpers") should
> use reversed check for SXTALO.
>=20
> Reported-by: Stanislav Jakubek <stano.jakubek@gmail.com>
> Closes: https://lore.kernel.org/all/Z4diEj__bbQl4ULS@standask-GA-A55M-S2H=
P/
> Fixes: 1cd1c8f400e9 ("clk: Use str_enable_disable-like helpers")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied to clk-next
