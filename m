Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92770378D86
	for <linux-clk@vger.kernel.org>; Tue,  7 Apr 2026 19:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775591899; cv=none; b=qyqBcKOzcfO4TgGEUTYwSgFI7l1q1xvDQZq/0E3/3cVSsSCYJJMY66f14/JwEHsQ4xRhw15wLFe5pwlrrpfXHpJnLMstCT8ThhlDS1RovRzKOMLEFnbTkAMek0chfApmTTIlne9eq17RiANxpvCLyikqyUJDcNaOvSuC2Jg1UXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775591899; c=relaxed/simple;
	bh=y4dVmADXE1jrgnpP8JxM8NIiyhlZTgiZlr2F7Lxkn1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i2F8Ar86gxt5ebwkOj+oHFDDbg63KSwDNFFcaS+Vh4Oj9w/ayFf9LSvNOruo39w4wp6zeSKW3BYa6NCL+6dV5RAtr5Dnq+Ak+95+M7F0gGIy+TVX0TUSD+GZG07HXv+JOhHVYW0wFjyHwiBYA8G20bknUGmESftP/SMo/TQioVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bTTSxE7F; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=RyA++f8I; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bTTSxE7F";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="RyA++f8I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775591897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1lyCZReF7n3h9ZzIFPxE3qqalSIjCxvP1fRMXtPh+/M=;
	b=bTTSxE7F/JyDROikH6h2jkAJGfyu5GinYBxakB0SUs32tk1H4pc6gYynDkvQrMSrm/ePlB
	hYX60jk5Wo3354KTONxXx+y/gnNi637eNmHRhqWrUzxXXB6hlfx+oGXs0VzzRptI/HxJdG
	g9p+wwdYOG2cc5lz49u2zITyj8zXke4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-332-p_Jewt0lO7O8kporRYNEFA-1; Tue, 07 Apr 2026 15:58:16 -0400
X-MC-Unique: p_Jewt0lO7O8kporRYNEFA-1
X-Mimecast-MFC-AGG-ID: p_Jewt0lO7O8kporRYNEFA_1775591896
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cfd0a23243so1968423585a.2
        for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 12:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775591896; x=1776196696; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1lyCZReF7n3h9ZzIFPxE3qqalSIjCxvP1fRMXtPh+/M=;
        b=RyA++f8Ih12FK15i7ABmKwIM+6g6yAijIcCVkmWSpH6uzCYH6Wy7PGrF78VX41wadG
         0Vkoj8tlGPCl8ZQwXYlqdOsh7VJaufUSBK2Q+TsOjcgFTn/FufjmqHr7v84XoE2TjPI2
         eZOmzgcOCrlMLnt9AoaxELh/Oy9uWcaTYEZitDrSXyb+Fpd723fvdJMNTF3W9bPtJ5HR
         ePr3DJPkpxGWIW//Toe+/lZLsh4+2OgqTsJLYHOy63mR6kIULcklAe7tLrR9EimZToC2
         QeO4I9qQJkVLvOX7/ZWfm3TxnfOcsWg7h7zrrmyTbPQBv7BY+01UwdLLKujhjNxTKQ6H
         gzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775591896; x=1776196696;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1lyCZReF7n3h9ZzIFPxE3qqalSIjCxvP1fRMXtPh+/M=;
        b=XKfj0jN6MwyzvdB4F5nEN+ne0zzqi8IyjIMy7SLTxa0TVcRyQr2VS10MmWGs6/4vIg
         nFaFEjhbn7gqu00JgjiJm1eBwfxyBGKiSzOmkNeO0i1oSGhxKEChUc6S0KYklUikhvlT
         VzV2bXkUcksoCwOuvo/EjbX7eVBohw3bckDDQjoXwZaiDSZtRjAmz2PKhiBztkmcUQh4
         rspuJrQKFNnZFIcfob4XhXk7qgcm9YA/PH4NopA9kuBVZl9SIifelPaV/xQ8FnyoO8h5
         yxqa6GphJbMZNqJOvgzNVFvXkEvQ9w/3rH2jJcTelzaX/9sNpkl5aMiZAx+k6rP3ZGGU
         M66Q==
X-Gm-Message-State: AOJu0YyDM9CSB0g4AnPIhzWWguEUdPDOjSNWQJtiOzuErxoyAGwAFhdK
	CC80vIfud7zPNuCHZcdi3MPqXVm8g925kd/JYtLmgK7iweYnlrsh6ffxQ/6dA3qCDCjroWpHy+Z
	cM2BTszFJaQ4mkBeubsCoHxHcDlQIPUsMrbvcgakwStlMy6/nZ0GiwfB+aNal/g==
