Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B552DFF04
	for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 13:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769781321; cv=none; b=NqFYaS7NRFbZf0yaKx5a5pM7mD83W0mOZFcSTNhYsZxKMxouBL40YXWcclatOKd5w5ao7joe9eLpMxDl6qg03bz1jaFI37ZVYslBCIpoCOSMT4pXfp0U1ZMalZ4XHv9Vk/cXreNZ7OLQda/Qz9GcX6mmWE7XB5nbSNifdJ7wFzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769781321; c=relaxed/simple;
	bh=C9BDDyHTAxvvlBSkzUj3MdBMQ9OfMDISBhPe/MWkWxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o6BM4S8F5pvMO3km/xYVi1biIcTLOzcuDtpMe1UUo3FvSCXGheneNrZ4ZaEjHqSOjYwFfoCkkvYpyaRtqFPUEwRkW9CfcGp/U4+iynyGfMycBbGvh3NL8X0oD2YtBJreGwHI0mQ6Rdc8adJx1UKryvYnKjEEh4DwkMLJ4EvKW7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TOm78JgU; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TOm78JgU"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-432d2c96215so1952205f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 05:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769781319; x=1770386119; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o1Le8LCyLcGQuvZ7tGgECGPbUrm2rSjnSYYZfcbP/cQ=;
        b=TOm78JgU1E3f/w5li/ysvA5/fGI0TGwsv8zw7aKdxRebMpCuNLsbzjP1AQGrSJIo5l
         cc+s3iImV57rIazU8r6cFmWaeXVrQVdWnv/EC8yJYALS2v6qeO7tIjCsu/Y1+CExw+yX
         Fy+/0WpHpq5H0eMyZrFCmyyAAOoaUDRBHBqMZ2xBvHbQvslETgiFCrIrdX3gVCIqYw4j
         /F7yOC07usXS5FMtp6BedJvS04xkBkdxO7gocv/apoBkXRsvh8c+quL1lA46WgfHYcfg
         K5MG9IpGS9ILZYzKsWwrzxxIOt8Df2tKSD/P12ksxZt06vv0nhgHAMnADwtoYWdyn2hs
         iv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769781319; x=1770386119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o1Le8LCyLcGQuvZ7tGgECGPbUrm2rSjnSYYZfcbP/cQ=;
        b=xJ8dHKQSh691rf2+lTXw3BMn2+bW1BvqunFTAQ5lE9rFtMZx1rZf5LY8BlBIW03/t3
         ipn7YP8ZlUkNyTfzHyG0Y/6ayurMBnY3lakzEal8BuYE5ITWXgVVWio3wDOWIWPeyN0a
         RLt8v4K7rO9pMKHR+YUoWLPSPXuQqX3plK4xrzIgeWgENsRDErcPEsPUjV8EfzCVktyh
         tEzMb2jspSV47DiIClVc1LzGVgBTmJyyBWUS2EnRBWHitHDekm6tt/12f201L4TaDQD7
         DgCyizVXK2WWDVxuB2L/3iiyXirbuT72Q/s6XGfwevAVixAVXIpGhWWvoV6VGUF64gmP
         KWJw==
X-Forwarded-Encrypted: i=1; AJvYcCXmW5XSGPma+9Gb041VCAkf6wm4Q+BhW7bJiD/PPAWpkbSkJ88ZFOnGVx/tBrNGkDo26W0iuCBercU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDzSlxujxV41QzFwMwZV2c9eGcsxBXr9kiKk5eMniFmBd2TusZ
	BjirfAw+p1geoP78IABmEmZBHclBmFsSbUKOAO/JEyxFbPZb/iSXnJXAhWYcmTy6rPA=
X-Gm-Gg: AZuq6aJ4CPiQaJaYc3iNpwq7j+yv2dRBtyf9gNW+3IiQD1TzG9f6pyKCsBguhP8HtP0
	pMK5EB+II1Lb3Pv/uNq9Yzr1T+29Rz+LZ50dQAslUn//ZBGX/6FNJ1KxpBT8GbEtWoRRCR65wVT
	/ZePqmjTAazQt3cU3YCEsvaQ7bnI4rpAofLa2NnVHPhSLRl+3ns5cmHR9vGyZ1HZAXbBbUMfcAS
	vaeoFlyRkdKRC3gokdMwU9MLg/gx0JqZZm6HanaR+FsX71IEVZEL3nZYPi24flMCBTFPn24Fie5
	VMCD7taeXS8pbg9vadCLjFb+UcDqmAMdGUDrttRZQuY8d2uPGfZ1DPtuA73cu7Cnc0Y/gaHF/2l
	Ln4EbrMwnJLuqNAvSlrBrWUCxElvMlJvgRXQKx4q78VQUhSv9KwnLODj4/7RQ3LCEyaW9vczOuQ
	qw0Aik2yrnG9jV/tXbtU9NZdpp9ZBh
X-Received: by 2002:a05:6000:40c9:b0:431:35a:4a8f with SMTP id ffacd0b85a97d-435f3aaf7d9mr4567020f8f.47.1769781318602;
        Fri, 30 Jan 2026 05:55:18 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e46cesm22505217f8f.7.2026.01.30.05.55.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 05:55:17 -0800 (PST)
Message-ID: <e53b50e2-72dc-47c3-be52-cefa593dd30a@tuxon.dev>
Date: Fri, 30 Jan 2026 15:55:16 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/15] PCI: rzg3s-host: Explicitly set class code for
 RZ/G3E compatibility
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260129214130.16067-1-john.madieu.xa@bp.renesas.com>
 <20260129214130.16067-11-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260129214130.16067-11-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, John,

On 1/29/26 23:41, John Madieu wrote:
> Program the class code register explicitly during PCIe configuration
> initialization. RZ/G3E requires this register to be set, while RZ/G3S
> has these values as hardware defaults.
> 
> This configuration is harmless for RZ/G3S where these match the hardware
> defaults, and necessary for RZ/G3E to properly identify the device as a
> PCI bridge.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
> 
> Changes:
> 
> v4: No changes
> v3: No changes
> v2: No changes
> 
>   drivers/pci/controller/pcie-rzg3s-host.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
> index 15ccd9095a3e..76f6d940ba45 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -1054,6 +1054,7 @@ static int rzg3s_pcie_set_max_link_speed(struct rzg3s_pcie_host *host)
>   static int rzg3s_pcie_config_init(struct rzg3s_pcie_host *host)
>   {
>   	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(host);
> +	u32 mask = GENMASK(31, 8);
>   	struct resource_entry *ft;
>   	struct resource *bus;
>   	u8 subordinate_bus;
> @@ -1077,6 +1078,13 @@ static int rzg3s_pcie_config_init(struct rzg3s_pcie_host *host)
>   	writel_relaxed(0xffffffff, host->pcie + RZG3S_PCI_CFG_BARMSK00L);
>   	writel_relaxed(0xffffffff, host->pcie + RZG3S_PCI_CFG_BARMSK00U);
>   
> +	/*
> +	 * Explicitly program class code. RZ/G3E requires this configuration.
> +	 * Harmless for RZ/G3S where this matches the hardware default.
> +	 */
> +	rzg3s_pcie_update_bits(host->pcie, PCI_CLASS_REVISION, mask,
> +			       FIELD_PREP(mask, PCI_CLASS_BRIDGE_PCI_NORMAL));

According to kernel test robot report on v1 this throws a compilation warning:

https://lore.kernel.org/all/202601152104.pV9uMS76-lkp@intel.com/

> +
>   	/* Disable access control to the CFGU */
>   	writel_relaxed(0, host->axi + RZG3S_PCI_PERM);
>   

