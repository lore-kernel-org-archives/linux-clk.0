Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224D3392823;
	Fri, 24 Apr 2026 10:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777027584; cv=none; b=NV4Y7oWJZXjGkzV+KbBaS9Vc0nG0ZmWjMCrTUyTWUIORSQUu2GRHXnAdbjSGnIIHXmB8XwNXpctm6winWwamO0ckYwzTv35fMONU3UTb42YWIoRYa8AQwVry+fFn5DDeiakzuTdK2oN+gUpM3FhrUD/fQPoMdW06WBWTXTUSSh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777027584; c=relaxed/simple;
	bh=YOuVShcZmgP5QzkQeSusRIbMHW9dhDFha6DgR3S/6BU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=HjnriEW4gRRTP7kFWzUHgXqfePQwCrRzc+E40b+HcoeK6bMVtY+dqkdNecjTVGfxfIDy8MCI/j19CPTUWZauGbMAO8Wt5Ig7fOe+mU74DTk5t9C7e+/JW/hTwMc0sHVHdXa/mNCnkC9pQDr+aZP0As+DP22VhuThYuH3Rh+PR90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pJ79BeiA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pJ79BeiA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12F2FC19425;
	Fri, 24 Apr 2026 10:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777027583;
	bh=YOuVShcZmgP5QzkQeSusRIbMHW9dhDFha6DgR3S/6BU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=pJ79BeiA8R/RgFPZNgGorI5cDahWT1OpueWqrz0HVDSaENXVL7ckUkX6ic1BPGKw+
	 T/VkdMMPT0sr7zHirn+SJFt3uxLEdzZ9dIkXHA2ph1pYqoKG6kevqbLZpwP96xtxZU
	 ew3O0rJUAST3L8fOzqiDzSAnPQ88/uWlegB/HWQXH0ff+VgR80lAg2Wq+zkrnKXYEk
	 vr+fs0NciILZG2uA+OOB97OhM/CiY5kCA9lbYAm/xbwy342IFc7eNcr3mJaICqiJ16
	 3Ey5p1c+24qngv/JFjWxJBb17NL+sG9By5VsVeFbJyM+mUk44/A9WV6aan9g5kTU+f
	 l1aWrmYezABkw==
Date: Fri, 24 Apr 2026 05:46:21 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-1-4b6e09d532ce@linaro.org>
References: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
 <20260424-topic-sm8x50-tie-gcc-to-cx-v1-1-4b6e09d532ce@linaro.org>
Message-Id: <177702757892.3344991.886983197619217917.robh@kernel.org>
Subject: Re: [PATCH 1/6] dt-bindings: clock: qcom: gcc-sm8450: Add missing
 power-domains property


On Fri, 24 Apr 2026 11:07:55 +0200, Neil Armstrong wrote:
> In order for the GCC votes on the GDSCs it provides to be propagated
> to CX, CX needs to be declared as power domain of the GCC.
> 
> Document the missing power-domains property to that purpose.
> 
> Fixes: 72a0ca203ca7 ("dt-bindings: clock: Add SM8450 GCC clock bindings")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.example.dtb: clock-controller@100000 (qcom,gcc-sm8450): 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sm8450.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260424-topic-sm8x50-tie-gcc-to-cx-v1-1-4b6e09d532ce@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

