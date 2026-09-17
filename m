Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5289F4399CC;
	Thu, 17 Sep 2026 08:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633860; cv=none; b=bWNGXX7Dti5uxVglAm4AZPeCWEBfdZGlsrQQa2SF8V+mDFEf43/1w9utvjRQEhoQeKjBQzJeuZxyvhUGGeIRnVYD5rfSEGwz3ygQszFiku4FZ2gJDCVGOPluJ+Skr/q2LtaLn86UcDJL2+nV62OuN+MpmgrBpPICPAl+/LYY5/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633860; c=relaxed/simple;
	bh=ChPkH/f/fU3ZRoWXfvAUMN+ZZ7nUx9VmmFfngUgCCgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWt1QgEm3aExyfwUm9t9Tx0vRt3yuYEIS+KrwQl/f48IJzNwg0wgU1V+Gl1F1kdarouGVuHqgkzDE5VlYZkqg13QKbwbcEBI1OUkxYQcNSny0Td648ZN/2ba04AMzddlbhxpcehQEUnkdvO9yzZGxZjzt6Hn2UdIpn3HRdQn4yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CS+zrOjk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CS+zrOjk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF2701F00893;
	Thu, 17 Sep 2026 08:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789633846;
	bh=1aEy5TfBkPfNc/hlNK9gGquaF8vSgTgh4srFfHbm3/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CS+zrOjkE6G6VcmxwdxIsiz2blbMzcDeOXNuLfHdeuGiIvt6jlgKpEgBKwem2gDXQ
	 5jsnhYgrwC2A6Su+njr2jLtzm2f19t6Ls19r+BLL+MOW+XrPrB2e38N9LBccU9a4py
	 a0YcLqoV/bCnIEAx38lsf2Jjk2CG2sOv9k8XfQExziXYMK/ELsh+URXNSsWO2gKuvo
	 L5MigMFH1ApUBOv8uvCho7Mqjn/iCLQNJVzYGqAL/+3eJl8Nf7PAvfQn0rf8RtbJeN
	 n18QhqnglbsXlVE7oQfgV2Q3GDYKZDtTXksLZbMdPOIxvWOdAVr4ud2U4IM0Ax0NyC
	 1G/HKCtuZF0KA==
Date: Thu, 17 Sep 2026 10:30:42 +0200
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
Subject: Re: [PATCH v4 07/52] dt-bindings: clock: qcom: sm8550-gcc: Add CX
 power domain
Message-ID: <20260917-quantum-quetzal-from-vega-c9ab08@quoll>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
 <20260914-qcom-tie-cx-to-gcc-v4-7-9d5a606ada33@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-7-9d5a606ada33@oss.qualcomm.com>

On Mon, Sep 14, 2026 at 03:47:06PM +0300, Abel Vesa wrote:
> The GDSCs provided by the SM8550 GCC are supplied by the RPMh CX power
> domain. Model that parent domain in the GCC binding so the provider can
> describe the dependency in devicetree.
> 
> Add a single CX power-domain entry to the binding and make it required.
> Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
> undervolt it.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

