Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006783;
	b=QGFdkHCbnS/4oknsTjeYM9mXF0EDUuuJ1oku1nfzrcx0yAqOcbRg00WjACgJASDtA2Ls
	 Goz6wju+rfW6eD4VOjuWXyIOm1DnB6OH+n6KDG8Hxj/G4/g0Mi6vWs3Q3b153PZpzVGyI
	 lC60fq2LDyNnt/NXVUSUshS5nlIomOMuS+ILW6doPNnF6mZ9uq7oHXdNKjGg0vmQiPJLy
	 5DGQfVFNYj6jjnWC/f9OMYGAGXo11Ix3pjzfJV+MhfMmCQHSYcc8iw7lrzkv8M8blmbfs
	 5d8obAmZGvtJE4QUj8q3OJN9yJgFAHMzkKVQWhgBnjUFaDXV+l8z4O5whzKj8FlQGyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006783;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=eCi6RalDoYn/fEWWJFXGvTr/W/++okNP5+GAu74Bms4=;
	b=j8zoZP51l5SCTrsDWgbIt7JS3vwHtVQgYdnUMjhdLXnsnf4PSPtjRr1HYXn0PKa6uCqi
	 YC2v5Kdzcq/5j2w7+yYc3z8nEqeLhQSappc/mjLEtIxX74Ys7EajpbGNJS8G80fc3fGAP
	 3MsOfl6wiBybKBqyI1gdmmrG3CdywHD0M6j3RN0/emx9E8gd4QIrKrdoVELbcLrt/bvo/
	 Wvih3ZSlge6PwiE0yRSdJ5pCj2oI1vGq3gy2rcLrr4cjvPr7+fnEHIthqh6uYrXrfB/nk
	 VMRsM9pPaM03DzC6v6Nh8JCCsrYJ3gwEhYeUIjYtW1N5Za/E2orI3v8ppj8efabjhVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FQvHFoRi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E7A606A31B;
	Mon, 26 Oct 2026 09:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FQvHFoRi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF8C41F01825;
	Mon, 26 Oct 2026 09:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793006783;
	bh=eCi6RalDoYn/fEWWJFXGvTr/W/++okNP5+GAu74Bms4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FQvHFoRixIyne+hUo8M2e1iPpUJqQxbWG6NgZBKZFNbHimPLrOTelIClgPEbSZXpW
	 kM7srNyyN03M5+Z9dDsb9WZCJBFAz4RphGcvRmnakfze39y0WlgzFk9TO4yGAS6bFs
	 wZRkzCjZog3O/AZ4W47EeIKAS/5hZDuNGrc8x2K5C20nJ1y0IP8jc0eyd1ACNReCZ8
	 hcYxrZGp4W7oETXggItBtbo6r9PrPJRcQr6x29tiVkCO8OjaCZwlxxYusBXPzbQ8P1
	 1iATjlcPC6i8A18thVNnR+9IrGqR2lpIK9Fm6jX63mGOnaSLmlcfJ7pReDmGxzrZQf
	 /msEpn0KALDlA==
Date: Mon, 26 Oct 2026 10:26:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ishu Brar <patches@brar.si>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: Add SM7250 graphics clock
 controller
Message-ID: <20261026-primitive-eggplant-albatross-737362@quoll>
References: <20261023-gpucc-sm7250-v1-0-d9149cece8be@brar.si>
 <20261023-gpucc-sm7250-v1-1-d9149cece8be@brar.si>
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
In-Reply-To: <20261023-gpucc-sm7250-v1-1-d9149cece8be@brar.si>

On Fri, Oct 23, 2026 at 03:40:08PM +0530, Ishu Brar wrote:
> Add the compatible for the graphics clock controller (GPU_CC) of the
> Qualcomm SM7250 SoC (Snapdragon 765/765G/768G), and the header with its
> clock, reset and GDSC indices. The clock inputs are the same as on
> SM8250, so the existing clock and clock-names constraints apply unchanged.
> 
> Assisted-by: Claude

LLM is since long time, but checkpatch already should tell you this
should be dropped.

Please develop on latest trees, not some clone (e.g. postmarket).


> Signed-off-by: Ishu Brar <patches@brar.si>
> ---
>  .../devicetree/bindings/clock/qcom,gpucc.yaml      |  2 ++
>  include/dt-bindings/clock/qcom,gpucc-sm7250.h      | 36 ++++++++++++++++++++++

Filename of the header must match the compatible.

Best regards,
Krzysztof

