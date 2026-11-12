Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480517;
	b=u4yoFX59fXDlf21fPaMyUQ9u/2il68ektPV9R5BQccnQvJZxG1F8i3fNyuEgzw4SRT2/
	 j1PgMNGba2BwN+exO/81ASge0+etKOVFt9Gd9qeyvGtjBJBVYrp03cB2w0lulkbjTttFd
	 EMBjjJigOpUvLdut4lCvjcTMH1Kr6xdi3LsinctLZ9CUcZZwzqLKTRJXFYf7JuMZ+mWkF
	 JN3LwVsxFaWpfn3xMhczpznm1BNxuMbf8Fip7AdLgi66wf6L/DFfVLfZxN6kjUNq4zaIg
	 kI9wdtWbCxhUUIGlte4yL+UbW38yCh7tpgWJi/rrVD65o+Hj981Sj4xM1/Yj/bm9pbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480517;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=oCLhfmO0/GO10jDgwC2AL+z7Zjpscam/XNbpIH3fbr8=;
	b=ESJuoqvFd8QERvMGkCQuA9CVIC4DGDXVze0luQbL9rGAB9NGBmBopPseOEUaAkgz4qP1
	 kOFA4A+uiSMkZhg4Bp49gZRn73gUYudbWq1GBb8l0hS8y1Y9popF+PGGEqcYxY0OI04ks
	 TU2BNK4MJlp6gdMu+ddaivWEp5TPC8x7+LmEB2cbaQng4s63u3EuGAVABYi7YwA6tuWLn
	 Gz+SSXtN81+BYo2jBV2YtO+ovW5DZGK+3jvkwkQa032MgwfbVPIqV7JwWRoDlCjhYpQsy
	 DYgXqJQpBd3sqArbvW73kR/mduDthMR2ChxF8tvRcgZ4Rt8UjfxZ/iK1FyjcPwRgKSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DvHdwlua;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AC5606A31C;
	Thu, 12 Nov 2026 10:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DvHdwlua
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA8B11F00A05;
	Thu, 12 Nov 2026 10:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794480517;
	bh=oCLhfmO0/GO10jDgwC2AL+z7Zjpscam/XNbpIH3fbr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DvHdwluaCy/hXrdZym7Bl6gk4fXjt5qgZvv8WdIFkTmaxt7YZOV+60qunWJ8nJJha
	 TidxQYeLeGGYcxYme4l0blPrjaRbNW8RkMK81K82xLiaMp7iYtFEivgW7mAm3Qt3ih
	 4rSu9jb++luLr6Kr1SpDSzm/Ui0TKc/VEKkHIwzR86dUUvU6uIwqqzMooUOh/i9qTT
	 4auvXkzf8mjbqn388v9vQlgtIeE27VCbNlj5Dh2WXcaCfuY90c5VVxxNRUdck9/VRe
	 3qNX25t9oV0f8qEXRWBw6JNp59o/yOroZp5LnTeor29O2lr2bKQaE/+e6LhfFKBnI0
	 gTfyZui5EuePw==
Date: Thu, 12 Nov 2026 11:48:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Alban Bedel <albeu@free.fr>, 
	Antony Pavlov <antonynpavlov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/7] dt-bindings: clock: ath79: drop ATH79_CLK_END
Message-ID: <20261112-nifty-whale-of-vitality-b5d9fa@quoll>
References: <20261111215729.10683-1-rosenp@gmail.com>
 <20261111215729.10683-5-rosenp@gmail.com>
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
In-Reply-To: <20261111215729.10683-5-rosenp@gmail.com>

On Wed, Nov 11, 2026 at 01:57:26PM -0800, Rosen Penev wrote:
> ATH79_CLK_END only counts the clocks for the driver. No device tree uses
> it and it is not part of the ABI, and it would have to change whenever
> a clock is added. Drop it.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  include/dt-bindings/clock/ath79-clk.h | 2 --
>  1 file changed, 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

