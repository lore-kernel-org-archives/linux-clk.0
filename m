Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654DC39CCF3;
	Wed, 15 Jul 2026 05:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784095152; cv=none; b=VIXBxEJ/wXlXU3lqVWhhgo56Gj0Iy4r2xUGWI3T7p7gOrmn0Fweg+HqZkkW19V7nPkd2nFf5rwUIMsum+JKQsIRo+XWaYyRZUwhBvBLz6FMUaf8cjlZsC+c/ASB6g9VFtmk8kq3uVqvb6s/UvMg9Xroy8bjzmyIOE/MQWIcqgIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784095152; c=relaxed/simple;
	bh=7eXGKfHfoTLoeGWiYr+TKPawhgWlHSMCu/cAMNcCtww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EIDktBRgbRZULtqq2L8Lg2jhVlGHd5fZPbedkeyVoUrFXt6UDO3WOYmv5uZfmB69wjf9mg3qC3Y9gK1ppbhMOyJZFNLO9fTNaAskpjRWmthMF4iPpDZDW5lgO+zFgyQHRnbRVnIRzn9D2IAtaV4G1jte0d0vofWpNMEsH6uSj+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oq+KYvmE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oq+KYvmE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 127FB1F000E9;
	Wed, 15 Jul 2026 05:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784095150;
	bh=n0SGocToquLN1fFBmS7KLjAIRrJxEJXwbv4xjRLyoF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Oq+KYvmE5SBNjAa0lG4FN4Rwv3CPNZ93T9avUd4rPiEGNeRK+sP2xbsfk2B3HggqJ
	 4VO/FSnRP1QoCAj1hsBSg+usGL2ZsYEukkJRGAWdz27uIuNicpvaqD9dqNSWsHoxIi
	 fV3K7DOFC3qhZ3xfQbbK0aO9qxieXJJfbz9Kri0wFZ1lDILlM2+3/dvZgZ8cjc/fjq
	 ImAOHHXPR8voq0ds6AYOnivUdCdiaR0Tm6dJ64F8SvycaP8IBSbsivvo3TuFJgK/hj
	 7FPr2vkluNlKB6yQs6p3S4HwpplReqR0YnJOj/RMAys64Fs8fVkWmE63KHebWzeVUO
	 Lz+yPhahON7dg==
Date: Wed, 15 Jul 2026 07:59:07 +0200
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
Subject: Re: [PATCH v7 02/10] dt-bindings: clock: qcom,milos-videocc: Add
 missing power-domains support
Message-ID: <20260715-luminous-bittern-of-coffee-2ecfd1@quoll>
References: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
 <20260713-b4-eliza_mm_cc_v6-v7-2-4d91bcef50eb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260713-b4-eliza_mm_cc_v6-v7-2-4d91bcef50eb@oss.qualcomm.com>

On Mon, Jul 13, 2026 at 08:23:40PM +0530, Taniya Das wrote:
> The Milos video clock controller requires the CX and MX power
> domains, along with their performance state votes, to be enabled
> before the clock controller can be accessed.
> 
> Document the 'power-domains' and 'required-opps' properties and add
> them to the required properties list and example. Since these
> properties become required for the already-documented
> qcom,milos-videocc compatible, this is an ABI break for any devicetree
> using this binding without specifying them.
> 
> Fixes: a4937e974186 ("dt-bindings: clock: qcom: document the Milos Video Clock Controller")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/clock/qcom,milos-videocc.yaml | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

