Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8904348C7B;
	Thu, 21 May 2026 12:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779367910; cv=none; b=qndxQcbAPATv8s8ghaQO56EE7fQ4JdzyfefLSW0/qa7FKEz7lPFki0RSUhiGLEMsnTq3RAn+dD0+BH6kL9HjnXmePU0JZrbm8QX6HuysLbx+A/uSh0WR1PCrRE+RDBD/6MnwQJ0KHys7eOWmLSPiqtlZBi4KE84a0/x3Dw7T0nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779367910; c=relaxed/simple;
	bh=1PkKrxH0+DfnAPsKg46asegD3wTDdvReeVHY+gLgZno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B0zy4p26ihk+V2yg6rtjzqF77APdIAiO7rmyOvRQRlIw9bGgzujY9kahOBoiDcOcqABWVWA12Xhfn1fyPNGNQH46nlfYb0OVNEooSnw/4yiwK6GOJRE0GXlvMv0b03qCu7Po7D9XkpsqspSt11mWxnFJo7Ard8D3Sl9Zm+4UW/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YVSMj3m+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YVSMj3m+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 565AB1F000E9;
	Thu, 21 May 2026 12:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779367909;
	bh=fa2t3Ix+ICIlEmYv6c8T87OOWsd/LKLHM9B9C/lUzAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YVSMj3m+P734bbrXRSUcfR9z86BlmKikL7rcPD82ZYb9jpu3tFGneJfbaLdT3IdNS
	 tsbH7g1yvNiJccFYZkyA9F9xDwE/hwAP6qK+YU5ay/IGIYxBwJa3Ifqf0pNcLTVoEP
	 DQMRZePfjEEYZktHgyXHWRjEszpiE3zuE1Gvg6FZX+AvKdeaAraK2SBf7wzchPB5Sy
	 KSlfTe3lN3lFKhd6B71Ous4BJb5CVjyMCEx17724cMk0LWMnxOODUJy4tUo9ENMr7s
	 ul+62ksmPDA20Vr/6jQ8r1SGJrwgprg5Ti9sIG5llTpBU7fmwLKOJ9meoGkXpRDg0V
	 IKFGol4yI0rcA==
Date: Thu, 21 May 2026 12:51:45 +0000
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guodong Xu <guodong@riscstar.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 4/4] riscv: dts: spacemit: Add PDMA controller node
 for K3 SoC
Message-ID: <20260521125145-GKC3717228@kernel.org>
References: <20260518-k3-pdma-v6-0-67fdf319a8f8@linux.spacemit.com>
 <20260518-k3-pdma-v6-4-67fdf319a8f8@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518-k3-pdma-v6-4-67fdf319a8f8@linux.spacemit.com>

Hi Troy,

On 11:32 Mon 18 May     , Troy Mitchell wrote:
> Add the Peripheral DMA (PDMA) controller node for the SpacemiT K3 SoC.
> The PDMA controller provides general-purpose DMA capabilities for various
> peripheral devices across the system to offload CPU data transfers.
> 
> Unlike the previous K1 SoC, where some DMA masters had memory addressing
> limitations (e.g. restricted to the 0-4GB space) requiring a dedicated dma-bus
> with dma-ranges to restrict memory allocations, the K3 DMA masters have
> full memory addressing capabilities. Therefore, the PDMA node is now
> instantiated directly under the main soc bus.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Applied, Thanks
[4/4] riscv: dts: spacemit: Add PDMA controller node for K3 SoC
	https://github.com/spacemit-com/linux/commit/3f47ca8bb3c3f4a71688451a0cb7350d3e1e1059

-- 
Yixun Lan (dlan)
