Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B90D417366;
	Thu, 17 Sep 2026 08:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633527; cv=none; b=smXBGTmndDgDkaO79RX2/IX+wBDyP++V2p1rL73zRfDh8TTvhULQtyGDwRrZWXswhFiIOwfh63HsD/wAry4N6Vm+h03001IJQ1dMv3Kq231Z7GxSzngYWS88Z8f/Ma6P8LAEGopdv2+Tqmnk4sA6rY7fbQiKSAB8OyA5cmGZVnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633527; c=relaxed/simple;
	bh=gsLvQ8aunTqZoqsvZVW4bN53xyDV4dunGdDU8BvSQ9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYvfME1eG0fcnfw508zOL6Ln0BKv7Pdy8gxVI8vYQqIwz3NnrKq80W2ZP/9zFKJeNBATkPxcAYyIibWTNbVwLtKJbQBs5R4R6y+1oBcpy0XIOl6T9Hj4Nx8q4darspeD3H7tFob/gybGMa/USElK2eoCGkcGe5ix5KWtQLSebi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JwaDkV63; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JwaDkV63"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B75C51F000FF;
	Thu, 17 Sep 2026 08:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789633511;
	bh=/keOooyWYZEmOhPMec+6cT8tULTPpCfS947S5vWOVbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JwaDkV63TPuv6rUCzNL3KCPGxVpCheBwAqT+Jxc7FI1x75bhUPJyS1SqWuKZgwF/w
	 GjTnIMLbuM9ul6lxM5bTxx43arYOWNzuTn75oiD9PxX3xMaERgJrDuw3pDUcacSYvn
	 T1Us48UsRPhvME0+lB2Dc9NnfNFZGWLXjqzCsdWHOetSBdi9VzP7Zv2Y3QQwU8F8gZ
	 rkf/1/EjJJSsY/JA0aAqElOwqnmHcPOUBeiBsR8tUe39CLaC97pCMAwzcLuXp4pUBd
	 vT43nXyxpRleQHvjkhLTykGVTkdTi3+1BxThVLUpbxSczfhpPifW2exjGZHDpow27E
	 WjR+s7qdG5fWw==
Date: Thu, 17 Sep 2026 10:25:07 +0200
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
Subject: Re: [PATCH v4 02/52] dt-bindings: clock: qcom: gcc-sm8150: Add CX
 power domain
Message-ID: <20260917-educational-uber-magpie-c6a1e1@quoll>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
 <20260914-qcom-tie-cx-to-gcc-v4-2-9d5a606ada33@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-2-9d5a606ada33@oss.qualcomm.com>

On Mon, Sep 14, 2026 at 03:47:01PM +0300, Abel Vesa wrote:
> Describe the CX power-domain dependency for SM8150 GCC and require it in
> the binding.
> 
> Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
> undervolt it.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

