Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741154137BC
	for <linux-clk@vger.kernel.org>; Mon,  3 Aug 2026 15:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785770199; cv=none; b=P6wuw1B790Of06JJyhlVgdxFoNBPSCn7meqwkVYVmwPHiYXie4O/Cd6u3vUnKVfk2ALLNzB5cmFTrnlOExVOvQxeqwSIip+AV2K+cNOxLaRzlv2kSczhNGSFZZNhpVlbyuEe8QwT1pKxdl3+f+JWFi+JKnB1IPOipShCOlpLlqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785770199; c=relaxed/simple;
	bh=ryf0iFj9gPEiTE5nfUzCyEHn3MXXGaHhAdPI4KW+ekw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n7xhfWGN7wAh7g60QAc2/bgWOAGdOB6UrPvsKO3cfZM1s/i+vtK3aCxCH6CotwGhd31RSwErlqE4oW29EnbU1ZJd4CzLFvzYvmLRUlu9Nosu66xJ6XH9qyx72DOVRLo304JmraPNWTTA5WHQgxQE9Z96VrNRGKpLzY3clFVZpzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YoRmznah; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kV9nyRCm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YoRmznah";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kV9nyRCm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785770197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LTxJzMwyKJ+KE+3ACQJ1eEMl59YLw7vdII78uf288/s=;
	b=YoRmznahHgVvJLwCC1FKemRXACc8VsDnlG8pKECIRFdj117hBkZkY9SxMm18qT34DQIWwo
	P4erdZSE6zcgg6G0Oyuomb0FBcU62Pt8yG4WJMsRMJm59cRnmeRGtZJ+t7o8CQm75BocOz
	dr9jxLFE7ynqKQFhOX7rWbZlXf+UbMk=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-241-V9pafO9QNeuSdlx95v7ykw-1; Mon, 03 Aug 2026 11:16:21 -0400
X-MC-Unique: V9pafO9QNeuSdlx95v7ykw-1
X-Mimecast-MFC-AGG-ID: V9pafO9QNeuSdlx95v7ykw_1785770181
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81ebb5e11caso115622717b3.2
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2026 08:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785770180; x=1786374980; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LTxJzMwyKJ+KE+3ACQJ1eEMl59YLw7vdII78uf288/s=;
        b=kV9nyRCmGkoA69YKZtEUDS1Yip+CTuczlyJDIFdyZVSa9HyI7gbuHQB7sFTqKIjzf4
         jwI4sPZ6Tn3iJJLhGjgS/Kwz61p10bpuyMjOP45Qh3ESHvQhhpiIrd2R/20DjAu9/lbb
         KwCvI5Gk5tzEkPYP1t1nK2Z2UGDNJrz8QjXWG30Q2gZZU4PpHqVqjKPrNaDof8w0ENlJ
         wZZNNrTGrVOp+o3csirR9bdewoXD1CkHbcwA5/dpFSgOVOOhCOj913HRAu5ez7iZXs9K
         oIZeJ3b2qLqtr6bpMEbCWNLE9v8zaSiITeoAc1ak5xgLsG7q0n1s9oz3nIH7o5FHVWgA
         i10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785770180; x=1786374980;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LTxJzMwyKJ+KE+3ACQJ1eEMl59YLw7vdII78uf288/s=;
        b=LEqUYTxP8/SWZsVSOioyE7zFQbDREGgunJ/GZFXxyt7w7IDyy3fcrgq+4l1Zfq0jbZ
         KLLIPzJA3CmvwcZB4OXWAST060JVtbB3Qm4ZBsWXplMPcf15szufvPey6wzgGDFAAFpB
         EqAlkda2GK6sCt1gXK18exaBnfmPsofCjWMIwTcwlyAJQfPoQDt8A2i5/cgy1xz01Wvc
         T3b4/x6U1/HZVBQvi5CCALWg3qW7NHGGCmAZ6zuC2hIXZ6nxQcNGlXLr/CGg1LtMmC/p
         9Z6fjSjDhAuMemermsD6buJn5pGmKG+9MmNkicr0Jti6JZ1ciPhugrznhbk/Fjrq5+5R
         AZrw==
