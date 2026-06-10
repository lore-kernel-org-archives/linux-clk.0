Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710E81A6814;
	Wed, 10 Jun 2026 06:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781072617; cv=none; b=KnqOi2/Scm7giSRcAzHE7iuSAlfpjX8jNOzfLqGgkXUC+q1Nf0IyYdBMLtoiVB+R+Y9hOnMtfPpbhuZooLYS82a1KS0GpDwZyfInIzIQ0lgECy5KwjLEtUrj49eSPsvHERKQ1MjZvf0hZFcIiK85Yvc4wyuTOpr/TuUnuc/BWH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781072617; c=relaxed/simple;
	bh=rFJSbHbDtoePohRS2EsLsjmHLP6vVMSmcHIITysF5r0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jv+IW5+d88v08txMhxS9+t66+vdStrKMtjYpr+Pg9Oxfv8szHjMuce1xqa1e3/X3+sa8ieFOQHHM8vakUVSY7ojlJV1sK3qmSYRaTVsczsjrChnwH3/2LkKLWz8moED9D2SJ1y2lKDDGAMi8/fvh+41tf5pv7UUkMtnTmustR54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IMTQiNER; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IMTQiNER"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17CBC1F00893;
	Wed, 10 Jun 2026 06:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781072616;
	bh=7pJCdmP/I1O9qQOYy3P6wkUiGVmzpOS2+Rao0WrGW64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IMTQiNERSJazYilIigjjFiYbyNChVIRknRAokvryq5rlvBubewjeD3JaSHn+6UQxN
	 UM9NOS+leh5PE1n1YNYL93aPK8iSU9m9SNeO8MunUBtPna3GrIpBLTNu4clPEKGxTT
	 cg0pPPk+9TKrWQ5nOw408qsJSzgtfpJf1HR0mMaUceQYe1IOdH1FEP+Et0hhSuLa/9
	 CnXaKcNAvdnTZNs27XPdO/+3VCRmOqKwaU0h0UYHFPM7YcMa0A98weK2Jtd0q7/GqO
	 6C1vGN9GI5ZtUyTqdUKkOFomXKK1ytB9mMvnYH58YnAH1gBlOBEvVFarNPfoPJFvw6
	 Sy93YFxIdW4tg==
Date: Wed, 10 Jun 2026 08:23:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 1/7] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
Message-ID: <20260610-lovely-bumblebee-of-fame-505a1c@quoll>
References: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
 <20260609-b4-eliza_mm_cc_v6-v6-1-17df09e5940c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609-b4-eliza_mm_cc_v6-v6-1-17df09e5940c@oss.qualcomm.com>

On Tue, Jun 09, 2026 at 08:32:52PM +0530, Taniya Das wrote:
> Eliza Video clock controller is on CX and MX rails similar to Milos.
> Add compatible string for Eliza video clock controller to the existing
> Milos videocc binding and add the dt-bindings header for Eliza.
> 
> The video clock controller exposes power domains, so '#power-domain-cells'
> must be present in the device node. Add it to the required properties list
> to enforce this in binding validation.
> 
> There is no ABI breakage and no impact to the existing devices, since the
> nodes using this binding already specify the '#power-domain-cells' property
> for videocc.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,milos-videocc.yaml         | 10 ++++--
>  include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
>  2 files changed, 45 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

