Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794575003;
	b=tN5AQrOyfAkni16joQYrDaierELMyG70HjPcwBA1Je+nvRfUTuqlqQA8h2vrYIX7hViO
	 Q72u1096fRX27lUQhawXduRlDMuQ7pBRy8g+v7q9hPNARozMH/ZO4iZ681acFY0QOFXHr
	 YCUp9CI32qWyyZqqfkwnPvWJES5r03CHlb3hXg4lLIdiYFvNSTpqfIhAyboQG8WOlWUPW
	 fDrmjdp2F/hq6C5XtUc91UawMTtsjsrZieDn4y0KkXZ2cxrk1YjNiwCH12YzKdLQAYuMr
	 RLaavUMH40Zs6qWzps5q1kvCdZ2C2csUDiyqICLUXBQ0yhNQeUiqmxHLL+JdQnjYeSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=kKBMVrrjJxWb4uJFICeq1Z/Q6PHnOrbC3VFk2e1elCU=;
	b=J1O7FaT1bdDrIPY91saa0FuQt2QMvotUN8tkvOXMfOoGP/pNZnEN9XETGFxZXrwEqVc1
	 43jdcA5TUFtWIWavKrbR5eJ6VsnwSvzFAja6Vu8cOkKn/Ov3btFgzU1VdP1W82eGevTMk
	 RV/l8rMhDXyVbUHM6I2fHUg0T8TS//xZgL4jhsa/tQopOXzbnBX6beXAZgoM7f3zTe9P5
	 CNP1491tN+MlL6mwxYG5TXNz/WCJq/+lEBX9K6N/V1cM5JOEP6cI3uaye/gXYkfXFFSaD
	 j6CtVfkyCFiC7l+LPffTbve1a4Ox/R3E1EubbrzU/7+DgMauNa5R+ZTaWvj3mhSqFuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aJ5s+LOD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444C6606A335
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 13:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 444C6606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aJ5s+LOD
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b571979178so1965027a12.2
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 05:03:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794575002; cv=none;
        d=google.com; s=arc-20260327;
        b=h33MwunjYWdxEgOGAZKgM+sRjAhVTSuXa5bbF9BpQtoQPwSY9Ayf9E/VdBUExUufrO
         SIBWefeIiDo7o+Rp06XQNYz61MKB2E1+XOLDt6v5f9Vnn6W/Z9tVy9iLUsMcEBeyXqFH
         h0Qu8foLahqtf/J7ZTb9hcG+6GHQBdqoZZj5q/hO+hC33mORAyFfciKkyrbDMpIwyY4C
         xU13bAC07smIRyQi0WnGr5UWy0+hpIqK7HA/YEMQKYVZCuaOOYg+JnbgoA4gx26SDkXt
         gJegf3Cclt3jlSA3cHmZcRvCbh908rxBPgaWrgYWo9D30xBePC53u9h+YdgFbFCXfq5U
         FVBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kKBMVrrjJxWb4uJFICeq1Z/Q6PHnOrbC3VFk2e1elCU=;
        fh=DeD3HBulbPH1Bux7Rmi17/uB1LefyxDtIF5SHkrE4Kw=;
        b=U8vQbmE2LUFEKErEmxOipJowHd1v7eKc7VgXBpTe1Co/Af8EJvl5JioAsNie7dOA81
         ZJ59X14Z5xnCjRd3hYIEfi7CTKozBXseJ0nmmI1QxSlO3yINBm8tMgdYqmHScoKoS3zr
         Iupbfv5HdcidFBmD3V64+Shc/q8V2xZLZJ9jCtqDPyd5PrcSW476Bu+i7IzSM0bJWHUb
         ivXoA6X0+HmG9hOChSCW6rbh3BfbEbUtCrKBxW19lC76DY1kHRDU7ep+FHrZsOolIFxh
         GM+/fZXMdyTKIkExL8q5ApqISGZvm4+B8GaKkZG1RWnQ7j6Bh1QDo9jKANJ0g/sS8NrK
         cskQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794575002; x=1795179802; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kKBMVrrjJxWb4uJFICeq1Z/Q6PHnOrbC3VFk2e1elCU=;
        b=aJ5s+LODrTBmRhVW9mdEBuV0ItjC6oE9WnU0EAlypd9HUuGd33Rc9jHB0ESw55qLVE
         XCHFjKB1r5N8neiJ9MkAxutTT1CFEwL1EexRpPanr+PWI0CLkLZUvTvsVvTxN6blv6g8
         rIek8Vm3FiaW4AzOw7hRkyyD2IOjQI0n1C6iMlUMin4QYzjCbRbbMm6j5pXCwSDAOA1/
         Pl//oWlOy1pK3ECO+xlcOdE532VuYbUsD54UwyDhX4HFHx0IflHDnq4yKGfDbgTzCN24
         fkcSziJ7sCoIKdYIj4YfCbDXBjw8CbH9PrRIRffFgxdKSHpvAj+KGbH5x5+Fy6yaTLdp
         oRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794575002; x=1795179802;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kKBMVrrjJxWb4uJFICeq1Z/Q6PHnOrbC3VFk2e1elCU=;
        b=L29Bo7jjgs+HBJ3usvM5YuYJEuW5Qwzsa07mZdHvwLXFNpM3NtVvzl43VJ8xnmeAzb
         agOj6DPZeUiLuJJ4Use26/aVqzKFYH/touhRrDU6qF1hR5UBwDJ+XXu87nNKUSD7kElE
         RBVOfvXIWbPrTLQydfuA0aSn85fX8fQ2JqvjZh3LCmOCVsnffO3GFThMweVeUE+RbrlQ
         A0De+zXDRlP+lHCKHArErlafw+VvSLJwttTJJYyoPB1nRl/tqtz7ctXJ/K8KjpehdE96
         PxO7X0sAF2h1h3RPOSlCdNG257zbixNaea/bRL0d2dXD3O3Kye1R2APBSXQTW2zIrKJo
         zY5g==
