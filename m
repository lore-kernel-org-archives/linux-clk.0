Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093C74C6D;
	Mon, 31 Aug 2026 07:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788161243; cv=none; b=rkpw4Zr3gooePi33uw6nr3wK34PErfpEXhEviLzVn4hfi7JGE7nFTgfKOb6G0w06e7gIZ3x+Mj4y7LXaArz6eJuKdvOl1T4dsbmNhnXw95c4jcrFhGadK8ldoGZ0L/sC7uZjTAwK0RU6/MrS5+Noh5e0lNUJwkRAW5EjEzpoWK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788161243; c=relaxed/simple;
	bh=3eJh8lKlTSMT66jtXXUivIhdzm+2ibaSV4rCQdFElyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qyLY52+cVOdlJWzN+uhXOqOVQ1L0bMg6JBWVFQorkX/o41nmc/HqQmJH54BBo4IQc5+4+ZZ+9DMZGwulIJwAmWQVvBTMJxaSFTbeDENODuUiqze4NNJXxxng/l7ImthjZzAJMlojkXs+GK1/6ixcVxyVQ1WrXfDyVQq5hMaUThc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PMgiu5Xl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PMgiu5Xl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18E7D1F000E9;
	Mon, 31 Aug 2026 07:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788161241;
	bh=rU7LA4eKjnDRvScYayCrmuHQplFrllwWDBoWgb710pk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PMgiu5XlcCRV+ARmzlavl8pdj0wmliZ8v+vbFISM3mXZhxpL60AVAptYUsdHYTq/5
	 09YgRsk4GyVu+rjdE5e1JsJnNR/o2/sgwEu9V8Jfu+LWPIbeRr2IXepLHGRgazGWBL
	 KyjXz91pU0BL735fA2K2xrQdb4jnasdnbNgwKWyn3yksyZ8gjE4eIoY34ZvhT0gh14
	 5i0TWpTgR8IQut78oeF6FXiDAR70fZymKwU1i16ebWK7BCUD2B8JnRDKsOKWA55FiT
	 gLO5gFKe8wkoMGn2geuOiV3mszDuG+HZO1blN+jxpmy+zcdLhr6cx3ftVyBwUZH5Em
	 KYF1wXVdudBdQ==
Date: Mon, 31 Aug 2026 09:27:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: clock: qcom: Move x1e80100 TCSR to
 own binding
Message-ID: <20260831-ambitious-aloof-inchworm-88acb1@quoll>
References: <20260827-hamoa_tcsr_qref_0826-v4-0-663c9d30468d@oss.qualcomm.com>
 <20260827-hamoa_tcsr_qref_0826-v4-1-663c9d30468d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260827-hamoa_tcsr_qref_0826-v4-1-663c9d30468d@oss.qualcomm.com>

On Thu, Aug 27, 2026 at 11:00:33PM -0700, Qiang Yu wrote:
> The QREF block supplies reference clocks to PCIe/USB/UFS PHYs and requires
> dedicated LDO supplies to operate. The digital control interface for QREF
> (clkref_en registers) resides in TCSR on x1e80100. Since QREF has no
> dedicated DT node of its own, these supply properties are placed in the
> TCSR node which acts as the control interface for QREF.
> 
> These LDOs are required by QREF to provide a stable reference clock,
> without which the USB/PCIe/eDP PHYs cannot work properly, so the supplies
> are marked required even though it breaks ABI.
> 
> TCSR does not act as a reset provider on x1e80100: no driver has ever
> registered a reset controller for it, and no consumer references it as a
> reset, so #reset-cells is dropped entirely rather than documented.
> 
> Add a dedicated binding file for qcom,x1e80100-tcsr and document the
> supply properties.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8550-tcsr.yaml           |   1 -
>  .../bindings/clock/qcom,x1e80100-tcsr.yaml         | 114 +++++++++++++++++++++
>  2 files changed, 114 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

