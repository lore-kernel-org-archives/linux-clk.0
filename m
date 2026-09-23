Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E074B4F4D13;
	Wed, 23 Sep 2026 18:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790188615; cv=none; b=AZuHZLITWL2eiKYwVIjt5KdT1jtD9lUbH/mTuJg1xaFuAJkeoG6odwL5jqR+4j72TqMzdyaMq9WOqg2tqL9Hp7ob4olhttocjkOTCjRygmq1qOGFXVmrin395v3C7/wj0hqnsfxXZnU+AExBvCRTo501XGkFKP7+F0v6JsngCgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790188615; c=relaxed/simple;
	bh=9w+NeOKF1/tpzXMRutVawDZsBVP4esvyScjjQmUReks=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SJ+EyRf4udNKvEDC3Up4OZfbCHCbuxRwh9lnA47WuRjuHdtneC4eHV6H+9LEedxBUpbSGRGCbIkMTbziOx0M9AuG5ex1Dl4OB9yKIrlo1BK2D3Kc0exwF5e9E5zPrZYaTrk7G2Wcxk8YULQe/dCnsCOflSJSWIxGey4nfvIY7LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C3TldIf5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C3TldIf5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D0661F0089E;
	Wed, 23 Sep 2026 18:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790188613;
	bh=9w+NeOKF1/tpzXMRutVawDZsBVP4esvyScjjQmUReks=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C3TldIf5ErUN7G9oKZDlsLLvoMeJBaJTl3pzUlaw0lzWWBcYR2BFjC4oeW0GwRWzY
	 6hJFC9V1GVJ+xLD3vOdPXWcuA2fVEdrh3NZSPYld0LmjPvpeapfn0ltg+JPaQ1Je+1
	 bbElxgU1C3czOZlNRDmI9kW6Cnwbd68VAWu2SmOQSdmDjEvjyLMJ6ae3kYPinIR2xH
	 F9KYnMDf/FZYdi98OnPUQ2+ieuCd+ccsM+QNLljRRHpSl777FbcYhp+Bq5NoSRIAST
	 TXEGIxO6aqal+S+dWBmPfHJul3LZ4ucDFpIGEMw0HrIC0FMtur1fpfLp8ahDb2YihT
	 cekGmkWzzA9Ww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 05/12] clk: zte: Add Clock registration
 infrastructure
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: linux-clk@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, mfd@lists.linux.dev, lee@kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com, conor+dt@kernel.org
In-Reply-To: <20260923-zx29clk-v12-5-9c243796b6d2@gmail.com>
References: <20260923-zx29clk-v12-0-9c243796b6d2@gmail.com>
 <20260923-zx29clk-v12-5-9c243796b6d2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 18:36:52 +0000
Message-Id: <20260923183653.0D0661F0089E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> The next patches will implement the regmap clocks and PLL driver. The
> actual hardware specific clock listing will live in a separate module.
>=20
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-zx29clk-v1=
2-0-9c243796b6d2@gmail.com?part=3D5

