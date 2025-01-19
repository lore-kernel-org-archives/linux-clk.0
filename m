Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BC01D31B8;
	Sun, 19 Jan 2025 11:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737287597; cv=none; b=E4vR5gxqKpTBum4a7BkyxHYJGPy8LaTZyHElvfuVbiGnlU7MUC0KH1mMihL2efpSH55mFyt23GzNCXNtB1Pta4PuOwPymVybz5i1Fl1d+mMtIqVD37IUTLAzqNpDsN9++9j+7H/sZmr30zhRBEiMSlzmGcJ9OFVEzy4fPAc/2LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737287597; c=relaxed/simple;
	bh=Zx4a2qQW1UeVBYcKt9q9PDOT61DOQhC8/R1m4Dt6iQQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=qlNRzQldFCrMDW/l387j8udJXEPmwTU26lQcM6qAJ/a5cgxtjlTKgRnzr99EMnwj23Pz5a7l85FizPuk1W17PXKVqX1hptjNuCdSl3HlaTzbxTsH5km8QZf2Pue+vG53K/DLt0eSpmFtSH2FfHKipfruabLct8sE8+ec0Iv6mXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oSB7F38P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oSB7F38P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25237C4CED6;
	Sun, 19 Jan 2025 11:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737287596;
	bh=Zx4a2qQW1UeVBYcKt9q9PDOT61DOQhC8/R1m4Dt6iQQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=oSB7F38PlhZgv85QBNj9JHn74HXTvpfflGU90wuWTJUzaRNnTrxE+MrqeBXQwOI3X
	 VU77Qo4DYJBAvQqOaODchqifc4KWZPDtDhBzF1B+VZw+zgEvPrQJcCHzZCebwjDzjW
	 ch+IBZaSKKovZbkdN3/SURNI7qlveew5YD5alq+J/MRYbr5R74ZHcJAxNDkKb5g1cM
	 SUh8c2A2f1pNj+Uw2h2Ms6j3RE7fKyxVpWZokwQIsna+u7wC4JGQ4lA0ePaREZClRc
	 VU36dnzfpLVKrPOdgpy61Tpt2mXePCgpaOm1egQJb3bC6cl5ym/eIOruHy6/oXFkiz
	 14TcwGsrbZs1w==
Date: Sun, 19 Jan 2025 05:53:15 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>, 
 Ajit Pandey <quic_ajipan@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Imran Shaik <quic_imrashai@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <20250119-qcs615-mm-v4-clockcontroller-v4-6-5d1bdb5a140c@quicinc.com>
References: <20250119-qcs615-mm-v4-clockcontroller-v4-0-5d1bdb5a140c@quicinc.com>
 <20250119-qcs615-mm-v4-clockcontroller-v4-6-5d1bdb5a140c@quicinc.com>
Message-Id: <173728745662.810613.14087437002250228892.robh@kernel.org>
Subject: Re: [PATCH v4 06/10] dt-bindings: clock: Add Qualcomm QCS615
 Graphics clock controller


On Sun, 19 Jan 2025 15:53:00 +0530, Taniya Das wrote:
> Add DT bindings for the Graphics clock on QCS615 platforms. Add the
> relevant DT include definitions as well.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  .../bindings/clock/qcom,qcs615-gpucc.yaml          | 66 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,qcs615-gpucc.h      | 39 +++++++++++++
>  2 files changed, 105 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250119-qcs615-mm-v4-clockcontroller-v4-6-5d1bdb5a140c@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

