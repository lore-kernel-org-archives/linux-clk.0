Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F693655EA;
	Fri,  3 Jul 2026 06:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783059257; cv=none; b=mwQBE/hsawRRgLC4GqcqmUftLRVWVjIuwV5o6QyIlP97DXS/YbFwKAffhvxlp3+1Gix2ozdi7n7YO0txz5VBr/ab98abz0MBB+kAZssHYMotJOm8cgqIvUX7r0J+MEj4rCmnQtNMCTNYJ6/uN6YRZv6rIm8MnKjjd3twUYmD8+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783059257; c=relaxed/simple;
	bh=a2VcCO3oUvscKIDBtlEloX9B1sE6ZlpBQRwILBys3pc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=StAnTcomJ08Gl+7MNArjyJWDP+1vR1xfsfbTKs2/lF7Dvx0HRAfP/GrnLyYu2uQ2/0SRv1VanRPS5JcL/ebqnvjJi/mSeZPzluPmWLN2AgAecoKfMphk4FPoJ+3AWiqIutPqfLK96YN/5KzePgltH09y6A0sgEFm0W7djDRQTsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CNbNOAgh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CNbNOAgh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 539C51F000E9;
	Fri,  3 Jul 2026 06:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783059256;
	bh=VOX0U2mpJEbyBdITfG0rH6yM2uaLKI2XtCjYU58qDKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CNbNOAghNsHGNmKdWiRvyAGBzeAI5ZloVCsrtTg/IWHPDjt50ObKU5IQ0R0T/6HfN
	 fhkEwI5o9W8S3uLshVbaME9GE18GjFfxpbMsKNmFw4aisecHuEJV3IfOrHACdFTRZw
	 4kracsUT/WKMpiOuWBBsHgj6P1Yw6xp99CdVy1wULGjrPdy7HRus0Mhs7Q7BiafGc2
	 ETSk713si21/X4ishoxLsdlL4ZD74uV8mt1a9LFAjFte6+tA5JEg78df3IM4ZTxk9T
	 mkFf6MmA4W5liMua0EuS8d9as2Tl+E4VeVcisr8H9OGBbSjJ1U/pfhXqwPPZ18Q1gx
	 3PGlpY38Cy3jg==
Date: Fri, 3 Jul 2026 08:14:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 04/19] dt-bindings: clock: qcom: Add Qualcomm Shikra
 Display clock controller
Message-ID: <20260703-rapid-junglefowl-of-foundation-ed029c@quoll>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-4-cc13826d4d5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-4-cc13826d4d5a@oss.qualcomm.com>

On Fri, Jul 03, 2026 at 12:01:26AM +0530, Imran Shaik wrote:
> The Qualcomm Shikra Display clock controller has clocks same as QCM2290.
> Hence, add support to use the QCM2290 DISPCC compatible as fallback for
> Shikra DISPCC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

