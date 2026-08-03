Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBA341167C
	for <linux-clk@vger.kernel.org>; Mon,  3 Aug 2026 15:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785770249; cv=none; b=koBSvoG2OpQqShzkiztePKXblKNf0HF4plR4HTB+4MoVHjKGgpUboIAdNcXPWB6bZ6ag6x/rl0OLkfQ0bDlPMLMWLty6mEEg5A+yq3UW+ySp1GuHW+feCF2xvx8xpaushrFhCUtNBF02o5tsDmzJ34SRc9aS7UtqpK/h+YvZMKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785770249; c=relaxed/simple;
	bh=Tg2c5hSCmf4R8GHhniWyNjrjuYL6rS8mvKvO0Rjnhuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nnzRP59H5RAQS0m3KR4o7FY+dxOtHdRXYT+x62qhChMH39VRqQQHH0m1MTICxoeFRxsRA6wumHCiPHXyClBZ+xNacg4mBzGvjUBvUNGTcPWgolmqPcvw6HGadIV003V7KhSktpxRTJ86uFCHNT6IOqnlTnXoS7+JVYKAN4pQbIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BOJ6nn7Y; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=eQh5iDqF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BOJ6nn7Y";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="eQh5iDqF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785770246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CISqUyNrQHnuig4NG6zWObmoUM7qsn/M6rO8iF8GMa0=;
	b=BOJ6nn7YLQqiNa9sWRC0QCeMk3A34oJ3+Abxrstj1qYZWnMewiFNeCvsH97+ZumN2lPAL3
	FVs4eGug1//sa8smfIuopaSShENQofIDlu1JPZBHkyCbPfGjeUKvAo4EGllFBjgi4JL8/A
	LesQzX3d2X9wpCtz49OJZyh/64fQXt4=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-475-HQTvncdmP-WneNTnjHmcsQ-1; Mon, 03 Aug 2026 11:17:19 -0400
X-MC-Unique: HQTvncdmP-WneNTnjHmcsQ-1
X-Mimecast-MFC-AGG-ID: HQTvncdmP-WneNTnjHmcsQ_1785770239
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81eb7dc4e28so126212227b3.0
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2026 08:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785770239; x=1786375039; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CISqUyNrQHnuig4NG6zWObmoUM7qsn/M6rO8iF8GMa0=;
        b=eQh5iDqFiJh8Zep4vZvjC8HGIzyBpAUPOZ6PUtfq9zJFoCEMd26mK4pQPOJdmMd8HJ
         k5AExO2SPlbHxluekpkzW6T1mTeOItZ3J3qlLG4WJHVmI76rpPb8TtqEQXURH+K9BGjF
         ExJYFV/4DMgScBq/je2JxvnVj1TviZJzTb025r7Gg4M0w77grpCAIpNSWTsdmhnvkqQq
         RH7RjuWrSHmsErm9Epr8A/OO+d2ZnqBTc40QbYruncuzwMxXJWwxBpSBp3WvXpwMwP7m
         SJXHJRpUqBMwtmK8Qkho2k3wCiusZlKXBXnznVWZQSpRBXVFgbcl/FYsVOCXhMW2figD
         Kg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785770239; x=1786375039;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CISqUyNrQHnuig4NG6zWObmoUM7qsn/M6rO8iF8GMa0=;
        b=APlHcyaDenu1wq6Q9JoSpkJLVkY0YK2VlkWTPtbjIf+aLNR8aqvlLiP5UB9hLiCYq8
         treLvTg8A3TZhEe8FVQokdgpKzhA623JU1I6rMfge2fZlHVi8SgT3QD0WyD2fykZHyUJ
         Ghzp/jQq8I2+vLJjNGcbYZ+qsAV3Hb/1ge1BXlb6M0zb6lcQJ3qjYX3LzO+HNvzIfRk6
         vD+T765AuoR5+DrlIYWlPYzpvLgitTvBjzyCKAtRCL1nffBq2unTwzQRcpZpo7rjHHzD
         b18q95nQHAKAt/3of0+NyTn+2k+8BTooV0KYvwYDwBkM71A3ACK7TiVk2kBG+s7mywmp
         KewQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr525jNbWl3Cq8UC2EOIMkm3liU54hSBTpPZ/GVtbSrWu7EvLFcY/OY41JjZ3VRtxaC2exIC2N1YZk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTxJeKYi9kSAlICRutFK8CZBppyayS5xsByzHSxzVCyXZgY8nt
	+qy2GviN+i7++qAsnBs4UTwdg0MfYgo3fDkgTcmVXoEXxyqD+VbQAbp3uOi+2bTt2m6k/hhPPDp
	WsogEcHZj1FkQVAZtOo/6qZqR59+22Gs1kRWb2uIOo0shgnOHfaFUOMNLK9uufw==
