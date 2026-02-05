Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA35013790B;
	Thu,  5 Feb 2026 13:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770298367; cv=none; b=Vxc1bWmuy2JJ/M0XoBuzNLKNiJ6bIoEEnwFWWr8zB4tX+WrPLGoGlLGubx9xN9+uIT93LcDQj1b1fnepIj2IU6buRLdTamiW7nrWZFjRK0fHclTSi5SRpMv/NfadWWwEOqYQxvz+CH4KpFZqmaVZSr10rICIz6K6qdztG3ZeZTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770298367; c=relaxed/simple;
	bh=vMwXafTDLVuj3PD+OkThk1sQcnEpOlkVJDhCiSkNRc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dkVddWwHXcJ5O+NEblhqAyB2mNGIlzJ8UOkhKIBCVme7jbKrnn0Ml5pP7ly4OTX4oBfEgH0uqSKI2Naoih+/j6sD9C0ypWZKVZK8EUCH8+ObJdANrk+mvt8+h0XSDNCY4eMeVqBhDN1MB2u6xsTvT9jMVuoWcH7b1R/1Iafewus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQAop+Ax; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQAop+Ax"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9F90C4CEF7;
	Thu,  5 Feb 2026 13:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770298367;
	bh=vMwXafTDLVuj3PD+OkThk1sQcnEpOlkVJDhCiSkNRc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KQAop+AxDhHhjk2UY/LGk/3OKT2wCemaUJIBUKwrnMndp5iXwmQvMQLfnCxowOxbF
	 y5u1Uu0+il24SSUqwDDZg6xBFMXLLhz2QhcK4uWJSat0lvD73gaMRHyTM7qrjGfEqk
	 eNu4abXS29O2MXeOUBAnT1IL55H2lQ89rl28Ecva/UnRDiXz1CjlYlLdlSzuHbLTzC
	 mr6302++nczWAuszwFDFnRnyBkQR4tMPXtF5IUIWZKq+UNg5T9oSJ790qGT2FmXsIA
	 EbFCYu3Qn3j4xfcIkfpjhlhOPZ6C+dj3raKlF78wFOMYyfV+FZTjY0bFNHhS6e+D1U
	 YVTwllR0FzOAQ==
Date: Thu, 5 Feb 2026 14:32:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Imran Shaik <imran.shaik@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: clock: qcom: Add video clock
 controller on Glymur SoC
Message-ID: <20260205-dynamic-swinging-dalmatian-ac348f@quoll>
References: <20260202-glymur_videocc-v2-0-8f7d8b4d8edd@oss.qualcomm.com>
 <20260202-glymur_videocc-v2-2-8f7d8b4d8edd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260202-glymur_videocc-v2-2-8f7d8b4d8edd@oss.qualcomm.com>

On Mon, Feb 02, 2026 at 04:26:51PM +0530, Taniya Das wrote:
> Add compatible string for Glymur video clock controller and the bindings
> for Glymur Qualcomm SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8450-videocc.yaml        |  3 ++
>  include/dt-bindings/clock/qcom,glymur-videocc.h    | 45 ++++++++++++++++++++++
>  2 files changed, 48 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