X-Gm-Gg: AeBDieu1BPxYqzMcRUTZChutJ7EzXRZh667cx2VZemhORyZHkz7T1WQpdWey7ofzX+M
	86a6pm1aSSu92vivcj9a3q2bb3l8Sc3SlBD5nXQFtPOgeB3jHMSqcOOhkmXtUisPdLLwx2g0HN8
	5M7i9IUPtJMurPIsBYESbsonVSpbLUU8EjlL0f9jku/CkpXItySb4EjZ4B8Y+8EAX6rz1r7nE7D
	+MGic0+QKv7PD/fCM3nwlqZ36jz8ICq5L5EIcskjsQaeeiN+kg/owkXxK18lCWqD6r6STMOpjDu
	p2meHMk8fAE3wxUkzA4TIsJPiuZglHNmskpGTTZOWG/LUFZBdKzqCnhim22J2ZbDHvpZOtx+v5T
	YszY63K9dYrKz7Ep/oy0=
X-Received: by 2002:a05:620a:2844:b0:8cd:9653:61de with SMTP id af79cd13be357-8d41e1427e7mr2498363885a.50.1775591895826;
        Tue, 07 Apr 2026 12:58:15 -0700 (PDT)
X-Received: by 2002:a05:620a:2844:b0:8cd:9653:61de with SMTP id af79cd13be357-8d41e1427e7mr2498360685a.50.1775591895273;
        Tue, 07 Apr 2026 12:58:15 -0700 (PDT)
Received: from redhat.com ([2600:382:772d:3619:ed0:4a9c:acd6:3fc9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d2a8648c17sm1388436585a.33.2026.04.07.12.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 12:58:14 -0700 (PDT)
Date: Tue, 7 Apr 2026 15:58:12 -0400
From: Brian Masney <bmasney@redhat.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-clk@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Michael Walle <michael@walle.cc>, Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/6] clk: fsl-sai: Add i.MX8M support with 8 byte
 register offset
Message-ID: <adVh1JLI-qfXLdMt@redhat.com>
References: <20260406215150.176599-1-marex@nabladev.com>
 <20260406215150.176599-2-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406215150.176599-2-marex@nabladev.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

Hi Marek,

On Mon, Apr 06, 2026 at 11:49:42PM +0200, Marek Vasut wrote:
> The i.MX8M/Mini/Nano/Plus variant of the SAI IP has control registers
> shifted by +8 bytes and requires additional bus clock. Add support for
> the i.MX8M variant of the IP with this register shift and additional
> clock.
> 
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
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
> V2: Update commit message, align it with the bindings one
> V3: - Rebase on current next, update mail address
>     - Pick ancient RB from Peng, although this may be outdated
>       https://patchwork.kernel.org/project/alsa-devel/patch/20241226162234.40141-2-marex@denx.de/
>     - Optionally enable "bus" clock, which are needed on MX8M to operate
>       register file
> V4: Add RB from Brian
> ---
>  drivers/clk/Kconfig       |  2 +-
>  drivers/clk/clk-fsl-sai.c | 27 +++++++++++++++++++++++----
>  2 files changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index cc8743b11bb1f..9f7f391a5615a 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -255,7 +255,7 @@ config COMMON_CLK_FSL_FLEXSPI
>  
>  config COMMON_CLK_FSL_SAI
>  	bool "Clock driver for BCLK of Freescale SAI cores"
> -	depends on ARCH_LAYERSCAPE || COMPILE_TEST
> +	depends on ARCH_LAYERSCAPE || ARCH_MXC || COMPILE_TEST
>  	help
>  	  This driver supports the Freescale SAI (Synchronous Audio Interface)
>  	  to be used as a generic clock output. Some SoCs have restrictions
> diff --git a/drivers/clk/clk-fsl-sai.c b/drivers/clk/clk-fsl-sai.c
> index cba45e07562da..336aa8477d0ea 100644
> --- a/drivers/clk/clk-fsl-sai.c
> +++ b/drivers/clk/clk-fsl-sai.c
> @@ -26,11 +26,17 @@ struct fsl_sai_clk {
>  	spinlock_t lock;
>  };
>  
> +struct fsl_sai_data {
> +	unsigned int	offset;	/* Register offset */
> +};
> +
>  static int fsl_sai_clk_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> +	const struct fsl_sai_data *data = device_get_match_data(dev);
>  	struct fsl_sai_clk *sai_clk;
>  	struct clk_parent_data pdata = { .index = 0 };
> +	struct clk *clk_bus;
>  	void __iomem *base;
>  	struct clk_hw *hw;
>  
> @@ -42,19 +48,23 @@ static int fsl_sai_clk_probe(struct platform_device *pdev)
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>  
> +	clk_bus = devm_clk_get_optional_enabled(dev, "bus");

This patch needs to include <linux/clk.h> and drop it from patch 6 to
keep bisectability.

Brian

