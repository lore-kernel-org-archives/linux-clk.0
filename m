Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283723B14AC;
	Fri,  3 Jul 2026 09:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783072418; cv=none; b=amYYg85zZlXeVPpX8qERIz+akMyGuXlcOAd/xK2XdA078WhpYZb9h3ppGdbfgTRRk2fdzgNVLzv8fVCiQRku7XaO6vC4tX2EbBstbivScPh9my9l0VtSw5uuzL/mjFZ0VEt1rrM72NqBnsCnVLiOaSL5Z1aP+W0BmIUOq2hDyZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783072418; c=relaxed/simple;
	bh=2L75dJp21IjSIQ4qqPVGE/oyVx9qhEU9GtCivqVwR34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/FH0yv3b0Dl8i9c3avOCdYVNh6CqzmHRc2HPeTpwuBZPrvdxsYGKCdyLk/pS0EK2a5ge/fC/QFrQUFANr2Wu52/4fQmd3raXPi/8Ag5mlDxJECuv3M2z9UuSk7/S9gy26C9007lORYFKsgeH1w2hFg3FvQj/eGChcIbBPACE0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OF/cjS93; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OF/cjS93"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD6E01F000E9;
	Fri,  3 Jul 2026 09:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783072416;
	bh=SaZwKJT1mcqlaSPlM+wH/cK8p/eu/JiBJQO7HD7Jt54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OF/cjS93JCz9fvJi5J53vzzUpmODrWEI0X+l/YQKubMaMw0PEOT9bj6Qtcuuw21lV
	 k3rXjNisHfWOUCrbbvL/oL+7UoUSYjzR7YZ8j8Or6SBy+ZQDWzaZMZ8l/2yq6KbQKQ
	 duI1KpGKehLTar1ABuFdOA87HhWl38/dMm8LJmwdf9OQbxZORCxvR8jmax8GoBcvXd
	 IFTsYy2O6NJ1i0/plQHiqsDO4MCn/4d7SBUEh70c/+JjYBitz03dQ92V0AcQCjRCxK
	 XTEJPcdZS4IfS7SWe74OacVgroPYYtB4pedEnutpbW467mhTb+NNXQ5Ye2nQJr4Av+
	 AF8YSANx2dn+A==
Date: Fri, 3 Jul 2026 11:53:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lin Li <zhuolin.li@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: Add Hawi video clock
 controller
Message-ID: <20260703-hilarious-hopeful-corgi-e0fa28@quoll>
References: <20260702-hawi-videocc-v1-0-6c1e640b0954@oss.qualcomm.com>
 <20260702-hawi-videocc-v1-1-6c1e640b0954@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260702-hawi-videocc-v1-1-6c1e640b0954@oss.qualcomm.com>

On Thu, Jul 02, 2026 at 10:08:07AM -0700, Lin Li wrote:
> Add device tree bindings for the video clock controller on Qualcomm
> Hawi SoC.
> 
> Signed-off-by: Lin Li <zhuolin.li@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8450-videocc.yaml        |  3 +
>  include/dt-bindings/clock/qcom,hawi-videocc.h      | 64 ++++++++++++++++++++++
>  2 files changed, 67 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

