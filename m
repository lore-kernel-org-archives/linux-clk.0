Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793359472;
	b=SLMB6tewcLQ3v8rmC+ip6ykRi0zaHMVcjDuprI0QVawcf4KWpjj8KzWsweg+UNXn7vsQ
	 vvuvmdWW9vVQ6ebQpdhP2ibvhFiMLXQJY3lQ/6LfFrw43F0989Y5TVFKLY7ywm2tGV+MQ
	 h+Lqy+u391nK7aXZfVA2bfHAfwztSQcut2JE3JfVFN0Ue88KeYhCOdUf1RgmONFi9DKNY
	 KY9x9je2fGpO26i8O8ZevQEf2mfhFiyNk5/IFePN3AscCwK2Ei8g26YZULd1VHNXO0mE6
	 peWeyilnWGVgpanwc/zQBlf8RSO9rk8CahqbJOq93LCZ9eYX9kxcwta897FJs7vvp9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793359472;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0R9mpGXaa6njmjYCQm9R79QXLjB3UNrIXfnsijCCTLY=;
	b=WLJQHfXF5qK9K9XEhCMIHEFXhelkjGF7TsfYXoTMIvHxGvzTVv7O8TIZdnDnCQ/L8Qzi
	 fzi5qmzxS5TB20ZufUHOn9Ynvy5WDgCPr45SwPIdpgC/RXSpDmM88r5dsM7pSvKCEMZ6X
	 +h7sYHkO4oVHAVgGA9y/gnbFd5Cd2A2IRw2daJIFyXaxffdAO0vVvruJcMxvl8UaFe543
	 YGJ0jC3N8aSUMmb0pJNzKPq1bDK/07AmhPZGJtLrOWd38mKVBO6JKKZKNfSQBZZC0feop
	 9Yg1zzgmsLuBvpB3nkqAZL8b7b3Jw+tFgNRx3S0N0nfzJAS9BL2KR9qNG8CgypuYWTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iefuUdR6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AF7606A31D;
	Fri, 30 Oct 2026 11:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iefuUdR6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 261FA1F000C1;
	Fri, 30 Oct 2026 11:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793359472;
	bh=0R9mpGXaa6njmjYCQm9R79QXLjB3UNrIXfnsijCCTLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iefuUdR6ndz6ACtrN42XdKtHa7dXchA1Mm+sNTQrpoOchg7HUIK2uVGzrzRtZ6Bil
	 VNptVu0nIc9A3yPQ8zHtpmsrqL1V6wRW6I4d/7hyJ4/X92UaB92q41WhTEdB/71jCm
	 g/YMdWf3Qt7IVk3PpHqyAU8J1RA5Uxr681N7yYZRz6z5rhUqKz4frrfjWJOXQ4bzlA
	 l5PAmjHRhswGsbN+28UyFOdEXr/0ztaNAboXE08mHbwolKtn1Kcqz1ngarWWkFqm+5
	 KPUHcauAOMBhDOFvnQHo+xXY5EzrPCdCNsEizcv4c1tmmimPRwzfcMuJY6O2aynycw
	 EspApFixWqh4A==
Date: Fri, 30 Oct 2026 12:24:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, letux-kernel@openphoenux.org, 
	kernel@pyra-handheld.com, Paul Boddie <paul@boddie.org.uk>
Subject: Re: [PATCH 1/4] dt-bindings: clock: Add Ingenic X1600 CGU bindings
Message-ID: <20261030-zippy-crocodile-of-enhancement-9fb0f0@quoll>
References: <cover.1792955907.git.hns@goldelico.com>
 <13abd95aaab56ce5c9dc565db7f0198162b0c166.1792955907.git.hns@goldelico.com>
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
In-Reply-To: <13abd95aaab56ce5c9dc565db7f0198162b0c166.1792955907.git.hns@goldelico.com>

On Sun, Oct 25, 2026 at 08:18:24PM +0100, H. Nikolaus Schaller wrote:
> Add the device tree bindings and the clock ID definitions for the
> Clock Generation Unit (CGU) of the Ingenic X1600 SoC.
> 
> The clock layout features specific I2S handling. To properly support
> the I2S controllers on the X1600 without relying on complex compound
> dividers that are not yet natively supported by the drivers, split
> the structures to explicitly describe the additional I2S divider
> fields. This design accounts for the current driver limitations
> regarding division encoding while matching the hardware's internal
> gating architecture.
> 
> Furthermore, introduce dedicated I2S0 RX and TX clock definitions to
> allow independent and precise routing for I2S stream usage.
> 
> Co-developed-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
> Co-developed-by: H. Nikolaus Schaller <hns@goldelico.com>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---

One more nit:

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

Best regards,
Krzysztof

