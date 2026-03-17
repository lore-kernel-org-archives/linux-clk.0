Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E09391828;
	Tue, 17 Mar 2026 07:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773733229; cv=none; b=AJP0BkoUiIjfbbAtfjgGkBcaAsmYEuBCtSN7Pw0edUpjNBkkprTxUDggRt9fdl1y5tr6ha1CJKN6fbeAf22AvU0Q90N40OAQxW2lATeV/Yrguw4cXg1v5iGMnYDx1fpjG8NRvO62ELA2q3OhW7SUWCdP3P66zs+LRaERt6gAzr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773733229; c=relaxed/simple;
	bh=HSM1mqZ60fsrIPA8vhvonH7caBlWD6pJ/37Voo8FQRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SGXpWbKGrQxIuQSPnVLHJsXtmR4q5YAmeCBGGoad+7DulxNYTqdj+phsvRo6j9UjHfablpHnjsyhmmzj+uGFsdzpChzbDAcHNTY+1IYEWGeel5c92UAvIxTH9BeFivrPHBe9G/tvE864GVnu71O13Fn+WEyV23lADY1I8gDD2JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CXwVjQuh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CXwVjQuh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E401FC4CEF7;
	Tue, 17 Mar 2026 07:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773733229;
	bh=HSM1mqZ60fsrIPA8vhvonH7caBlWD6pJ/37Voo8FQRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CXwVjQuh+z/pNt5yjO/MJnRfqXCpwmvPve+OpkL9gmp19ezPb8PIQBImoz4RV1u/K
	 72F03OpIR5q7dHLHVMdqWE7iGqJSv/WbJ1y3uhmVRhml+MW3pvYO89ddC0xYl1mdkk
	 VI45j0FMMlqF7vZ8KSs26reL1V7ZF2ZCmLp32iPOX4aFY1WfU+4KQgbToLD7g1ZTBe
	 fNz1E4Dq054ALb8RcsXzu324ATDmjwmeabC8nO8we/HC9/aRQluI5WDQZvlx1ofzrE
	 wX4FSVJT6YMeVHXILnI3zQ1q7etNMUAqV5W56WLA/rF/s7z3kUPQ2u4xUhyvY0ctnk
	 EqI+RReBMIX+w==
Date: Tue, 17 Mar 2026 08:40:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniele Briguglio <hello@superkali.me>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: rockchip,rk3588-cru: add I2S
 MCLK output to IO clock IDs
Message-ID: <20260317-maize-peacock-of-teaching-d8ab90@quoll>
References: <20260316-rk3588-mclk-gate-grf-v1-0-66fb9a246718@superkali.me>
 <20260316-rk3588-mclk-gate-grf-v1-1-66fb9a246718@superkali.me>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260316-rk3588-mclk-gate-grf-v1-1-66fb9a246718@superkali.me>

On Mon, Mar 16, 2026 at 02:06:31PM +0100, Daniele Briguglio wrote:
> 
> The following gate clocks are defined:
>   - I2S0_8CH_MCLKOUT_TO_IO (bit 0)
>   - I2S1_8CH_MCLKOUT_TO_IO (bit 1)
>   - I2S2_2CH_MCLKOUT_TO_IO (bit 2)
>   - I2S3_2CH_MCLKOUT_TO_IO (bit 7)

We see that in the diff. No need to repeat, because it makes your small
change unnecessarily big. There is no benefit in writing tons of obvious text.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

