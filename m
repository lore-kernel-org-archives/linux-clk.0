Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DFF41A50A;
	Thu, 17 Sep 2026 08:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633967; cv=none; b=iWSaDTJi0svdu07ytYQuV5UeRdJl/hWc7oe0vbyNnQuGlUtJPQMRQaWR+Y0oQIMz0hQYhKBsBbEZZMxiGrfUNYu18Uc5EITcQ39Ni9IVbAHX/2vWizzrM44e798t9fxhbktm9UuKFN+JJAUa4IBY7vPm/t6jYx8ZSrJVM0T0zbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633967; c=relaxed/simple;
	bh=pBhV7pV5tteP4rdQ5/EnENLRnRz288ytRWIVhLfqVR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=swQUFxVSbp3P77ARDoAPVfqvzMFvDU4W29gkTXgQQDM66fwJRKYrkmtLonrD4DcrTbKPxcOeFuhb6bD781RyPoA9kKmowShLQlRMZO5mWffEbgvlhQooTauHCzi0RSERTnTmJ2bkEctYaBTVhe0uwgqlFGcbczxGZimWEueMKgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iCOBPGV5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iCOBPGV5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C681F000FF;
	Thu, 17 Sep 2026 08:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789633957;
	bh=XDaej2kYZx06q0/J5jvQ+NA8pencnIXePgZlLeVqX6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iCOBPGV5PzIObhixwzptQ/Yb6j1Gey+pdo4lZmjTk7wR7V9FcUebw2o7T3Q041kcL
	 iqthbjW5HicWNJLcVbd4ZKmCQTaj55r5/cmVg4apm96QXooWpE0ZdG2I2IIORVl8sr
	 LyRvhr1kLEzFeADULcA8gPQtqZmMY7dazEXRhkUhfR/dL6y5qzzgMwmfcfqG5bRscY
	 trl3os8F/gD4WS4DzvVmPgPsLWQ3sspaXMqs35yLAQriPlVjYIH/RYzF9DGGWmyN0U
	 S6ZJNqdqXcgGt7Hm4gdwh+kV1Ja7ccgAwXpzKcSAWSz0CKshFvlL4mch+FnGHvnMMe
	 FAoeNOeFxJFOA==
Date: Thu, 17 Sep 2026 10:32:33 +0200
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
Subject: Re: [PATCH v4 12/52] dt-bindings: clock: qcom: qcs8300-gcc: Add CX
 power domain
Message-ID: <20260917-wandering-cooperative-bird-89755e@quoll>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
 <20260914-qcom-tie-cx-to-gcc-v4-12-9d5a606ada33@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-12-9d5a606ada33@oss.qualcomm.com>

On Mon, Sep 14, 2026 at 03:47:11PM +0300, Abel Vesa wrote:
> The GDSCs provided by the QCS8300 GCC are supplied by the RPMh CX
> power domain. Model that parent domain in the GCC binding so the
> provider can describe the dependency in devicetree.
> 
> Add a single CX power-domain entry to the binding and make it required.
> Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh
> may undervolt it.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,qcs8300-gcc.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

