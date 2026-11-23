Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795412167;
	b=VSyWZ5mbBATNI86VjB1TVq4Dxa9CnJGDPFSPVzyOAHozE54E0SdYWV3WhwDRMPLgf0/8
	 h1M5CBxq0LDpgclxHm5Iu8j+ObZjed4QlE8G5VdLib2A68epr7ItcG+Y/HJykq85nPdFK
	 LGmwK4x0Xj+Bddiq14akrjB7x7K6TE/096mwVLKv6kHPECiTr4PZWL31OcGG9P6+QHAMR
	 jKNzJeM0HdakgEnfLPt4lH46q+aMqSr8snjGzkZIh1QfuZTnlQNsP4qkovWbmIsacN3GM
	 dWCwFN8WuopzaePNHpKLu/ga2kSmU1nw8h0euGvwsT/SZWxq9Vhu1meiYNa0vtSDOYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795412167;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+Riw0vs1nf/qVwCWA8fCZHdXL/m4S1HemudqRL6ityo=;
	b=JsdCnP8dG3mLcK35e7PsCNebbbtIRyOpv8cKFfXS1UcgA+0zyKiYpwC3gmRatQNh4/3V
	 qYmNeP3kJdO+QCH3VLcNUixkus3X+Nf9hdT/fmBr4vuYqoUSs9vNN9+SB9cBet578XfVc
	 ZXjIbBW/+SK4AodUSnDRog2U0XE43JCfw4a2WvrCC20NvEE5LlFUMyYeaTrAJhzrLLO27
	 q6fu2PcuVCpVy82Rs9naVq2hSBV0KU0F8KLlk/tL0nr2cwLOxT+k74nix9ja3P1+2sbTl
	 AQDjW5VpopuA1PCCEY9YbGn+qvQEgxpLJtI0JtKCaCDXE18VkieCyA/HIs6AD4Rlexw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TQrWB8KI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FE2606A321;
	Mon, 23 Nov 2026 05:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TQrWB8KI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92E8E1F000D1;
	Mon, 23 Nov 2026 05:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795412167;
	bh=+Riw0vs1nf/qVwCWA8fCZHdXL/m4S1HemudqRL6ityo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TQrWB8KIdn74BkH/FuJVbAmfFRlWg+t+SYgScG5xfdkhnQRwAr5MoPDUjreUwaWOh
	 lI4fZMnTh/mbV+vt8Giot/37Wk7IL0XAj9dQFrI7KUotzhGlTuzuCmKdQldrXq/g0y
	 1bO0UGddAE+XrFRzpTAno91RNLL+0g4Y5RvxcdcRZtocL7y29gIUiFWT6eBbmDfIJ6
	 Qnn7HA7exT00nw5PU30R2EO8rQNTgVSb6/IUw7xEUHzKUH+fnFOHcczKlBMrVTtmQX
	 6JF0K41utOvIm9eEsFmjF55HwzoXtr8HZr8OJDnu/OMd9sApIjT5objev6pYrrDw2B
	 Jr7QhJihPMC2w==
Date: Mon, 23 Nov 2026 05:36:04 +0000
From: Yixun Lan <dlan@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Alex Elder <elder@riscstar.com>, Icenowy Zheng <uwu@icenowy.me>,
	Iker Pedrosa <ikerpedrosam@gmail.com>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: spacemit: extend to support pm domain driver
Message-ID: <20261123053604-GKH100890@kernel.org>
References: <20261008-04-k3-clk-pm-aux-v1-0-8372d7307694@kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261008-04-k3-clk-pm-aux-v1-0-8372d7307694@kernel.org>

Hi Jerome (and Stephen, Brian),

 I see you start to collect clock patches for SpacemiT..

On 02:57 Thu 08 Oct     , Yixun Lan wrote:
> The APMU (Application Subsystem Power Management Unit) register region block
> not only provides clock and reset support, but also the pm domain management
> capabilities, so registering pm domain driver via auxilary bus is feasible
> way to go.
> 
> The series try to extend the CCU driver to do some preparation for addition
> of pm domain driver via the auxilary bus.
> 
So, could you also take a look at this series? I'd like to see them
included in v7.5, it's a prerequisite patch for power domain..

The patches should be ok and still able to apply to v7.4-rc1..

> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
> Yixun Lan (2):
>       clk: spacemit: rename to generic ccu aux register function
>       clk: spacemit: register pm domain auxiliary driver
> 
>  drivers/clk/spacemit/ccu-k1.c     |  1 +
>  drivers/clk/spacemit/ccu-k3.c     |  1 +
>  drivers/clk/spacemit/ccu_common.c | 16 ++++++++++------
>  drivers/clk/spacemit/ccu_common.h |  1 +
>  4 files changed, 13 insertions(+), 6 deletions(-)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20261008-04-k3-clk-pm-aux-7376407466ac
> 
> Best regards,
> --  
> Yixun Lan <dlan@kernel.org>
> 

-- 
Yixun Lan (dlan)
