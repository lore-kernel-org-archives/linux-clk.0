Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228313;
	b=XxAb75mR/gBuY4ZyXpn4BUMWjsvsvxnii/Qdi+SfY6LpIdU4z8U+m68IoV0QFPaBf4gp
	 HDEb1rhfFuotPPZhwWBTR517a/0O1mjgil1HDIdX05RRfWXyMxR8uZ4xWTwiC9hCw5rTH
	 lz4EvYJnG1FPNK3ZqCV+yvwkYT1DT3ozsliwZP7HjiLOkgmdf3ez+p08iv4bk98Hg7B9/
	 38Jju8NH1jaqrsI7y34XYRLVT2DhbSbanhgPVKqryxtyf7DWAT/8tKah+Ap4H5W2zzQq5
	 PzJFG5WkvIbVKpIGCl330kGlFupqcot9YDvyWxpDx/i7Z6w7UmDsHEbqcjH8zaxM+ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228313;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nTPNm6/ecfFGptRE0F9JYGdHuIgCJKlZMaafSyas4uc=;
	b=Vm9qh+7JDoH3a330SlsrGysU06ugzliQb2zCj5wVpc0oCNKlecxY4OmWUdHL2nN/9gsk
	 ZlWDD9TtZcCqufwDT0MGQpbrlCGXjMhhuyyZJF78GkpZtXFqb1oQe3fwLbjRK7nx0FlfG
	 Qx/VauFHXo38koFiCGsvvFaPiXsZ63JqvS80EXfO1rurM9cnJEYOCbyVq71itkpAcG9h9
	 r/JTg/NKK4euYZvLZ1oP0jzK+frMUSltk+us7e8KCiznjM3u4KyFhoM9xAop/OG35lMOM
	 GmaGUqb95tcQ5Y2NiQheG5WuK/6gIlc/lgtGEyhdk++9Y5JR9ijkCdjhwYQrasgl/Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AhhGIBMq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4902606A31C;
	Mon,  9 Nov 2026 12:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AhhGIBMq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6503E1F008A1;
	Mon,  9 Nov 2026 12:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794228312;
	bh=nTPNm6/ecfFGptRE0F9JYGdHuIgCJKlZMaafSyas4uc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AhhGIBMqqBAF2ELBm0SUBs7ce9eGHWkC4v8Z1LgrbcaBUgmAczLX7stxlxUeCqVwJ
	 DyUIWlordBZykEI74RwgjVa4+e0ISzKE95yiEFaNPua1Zlo2YV5cYBCpqCRuIG82ua
	 MD+gUqCPKGIlOkc9JMXqwnJnHPemrdGpYPtOciazs3AGS7U+2VXRWpYyL0FyVlYIFs
	 Lu5XFhsheHBgctoKHq5qE4Iv7az3/nRqtXgbmaf42erIRD1osq4njdmwk0Y05A0PJC
	 XHEFPf9zsrB2otOKZGsiCrrzOVuhI7ZaLIeEajJPpUxwz8sT4TFl+LFUOJdUEg5WsR
	 SV00c2pYQ4XWQ==
Date: Mon, 9 Nov 2026 13:45:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Conor Dooley <conor+dt@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sm8350: Add camera clock
 controller
Message-ID: <20261109-elusive-whispering-swift-faff36@quoll>
References: <20261107173621.3538964-1-vz@kernel.org>
 <20261107173621.3538964-5-vz@kernel.org>
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
In-Reply-To: <20261107173621.3538964-5-vz@kernel.org>

On Sat, Nov 07, 2026 at 07:36:21PM +0200, Vladimir Zapolskiy wrote:
> Add the camera clock controller device tree node to SM8350 SoC dtsi.
> 
> The camera clock controller PLLs are powered by MX rail, CAM_CC_PLL0
> runs at 1200MHz, which requires SVS_L1 level of MX, while all other
> camera clock controller PLLs can run at SVS level of MX or lower.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

