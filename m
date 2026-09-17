Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6D83446AD;
	Thu, 17 Sep 2026 08:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633986; cv=none; b=XAcNbQz7I+7zNZCKsBB/WBjvxXvcERlQ6tcEZ0Af7DHG2AfHKLAbQvJys0ToUtRWWO5wlIpu8Hpiv6tRKLQ4Suz2LC+ZtgNrhiPVPGbVQ0zQ7FkoubMUhxJbLI6Kxv4+XvY6u62WnLAjvJZZ5j9meiSK5+wSrePHWXD+/cbzRbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633986; c=relaxed/simple;
	bh=rwCNwMAUxcHoq/DHRR4muy1ja9wj4fHCmk7n3IBuerU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cmi7nOwRLlry6/nFDVhkIb8d9Gl667B53fpaOnbKWcdABY39q4wJw1S1Ahrk68HVvGY8N1btS66XNNvlr4xp3zQHmQLGUpKmoHYnELSTfBcFwH8C0DPl8E9dcNo/iFsnXk4deSkN5F2W8IBEyu0xidhaXBNS/2YhZrAeXwyO9QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I+Da3UD2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I+Da3UD2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D1571F000FF;
	Thu, 17 Sep 2026 08:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789633976;
	bh=f71E8Sz/bQUAXEhcv8HNhlyDl4r/YqtURmTywCuOuao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I+Da3UD27UdowHEezCrg/N5ypLx60/P9/ma/ByLzsBBJtnP9WNuWSRqzw7DqrGBeN
	 rPyeV7CXVwQgw3MqPp9MXgrYuqcavj+eiH+PX1YeUOZiXUhkzCzHHd8usJ/5AVyrrM
	 slv9TtkyHSE9tC4s3nUoCxl78Mp+y9D2y7IiAR51mx41wlnTQiUspsMiCmRNvwycUe
	 qvPL2FeVrAcK+vWTQ1NYqzEktJiw9MMD37Rv2d2z+FMMOjytlDdPEMxChg/LUWCb9R
	 1BTyJnjzJXIyGkm0nU/JIGTw+aQe+LmDQZni/WXik7KnxnAAan5TenL5nwS+WxPymb
	 HF7l4fYotOSgA==
Date: Thu, 17 Sep 2026 10:32:53 +0200
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
Subject: Re: [PATCH v4 14/52] dt-bindings: clock: qcom: sdx75-gcc: Add CX
 power domain
Message-ID: <20260917-sly-amaranth-bear-949eca@quoll>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
 <20260914-qcom-tie-cx-to-gcc-v4-14-9d5a606ada33@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-14-9d5a606ada33@oss.qualcomm.com>

On Mon, Sep 14, 2026 at 03:47:13PM +0300, Abel Vesa wrote:
> The GDSCs provided by the SDX75 GCC are supplied by the RPMh CX
> power domain. Model that parent domain in the GCC binding so the
> provider can describe the dependency in devicetree.
> 
> Add a single CX power-domain entry to the binding and make it required.
> Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh
> may undervolt it.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,sdx75-gcc.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

