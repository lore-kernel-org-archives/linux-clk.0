Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15A633B6E4;
	Mon,  9 Mar 2026 19:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773085861; cv=none; b=WEN9N/836byTjHDed3+vDtOziGysevsoxH+EMSIEd7jizJdYTi/Ofz91a01oADWCUSymBA7G+d6nU0VqQONOjuKwXtyBlyRZcLJeH2++XEddqJLfuJWhcxs8+0kz7ZeMIC1tq/1NbsZc2n8GGi0yHp78yhe+chtoi1LU2RtSEyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773085861; c=relaxed/simple;
	bh=r8c14+2vyTmPlq9oGfRHCFHsPV2c0IguH1Ff9ELKtwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RiSIZ+ooVKZNe+vL/aPRNvqqdfZJx5lGdv+ozale/+fCQb8ldfZ3d2lVJ6q0fz9fXmb2+yH7OMUcS2yStQMxYeL4ro6df7F/xanNkMe5xHVflHScBK9RPerIUXagGorQo7xYWKuDclrrIDRVJCJyq6Yjx3G3zKVlZ2ZFJGIG8H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ujTEAw4S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ujTEAw4S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B9DC4CEF7;
	Mon,  9 Mar 2026 19:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773085860;
	bh=r8c14+2vyTmPlq9oGfRHCFHsPV2c0IguH1Ff9ELKtwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ujTEAw4SdMi7hxAru83WXXoqFLliRwMETzDnew/NQOGNi47FaI8sUSUDF22F3tLq6
	 BuWjAGsKG6IrMmpMbTDYUPuZQyR5FFNgJBA5UGJk4NLllWMjmgoVPW/XaKo6Hn7B0R
	 19f7sb6sl9wLOjoX0+FOwLR3GhbeUSf2vM4Vgggwla/Vc2LOquo/GQbMfO7yQLPn3s
	 v/SWN7KiHdCR0uVQ6SUNSBtmh70FYeCVfRdAiaIN7SPTqEzae9atx3taonc49K9SyU
	 SrSohYuTxV76EuJ3/Ps2PbbknRReD6MoSjak2GYuilG75sgD7pkzCxPIIfSmsUHY07
	 sXzdShm0tH0jg==
Date: Mon, 9 Mar 2026 12:50:58 -0700
From: Drew Fustini <fustini@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	joel@jms.id.au, mpe@kernel.org, mpe@oss.tenstorrent.com,
	npiggin@oss.tenstorrent.com, agross@kernel.org,
	agross@oss.tenstorrent.com, bmasney@redhat.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v8 1/3] dt-bindings: clk: tenstorrent: Add
 tenstorrent,atlantis-prcm-rcpu
Message-ID: <aa8korcqvmH15nDW@x1>
References: <20260306-atlantis-clocks-v8-0-6c9b14a4aa8e@oss.tenstorrent.com>
 <20260306-atlantis-clocks-v8-1-6c9b14a4aa8e@oss.tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-atlantis-clocks-v8-1-6c9b14a4aa8e@oss.tenstorrent.com>

On Fri, Mar 06, 2026 at 11:12:17AM -0600, Anirudh Srinivasan wrote:
> Document bindings for Tenstorrent Atlantis PRCM that manages clocks
> and resets. This block is instantiated multiple times in the SoC.
> This commit documents the clocks from the RCPU PRCM block.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> ---
>  .../clock/tenstorrent,atlantis-prcm-rcpu.yaml      |  54 +++++++++++
>  MAINTAINERS                                        |   2 +
>  .../clock/tenstorrent,atlantis-prcm-rcpu.h         | 103 +++++++++++++++++++++
>  3 files changed, 159 insertions(+)

Reviewed-by: Drew Fustini <fustini@kernel.org>
