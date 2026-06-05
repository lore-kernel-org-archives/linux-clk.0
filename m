Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11ACF3F9F55;
	Fri,  5 Jun 2026 10:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780655286; cv=none; b=EHqtev3jDiLDfrBi27sZHkg7PvqV5BV9SJl+7x1/iFrHVGL0/gqEN1wRLe0gA9iTeBZk4xNFFth7bMw0imMh8+CtVLlMc1aeAHYJA8fdPscdIF1Cojas4p3VqSOeRzHxrQaGX05VsAB8kvV1uWC6RSr6uviWB0HxtU7JuSkrTc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780655286; c=relaxed/simple;
	bh=RarC0QTtYNlPYTaoyjj0xgNPNpEGeOocp1WVitKFxM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K8V9PwoNXeWPt1Y9JqZl6aufWp5DVFG5ZRXRv7sNuzkaz5mvr/RlDagDdMZyowCJOdgJcJ/BxNHDQPc8fZzUFArZtKPpfPNDKndFcma/SOtg5JQiC9lMntQDQ7Snhvn0rWBJrERTEcYKbfSSRyRrkISKKpxbgPffIczytLjzaMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ia+DGViF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ia+DGViF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFB851F00898;
	Fri,  5 Jun 2026 10:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780655284;
	bh=jhoCy881eX03tnv5Zjex6pcMlTj3SRPPLFFO8kkxCu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ia+DGViFB1WlwQx1OnxXpNkbOulB1ygkWbn7gWzGHENKAcyt/POlw1kxoeG0r4cAq
	 0nXHl8bPPNUbkq38ReXbZ9c/ZCpKfg3ahAf/T9hTQf9zz31DfMVWDvypOqAw//9H8e
	 FNZ1jTW4oLZ/mIoCi1PHVmOnFpPQ8HjgpLN9EaPAGePMh/PKXerBDGJVTcfuCnipjl
	 t+dYYIBA1eTSwuPOztSKalx0sWRZczdKl3mxW4fjrMRzkrw2xI2ImSXwhYgiFotIcx
	 R258XDxJ6E9hpj+JpjIJU2yMRu9AuPPl6OPGKreSXOLVpMf8uSfbYhUra9Xx0jIp9C
	 L6FgEYrlq9Row==
Date: Fri, 5 Jun 2026 12:28:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Brian Masney <bmasney@redhat.com>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 06/13] clk: qcom: dispcc-qcm2290: Switch to DT index
 based clk lookup
Message-ID: <20260605-aspiring-ambrosial-squirrel-a7ef63@quoll>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-6-8204f1029311@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-6-8204f1029311@oss.qualcomm.com>

On Thu, Jun 04, 2026 at 10:56:12AM +0530, Imran Shaik wrote:
> Update the QCM2290 DISPCC driver to use the DT index based parent clock
> lookup to align with the latest convention. While at it, fix the parent
> data of mdss ahb/mdp clocks to use GPLL0 main output as per HW clock plan,
> and update frequency table accordingly. Also, add the DSI1 PHY PLL input
> clocks support.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-qcm2290.c | 44 ++++++++++++++++++++++++++-------------
>  1 file changed, 30 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
> index 1c21267ae0f7a86c1de88e888c2a990c35f0a0e0..f5dbd19d0a0334362a44f91a69229cb0f018f309 100644
> --- a/drivers/clk/qcom/dispcc-qcm2290.c
> +++ b/drivers/clk/qcom/dispcc-qcm2290.c
> @@ -24,6 +24,18 @@
>  #include "gdsc.h"
>  #include "reset.h"
>  
> +enum {
> +	DT_BI_TCXO,
> +	DT_BI_TCXO_AO,
> +	DT_GPLL0_OUT_DIV,
> +	DT_GPLL0,
> +	DT_DSI0_PHY_PLL_OUT_BYTECLK,
> +	DT_DSI0_PHY_PLL_OUT_DSICLK,
> +	DT_DSI1_PHY_PLL_OUT_BYTECLK,
> +	DT_DSI1_PHY_PLL_OUT_DSICLK,
> +	DT_SLEEP_CLK,
> +};
> +
>  enum {
>  	P_BI_TCXO,
>  	P_BI_TCXO_AO,
> @@ -33,6 +45,8 @@ enum {
>  	P_GPLL0_OUT_DIV,
>  	P_GPLL0_OUT_MAIN,
>  	P_SLEEP_CLK,
> +	P_DSI1_PHY_PLL_OUT_BYTECLK,
> +	P_DSI1_PHY_PLL_OUT_DSICLK,

You just added new parents which looks like clear ABI break disguised as
"switch to DT".

First, don't mix independent changes. Second, ABI changes must be
clearly documented and your first commits even tell false statements
claiming there is juet "extension".

Did you test THIS EXACTLY patch on existing devices?


Best regards,
Krzysztof

