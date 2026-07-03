Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D936360ED2;
	Fri,  3 Jul 2026 06:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783059227; cv=none; b=jekqIg+nUu56o4Sde7y/fZd11dTa1IlsELtBqbY7FOIJREongqDYu+3e6maTeiGqhpBWVviQJsy7/pnjHWJHs7OSz1Stj/C2eX882YAuJPsFM5SLWTXMnGw3VQDNljWAvCmxRmAU4RYp0DeraNO7buEWirp3E8gjl0/IbGBV5pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783059227; c=relaxed/simple;
	bh=O5Sqat20pR99jmXYpzNxDmTwrHZC16o7weAUmsncRvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fno680FWu0hgtlpObittuSq9p0dsAqC82KM2jEPUk+uqAsc93Eh/450xnvBlfYZ71ErI5/2yaVP1OS5CmPQOiM60liG4pUUQiqVmrwG+ostx0vEXnV2z6rnHYQyZzbqtFp1/Wh1uOTYjJvfMDvsGB/4+ll6DeLsdgciwmGldUXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KqMsMRET; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KqMsMRET"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE9991F000E9;
	Fri,  3 Jul 2026 06:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783059225;
	bh=O5Sqat20pR99jmXYpzNxDmTwrHZC16o7weAUmsncRvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KqMsMRETHhNJI9wsxXBa5kskYrsVe2jxF5WjDocYOH8o+60ZpPj6yHEX9p+sDekaj
	 3pI4oSXLL9Cl+xEMmLsWNtCG18amcgFsZT0AED3zlOiGlKur9YbVXeyj4mBB58NkC/
	 x/aEGO5CRih9YQ9SSFCEvJM7fTJjg79rTQ63mgawVhf6ucDVhYzzZu3FTrpli0NpBx
	 ZLXMa50ea+uax6OErEOQ9vmM8CFYNM1dR8xXy4amCxRjEuVdG7YPMfdmQPiZoJ7Hbg
	 lB5hY8CD0kXCiMPoqaowyd+03tZUjF3HKtcRvnbRaf3oOoxBpIwRnYG+Hx6XHyKVE7
	 dOATYXBQ8cL9g==
Date: Fri, 3 Jul 2026 08:13:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 02/19] dt-bindings: clock: qcom,qcm2290-dispcc: Add
 DSI1 PHY and sleep clocks
Message-ID: <20260703-imaginary-quokka-of-resistance-c06e8c@quoll>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-2-cc13826d4d5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-2-cc13826d4d5a@oss.qualcomm.com>

On Fri, Jul 03, 2026 at 12:01:24AM +0530, Imran Shaik wrote:
> Update the QCM2290 DISPCC binding to document additional clock inputs
> supported by the hardware, including DSI1 PHY byte/pixel clocks and the
> sleep clock, alongside the existing clock list. These external clock inputs
> were missing, so update the binding to correctly represent the hardware.

This sentence repeats the first one.

I asked at v5: you need to provide reasons. I understand the clocks were
missing and what does that mean? If everything was working fine, while
the clocks is missing, there is no need to change the ABI, right?

Best regards,
Krzysztof

