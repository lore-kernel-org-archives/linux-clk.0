Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EF9298CAF;
	Thu, 11 Jun 2026 08:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781166679; cv=none; b=CkQ/GM/3JB424EYdoNUyIr0QPOqnY0Juqn8sDo5QstqOSmYnWro5zIEi8QUZN44T0WZGWy/GWvakDFiCtoPRAAeQcsHxqjufjWGi+/92JpBI6Ko7Zj5vPLFR/iY/9sZ5UR6RxjoXN0CXCvYaPFIulaC3i+tkXlcxSdYb8TUsCQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781166679; c=relaxed/simple;
	bh=41zRvsZPKwcxVKCSetH4wrQePyiLl6mQ2lEku4BquFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XnIGpdqha0Ch/Pw0KI5xDJFae3BW8Ce6kuL2JhmMfQXSa0/BIaeNGRrB69EG0wImoojgjAfqREoWKntN/J3oQg9u9Ia/5dlVLfOVuuzEY6w3/KGAfUeBmdU2z6lBOExA1D2KoBhPbDd0NFtWEjRoNyH9h3HRhxJMdJK5flJxPgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FoM/J6Jc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FoM/J6Jc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B211F00893;
	Thu, 11 Jun 2026 08:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781166677;
	bh=2wA3mAVethZUS3Fda4NPPnR0q2TASx+4APnjPv6lanE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FoM/J6Jctz/EDeoT9HWxVM/6is5//fPg3O0JFg0r9o1bTknbnm+L6MpXxFgrVqqkj
	 iN9Y47qWnJWlch6VQ1vhCcRsYy+j+Jy5E0DVqmeCLj8F+pLcKx7HOO7JfWObZEhggI
	 ZOJdql9M7F6oNfIrirmTR+OW0gFu0zYZU78/+eKlYnEAshFvqyVePoPPFo9fkBCvmY
	 acgArrFBwRVpkv61Mt/n5LCIQBDj05/EDwGVZ4cdEPGXDsTPBLMOsKKrHJsitlhi2u
	 v04KKJ1EsapdQFlnem1CqA77R+dRsbmurgnyvrei3yZ/+ucaetNz0cmcr1kAcJ9lsi
	 8crEJioRravGQ==
Date: Thu, 11 Jun 2026 10:31:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Georgi Djakov <djakov@kernel.org>, Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 11/12] dt-bindings: clock: qcom,gcc-mdm9607: Use proper
 address in example
Message-ID: <20260611-unnatural-golden-hawk-f84941@quoll>
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-11-5e9717faf842@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-11-5e9717faf842@linaro.org>

On Tue, Jun 09, 2026 at 04:14:47PM +0200, Stephan Gerhold wrote:
> Given that this is a dedicated schema for qcom,gcc-mdm9607, we might as
> well use the correct memory addresses in the example. This does not
> affect the validation itself, but will reduce confusion for readers.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

