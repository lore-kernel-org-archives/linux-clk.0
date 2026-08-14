Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B447373BF6;
	Fri, 14 Aug 2026 08:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786697902; cv=none; b=ot+tS10bgFfuqMh2I8Yj5gfrO1uxd7BNjLjQhtXv+f7Dy6iVEmb+0j+O4O64j/HkL/1Xw2xLNOElKtqDHytL6eAnNK6EWyFRGTz/i6UL4cp1iFPGMQwGCR0GcvHgjmKMK/LnHBjh00jQH9TP/ivShNQDAX6B+oVF7ytHweE0L0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786697902; c=relaxed/simple;
	bh=pVqvNogzNSZ9zWIq/Pzq2MwWKOVZKmhqCPZDLi2Kl9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oz0k7APclL2vW9MPew3nyqfh5uaJTwxFvTgBCGvTgUnz4v1zCqT1vsMr44tBgmZndXI0DkxF59Kyyo6PWtxwnVh0H6D4iEqz8/zSmjHPOI58DrqMCqqJAeN6tgEB83jpvBVKjIHVzMZ/0ML/kohhCETfUA8NEW3qZBfMWcDhZjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OibSJPvR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OibSJPvR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B5381F000E9;
	Fri, 14 Aug 2026 08:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786697901;
	bh=tkC6HVmDPjjaLSUPhvnHZ12ScYjFHLpMMtz6JvBKuRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OibSJPvR6QtGKHgidzXjHAE7Sjm7A6aAbl1LgNrSdTVeXIIr/roU0gWL+a5IiBCGy
	 so4Yf04AwArg4Z2OWDCaXVvyfHTdoClrHtkrErRnCTEsiGFjrd/KuqML9uFhN5tOUz
	 DcJ3yLOXoSrUOwxS8Wx7aia62+Z2HM9/D4Gv733iu4rwfIAeCisUpjuafx468wHITR
	 IRSdBbnpjNgyQN+B6qV2H3YWmCI4grT3aV+NrcL4xLd66MTB+KoJKZBup5BwybMzNS
	 rDX08ZEs76nMnwWot8JTMH/Nesr7XEunr23ak3952T9VeSsvsYwK7++gwF3QWv4vwX
	 fTY31wogdmSig==
Date: Fri, 14 Aug 2026 10:58:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Long Zhao <longzhao@ambarella.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	soc@lists.linux.dev
Subject: Re: [PATCH v3 3/6] dt-bindings: clock: add Ambarella CV75 RCT
Message-ID: <20260814-wise-caped-chameleon-ffbeea@quoll>
References: <20260813-cv75-v3-a-v3-0-cfdd20b1b4dd@ambarella.com>
 <20260813-cv75-v3-a-v3-3-cfdd20b1b4dd@ambarella.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260813-cv75-v3-a-v3-3-cfdd20b1b4dd@ambarella.com>

On Thu, Aug 13, 2026 at 05:56:14PM +0800, Long Zhao wrote:
> Document the CV75 RCT clock controller and the clock ID header used by
> DT consumers.
> 
> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> ---

Same feedback from Sashiko which you did not address.

You got feedback, you never responded to it, never implemented and our
task is to triple check if you missed something or not? This leaves bad
impression.

Dropping everything from Patchwork.

Best regards,
Krzysztof

