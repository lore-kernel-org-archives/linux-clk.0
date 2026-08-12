Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAF7221F20;
	Wed, 12 Aug 2026 02:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786500856; cv=none; b=de3TUVXviUXRCTP9n9KlR8jli9TzoIFqixw0cyOKzXJUjF4WMF7aMFymGrxLJ5LtO5a+Ec8GEryrJErIo74rW1b5BNuookaU/MbOx2S7YAyZxXWKHGbOcNXxmOsEgma9VaeVSLvjluoVNk1dw7yaje5a43zYTCGdczEcLXRFTks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786500856; c=relaxed/simple;
	bh=cjp5466UPtGsRI1oPPhujznS23m0UTvCNCpSRltINWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=msAS6/UF0WE73tEfBa30+aSfl+026unWBsR1UFOpT+b/o6qsF3bXeY1PAMcunN+z2IBtmkjl6iAHCf534q0cBv9l6zvYt3x4zhpPB7R8PO8eVNsNMxbBd69fCs5FxloUccqWIQ/SGkVL0yQ84QYzsBcnKkVBx+BZ1HOIoZMYnHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kYleE3OX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kYleE3OX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 764D01F000E9;
	Wed, 12 Aug 2026 02:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786500855;
	bh=y5ZRVDWon254SFNP+iXzizz1fTYM1I6XRxtfO4wD3RU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kYleE3OXKSup0WqEViKSGN+l5FIYFD+IA3b/JkLgQDZnbGJc/8MORzkhmW9Y1tnZR
	 YpOSGqnIYh2HHs13NJPQcy+v6+JWvF+Lz+puoEkzvVK7QiICr00uzvHM7rYLSuEEff
	 Sv5auD9hvcC0rv9BNWRCFfzfpJQ3MsrumWW6TvEmbxQMAewblCwjGy5mnakx61ZqPL
	 UWQstuHi1yYYg+MOk9tsNQpDO2W15l+uzTNva7m2fS2wiqeQAKM0GbgFTON578yzb5
	 SB2Iv04FwMSOGlvMLmrrQ7B5yALMyre1tZOdLEcPbb0RmRC85NSL1/PejbuhG1Rb/J
	 4bH2uMX7CxG5g==
Date: Tue, 11 Aug 2026 21:14:14 -0500
From: Rob Herring <robh@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: qcom: Move x1e80100 TCSR to
 own binding
Message-ID: <20260812021414.GA544668-robh@kernel.org>
References: <20260805-hamoa_tcsr_qref_0805-v2-0-4f1cfb1fcab2@oss.qualcomm.com>
 <20260805-hamoa_tcsr_qref_0805-v2-1-4f1cfb1fcab2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805-hamoa_tcsr_qref_0805-v2-1-4f1cfb1fcab2@oss.qualcomm.com>

On Wed, Aug 05, 2026 at 10:34:55PM -0700, Qiang Yu wrote:
> The QREF block supplies reference clocks to PCIe/USB/UFS PHYs and
> requires dedicated LDO supplies to operate. The digital control
> interface for QREF (clkref_en registers) resides in TCSR on x1e80100.
> Since QREF has no dedicated DT node of its own, these supply
> properties are placed in the TCSR node which acts as the control
> interface for QREF.
> 
> These LDOs are required by QREF to provide a stable reference clock,
> without which the USB/PCIe/eDP PHYs cannot work properly, so they are
> marked required even though it breaks ABI.
> 
> Add a dedicated binding file for qcom,x1e80100-tcsr and document the
> supply properties.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8550-tcsr.yaml           |   1 -
>  .../bindings/clock/qcom,x1e80100-tcsr.yaml         | 118 +++++++++++++++++++++
>  2 files changed, 118 insertions(+), 1 deletion(-)

sashiko issue needs to be addressed.
