Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71116466AE6;
	Mon, 24 Aug 2026 16:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787588940; cv=none; b=IHVwDcc20WfAunCAyXs9hEe4agNNAlalBXhNtPrU+w994SaPGdmSnrfAeOVhkk3SU/8GtEYUxTAENY7aUKOQR9XIwaEAHNJeJtGLiNFdsmvGiNjqqiCRr0wNoJD5lryZFLTl8dttPFsXgGEBwzsUq9VHXvg6u9FoUDBnn40DSA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787588940; c=relaxed/simple;
	bh=c8ASju6/JV1hezOE5jh1ZSoJG3jo1Q7noMkaBZ+Y0lA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i27CS5iNkjPZGiajMazriX2UF+p6Uno3dKxBGr13SHVEFhED1+p4ILDdagnoi6NL/SxvBckyNSpXZuMp693l5oI3hbCUMK6FWwGtF/fg2BXUMgc0mAnZwsq4y3JCiqaY3nS0jL1tGpIwNkKVOb0nAp8WQP4rHTiUYw8nubMoeZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V5PzVnXi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V5PzVnXi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A711F000E9;
	Mon, 24 Aug 2026 16:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787588939;
	bh=21f5r3vWIO5Kz7mJIqS6/ckHE9etTb1K4f2oNZ9+mNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V5PzVnXi2uxzqsu1/8DGRq/JVpVolVJ7rvjJZk47CRGy5omgNG6LPk6Zq05CmZVMI
	 86NO3ZsgMx0ErzIMYG4tRo5LpHW3RJSSRbERHZg2yNn563hA5305R+55kWGG1jUZDA
	 qlICQvFwG59vUUj/d3kS1JK0AtIfkXAUFEKcHoHVKqqZpmEZa34t/HjezZFfOLYjWP
	 7IZkDlFSHfwfCz22ebUvL2lAuBYCvRj84ssih2qGlerhJMBM2/IvN7+n7lFhbrNSe7
	 9HsvfeeAQb0me/HhjgJfPP4CLPCGieQ1LJpEL/4WdLi5i34r9d9s7WbD+k53Gqjlha
	 /W36/dRtBm9lw==
Date: Mon, 24 Aug 2026 21:58:55 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 00/47] clk: qcom: Tie CX power domains to GCCs
Message-ID: <aoxxR2j6s3r22q7K@vaman>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>

On 24-08-26, 14:53, Abel Vesa wrote:
> Tie the CX power domain to GCC clock controllers for SDM670, SDM845,
> SM8150, SM8250, SM8350, SM8450, SM8550, SM8650, SM8750, SM6350,
> SM4450, QDU1000, QCS8300, SDX75, SAR2130P, SC7180, SC7280, SA8775P,
> X1E80100, Eliza, Kaanapali, and QCS615.

> 
> ---
> Abel Vesa (47):
>       dt-bindings: clock: qcom: gcc-sdm845: Add CX power domain
...
>       arm64: dts: qcom: kaanapali: Add GCC CX power domain
>       arm64: dts: qcom: monaco: Add GCC CX power domain
>       arm64: dts: qcom: qdu1000: Add GCC CX power domain
>       arm64: dts: qcom: sar2130p: Add GCC CX power domain
>       arm64: dts: qcom: sdm670: Add GCC CX power domain
>       arm64: dts: qcom: sdx75: Add GCC CX power domain
>       arm64: dts: qcom: sm4450: Add GCC CX power domain
>       arm64: dts: qcom: sm6350: Add GCC CX power domain
>       arm64: dts: qcom: sm8150: Add GCC CX power domain
>       arm64: dts: qcom: sm8250: Add GCC CX power domain
>       arm64: dts: qcom: sm8350: Add GCC CX power domain
>       arm64: dts: qcom: sm8450: Add GCC CX power domain
>       arm64: dts: qcom: sm8550: Add GCC CX power domain
>       arm64: dts: qcom: sm8650: Add GCC CX power domain
>       arm64: dts: qcom: sm8750: Add GCC CX power domain
>       arm64: dts: qcom: talos: Add GCC CX power domain

Don't see 845 dts updated?

-- 
~Vinod
