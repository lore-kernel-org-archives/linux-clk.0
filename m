Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED743659FF;
	Fri, 13 Mar 2026 13:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773408897; cv=none; b=rzb0G+X9yui3rOsw5lWIGxt9Yv75E3mPKtXCOLGsaoXkXugBys4K95HLql/qvnLQ2wbKURO37gk/l39ZqdEEAWocNO4I9/aOrbtSFn9t8xyiJ0mw+kuIJ5F/rOUvDejj+dVb4RpNG608uHryu4ppFspZVt71IhF37An+QKBhGrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773408897; c=relaxed/simple;
	bh=/qdPo0dyneaxhZczYgUkfLzRiUveJVtfXlWmgiFjmpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsLdgR2pvg6tFvVbmsPapp8aCiQZ96xuZE77WFOm22jWcCj5XxPX70ks6N88X21itpAP5PnBW9gb2i2JOWN4etqhlsAeQq7NU1EoiDr7URJMbp2U19305fi2wG3NVPB9fRDiM0j8ED1eOExnHxHNyReef/wz3UzaXSMiptXTd2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ojDVlVI+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ojDVlVI+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D618C2BCF4;
	Fri, 13 Mar 2026 13:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773408897;
	bh=/qdPo0dyneaxhZczYgUkfLzRiUveJVtfXlWmgiFjmpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ojDVlVI+BJ7ZIZL5Pn22A6dot9jlWCtxZdXjt7HTKoTpxaEQgcA5Nq30YLW+JeeAL
	 w9t4PTDaWrlwGbSPEY9zNuWnxbbEMu0OzMk1KOB+48hV1IuGiKMBfSPvVmvoTTSwIL
	 d4PJ83qu2zENxOszVHLi0Hhpz7ZK3q4Oyg7GfvxlOn0BOhziBaU8u+GxNKgMjaiuhR
	 efIjtZr4jquZ6DBCmA8T6ABBA0AiY3vMSbf2gGgicpdcO/+ghVrA26J5By44MY+tcv
	 vrCtMEPcc17vrjMO/17Gv6O6oFzSNxy6gMSoQg29bhIIKLeqAfg5GmnfLR+Q9MVBf8
	 odXpdsW1N5aIw==
Date: Fri, 13 Mar 2026 14:34:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Luo Jie <quic_luoj@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, John Crispin <john@phrozen.org>
Subject: Re: [PATCH 1/4] dt-bindings: clock: qcom: Add CMN PLL support for
 IPQ6018
Message-ID: <20260313-neon-eager-magpie-c2dad9@quoll>
References: <20260311183942.10134-1-ansuelsmth@gmail.com>
 <20260311183942.10134-2-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260311183942.10134-2-ansuelsmth@gmail.com>

On Wed, Mar 11, 2026 at 07:39:38PM +0100, Christian Marangi wrote:
> From: John Crispin <john@phrozen.org>
> 
> The CMN PLL block in the IPQ6018 SoC takes 48 MHz as the reference
> input clock. Its output clocks are the bias_pll_cc_clk (300 MHz) and
> bias_pll_nss_noc_clk (416.5 MHz) clocks used by the networking
> subsystem.
> 
> Add the related compatible for IPQ6018 to the ipq9574-cmn-pll
> generic schema.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/clock/qcom,ipq9574-cmn-pll.yaml      |  1 +
>  include/dt-bindings/clock/qcom,ipq6018-cmn-pll.h  | 15 +++++++++++++++
>  2 files changed, 16 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,ipq6018-cmn-pll.h

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

