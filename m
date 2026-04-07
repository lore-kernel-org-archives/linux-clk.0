Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBAB126C17
	for <linux-clk@vger.kernel.org>; Tue,  7 Apr 2026 19:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775591858; cv=none; b=RpkIv7oIn8TFw187ww/QTH+m2ayTRSKLy/gUEZx8avzwbuFC4cfwaMav10kYKRGy+ABPSPeTgh5deZB1SwfRjLbIhm27UIk3Jo+zf5tfyqmRBX94lMFANsDh2S9wi+x514nYhcBN/7ViWI3PEVSDjUCFepVVeACL9P8jJ6b+fEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775591858; c=relaxed/simple;
	bh=YaMK1wa3MMIxrwEsDAo/lFZHK1vAA8Ru5RJohvf2o18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cYcjfSFYY9MOQwMitcyZG7kpqGPYQiw8ZCarzqDFUYF/4eD7cQLBBi1AeCF8dyLs1w/BZKbVlPXpfjjCm1VEyGCOxhcX38ZZj5GZaJz41JZ6TkWlUlN9GzdKCQTuJiTR3K6OIhlLcsC3uXSVMapt19/staK092nMq+FXISsKhCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FNuwWYJA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=D9t7lNKf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FNuwWYJA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="D9t7lNKf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775591855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=afqKvOBY6UcokwbofYX7GYTJbiVKQVdFWAEZ5QM/NjE=;
	b=FNuwWYJASDSyJUSgwfZgU1pD91wz1G+pYeFDVsIaHjkoQTtjrWTZP5DCnvZpOZ+d0ZXMiM
	9UdOWUSzMtOD459uf4Vq58pc+wEfs9Bmw5cZMxiNZ1sAS34h1rLrwI8+GRa2u7gfQ8RTNs
	s/IWQNFCfp43WsJg3K/rdaMNYi4OIVY=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-P6rafkDNOGSl9WQUpWUORw-1; Tue, 07 Apr 2026 15:57:34 -0400
X-MC-Unique: P6rafkDNOGSl9WQUpWUORw-1
X-Mimecast-MFC-AGG-ID: P6rafkDNOGSl9WQUpWUORw_1775591854
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4661881eso68437801cf.0
        for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 12:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775591854; x=1776196654; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=afqKvOBY6UcokwbofYX7GYTJbiVKQVdFWAEZ5QM/NjE=;
        b=D9t7lNKfmj0NZLfVhnO7KrCgFzVeFSN/0B9x37Y72vjePWg3DnRAgCSqTr8LfJEdgd
         Ewb/pFkEvbhCRBwNI8frYDISv5HmNv16MECdJC4SUbi0VC/1qmU69szN43/bhElLiZFC
         aZJg6cZdkS4P+p5SDN5NE6eKXrpppcAeELrugtCGwGENkWuJ/H4XjxQih0Dj0NdxBwT0
         QusgxssjrW7roRD/gjJH5FE+G6whwIWlezH53qhz5nBfxrIlGFX2KSsW6WFueYoXLR9P
         BieJVLgfhqtqkA2dbnSDCtwDGOGZVPoor6rDGt2TMckhl3tHc3b+Fan8ApOJfeoP0v5V
         quog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775591854; x=1776196654;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=afqKvOBY6UcokwbofYX7GYTJbiVKQVdFWAEZ5QM/NjE=;
        b=dyXobNazYn7xZ7Spy/DF0H3CmHsegwPT02JSOzom9jvVq6sM3X2bKgNgC0+356VsCu
         UJVdkNFj1CgbTJ8ipbh2rc+/v917PvcrZn8C2oRHhiGUKyLjCsiz0rVYxaFsBGaTk6aw
         0sQMmqQQoHSoY3P0oRFKCxkmn1TuzK/8nxu/vSPfLrsSgcg92Wch9jncKkMNpJhwsO/K
         2Mp+w2xfB8GpbIuVE72LnKk01pn9Xf67NaIJQgkYlm3mJCKY/iM3PCb7meldItuRUIcw
         ys96Ch4N7zcB8SBTnigFutdgm1Nrf9jd/D0DYE0PbgFNS/zL9Yl4Owtzmam5APtqu/5J
         HQ5g==
X-Gm-Message-State: AOJu0YwEsIN/hhdVFXtqYJS9Gx3D4FSTUlVhjc7cLSAz2n6tQv6Ptce2
	rs8DPTK9DeOVWe32Y5rP+uEKIUDfwZVvbpXgdyEPHGmZf9YHDhypZWRizB1x0zPVmgdKJZI+7sn
	sSwV/1V0/NhGRBoMJtUmt2RZg7/HFituKI5BxKmMOPvnMzUvHvkbpMbFxPwqWUw==
X-Gm-Gg: AeBDieuizvVYb0XzK4b12PNQEAjMFtQyT7JUewOXAU4Szo2KfE7KnVzxcAsFX7enlzf
	y754Kf4wU18kecVNRx1wuH8DQdV/TRhyhjAjlnOQsz9UCflBn+wubG5NNIDVwXqtJJmKmp+6o7t
	T+mcwBZ/xu12C/cCtWnqv4Gjb0SJDGnz+Fvdcr9MFmIqsHafgjyPYUoIUaRF6GDAsuasY/skieQ
	wAbilQG4nvOhK+4Nm0s0rdN2Q01q7IxcMlT1/XdvQZRX2cRatPOmKEhmS4loYjWoZRLGCpgOLFE
	rxMItE/efTLKkV5hhBvWkFBhQTwiYD8848WFV7gXbRTlSIZprqKgM2jQN/fCGRUiSKu6vfVCvEn
	ToZEcQPe+8tKani7c6V8=
