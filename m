Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795589979;
	b=37jVu15VBmfj2boSTee1hACNVlrhrWhTUIDHJEmQLFsAswRYMIz76wI5bLYboYFF6U/6
	 chuR5xHns3a3odkWylMPfHvwJMme5Nons2ptUglw0PWtv3pi6d4nK4UcwivRioUUrOaN8
	 I0dyxyHZrqRUUfv009LdVxaxIu+Difo3BZfS1RThrCvpNhahXQYr4h+wkygBsVOO/Pcj7
	 QCaU+EmyauyqDM4a8lRpPo0DKKs+bfZA1EprjJ16EP8s7k4QI4qw0MBjZUQO7BXigbm3A
	 KgQ8zEaBotLrn27/14ynhod1pB23RVRJnVquNrKQ5VBTzy85UaVSu8dh84IXGKJzB1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795589979;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=dTy4A5oNWaw39nk/sBzrUCL3BKQBUZsaTuTwdHMLM3g=;
	b=EwfmqkJ86VswAAcySwlYcvanRufis1HC9h80LzC6hXVYX5ClPHhoNFP8V17sUi6+6+DU
	 J76rYmUySGXWdKr8zCFYpz32KIFa4iIlWxj9i/htGMWd0rJ4U1/t0p0Sw+BtNLlvAAwrz
	 S/xWsZkLRKnPc7eQKwja5WEjq6rsDUnGV3g59bAqVhVLOpyWyElk/twwHd1Xjr+5U78Ne
	 sVd5b8QFLVvLMkMte5xJudLjozfVBlnLxbj85cD3QnJ0b3n8eeo1I/XI21O/3pHAhhvip
	 tYy8hDWL9woPhDdcBi4yfJFfULMQgYSfbShdGgGbBLAI0MtCRJxkF1Zhqoccoks1f+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LuETrWcr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF82D606A31E;
	Wed, 25 Nov 2026 06:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LuETrWcr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A58BB1F000C0;
	Wed, 25 Nov 2026 06:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795589979;
	bh=dTy4A5oNWaw39nk/sBzrUCL3BKQBUZsaTuTwdHMLM3g=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=LuETrWcrFkX7iATV5hH9Y8+IqAPA4Q+TSTwdEmybJrLjxZZX5+LeDHf7fmwZNX2ph
	 smmewNR+sSszmrBT9YLRspV4LxQ7uPInsn3dCj90hoxtdlpgk6DZosw00FbVh9WdFO
	 pSrt3PZT2oo47B0/EVnT/T4NUX0wMskPwuljEg0nbE293N5oiSnGdeqZXJk48C2WCZ
	 GIbGXVhaERndZN/mnhhhiSIIlx5dCqax0kngT0yyboLriG5UP/0uRKSWYX8/qwD0Qj
	 VSb3J1R1BVj0xKo/4wNnkv8S/yXbQQ72RI70WFcOr5gp/fJ0ynwXiL3cTj1NBh5Mxm
	 iL7IA6LMWQISQ==
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: Add Qualcomm Netrani GCC
From: Krzysztof Kozlowski <krzk@kernel.org>
To: SignKirigami <prcups@krgm.moe>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261125-netrani-clock-v1-v2-1-9ef014e71737@krgm.moe>
References: <20261125-netrani-clock-v1-v2-0-9ef014e71737@krgm.moe>
 <20261125-netrani-clock-v1-v2-1-9ef014e71737@krgm.moe>
Date: Wed, 25 Nov 2026 07:59:35 +0100
Message-Id: <179558997534.9063.17811518045009933157.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-25 12:05 +0800, SignKirigami wrote:
> Add the Netrani global clock, reset and power-domain controller.
> 
> Signed-off-by: SignKirigami <prcups@krgm.moe>
> ---
>  .../bindings/clock/qcom,netrani-gcc.yaml           |  84 ++++++++++
>  include/dt-bindings/clock/qcom,netrani-gcc.h       | 185 +++++++++++++++++++++
>  2 files changed, 269 insertions(+)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
