Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3473BC666;
	Thu, 23 Apr 2026 08:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776932747; cv=none; b=biojeOfD3WXLUA9TOk41R+hB0KPZwFd4ItMz9Qi7iktV2rtOIzHUqGSdlcDt+dCMWUPX1IENc6/W8D/QuhLOeOz9jwgJDTkhn06hbp/Dj+1uH06PE4+XV2IIV6GsRu9XzfHhmP7YzkDNPvRqzLxdt243xkEgnA7Qi/M1gFuWYIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776932747; c=relaxed/simple;
	bh=0X74V7H+pwt1yufHZZxU9S2hEGqV3FIJD06Ew30t0y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n9yYPlQywQdxDFxkLjzM4aGwkpIqBoF6yU4HDfs0/jlw8QxyFdMeAtNbxSwXvI0DPlw39y6HR8usYn1ZfBmr6YV20kAitJLz3A0o/EinjPSO6PdMOEIkX5K9xdRZywjFVrRgRufdNtCsv1Pfs1YXUTGnvnwEle4ZtiTuTRY5VRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cD06hpK3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cD06hpK3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 466EDC2BCAF;
	Thu, 23 Apr 2026 08:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776932746;
	bh=0X74V7H+pwt1yufHZZxU9S2hEGqV3FIJD06Ew30t0y4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cD06hpK3NyW29I/r9kp6UwkQK1Rcr7eABKExeCO0U3W3+0wlUSh8DxhSYtTRFWMl1
	 9d4qlq8pEMxu/9Rg8J+XBy573pNCdAJT/al6Z5YljJ8ezyb2ab0lRwpa+VFr/LB8y/
	 0yAVaQKDmk+pwwZlQqX0So5B8xauMySlP1crG8ZsT3fckD+8EG7kFlvYF8rnUcL1R0
	 ByZ2qjneBGkFpC1vGL1SuQHjn1gTGj5PPQFh8LYOzhORjHzt27JtCKiPAYPmtLRDoi
	 Ut8sjxAWwU62woBg2IFbGuhFM26SdCgFiCnOiGy1xGeCwvw28B8xcewnqTJlIX9ZQx
	 cGQLyxYWQegmQ==
Date: Thu, 23 Apr 2026 09:25:42 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC 2/2] clk: scmi: Add support for two #clock-cells to
 pass rate rounding mode
Message-ID: <20260423-pompous-hissing-tanuki-16c5f6@sudeepholla>
References: <20260306-scmi-clk-round-v1-0-61e2a5df9051@nxp.com>
 <20260306-scmi-clk-round-v1-2-61e2a5df9051@nxp.com>
 <20260422-huge-kiwi-of-tornado-4fce89@sudeepholla>
 <aejUd6L1AfbsflxR@shlinux89>
 <20260422-satisfied-rough-mongrel-aabca1@sudeepholla>
 <aelzO5W2HD8zAgxf@shlinux89>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aelzO5W2HD8zAgxf@shlinux89>

