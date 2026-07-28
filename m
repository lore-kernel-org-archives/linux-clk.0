Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEE02D63E5;
	Tue, 28 Jul 2026 14:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785249890; cv=none; b=jc+B9yQ+qYytebabm/QB7Nm4JHvauUsKFxNrLZcMRK3QTrtHFiMPMqHMcwGBtjJVNh38gvX+Idp9aHJj+WeMN2vU1Xzu/bUgVFuKAHFNF49tt3YlWyU1g+pIWq1uw80Ye/nqUVdbJp8yqbGlHxDZX15xGx8Sy8BVi2EeJlfnzm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785249890; c=relaxed/simple;
	bh=kOhmCqaxZODmZk6btdTA2PVU+CUzyU0gnkLKTPQAlNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eL/4bMYDIW/71x2iqYr/fZtWkifdP22jO5N+7CL/GPFBFZc8yKWwSHYa7A7vqDjueR4UxvoJkwOAs3lwIomqhHtWxi0xf440WOmZ4kbYscsNZDe5dWpU9GVOeZFa0ht3n9CMNUtN4f9exDkO83Rue9B6Y9dYvCvjkaX8DiIDtdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KO/zvN8U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KO/zvN8U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5551C1F000E9;
	Tue, 28 Jul 2026 14:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785249889;
	bh=Ce5ER9Xw9t9EopKeTVZ+aHMj4IN3bllc8/wVi2v+V1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KO/zvN8UK0A62WaFsM/6njVFWvccitglsZXd0JGCSV1o+hML8VEF9pO//K6+2ZJGE
	 r5nwFnWupDA6CnYuWetbTdv0yY4NYnWJKTJeLjwkyBrheXeqBuIj6W+OzQXG6i4vYD
	 QCHbVViFzpivK8p8jZ/PSB1pz0MSYZyN9qNzF454nKMhk9trIKvSMDFoeJPy4U2jDU
	 fixcLYrr828ipT6y49LGP93XUUL+wN07Kicnsu/d6y3g4ey0ViMUz7r/tMhNDmN6qz
	 llRI6Ivml/TyPJ9Mnd1IHNR4dtMtd0pyyIlBIS8l+Fwk4CSkdjxN8yLOjYFYqlDXoH
	 tbchRyzKWKwVw==
Date: Tue, 28 Jul 2026 09:44:48 -0500
From: Rob Herring <robh@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v13 4/5] dt-bindings: media: qcom,x1e80100-camss:
 Describe iommu entries
Message-ID: <20260728144448.GA2141274-robh@kernel.org>
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
 <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-4-ae811e2f0799@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-4-ae811e2f0799@linaro.org>

On Tue, Jul 28, 2026 at 10:35:35AM +0100, Bryan O'Donoghue wrote:
> The original iommus list included entries for ICP and BPS/IPE S1
> contexts. Only the five S1 HLOS stream IDs are required by the CAMSS
> ISP hardware: IFE/IFE_LITE read and write, SFE read and write, and
> CDM IFE. The remaining entries serve other hardware blocks which will
> be described in their own nodes as support is added.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

What happened to krzk's reviewed-by?

> ---
>  .../bindings/media/qcom,x1e80100-camss.yaml        | 26 ++++++++++++++++------
>  1 file changed, 19 insertions(+), 7 deletions(-)
