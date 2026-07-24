Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BCD25B0B3;
	Fri, 24 Jul 2026 06:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784874524; cv=none; b=jHWV+JSn9Ial8SWvgUCI1wXXAJ/vdnIjyz53nEd8vb8OWpL9XQsoSfD4MdBzk+gBbSy2BLpS3yToePCYVL+VcTDDl9nDejOAkUFxEBpzc5DeF6UwwQ9/pxd+nn5vJFp8RZGufGsqnPdX4Ez12dc23CwLe7Cbbdz4aqLd21zIQYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784874524; c=relaxed/simple;
	bh=Go8Pa2E+JNnUEGzdq0woJHYzglx7h2NETf1m8nIkZyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rx5TruS3loPHXSUqBBG+Uw/tpwcF6Eiya+7TPZVvUxnUzDhnZG2C+iTifBcCA1JEVFWkcLLOxKpFCVzZ12TYbjuZoabBjANhHHibhICr/Grte23qPLcfKUiletgH4Wx/EfToHnitw0psjCR2I/JyMMki2Ck2B4VLTw77qt+eLnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=otlKA78/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="otlKA78/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A213C1F000E9;
	Fri, 24 Jul 2026 06:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784874522;
	bh=vuHVIMiIM3v1C+LeOUFO3QzSxW1g6m/A76vGgk2pJ78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=otlKA78/hvhUXS0ARvP7ZrDjb2IzG38HkHP9Bfj9zb2HpyFvx4qrYhbBdVSmwQ0po
	 RTgh4Wwg5tSaRtMa2SvN1QdlrFEN1KbMoa6+6NdkVbX4sLgwlKV5KN+8KBUUkndkTz
	 11j7Ot4unBrBjvVyug+6fQVz1WXrvCGNCpF1XleXCLS5L577PhWpaUaiu+6GbgI/v8
	 tCFkCCxBp6lFnfckL/0RAWqUyZ6QucauUighpxFO/zpuoLqvl8QEFvhU68Dhgl0rsM
	 BOUqyhCQehd/Kc1/6XhMCK3Do2cE/V6zgf19c3SrnF7Fz0zJQRdIGpWmMDy9crIBSE
	 VmkyjITqcpi2Q==
Date: Fri, 24 Jul 2026 08:28:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, prasad.kumpatla@oss.qualcomm.com, 
	konrad.dybcio@oss.qualcomm.com
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: qcom: Add LPASS VA CSR
 HeartBeat pulse clock
Message-ID: <20260724-manipulative-functional-pelican-4d0ddf@quoll>
References: <20260723-master-v3-0-3d67b79b0515@oss.qualcomm.com>
 <20260723-master-v3-1-3d67b79b0515@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260723-master-v3-1-3d67b79b0515@oss.qualcomm.com>

On Thu, Jul 23, 2026 at 04:40:40PM +0530, Sarath Ganapathiraju wrote:
> Add a binding for the Qualcomm LPASS VA CSR rate generator node that
> exposes the lpass_heartbeat_pulse clock on hawi.
> 
> The HeartBeat Pulse (also known as RateGen Pulse) synchronizes the
> start of the DMAs and Codec Interfaces for the audio usecase and can
> serve as a periodic wakeup source for the DSP.
> 
> Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,lpass-va-csr.yaml          | 49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,lpass-va-csr.yaml b/Documentation/devicetree/bindings/clock/qcom,lpass-va-csr.yaml

Use compatible as filename, so qcom,hawi-lpass-va-csr.yaml.

With this fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

