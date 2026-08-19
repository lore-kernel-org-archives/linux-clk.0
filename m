Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93FB43785D;
	Wed, 19 Aug 2026 09:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787132868; cv=none; b=sYIy71hcOXwg3KPXolvpzE+pcdVkPWvsVXKRtO/l1fCLNQ8jyqZguHpek5vFOkKrXnBVrtfQF9Eza8Cz/FRysYcSPctDW8ggl/tmREoCH1U0RojYADYk3lVTuAB3Lcz82EN/ntAB5sADeSmgJ9x4Vp9hEa+yG+DsdL7mMwpmt2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787132868; c=relaxed/simple;
	bh=TJqLSmbc9+BQ1OcbbLvGRT4hr+GrfWQLxw9iAFwMfao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IxVFiHKgbRcKgeI3AiMoCT+bK2+nQ06w/ObEk7QJrOFSRLrGhHE74phWX15RujaT49s8bf3gnWcZ6PRPtGAcAFgePTXW1IQp/iUbJuQ7cuty+lFTWG8MjxzLm82Oofxfdua+4L1l4N77SPV0+Lu7vOy2PnZFQm2ZU1HWa0qMlSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cihWGOnT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cihWGOnT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9362E1F000E9;
	Wed, 19 Aug 2026 09:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787132866;
	bh=IIHfwnppi5WLCcH8yOSOFZSzXTOXiUg1twuLCqhf9Bc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cihWGOnTXHLB0pZEOgi1GWkrzdiCehv4fClMCdPh9e90/yO5GXLnI1+BsXpYkbYK6
	 DGBPHZ7vYNEoXkxfqaTAE4c1EbW3Zvwcu+CN/oJ1XCelF1knS68vs4oFId0jfyslV4
	 93Hq2qnLv/6i/frH0+/4HrjojW3Us7w9TePTlrzqX8OVIS2DjZ1t1x+CKPllJtNenD
	 k+gEiBETfwRcWpmMq7fNQynVgIcHWQwGGohhxtjPEdEGlqzxuSLw6V+dkrt5PhDq1W
	 FUhPb+YhqVm9VvSPNDcPMPjWZWN8ZYYabp3IVs0k9Lti1X7sb2rhndWBe+lhFADr/l
	 7zID6FL9I1HNg==
Date: Wed, 19 Aug 2026 11:47:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org, bmasney@redhat.com, 
	lpieralisi@kernel.org, quic_tdas@quicinc.com, danila@mainlining.org, 
	davidwronek@gmail.com, robimarko@gmail.com, linux@gurudas.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.vger.kernel.org
Subject: Re: [PATCH 03/12] dt-bindings: clock: Add GCC clock bindings for
 SM7250
Message-ID: <20260819-fortunate-sophisticated-kingfisher-c8cdab@quoll>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
 <20260818080754.4362-4-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260818080754.4362-4-sreeshankar0910@gmail.com>

On Tue, Aug 18, 2026 at 08:07:45AM +0000, Sreeshankar K wrote:
> Add device tree bindings for global clock controller on SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> ---
> Dependencies:
> This series is based on and depends on the following patch:
> > [PATCH] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
> Link: https://lore.kernel.org/linux-arm-msm/20260817082457.64797-2-krzysztof.kozlowski@oss.qualcomm.com
>  .../bindings/clock/qcom,sm6375-gcc.yaml       |   4 +-
>  include/dt-bindings/clock/qcom,sm7250-gcc.h   | 163 ++++++++++++++++++
>  2 files changed, 166 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/clock/qcom,sm7250-gcc.h

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

