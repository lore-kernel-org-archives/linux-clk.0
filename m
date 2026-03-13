Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E69331205
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 08:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773390297; cv=none; b=W23ugTkBKAHOUotG3HjEfxB4bOhnfaI8oGl4xRXOsG2+eghHCziUwAfaORFmWNXEjDxgcJJzNxDlS5Z+VMCx7yWY82H7ZkwMUXsyELS2HmJCm2uY5ojv4v6Bc5dzsS5Xv9GOT6YX1JotDg/uDbiIoJ69+LA0Ey4B/NF0H9I5Hcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773390297; c=relaxed/simple;
	bh=Kz2uYE/5b4RvAtR78O5uSHk+fVEOXBZ4m1wmdq/HOn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EGSdhlNIM39ixUUlJfmJ3S2yR1iq47/RMBvWcKdXgAsC/4axb2hcfqusUL5YUJR8Rp67FET+d3ObS5dRfkAfsNZp5WyH9eXKgpJI5luKifOfPbixOg4sJ2hzOmNMEdIMZUW5oz3GaFcxdxJtw6jsbmwsKUIX0KmJhlu8jKASzyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f4mcPNYP; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f4mcPNYP"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48374014a77so19874505e9.3
        for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 01:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773390294; x=1773995094; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hAFGGUj97wUgKBI4E0D3p+1miO3lf4NeLxQAlqvBWVs=;
        b=f4mcPNYPMdMzAG/osFlHDQESgJKjEJtpCNApsIoxyvMjFblQQTIdxAb+eC0BhH1nAB
         ABXaeKuqb6yMVs0rKhA9DNz/5Mvu42/SLK7PQGr/13+nLPzssEZX/f3yRXwHqngJBwaQ
         igIcjQmaI0Iw71noXpgQps2AngcXVEoTO0ZTFhcvIr/YttC0F8nZIFYVF9wKY91TpaOx
         chJ6vaVDon8URiUGEDBVeuDjN/a6XawmX/LPPIBcoE8axp4AAoIgbSqCD5cWDBZAPgl5
         ApNQsNiaEz9jH+yHrJ8aH9AI/VTA6tys82U7SFWPF6RLg/mYkqgmkcZOFRWsNYoIIWzq
         qLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773390294; x=1773995094;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hAFGGUj97wUgKBI4E0D3p+1miO3lf4NeLxQAlqvBWVs=;
        b=Ewed4YhMsbU2gAF8s92iXUAncaBf0okwgGKll4MBvvibALiaAZ11JzyUlrjOooBw+p
         OR8ZpIOpJr2gNXYyjjykmw6hzqHO+R7HDPBP31SJdhv+TA0PRE+XQSTUG1pbBCkFlw3G
         OPTmiAQKQdDdfg9iIVE22eed8eKc3daMXfj7+Vdy5tbFq/h0vsrUgumKl3Zd5hLpnStZ
         1n0Z08A0ktMiYku/ApqWDbEUSu1anCr7SWtG5S77a+FFjk8c8NUhwnr3RNFAjOFB5GAs
         tMjIQ4bcjVr313jK0oBWvmYLO/s6v8/j3R06qfH1vO3dSV/MI3AhDJClQFXDEktQpOtL
         64YA==
X-Gm-Message-State: AOJu0YzE4nwu252G0LRSWw1z1un/2/UMespgbwRAR/hNmj0XUx+EP5ae
	+wrxt9gKhEbAl5dAEjk6wgd6A43yxVQS0O1YYtCyf2t5RL2L9WmIlEfM
X-Gm-Gg: ATEYQzzN3B7Me3iqZF4bXchRGWLsi7DdcC880bO2QOrhF8eFiu9qxHOA50DLmov2WW8
	c6W8PX05EdGDD6o9H5+JtOLkJoQ1OzFQTe71cGse1AIibd3bE8HY8Lot9CBnrDom4Gdz0Tn+jxb
	FpSbq3vLZB1UhpVvXim7kKm5a/9Dxnn7xCNsVcs/b5fUn7QvT2RpybfNKMZ68pPvAYGygEtAlxC
	BJL+mq04Pzj4ab359Ea8p8IAR5ceM7/1x+3eTFQIj/Yxxu4Q0J2JKO72hEh3NQZb4UXB0PHixpB
	RfijUINYZakh2pIJJbWP3ON3nIOfkwjpCgHd3LK6zaonK8nr9aKG3dxByHeISbrggSJYRfqv1HU
	twruBMw2YHn1wEvfiCMvRD9vqEQt3xM9Z44DwxV7NJBHFKMCPue5pBBLtBsXGfRmZvRjiGtHYlt
	Cy1sPY5Y9w4HzGuMv9gaei8t5Y1cJFGUHtHOGm1MtNXF+8PfkOTbTYIc3QyGrKcj6jtlVBkW0l8
	NdF3BKx6ZnsIx0KKkB8q+bOLLUETEgU16bm7T3B7V+BNRv5jkIV3ErJc/qKy8y28lYLTA==
