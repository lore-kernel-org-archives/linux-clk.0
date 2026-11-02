Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615080;
	b=wQ6bdBTafFpe+QVc+q71bwyEsi+Qs9IGHpGBLX92q5cifdUx3d1dVwOAIEwttqqzn7Pl
	 083Z9wW8GO6gQU8rNUYAZGJ6sCA157qCV+jXcm7/qo+9XFwXXOHVRVx64gIR1z0FHJxPF
	 1Cps/Dkw+ppagGMBfBmpTAjcdDSegch/4XfVLG8Zxdm20CAljn6kHMuvJUKflxpEglh2k
	 UeuNOq4NCG5mlJ103WO41+Zvj7ENbZNUq+IYk/91oQU80XLq6nWIRu61oZinnNfq7Hok3
	 5UkEnQZ0gCFu2314tLaPFbZUTV6vdESusjlnNwxjOuYh7efr2zCDfdBHQPXgEhUWEbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615080;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=26a2YZlWRaSAPOHcTE2+5kqHdv/Otj5O8ZWz6zf8wtQ=;
	b=lK0jPHcVgGnCvhwRiOro7SzbVmUxZ7pF5QQzokepAbCGtgnIqIvRwh3iseL6AL33zxjs
	 xfT6yjPKhL3JmTUNz4CET1pzAQ6qzuIzDL5gd8ziK/G5gXIhMgz584ZP/KaLu+yDV/pAC
	 GRFyqQw5TbPeG38eE+OG0wPCgrqcaW/RP6VxOfrJy7FOTjuoNPvp2iM39JiFJDNruWSbF
	 1H7C6/DFP1yFN9vvrTjScfJtNk3uibfeyJZU/uZ0AlG+H4/36729DubBW4Q/bnO1a2a71
	 VJ0iBirffhZg4RpvdByyfFayZyMS5yA0YztmGdYPVdKitl97/Xi/OZ2qVNCvnePry/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KsdDR+nA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A6E606A324;
	Mon,  2 Nov 2026 10:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KsdDR+nA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5AEF1F000C1;
	Mon,  2 Nov 2026 10:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793615079;
	bh=26a2YZlWRaSAPOHcTE2+5kqHdv/Otj5O8ZWz6zf8wtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KsdDR+nA0Vmu1ul1ZwLcrtE04Wkx0MghFLnKiscSeN2bRZw5WNzo9qd5FBE0y8els
	 E2sKHux9JcJExeK7PmgQ18XFpHz4dMjU9+zT2os1sErYDQEb5QTmhpZ9wxMPvIUt8+
	 CCz1uKXYKJHaGnumJl3hkJygQZKBR6PCwXqrK5j0gdppmj0/BgkwBXf/1s8EYRwSAC
	 r4UpGaTUgz2ORT8RyMfWAqpiSA/uzrYRXSogsQJfK5WtdRXT+9X5LKUI/3ZCKjV864
	 AP67ELqi3EfZJwezddFIO4xPMRmvthirx9tbeCyaHaR2zTV/2a84h1E3CDAB9UZ8Qv
	 IyJD/cgfQQhUA==
Date: Mon, 2 Nov 2026 11:24:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] dt-bindings: stm32: add kernel clocks for ETR and
 STM
Message-ID: <20261102-modest-green-emu-1c0017@quoll>
References: <20261023-ups_mp25_clk_update-v2-0-398d348ea8fd@foss.st.com>
 <20261023-ups_mp25_clk_update-v2-2-398d348ea8fd@foss.st.com>
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
In-Reply-To: <20261023-ups_mp25_clk_update-v2-2-398d348ea8fd@foss.st.com>

On Fri, Oct 23, 2026 at 06:43:18PM +0200, Gabriel Fernandez wrote:
> Add the kernel clocks of the ETR (CK_KER_ETR) and of the STM
> (CK_KER_STM) for STM32MP25, with the matching SCMI clocks
> (CK_SCMI_KER_ETR and CK_SCMI_KER_STM).
> These are the trace (ATB) clocks of the CoreSight Embedded
> Trace Router and System Trace Macrocell, while the bus clocks
> only provide register access (APB).
> 
> Also rename the bus clocks according to the reference manual,
> without changing their values: CK_BUS_STM500 into CK_BUS_STM,
> CK_SCMI_STM500 into CK_SCMI_BUS_STM and CK_SCMI_ETR into
> CK_SCMI_BUS_ETR.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  include/dt-bindings/clock/st,stm32mp25-rcc.h | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/include/dt-bindings/clock/st,stm32mp25-rcc.h b/include/dt-bindings/clock/st,stm32mp25-rcc.h
> index 242f61205a9f..cef997508b56 100644
> --- a/include/dt-bindings/clock/st,stm32mp25-rcc.h
> +++ b/include/dt-bindings/clock/st,stm32mp25-rcc.h
> @@ -109,7 +109,7 @@
>  /* LOW SPEED MCU CLOCK */
>  #define CK_ICN_LS_MCU		88
>  
> -#define CK_BUS_STM500		89
> +#define CK_BUS_STM		89

This has almost three years, so you are affecting users for no real
gain.

Best regards,
Krzysztof

