Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40A1156236;
	Mon,  8 Dec 2025 06:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765174630; cv=none; b=QrdbmhtcOTRACK+U1tDDQxG0M7QNtKrxm6cOGXOAxVsMNJjpM/ctv8nuDfzHW5Qesc0f3o3b/huxDU1/BCiwOyk4g7G+aSYg9vKHHYsjLhwNqhlC3FZaNmyMn3p/ff+SfxBHTAeR9SgcLB6iKckM1FUl00gqe0POn8Fy0lwef3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765174630; c=relaxed/simple;
	bh=/CNz4G1Z/HzNH9iWHAzsgrxR7BVOXO1OkE0s/xI2IQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hiID56Xk/jpnCtP1I+PicZCPfirBo+X4idwlTyFDV5PGrRe7edMj7EFNNz9PgjTv9V/azWR1uDbUAfDWTM5siSazEULptFnvuCpadAovUwVPMk7WQpmJGLIboaqIWd5jZGy7ZvzGgcMcgVOHrV+Y7trXCSyFKCitZs1U3datOlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iCmBtsTP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iCmBtsTP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13CAFC4CEF1;
	Mon,  8 Dec 2025 06:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765174627;
	bh=/CNz4G1Z/HzNH9iWHAzsgrxR7BVOXO1OkE0s/xI2IQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iCmBtsTPZEmaChMTFeu+cS+qxz2KVruK1Z//UVgC1WpJaiNNf786LLahqPk3AN+GS
	 iuf1fgL9TlAXnPUwoCLn3yU8Xb8uLrpGynubq3Kld7HUV2NfmO4tGrgp2o1xZxHh8j
	 XyYk1Przk1h0lwYrQGcFe87YANrusDrGNwJ1CcMVHpAgoCDMB6EoogbOfJhNBCvO7S
	 U7tVQGek8cJ8VD+wPmfKZ+KEpFG+ClxUaFeKsLEHJg7rgWW6VBZ3GrKDWKMld3TdVT
	 YiEA3UabvDvHGOCQQlweLTOwFpMHTRjF+V8+k1kdqwRjQchLhxaigy4l5erBqkYIXo
	 X/cTw75bTuXOg==
Date: Mon, 8 Dec 2025 07:17:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Xianwei Zhao <xianwei.zhao@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	robh+dt <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
	linux-amlogic <linux-amlogic@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v6 2/5] dt-bindings: clock: add Amlogic T7 SCMI clock
 controller
Message-ID: <20251208-independent-warping-macaw-74a169@quoll>
References: <20251204053635.1234150-1-jian.hu@amlogic.com>
 <20251204053635.1234150-3-jian.hu@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251204053635.1234150-3-jian.hu@amlogic.com>

On Thu, Dec 04, 2025 at 01:36:31PM +0800, Jian Hu wrote:
> Add DT bindings for the SCMI clock controller of the Amlogic T7 SoC family.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  include/dt-bindings/clock/amlogic,t7-scmi.h | 47 +++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 include/dt-bindings/clock/amlogic,t7-scmi.h
> 

Where is any binding doc for this? Why is this a separate patch?

Best regards,
Krzysztof

