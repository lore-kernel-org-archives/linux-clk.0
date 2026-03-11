Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A106423ABA8;
	Wed, 11 Mar 2026 21:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773263484; cv=none; b=qZpKZEZovSBq35L1FL+ZKbW/deL3/CD/tPnXTx4sznmzvwZ7yzwDX66M7hV3xmDfMwosFDU9x2+MSV6vZL+TL8TIm9S2ThiAZddTiYpLFpw3/+GWxJKX6fkmF+Rn1d6bPTg1Hp07D4KkjlsPMS4BKazANSgl8gjyTnskHC5xJVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773263484; c=relaxed/simple;
	bh=OwgVxzGUPK0fdml0fgIEcBM672LBenrQ9/yHUNZEenE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jhGYV253EQNV7Qk29EiFxRVrA2Fvqr2RhRoZj4Z/FgitJ8e0/7sJBSuXDSv/zEOHow9tps/uXgwnmJSEZuD+6z62kwYgGsQAywcY4gZjJd94FgY4oyEuTK3wkwmCYl2jOLVPTuJMLT7/m1EmeFoIsBh3COrUUAuCV/9bs6rJjeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r3dzwYvR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r3dzwYvR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1101DC4CEF7;
	Wed, 11 Mar 2026 21:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773263484;
	bh=OwgVxzGUPK0fdml0fgIEcBM672LBenrQ9/yHUNZEenE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r3dzwYvRo6IvKGxmtcSmWg7cF9sor+0SJafXxIzyUdKC3+BUw1F+aOgu1XugjOcR7
	 RZD5FVb6Ht/N+gBZ7y3WWzduu/2ZlJfA/kXYiUAhZ9zZghoj7mzE/CGwqm2ZT1fI4p
	 dDcaA0gHAySNWSUI+dcqn8WXjUEvt0alv1Ap2AqC58s3Hj/qyZDUe0Y1uArvSfef98
	 4wa04YSPx32fg0cLFhRrDYo1e8+6ObTPTuSiY971A94g/4Rd0Z1kJYQe7QQ9VpVGPW
	 xF3w5PmZtLcT4ClSF5wAgIQtuCdjZ/LJ831E7vuO4ewt5Kbwk8I+oFDAi1dGoX/Glu
	 UQkwlyYC4ovwA==
Date: Wed, 11 Mar 2026 16:11:19 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RESEND v6 5/6] clk: qcom: Add support for Global clock
 controller on Eliza
Message-ID: <abHZ8Y3NmsNj3IXR@baldur>
References: <20260311-eliza-clocks-v6-0-453c4cf657a2@oss.qualcomm.com>
 <20260311-eliza-clocks-v6-5-453c4cf657a2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-eliza-clocks-v6-5-453c4cf657a2@oss.qualcomm.com>

On Wed, Mar 11, 2026 at 04:46:35PM +0200, Abel Vesa wrote:
> diff --git a/drivers/clk/qcom/gcc-eliza.c b/drivers/clk/qcom/gcc-eliza.c
[..]
> +static const struct qcom_cc_desc gcc_eliza_desc = {
> +	.config = &gcc_eliza_regmap_config,
> +	.clks = gcc_eliza_clocks,
> +	.num_clks = ARRAY_SIZE(gcc_eliza_clocks),
> +	.resets = gcc_eliza_resets,
> +	.num_resets = ARRAY_SIZE(gcc_eliza_resets),
> +	.gdscs = gcc_eliza_gdscs,
> +	.num_gdscs = ARRAY_SIZE(gcc_eliza_gdscs),
> +	.driver_data = &gcc_eliza_driver_data,

Don't we want a use_rpm here?

I merged this for now, please send an incremental patch, and please fix
the tool that is used to generate these patches.

Regards,
Bjorn

> +};
