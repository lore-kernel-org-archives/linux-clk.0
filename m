Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140AB3AE194;
	Thu, 17 Sep 2026 08:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633897; cv=none; b=Mj6qPgNRBfA+rALwGQCKSpjwcZhW81wiG+Vzla6AfH8DREx7gumtllDp7RhwO03T3vInWwehUCsHLA8Jt3/FYTsaIpo7gQvyQkN5XBhb6rr7SJQFsyKaUmOeF8F9ZXIAquV5aUjPhqa58kP1qrajaYh48jMS7Os0WfJ7hYphLXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633897; c=relaxed/simple;
	bh=EFCU3slXLF6wyCu5lUqFknXNpyZ/q2iPl7EvRTCkv74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s8CUcbiDHarLCKEvA4ZD3Dr1VR9w0R2tsuFTGwTekWsmmUPThhTvxLyW/JOO+KQk6DAYEMc/ZldZUnGWrYdILhNYTDrLRjC8suxPoLCXj1ZJMLxGtXYrjJp+DMZOq5wybeTcWq/WVJcyeQoG33kGUxS+SoEkyC9dhtaaMmmx5Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bfMIC04L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bfMIC04L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A65BC1F000FF;
	Thu, 17 Sep 2026 08:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789633884;
	bh=ANxejpccKcabPui2bCS5FVmFl6M7lax2nCiJAhpXUPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bfMIC04LfYIdVeWvgh+puMJgUx8Xe5yTyLRVeuk9Fk3DqojxRnJ8ej//mlgfamWKB
	 G7Gvits7Ayz7pM9D914dlpMoMeCEkuXeihmtZkhHmn/+ORFQyQHnJsYQaah5W3c+1w
	 MjEE70REJcTWfSmML5x18EbttX4xFummhCMKiRehq6B/khNdly5OjdDfqfF2sM7zJD
	 RG5XmusQ1CCpbHaBNUd62mjQLpp2BHkAieM+hVO5uDgXywZH89lYqihKep9t7yvpKw
	 3YUZa4GL/rmIQmJh0qhYzhcf0BIMPyq8fOExhUQq74R86Yx+UxLV4QPvnHNqPJpt4N
	 Y6hfR2F/f6hYA==
Date: Thu, 17 Sep 2026 10:31:20 +0200
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
Subject: Re: [PATCH v4 09/52] dt-bindings: clock: qcom: sm8750-gcc: Add CX
 power domain
Message-ID: <20260917-spry-controversial-snail-bb62ea@quoll>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
 <20260914-qcom-tie-cx-to-gcc-v4-9-9d5a606ada33@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-9-9d5a606ada33@oss.qualcomm.com>

On Mon, Sep 14, 2026 at 03:47:08PM +0300, Abel Vesa wrote:
> The GDSCs provided by the SM8750 and Kaanapali GCCs are supplied by the
> RPMh CX power domain. Model that parent domain in the GCC binding so the
> provider can describe the dependency in devicetree.
> 
> Add a single CX power-domain entry to the binding and make it required.
> Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
> undervolt it.
> 
> Fixes: 342d2a607450 ("dt-bindings: clock: qcom: Add Kaanapali Global clock controller")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

