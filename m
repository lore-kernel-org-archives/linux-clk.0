Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3C23921DE;
	Fri, 24 Apr 2026 10:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777027589; cv=none; b=l9cdGNyKPfvzZ8B4Cy1BEj7P6Gq0O5M7AqkVfg0D0fs8VeaxfC+s7m+ezEVoxTg8n/etPocaqzADB7MFs814dnvZ8rtKAcy/G/FMd0MBeprwEceEL8NWkxJx/q0BJW/S2zqvGkS9JcrC25hAA92z0vOmr13z5Y6wusoJ+Dh0K0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777027589; c=relaxed/simple;
	bh=4qtZpyGpsH/FUXZ/GR41T16VMbBy/pFD6vlTosJaPHU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=KCydtKnQLQdTmEfOi6nNC8xyzBrkY05w4nym2G+oa3JTk2slN3k+P8Qkj6jbE5NgvUoUAfulceJ83q8VZkdDElspRZ8wesvoFl+fGkvp3PFIOGFFbEDVYFTAPzWsJZp0pkB0rgsMLbvLloEyXxj1Er9rP6hUlYF9ejaG/mpA4no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f60EB6UB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f60EB6UB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 783F7C19425;
	Fri, 24 Apr 2026 10:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777027586;
	bh=4qtZpyGpsH/FUXZ/GR41T16VMbBy/pFD6vlTosJaPHU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=f60EB6UBBQOzyXnZoTt2fg3lqM7/hw57D97QDXcL1hczkpIQaTI8wfm6ezJUgz8kU
	 wI/XF3Mea22R0LaZmAfZ3/GW6PifvCM8rZuDIWn4cGnuzbZ9HdYDz3HpPQnM/JD9kq
	 50SaEumAX+hFivR/BnVlhPVh69CjBrVxEXUEsQhBcvvDraI4Ig2kWmYI4f2MapmIvR
	 k2IbfdGmwfhRiAAsx99N/PZiaZ4Nwl7PnXG8lLRq78gO08XBo7ABpBnL3Sg9+ZU35F
	 nrZRspPwJRLUqkVnqkJGZy1oSOMsdM39WBTXDgVNTP/m4cBcvXFtsVUxoLVGldz5yc
	 B9cSGbMInqBQw==
Date: Fri, 24 Apr 2026 05:46:25 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-arm-msm@vger.kernel.org, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org
To: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-3-4b6e09d532ce@linaro.org>
References: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
 <20260424-topic-sm8x50-tie-gcc-to-cx-v1-3-4b6e09d532ce@linaro.org>
Message-Id: <177702758111.3345072.2051838665194424641.robh@kernel.org>
Subject: Re: [PATCH 3/6] dt-bindings: clock: qcom: sm8650-gcc: Add missing
 power-domains property


On Fri, 24 Apr 2026 11:07:57 +0200, Neil Armstrong wrote:
> In order for the GCC votes on the GDSCs it provides to be propagated
> to CX, CX needs to be declared as power domain of the GCC.
> 
> Document the missing power-domains property to that purpose.
> 
> Fixes: b69d932154dc ("dt-bindings: clock: qcom: document the SM8650 General Clock Controller")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.example.dtb: clock-controller@100000 (qcom,sm8650-gcc): 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8650-gcc.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260424-topic-sm8x50-tie-gcc-to-cx-v1-3-4b6e09d532ce@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

