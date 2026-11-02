Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614984;
	b=V0XI4s8NNcyRN1XYFdHTPh01/502KnO3Zd64MPiNoqEN3fbyGZVhCmCQmsZ9mY6iuQXE
	 KiQe3yPNss5esBrqR9f6HkqbZmHZNIBUOzKgHiZcRmhZ4VXm8dWtDz77v8WPGC6ekUZXw
	 GXbWTZ4idCwHLhhTp51wmd10zr+PaGfZ7StZ5kuWfgjOhyJV9/Sd3ugnlPLCUPLZtItV6
	 i58pjY0tujNbNk8VjkuP8SzFYnC324UCttZ3ZZ2PDHTcLkd3sU1m1GxqkPdmRcqWlWzIU
	 iv1DpaqLWnZB/h74S7xuAkyYC4s5bLdUgQJ1sCvvxPZ0B9nAIanyyHNHCfANqhuwqaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614984;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=uHmEJGXHxdyRRkaTDdUcwnltGXq6VvTgNHAfkKWQvLU=;
	b=wJ6uSKjpqnpnNsxgNxEdb4o+IcQSnCxmMYCHVBjdRNnVbsIMbAED4VY2yGxqYq5ADvRd
	 dW8apsRvvmFAqjb3RwtnPpVHDAS4NqkgX0r522biLYMMRsSCpI6XIxRh9jN3Ok5hVtrba
	 UOp+mQX3hGVEFHFeWGZt7h4dUevqCVjv0FeJJB141EdSBmorBPM2y6RxYj7axRyD55d2W
	 yv3zTAbxiGtI7g0ai60zA2XqLugUQ+ZQmUXP1569oSXMa70You1+ElJacRfkLtsZ/BtbX
	 sYXBcyfxZnXiu5s7xaO7sqqD8m0Vqne/ZEKqaw412bg0QlPjrLtV5LIRuE6XmlrW0nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="T8/tG+f2";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524B0606A326;
	Mon,  2 Nov 2026 10:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T8/tG+f2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB00A1F000C1;
	Mon,  2 Nov 2026 10:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793614983;
	bh=uHmEJGXHxdyRRkaTDdUcwnltGXq6VvTgNHAfkKWQvLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T8/tG+f2YOeF3Mw6lDP3Rlz3rKXh0XcxjQBkjwJU63oWJkC3/pGxwQp4uikgaJuwl
	 riR9/w0M6+ikY2O0XID1ErYUwNzm/Nc8NTk7RxiTM1csM696sQbkZgszxhW7VXleWV
	 CozLsa3w7aWvJqp6Mj62ToDJaewuakYSzZ9E1IJscKPFLxLjoS4JKDAH6fHczHYy8a
	 DbsgpGBbadsMrG1b3a2vc1qqa2V+yVAy3G9cyCc86Qx5tm/WbLs24h0v82TG4SSqha
	 +CRolsMrwLOPgedT8mnqxeE+TIPYVZbwObIUZ1TrE5pokx424gB66ZCnm2DbiKDnl8
	 SQywWiF2hMCKg==
Date: Mon, 2 Nov 2026 11:22:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] clk: stm32mp25: define the number of clocks in
 the driver
Message-ID: <20261102-righteous-visionary-smilodon-10b72d@quoll>
References: <20261023-ups_mp25_clk_update-v2-0-398d348ea8fd@foss.st.com>
 <20261023-ups_mp25_clk_update-v2-1-398d348ea8fd@foss.st.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261023-ups_mp25_clk_update-v2-1-398d348ea8fd@foss.st.com>

On Fri, Oct 23, 2026 at 06:43:17PM +0200, Gabriel Fernandez wrote:
> The size of the clock provider is given by STM32MP25_LAST_CLK, defined in
> the binding header. This is not part of the binding ABI: it has to be
> updated each time an ID is added, and the number of clocks handled by a
> given driver does not belong to a binding.
> 
> Define the number of clocks in the driver instead, as done for the
> STM32MP21 driver, and drop it from the binding header. Both are done in
> the same patch as the macro has the same name in the two places.
> 
> No functional change, the value is unchanged (344).
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  drivers/clk/stm32/clk-stm32mp25.c            | 3 +++
>  include/dt-bindings/clock/st,stm32mp25-rcc.h | 2 --
>  2 files changed, 3 insertions(+), 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

