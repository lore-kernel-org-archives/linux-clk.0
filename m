Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A774582E6;
	Tue, 11 Aug 2026 17:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786470209; cv=none; b=fTTxXiooUgYEqDO0n1qvvNXA5YPGGAagkB66LCiqy78JSl2oxmzlo0Jy8yy0IcCg5TEsgnPc59dtqfUnsLN7YRq22yE9a1SePXG4rlh14eb96oPsQPIyQm2U9Edc/3xvYfv2+XvwUNJ3K5gUDEPTJMsfxCbDLIH+uaGYy6rZDNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786470209; c=relaxed/simple;
	bh=DbOh/J5kFMoLMuxHKLcoTwo9BA/36bkTV20B7amTNWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HocRsAhlvgeymccrf2IxnF/Ld0kocUpoZ+Xjcw2VB1OFC1dby7QKhf6YZBcaQpcJWwrRe5fjgRVmIymYNAJCmu+t2Dp2KgNaS4vXIuJ+s2UgFWUrwze51C7iGLl+G/6nSSuBPEqxxFBuxAZlIUHWZPT2PAF3BsIU+Bn5nFBltAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q24Fv/cq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q24Fv/cq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFD6A1F000E9;
	Tue, 11 Aug 2026 17:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786470208;
	bh=k2o5YiftEw0gy786buBMPyypJ5RPwLJ2gyJgjWXUMQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q24Fv/cqFpS200lBErSiNRB5Jtl0+wlD6jVpnMrxy1q3hLyBQM03XZBZTwQq1B8Y/
	 AeY/JRIPPkwXDNueLbaQBXIQo/U8EaBwtAQVNWemSp4y2Jl6KvqbM/Hn33bVFTxDn1
	 t+ZCxtOdnL5mPmM8vQl9n/qYCotrCbXOSQS8Pk0wPIHk54PiEVwTaBFkebNyMz9rxH
	 RCF0xgnxnG6vupIYGWLQtf2y6202S19sC9CVd48zHSDmxicUuWZvetx2gaQBQcSryY
	 mF5cWlkkmoJgNoHxHoYUTiGuzC2yIJadreFfH6/OcgZ5+KQadUYCziw5qclf9ab6vu
	 1UdxG6Csp1W9g==
Date: Tue, 11 Aug 2026 12:43:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>, m-chawdhry@ti.com,
	simona.toaca@nxp.com, Brian Masney <bmasney@redhat.com>,
	linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	daniel.baluta@gmail.com,
	Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, goledhruva@gmail.com
Subject: Re: [PATCH v2] dt-bindings: clock: ti,DM814x-ADPLL: Convert to DT
 schema
Message-ID: <178647020673.2704979.1826697343782815818.robh@kernel.org>
References: <20260811-ti-adpll-v2-1-f578b253bde5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811-ti-adpll-v2-1-f578b253bde5@gmail.com>


On Tue, 11 Aug 2026 00:07:37 +0530, Bhargav Joshi wrote:
> Convert the Texas Instruments DM814x ADPLL clock binding to DT schema
> format. Add 'clock-output-names' as required which was missing in
> legacy binding, as the driver (clk-adpll.c) mandates it and fails
> probing if it is missing.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
> Changes in v2:
> - Droped description for items clock-output-names
> - Dropped extra example
> - Link to v1: https://lore.kernel.org/r/20260726-ti-adpll-v1-1-86f6fc936507@gmail.com
> ---
>  .../devicetree/bindings/clock/ti/adpll.txt         | 39 ----------
>  .../bindings/clock/ti/ti,dm814-adpll-clock.yaml    | 88 ++++++++++++++++++++++
>  2 files changed, 88 insertions(+), 39 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

