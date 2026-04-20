Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538612D738A;
	Mon, 20 Apr 2026 09:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776675843; cv=none; b=rM95GaEWOVIqcHPDFTbiCtlGvnpD+4/mSyF6VBdbTmST//7j8rCI4ZAuPA9uOKQD2yQ+/hs1pBhd/b/GMrvFm2okXOicy7qVu0m9NjbOVpiz/tg/sLk8ww7dF1xSmcUn7yxdLEn6EubFcZSzv0ZHB7ibZuiTSCxmpIozAVRD8As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776675843; c=relaxed/simple;
	bh=zK5g1EeyPVdyoo1yUkq1PWW7is8crU0xFWfy1utuYaY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Q5Ce7nJqiNxqKVUN9/k2Z4EbnmDQ0wFJUM4ITktkdLdGItHt1ejP3ql6HwcB4/j3o/MqCa9oFJxjCZSdK6goH1itw+5Go35kNENNwGzYgRHSZ3EEag6svsrLjdMiT/y0CSaKEYvQh7ocpFb825nCPRWiFL5R4nl7mZ2BTlwLOOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CCpOV/MK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CCpOV/MK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4AEC19425;
	Mon, 20 Apr 2026 09:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776675842;
	bh=zK5g1EeyPVdyoo1yUkq1PWW7is8crU0xFWfy1utuYaY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=CCpOV/MK5zpY73t+UN08CzC+fNl7cPbILPu4BqLuhx6mPc21ulLXqepeG076YSCVv
	 GY1r6zGBEldbtCNocqOx2nwXex/5AI+Rd582O2WB46b+qQIC3ZpIx31p8tjZo7PAx4
	 krwiYxoq9MaYS/4qbYLAzPbuz6i2MmbIps5hWXF8fw6JXFIpBEsycQFzd5i+RMCAcd
	 hcuJbpvq6m+p4JDrpImA8U8Fsx/KleKXgS/GDqzB8ahtmfvm7cVK4MukC9baIJSBu/
	 0H6XkHfvIlifjelKw3ph0sJITPnuRxioynU23TpeGgD+CEQSDELa2q/U8S8sD9jb6s
	 GucwGTOm80y2A==
Date: Mon, 20 Apr 2026 04:03:58 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
In-Reply-To: <20260420-vote_qref_in_tcsrcc-v2-1-589a23ae640a@oss.qualcomm.com>
References: <20260420-vote_qref_in_tcsrcc-v2-0-589a23ae640a@oss.qualcomm.com>
 <20260420-vote_qref_in_tcsrcc-v2-1-589a23ae640a@oss.qualcomm.com>
Message-Id: <177667583832.1359985.10364830499161105694.robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: qcom: Add QREF regulator
 supplies for glymur


On Mon, 20 Apr 2026 00:42:52 -0700, Qiang Yu wrote:
> Add regulator supply properties for the Glymur TCSR QREF/REFGEN blocks
> required by clkref clocks.
> 
> The vdda-qreftx*, vdda-qrefrpt*, and vdda-qrefrx* supplies map to common
> QREF TX/RPT/RX components, while SoC-specific topology and instance count
> differ. Document them here for qcom,glymur-tcsr.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8550-tcsr.yaml           | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml: allOf:0: 'then' is a dependency of 'if'
	hint: Keywords must be a subset of known json-schema keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml: allOf:0: 'then' is a dependency of 'else'
	hint: Keywords must be a subset of known json-schema keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260420-vote_qref_in_tcsrcc-v2-1-589a23ae640a@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

