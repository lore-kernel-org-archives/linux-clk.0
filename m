Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FA142BC34;
	Wed, 15 Jul 2026 05:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784095143; cv=none; b=tafQlHUFSeTySDXSWwD8KJlRYji+ngQpphtmQnD5ymgOPqhwaTmp7lftvjD4RCYC6tUxb0+5l1O6KPfCjadGncCOql3Yg2CBFrM1UdMNHYQs3/MChOaFXsPBKPq0BcEXs7uO5bYunnSMbLQ5oaUaGCy9CZhVbfB6XV3G40sWDQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784095143; c=relaxed/simple;
	bh=igucO1CbzftqvnC0p3b1s/w7vzFSFSGpHzElDHlriX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=anrYPXGtZLjMbRO98+EH2a2YUaF0fV8dFByaAoN7U+u0M0EllLucIETK1tvKsNAapkdl5UMJb0BqqDP2RQeTjC2vXeH4U/u+0CWcI2HHuMILmZjC3oj7UWEVsyLvytE+EKMqRy40Eb1RhShRQ3zgh9OFXEAGZ1eUIi/I8qUnTrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TPWIoQ9i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TPWIoQ9i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D05D11F00A3A;
	Wed, 15 Jul 2026 05:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784095141;
	bh=pjm/2/Dd4ZfLuzbgAHtKlOVzx5R3S4ZFBISKeUkecyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TPWIoQ9iGrbYDn6JQ7C3mSfqeeS1y1SPv1SXmg6VXbrt5OVz7AhxoSot9s5mv6nLp
	 CYvV8qmzOZvZLAFpTigTfcgZRMZZMifGv/bCl+9//pDkcI+DnrFDwCqykTMe/FdChC
	 9URwadkBvghO2yQDCRJBxclTSTC5U9oEA4M5ulZCxP2pGIpFRYlXkhshU+QX4mZvrJ
	 WwpOiildTfVAUuoOZutQjClOVzO6PmGSK12wcNQYB58vnBjBsNtVDWDi4VGvMQebsU
	 0DlLCUmFXAKIhV3OSuDOgLInILAinZrRBkpuTzZZyYqDi30A02mkvkFhuUFlWkVNPd
	 h8zbc3V0Im0+Q==
Date: Wed, 15 Jul 2026 07:58:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Imran Shaik <imran.shaik@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 01/10] dt-bindings: clock: qcom,milos-camcc: Add
 missing power-domains support
Message-ID: <20260715-eager-smiling-swine-8484e0@quoll>
References: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
 <20260713-b4-eliza_mm_cc_v6-v7-1-4d91bcef50eb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260713-b4-eliza_mm_cc_v6-v7-1-4d91bcef50eb@oss.qualcomm.com>

On Mon, Jul 13, 2026 at 08:23:39PM +0530, Taniya Das wrote:
> The Milos camera clock controller requires the CX and MX power
> domains, along with their performance state votes, to be enabled
> before the clock controller can be accessed.
> 
> Document the 'power-domains' and 'required-opps' properties and add
> them to the required properties list and example. Since these
> properties become required for the already-documented qcom,milos-camcc
> compatible, this is an ABI break for any devicetree using this binding
> without specifying them.
> 
> Fixes: dbb9d53b7197 ("dt-bindings: clock: qcom: document the Milos Camera Clock Controller")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/clock/qcom,milos-camcc.yaml   | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

