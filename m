Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F1A35201F;
	Mon,  3 Aug 2026 09:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785749912; cv=none; b=Sro6R6bhv6fBT53QRvfrbv4VHESVWVcuTkU4IEsc8I/oBquk5+1+/LFiKSlXlSa/jjtGR3Pzsk0nsEAYKU4x/tbKzjmoeZFrxAUffnP93mbIqwAyefp1IA/qOozR5xXMg0VvU66znILDmvyZnL8SGFVZKnUM52AA9fGIr5p394E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785749912; c=relaxed/simple;
	bh=PPO1Z7cR0A3oMXranBdg/ArTRxdDHieZayCNYL7Eols=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kiZdFYRL/ULD4ZFCYv+0JArX5tEtPooTgGK4RnrBn9oZb0n04L2GdBrtkniemK/YrkesbNvLtTGiQN9LuFfdocTn6p6HwtAvMrHWw6bbWKAPtf/iRRKEYSSO+J/qVNeKCeb3Z+E/TVw3UEuYSbxR5S6YssREH6Hv8yQQF61qr3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n1zVBGv3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n1zVBGv3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 618971F000E9;
	Mon,  3 Aug 2026 09:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785749910;
	bh=+OGnCkpDzoe4UR8+dOoY6fjRalNg6uCxui90h5a0QhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n1zVBGv3utFpB1SXLLho2pEqpjksRZ7A9GJPjAq3xWQjDHJqYYkixmnOWYhSOni/m
	 kHKZh2FsksG0idxEnvOwWKyBEKGtGFVVsSCQ+XwhjZjG+G9Q75MtRrT/5op2PCVPEi
	 8UWkFSnIN6BMqYe+bIefoZCEpleTl2/Jqhv4SLFE6l0OYmAmbvArPDOFZiO5cSXbgu
	 l+eCKcBiYTz4WpOZExdHtZX3f6Sodsrb2RjQMxziPclw3+siwljGoAZL3R0cbpYpNl
	 S976cnuUOiAs50qiShNQbdwV1TULFLOJvEaUNVN+/pGAxMGK1E/XoHsH48bvzhEyQt
	 K1qpukRvlHC0g==
Date: Mon, 3 Aug 2026 11:38:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] dt-bindings: clock: qcom: Add video clock
 controller on Nord SoC
Message-ID: <20260803-observant-ruddy-kelpie-4f640f@quoll>
References: <20260801-nord_videocc_camcc-v2-0-674d7718e41f@oss.qualcomm.com>
 <20260801-nord_videocc_camcc-v2-3-674d7718e41f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260801-nord_videocc_camcc-v2-3-674d7718e41f@oss.qualcomm.com>

On Sat, Aug 01, 2026 at 07:43:54PM +0530, Taniya Das wrote:
> Add compatible string for Nord video clock controller and the bindings
> for Nord Qualcomm SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

