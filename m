Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793187339;
	b=Zf3TyOPwyI/FFbi3mvLeN+fLAw2jns3ku1Y/DnefCgc98/gIkMNQkxGfm4QSLh5b0Y6z
	 VbjswZBUWA35Sw6Oh/qz0RfjRdvUBlJkBo3RMmdYkoW4AIl0kTEdPOeRSyr/ayQnT4CQd
	 DzHS3CmdLlI7Ruz7WFWQ6hq8nbjovonamtstxbnwbDAFB40GijBE1zcMtMN2dE7ZyiW1y
	 /78eVO4AR26G2dDM1vMWjUhQvtf5rhcrtpCdYpCdh7iQ5jFlGOJ7PSll7ChzK1TfJX3BC
	 9tbp9r+phiOaRq0AgGmUWh70DVYvPpMo2jjmB+yF/wI+YGCWk9fI/964YKJtrSsOZdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793187339;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=JUxgy1qRD86ZxMGDKv05wIfS/1ugnuo1jwVn/XUQAUQ=;
	b=JWPjFfiu5ZHF7oCxBewGu1zbEktkouIHgOIMcJsCovss28MjdjgKZW8stiQf+QjwbJ+x
	 NhOve2tScErWxoMPIJUhg+3D1QUn1LCaAEb7uV+1ja2+keVBgNInR7AToKCwo2Dxp3kNe
	 HY52YrzzhlkJzD7tGRZfv7XtcIywpeyJ3mJ34sZRYSjBb1oMH3WsLalpIiOSnt7sSXbph
	 w5BALj16UFmIZNW+R1ll8bgeoHzAigiyCdswrBj2fhZrDrupoYQnMuyfe7UTSONOpZ58/
	 mALwAVJfrnFs/s+qWJ+D2cq1GuR28klTwYALUR57fNybPMbVjnQmGOqq2Svqyo6+qzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F6uxqfuC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1D2606A31A;
	Wed, 28 Oct 2026 11:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F6uxqfuC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 160E21F01825;
	Wed, 28 Oct 2026 11:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793187338;
	bh=JUxgy1qRD86ZxMGDKv05wIfS/1ugnuo1jwVn/XUQAUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F6uxqfuCLgZDap3U0SMr7iZV1wNYsmDKH4ZCcjATHHDdpGqaIgaPhWk0RBnBPf73K
	 c2ZYF4UGiF7NTAjgC/mlBwmqaLveiUkmJY5g+bfH08pZuVw4dqjb0erpx0/QET8yqa
	 Lu00SmcX8Oq5nizhCVMlaFr4CxPSTeLBQtGo7j8ROcUUv4YgxBo6BcVN5De3zRL5ss
	 o2ENpAaEOD72nOfZfIqLsDdB1znBo9hKRWv6J59zgaT2zA3M7auRu2GE9OlYBxdG0j
	 1Oe7eURiqDeV1m7iM2fwdNao0ZOrtPl95oyJ8KVNGt8jp1Ad3KBiWYVq+2IkDIA1fa
	 cy2tFiu/qDO6w==
Date: Wed, 28 Oct 2026 12:35:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Robert Marko <robimarko@gmail.com>
Cc: andersson@kernel.org, abelvesa@kernel.org, sboyd@kernel.org, 
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, konradybcio@kernel.org, taniya.das@oss.qualcomm.com, 
	ansuelsmth@gmail.com, john@phrozen.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: clocks: qcom,gcc-ipq8074: Allow CMN
 PLL bias clocks
Message-ID: <20261028-screeching-magnetic-mongoose-52ad2f@quoll>
References: <20261026120920.1667982-1-robimarko@gmail.com>
 <20261026120920.1667982-2-robimarko@gmail.com>
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
In-Reply-To: <20261026120920.1667982-2-robimarko@gmail.com>

On Mon, Oct 26, 2026 at 01:08:13PM +0100, Robert Marko wrote:
> CMN PLL in IPQ8074 provides 2 fixed clocks to the GCC clock controller.
> In order to describe this in DTS, allow passing them as the inputs to GCC.
> 
> This has a benefit that it avoids doing a global matching by name.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
> Changes in v2:
> - Keep the existing four-clock form valid with minItems: 4.
> - Drop the _clk suffix from the new GCC input names.
> - Correct the NSS NoC bias clock description to 461.5 MHz.
> 
>  .../devicetree/bindings/clock/qcom,gcc-ipq8074.yaml         | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

