Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B8D40EB8D;
	Thu, 17 Sep 2026 08:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633947; cv=none; b=KVaKj5HZ6UhsMsOQGiCEJNEVAky4i/Co6QkGDEcGMJjm16h4PzEuHTiprkyhGSi3kTUleUW/bDrS25Ro7hy0s7G9cnVK177OI4BjeEx/0jno+vLLqhqpbhxI6fJ/OO6JT9/+M/nDGvVPHzHI+222ZNNqEVtl1THac6Vws8wAiL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633947; c=relaxed/simple;
	bh=FL8jHSeXwMN2nhXl9d/OOr2sr3Omu0NSl22DIDOqdz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fTqyNUKwbPWJlrzjhYwYXMrTUrr9Td9VEBO8FXOiFNXZEIpvTC9VcGuGmAH5ZtebhHQA+nkhS4xlOIf4i4DEPsSocGcOl+idRXIcS0kf4Op1BO+kwFWC+myKIO440l1PKrrrYcqIwMFWVARsulSahpd4oYEQW3IFO5e57KUALS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l2qFbU+b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l2qFbU+b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D06041F000FF;
	Thu, 17 Sep 2026 08:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789633934;
	bh=Cor0ZEb/IRiMpjE4CO+Yrv/RhrardI2IO8isZKQ1WZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l2qFbU+bH0kyhEG1HsUJT0nlLfFCrd/Z6AW8/f5G7i4aPkvQPFiaMlGrcno6eDzNE
	 bUP7UDzplRKYe7XNRcUKVtaTm31B3ZKAZVLeEN35vmdg0prwxctDYY6tX8fCrYKqHy
	 MAN5ePcUHH7BXYuy4cEfAKqC+FBG9KR+cJOekCAUfpQ2xUHIATfdqgjVj0xl18k+yH
	 EVaHsoABToUh0xFn+jpxgUNzJrNtPuLFReJ95AbbYXBggnwnBLWGu2TkjO1E2x/5DS
	 jgDqQeiSLrPKfxNL5JEvgi5r2Ss9aFGw931usGTsjmL+yrqBJkvkY6s/z0GlZmF8r8
	 FpVk1RWuexKOg==
Date: Thu, 17 Sep 2026 10:32:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	Vinod Koul <vkoul@kernel.org>, Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Tengfei Fan <tengfei.fan@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 11/52] dt-bindings: clock: qcom: gcc-sm6350: Add CX
 power domain
Message-ID: <20260917-curious-nautilus-of-will-b1c356@quoll>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
 <20260914-qcom-tie-cx-to-gcc-v4-11-9d5a606ada33@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-11-9d5a606ada33@oss.qualcomm.com>

On Mon, Sep 14, 2026 at 03:47:10PM +0300, Abel Vesa wrote:
> The GDSCs provided by the SM6350 GCC are supplied by the RPMh CX
> power domain. Model that parent domain in the GCC binding so the
> provider can describe the dependency in devicetree.
> 
> Add a single CX power-domain entry to the binding and make it required.
> Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh
> may undervolt it.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

