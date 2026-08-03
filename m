Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468BC3438A2
	for <linux-clk@vger.kernel.org>; Mon,  3 Aug 2026 15:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785770380; cv=none; b=URYSV/O/Av71zAkdyn8DXDTgm9c4f04Vcwd5PFEfLm1u8e4YbgFXpJ9UbqKMWwy9nh6ERe3zAL2qiePame6LKFA+7CFKz9Ff8KEzuKA1SYmknSRQeNXCFkfAoR0AnW7baCtaZwDv6mV38DyR0WLegFvo/NExMt/+TuUXIQQuml8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785770380; c=relaxed/simple;
	bh=S4/lIw01byCzq07ylvrJS1kUmYO4YWq751Wf1CZYFTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aIiGuok+xCq+E9p2Tfbd+PwvG+wKjTHWxprYcFfV/WEntOGzUQoP/XQHNi0oOlkgO1fvfVhvzGZYKYxjVroqKiCry6J8zAZABOacOFbwP3UzYhbNBCoiRZ9pFmbcw7pDbnrRVt1YctdEYfGjb6RZ/5SX7RuYdvVObu4RznCkbzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CZd8vrT1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nPwplC0G; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CZd8vrT1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nPwplC0G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785770378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mfrwFppqeJr324Y3CbSyZQEjIv8H0QwZoY4+hT00zdY=;
	b=CZd8vrT1OW76+k8W/aAdKbpAxy90VbE/IAqs6DN/LZXg65RmnGTxDruoiauk7i2pqIm6U9
	fRslYLtpfxTJOfrcvYFk7+qf94FoRcObMojnKLDZ1W5eFYZjj+YiWSsAFV69Fs96VXA4+r
	4XOamNY2zVifo+gyhWcv/4VzYIJfhwQ=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-0NMGmKWhO32Av47gX-X8lw-1; Mon, 03 Aug 2026 11:19:37 -0400
X-MC-Unique: 0NMGmKWhO32Av47gX-X8lw-1
X-Mimecast-MFC-AGG-ID: 0NMGmKWhO32Av47gX-X8lw_1785770376
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81bee860fb7so133697657b3.3
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2026 08:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785770376; x=1786375176; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mfrwFppqeJr324Y3CbSyZQEjIv8H0QwZoY4+hT00zdY=;
        b=nPwplC0GcADwh1aH7FNsy3ba5gPfSbWpgedP/ToQubNjlXEnl9X/HMMkndffhiLNcX
         ME1WfbG+Uw1S/8iALvtduixOtMGGp4ETCDP7WnjGh8QvEgNaFNIzQNB6jJ1InqGSYyof
         Ji2Z5m0BlrBh1mnVmFHW2wfjJv1Sug1ygt89aRoZxBZGPVqJX7VlcL3yokI2cJxgqnM6
         kFyMnvrl6wJED9SvcLEz2ZFOLtbKY7OcDQfnQGjEGizCW30sptDU8RtzfSHSTbQX0QdB
         uooFYd8b4YPZ1cUrBMyT9dLeqanKQ/jY6/pz68ZQehRom+Tug3L8AgNrHo4s1fIWo5PA
         C6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785770376; x=1786375176;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mfrwFppqeJr324Y3CbSyZQEjIv8H0QwZoY4+hT00zdY=;
        b=L5ukJKnZHG3FoARyANzqJSxl9faiyrKUD7ecDOgrn+NGGJfc2nSE1ijjf7M53MtpfA
         ih79cgPvEgBrgnY9AUT/h9rOaYMcneK1CUjzqQFTxaAH9BXYL59imEd1Ly4hlX0Es9IB
         z59UkxDLd9nrbpoup2VXW1Im1i60sPovIwsjVMHHFaENSZVCsipl7TOTnmHWZryJym7I
         qGx38VojWFReWeIme74qxbp5HVBHDxo4gBzETM81GPMIDFKEDh4s+UozjU/BwMCXRKI5
         dvtdVJotM9UjhNYl9GMql81uBP4Yk1w4C5ecBG2Yq+xJQflzeDk3juCHFgenz+de/ZpJ
         4OAA==
