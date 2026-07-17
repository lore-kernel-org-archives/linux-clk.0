Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779BB17B50A;
	Fri, 17 Jul 2026 01:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784250917; cv=none; b=NZ92fEBYwGmktOtoKj1emQzAEQASv/iKx24mNxSyZGaCsC20LVD3JeomcEZJNcFNyzrfyvf7Mcy8w6BlPcRcUU+trQNRmZOzx00UqBu8xyeJOY6whNKGX2hzmYtDLW2qGQi+v2zH5HkaH51okbPFlaLlZGRXcwovVU9uU2+Nl+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784250917; c=relaxed/simple;
	bh=IT/rhUvKxnUjwSTnczEX0JUrUPEt6H0YklyOCcJpNYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YnBUuk0wzVGzFB4TfPwI5LWmSnrwn1VgcjSUSzZ/Y9OQErlqoBJiIR4IW1tiRemD0Re7WGZNlmKbei7bxkmDuBQnAYvx0vOmq1aJA5G5s9XXl1jPXHFiUh94pJ5mmOBUepN5ThzTIScPTTD9tJMaZgTl7vbBlCQvMO96v9Z2Zys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R/6fl00O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R/6fl00O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53C8F1F000E9;
	Fri, 17 Jul 2026 01:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784250916;
	bh=Ms8NC8oprBVh+kGhcsMCSQTckEuQU9O/j7JwpEqpIJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R/6fl00OTNQ9ncBL70U71NKLytxHnn4SkDA7b8uxWve0TnB1VGs/Vfr3vIZE9Igxk
	 jA7/AVZeGBChTjxK0q2jM/n0uiD1nC+i7gfX7VzU5mBR97rCKP8mSFC+Xi92NBjk7B
	 0Noo34qANgciuIewns3xDuujxyAwM1Hv38SDV9+ngKdhjX1BN+lt2YR9FWtabUGjUi
	 SxO6aXbNGnsTnHzQ6CxjZ7if+PD/tmo53b6LlIXqZ3RSECtpb2kDDAm7zv8rDHVW6q
	 UpsoRIa0iCoB0Xwk/p6jyoipLv1M/jtHB9Y364F7/gdVDb0uT7/s79YN2DEjjhtE9N
	 YiL3Vld3JivCg==
Date: Thu, 16 Jul 2026 20:15:11 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Brian Masney <bmasney@redhat.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, 
	Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, 
	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: qcom: glymur-gcc: Add missing
 CX power domain
Message-ID: <almBxBhYxTR9n5FZ@baldur>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
 <20260715-glymur-fix-gcc-cx-scaling-v3-1-72eb5adad156@oss.qualcomm.com>
 <4b543abe-2482-4381-b41e-623cdf5be9a2@oss.qualcomm.com>
 <olkjcrfq5t32gvqgpcqiuyp5jhf72f4piowz6osxhain77f7bc@ggwuk4nz2ak2>
 <316fd37b-9936-4bca-8521-9a11ee65cbd6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <316fd37b-9936-4bca-8521-9a11ee65cbd6@oss.qualcomm.com>

On Thu, Jul 16, 2026 at 04:42:11PM +0530, Taniya Das wrote:
> 
> 
> On 7/16/2026 12:52 PM, Abel Vesa wrote:
> > On 26-07-16 10:13:48, Taniya Das wrote:
> >>
> >>
> >> On 7/15/2026 6:59 PM, Abel Vesa wrote:
> >>> The GDSCs provided by the Glymur GCC are supplied by the RPMh CX power
> >>> domain. Model that parent domain in the GCC binding so the provider can
> >>> describe the dependency in devicetree.
> >>>
> >>> Add a single CX power-domain entry to the binding and make it required,
> >>> matching the hardware description needed by the GCC node.
> >>>
> >>> Fixes: ee2d967030fe ("dt-bindings: clock: qcom: document the Glymur Global Clock Controller")
> >>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>> ---
> >>>  Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml | 8 ++++++++
> >>>  1 file changed, 8 insertions(+)
> >>
> >>
> >> Abel, I feel we should add the 'required-opps' as well which will ensure
> >> the clock controllers minimum voltage requirement.
> > 
> > But it was agreed in v1 that we should not add the required-opps. So we
> > dropped it in v2.
> > 
> 
> Okay, sorry, may be I missed that comment.
> 
> 
> > Can you give more details to why you think it is needed ?
> 
> My reasoning is that if a clock controller requires a rail, it is
> preferable to explicitly specify the required operating level rather
> than rely on system/client vote. This makes the dependency
> self-contained and easier to reason about. Clients that require a higher
> operating level than the clock controller's minimum requirement remain
> free to vote for a higher level as needed.
> 

You're expressing this in generic terms, can you please provide the
concrete example of what this would look for in the Glymur GCC case? 

What is the required-opps for the Glymur GCC?

Regards,
Bjorn

> 
> -- 
> Thanks,
> Taniya Das
> 
