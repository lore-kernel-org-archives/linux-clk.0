Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484133;
	b=ij3FglskmqZT3QraofD1qxlNqPM7EfC65F19vnhfImnYrCC/ieGmUnUE54NtSX0+o3/X
	 Un/N3KC4NZzNKM5GyCrafHMjouaa+qDC0pxTUOVii6q8+g8aE20i8Tl3CucEsRaVlIZIF
	 65XI32ZmXAeAWUf8ymD+7F+HFukIB+44W0RxFoyLnkIMT+ZORJwc2OHKobAlly6wLEnSX
	 ToQpU+2EPmZCqi9/u+slBRIdn+VOUhN0CLX6pkKDwwlNCFYe5uzViIuLNO7heR7dacWpT
	 A58D4MWicTKtYdz/RKiYEIKxJi/jZq9D1vzF5lXqxYYfKpdmwYmxE63BylFS6Ziztow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484133;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=KuwnGMggvhrzairG/sadLK4QY5/3MIRfljnkSIyXCbE=;
	b=ZdyFEmYED/ZpCH+9h9elDOPzhk3zCwuubcxWrKsCzgftxIl12IQ2Puk8NBXEnovkl2Nt
	 075Gz3gmRrwu4pQD78uTbKiv5++QbKA//owfJ9SuNo5FYPXl9ZCMrOTTu/IkbNBYJLQV4
	 xOb0X0CzUZWNIT7pv0zsv65Inyvn1jy9Ra7K3YuxS9vpVgRWy+lwVPdenQaZOyjOQgLel
	 +14aRxFF74xst+K+YLhDkBpiZEOBZL5F3pyZIze6X/IPB+n6/UwP+r2/Ra5crINLNQNPp
	 21bb9/A1AlXLX2KOM2oMp2mcxLbZMZUKDy45IQTbJISisS2YWt20CkTrq8xeqpFV8tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NzatWPQB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EC6606A319;
	Tue, 20 Oct 2026 08:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NzatWPQB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56C6C1F000C4;
	Tue, 20 Oct 2026 08:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792484133;
	bh=KuwnGMggvhrzairG/sadLK4QY5/3MIRfljnkSIyXCbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NzatWPQB0yvHb7G8/kX9EDS/Afh6HMX8Snpt5ywZ/BFj4N1QFDdOBJpNRYMhEU1W8
	 cfeS00fXzqxZTa9w5ge1LqAp+5Bpt211CXlNUXJH24IM1+24acDOKP1rtxrpb1UnCC
	 AVisGEbWEMB/AHmbArJYQ3p0L2FHEElwhdTDN4SNQfspKTFQQIIziAxDsHxdOkY1Kz
	 Dfti89xjqMGQk0TDU8UQsdFMT7o429u3LIgt12ZQF/Mh+F0MfV49/KC4SWzF59fr+Q
	 kIuMpQQfhpBXau58vrt5iMNfnNr/wsV8RpHqK+m9jUZSTxhm+ZhEMuN0aguH/ZndaV
	 WMAU9RHGibEuA==
Date: Tue, 20 Oct 2026 10:15:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Joonwoo Park <joonwoop@codeaurora.org>, Imran Khan <kimran@codeaurora.org>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Bryan O'Donoghue <bod@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Ilia Lin <ilialin@codeaurora.org>, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 08/10] dt-bindings: clock: qcom,msm8996-apcc: add the
 MSM8996 Pro compatible
Message-ID: <20261020-wise-crab-of-music-225b6b@quoll>
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-8-370949e4d8a0@oss.qualcomm.com>
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
In-Reply-To: <20261019-msm8998-fix-clocks-v1-8-370949e4d8a0@oss.qualcomm.com>

On Mon, Oct 19, 2026 at 04:41:07PM +0300, Dmitry Baryshkov wrote:
> The MSM8996 Pro CPU clock controller needs a setting the MSM8996 one
> does not, but the binding offers no way to tell the two apart.
> 
> Add a compatible for MSM8996 Pro, falling back to the MSM8996 one.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

