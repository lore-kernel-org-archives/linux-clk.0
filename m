Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528DA38C2C6;
	Wed, 24 Jun 2026 07:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782287615; cv=none; b=NHaY5P/eHHPmd1ILGy/wEsKXadupMVgwL1cDcoVbqYakdKBUNSZdHpXmgICHUKC25qLf6aUm630WlCg1LTbND7DS1bVeqJom2L12r6sQBlW1Qt2DKBAzHxLrGKMP5rCtcO+ammgtoYspVs1FNtB4+QDKN4COlMue6IEHPSXjbl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782287615; c=relaxed/simple;
	bh=NxhM7haVXzOhrdp2hyw8slzEGeBWdGRIQpJIQYwNGVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=erK8bLC6ZEbGTAWZ0VHUoXe+DcyPsZAQWMTc5CSyO5zxry1C+zJjhm1B7HDGBxDeP4R2qUpWRnkjIseQiEok8BHei0gXrroDSZwWawTRftUZSml9wQIWhvzki5EBYUAvlYm8uMY0sUQUH1WBeb8EpYbxPhjMpS7U9BlV3bov72I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bKk/bikN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bKk/bikN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E08691F000E9;
	Wed, 24 Jun 2026 07:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782287613;
	bh=g1ts7TNTeKBHivKT6flBbPP8OJxLx/1C/SeU6xllzAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bKk/bikNE5B0dfuP3ERP9VWSMWCF9kDgSc4g1WKAmnQT/qon8URxvJVyuCz8vDmzR
	 hMVsLXwaVh8lpu8CcELHO1hCrTveT49fU2Rhc+4LoEkY/uy2yvDKiZN4oMJXiPp33d
	 7N9he7qhJZoMvcj1iq8ZaihCw6qqhDCGNzq+EvhnoIiekyW+MBKGJgsUgtmJIZR6s/
	 6CmIayu05JfPUi4j56WAiChUBZbuN1BSauJ/YIz12PHow9wlTc+Zw4Eo8xASgK34BQ
	 Z4csZsjVqmom7aUEp7GfMpyJGkEd9npymOZ3HAhAAITFLfnhPNGfxf7jcyQelXlGnN
	 u4uHWGZ8+qXhQ==
Date: Wed, 24 Jun 2026 09:53:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/6] dt-bindings: clock: qcom: Document Nord display
 clock controller
Message-ID: <20260624-logical-walrus-of-enthusiasm-adfeb6@quoll>
References: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
 <20260623-nords_mm_v1-v1-3-860c84539804@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260623-nords_mm_v1-v1-3-860c84539804@oss.qualcomm.com>

On Tue, Jun 23, 2026 at 04:24:06PM +0530, Taniya Das wrote:
> Add Device Tree binding documentation for the display clock controller
> on the Qualcomm Nord SoC.
> 
> The Nord platform contains two instances of the display clock controller,
> DISPCC_0 and DISPCC_1. Update the bindings to include compatible strings
> for both instances.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

...

> diff --git a/include/dt-bindings/clock/qcom,nord-dispcc.h b/include/dt-bindings/clock/qcom,nord-dispcc.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..9f6c9979e0f358678f28a992af6083b0ae6c97e1
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,nord-dispcc.h
> @@ -0,0 +1,115 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_NORD_H
> +#define _DT_BINDINGS_CLK_QCOM_DISP_CC_NORD_H
> +
> +/* DISP_CC_0 clocks */

Where are clocks/resets/power domains for DISP_CC_1?

Best regards,
Krzysztof

