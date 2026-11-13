Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794566083;
	b=Yooh9THJMdNh9hKiNWvprSuTNvotz2ouMk6fUvCiuPH/LP4imdkUa01fzsixv7n7dJph
	 5Qe6fkKVwmByi8WBHsejJOMCRegcOUBU7F9cfSTyQZBIpSAn7czAABUxIfxJdthE9mryK
	 SL3F4YJNjC5TMDzmYnyEp2l6soZwXq22hBw2jPWhnhHvX8o5XBG+2hth70yq0gM5pHnBb
	 kIl/evesYva9GStCLpIVSwq8G5Gf+jgnKgh+Pw8PmKJLWIzMOEotk9FU3MVL416yWJoOH
	 WQUNvVaEMsVqJWVLFvBi0UWr1Zha+cDg08S9RmkvhBV2aNjTfWnQUiutfUy9QlN0fFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566083;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+B0Hzro04HKSBx8B6hqvtXYL5NBA3bspW8TBMch595Q=;
	b=EnbCDeX8YrRe4b9dTMNeO8yrOYfU2sTdplYTrnjYtjVAvkuFAZqJcPz+0hFR5DpIef5O
	 DkMOAtEtJfgqkAQ6KX71oeAX1PB+y/rF4Evl0itQ1vyioRu9tBkQ950UX+BbE1mAsttQl
	 v2aT/W5YWtzaeEkVkXlj36Vd4h1waJoU8Zg2WvkjGQP0esDXEpPgwvhZk+RjX8NO+Q4ji
	 zzj8UkzXmdA5xww3QILkLMRoDmlsRWvjvhFEf8/qkMw19lCWe7xZAYqkb+9KtsZgL7Ege
	 9X9KoDgaIifFrXhwCbYtZS9dvPTd+MpoRaT5kUh9OQuxmIhWDw9AUq6zzQsDxFUOrOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OHBB+DH2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10D0606A33A;
	Fri, 13 Nov 2026 10:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OHBB+DH2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 973DB1F000C5;
	Fri, 13 Nov 2026 10:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794566083;
	bh=+B0Hzro04HKSBx8B6hqvtXYL5NBA3bspW8TBMch595Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OHBB+DH2cclHIMBDWicPvoSffhLVbPAOszqMC8YYkdKNptoQdDoUM5YU6kVH4snmU
	 UK4PofaA5ufGPt51BqL22TezEs84WyLl2ckwNvMImNNYVThFin8U8UUMv8QGEHIqNN
	 tfD/OkU9JOOfQW2dU8JHq9lpVL+XYJjOrtRdr1tEMQtm67PlQ0ktJEgVkxTJnI/LTa
	 36BqAcGC3Dp3v2zK4ttkW5RVzhRjE5Mzg0V3Wd0ANB9CPJBI7vD3WuJjky35sdY1II
	 2FDd3BLgdIvOIFgKQluTi9re2aRmiygyYvkYQ4qUfawpg7r9V5f9eKsrbJZ4jXI3Tr
	 P7J0lh1JsFp+w==
Date: Fri, 13 Nov 2026 11:34:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: clock: qcom: document the Halliday
 Global Clock Controller
Message-ID: <20261113-resolute-speedy-lion-ffff1d@quoll>
References: <20261109-halliday-clk-v1-0-20c3ba8be0bd@gmail.com>
 <20261109-halliday-clk-v1-3-20c3ba8be0bd@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261109-halliday-clk-v1-3-20c3ba8be0bd@gmail.com>

On Mon, Nov 09, 2026 at 12:29:12AM +0000, Stanislav Aleksandrov wrote:
> Add the bindings and the dt-bindings header for the Global Clock
> Controller on the Qualcomm Halliday SoC (SXR2250P).
> 
> The clkref_en clocks gate the reference clock from the QREF block to
> the PHYs. QREF is powered by two supplies, vdda-refgen-0p9 and
> vdda-refgen-1p2. Downstream only lists the 0.9 V one, as the USB PHYs'
> refgen-supply, and keeps the 1.2 V one on as the USB3 PHY's supply, but
> the USB HS PHY stops working when either of them is off.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---
>  .../bindings/clock/qcom,halliday-gcc.yaml          |  84 +++++++
>  include/dt-bindings/clock/qcom,halliday-gcc.h      | 249 +++++++++++++++++++++
>  2 files changed, 333 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

