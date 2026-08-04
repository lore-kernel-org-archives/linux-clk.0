Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714332C027F;
	Tue,  4 Aug 2026 07:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785829769; cv=none; b=Zp2uf1BmLbIeXz2btuoSES4U+ZPvOK1DdAVxEMhvQVdsYWwY4HkrloJegIQT4v4PEbk85XC3gkdSuwHBmcgdfC04wPfZ6QLV60YFDL3ccXB32P3NplW5gxukwj/kuUGLSARSBMe6OwIyBcqg8dhW37ejRNtxuAsCazv1ScypeBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785829769; c=relaxed/simple;
	bh=hZwkU4v4ZgiZYw7xukxF2CsRmRDO+ILQy+qfT5G5aYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fQk7GmXLBzyYUzGkxu/tuhqLmx4pZc+UULI0UEM936iV1zpuVpaupBmbm9dvFPgzUcv1mrnJGPb/JS89UZkzBC4YvFxAxcEITttwMPWmG5UbVSFdeTuQBXjTA0pERAe/bQVe/T9FCVWp/UcJGdLVNn2ICHYNkUTC5P6ofpFk/QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nZZbY807; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nZZbY807"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24E8B1F000E9;
	Tue,  4 Aug 2026 07:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785829767;
	bh=09V/+Tk+VUYyHEsKIEpjSsvjFczTBQklJUtW8tDxN40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nZZbY807QBLDeIGpVjtLhBD3Qim0BG2MP7WgzB1rl8HUQ82njtk7SHKnNbVs8KMO6
	 xPfAcSgHJZiyRj61ezzMmuD0bzOuip+yu/ER+uKkpSO4Dv5hhDZKEUCrR/iuGVV6WZ
	 i9whdXo+kaydNrgQrafA88PeqFo+qEar+8hfxDZdJkhnlDNUyr0em6Z80fW/KcluXL
	 x6IPZJzKYFU0Ubur5A5rm+6YYQMJOCF4j2FgQ7TQAROpZhEZ5sBjMzNx811yALSP0t
	 ClNjoHmZffJdYRALvcOZkxB93GVt1eYJ1JFGJVbJ8ZQlbmVEY7kRniwVpKDGkxKFyS
	 Zj0uyZllRTn6g==
Date: Tue, 4 Aug 2026 09:49:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: genevieve.chan@altera.com
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux driver reviews <linux-drivers-review@altera.com>
Subject: Re: [PATCH] dt-bindings: clock: agilex: mark mpu_l2ram_clk deprecated
Message-ID: <20260804-excellent-electric-yak-d2de63@quoll>
References: <20260727094926.1124-1-genevieve.chan@altera.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260727094926.1124-1-genevieve.chan@altera.com>

On Mon, Jul 27, 2026 at 05:49:26PM +0800, genevieve.chan@altera.com wrote:
> From: Genevieve Chan <genevieve.chan@altera.com>
> 
> Preliminary documentation referred to mpu_l2ram_clk, but that clock is
> now mpu_ccu_clk and is already represented by AGILEX_MPU_CCU_CLK.
> Keep AGILEX_MPU_L2RAM_CLK as a legacy ABI-preserved ID (do not use in
> new DTs) and mark clock ID 42 as reserved/unused so it is not reused,
> keeping all existing clock IDs stable for DT ABI compatibility.
> 
> Fixes: 6b3c59780ed3 ("dt-bindings: documentation: add clock bindings information for Agilex")
> Cc: stable@vger.kernel.org # 5.8+
> Signed-off-by: Genevieve Chan <genevieve.chan@altera.com>
> ---
>  include/dt-bindings/clock/agilex-clock.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/agilex-clock.h b/include/dt-bindings/clock/agilex-clock.h
> index 06feca07e08e..de7a58a06651 100644
> --- a/include/dt-bindings/clock/agilex-clock.h
> +++ b/include/dt-bindings/clock/agilex-clock.h
> @@ -44,6 +44,7 @@
>  
>  /* Gate clocks */
>  #define AGILEX_MPU_CLK			30
> +/* Legacy ABI ID; do not use in new DTs, use AGILEX_MPU_CCU_CLK */
>  #define AGILEX_MPU_L2RAM_CLK		31
>  #define AGILEX_MPU_PERIPH_CLK		32
>  #define AGILEX_L4_MAIN_CLK		33
> @@ -55,6 +56,7 @@
>  #define AGILEX_CS_TIMER_CLK		39
>  #define AGILEX_S2F_USER0_CLK		40
>  #define AGILEX_EMAC0_CLK		41
> +/* 42 - reserved/unused */

How IDs can be reserved? These are implemented by drivers (abstract IDs
not used by hardware), so how driver could reserve it?

Best regards,
Krzysztof