X-Forwarded-Encrypted: i=1; AL+hErES/fD9TAh40sZ6W8XGbzFzPBRkkj1o95mxjFc4CFl25M8RJ/vETOo+8P9PFII6sysG3RU+OEfvBwU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pVY3rLN/UQ856NSAu8JxcczAqXgw1mAKM90CXKMaya3fQh2YR
	8QLjs3OAieFTzfJVQ/LkZKdsFYhb+TUhV4hv1W3V4P8+1SzS206k2//O/WgH4XKdfaNnWu2hrHE
	HpnerxSrK5xm2lENuulOAte4UbIyefEUq83JuO4vU1Q==
X-Gm-Gg: AYBFou1+AaFuTiHdIgJTu+sDZgRW5/3I6jm+P5gCaYd7RRySS9rue0TePjce1qvxbHv
	qTuY5JEJTvf7AH/jwdac45v4g7CmqYqb0at5EN2yv3DXsSLMcwD1bTyPyg883jkIGIEzArh4asl
	S0pvFQfaCYaqaU+PZqkpCvzSb+7s3fCpoooEmXkApcWlMGvasS+ZjDv4ImJqeuVjigSQzU1bC5J
	8tIkNoO5QLmNaM5XmFQHBsHQXFxapXhtZZZD/BDSy2On1sXLe66cDaOL1YeKK08BtWE9uqbcrJp
	C6jHA/+H076y9TW7ufgTDWETs4mZLyUIHFXMFV4KdGj9aaNE6RmRu9YxEWjTHwG51PcgXr3bMPC
	F4p1SwEai55eMrNgKrWrgRJR6wH0WyujXY5lUj853zgTevmzZe+AdJ3ZTyo6G+XkceuBa8rg2LN
	KeXGGKEhpGUi+ZPmU=
X-Received: by 2002:a05:6402:c517:10b0:6b3:d0e9:2e87 with SMTP id
 4fb4d7f45d1cf-6b7c08b0a8cmr1544223a12.5.1794575001558; Fri, 13 Nov 2026
 05:03:21 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104858epcas5p47fb0f4e46302dfe01070f4cd298870ca@epcas5p4.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-11-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-11-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 13:03:10 +0000
X-Gm-Features: AclHuK8TI6TajdXfbmO4ZfXjIUyzkcLZWaP_zfTUGkQ09RFX-UNUsATe86j4dT8
Message-ID: <CADrjBPpUGoWPfmS1Ne6=KnXoGM_vc_X3510xF2zwmqKkGzms3Q@mail.gmail.com>
Subject: Re: [PATCH v3 10/14 RESEND] clk: samsung: exynos8855: add block usb
 clock support
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"

Hi Raghav,

On Fri, 13 Nov 2026 at 10:54, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> Register compatible and cmu_info data to support clocks.
> CMU_USB, this provides clocks for USB
>
> Co-developed-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Same comments apply here as for the other CMUs in my previous email.

Peter