X-Forwarded-Encrypted: i=1; AHgh+Rr53VCf4p5JqOGJyZaUaz6E0ahzcfhcMuABONUtWVueHJISe9+v2uL7dpmPT8AqsU881oO2VV1/JdE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBoQjv/x26+hTEwUj3nnZnRoArfnO5KvvEbtzlCwo8JlLx3srE
	UGE2XVNGUjGX3xLz3/IBOzWjPFLYRGBqKBeJoTC5JgLpy6K0jbBke8UegtuAvxN1HpHNZzdg6D1
	DXknOqD6kw3Mj23VR+wYw0vrF09pSmGyTSgTs/txkVbiwUaLpvItWNAdvj4rxGg==
X-Gm-Gg: AR+sD12pVeWVfUm70ee4C7rRCX54KejttyoHqKSy2zysluf0fPvprG107K/v+pRHWmj
	gG/PrkCrh84qFusVg6+CadZS4lRJoCRfmAIuLFN6AURVUo6Js4keLBlJPQu8QcvehQWWcsqPmyn
	HcFTSVA+MTDdtmATcaxXzCI4QHsOhuYQ3VqRu5cCTlKka9Z2KVv+REuSIggBwKNl/s3GFUcbW4s
	CpGZkV7WD7bHF+wJZVau0oQ1hhMB9dS3jMy7v089wnv5zahwNyWe9PFv9iXe8789Exoq1qPlIwd
	FjlQIINF5FB/2K6JSiy1K78oQ/bgrr9hkRxk0QQZNDHFIegn++yvnECsfup6LVtVcMPrDJOSBx8
	kut85lJpeAMPH6FbbErlX/xRWt7PxwkXA1OU=
X-Received: by 2002:a05:690c:6e0d:b0:7dc:aa85:5c67 with SMTP id 00721157ae682-81fd4ad3603mr135326917b3.11.1785770180466;
        Mon, 03 Aug 2026 08:16:20 -0700 (PDT)
X-Received: by 2002:a05:690c:6e0d:b0:7dc:aa85:5c67 with SMTP id 00721157ae682-81fd4ad3603mr135326267b3.11.1785770179868;
        Mon, 03 Aug 2026 08:16:19 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd123dacsm56520997b3.39.2026.08.03.08.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 08:16:19 -0700 (PDT)
Date: Mon, 3 Aug 2026 11:16:16 -0400
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
Subject: Re: [PATCH v5 17/25] clk: mediatek: Add MT8189 topckgen clock support
Message-ID: <anCwwMRMYex2_eSN@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-17-ac4410697cc2@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-17-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Louis-Alexis,

On Sat, Aug 01, 2026 at 01:21:03PM +0200, Louis-Alexis Eyraud wrote:
> Add support for the MT8189 topckgen clock controller, which provides
> muxes and dividers for clock selection in other IP blocks.
> 
> Co-developed-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  drivers/clk/mediatek/Makefile              |    2 +-
>  drivers/clk/mediatek/clk-mt8189-topckgen.c | 1025 ++++++++++++++++++++++++++++
>  2 files changed, 1026 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 66577ccb9b93..9d3d2983bfb2 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -123,7 +123,7 @@ obj-$(CONFIG_COMMON_CLK_MT8188_VDOSYS) += clk-mt8188-vdo0.o clk-mt8188-vdo1.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_VENCSYS) += clk-mt8188-venc.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_VPPSYS) += clk-mt8188-vpp0.o clk-mt8188-vpp1.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_WPESYS) += clk-mt8188-wpe.o
> -obj-$(CONFIG_COMMON_CLK_MT8189) += clk-mt8189-apmixedsys.o
> +obj-$(CONFIG_COMMON_CLK_MT8189) += clk-mt8189-apmixedsys.o clk-mt8189-topckgen.o
>  obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192-apmixedsys.o clk-mt8192.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
> diff --git a/drivers/clk/mediatek/clk-mt8189-topckgen.c b/drivers/clk/mediatek/clk-mt8189-topckgen.c
> new file mode 100644
> index 000000000000..f25c0711512c
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-topckgen.c
> @@ -0,0 +1,1025 @@
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
> +#include <linux/clk.h>
> +#include <linux/delay.h>

Are these two headers needed?

> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>

And this one?

Brian

