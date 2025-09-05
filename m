Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D3CC31B80E;
	Fri,  5 Sep 2025 15:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757085147; cv=none; b=SNEhiJsgO0/IrfRSzmL7W7Y/69PwMxSDmYQysdYxWGwV6E/Qa+gymKfNbBL4MccLCPgq80avGHVSQcjLDYFB2/bsRAGAsQ8KAd5UJJOizcn/YcTiIfFtBYcYLN4ej3b9JlKtCPNjyk6PwXZSJR166vDNtg6MwClefRtkbcF3/cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757085147; c=relaxed/simple;
	bh=ML78PEVwKum5qJ/ROMu6oQ0iTfTMgoFq07Lydch11QM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HxoAG9LMXwNWU8LpkUdouM2uZP/xUwfQhccQEMD3UAksy04VHNmdoJ+m+1ujh0rGY6rTTWiHufaf7sARC1QpxJbnORfV6lfB37k3h8BkhAWpP3Ng1UaR3XcX3qGOR12qgPoegS2alKpvAx+aijPnitCg+LTbPEKyT4pjACBidEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EC1C152B;
	Fri,  5 Sep 2025 08:12:16 -0700 (PDT)
Received: from donnerap (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D62273F6A8;
	Fri,  5 Sep 2025 08:12:22 -0700 (PDT)
Date: Fri, 5 Sep 2025 16:12:20 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>, Samuel
 Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: clock: sun55i-a523-ccu: Add missing
 NPU module clock
Message-ID: <20250905161220.282ad23e@donnerap>
In-Reply-To: <20250830170901.1996227-2-wens@kernel.org>
References: <20250830170901.1996227-1-wens@kernel.org>
	<20250830170901.1996227-2-wens@kernel.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 31 Aug 2025 01:08:54 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

> From: Chen-Yu Tsai <wens@csie.org>
> 
> The main clock controller on the A523/T527 has the NPU's module clock.
> It was missing from the original submission, likely because that was
> based on the A523 user manual; the A523 is marketed without the NPU.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Thanks,
Andre

> ---
>  include/dt-bindings/clock/sun55i-a523-ccu.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/dt-bindings/clock/sun55i-a523-ccu.h b/include/dt-bindings/clock/sun55i-a523-ccu.h
> index c8259ac5ada7..54808fcfd556 100644
> --- a/include/dt-bindings/clock/sun55i-a523-ccu.h
> +++ b/include/dt-bindings/clock/sun55i-a523-ccu.h
> @@ -185,5 +185,6 @@
>  #define CLK_FANOUT0		176
>  #define CLK_FANOUT1		177
>  #define CLK_FANOUT2		178
> +#define CLK_NPU			179
>  
>  #endif /* _DT_BINDINGS_CLK_SUN55I_A523_CCU_H_ */

