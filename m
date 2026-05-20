Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4260364E98;
	Wed, 20 May 2026 06:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779260012; cv=none; b=Q8oHlLycARGyZBTVbCln4xEjU9fudDeu10hNEJHYbcX+ayULBOv70PDLgxZiRdAvd8CL8/PnM4r4Ggh5CEf40ifQG7bltMga3AEDjY8+GjMmVApuKeJMTcqgD1mli6926LzQbvMMOFtxIqZKAf/UmWfR0oC1ueOuTEb0EQQpFws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779260012; c=relaxed/simple;
	bh=X7b+6v1X2akx1xIdl3Uu5vbrQPmzxhHW7qmSP9UaNiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SzyIu9coXRbTkECNsQQfMlgJDYuq4R0s74zlkgD/upm4lCHCdW85gsdGc49u3Dpbcuiu5xCGoj5Z+OGwGcFsZ4+N9cggU22aeOUkH5Bqcm305Q8LhmwRukDl7HB0H1B6SfSewBLcgF+SCZykSgZ0HOc3w+mkqyI5gcW8RchNz9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G61aUJR1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G61aUJR1"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id D56F71F000E9;
	Wed, 20 May 2026 06:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779260011;
	bh=yQ7iIKGL0BGLyRSKSjNnDs/7mUwI6/ERAzpdHSV1fgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G61aUJR1cx0mQolYLl+yLbzPUScb5mYq3Gmp0PAMJ3pNpCvyaRIvr+wg0/Oc6SeT5
	 65ga2GQ82m5NUhagstnAh+5uaAU91srRTH2SWRgAMBwBw5WzLqfya2gaR/LLXdfx48
	 Zjr2AWKO/qdtsU6CM6HFNIL0E3/uD8bUvekDAJdW2Xo5kuyirbupqTxQNNC9U4tXAW
	 zBPuXl7vs3+t7bHj461XKTr8snyao/EQ481P1DSJpFKJZwR2O+kjgT0OhPaC2pwnFl
	 v99WoGfyqkEzmONXpeOmsqzwZ3RLaAGCpoEb2tM5bA3iezfyTzaPof+WPY9aPvwAgx
	 f5N2RSz4ir6Eg==
Date: Wed, 20 May 2026 08:53:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v7 2/6] dt-bindings: clock: airoha: Add PHY binding for
 Serdes port
Message-ID: <20260520-prudent-merry-chachalaca-6cbae2@quoll>
References: <20260519220813.28468-1-ansuelsmth@gmail.com>
 <20260519220813.28468-3-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260519220813.28468-3-ansuelsmth@gmail.com>

On Wed, May 20, 2026 at 12:08:07AM +0200, Christian Marangi wrote:
> Add PHY cell property for Serdes port selection. Currently supported only
> for Airoha AN7581 SoC, that support up to 4 Serdes port.
> 
> The Serdes port can support both PCIe, USB3 or Ethernet mode.
> 
> The available Serdes port can be selected following the dt-binding header
> in [2].
> 
> [2] <include/dt-bindings/soc/airoha,scu-ssr.h>
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../devicetree/bindings/clock/airoha,en7523-scu.yaml     | 9 +++++++++

The bindings header should be squashed here as I asked previously.

Best regards,
Krzysztof