On Thu, Apr 23, 2026 at 09:17:47AM +0800, Peng Fan wrote:
> On Wed, Apr 22, 2026 at 07:51:03PM +0100, Sudeep Holla wrote:
> >On Wed, Apr 22, 2026 at 10:00:23PM +0800, Peng Fan wrote:
> >> Hi Sudeep,
> >> 
> >> Thanks for giving a look.
> >> 
> >> On Wed, Apr 22, 2026 at 02:14:56PM +0100, Sudeep Holla wrote:
> >> >On Fri, Mar 06, 2026 at 02:20:13PM +0800, Peng Fan (OSS) wrote:
> >> >> From: Peng Fan <peng.fan@nxp.com>
> >> >> 
> >> >> SCMI CLOCK_RATE_SET allows the caller to specify the rounding behaviour
> >> >> when setting a clock rate. The previously added dt-bindings header
> >> >> defines three modes:
> >> >> 
> >> >>   ROUND_DOWN / ROUND_UP / ROUND_AUTO
> >> >> 
> >> >> To enable device tree clients to select a rounding mode, extend the
> >> >> SCMI clock provider to support "#clock-cells = <2>", where the second
> >> >> cell encodes the desired rounding mode. The default remains
> >> >> ROUND_DOWN for backwards compatibility with existing device trees.
> >> >> 
> >> >
> >> >Where is the binding update documented ? It's not in 1/2.
> >> 
> >> This was missed in this patchset, I will fix in new version, if this
> >> patchset does not have big design flaw.
> >> 
> >> >
> >> >Also if it can be static in the device tree, why can't it be
> >> >autonomously handled in the platform firmware ? I think I know the
> >> 
> >> Linux passes ROUND_DOWN, SCMI firmware uses round down for clk calculation.
> >> 
> >> >answer for this but I want to make sure it is a valid use-case and
> >> >gets documented here as part of binding updates.
> >> 
> >> Per info from our video software team.
> >> We have some video modes where the best pixel clock rate is slightly above the
> >> nominal rate, and the default round down rule (CLOCK_ROUND_RULE_CEILING in SM
> >> firmware) can cause the resulting clock rate to be much lower than expected.
> >> 
> >> disp1pix = 96200000 Hz (desired pixel clock rate)
> >> 
> >> The MIPI DPHY cannot hit the exact frequency of 288600000 Hz needed for this
> >> pixel clock rate, so the next best DPHY PLL frequency is 289000000 Hz. This
> >> corresponds to a pixel clock frequency of 96333333 Hz, which is slightly higher
> >> than the nominal rate of 96200000 Hz the video mode specifies.
> >> 
> >> Setting the VIDEOPLL (disp1pix parent) to 289000000 Hz should divide down to
> >> the adjusted disp1pix frequency of 96333333 Hz, but here is what happens in the
> >> SM firmware:
> >> 
> >> quotient = 289000000 / (96200000 + 1) = 3.004 => 3 (notice that the SM always
> >> receives the nominal clock rate, not the adjusted rate)
> >> 
> >> If the rounding rule is round down (CLOCK_ROUND_RULE_CEILING),
> >> quotient = quotient + 1. Therefore, quotient becomes 4.
> >> 
> >> disp1pix = 289000000 / 4 = 72250000, which is nowhere close to the target of
> >> 96333333.
> >> 
> >
> >I do not think this is the correct interpretation of `CLOCK_ROUND_DOWN/UP`.
> >
> >`CLOCK_ROUND_DOWN/UP` should apply to the requested `disp1pix` rate itself,
> >not to the divider choice in a way that forces selection of the next integer
> >divisor and produces a much lower output clock.
> >
> >Here, the requested `disp1pix` is `96,200,000 Hz`, and the parent rate is
> >`289,000,000 Hz`. The achievable child rates nearby are:
> >
> >`289,000,000 / 3 = 96,333,333 Hz`
> >`289,000,000 / 4 = 72,250,000 Hz`
> >
> >Given those options, the firmware should be able to round the request
> >autonomously to the nearest supported `disp1pix` rate, which is `96,333,333
> >Hz` (`289,000,000 / 3`).
> >
> >Under that interpretation:
> >
> >`CLOCK_ROUND_UP` would permit choosing `96,333,333`
> >`CLOCK_ROUND_AUTO` would also likely choose `96,333,333`
> >Choosing `/4` and ending up at `72,250,000` does not look like a meaningful
> >rounding of `96,200,000`
> >
> >So the issue appears to be that the firmware is applying the rounding rule to
> >divider selection rather than to the resulting `disp1pix` frequency.
> 
> User requests 96.2 MHz with ROUND_DOWN semantics, expecting the closest
> achievable frequency that does not meaningfully deviate from the request.
> 
> Firmware evaluates the parent rate of 289,000,000 Hz and computes:
> 
>     289,000,000 / 3 = 96,333,333 Hz
> 
> Since this resulting frequency is slightly higher than the requested
> 96.2 MHz, the firmware, applying a strict `output <= requested` rule,
> rejects divider 3 and selects divider 4 instead, producing:
> 
>     289,000,000 / 4 = 72,250,000 Hz
> 
> This leads to an output frequency that is much farther from the requested
> value.
> 
> My question is: if the firmware were to select divider 3 and produce
> 96,333,333 Hz (only ~0.13% higher than the request), would that be
> considered a violation of ROUND_DOWN semantics, or is ROUND_DOWN intended
> to select the closest achievable output frequency rather than enforcing
> a strict inequality against the requested rate?
> 

We can change the driver to default to ROUND_AUTO if that helps. I fully
understand the default ROUND_DOWN is not good but if firmware can't handle
your use case with ROUND_AUTO, it is firmware issue.

-- 
Regards,
Sudeep
