Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9E5319857;
	Thu,  9 Apr 2026 01:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775699744; cv=none; b=ZeJWBw5GQF8KiVoKE6FEyD3PZKlkPJ6aROL/ZULQIjvH6sEC/WFDUV/F021rbBH6AFT0h+/LqroeQc1IK/lvgLIvxq5wQhzSAj3GZ1nV2assveaSSb4OG0TJINNdB/V8NVv5/GBrarvmGWVP8pKTe0adO0HLrQaPefQ/9RWjJOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775699744; c=relaxed/simple;
	bh=uIRWT4XYsn44bO7BULtXkBJgLgTQFka7LBzuRdpNqGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MCt6dahoQa+PfLKYf3Spsql6xcC+E8jomGMMyZgmhcmoF8xDsh1jg+dwcsDUCJvMIXNTrpGEWrmdjmWDQblnjkUgOApPncdaFEt28CXz4dNPPKynUce5KM71Sx2zACwZH4+mF3LIqZ8unHZ8uH/uwg28SAkPdtgVAomLLcTtFXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MWRdmfmm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MWRdmfmm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77203C19421;
	Thu,  9 Apr 2026 01:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775699744;
	bh=uIRWT4XYsn44bO7BULtXkBJgLgTQFka7LBzuRdpNqGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MWRdmfmmeBYCRQrWEsI/l3RLRj4U7Nvj5laFudd3Na+Ov7y2ER2hX+4Gmp6BjagYB
	 qBJHSV/he0rsshY6bzc+9DzrT2J5VvfUxsLKdII7yOhOKzGGYl9qOUbyCJUM7tFo5r
	 ziSf6pylgv1qBZEqjiS4ztNhvUn7nMcyT4TE7txkXAml3kZRLRFylnFzXjsj31YISs
	 niw8S+jEFMvqG+JJyhYonQoe/pjtdKAIbUgquMXjIJOgPw941EKGNWVBTKqzdv9hho
	 iW1upyT6Y1X4fHMl+MWW6AToQ7W4ip8nVRxHnudD8rCxUpofs/ufiOqKxdMh7In2Fl
	 9Sx5wFUolly/A==
Date: Wed, 8 Apr 2026 20:55:41 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Xilin Wu <sophon@radxa.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Dzmitry Sankouski <dsankouski@gmail.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Mike Turquette <mturquette@linaro.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, 
	Mike Tipton <quic_mdtipton@quicinc.com>
Subject: Re: [PATCH 4/5] clk: qcom: clk-rcg2: calculate timeout based on
 clock frequency
Message-ID: <adcGdXeqltQVwPLz@baldur>
References: <20260406-clk-qcom-gpclk-fixes-v1-0-7a14fe64552d@radxa.com>
 <20260406-clk-qcom-gpclk-fixes-v1-4-7a14fe64552d@radxa.com>
 <c2cdc581-2f8f-4495-bb87-812b27a1e381@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2cdc581-2f8f-4495-bb87-812b27a1e381@oss.qualcomm.com>

On Tue, Apr 07, 2026 at 12:13:09PM +0200, Konrad Dybcio wrote:
> On 4/6/26 5:54 PM, Xilin Wu wrote:
> > RCGs with extremely low rates (tens of Hz to low kHz) take much longer
> > to update than the fixed 500 us timeout allows. A 1 kHz clock needs at
> > least 3 ms (3 cycles) for the configuration handshake.
> > 
> > Instead of increasing the timeout to a huge fixed value for all clocks,
> > dynamically compute the required timeout based on both the old and new
> > clock rates, accounting for 3 cycles at each rate.
> > 
> > Based on a downstream patch by Mike Tipton:
> > https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/aa899c2d1fa31e247f04810f125ac9c60927c901
> > 
> > Fixes: bcd61c0f535a ("clk: qcom: Add support for root clock generators (RCGs)")
> > Signed-off-by: Mike Tipton <quic_mdtipton@quicinc.com>
> 
> Having Mike's s-o-b here is odd, given you've decided to go forward
> without his "From:"
> 

s/odd/wrong/ Please correct the author of the commit.

Note thought that it's good etiquette to document the changes you make
to Mike's original patch, by adding a line "[Xilin: changed x, y, z]"
between Mike's s-o-b and yours...until you end up having more changes
than the original author, then you're the author of the patch.

Regards,
Bjorn

> [...]
> > +static int get_update_timeout(const struct clk_rcg2 *rcg)
> 
> Let's tack on a '_us'
> 
> > +{
> > +	int timeout = 0;
> > +	unsigned long current_freq;
> > +
> > +	/*
> > +	 * The time it takes an RCG to update is roughly 3 clock cycles of the
> > +	 * old and new clock rates.
> > +	 */
> > +	current_freq = clk_hw_get_rate(&rcg->clkr.hw);
> > +	if (current_freq)
> > +		timeout += 3 * (USEC_PER_SEC / current_freq);
> > +	if (rcg->configured_freq)
> > +		timeout += 3 * (USEC_PER_SEC / rcg->configured_freq);
> 
> I suppose both are nonzero if we end up in this path but a check for zerodiv
> is always welcome
> 
> > +
> > +	return max(timeout, 500);
> > +}
> > +
> >  static int update_config(struct clk_rcg2 *rcg)
> >  {
> > -	int count, ret;
> > +	int timeout, count, ret;
> >  	u32 cmd;
> >  	struct clk_hw *hw = &rcg->clkr.hw;
> >  	const char *name = clk_hw_get_name(hw);
> > @@ -123,8 +141,10 @@ static int update_config(struct clk_rcg2 *rcg)
> >  	if (ret)
> >  		return ret;
> >  
> > +	timeout = get_update_timeout(rcg);
> 
> You can just assign count = get_update_timeout() below since you're not
> reusing this value
> 
> Konrad