X-Received: by 2002:a05:622a:13d4:b0:50d:83a4:2995 with SMTP id d75a77b69052e-50d83a42dbdmr187698401cf.21.1775591853869;
        Tue, 07 Apr 2026 12:57:33 -0700 (PDT)
X-Received: by 2002:a05:622a:13d4:b0:50d:83a4:2995 with SMTP id d75a77b69052e-50d83a42dbdmr187697771cf.21.1775591853165;
        Tue, 07 Apr 2026 12:57:33 -0700 (PDT)
Received: from redhat.com ([2600:382:772d:3619:ed0:4a9c:acd6:3fc9])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d4aed181asm164262931cf.0.2026.04.07.12.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 12:57:32 -0700 (PDT)
Date: Tue, 7 Apr 2026 15:57:30 -0400
From: Brian Masney <bmasney@redhat.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-clk@vger.kernel.org, Michael Walle <mwalle@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Michael Walle <michael@walle.cc>, Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/6] clk: fsl-sai: Add MCLK generation support
Message-ID: <adVhqkj-cFbFBrZH@redhat.com>
References: <20260406215150.176599-1-marex@nabladev.com>
 <20260406215150.176599-6-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406215150.176599-6-marex@nabladev.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

Hi Marek,

On Mon, Apr 06, 2026 at 11:49:46PM +0200, Marek Vasut wrote:
> The driver currently supports generating BCLK. There are systems which
> require generation of MCLK instead. Register new MCLK clock and handle
> clock-cells = <1> to differentiate between BCLK and MCLK. In case of a
> legacy system with clock-cells = <0>, the driver behaves as before, i.e.
> always returns BCLK.
> 
> Note that it is not possible re-use the current SAI audio driver to
> generate MCLK and correctly enable and disable the MCLK.
> 
> If SAI (audio driver) is used to control the MCLK enablement, then MCLK
> clock is not always enabled, and it is not necessarily enabled when the
> codec may need the clock to be enabled. There is also no way for the
> codec node to specify phandle to clock provider in DT, because the SAI
> (audio driver) is not clock provider.
> 
> If SAI (clock driver) is used to control the MCLK enablement, then MCLK
> clock is enabled when the codec needs the clock enabled, because the
> codec is the clock consumer and the SAI (clock driver) is the clock
> provider, and the codec driver can request the clock to be enabled when
> needed. There is also the usual phandle to clock provider in DT, because
> the SAI (clock driver) is clock provider.
> 
> Acked-by: Michael Walle <mwalle@kernel.org>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Brian Masney <bmasney@redhat.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Michael Walle <michael@walle.cc>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
> V2: No change
> V3: - Rebase on current next, update mail address
>     - Update commit message according to clarify the difference between
>       SAI audio and SAI clock driver
>     - Pick ancient AB from Michael, although this may be outdated
>       https://patchwork.kernel.org/project/alsa-devel/patch/20241226162234.40141-4-marex@denx.de/
> V4: Use the fsl_sai_clk_register() helper.
> ---
>  drivers/clk/clk-fsl-sai.c | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk-fsl-sai.c b/drivers/clk/clk-fsl-sai.c
> index 7ec9a4f22735c..386ee5f77a986 100644
> --- a/drivers/clk/clk-fsl-sai.c
> +++ b/drivers/clk/clk-fsl-sai.c
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <linux/clk-provider.h>
> +#include <linux/clk.h>

This include needs to be moved earlier into the series to keep
bisectability. It looks like on patch 2. I'll also comment there.

>  #include <linux/err.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -15,22 +16,37 @@
>  
>  #define I2S_CSR		0x00
>  #define I2S_CR2		0x08
> +#define I2S_MCR		0x100
>  #define CSR_BCE_BIT	28
> +#define CSR_TE_BIT	31
>  #define CR2_BCD		BIT(24)
>  #define CR2_DIV_SHIFT	0
>  #define CR2_DIV_WIDTH	8
> +#define MCR_MOE		BIT(30)
>  
>  struct fsl_sai_clk {
>  	struct clk_divider bclk_div;
> +	struct clk_divider mclk_div;
>  	struct clk_gate bclk_gate;
> +	struct clk_gate mclk_gate;
>  	struct clk_hw *bclk_hw;
> +	struct clk_hw *mclk_hw;
>  	spinlock_t lock;
>  };
>  
>  struct fsl_sai_data {
>  	unsigned int	offset;	/* Register offset */
> +	bool		have_mclk; /* Have MCLK control */
>  };
>  
> +static struct clk_hw *
> +fsl_sai_of_clk_get(struct of_phandle_args *clkspec, void *data)
> +{
> +	struct fsl_sai_clk *sai_clk = data;
> +
> +	return clkspec->args[0] ? sai_clk->mclk_hw : sai_clk->bclk_hw;

For the case when clock-cells is 0, should this check:

	clkspec->args_count == 0 || return clkspec->args[0]

Brian

