Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD7D36F8F9;
	Fri, 29 May 2026 17:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780076224; cv=none; b=D/+b62HCaVSU6y6NL4MrioVcDTsg0YB+t8+IpOW7G06D+8akLDB22MqEzIRLjxhPzXgUF9H4TJqAcGEmiV4dfQAUiFTS+yWORVTBuc/RCSB/Xa97lYgdNSKjyz1pPpVQLB+YuQ3T1ML7I84uV3TsrnRpIHMfKM1AlIvVhKGx5q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780076224; c=relaxed/simple;
	bh=93RFzScorvodA3t6mzDa4EOufCgnlS106vXRgKoHeFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FJd886rcc6yEiAWiuhhB64o4bQxvH/bJkpP94va0Seh6LomlcWSiL1FcnU7wm2u2f4KxxXc6UUb+tSJhFFpaqoPyBfTHA2m/oVWPrrAAIOIqSkFrkkRFQBwDIsbuXu8OjAZUC+Y24h5Xrhz17ndzm4p+JpUN7GAyqJ1mL6gnY8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XyPCHAU0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XyPCHAU0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9BD61F00893;
	Fri, 29 May 2026 17:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780076223;
	bh=Gkuk1hSYF7azCaKHz/S3pZc2XU3K06FzR8lRjatZQwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XyPCHAU055g5ZN7YMdDu61wHTj2INteS4tKl7VRuD1bN8aKrsNK9viwY5qoL9mtGk
	 L7u0p3sRKKV9oeaoVoQsrKwl+EbB76H7gaokCR4TMYIbJC0m7i6wCTJIvH7ydwPbjZ
	 WBMncnMKC03ne5NRA1Sz6MmtemeRvtrATJkZnVvCf7++zDWRFJdfJV5/dNZ18twMH+
	 frmdzmc4u9ey980lzvzqhgccf31Qj6TSaHn73ea885R++JKooTRvRTrOb2OBHcu3CF
	 IAdnjwa7U0P1q/n/5TgsVQsg5qodfYeEZjAZltiLu229k2mJWqTMR9aTtAWkFkxtu3
	 262jQgwYtbyiA==
Date: Fri, 29 May 2026 19:37:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Luca Weiss <luca.weiss@fairphone.com>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/7] dt-bindings: clock: qcom: document the Eliza GPU
 Clock Controller
Message-ID: <20260529-bipedal-notorious-macaque-a999f4@quoll>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
 <20260525-eliza_mm_cc_v2-v5-2-a1d125619a5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-2-a1d125619a5a@oss.qualcomm.com>

On Mon, May 25, 2026 at 04:16:04PM +0530, Taniya Das wrote:
> Add bindings documentation for the Eliza Graphics Clock Controller.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8450-gpucc.yaml          |  3 ++
>  include/dt-bindings/clock/qcom,eliza-gpucc.h       | 51 ++++++++++++++++++++++
>  2 files changed, 54 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

