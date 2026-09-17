Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94251415F39;
	Thu, 17 Sep 2026 08:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633834; cv=none; b=X2taygeI034nWlnbgXwaeP0A8V3SG8B+McfUw1z0hZgKHFRbkBMGpxEoVxIcW31Duc+qC454Cyc+zz2btxDXvfHGjXlRPrGl0heEVwGdVCxM5Y5T/GDyDmgLOgxeDqnjdaiZUbS2k8pGw+hJd3NonQPNQm80MfWqyvovuwbPzOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633834; c=relaxed/simple;
	bh=ndl1bg+HvvUuLlTL/fD+0Wj8h1M091bUQFEfWry3ZTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GsloVSy9alEbJEVfwrQtHDcrYRS2BmycWG4LadEeTDcMNUYLssZumFmFTWiL8MudYzBlHmbwFTqqf9FOWhlY9CBO5CYbbj5tRugdYgK2btcm/BX3orhynlhkCmQqsQ9otWC9V6gKhgl+fQhVeNvflXd7hAz6plgKwLnOu3Ffi7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g9ebH5GC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g9ebH5GC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C78F1F00893;
	Thu, 17 Sep 2026 08:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789633818;
	bh=8YWDhGL8RNnivqiXxrB1StcLH4XQLEFYrrHDq7zdFwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g9ebH5GCU97ImVHpFfFTl5y8bAcv3uCO7nXbfh2xcOfqmuXZb4UjWUiC6Ji1ylzqZ
	 dlcwfXO8Shckah6aUhW4UbT8bVJtL6qtV/HSbXrBpgGfUR2K1QtHNmEVcT2YrCkq4i
	 mFowwcM7ibCWpReN4rtlMtVDFj5KKGuosZRvQecdxz6RtpvRdWHcHh1EkeQFy0POGG
	 Mjie6MT7v9M5Kp+7FZArNuMuAcB7XEz9tsOxTLQYPUlEOIRDA7TiwBSb1AYvaF9StE
	 MuUxhHeMszxOAxrRk/VfJD1wRD7opBgcMm9/MQp2Td/WGWyxzyz/BYX8hkn+3dTHo+
	 MbNj1GSVrlAnQ==
Date: Thu, 17 Sep 2026 10:30:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	Vinod Koul <vkoul@kernel.org>, Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Tengfei Fan <tengfei.fan@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 05/52] dt-bindings: clock: qcom: gcc-sm8450: Add CX
 power domain
Message-ID: <20260917-belligerent-copper-oarfish-aeea4e@quoll>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
 <20260914-qcom-tie-cx-to-gcc-v4-5-9d5a606ada33@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-5-9d5a606ada33@oss.qualcomm.com>

On Mon, Sep 14, 2026 at 03:47:04PM +0300, Abel Vesa wrote:
> The GDSCs provided by the SM8450 GCC are supplied by the RPMh CX power
> domain. Model that parent domain in the GCC binding so the provider can
> describe the dependency in devicetree.
> 
> Add a single CX power-domain entry to the binding and make it required.
> Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
> undervolt it.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

