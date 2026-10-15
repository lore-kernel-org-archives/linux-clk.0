Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F8A3FFF9D;
	Thu, 15 Oct 2026 19:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792094319; cv=none; b=f6q7Vh159PT+K7mNAm7R+8nEpDcrr02ecmG5Ppo5qvo19aE4t3rGRpBYznJGX9kWi2xvJLAa/dmOLItEi5ytDen9b2cXruNyKSl/eJuKZAs6JRQUoALQmV/5KGGgI9CRfCtf7F3E3/iTmu//XVaiGUwkXRB52x45HXMmdSunfYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792094319; c=relaxed/simple;
	bh=nNdMYl98+1Wc8wDYhFunsKOYwYktOui250Ex+G2wpRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WBHEM+aQ2GhMSZbNvZv14C9U4IO1rMLrhcX1jfNMBCv+rgn8JBPE9ZDoHvZjJ3Dznq55zLKiWqMxlMHznIScf//co1Evh3nyN6CUA0y63987nNKNkHYzG4/W/ptsQ1dircV+EQLZREkqhf+nOvFmBbPSWdp8bLgg8FjGN7YV/xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fX3W6aHl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fX3W6aHl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AECF51F000C4;
	Thu, 15 Oct 2026 19:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792094317;
	bh=vgYtLRRnk86Yop+KAQYX5beiJrfiCUrggmu0cTQqGNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fX3W6aHlGMcLa3oDsET6A2gXaP0+oWfdUMmX3CaLy1tYJ5UCrVa/gy21T45U5gggB
	 ClSKZbmX+iQFZ/qA7bp5cigMHesoYPSIWJdNXlpigoQCL6eHpr9RX0jE6x2ZsxQlMn
	 Vsw1WxSjUJrvV3ybV55kpwZfVkuFZU66z+oTcjxN7dhLjA8+NViOqji2EbEPYTEk63
	 ypmAoCsurc6sRuW0hQBTdKoNuxnooBKf8zhwMKFS5i+ggEHUnJhKBCN5nmnZf+G5WT
	 2Ga3fhiJeu/A2u3rv7uivY//Ad5lzzRc+RJXc6tZ1zuBvVEgCuls7P0+stiSptFTFO
	 bnRUFBMlSGtnQ==
Date: Thu, 15 Oct 2026 14:58:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Jyri Sarha <jsarha@ti.com>, Vyacheslav Yurkov <uvv.mail@gmail.com>,
	Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v9 1/2] dt-bindings: gpio-enabled-clock: Add a new binding
Message-ID: <179209431408.2775745.766674131615687389.robh@kernel.org>
References: <20261015-feature-clock-guard-v9-0-c1c05a498d9a@bruker.com>
 <20261015-feature-clock-guard-v9-1-c1c05a498d9a@bruker.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-feature-clock-guard-v9-1-c1c05a498d9a@bruker.com>


On Thu, 15 Oct 2026 14:22:50 +0000, Vyacheslav Yurkov wrote:
> Add the binding for gpio-enabled-clock. A GPIO-enabled clock provider
> exposes a clock (can be any type of clock) whose availability depends on
> a GPIO status signal.
> 
> Some hardware designs provide fixed-frequency clocks generated outside
> software control, such as by FPGA-resident PLLs. While the clock rate is
> fixed, a separate GPIO signal indicates whether the clock source is enabled
> and producing a valid output.
> 
> Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> ---
>  .../bindings/clock/gpio-enabled-clock.yaml         | 53 ++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