X-Forwarded-Encrypted: i=1; AHgh+Rp4lOTs+CcZuyoSsBDLBqn/f0R/+S5baz9m1XISoGl+MBZji2Bnqi8eyZ2kUCBzRUKD3Bk79pgbZv4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrf50OFKFrnDI+uRTk2qWgJkF6XgP+Yxn0n04Af4n40c2c1rO4
	dCN58EBv+y5v00+iN5rU0hzFHB5eDchnUYeaye76cT3dp1QcxVVDX3bNka5XeVnlPC9yZkAZjiw
	AIUhqpn8uPCpNSRSRfUzFFT3AhDE6P1wI1tK9sAi7hpyL3T96J0R0a3yw49X5uA==
X-Gm-Gg: AR+sD13GRtM+9FRiixXkYOxEvhmB8YF/NetdN8qqDCfvucG6g33ZrOuTJ4oPddhdYQT
	CeTwqfqBhPs6Ob9xU0KWgcqnY1v57UYHsFzMbJCYFExMtpCm9rn6DLI2VCOZD0LUm9cdEGAI982
	zzqtdjDJ41nWx4JznwPBMKm5jHBaDl5vbOkeKtICuqzBJXg0P7kBgxOAs5DTZBBmfZvscxtUYmk
	Bu32dFSX7oysaIUBrXeQsFZmRv9kMI73Vw9dA/CnWnz9aTj89sr+Uq1OOsgMEsLdG4yL+2iiezS
	XIm7QfFwNfCGOB84eqAJz2jOiUh5xnwL6tYiPUn3S3l9yXRZaDlpVyMdUGbHUB7l17obnneHaFn
	PE9JFzwRqBqq4gSazauadg9mdUGyumeY1GuU=
X-Received: by 2002:a05:690c:278a:b0:81c:a61e:6309 with SMTP id 00721157ae682-81fd4bee7cfmr133566857b3.32.1785770376548;
        Mon, 03 Aug 2026 08:19:36 -0700 (PDT)
X-Received: by 2002:a05:690c:278a:b0:81c:a61e:6309 with SMTP id 00721157ae682-81fd4bee7cfmr133566557b3.32.1785770376131;
        Mon, 03 Aug 2026 08:19:36 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf2e2b0sm55932967b3.8.2026.08.03.08.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 08:19:35 -0700 (PDT)
Date: Mon, 3 Aug 2026 11:19:33 -0400
From: Brian Masney <bmasney@redhat.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Irving-CH Lin <irving-ch.lin@mediatek.com>
Subject: Re: [PATCH v5 19/25] clk: mediatek: Add MT8189 vlpcfg clock support
Message-ID: <anCxhZEK9Rh1H4U9@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-19-ac4410697cc2@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-19-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Sat, Aug 01, 2026 at 01:21:05PM +0200, Louis-Alexis Eyraud wrote:
> Add support for the MT8189 vlpcfg clock controller,
> which provides clock gate control for vlp domain IPs.
> 
> Co-developed-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  drivers/clk/mediatek/Makefile            |   2 +-
>  drivers/clk/mediatek/clk-mt8189-vlpcfg.c | 116 +++++++++++++++++++++++++++++++
>  2 files changed, 117 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 3b25df9e7b50..d9279b237b7b 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -124,7 +124,7 @@ obj-$(CONFIG_COMMON_CLK_MT8188_VENCSYS) += clk-mt8188-venc.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_VPPSYS) += clk-mt8188-vpp0.o clk-mt8188-vpp1.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_WPESYS) += clk-mt8188-wpe.o
>  obj-$(CONFIG_COMMON_CLK_MT8189) += clk-mt8189-apmixedsys.o clk-mt8189-topckgen.o \
> -				   clk-mt8189-vlpckgen.o
> +				   clk-mt8189-vlpckgen.o clk-mt8189-vlpcfg.o
>  obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192-apmixedsys.o clk-mt8192.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
> diff --git a/drivers/clk/mediatek/clk-mt8189-vlpcfg.c b/drivers/clk/mediatek/clk-mt8189-vlpcfg.c
> new file mode 100644
> index 000000000000..cc4ebfd46a6f
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-vlpcfg.c
> @@ -0,0 +1,116 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025-2026 MediaTek Inc.
> + *                    Qiqi Wang <qiqi.wang@mediatek.com>
> + *                    Irving-CH Lin <irving-ch.lin@mediatek.com>
> + * Copyright (C) 2026 Collabora Ltd.
> + *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> + *                    Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>

of_device.h is deprecated. You can drop this one since what you need
will be provided by platform_device.h.

With that fixed:

Reviewed-by: Brian Masney <bmasney@redhat.com>

