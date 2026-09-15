Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D8B3DD847;
	Tue, 15 Sep 2026 17:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494226; cv=none; b=YpWKExDA9R3sFsxhXsqEAMopjZ7oq5Y5jdtkJWH/68fAyOvKJSX6teX/gZwKnCJNjo9DgxNuAr2Qbsskh09Pw1Uiejkw3Nqmq9HPl6kiziF3b3Zeq/BvKGmfX0ut2pSq0baFlwo9bK0Ddsg7a6cxSTqWAr2IjEGPmqjhon/Y1QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494226; c=relaxed/simple;
	bh=V/pMevqDsnSyq7kKT1fgYKiIFmj/TAi5W3rRgizpJ0M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KyLeHLKhlLxCGQxFBBqf4KQbIbEQTuiB3mUIPLJdqY+Sh64X6dbOC0n7dudoEa+5aKFSHok6lLvNUZxvrzYj7AJPTL/Duvqyn0ITU8s3Q0NvdNMrPc2YLr1MTJHXh7/lrLdsEpfrlw2l4IV5lxolpMCaBw4e/ROc/KtJJbWDo38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lJA529o/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lJA529o/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F91D1F000FF;
	Tue, 15 Sep 2026 17:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789494222;
	bh=quLaTpfoVh+o3A1499B4OtcPA+kCIsSwTE51XqLLfa8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lJA529o/LlyT9BYnPxp+LSxmkMu0IQhXoal3d1RE3AukE4UYLZOgC4f/wgvzl6jPY
	 IUjIr4KA98O+lxMwj284icI6jiIV0d2vlgecmttHJdamoaipFmC38RcZ/Csaj7ZwZ6
	 bg60S1J8QTMMIqDecws53WohajlMgawQXF74vQantee2F5NIaTQYkvVo7kWzMpEyIN
	 jigFhKKTxvAhKAFFS7f/WUfCLfZFBdEYLXHGzDeWKxI9SZ/8D5BLMQUBDcSUSTNs9t
	 2B2CDJ9RjQDFD5gFwZD1+vKEDyzpQ5tWLwIUSaZ857WV6mNbtKsqRZST5NWwBADYkf
	 p3KS49EIuQJZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: qcom: Add Hawi CAMCC
 compatible strings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vivek Aknurwar" <vivek.aknurwar@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260915-camcc-hawi-v3-1-5b57f45477f1@oss.qualcomm.com>
References: <20260915-camcc-hawi-v3-0-5b57f45477f1@oss.qualcomm.com>
 <20260915-camcc-hawi-v3-1-5b57f45477f1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 17:43:41 +0000
Message-Id: <20260915174342.3F91D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: undocumented interconnects requirement for Hawi
- [Medium] dt-bindings: incorrect commit message claim about ICP instances
--

commit cd229f4ac046e3883d582722f42537a831b1a1f1
Author: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>

dt-bindings: clock: qcom: Add Hawi CAMCC compatible strings

This commit adds the qcom,hawi-camcc and qcom,hawi-cambistmclkcc compatible
strings for the Hawi SoC. It also introduces the corresponding clock ID hea=
der
with definitions for the updated camera clock controller.

>     The Hawi SoC is a derivative of Kaanapali  with an updated camera
>     clock controller (CAMCC). While the overall block structure is
>     similar, Hawi's CAMCC differs from Kaanapali in the following ways:
>    =20
>       - Uses Taycan EHA-T PLLs instead of Taycan EKO-T PLLs, with an
>         additional ninth PLL (PLL8)
>       - Adds a SQPF block with its own GDSC, AHB clock, and BCR reset
>       - Adds a CX GDSC (CAM_CC_TITAN_TOP_CX_GDSC) for the camera subsystem
>       - Expands ICP from one to two instances (ICP_0 and ICP_1)

[Severity: Medium]
Is this description accurate regarding the ICP instances? The commit
message claims that Hawi differs from Kaanapali by expanding from one
to two instances, but looking at include/dt-bindings/clock/qcom,kaanapali-c=
amcc.h,
Kaanapali already defines clock IDs for both ICP_0 and ICP_1.

Could the commit message be updated to reflect the actual differences?

> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.ya=
ml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> index f653807472201..e2a126925e9d5 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml

[ ... ]

> @@ -80,12 +91,22 @@ allOf:
>      then:
>        required:
>          - required-opps
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,hawi-camcc
> +    then:
> +      required:
> +        - interconnects

[Severity: Medium]
Is there a missing explanation in the commit message for this new
requirement? The schema conditionally enforces the interconnects property
for the new qcom,hawi-camcc variant here in allOf, but the commit message
does not mention that interconnects are now mandatory for this hardware.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-camcc-hawi=
-v3-0-5b57f45477f1@oss.qualcomm.com?part=3D1
