Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F8D230BD5;
	Thu,  5 Feb 2026 13:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770298389; cv=none; b=VqPgST94QlkRlRXygEVrXZ3IsRjvCJpQuHAWXwMVr1/4ZCXHz1DfxvsB+4IJ8NKKc4ys7hg7zcoDdSFWKrhe+8k9ew+VwBpv4EO0NLbdIFw+dPcHr0g03C8lkrg7IY/GL95bN7THiJGuK35u+jWCwgI3Gw0kX6XZlPGKheHO2L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770298389; c=relaxed/simple;
	bh=eEkIW0kzmW8yj6AdCh1FTgqKKTiqVbFp8LF5vFLliRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TaFau7MtukVvKP3vO3Fbcyt2d6uRRWsdI8tDLcpuCpcgSGxae1Gd49YhJez7hmgfOW5LeZyGdQMn/SaMDMTUJJtzYtu6O02Z7tpErDPjvWxpukj6HKrQhRc859ugOs8Xh/610+YAMdcwjPODuLf5V6kgXtnA36Ez2DypP/LgsqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fmACQWxb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fmACQWxb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 207CEC2BC87;
	Thu,  5 Feb 2026 13:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770298388;
	bh=eEkIW0kzmW8yj6AdCh1FTgqKKTiqVbFp8LF5vFLliRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fmACQWxbYJxyiayYlBJNUkumlRSVgI+5mU2DJGmrtGPUyuXXtCMOu6SF9b637ORBf
	 MarXpC5wotT3e/TACu7It12vD8Kfv5/x1qGhSQcUPnGqwCTwwyY0Vxb3IecE+A4ULH
	 Ri8I+ub1M3cxuGc5+HW9UrRHJpbffBpuXdP6fJUQfVISQrkLJsqF+d2BSUH6LaeLTp
	 l/wHM4z3ihwui6eRkpmcmsMs9eStCrfTj3QklQvMrgQW5RJyI2sueXAP1V+X5nCUGx
	 zEs0TWcNn9KI7ThgGF7JsYSuTFXv0kqC17IC2k4RUg93jZbFCnE4/j2e9FymWWE1ke
	 XYJbkwzlcQkKw==
Date: Thu, 5 Feb 2026 14:33:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Imran Shaik <imran.shaik@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: qcom: Add GCC video axi reset
 clock for Glymur
Message-ID: <20260205-enigmatic-porpoise-of-mathematics-1fb241@quoll>
References: <20260202-glymur_videocc-v2-0-8f7d8b4d8edd@oss.qualcomm.com>
 <20260202-glymur_videocc-v2-1-8f7d8b4d8edd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260202-glymur_videocc-v2-1-8f7d8b4d8edd@oss.qualcomm.com>

On Mon, Feb 02, 2026 at 04:26:50PM +0530, Taniya Das wrote:
> The global clock controller video axi reset clocks are required by
> the video SW driver to assert and deassert the clock resets.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  include/dt-bindings/clock/qcom,glymur-gcc.h | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

