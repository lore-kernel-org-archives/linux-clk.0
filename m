Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C0D3AE184;
	Thu, 23 Jul 2026 07:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784793339; cv=none; b=EkteAHcvH4TFCpf1l0jV/kn7xpEdtSMPCn7+xRB1PgrA4L0Z3sX2iT11tt06O6fWkz4ZBJppKuGFDdGAgKV5c+Y2Zb0WskTt6JeTTfCuvdt0vIkvtLIg/JHs/mWeUnxc02gDLOQvbokj1Z3PLLwKIk6UnVROYvd0tdS+/DUAxCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784793339; c=relaxed/simple;
	bh=8eKF+lMx+3qFtmPRuwl82XZ2l7CjwC56bWJYkQNBObk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S/P/+QIfxFGUld7MGe/35eqx0BkCBk+vVhYMV60+q1HZsGZLoMwHUkxY6ZWrFA4pTnZZobQAwfY1Lbt3C8i2+4AfVJ0Hk/tb+gS6ISeDIqVyZXVSQtBW3HAz5davPOBWgwydIY6uq27gvlRhsUuYvsnoqhasCcRDMLDiufcuAqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b7faeDj0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b7faeDj0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8767D1F000E9;
	Thu, 23 Jul 2026 07:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784793337;
	bh=Xdl/leOEwibG9DqZa1srsr/cuTkLiS1oR/HiWu5VqaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b7faeDj0/ye+cGSNPrfG96wziUUb15X2fc8R1vUVOlhvnpc0u28itALVU2osU4QaG
	 W5snpiVZWyhGuzI2KbOXNlFIAlSWBLCgYXLyGM2oCgPjZ70i11IerQPKqVcz3hcJNa
	 Wvss/c8aCUW5f3KA0rRr+8gKIlGDEyVfTwMhqXiQSHlJEoJZrFoHpY3O6KipDslj6m
	 BMcN73cWNMZwfG9uda/q8KAkdtW3o2sBAGqlKpq/LMS0YaeNjyKefaNqh5TsNXyz5Z
	 +5lXV2UzrU+eJyoLuLC3cGGZE07NOlNseEowtfHrHGpJeqYz8Kn0/1Wu9KFNKtO1Ii
	 s1AwaP8vu4a9w==
Date: Thu, 23 Jul 2026 09:55:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/6] dt-bindings: clock: qcom: Document Nord GPU clock
 controllers
Message-ID: <20260723-enlightened-wooden-partridge-c938c3@quoll>
References: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
 <20260721-nords_mm_v1-v2-5-17e5a445a512@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260721-nords_mm_v1-v2-5-17e5a445a512@oss.qualcomm.com>

On Tue, Jul 21, 2026 at 12:37:20PM +0530, Taniya Das wrote:
> Add Device Tree binding documentation for the GPU clock controllers
> on the Qualcomm Nord platform.
> 
> The platform includes two GPU clock controller instances, GPUCC and
> GPUCC2. Document the compatible strings for both controllers.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8450-gpucc.yaml          |  3 ++
>  include/dt-bindings/clock/qcom,nord-gpu2cc.h       | 47 +++++++++++++++++++++
>  include/dt-bindings/clock/qcom,nord-gpucc.h        | 48 ++++++++++++++++++++++
>  3 files changed, 98 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
> index fdbdf605ee695637512ce4f98c9b6fcfacb9154f..ba85692240e07a4ed8e69c6b61847c5601b32fa0 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
> @@ -18,6 +18,7 @@ description: |
>      include/dt-bindings/clock/qcom,glymur-gpucc.h
>      include/dt-bindings/clock/qcom,kaanapali-gpucc.h
>      include/dt-bindings/clock/qcom,milos-gpucc.h
> +    include/dt-bindings/clock/qcom,nord-gpucc.h

Mention here second header as well.

With this:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

