Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A7D347532;
	Fri, 14 Aug 2026 08:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786697712; cv=none; b=qBfZn5yTI/JViUmvWubcBCemKLqY8v0AGv/U+Z2tOMQG+Tq54E8AS4OZRBjB/mbgSt90dOu5Qw1dKv88uhvF2anAIuVKXLKxOoTiltVEh1AtnKFe8YHaXaG3ydRKECLojg1MNV4bSQK66F2MEwT4jEKjLRK2vn/A7KYcgzp1BZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786697712; c=relaxed/simple;
	bh=GHFvyZkNZiUsMgG2lp2oT/6AEWDHIy5Teju/69ME9BA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GsPS0PYHaUXbpeIH4kYeJu98o86lfg+JUe2nCggu9cK0DgqH1sS5Uo5fpA8pSr9QqFNNsvXWyHNBbNaQClzcldN1RqsS8mNdlLNshNyLViTGFLYHaVhwYtTEZ7uv9Q6Ff60JeAltK6q+AaKNBkjFZW108q2zk2buhOYBJZwd3mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a9j5tgSI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a9j5tgSI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A7FA1F000E9;
	Fri, 14 Aug 2026 08:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786697711;
	bh=FfMtID1csigSX2IWfEYOXc9oHZi5pHn/dI5feGkUJYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a9j5tgSIXL8ovK/x4C7cm6J4QROZscq9fyUeIZAuc6T9aIGu7iKLvLCBVh31QCuVN
	 bY5meXLF5VYmD63L19iAWbHhc1ZdJsnPyKzq6eyMtl73bv+VhIzpEccvoob0hNKadC
	 ZzuD0uMo1AuRZ7crS4Om+nQX7pVZMbfz/Kiium6Ijtg/P7Mdge2qspOiOa1x2I58/Z
	 n59u/6FXrTxn0dQzl6/GaRuBYK61pSwA+AkUP035xsU7YTy48pqixxkVD2m5gUDkq2
	 MlfiIxG7p9zylURn34TWTTGrIlhxrYg/wkMikj7lhs0CbJ3c/mrbzQbhTJcffKfRLO
	 dQ4NoNTOfBF3g==
Date: Fri, 14 Aug 2026 10:55:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Long Zhao <longzhao@ambarella.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	soc@lists.linux.dev
Subject: Re: [PATCH v3 5/6] arm64: ambarella: add ARCH_AMBARELLA and CV75 EVK
 DT
Message-ID: <20260814-skinny-basilisk-of-glee-9aec37@quoll>
References: <20260813-cv75-v3-a-v3-0-cfdd20b1b4dd@ambarella.com>
 <20260813-cv75-v3-a-v3-5-cfdd20b1b4dd@ambarella.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260813-cv75-v3-a-v3-5-cfdd20b1b4dd@ambarella.com>

On Thu, Aug 13, 2026 at 05:56:16PM +0800, Long Zhao wrote:
> Enable ARCH_AMBARELLA and add a minimal CV75 SoC / EVK device tree for
> console bring-up with the RCT clocks, UART, pinctrl and GPIO banks.
> 
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Ad. Sashiko feedback - that's why this should be one submission towards
soc@ tree, at least after initial review, as explained in SoC maintainer profile.

Best regards,
Krzysztof

