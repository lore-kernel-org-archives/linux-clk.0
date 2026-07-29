Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291D339FCBF;
	Wed, 29 Jul 2026 06:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785306323; cv=none; b=pVb+YiHCQZR/PvMPdsHPwFbvtuy7+CUUeODiWmUPwoYCk7WRDKgaWJS/x59nC6hUfanLHm3FprQGxlMsPCzJMy91gGPWsfL8rYzua32bbpmWoK0O4IkatS1fpPtJMGvmsiIYn0oS27Mt+2eN3I42luag6VJjdc3cFMwHa+BO5Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785306323; c=relaxed/simple;
	bh=iIwHndzxHzRQnBZ5w5VhqP9refHC1NyTKivyB6K4r+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CJMw+1N9vz1JyAZxyL4mS/xJOX38JvES3pPqIvTP7PVwqkkgkneqRdOkKrQlqt+1AORKQm0/CdN1oltSaACxqXD4Y7wjCTBe1nTNNGrzpyHyHyond8t6odG0cNWBKicC2RjVu2zRNFpzOOHbq4SA/XSoqHB0HBWBiJe4H8srtOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GdA0I+IE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GdA0I+IE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD471F000E9;
	Wed, 29 Jul 2026 06:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785306320;
	bh=iIwHndzxHzRQnBZ5w5VhqP9refHC1NyTKivyB6K4r+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GdA0I+IEsh5YT3mzVZicQaUnSz64VfpfrghWmOPimeVzY3OJhMriIj2qUvU0Tre7E
	 Jtc8FA5obKBpC+pNF61YXe1WeB1TDJ8JzulJxyALEsUQFT6atq1KX3G2Sw4myBoiE8
	 pz3mTcbLyq4lnDWsT/sDT1FJ7stKd79KIaUaQqTeT+OS2aLO8HWAZrbTqjwo9hgyck
	 K1E/BxNaJk1xBgGb26wgo9v4Q5ApsupVWvCmhYunOOui1yJGTmvu8Vv8sYRlwz/bPR
	 NBi0whbtrIea+aXmguOrvNNKUusc4QHjWJJ+J2etHJ9ts0YlcSHQIYa4d75M5Sh0N9
	 F4iEMWjWKf0eA==
Date: Wed, 29 Jul 2026 08:25:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Bryan O'Donoghue <bod@kernel.org>, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v13 5/5] dt-bindings: media: qcom,x1e80100-camss: Make
 vdd-csiphy supplies optional
Message-ID: <20260729-uptight-proficient-whippet-1a4aa8@quoll>
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
 <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-5-ae811e2f0799@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-5-ae811e2f0799@linaro.org>

On Tue, Jul 28, 2026 at 10:35:36AM +0100, Bryan O'Donoghue wrote:
> Moving the csiphy to peer nodes means making the current supplies optional.

There is no move here, thus this change is incomplete.

Best regards,
Krzysztof

