Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C488B4322FC;
	Thu, 17 Sep 2026 08:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633879; cv=none; b=eJB/CRFl9ve+vulR+xHbnBvL20KizBjipc+d9QN0/PMfjlxbyzo+mFSiMSUs5Mxihv4rPE8+Zn0ErrErg048Q97jIkv5R7lAr6L2smOoJ+dmjCoOH0Zk3m2Mcc9o2fsJUy8MQNdYj1u/9ZgJA/o5jQOY7Ap1BbrMxAXGDqw1P/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633879; c=relaxed/simple;
	bh=L4SQII4zDZ9mSTyG/EfTm86E/2+Bu54hMQHHs0iAq94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pLEf2E65RVT9nmjPIXKgWRc/f6WaAD5i4RgN75cUbRYmJqzab/TDaKn8I2rHgeywFYIMzzX0FLGU6gsXng2ptWY0r9MUEN8nKmVTkzM+HAJk9poRY5+lEYkjsyNTR5NNaDeb37DXC68SokD4U7OmgGoqN+qNM92cS9Nc8GVrTis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GOYZ5UEp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GOYZ5UEp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0A561F00893;
	Thu, 17 Sep 2026 08:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789633868;
	bh=Sy68kMllL4qVZ23QsfOaQ5BM4WCVnsJr8BGQZQjvYPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GOYZ5UEpo4qVpQJN1JLz8CBpleGZY2WUsn+UBbmj2/W6ataKgCy/BsJmxLSciArlP
	 IHPNUkhu6P68swZq0zrWF9jNQgLljBhPSekUUQGc/fcZJSOe513oTPZgcEr+hkKxm1
	 f0dTLs4ZcHeS2s6TY3wwO7RTW3nJudfrn7O0nSKPKIHE31gk6/X8qvz+00ulr3qGB4
	 Y8MYgz1BGxojdfnmRQznuok0ho8KowndRNvvbeGOK5Cy/6NSgzzZ2uKjgps9GRA5iH
	 7RjC9rzJ4V77HvEcBnr01XtW7hfJHfM+x/Xm5ehmnhcr6N6wW59tObNWIh4wuCi0Ev
	 //e1/UjySfuxA==
Date: Thu, 17 Sep 2026 10:31:05 +0200
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
Subject: Re: [PATCH v4 08/52] dt-bindings: clock: qcom: sm8650-gcc: Add CX
 power domain
Message-ID: <20260917-stirring-dramatic-goat-ec400d@quoll>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
 <20260914-qcom-tie-cx-to-gcc-v4-8-9d5a606ada33@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-8-9d5a606ada33@oss.qualcomm.com>

On Mon, Sep 14, 2026 at 03:47:07PM +0300, Abel Vesa wrote:
> The GDSCs provided by the SM8650 GCC are supplied by the RPMh CX power
> domain. Model that parent domain in the GCC binding so the provider can
> describe the dependency in devicetree.
> 
> Add a single CX power-domain entry to the binding and make it required.
> Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
> undervolt it.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

