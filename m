Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3EF12D1F1;
	Thu, 22 Jan 2026 16:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769100466; cv=none; b=YxzTHZYLuZUA3wCBT2MZ+Q7encGgSodZp7YXuiDYzFVNt+HK9XX/Z7a4K/AaAO65VgS9NODW27/e6HxKERzlAgoU+kwootoJNPCwEZxyaNvIKhOthr+A/txm1TCwAnm8Tj9F77wNYzczHfHlfhLTSUw51DJWnIt9D83rVs/ha3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769100466; c=relaxed/simple;
	bh=zcHw/TaRrxQh9eXMsWaG6RiuL1KfhRy0hxOrWx1EQMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XC4BxKawUksAkKrYafRZ8o2HjwuXoy+L9R9NvDkksIWM8s9FgUiUwqs3UnQIy8zrfEkrzkL/PrnYpAh+2obE7joe6giGU45PVMrTrFsO/hlthkj3mi/jVRAC3WWthZ0clwT+kCjtCPUD1qQIx0vDBojliM1WTXXBrs8mMJuyoic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EaCLPUB5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EaCLPUB5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B92DC116C6;
	Thu, 22 Jan 2026 16:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769100463;
	bh=zcHw/TaRrxQh9eXMsWaG6RiuL1KfhRy0hxOrWx1EQMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EaCLPUB5VgPg9SMsF6yGmJDYBCSWS9ojx9wg3XfN96JGkXOJgZuHYul9tmtsFppLi
	 9rwSlHSQ/lu+GcwlbHGD2vvl5NCl5QyOn3XJUHcwiF7q7KjE11iHwmkv1tVZfZ7ghm
	 +7SgA4iI42qBatV7mR0xycth2R+Eb6TbXh3LKkO4hRovKDwSKhGk3gs1YlcZlUDUzz
	 3ku8r4UOnhyNW0MzL59GkGdH3P1PAy+A0OQkvGDtQhzn180QV7xED2BuBMQpUjJIg1
	 bv5BobUCsHW8h8ktbTF4oiqHFGjes83HG9KWbQMB54ne1LFKD48rmKQfpnmexZoEuA
	 k8TilJnIv1OiA==
Date: Thu, 22 Jan 2026 10:47:42 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexander Dahl <ada@thorsis.com>
Cc: Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v3 19/19] dt-bindings: clock: at91: Remove old PMC
 definitions
Message-ID: <176910046191.2558971.11925829281212477545.robh@kernel.org>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
 <20260120154502.1280938-13-ada@thorsis.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120154502.1280938-13-ada@thorsis.com>


On Tue, 20 Jan 2026 16:44:53 +0100, Alexander Dahl wrote:
> Those were split up per SoC and are not used anymore.
> 
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---
> 
> Notes:
>     v3:
>     - new patch, not present in v2
> 
>  include/dt-bindings/clock/at91.h | 32 --------------------------------
>  1 file changed, 32 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

