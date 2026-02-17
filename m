Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811F313AF2;
	Tue, 17 Feb 2026 07:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771314570; cv=none; b=ONWN1ACEKnsHxlHAa9ELBNKw9LbmIPg56XJtGgBU/S93SQYh2CwtZRlJIKb2nlO4A7AH39CpTPRsmZoezLlPzm6pqY7N/e1FnzdFW7aKUU2jjEf9HwjeKUu7Kl+1HaRA0SLJzpAfpZjj7Mqw70QIkJDS42RWdDYOS54mIAfUE+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771314570; c=relaxed/simple;
	bh=kYYBancBu+lFZyanAuxjxi4SoPi2qUnGY2AgwrpfAVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZfSknlIMsWYNzuPrrjmxlAe6Xqtc1GzlS85Iq6jU97vsau6TJmrEdkPajJbOACYGdqZN07AeJfTEPQ3JRMhDLWzaLdtsTL1Y/Ow+38E82Mr4Eh4GBQM4tLMWTxN6sJG/9Xsh1fTgc32MC6QQ9MLFYyXdHXEeDpIuw+HpzFQE50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V/bNmmGh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V/bNmmGh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F4CEC19421;
	Tue, 17 Feb 2026 07:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771314570;
	bh=kYYBancBu+lFZyanAuxjxi4SoPi2qUnGY2AgwrpfAVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V/bNmmGhKprNWY1Lt8qHYzZpmiiDGpyjXBPe9Sor9UqW2d9eT3FMd1JokwnteqkGW
	 kBkK72mBNWTdMGVAT1RVdTnWMg3KPPCKtO0QPwknj1OSdk7yQ3+dElaK4JCmlo3LMC
	 z4yprDA9Ugonq/pzqvvHrDGOIiJG75yeaQC/OFbAQh+E8M1c01Jx3JnrH8Zh7P2LuG
	 FsGakJbevg3YTr/hOoCRgqihgSlo1h7V7IaoSfiN2trHqpWpA8MUAnURKdC9mks7py
	 nEfGqmmJVxJEaoz+f29Zaio/MdXbfGjIwg1xzbveBXje/93JYIon7PD+8ewZIZWQSl
	 SqzEwHhqILo+Q==
Date: Tue, 17 Feb 2026 08:49:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, 
	Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, 
	mpe@kernel.org, mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, 
	agross@kernel.org, agross@oss.tenstorrent.com, bmasney@redhat.com
Subject: Re: [PATCH v6 1/3] dt-bindings: clk: tenstorrent: Add
 tenstorrent,atlantis-prcm-rcpu
Message-ID: <20260217-nostalgic-manipulative-saluki-eecf43@quoll>
References: <20260216-atlantis-clocks-v6-0-cb46d6a59c73@oss.tenstorrent.com>
 <20260216-atlantis-clocks-v6-1-cb46d6a59c73@oss.tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260216-atlantis-clocks-v6-1-cb46d6a59c73@oss.tenstorrent.com>

On Mon, Feb 16, 2026 at 04:16:32PM -0600, Anirudh Srinivasan wrote:
> Document bindings for Tenstorrent Atlantis PRCM that manages clocks
> and resets. This block is instantiated multiple times in the SoC.
> This commit documents the clocks from the RCPU PRCM block.
> 
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> ---
>  .../clock/tenstorrent,atlantis-prcm-rcpu.yaml      |  54 +++++++++++
>  MAINTAINERS                                        |   2 +
>  .../clock/tenstorrent,atlantis-prcm-rcpu.h         | 103 +++++++++++++++++++++
>  3 files changed, 159 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

