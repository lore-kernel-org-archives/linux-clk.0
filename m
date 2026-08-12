Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAE4431A5F;
	Wed, 12 Aug 2026 11:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786533650; cv=none; b=N4U6G3tfuzrRB//lNPdCvdMPvz58jXtiwqZfizRMEV6aXx/o0JgqGxquV2BUgfRt6WznBIyi6QbcgcL/gPaKqHMh8BgN70UfV+9lMUMjW9Fs38OvMEbA/hCPcbVRDkNbLeIvWuUIWrBrJCh2BDaBMUlIWNq0cs8+g/42e8eCwso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786533650; c=relaxed/simple;
	bh=osjAbjck9xKkGAVqdjvlkRbQUNyEG60MBPxhRhfKDhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=raIH+W78NqJu1qWRjgQN5PHtVM8VevQh/8Q7WjHo88p0E/Hd7u+86coDA5R3uC6nKH4GCiu17wQgFF/7QHyXM8/Cax/QCHmj0GhJVGyNjLp3I/GWmFCjkpq243apPRVaWR4dhgVJZRomLJ7Oc/ahexFS5NN5f5IZcozrQ1yxlQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N8KSIGB1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N8KSIGB1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9306D1F00A3A;
	Wed, 12 Aug 2026 11:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786533648;
	bh=aSPMEmkqkiLtDpHYkBzQLRE7Y9hrOPWdzQr7bSAfc34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N8KSIGB1g5B7KierzuMaJvKkLBHsC8mzyW04DC6pJSMULps3Vx7TCF7bFMFih7nnh
	 c4AgWGatmDYGUD7n6t0DaRbkcrn/h5SS79RtWfVEH5V+j/OSG85PfJnBpAQp7AG57m
	 l7hNCizORgAsme7dMpxC88O8+nCKXCzEL1pk9OUwJHF9HbEWwZ+8mPChXbOVZJvQ/M
	 iKm6SHFYEjbQ/MAvbzx0iR0SH7apInAkkxkZJK1HnCFETY0eNauAVy/370uBoRVBmx
	 KwjNQQUkFK8eCjPIE6RMHXfDgEkk+XL6cBH+GslLrjjfyVVTMjgla1elgvyWxOq10s
	 LVxzzU+AcmOCQ==
Date: Wed, 12 Aug 2026 13:20:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: qcom: Move x1e80100 TCSR to
 own binding
Message-ID: <20260812-lively-determined-loon-31f65e@quoll>
References: <20260812-hamoa_tcsr_qref_0812-v3-0-dc7627169c6d@oss.qualcomm.com>
 <20260812-hamoa_tcsr_qref_0812-v3-1-dc7627169c6d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260812-hamoa_tcsr_qref_0812-v3-1-dc7627169c6d@oss.qualcomm.com>

On Wed, Aug 12, 2026 at 12:27:31AM -0700, Qiang Yu wrote:
> +  clocks:
> +    items:
> +      - description: TCXO pad clock
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +  vdda-qrefrpt0-0p9-supply: true
> +  vdda-qrefrpt1-0p9-supply: true
> +  vdda-qrefrpt2-0p9-supply: true
> +  vdda-qrefrpt3-0p9-supply: true
> +  vdda-qrefrpt4-0p9-supply: true
> +  vdda-qrefrx0-0p9-supply: true
> +  vdda-qrefrx1-0p9-supply: true
> +  vdda-qrefrx2-0p9-supply: true
> +  vdda-qrefrx3-0p9-supply: true
> +  vdda-qrefrx4-0p9-supply: true
> +  vdda-qreftx0-0p9-supply: true
> +  vdda-qreftx0-1p2-supply: true
> +  vdda-qreftx1-0p9-supply: true
> +  vdda-qreftx1-1p2-supply: true
> +  vdda-refgen0-0p9-supply: true
> +  vdda-refgen0-1p2-supply: true
> +  vdda-refgen2-0p9-supply: true
> +  vdda-refgen2-1p2-supply: true
> +
> +required:
> +  - compatible
> +  - clocks
> +  - '#clock-cells'
> +  - '#reset-cells'

This is unexplained ABI change. When you are asked, you need to address
feedback from LLM, not blindly implement it without checking its
validity.


Best regards,
Krzysztof