X-Gm-Gg: AR+sD10TgTV7u4/qMzvBgz+IwpUxZ66YQWqodm7iMpfyN4r5EuraXO6I/mK1qMoDO7N
	Bj6kby+1LnliK9HZZV9sFyAQ/LSZ7MRxyWB5xwT3SFILy9MW6o2Zq1vyZ1svvim9+T842M8njFp
	54e7f4kdi5jBGQY/4ENxyopbnwK/C+CCVTsJUiVkPYbTgjtOeOaPG1yrxnipImoH30OOr95SBks
	mNpnXD0w4z/WnHk2DYNQxeWmYUq2H5WpzbzIKwEUZRQ9BDFgGPEeRUe4D6qa/qF0mxeHJOJMazn
	w3kS/7ZFi5+AqsfU2V7ZZ33+qI+mB7QzmD5Bh9mok/SZipheldOvbWK3TayNXSuaoVDfsVu6KFD
	2H+NcbrVdYZdZdfVHFL4Jt2Z/k5AzAzCJaLc=
X-Received: by 2002:a05:690c:450d:b0:7d1:dd7b:b734 with SMTP id 00721157ae682-81fd4b5a2c8mr136703367b3.23.1785770238447;
        Mon, 03 Aug 2026 08:17:18 -0700 (PDT)
X-Received: by 2002:a05:690c:450d:b0:7d1:dd7b:b734 with SMTP id 00721157ae682-81fd4b5a2c8mr136702797b3.23.1785770237899;
        Mon, 03 Aug 2026 08:17:17 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf2e239sm57358447b3.5.2026.08.03.08.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 08:17:17 -0700 (PDT)
Date: Mon, 3 Aug 2026 11:17:14 -0400
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
Subject: Re: [PATCH v5 18/25] clk: mediatek: Add MT8189 vlpckgen clock support
Message-ID: <anCw-ozpIjYfan5O@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-18-ac4410697cc2@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-18-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Louis-Alexis,

On Sat, Aug 01, 2026 at 01:21:04PM +0200, Louis-Alexis Eyraud wrote:
> Add support for the MT8189 vlpckgen clock controller, which provides
> muxes and dividers for clock selection in vlp domain for other IP blocks.
> 
> Co-developed-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  drivers/clk/mediatek/Makefile              |   3 +-
>  drivers/clk/mediatek/clk-mt8189-vlpckgen.c | 285 +++++++++++++++++++++++++++++
>  2 files changed, 287 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 9d3d2983bfb2..3b25df9e7b50 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -123,7 +123,8 @@ obj-$(CONFIG_COMMON_CLK_MT8188_VDOSYS) += clk-mt8188-vdo0.o clk-mt8188-vdo1.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_VENCSYS) += clk-mt8188-venc.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_VPPSYS) += clk-mt8188-vpp0.o clk-mt8188-vpp1.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_WPESYS) += clk-mt8188-wpe.o
> -obj-$(CONFIG_COMMON_CLK_MT8189) += clk-mt8189-apmixedsys.o clk-mt8189-topckgen.o
> +obj-$(CONFIG_COMMON_CLK_MT8189) += clk-mt8189-apmixedsys.o clk-mt8189-topckgen.o \
> +				   clk-mt8189-vlpckgen.o
>  obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192-apmixedsys.o clk-mt8192.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
> diff --git a/drivers/clk/mediatek/clk-mt8189-vlpckgen.c b/drivers/clk/mediatek/clk-mt8189-vlpckgen.c
> new file mode 100644
> index 000000000000..8eda5331972e
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-vlpckgen.c
> @@ -0,0 +1,285 @@
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
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>

There are also some headers that can likely be dropped here as well. I'm
not going to comment on this on any other patches. I'll just list any
new issues I see.

Brian

