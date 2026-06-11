Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686C827B353;
	Thu, 11 Jun 2026 08:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781166659; cv=none; b=uaWUvHei2MLKeP5HdPaqbD9FzY6GeUYdj3uB9BoRAgl+kkClZrndqex26tyRFaW4/rAUSnlzLPMQ+uX/6h/0gto79Zn0tvpGkYhHrKTI05OLdPr+VDxPUeWKoVdYsgX95FzMdsXpavX93iYTU0HoJnnwxr6vo9hsDySYbTLWSgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781166659; c=relaxed/simple;
	bh=CVhWDpxXEpv6IDDg1dDTYgqeimdnwUkacOL1+OUOWCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=raUsKRhPLR2wuyE9R5ucdtSYpCYpq9Ccyaqyu80cx1yCSG4D7vFQMZ0zdoNmxyRKjotv3AOl6s1u0MM+4T1Xj1QEHBQwsH+wgL03O2sz50jsK8e7JkCiO60Me7WavnX1rB0vl409Sc0ODXeXDZS0XWiS/b+CWZdI2DA07UUvlvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VQBmbHPX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VQBmbHPX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C70A1F00893;
	Thu, 11 Jun 2026 08:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781166658;
	bh=vtlzKaXJh9FWitTv16vzxrOT+QcbBfRSnmuu3ZFvB5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VQBmbHPXoDkIWUszPY3iwAMMn2Tu4Nh94J1tyo/Z3gCe45+lrCB7CAKdd+O8+iL+F
	 G5pLLck+sOvImR1dfcklIj+8GJPnDizoQrjq+nOHzJEr0Vb1ZW82H3Wl/DjY8UQ2i2
	 ftZYwFtxtzQ4GH6J8zNsr3jfuWogPJULP1VnLuY5A1WMfA/udfxZO3dW2PEkCnFySX
	 QF8vmL/EciLaYaxmUWWVo+yHalwG4Q09Q+8+dsfkAwm0r5FiV5ODOl5AneAQm99pGC
	 0UB7Pu5DJHl7SZ+lPWy+FgB/pAwRQJc+tAW4zxekuY0hO8EYuIarIQv21sxz2S2VAj
	 roLh5jbU5dIKQ==
Date: Thu, 11 Jun 2026 10:30:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Georgi Djakov <djakov@kernel.org>, Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 10/12] dt-bindings: clock: qcom,gcc-mdm9607: Add missing
 "clocks" property
Message-ID: <20260611-artichoke-dodo-of-camouflage-9e31c1@quoll>
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-10-5e9717faf842@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-10-5e9717faf842@linaro.org>

On Tue, Jun 09, 2026 at 04:14:46PM +0200, Stephan Gerhold wrote:
> gcc-mdm9607.c uses "fw_name", so it requires specifying the "xo" and

"gcc-mdm9607.c driver ..."

> "sleep_clk" clock source in the device tree. For some reason, this was
> never documented in the dt-bindings. Nowadays, qcom,gcc-mdm9607 has a
> dedicated schema, so we can just add it to the properties without any
> additional conditionals.
> 
> Fixes: 6faa7e4ddce6 ("dt-bindings: clock: Add MDM9607 GCC clock bindings")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc-mdm9607.yaml        | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

