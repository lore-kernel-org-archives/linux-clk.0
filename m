Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50C63BBFC0;
	Mon,  8 Jun 2026 10:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913374; cv=none; b=P3GduMOpl/NrvpfS2IraZmwdQzEqiWVH61GQZzygQ3hAztYZ1XdV26QYSMUyn/Q52kdLb+f8mRj/zGklBYkt27RQ96dSUeFK/27XFLiDF0G2zvgS6ycFo2QShvvr5zAfaJ7Vp0do8inLlBJP7q+uoGnY9F4f5yniEVYrQNfBAX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913374; c=relaxed/simple;
	bh=wMDtO/cDts3xeMi9leP4OEShjXkS85yEH1bxWmue25w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=isFtJlgOWcao+ZVvr45m5zRKxD/4svEB/nwIGjkzEDqiRFkRXufK75W5mLGXVVjwzGmpp5IT1fulNAngEW66XCLmcsfTlE+oRIjYVEdzeTh4W5YNPYRa13d2I1YSfH8yrCym+jESEea/QA0XaY40ETaot02SmxoSWv9odKQCC8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EzHPUQZ/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EzHPUQZ/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C9091F00893;
	Mon,  8 Jun 2026 10:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780913373;
	bh=NpFVBiI+19HzqKpQF9wCH1KUEXst5vp7+7mzspMB+Is=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EzHPUQZ/H9mJMDvg4EteP4jYMthG5cRVZdvN+nj8lU098EMhZ8UREtBOcK2WGy20/
	 pv/cPydlRfQZH8rCX/LpDW6t18a5xzTTRIWb3IA9/y/9kM/K1YQnNHAnw0S/cBuyw2
	 5jTdHrYrn3Y6bBnsy+reYQWZar7D3h2XK2MJE+yKQLmMYjRP0wBj2HOZ4rw1AZ/ezN
	 g268Uw++nIdOKvQM1khTbttnt5nY527rDcQQn6b4p2g9lI9s08dfVaQ4eb3GJEdCsR
	 dfi0rdfGUSX7lrvfguK7OiLOi35t8ROp04aclNqKLczuqchq48d1qlU6jM+JB4yHNy
	 VuZN+dnFB/Eig==
Date: Mon, 8 Jun 2026 12:09:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: sboyd@kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: gcc-msm8660: register PLL4_VOTE for LPASS
Message-ID: <20260608-amazing-brilliant-zebu-4acaa7@quoll>
References: <20260602042747.277270-1-github.com@herrie.org>
 <20260602042747.277270-3-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260602042747.277270-3-github.com@herrie.org>

On Tue, Jun 02, 2026 at 06:27:45AM +0200, Herman van Hazendonk wrote:
> Add the CPU-side software vote register for LPASS PLL4. PLL4 itself
> lives in the LCC (Low Power Audio Subsystem clock controller); GCC
> holds the apps-processor vote in PLL_ENA_SC0 (0x34c0) BIT(4). The
> LCC driver references "pll4" as the parent of its slimbus / SAIF /
> audio mclk roots, so without this vote PLL4 is gated off when the
> apps processor is the only consumer and LCC clocks silently fail to
> enable.
> 
> Expose it as a single clk_regmap with clk_pll_vote_ops and append
> the dt-binding ID at the next free slot (258) after the existing
> PLL12 (257), so DT ABI for boards already using the prior header is
> preserved.
> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
>  drivers/clk/qcom/gcc-msm8660.c               | 15 +++++++++++++++
>  include/dt-bindings/clock/qcom,gcc-msm8660.h |  1 +

You need to slow down with your patches. I see so many similar issues
and I don't know if I already commented on this or not.

And run the checkpatch finally.

Best regards,
Krzysztof

