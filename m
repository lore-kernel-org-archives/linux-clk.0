Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3B64915B2;
	Mon, 28 Sep 2026 09:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790589589; cv=none; b=ZYR6jkq6+vqS/F/FOL2DbjJ0Sbvblbiz1JyDWqXjhcXtVMgep5+AGJ/8KTy6xHKuKUqAxtkWoLSDgxD7pSKeecvsk3cstrhvv35ryOJ6UKYRNy1t/6L9/JPvCxvUQ8+pvT/YeqTYVBwKW1N+L4+enX/VYEmPFnpcjP85g6S7SMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790589589; c=relaxed/simple;
	bh=5KZr34thKGzRyCDAo+Eh3RpKjYMxh49z4rxE+3HL+tI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lAJlCGu0LeffPmOW0keiiSrtdelvQw2LJKhg8nE2H89p3ae2o7UOuNhGQRaLw40rty6Mbn6xhlTHMmZo3UMbIYC/LyQjCIf6rDGKpXhEOz1aWf+pGPVXUzis6gGGXAfNjbeDx9odsGC5B+0Ua7I7Th4ILn9Cz7TM/tH5B5L430o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eFSkdYFr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eFSkdYFr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17FB71F000FF;
	Mon, 28 Sep 2026 09:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790589587;
	bh=nflvNMw1WRrKNEXR7Va5CaUt4Tyrsv5J2Uzzv22powM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eFSkdYFruAbJzUVOSNYSm3JQC2LFND9uK6BTOixHBmWZAUM8F2a/2Z7HrCS8r9d+6
	 iWtpHyLF1/u2/svapmL49oTAIGeL0Mugb3ktNV+73J3d6cwpgBdAzvLQHWe06Wg5Ob
	 fxSYUVi6Df1vl+h+Xm0fDbu8K6BrZE2bien2etx2oRiMatrMUrp9kH+/Ijb8Wn6QIt
	 lZLeGZxFCMRGB2TX0XlzLPxHp0CHW2y9yy8mX1ZytzPwFDOdTlS7MzBBLDOIFj3ON1
	 6t3mLIC2907pYW4S6mi4iW+iFt0zQcJsJ5L9waWvNte9vFh67AKKYrZkhve8/+CImq
	 ZUSmbZsy1V8sw==
Date: Mon, 28 Sep 2026 11:59:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: clock: Add LPASSCC and reset controller
 for Glymur
Message-ID: <20260928-vivid-bold-mustang-c9b996@quoll>
References: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260922184425.56114-3-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922184425.56114-3-srinivas.kandagatla@oss.qualcomm.com>

On Tue, Sep 22, 2026 at 07:44:23PM +0100, Srinivas Kandagatla wrote:
> The LPASS (Low Power Audio Subsystem) clock controller provides reset
> support when it is under the control of Q6DSP.
> 
> Add support for those resets and adds IDs for clients to request the reset.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/clock/qcom,glymur-lpasscc.yaml | 10 ++++++++++
>  include/dt-bindings/clock/qcom,glymur-lpasscc.h        |  3 +++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
> index c047c0174a93..916ab1b3dbee 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
> @@ -20,6 +20,7 @@ properties:
>    compatible:
>      enum:
>        - qcom,glymur-lpassaudiocc
> +      - qcom,glymur-lpasscc
>  
>    reg:
>      maxItems: 1
> @@ -47,4 +48,13 @@ examples:
>          #clock-cells = <1>;
>          #reset-cells = <1>;
>      };
> +
> +  - |
> +    #include <dt-bindings/clock/qcom,glymur-lpasscc.h>

No need for a new example. Just add both compatibles to the existing
file for other compute platforms.

Best regards,
Krzysztof

