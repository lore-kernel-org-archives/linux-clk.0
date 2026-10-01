Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC73537756B;
	Thu,  1 Oct 2026 00:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790815236; cv=none; b=hg2jJmsT5WX+cVYMqPphCbXMYC7pOezRVCnbbF4iKaWyJ0ZRry1QBkYVaUtievmjIgZcK0V5pCwHrPlmkXCUhSGRE7yxwmdqRzSkelxZxC5wdPbXkfTapWaQ7aNoGpZMpIn3Qrr7Ls3LsT55JwPd2NV0vOSk0f2A2RETeUY7FhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790815236; c=relaxed/simple;
	bh=UI9BLBTThba/tbipQa2Pd4i365kNErFb2j0bR+1KJHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BwCUGuJAWB3LG9XZmjxGf9V1hRwtYcnYhmZZMf83tsKpiitBMF5heEKi1CZO4BIoNHAPGOBFSworoNOmum3u7TfZAiZNgV9Nj7vr6t6ipPXHKiIQX5OFBN9mPdYxYKhNviwA7PaBLYvpS66ehb0WrXSNwdfVc5ZQa6urTFxxijE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jl6bcv+M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jl6bcv+M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8501B1F000FF;
	Thu,  1 Oct 2026 00:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790815231;
	bh=fGIgfHHyq+/K2lVOR8B8BSXPb5iv0tNgGC8KPp0J+Rw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jl6bcv+MS+vKEci9m+7ZjgmLmmXrz56RooqDFDnUXXY5gsoy0sAkrVS2WcfyXX0pA
	 rnXoRUwxrm6OCDUz3tIJGnmyyx3HPa31AfKH75V1GYpEaJl5ADVA2HAYYqbLfUPmcg
	 Q9tqkSeWmAlNCqmax9+XHbRh6BIrPXVpMb19sa2YH4LT57n9RVNnYmt5xAXD+xLxF7
	 +QpFdrKQVGUSilRHXvlVY129IcC3vQSgvYBal8zHEP5SitOCzOQhPbAGf99ELCX2M3
	 OM/8IPVY8g+ptMzP6wT6aEDTqXGVHpt405DEJqtAA/Z34WW3a2lbBOEt7g3jFo194p
	 ZzsaWRMH2Uh6A==
Date: Wed, 30 Sep 2026 19:40:17 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Tengfei Fan <tengfei.fan@oss.qualcomm.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 00/42] clk: qcom: Tie CX power domains to GCCs
Message-ID: <ar2n-yjFdOwmK_wz@zenbook>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
 <179035461215.1296652.13047689320991053383.b4-ty@b4>
 <CAL_JsqKVYyMR=_+eJ3YO-7yj_sFKx3hknNxdm3_5yYJmGMwbyA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqKVYyMR=_+eJ3YO-7yj_sFKx3hknNxdm3_5yYJmGMwbyA@mail.gmail.com>

