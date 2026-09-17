Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE553ABD83;
	Thu, 17 Sep 2026 08:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633823; cv=none; b=pEYrjXqWnxHXtDO4X9VaLIJW9aP9oLgI6UkFrdNvXEgr8Q4xJP1k67ZKE15olGlsY47A0kudBfLLlN+OHKH85B1hjg1g453Sprkkm0l4tcwiCZ5coJL5lqR/p06hZffvnqvX+yTElvHLUFygh7d84zCEzjPhAYk44VcL+V615Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633823; c=relaxed/simple;
	bh=WlucRYBBz/oDvFdvMXsunLNt3JMieLB8aHNC7oLSLno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADSLc5bxu2TYE8/W7iwfAQRQbfkvKyy3LdFHzKp8oBgXfhSFY/hoCopUDny9bKkYVza/aKKJ/4ChuMRuKrTUSqA8AOKMfBXpjGjUn3Ww3hm0bngZyFcw7Ibl2P+Xp67SDHXd7DmKSKs4OcJnNEC3E7+jFo20RKOsF3bM4jLBIXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c9JV5BEa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c9JV5BEa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABBE31F000FF;
	Thu, 17 Sep 2026 08:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789633800;
	bh=8J+2bwaHo2ZMzVZlepS5vVra8W//r2zfqXstkRCHA2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c9JV5BEa1OdoAGvP1Y2n0O1KoxtAVivkNZQvJWzIva85HN7l3zcnZgKbUy/2GGvFi
	 jLLO5q9rK1nSAkBuwFc2fbCIeXIitYHGUKYfznTUhGKox8ksF7gBzQ2pyssTx9tCPy
	 8qFEtPcNFDZmIDBZwvNnHp+4CGwoY+hkX4qzj6NY+/p09EGIWHdjsw3jVxNfz5wlaj
	 0ZmEBvRE/uYQBWZbZvsUIXd76RSFaaNYvKMZXxFteYMxTaXpLj2iKtWhjn9FWbaRtS
	 MKsmAAPLlpcDOg+KPYQKZdNFeSHXMtK/fovUTSa9N6ndk2MVyFYXJ/7obVFkvu4jKa
	 WaINwXn4P/VFQ==
Date: Thu, 17 Sep 2026 10:29:56 +0200
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
Subject: Re: [PATCH v4 04/52] dt-bindings: clock: qcom: gcc-sm8350: Add CX
 power domain
Message-ID: <20260917-military-bullmastiff-of-hail-eb80fc@quoll>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
 <20260914-qcom-tie-cx-to-gcc-v4-4-9d5a606ada33@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-4-9d5a606ada33@oss.qualcomm.com>

On Mon, Sep 14, 2026 at 03:47:03PM +0300, Abel Vesa wrote:
> The GDSCs provided by the SM8350 GCC are supplied by the RPMh CX power
> domain. Model that parent domain in the GCC binding so the provider can
> describe the dependency in devicetree.
> 
> Add a single CX power-domain entry to the binding and make it required.
> Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
> undervolt it.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

