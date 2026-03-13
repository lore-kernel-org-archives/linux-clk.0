Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5F939479B;
	Fri, 13 Mar 2026 13:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773408939; cv=none; b=p2YGFXqIEuMIq5T3zgtS9R2+IQfDZvNJUC3w/SINffoETQxw/BQcHTdJPul35tbkppjfVswwas1x7Mg7NT944c0TxzXtIXFwIHcwpdTUYwnRc6s+od6YnojEtxEZ+Onp3F3QatGmJf2j8/GwsCoKMZYEm/LPLV0rSsOI8cegCMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773408939; c=relaxed/simple;
	bh=0sevSDJejValIi8WkOg9BsYqJ+7eCWC/tjBqMaAIcg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ma2e4CkNP9cwASqcDgqbZ7B2mY4g+8Y43kIAaO/zo2Gg9YXoV7euk4+Rm7HBgXR/XCilIZGUh72RWhNt8REg63yiUDnVjwjaOC99VB8rKPydH5yf37wZWXlRcg4BglHTFKqKTmUQ5Na4J3VkSIQNiDsxx6UHUrP7JLFMt1j+Njo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MFczpodk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MFczpodk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F7CBC19421;
	Fri, 13 Mar 2026 13:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773408938;
	bh=0sevSDJejValIi8WkOg9BsYqJ+7eCWC/tjBqMaAIcg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MFczpodktwK4n3veoRhCBX140bgLw/VtTwGHtgQubQdorTJOz64+mozPMTxzniR1O
	 5t50BKDjDkB3XA4T95fb6NyHoePIRM3eCJE3TbZ7sMYn0hQOqmzkYy4/fGyGNlzwrW
	 Yrg47NPHdlpns2cJT/TvMutHZs/eJQrk2C8RkXiZaCb61e66xqEQgb+LbGgyyOMseU
	 iyhCkcw9WH2wFPzGImlPXPHBYMN6RWX75a27XLJBSSHHLKUBUCqAuwPICTXd3qAS7w
	 M0sysiaRtvlkp5x79vl+IV5iXv/f6LV7+YfGkml7GUQ2yriA4yqOmhIAAij4OqBioN
	 FZPmVvo3O72mw==
Date: Fri, 13 Mar 2026 14:35:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Luo Jie <quic_luoj@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, John Crispin <john@phrozen.org>
Subject: Re: [PATCH 3/4] dt-bindings: clock: qcom: Add CMN PLL support for
 IPQ8074
Message-ID: <20260313-able-savvy-cuckoo-38ed75@quoll>
References: <20260311183942.10134-1-ansuelsmth@gmail.com>
 <20260311183942.10134-4-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260311183942.10134-4-ansuelsmth@gmail.com>

On Wed, Mar 11, 2026 at 07:39:40PM +0100, Christian Marangi wrote:
> From: John Crispin <john@phrozen.org>
> 
> The CMN PLL block in the IPQ8074 SoC takes 48 MHz as the reference
> input clock. Its output clocks are the bias_pll_cc_clk (300 MHz) and
> bias_pll_nss_noc_clk (416.5 MHz) clocks used by the networking
> subsystem.
> 
> Add the related compatible for IPQ8074 to the ipq9574-cmn-pll
> generic schema.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/clock/qcom,ipq9574-cmn-pll.yaml      |  1 +
>  include/dt-bindings/clock/qcom,ipq8074-cmn-pll.h  | 15 +++++++++++++++
>  2 files changed, 16 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,ipq8074-cmn-pll.h

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

