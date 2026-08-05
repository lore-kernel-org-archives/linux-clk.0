Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CF1385D96;
	Wed,  5 Aug 2026 14:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785940018; cv=none; b=VULCDjDeBw99ac9mLiXcPUbSp2oBhKsce0n0oWEHzqYuldO80Aglf5Eq1qjLcntnCHupHYPDqf9Cy5nRlqv5UwO2fQWNHfudj1Gu24Nw+7KuPm1Dcnc8Koo3S9JjMDyWfi+1VaP53qGgVR0S9Ikprn31XefQkxXbboOrXnMlTVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785940018; c=relaxed/simple;
	bh=U+SMKRS+PU1yrG1tVBnkby4RsCZ+L+yMuavfuLqSwAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RLSRQxrLBGS3SeVIbubEX3jZcgw6Pd6Ygm/yJj/F/Y7I1SX7VaNe/pXsNUZxGI9tU5GIfQLbjoJXcS2wnPL5FdXUZHTSjzI5LlqwspEMZJssFwgIvNd8FNSi+dXTMLr6PVYo0llfEDnGIac4LI7Azp1hEd1tgBh8v3eMxs7s7MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qceu6FYz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qceu6FYz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C17B01F000E9;
	Wed,  5 Aug 2026 14:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785940008;
	bh=h0FQAZMCTtVMu+SfQBpj4XUrE+k5949tT3pyyR9/qH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qceu6FYzmtEP9k/+BTogjyl7kCvl5SLBImKlYNAsxgA0B0R6UDLtjFxfAku3TQrdG
	 fpyToLNBAo8AWZifjl1u4VuLFi8aDndzEHqltMC+uzWTID8BBzXnUjmtuEsi9GRfku
	 yRWFFC2iPdHMgJgzCDrEowY8jEM66OOWqJPshFgp6+XI/AA4CViPT77OxdYJZXlwIO
	 22rZX86QnymccpzY2iax3No2CXgLkhnjAK9meWvVRYVui3p6BrqMbd0JJn0P6g18fo
	 K0Bd9PHPwnX6KUHdrf2fB2BHYJY0sRSFrBXn7ggBwvWQb4Wq3h/N5XcwGvxU7Tu/LB
	 TMEE8HEjAXvxw==
Date: Wed, 5 Aug 2026 09:26:46 -0500
From: Rob Herring <robh@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v9 06/10] dt-bindings: clock: qcom: Add support for CAMCC
 for Eliza
Message-ID: <20260805142646.GA795123-robh@kernel.org>
References: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
 <20260804-eliza-mm-cc-v9-v9-6-39067760dc3c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804-eliza-mm-cc-v9-v9-6-39067760dc3c@oss.qualcomm.com>

On Tue, Aug 04, 2026 at 11:20:19PM +0530, Taniya Das wrote:
> Eliza camera clock controller is on CX and MX rails similar to Milos.
> Add compatible string for Eliza camera and camera BIST clock
> controller to the existing Milos camcc binding and add the
> dt-bindings header for Eliza.
> 
> The camera clock controller provides power domains, so 'power-domain-cells'

You mean '#power-domain-cells'?

> must be present in the device tree node. Add this to required properties
> to enforce it in the binding schema.

The sashiko report seems valid to me. Should cambistmclkcc be a power 
domain provider?

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,milos-camcc.yaml           |  12 +-
>  .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |  32 +++++
>  include/dt-bindings/clock/qcom,eliza-camcc.h       | 151 +++++++++++++++++++++
>  3 files changed, 193 insertions(+), 2 deletions(-)