On Tue, Sep 29, 2026 at 04:50:53PM -0500, Rob Herring wrote:
> On Fri, Sep 25, 2026 at 11:43 AM Bjorn Andersson <andersson@kernel.org> wrote:
> >
> >
> > On Thu, 24 Sep 2026 13:39:16 +0300, Abel Vesa wrote:
> > > Tie the CX power domain to GCC clock controllers for SDM670,
> > > SM8150, SM8250, SM8350, SM8450, SM8550, SM8650, SM8750, SM6350,
> > > SM4450, QCS8300, SDX75, SAR2130P, SC7180, SC7280, SA8775P,
> > > X1E80100, Eliza, Kaanapali, and QCS615.
> > >
> > > Enable runtime PM for GCC providers without critical clocks, allowing CX to
> > > power down when their consumers release clocks and GDSCs.
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [01/42] dt-bindings: clock: qcom: gcc-sdm845: Require CX power domain
> >         commit: 55388f587b3301dffdb30074d00f069d80d29341
> > [02/42] dt-bindings: clock: qcom: gcc-sm8150: Add CX power domain
> >         commit: 80d35f528a46b5f1e9777ce83de48fd9efa7c422
> > [03/42] dt-bindings: clock: qcom: gcc-sm8250: Add CX power domain
> >         commit: 98e936c9d46a25b4eceacf907fe5d87b3999040e
> > [04/42] dt-bindings: clock: qcom: gcc-sm8350: Add CX power domain
> >         commit: 534af057998b59a4813fd2eba524f2f523f356d6
> > [05/42] dt-bindings: clock: qcom: gcc-sm8450: Add CX power domain
> >         commit: 4de0860a340888fd2582681facbceda71b375617
> > [06/42] dt-bindings: clock: qcom: qcs615-gcc: Add CX power domain
> >         commit: 779dd957c4c8a7d7d0fd8ac03caa27fe6db23514
> > [07/42] dt-bindings: clock: qcom: sm8550-gcc: Add CX power domain
> >         commit: 5a577a480dd3d764cc2f55a112efc92d59ad59ec
> > [08/42] dt-bindings: clock: qcom: sm8650-gcc: Add CX power domain
> >         commit: 76615e10462c425f926e50dce52e9d23bb2f9428
> > [09/42] dt-bindings: clock: qcom: sm8750-gcc: Add CX power domain
> >         commit: f9c74b6ed57922b1fdb1ed6835665e06b5ba01a5
> > [10/42] dt-bindings: clock: qcom: sm4450-gcc: Add CX power domain
> >         commit: df3faa0e74e433304f9a6f33d3ac4d3376fcdc06
> > [11/42] dt-bindings: clock: qcom: gcc-sm6350: Add CX power domain
> >         commit: 3d4f3414300bba79d517585ac10181e285ca6be3
> > [12/42] dt-bindings: clock: qcom: qcs8300-gcc: Add CX power domain
> >         commit: fcf1810fede27777f9b708a9cef431bcac1d8e38
> > [13/42] dt-bindings: clock: qcom: sdx75-gcc: Add CX power domain
> >         commit: 6df1fd0bfa649c0f13abd026a01dbed5f1727fea
> > [14/42] clk: qcom: gcc-eliza: Tie the CX power domain to controller
> >         commit: 4eb8f2ad36888e5b29aa0a5e7e0bc60e382312ea
> > [15/42] clk: qcom: gcc-kaanapali: Tie the CX power domain to controller
> >         commit: 18c75784e4a9db5ed8cf6818a29ec0ac15ea2c8b
> > [16/42] clk: qcom: gcc-qcs8300: Tie the CX power domain to controller
> >         commit: 2d948e428c77b8764fe96537c70e5500b29f9c4e
> > [17/42] clk: qcom: gcc-sa8775p: Tie the CX power domain to controller
> >         commit: eed0a644a28a39d9da91a10d51b8f3247302a533
> > [18/42] clk: qcom: gcc-sar2130p: Tie the CX power domain to controller
> >         commit: 40537977a0ff9a6a1bcc489863e5656914b1ac53
> > [19/42] clk: qcom: gcc-sc7280: Tie the CX power domain to controller
> >         commit: 503de100eb2823519b82d759ead69ee377289a9e
> > [20/42] clk: qcom: gcc-sdx75: Tie the CX power domain to controller
> >         commit: 563b9aceb53ea15f2ada9417809d1d9e9a2c1fd1
> > [21/42] clk: qcom: gcc-sm4450: Tie the CX power domain to controller
> >         commit: 9965e30e827665e2fc9f0b3271733feaee809d48
> > [22/42] clk: qcom: gcc-sm8350: Tie the CX power domain to controller
> >         commit: 4572e9c0c4d48447d22a25037cbd2fbfda74a8c2
> > [23/42] clk: qcom: gcc-sm8450: Tie the CX power domain to controller
> >         commit: 6742c3ce04e5d52f718e4b562d0a1d817e1d76db
> > [24/42] clk: qcom: gcc-sm8550: Tie the CX power domain to controller
> >         commit: fe2a50974f4a0c78a68931f156d99e0479a4f00a
> > [25/42] clk: qcom: gcc-sm8650: Tie the CX power domain to controller
> >         commit: e4e6177235c6e0342357c48497d6b1a546c0ae57
> > [26/42] clk: qcom: gcc-sm8750: Tie the CX power domain to controller
> >         commit: f593d28a9193f1b5a96eb69bc5eb4dda2eaebebf
> > [27/42] clk: qcom: gcc-x1e80100: Tie the CX power domain to controller
> >         commit: 965dd2be7d35b2474251ee60d44addb257c9c85f
> 
> Pretty sure this has introduced a bunch of warnings for qcom. Where's
> the .dts changes?
> 

My bad. I test every dts change against the current bindings in
linux-next, but not the other way around - so I failed to spot the
introduced warnings.

> We've really got to stop merging binding changes that introduce
> warnings to existing .dts files.
> 

Warnings we can fix, the possible regressions in backwards compatibility
is a bigger concern to me. So that's another pass I need to figure out
how to incorporate in my workflow.

Regards,
Bjorn

>      14 clock-controller@100000 (qcom,sm8550-gcc): 'power-domains' is
> a required property
>      12 syscon@9a10000 (syscon): compatible: ['syscon'] is too short
>      11 clock-controller@100000 (qcom,gcc-sm8250): 'power-domains' is
> a required property
>       9 clock-controller@100000 (qcom,qcs8300-gcc): 'power-domains' is
> a required property
>       8 clock-controller@100000 (qcom,sm8650-gcc): 'power-domains' is
> a required property
>       8 clock-controller@100000 (qcom,qcs615-gcc): 'power-domains' is
> a required property
>       6 clock-controller@100000 (qcom,gcc-sm8150): 'power-domains' is
> a required property
>       5 clock-controller@100000 (qcom,gcc-sm8450): 'power-domains' is
> a required property
>       5 clock-controller@100000 (qcom,gcc-sm8350): 'power-domains' is
> a required property
>       2 clock-controller@100000 (qcom,sm8750-gcc): 'power-domains' is
> a required property
>       2 clock-controller@100000 (qcom,kaanapali-gcc): 'power-domains'
> is a required property
>       2 clock-controller@100000 (qcom,gcc-sm6350): 'power-domains' is
> a required property
>       2 clock-controller@100000 (qcom,gcc-sdm670): 'power-domains' is
> a required property
>       1 clock-controller@80000 (qcom,sdx75-gcc): 'power-domains' is a
> required property
>       1 clock-controller@100000 (qcom,sm4450-gcc): 'power-domains' is
> a required property
> 
> 
> Rob
