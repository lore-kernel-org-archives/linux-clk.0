Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFF635BDC7;
	Mon, 22 Jun 2026 07:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782113392; cv=none; b=S8Q/xJ7nRr5jH4K5/COfgr4uMjYyKtgXjTNXZcNKNaAGyj34P53jKjxYJMNIeFDqmTnPVgNIscyU8o+cDiSx76vSqGTGfgHNkMro2WEOwL8zfX+HKiai6UpoJdRLCjofDCVKXJSoidMXvb5w6eEXseyg0cTnmf/KLfgVFD8irBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782113392; c=relaxed/simple;
	bh=3XGFnjNNwQ0DgUxnBLbLN5bawW+GulGIgmgo3jZNi6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BtzQgNldfGzxc8oxpeSFgs3Z6+7v28AJOglgOXNCKgwBgzKWYsHakwM2GsrdBrjJ3smPpXgvDBnBlne2iBGQ7ZCLyuvCge/3w8e/VE73FQuljk9CzUKhuyrZwDVXSGHKB7RGM3qbgwHVsO6boU3+RrFpQzvqhD3LwwhhapmHW5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JOUKMf8l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JOUKMf8l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F2C11F000E9;
	Mon, 22 Jun 2026 07:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782113391;
	bh=F0WSUvVH35ZlfPX0H0C4RQzArqTL2PmbydtZQym0o8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JOUKMf8lz4bTcN18n6o3m/MstV0+Qvl8HLdwksxzul58S/4pIvPVAfeziPRpscjmQ
	 RxB8kSL9mCQKupGu7XYEmCvKi9ltHIxmnTeRFw0cTXYR4E6sEw2F5E1J9KEnsvhECi
	 RZ/ld16BRO1/1KfoLnSVeY3ZucjFINYQGoy202zMvIuNVKxw2Q6PGgqf1FOCiAk6SF
	 HZoiMilRzbr9imFeekYwEWfrPzXBQQBKt4dfjEpDYJtn8E4ectEX8+tb/PRUu0SXl8
	 kDefVQNIrsRs62MPozDVLNnOLd0cCMt21pCkJaAp/eRLn+YYwnEywzAAppdDF+Ohon
	 dzpOjZLWgPjMQ==
Date: Mon, 22 Jun 2026 09:29:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v6 1/8] dt-bindings: clock: qcom: Move glymur TCSR to own
 binding
Message-ID: <20260622-exotic-educational-raccoon-c1639a@quoll>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-1-c939c22ded0c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260621-tcsr_qref_0622-v6-1-c939c22ded0c@oss.qualcomm.com>

On Sun, Jun 21, 2026 at 10:11:24PM -0700, Qiang Yu wrote:
> The QREF block supplies reference clocks to PCIe PHYs and requires
> dedicated LDO supplies to operate. The digital control interface for QREF
> (clkref_en registers) resides in TCSR on glymur. Since QREF has no
> dedicated DT node of its own, these supply properties are placed in the
> TCSR node which acts as the control interface for QREF.
> 
> Add a dedicated binding file for qcom,glymur-tcsr and document the supply
> properties.
> 
> Mark the relevant supplies as required per compatible using allOf/if/then
> conditionals.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,glymur-tcsr.yaml           | 114 +++++++++++++++++++++
>  .../bindings/clock/qcom,sm8550-tcsr.yaml           |   2 -
>  2 files changed, 114 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

