Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B2A42123F;
	Thu, 17 Sep 2026 08:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633641; cv=none; b=kSl3yzcyPGWcHeI7coqfXcACWxZuVer2aQxZZBhi4pP9047Bmw6CDLzcS/eoqrKZcjOrsnovMy+xYThBEel9mt5cbx5vLVCIkR2zTXifq2CCEmVk8DjV8mEo5tkMIFI75h3MHn3iTk6WjUCUEwUy5ZAppovCoaVu6Cg6+fO6+2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633641; c=relaxed/simple;
	bh=0x+TQgigsMY7Zo5vInAitoBgwurVCj15OQuBNIFgIDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YTgUYAWYXi/Eh72m7RfXb6NaunCCKPnBF+LvHlJEak2bnZcGXZ7B6MuTK8HFAdhuHKsxv2cHXUctOmgFeRs6FZuDjnQJXf039ZaDDqINF3KLHIGn6kG1Dzq3bTHAtNDpWCPoPprsBL7WuU824I2nRoDM9XyQY1PfLJ4XlE27tbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=he+eKYdp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="he+eKYdp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C5071F0089A;
	Thu, 17 Sep 2026 08:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789633618;
	bh=Fq6uvXzKTr0H59vtVrmCXL+SlA/QNQo+L51LJ9Xwlm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=he+eKYdpeeFskBigLfKJukrEDWQcARVCD67AXK851Bw9SgXu5VbmiywVXXYryAz07
	 91h2wSuWKr3crEeQOktzpClNoGSM0IxTve2wK3vKZAW8ea5BvN8N0lq9mazFQc2gD4
	 8zlhYB0CdZZ2AiU2mjuqEvTZ0/n0xoXoRD5yXaDqpj5Qo8NQv9DlkSKs2SlvvSOya7
	 OpoTqBrbc4NBrgb6DDFpgp7n9hyfcePFwdo3ScElNWNZZ7KUENdVP73zXQc/HfsFdo
	 gm+z+iWDGthV+wd6K4Y32tRx0+QA07yw3hPHyIFKB/x2LJFje11QewC5VeiJukGVhT
	 Bb0FnOx2045yg==
Date: Thu, 17 Sep 2026 10:26:55 +0200
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
Subject: Re: [PATCH v4 03/52] dt-bindings: clock: qcom: gcc-sm8250: Add CX
 power domain
Message-ID: <20260917-rousing-refreshing-oarfish-fc3fa8@quoll>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
 <20260914-qcom-tie-cx-to-gcc-v4-3-9d5a606ada33@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-3-9d5a606ada33@oss.qualcomm.com>

On Mon, Sep 14, 2026 at 03:47:02PM +0300, Abel Vesa wrote:
> The GDSCs provided by the SM8250 GCC are supplied by the RPMh CX power
> domain. Model that parent domain in the GCC binding so the provider can
> describe the dependency in devicetree.
> 
> Add a single CX power-domain entry to the binding and make it required.
> Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
> undervolt it.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