X-Received: by 2002:a05:600c:3492:b0:483:c3f3:1dad with SMTP id 5b1f17b1804b1-48556713589mr34343685e9.34.1773390294105;
        Fri, 13 Mar 2026 01:24:54 -0700 (PDT)
Received: from ?IPV6:2a01:cb08:91f5:5e00:f7a6:cd23:3f76:a7e? (2a01cb0891f55e00f7a6cd233f760a7e.ipv6.abo.wanadoo.fr. [2a01:cb08:91f5:5e00:f7a6:cd23:3f76:a7e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b65fd3dsm194645545e9.10.2026.03.13.01.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 01:24:53 -0700 (PDT)
Message-ID: <7d1c36ba-2699-4b33-8343-8e0c74fcfe59@gmail.com>
Date: Fri, 13 Mar 2026 09:24:51 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/3] Register the STM32MP25 RCC driver as an access
 controller.
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
References: <20260210-b4-rcc-upstream-v9-0-17ca1db7613f@gmail.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
In-Reply-To: <20260210-b4-rcc-upstream-v9-0-17ca1db7613f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

On 2/10/26 8:32 PM, Clément Le Goffic wrote:
> The STM32MP25 RCC peripheral as an access controller is allowed to know
> whether the clocks are secured or not.
> The STM32MP25 RCC peripheral knows about the clock secure configuration
> of all non RIF-aware peripheral.
> In parallel all the RIF-aware peripheral configuration information
> are known by the RIFSC peripheral which is already an access
> controller.
> 
> Changes in v9:
> - Rebase on v6.19.0
> - Add Gabriel Fernandez's Reviewed-by
> - Link to v8: https://lore.kernel.org/r/20250924-b4-rcc-upstream-v8-0-b32d46f71a38@gmail.com
> 
> Changes in v8:
> - Use uppercase for peripheral name in commit message
> - Add the '#access-controller-cells' property to the RCC in
>    stm32mp231.dtsi
> - Link to v7: https://lore.kernel.org/r/20250922-b4-rcc-upstream-v7-0-2dfc4e018f40@gmail.com
> 
> The v7 is a subset of the v6 and other prior versions, split to simplify
> the review and merging process.
> 
> Changes in v7:
> - None
> - Link to v6: https://lore.kernel.org/all/20250909-b4-ddrperfm-upstream-v6-2-ce082cc801b5@gmail.com/
> 
> Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
> ---
> Clément Le Goffic (3):
>        dt-bindings: stm32: stm32mp25: add `#access-controller-cells` property
>        clk: stm32mp25: add firewall grant_access ops
>        arm64: dts: st: set RCC as an access-controller
> 
>   .../bindings/clock/st,stm32mp25-rcc.yaml           |  7 ++++
>   arch/arm64/boot/dts/st/stm32mp231.dtsi             |  1 +
>   arch/arm64/boot/dts/st/stm32mp251.dtsi             |  1 +
>   drivers/clk/stm32/clk-stm32mp25.c                  | 40 +++++++++++++++++++++-
>   4 files changed, 48 insertions(+), 1 deletion(-)
> ---
> base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
> change-id: 20250916-b4-rcc-upstream-8a8ea3af6a0d
> prerequisite-change-id: 20250916-b4-firewall-upstream-dfe8588a21f8:v8
> prerequisite-patch-id: e4a708d9c6df5725c9598fbd2169636e4e7dc46b
> 
> Best regards,
> --
> Clément Le Goffic <legoffic.clement@gmail.com>
> 

Everything seems fine here, does anyone is able to take it ?

Best regards,
Clément
