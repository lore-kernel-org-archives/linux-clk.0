Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71739384CCB;
	Thu, 23 Jul 2026 07:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784793253; cv=none; b=k66kR0VKWl9+s/OLBaImifMBtBHnvTgu25qS+qds143UJtI8N0XUZKvZgsR7yebb03NHpGWwlodz/65OvEgpdJruiFAgEnFzUMJFQRJUgutaBpdKCSZ940H5cHFA7UBDpNo2rdI9dPbdxWowH7DfRMlTbuP4uFG0V88QbXtu34c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784793253; c=relaxed/simple;
	bh=yVnsX9YMsLNIWnEeYltLVoRoo6aeIxmPKkA7fTCBONs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nM0SFN4N9hL6Yi8BCfujRRVPCo5ZNtQPsXm2PoGdw8//J5ExM1civZbywN2y5v7JvM5elezEtE2ULXSChnJdzxUbLRpmvJa6jJAoBnkK8K49eO8u8MTULLa1FVsfFf8BAHs+9h2g5wxFVVf8AOZgl48jQ0gzLmvDaHc52vMs4sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M65eaOO8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M65eaOO8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 265021F000E9;
	Thu, 23 Jul 2026 07:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784793252;
	bh=u5zizQov0MDl96Aoua/KLs73pZ6BCKFvkoupK0lYokg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M65eaOO8Wl/0ze/UC0TVmFDP0e9f4xmpJFa/d9b/7ZXyFe9ykTa8LnKWPxjesm1d9
	 6bjJEXo73/BtLYH5rPTwsKhc4HnLvYrlkd2l3GeNGVO1uml9/PbrxJrDg8vRtZ2/WV
	 SEVhQ254usInVKcsZnHeCJWbx6BYoOZ0KeAt7gbkoQRk7W2skN4jZw4MroX0qUpyRU
	 QZ423u+cWEPbZc77FXvI4TbZ3vumLDquD4r8IpUu/GP8OF+aP77ZZKJse4Qapce/Ot
	 AcZukSJcWLOGchN0duiePl6Iab3DG8soevsDqC7JW8gZ5WxODZgfsCILCqM63y8+wt
	 wLQlcpjNV6snw==
Date: Thu, 23 Jul 2026 09:54:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/6] dt-bindings: clock: qcom: Document Nord display
 clock controller
Message-ID: <20260723-industrious-gentle-reindeer-dfae77@quoll>
References: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
 <20260721-nords_mm_v1-v2-3-17e5a445a512@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260721-nords_mm_v1-v2-3-17e5a445a512@oss.qualcomm.com>

On Tue, Jul 21, 2026 at 12:37:18PM +0530, Taniya Das wrote:
> Add Device Tree binding documentation for the display clock controller
> on the Qualcomm Nord SoC.
> 
> The Nord platform contains two instances of the display clock controller,
> DISPCC_0 and DISPCC_1. Update the bindings to include compatible strings
> for both instances.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8550-dispcc.yaml         |   3 +
>  include/dt-bindings/clock/qcom,nord-dispcc.h       | 115 +++++++++++++++++++++
>  2 files changed, 118 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

