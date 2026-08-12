Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6E433B96B;
	Wed, 12 Aug 2026 13:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786539975; cv=none; b=HLYneiT85y/0XMwbZy3hi5eQRKNAtFgp2KmgHyg4gvkNAQNicuO6/wFvXZG4bXQAFtPjL3GgGLLCC+hl+CYvqRM9WCEHKlxc3gQ6zo5tY0Fzjab2wbOWMUKn6qO+y7A0IcEAuQNd/D5krp1O/Tg3sJC3EFW7Y5ySIvj1h0vZOuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786539975; c=relaxed/simple;
	bh=RNQAuDNlaXoJh9+WafY6aS/Em08tnJ7ortCSwiaTExw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JJrxEb7B/i50wkfFtiUDxjBYvHle4HZlgr0s1W8GiNeV3dl/Baba+WMMFpV5NOzI3Td5lYWHl21LhCwfyupQEu0cH45PmW/TuPLzoTed7tdewLVR6L4i2VlezlZbyxnMXxGpEz5PE5Xjee23LP4EEazh05zQxEfklBTIHqh3PBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TLbycEh+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TLbycEh+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59AA91F000E9;
	Wed, 12 Aug 2026 13:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786539974;
	bh=eUBGyPGJ4uiY1zdKHNy/RrcLZ1zJcmqbFvy0Xp1vTYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TLbycEh+w5VnZ6+r0AG6VZWtSd53Nzr8pE4vIfFUd8ISW02sS4vkhbo7Mnmo/IPA3
	 hB8n7DaUbYGdmBosjE9Q89V6EQiGeRcjEngj8UhrAGHcHU1UfeYMOLDPXe3Mq5YDkS
	 EZes5IllX6SAOTXpxGpLi+eTxJdzEsBEOkZEZQq5mAKUvWfKLgPBDKw8emq9AxYVo7
	 L+s6we35GKT5tZ37uus5jYoWLwZ4xtV1axId7ZiCYhZfDwDLXFAgPBAPDT4WK2lfUC
	 qZSdXhWy06zTZYYpzKF1APMn/T4WdL7CnAuMIHtQCNdyjQ5cN6azydFU81YZQ/5gqO
	 HsjlwRbzv+R1g==
Date: Wed, 12 Aug 2026 15:06:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: genevieve.chan@altera.com
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: clock: agilex: mark mpu_l2ram_clk
 deprecated
Message-ID: <20260812-hot-tench-of-completion-bee2b1@quoll>
References: <20260807035833.16198-1-genevieve.chan@altera.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260807035833.16198-1-genevieve.chan@altera.com>

On Fri, Aug 07, 2026 at 11:58:33AM +0800, genevieve.chan@altera.com wrote:
> From: Genevieve Chan <genevieve.chan@altera.com>
> 
> Preliminary documentation referred to mpu_l2ram_clk, but that clock is
> now mpu_ccu_clk and is already represented by AGILEX_MPU_CCU_CLK.
> Keep AGILEX_MPU_L2RAM_CLK as a legacy ABI-preserved ID (do not use in
> new DTs).
> 
> Fixes: 6b3c59780ed3 ("dt-bindings: documentation: add clock bindings information for Agilex")
> Cc: stable@vger.kernel.org # 5.8+
> Signed-off-by: Genevieve Chan <genevieve.chan@altera.com>
> ---
> Changes in v2:
> - Remove comment on unused clock ID 42
> - Reword commit message
> ---
>  include/dt-bindings/clock/agilex-clock.h | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

