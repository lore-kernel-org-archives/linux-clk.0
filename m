Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB7B41D13B;
	Tue, 18 Aug 2026 08:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787042357; cv=none; b=FYCHO3l/J1wVUW20i7icTS3vyZx3G7l2UqcGdD66KGVj9EGUy5jRufc2Gc/QL5AErZ9xizXpAIybWmiVlRwE82e/RmdiMdTe1+OnHVHaYV1KQVuLUw1Rb4DEI8Nu7hKZRI76a12C81VBwbz23fRZywzTi3s2aHq/u1YWN61WPsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787042357; c=relaxed/simple;
	bh=eTXsLc1JiByMlycIe50UlyxBW8XUihjrUs8XtMF3SA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qvsu9LUGQvAbC3He0N5NA34MTT8Dcc+jJCHApZ5VL5J81Dkhl8Qy1c44jefklKlOVoDTLhiTQ7lug111x/ujwtdpXMKhtVJnm6ZRbeX4RHq5X5KH1RuFzdxujw9oieCsRIfGo+wfaT+Km06oj5EKI5/HBTiq0oKaCGJCaiNSyXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mOBBQO8C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mOBBQO8C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21DAA1F000E9;
	Tue, 18 Aug 2026 08:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787042355;
	bh=I7Owhg1nzSRg8qLTtyWVfOmrhJAxPj0PEVlD4Ih4IXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mOBBQO8CINqSo8hqnaNly5rcRpips5txY6JlS9+ViTEIwdq5/Z+W2eGCjFlSkUNTY
	 BA4VA8F59ht2cEv2FK/58b/fB1Jhau0Wc1GQhC2CgyAkCFNZUGFA50Pg45PnXfAHTV
	 IJi5cYtkLyJT6S5u/+byBNk26f81SsrKWMcBCo05z9OjDF77HlDZqF8+FsDOPBYs9b
	 sfju+Wt2pbKySr0l+JF3OGzU7KCQEpqIE3q+BBV08BfZH+btJKppCyxg5tq9Xvzl8C
	 Dkkfu2QSqRYjqAdaNODVEJH5zROTIiZ9Cp8kIOP+R6KHLtqpXt6aRCGCds7rr1ZNVk
	 vEyMvOVdtBZPA==
Date: Tue, 18 Aug 2026 10:39:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, quic_tdas@quicinc.com, 
	bmasney@redhat.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: clock: qcom,rpmhcc: Document RPMHCC
 bindings for SM7250
Message-ID: <20260818-perfect-sambar-of-judgment-57ea22@quoll>
References: <20260816131646.10551-1-sreeshankar0910@gmail.com>
 <20260816131646.10551-3-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260816131646.10551-3-sreeshankar0910@gmail.com>

On Sun, Aug 16, 2026 at 01:16:45PM +0000, Sreeshankar K wrote:
> Document RPMHCC bindings for clock rpmh driver on Qualcomm SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>

A nit, subject: drop second/last, redundant "bindings for". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

Why is this patchset separate from the other clock patchset? Please make
it easy and obvious to maintainers.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

