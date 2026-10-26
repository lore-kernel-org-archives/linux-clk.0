Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007331;
	b=Dt+RdRM/ldnlXhkZHa08yKh8fWW/36moJg75fGR7yg426j38cKFW4pSKNO6QireXzP9v
	 MqVWXWmTh6+wS8bowcKqSDEwxTruzpvAZ7mv8VLUhuAk5dUgKbudnlL7GBJVES5iqpQwD
	 MNIWRT7AgxGLSTCJ+ZkXpujxAEjCN5yag++EZjTTkhAHvCsFzL7xOQTZfecLcY8FVS6/t
	 XQxTvBwlZ8LhPuQMLIq3x3nwmHWFBQpPV65yVShklUI12iRYMf0ZV+9JzRC/xWePhnWF+
	 4jWbLGRV3me9qQeVgF/qGn414wgkEWLBuAjLEzf5PB3ikOEe0X//53EHpGbfrMWONCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007331;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=FjcApcSkV9wPG+Ks7KevMyBdGqTJudD4oHfQF5W+BtU=;
	b=qj3NvIF/CVYfOJx1LlgBPNS8f03EEMbBG/pvrw6fZPfFfVjsWCvMW82j4qr6TwwlXH+h
	 yRBRGtjbRzhhII2sPGP2SIWp9/CoQFCfgnHgcsOo4TPtAH+WB1S/Ze3RhQ6N+qb8et3zQ
	 E663y+/OELPbHA9Ky8pOWl05zsopayCsXkcgbNTN3sfhEG+bV7KnQW3Ae/b8JyIAxo+DL
	 9gTdbcUCFNb53VFT5+dURXruwivqnC2j0HOiSOp225vWL82VAzacA7lBnjhUD/mA4sq40
	 BPpp1mf40bgXZNIC6flnVVt37pMLYOF9lITfX0WYo8Ghg5m5Q7cYqPEtj8ElgID4oZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kOyNn1ko;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED204606A31B;
	Mon, 26 Oct 2026 09:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kOyNn1ko
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 053A91F01825;
	Mon, 26 Oct 2026 09:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793007330;
	bh=FjcApcSkV9wPG+Ks7KevMyBdGqTJudD4oHfQF5W+BtU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kOyNn1kok7qaWCBfEbJnzyQm2yULzqiGWoUhBYrCzaQG/wAJ+pedaGYfupv1wbNQB
	 P/ZNPO/tWHyRV9Pze57PlwtkzIXkCiwd3QbO1BcJ4p6WC21B6zX8HGDqtMMoqVm/5b
	 H+1N89FJP4pTDJ0o+dhtsYOX0c5n5N6r2qx8sg+YeKpS/KtvPrqQMmNykoYMPNB1SQ
	 mTM5RLPIxF6I+O4dCNKH/PYEZs/UeIGtJ+gTc1dVE2l3ItfQCWkCFPGeCRTF7NUB/O
	 RgZXmVSo6/IXFh8mTrhvUBLGQtTJ0a/uKegBH9o4LUw1n/Z+H1auuzi2csSGgw9DIF
	 dLJXq3XxVZx8Q==
Date: Mon, 26 Oct 2026 10:35:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ishu Brar <patches@brar.si>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: Document the SM7250
 display clock controller
Message-ID: <20261026-demonic-polar-python-0abdb0@quoll>
References: <20261023-dispcc-sm7250-v1-0-07bdefb99801@brar.si>
 <20261023-dispcc-sm7250-v1-1-07bdefb99801@brar.si>
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
In-Reply-To: <20261023-dispcc-sm7250-v1-1-07bdefb99801@brar.si>

On Fri, Oct 23, 2026 at 03:48:24PM +0530, Ishu Brar wrote:
> Add the binding and the header with the clock, reset and GDSC indices
> for the display clock controller (DISPCC) of the Qualcomm SM7250 SoC
> (Snapdragon 765/765G/768G).
> 
> The header and the binding are derived from the SM7150 ones: the register
> layout is the same, but the controller takes GPLL0 from the GCC as an
> extra parent and has its own PLL.
> 
> Assisted-by: Claude

Same comments.

Best regards,
Krzysztof

