Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B253BBFBF;
	Fri,  3 Jul 2026 10:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783072916; cv=none; b=BnCjaIeUco3uwVOoQTtyBUSJEfOfbi2MtfJ+D5HAad0EtkAK9YDlTOt9iPXxJyZP7tIUjTkRHaa8C6Z85nD0H3Og6TSLsF15RUgDs+F1hcj7AsIlIkTCyWbRBkYr6h2WVh53L77E7mUPWCbLNGZzscwW+ImvsNkMhr6i7Zl8ZJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783072916; c=relaxed/simple;
	bh=lyOhjInpDzz0owAZeXr0GAPi+D5Btf78DbTJc9ulrkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SElnmD8ZReG9n8B/qnY7z8uUKzSFjcH6dtTbHlaHg6da2XI/Z3G5b2+yoPqD4/Bcuvs+NEVEPF/dzwYXLz4KyDUV8I3U0aTwGQBTsUO3RBzQYTwwHR18iBWORaZvMWeH0eNfFbtA4jQKEISrVs5KnE8nbZOcGV2AsS5vlCl9N/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bt+WlfuV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bt+WlfuV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5313E1F00A3A;
	Fri,  3 Jul 2026 10:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783072911;
	bh=NLGrIkYmKmp7vE0YVrA2AuT4K3H4DUM5bt7UR//mRa4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Bt+WlfuV0kyqKMVb+w+LG0ljdEu20Q2ub0sZ6fJ8ZcLh03X3hEsWL98vh1roUnrdN
	 +hRelsUiB0Zn5Dt2Cs0lukd6MIkJ/rRkD46kMy3X6pJrXW5KAET2Sz4f1DndR0P5pQ
	 DO5oajoHb6He4ou3CQLvR/RqXpaEpXDO0m7dgRShpNU8fEIkgcHQG4rCk2GeC0oF5a
	 jxxD1m4IQzCv9B1XVpwA1aD0ZPfyalo6yUUC2AsAvF4XgTkRAExNaOb7UNJnLHLCGg
	 TvSikBcQ4XWPZc+AFXbzJGYTa05txyEiZWCncmJL4uswbJpGlEmekmPLmGWrvKIZGH
	 5tbI+aa0v4ijA==
Date: Fri, 3 Jul 2026 12:01:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lin Li <zhuolin.li@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] clk: qcom: Add support for VideoCC driver for Hawi
Message-ID: <20260703-refreshing-golden-cougar-c14c11@quoll>
References: <20260702-hawi-videocc-v1-0-6c1e640b0954@oss.qualcomm.com>
 <20260702-hawi-videocc-v1-2-6c1e640b0954@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260702-hawi-videocc-v1-2-6c1e640b0954@oss.qualcomm.com>

On Thu, Jul 02, 2026 at 10:08:08AM -0700, Lin Li wrote:
> Enable Hawi video clock driver for video SW to be able to control
> the clocks from the Video SW driver.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Lin Li <zhuolin.li@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig        |   9 +
>  drivers/clk/qcom/Makefile       |   1 +
>  drivers/clk/qcom/videocc-hawi.c | 840 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 850 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 7d84c2f1d911..6b7905c6741a 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -334,6 +334,15 @@ config CLK_HAWI_TCSRCC
>  	  Support for the TCSR clock controller on Hawi devices.
>  	  Say Y if you want to use peripheral devices such as PCIe, USB, UFS.
>  
> +config CLK_HAWI_VIDEOCC
> +	tristate "Hawi Video Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
> +	select CLK_HAWI_GCC

default m if ARCH_QCOM

Best regards,
Krzysztof

