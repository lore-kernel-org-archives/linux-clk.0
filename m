Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C91421229;
	Thu, 17 Sep 2026 08:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633394; cv=none; b=DvAFYpOUPgH/GlcCblzVWzsQkoHbH5Z/qGCHTB26ooKx3+Iz/EMLBNMxQDL3xi2ovm5nm6n5OcqjxvUjTzdrzlIHXpog76vTZK6b4Xovd60D+lPEsoZICKVHm3z1ZvtSgpE5wjvoxJhb7pA8YOcjLCzM7JGiz5Fo4a1Clu5T2rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633394; c=relaxed/simple;
	bh=g1co1jzH7U1K18tKATjRSARI6guUiPRLxJTf+3GujnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YNGWV/z7AH3EJkbvDsHqDR3woF7ei3O0sxZtPVq+IxSoxtZM+j2ksvkKP70y+6fLMxCDExNOH2jjA7u3+dIS2G358xplSpc8igr3dx0qL41+LXV6WaC0HZjR7cN6NcNwliTatfZZY7jR8dnLTJTlTqcGBU0HCtrHcxjLm0PX4KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ma88aExs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ma88aExs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 982D11F000FF;
	Thu, 17 Sep 2026 08:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789633387;
	bh=62ejS+gQZ18rqUWud6FQTYSOrMgOR5ZniszKprxfiyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ma88aExs8lQ9yv5XG3Y60kIpNEUk9Mtpwuhb+xm7fCrX6C9jPpnPAiQuOYlZuCQU1
	 7rAF6d1MNH7basfamWJKcVoHh1pw7FrkwfDDOlyxXLUSrQzBkUhxUMYKtH3aO1t3du
	 G0kjs4EXWQ9ZQT0fT9TCkafofdMugJmjTp/KxlDnw3XzCxO7CNe2Gn+DWDLsR2vMcn
	 7jKSb7ikMFAA+qg/qYcyiteFyL6HC1po3FAU51b17iEhAP26ZnlJNTxxXq3QlF8RB9
	 xgHT45YOBCiaWZGzVSdO0ozXpHQbRsY4Vf+rArVdS1wahHAU13KkaWCCVuvw63MuMG
	 e9zq6nHuYU/sw==
Date: Thu, 17 Sep 2026 10:23:03 +0200
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
Subject: Re: [PATCH v4 01/52] dt-bindings: clock: qcom: gcc-sdm845: Add CX
 power domain
Message-ID: <20260917-flexible-unbiased-grebe-3a5dbc@quoll>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
 <20260914-qcom-tie-cx-to-gcc-v4-1-9d5a606ada33@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-1-9d5a606ada33@oss.qualcomm.com>

On Mon, Sep 14, 2026 at 03:47:00PM +0300, Abel Vesa wrote:
> Describe the CX power-domain dependency for SDM845 and SDM670 GCCs, and

The domain is already there thus first part "describe ..." is not
accurate. You changed nothing.

> require it for both compatibles.
> 
> Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
> undervolt it.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
> index a7523a414341..356af877353d 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
> @@ -31,7 +31,8 @@ properties:
>      maxItems: 5
>  
>    power-domains:
> -    maxItems: 1
> +    items:
> +      - description: CX power domain
>  
>  required:
>    - compatible
> @@ -56,6 +57,8 @@ allOf:
>              - const: bi_tcxo
>              - const: bi_tcxo_ao
>              - const: sleep_clk
> +      required:
> +        - power-domains
>  
>    - if:
>        properties:
> @@ -78,6 +81,8 @@ allOf:
>              - const: sleep_clk
>              - const: pcie_0_pipe_clk
>              - const: pcie_1_pipe_clk
> +      required:
> +        - power-domains

Why is this required per each "if" branch, but not in the top-level?
There are only two compatibles here.

Best regards,
Krzysztof

