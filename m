Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C793323A564;
	Thu,  8 Oct 2026 19:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791488725; cv=none; b=t5TapmbXr/cJb/Kq15cwS/ohx6zdwENbLrzV8edO+DuxHpwlGJvGztfpxXDC/mVfsdX3ZYP6pwdJRpNACTjfX2JutW8Stg8PhHTGj8lQ+iqlpaIYfM1PUhwnY4FaATUIxcxyloWHUe9WPEHr9jWyiQccVNNu5AbVaUbrqA+UnOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791488725; c=relaxed/simple;
	bh=qeBDuOLPnJRgQQ7lnyTa2F1k4QdfLhbKZJaJCsv1Avc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZjBLO9I6Ks0t5uPmTET7oojofhfmjCmwSrR/cA0UanNJ21fpbyomWkj5vAp1fiz8EJa7vBS+DGYZzLFGp5PYVqY9zZDy/SEtGA/xLhrXjE3DUKBWG+e7aFZ0Xxyvqva9QuSDbFMZDYeTWr4jnBvACUUp4gh29yC8EyLGqiwzG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C8rdGlwC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C8rdGlwC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 272CD1F000FF;
	Thu,  8 Oct 2026 19:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791488724;
	bh=6JG8CvzJDooEK4ayo0U3BttE8lLPOAe+Xb4fe5iSuhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C8rdGlwCx3qmAzHPjkIviPaWUo92BYn/WcTaxcWP5to9Px0as84FkhszIZ3zxoyss
	 Bj6Cqh7Y8oA7s/BPaaKQmDWlkm1jMgCQunW1x3v9FWcS3qQXJsiJkN6BtvZOE3Mv8u
	 +swPgZXr7/ThpoHeOZMPXXvriaVCpEVc9LTh37g39kR6ma+5k9x7pAX2UajZYIFHsl
	 wfYYU280QIg3T67TaauwnZa1PeGYSHwdmJNIWX2SdPjo0Ix79NBGVn/TOYpvpJOGBn
	 V+6nGELskAiMSW/QIGaHerAZpdQVfd1u1Iv3zczNkF4sjry+e5sHMAfdYgCJO171IF
	 o+89tKK7+1qNw==
Date: Thu, 8 Oct 2026 14:45:23 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: qcom,sm8450-videocc: Fix
 clock inputs for Glymur
Message-ID: <179148872289.890655.9478332445299082105.robh@kernel.org>
References: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
 <20261008081036.3492003-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008081036.3492003-2-shengchao.guo@oss.qualcomm.com>


On Thu, 08 Oct 2026 16:10:33 +0800, Shawn Guo wrote:
> The schema describes exactly two clock inputs for every compatible it
> covers, a board XO and a video AHB clock from GCC. That does not match
> the video clock controller found on Glymur, Nord and SM8750.
> 
> Per the hardware documentation, the controller on these SoCs has three
> clock inputs: the board XO, the always-on board XO that feeds its PLL
> reference, and the 32 kHz chip sleep clock that sources its sleep clock
> generator. It has no AHB clock input. The AHB clock the controller uses
> for itself is generated inside the block from the XO input.
> 
> Because the schema stops at two items, the sleep clock input cannot be
> described in device tree at all, and the second item is described as a
> clock that is not routed into the controller.
> 
> Describe three inputs for the Glymur, Nord and SM8750 compatibles and
> keep the existing two-input description for the remaining compatibles.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8450-videocc.yaml   | 26 ++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

