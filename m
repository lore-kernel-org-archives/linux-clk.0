Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E86C3AB5DA;
	Tue, 29 Sep 2026 07:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790668666; cv=none; b=kAou4B3qLbGeypww0r75zmy+uaCyciWHhYs4J6cvUsXQ7EjDcaPxKLRmWNZBQ4MsiPfjQqECmq7AkP59aC2VV3qZIOrPVSiiVxwSDd6bEOWZ02dFugTLQEYIg4X290OcYMhvbhDzIN5UGe3xHo39shUA28tWJAmQ2pxoN9PZgEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790668666; c=relaxed/simple;
	bh=QcPHyvyl0XUUm6Ls3Oq2BIfKzTujWlTq74iC2AjlEsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F+hM9TYT4pPmlVhNURXggan5NIg7VQvWh8dDh6q+jWpvyiszj3hXABABWe43fdI4QqEOpq34R8kVwy4s+0giWNLTCTjpmS+ZJzV0KjZ7UthDOkKLb2CC7UxAWOVEOtdgH97Zj/ba/XFf8M5SdC3ZDwSGG4XuAwnvMuVEOMDN7hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nbMFx7nE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nbMFx7nE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91F321F000FF;
	Tue, 29 Sep 2026 07:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790668665;
	bh=SnGwR+r1QeQuK+Ch67nV604+73TG6+orIYTqiQSom5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nbMFx7nEaHWt4A0cPwyJNtklYq6Ytw6ERbFlvhIJfufr3/YDSXrWbfYsLVUrY1h7X
	 W1njtykkwtrg3ms57VMmsCe7weAjGoWhBZzVyx3SAzPdX5znrG6UWp3Edlm/8xy3oy
	 xRpMomVDRidzg+Y9ZOXWvbUmF90muA7m8B7h4KCi5wxViR0gxZ5GjlbirFMVCmdUrW
	 mlgwzJjPm19moCmEcSJ84eeVsrKKYVoV6qS/wO0ha5S1ui50/Cw9vP4/gkyWsOlu8s
	 JgX3f0POAHbOb3fs6Sfvudga6RLVfhBjAJVDrYahbBhDGzjk1B0BcKLsKhX5CN1jM4
	 zt2vl2cEqvbjQ==
Date: Tue, 29 Sep 2026 09:57:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom,sm8450-videocc: Fix clock
 inputs for Glymur
Message-ID: <20260929-visionary-hospitable-beaver-e2c1a5@quoll>
References: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
 <20260924161152.1162301-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260924161152.1162301-2-shengchao.guo@oss.qualcomm.com>

On Fri, Sep 25, 2026 at 12:11:50AM +0800, Shawn Guo wrote:
> The schema describes exactly two clock inputs for every compatible it
> covers, a board XO and a video AHB clock from GCC. That is only true
> for part of the drivers bound to these compatibles. videocc-glymur.c,
> which handles qcom,glymur-videocc and qcom,nord-videocc, and
> videocc-sm8750.c both declare their DT inputs as DT_BI_TCXO,
> DT_BI_TCXO_AO and DT_SLEEP_CLK, and parent video_cc_sleep_clk_src on
> DT_SLEEP_CLK.

I don't understand what you are saying here. You are mixing drivers and
compatibles.

> 
> Because the schema stops at two items, no device tree can supply the
> third input, so video_cc_sleep_clk_src can never resolve its parent
> and registers as an orphan clock. It also documents the second input
> as an AHB clock, which no device tree using these two drivers passes,
> and which those drivers would interpret as the always-on XO.
> 
> Describe three inputs for the Glymur, Nord and SM8750 compatibles,
> keeping the existing two-input description for the rest. The sibling
> qcom,glymur-evacc.yaml, whose driver has the same shape, already
> documents a sleep clock this way.
> 
> Fixes: ed9ca8296147 ("dt-bindings: clock: qcom: Add video clock controller on Glymur SoC")
> Fixes: b190eaea5780 ("dt-bindings: clock: qcom: Add SM8750 video clock controller")

Are you sure that you are not reverting review like it happened this
week in IPQ? You know, the trick with reverting maintainer's review I
mentioned on DT IRC?

Best regards,
Krzysztof

