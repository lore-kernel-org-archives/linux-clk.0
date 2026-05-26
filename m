Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCAB3A7F5E;
	Tue, 26 May 2026 09:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779788236; cv=none; b=ATT1Y2KCNLOZZQo26UYWpFQRPtuODsphUysAB0KrNIy3Da3XvMliVP+pBeqTD6l/4jFIdSbRt86uO970M/TDRyKbT6K11/f1Gukh7u3ZCIzP29fkRcTuQRgt5EeTX1RAzW1rUWkTLP4ax8V02W2fGQkC1dTNcu+BmyBopYEeGZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779788236; c=relaxed/simple;
	bh=Q6K9Nqbb4auUimPk2a4jZOoW3dw7bH59xsjfrwOKCvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UbW4/K4ecLh9zG3P88ysT0/51RiQtiXWPKRaCzLB6uKvLdbxIcfaq1qZE6ygCGDeZOAkO4t1OufG8a0vFKIjhkQ6oxD7sOl8gHFewkCv6X/o6Cza8IfqbeEdjkT5E01GQqZUahA8nK0XAHkv2Hx/IwiYuMWCAB0G4jIYJXKK/ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fvjKR2GD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fvjKR2GD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BDD61F000E9;
	Tue, 26 May 2026 09:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779788235;
	bh=7Ans3+/oH/5Uv0sR0ES4/flI6mRgdotxu4+DiwqvkfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fvjKR2GD+GDLQNoQvPmVwUD055Y5IIZpu392iLUTQPdiOYcDSjG7OUF0CIQFYWBy4
	 28KGZ+S/IFdZ5nkE3GvJvo4A6+IgF13FuNlo6KRVj9SEQ1pZFbusbkwWR+O6SPfZGo
	 gMIH9wL8v4y+35O2UeV3BGagRm5H7hLTbLo7mk7aXZ+JAscy0QeE+LtIJUbSBDmXVI
	 9hCzEXi+RdMPRmdIbl3rOq+FlSzP2F/Wp3zjLyQFqTZIES6HCITEhQyPZepUEYJioT
	 iWbY6BYQyPgmpr1lpBrRWkueJILJaqOJQiudiNIALUrg1g71ztNiHeaTLmYhH0RqWY
	 HTGcNrzmeObdQ==
Date: Tue, 26 May 2026 11:37:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Luca Weiss <luca.weiss@fairphone.com>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/7] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
Message-ID: <20260526-muscular-skylark-of-wholeness-6ef2a8@quoll>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
 <20260525-eliza_mm_cc_v2-v5-1-a1d125619a5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-1-a1d125619a5a@oss.qualcomm.com>

On Mon, May 25, 2026 at 04:16:03PM +0530, Taniya Das wrote:
> Eliza Video clock controller is on CX and MX rails similar to Milos.
> Add compatible string for Eliza video clock controller to the existing
> Milos videocc binding and add the dt-bindings header for Eliza.
> 
> The video clock controller exposes power domains, so '#power-domain-cells'
> must be present in the device node. Add it to the required properties list
> to enforce this in binding validation.

That's ABI change, so you need to explain impact on existing devices -
Milos.

Best regards,
Krzysztof

