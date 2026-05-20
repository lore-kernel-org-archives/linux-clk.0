Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A785363C6A
	for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 22:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779317640; cv=none; b=CgLdZNMup51UoR+20fDsjK/XRnEuu/ZamHc0Leq5aQNwZ6GhCtjcE7c7dld/2uaG9LTPYqLn1iMYpABrUUZM90UBsuG/B63OdOjowF+LtPU2UV/azI6yiV0Ykb6vnU0MbbAjFLBJBolnGN7zE+QzNyg/6q0aHRSvvwAIIs2b2b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779317640; c=relaxed/simple;
	bh=xz5sbl1et1Zg0+e1v9ss1rtdhz7lsvw1T1O6UGhgYt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ahmXeQ80/VlkHZoF3dPNyEVx0bZjbr9hWiioLRTJF1WMY6t47Bl3Zi4Ux80etWKcQ3bbRC2cY7qo5rBp/9Ld8x2vhG5z7H6jmj09TJbiIgmdg9QCaNtQrPjGwu+k6kZI5vqbB3EIYl3JTLy8VkVuhWajQjZZbGK81NcD5ya0kw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SJFrP+tJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=dfD/xHFp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SJFrP+tJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="dfD/xHFp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779317636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ehQ7mVBa+qZzMlqKHomdvNj5vjtqdC5856eNsb/cSyQ=;
	b=SJFrP+tJzWBAjpgjCNy3K1i+kEVTUR75Sd7FfnoErQQCxj1iufSr5t2uG6+AeROcZzcv0K
	Eha+0bBs6HUUuW3g6NquVlWL62rWNsrWCfd2yedKxvvOWghADw1+qc2JtJtEKaJ1TCUnjZ
	/9Iss0xmPE4n1t/ij9r0fgr1RHHS2dc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-jP3ezRbXNk2vjhedZNP25Q-1; Wed, 20 May 2026 18:53:55 -0400
X-MC-Unique: jP3ezRbXNk2vjhedZNP25Q-1
X-Mimecast-MFC-AGG-ID: jP3ezRbXNk2vjhedZNP25Q_1779317634
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5162ee45a77so142646331cf.1
        for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 15:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779317634; x=1779922434; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehQ7mVBa+qZzMlqKHomdvNj5vjtqdC5856eNsb/cSyQ=;
        b=dfD/xHFpNWtZb036dOF9E5313PugolBY2fpCdbNi5tDY+LrpGUQ1T1ivGkrktY1UQO
         YL01Fl1ddFIg5ywbaWE6wq56jIxyR7SHYUaaPjx7M64Ceux4d3WsRxmtkcYnPdJYAr7x
         U0MGKUEGGX1W7vllD/INtJTwnVxo0EEFdML628ixe1bRGUGMikaDhzwbL2WlC/fezq3+
         ghyT+42oAtf/dEwWsnOZactQF4tHJLEU1oFPsYzKlvLaeK8vDyi8XuioQdRFeDUVHnvP
         JZAMsxLuhYdWNzHXZ+9A5FY/xCwmnbb01XmuBYKREzkL7vYq2apysr7Xx6LJYimllwkg
         Zghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779317634; x=1779922434;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ehQ7mVBa+qZzMlqKHomdvNj5vjtqdC5856eNsb/cSyQ=;
        b=GXIBxGz89cZCzYM6ZgK+oVDUKCsSmdwdCbDAecI6/PB8AUJrSmJ360EI9zMqDteRVO
         jW4rq6VAHdlfglcdMnytmQASchSXrQW00vFbxQbOqAEi1l+rYPATkxxICaTCC9hzHs1s
         Z2rEEqplQJ5tbopHjpn83y8bNLJ7DSJMPhSSojGFv66JS5tEpjhYJnOpuOlssocglanT
         fOYww2Ee1icM4Ii1DAdheTQQfREiP2rSxUNR52e4qXBoRfOAwUfz6GaA4w9IYONEg379
         bmYLCJkdM47/Z2olCv8ubeaawHuibipBQfSXABqIVZ5XfSDYljqej4FrkBw1PeRNvhpo
         uYQg==
X-Forwarded-Encrypted: i=1; AFNElJ8Txvj2sZPJIuLWN3q66+DYZq2AORAJO8BWA0ptapeMKcYKH30LK5aWVA2TayQuT3b7sfN/QsAX34E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRhSn357/iyi7ovppEzDb88doqjPI8j29/GGZaFXOMXfZutT84
	rsIpFQoE9MhV1tl2RCDy914+i3KInpuLumOkmXfM2ntIbhmsfwDgtj18HzHbWt4Jp2115UpuG1/
	rcu0ICsJBP3xC9YR6JWFkkaSA9VJBVUvMl3F+ORhL+JHTkevikH2dMX+pOEoQjQ==
X-Gm-Gg: Acq92OFSobJp/QiZzWy3eVqHd6bjRlFHrOF4i7Vss1FHLDlxGZXHVoYry+7KGdOHFT0
	OtFD6NtJbIOtPTjMcAyVUZsIdRvVE/y6dbwcTqxKqZ1UoutWu6AaEzwKN03nVOgVxbC9sQsen31
	x1VQqq0pTtu46+g7lUazKXT5flD7sw+U7NxLnjAlduCrI8Xb/g8i/+l+Jw6E3wTIJM1uAOx+w65
	IPgNxY128FFOabxNoprf3cUEUw/PMaLFkpPO2jR3DkGyCeuKN3VsV66RiZ2uta1pkJzN5kiW9k+
	wxG/Yv2b0rBhHxIoDzSTa4ew5OIlFtKOZtrGLMG45ddCrlYLCJJ1CPuqETikrYx+AxDuWcuD3iH
	vfp3XNsJc/7I3EhzfY50ckr6pgXk=
X-Received: by 2002:ac8:5d4c:0:b0:50e:6399:eed3 with SMTP id d75a77b69052e-516c54557c3mr7170061cf.20.1779317634532;
        Wed, 20 May 2026 15:53:54 -0700 (PDT)
X-Received: by 2002:ac8:5d4c:0:b0:50e:6399:eed3 with SMTP id d75a77b69052e-516c54557c3mr7169681cf.20.1779317634055;
        Wed, 20 May 2026 15:53:54 -0700 (PDT)
Received: from redhat.com ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-516514e0b91sm191843371cf.15.2026.05.20.15.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 15:53:52 -0700 (PDT)
Date: Wed, 20 May 2026 18:53:51 -0400
From: Brian Masney <bmasney@redhat.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v8 3/5] clk: en7523: Add support for selecting the Serdes
 port in SCU
Message-ID: <ag47f8ZgCEZJurHE@redhat.com>
References: <20260520150912.11614-1-ansuelsmth@gmail.com>
 <20260520150912.11614-4-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520150912.11614-4-ansuelsmth@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Christian,

On Wed, May 20, 2026 at 05:09:08PM +0200, Christian Marangi wrote:
> In the SCU register for clock and reset, there are also some register to
> select the Serdes port mode. The Airoha AN7581 SoC have 4 different Serdes
> that can switch between PCIe, USB or Ethernet mode.
> 
> Add a simple PHY provider that expose the .set_mode OP to toggle the
> requested mode for the Serdes port.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/clk/Kconfig      |   1 +
>  drivers/clk/clk-en7523.c | 216 ++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 214 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index b2efbe9f6acb..e60a824b5117 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -221,6 +221,7 @@ config COMMON_CLK_EN7523
>  	bool "Clock driver for Airoha/EcoNet SoC system clocks"
>  	depends on OF
>  	depends on ARCH_AIROHA || ECONET || COMPILE_TEST
> +	select GENERIC_PHY
>  	default ARCH_AIROHA
>  	help
>  	  This driver provides the fixed clocks and gates present on Airoha
> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 1ab0e2eca5d3..d4b73c5f15b9 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
> @@ -6,14 +6,18 @@
>  #include <linux/io.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/platform_device.h>
> +#include <linux/phy.h>
> +#include <linux/phy/phy.h>
>  #include <linux/property.h>
>  #include <linux/regmap.h>
>  #include <linux/reset-controller.h>
> +#include <linux/spinlock.h>
>  #include <dt-bindings/clock/en7523-clk.h>
>  #include <dt-bindings/reset/airoha,en7523-reset.h>
>  #include <dt-bindings/reset/airoha,en7581-reset.h>
>  #include <dt-bindings/clock/econet,en751221-scu.h>
>  #include <dt-bindings/reset/econet,en751221-scu.h>
> +#include <dt-bindings/soc/airoha,scu-ssr.h>
>  
>  #define RST_NR_PER_BANK			32
>  
> @@ -40,9 +44,22 @@
>  #define   REG_HIR_MASK			GENMASK(31, 16)
>  /* EN7581 */
>  #define REG_NP_SCU_PCIC			0x88
> +#define REG_NP_SCU_SSR3			0x94
> +#define REG_SSUSB_HSGMII_SEL_MASK	BIT(29)
> +#define REG_SSUSB_HSGMII_SEL_HSGMII	FIELD_PREP_CONST(REG_SSUSB_HSGMII_SEL_MASK, 0x0)
> +#define REG_SSUSB_HSGMII_SEL_USB	FIELD_PREP_CONST(REG_SSUSB_HSGMII_SEL_MASK, 0x1)
>  #define REG_NP_SCU_SSTR			0x9c
>  #define REG_PCIE_XSI0_SEL_MASK		GENMASK(14, 13)
> +#define REG_PCIE_XSI0_SEL_PCIE		FIELD_PREP_CONST(REG_PCIE_XSI0_SEL_MASK, 0x0)
> +#define REG_PCIE_XSI0_SEL_XFI		FIELD_PREP_CONST(REG_PCIE_XSI0_SEL_MASK, 0x1)
> +#define REG_PCIE_XSI0_SEL_HSGMII	FIELD_PREP_CONST(REG_PCIE_XSI0_SEL_MASK, 0x2)
>  #define REG_PCIE_XSI1_SEL_MASK		GENMASK(12, 11)
> +#define REG_PCIE_XSI1_SEL_PCIE		FIELD_PREP_CONST(REG_PCIE_XSI1_SEL_MASK, 0x0)
> +#define REG_PCIE_XSI1_SEL_XFI		FIELD_PREP_CONST(REG_PCIE_XSI1_SEL_MASK, 0x1)
> +#define REG_PCIE_XSI1_SEL_HSGMII	FIELD_PREP_CONST(REG_PCIE_XSI1_SEL_MASK, 0x2)
> +#define REG_USB_PCIE_SEL_MASK		BIT(3)
> +#define REG_USB_PCIE_SEL_PCIE		FIELD_PREP_CONST(REG_USB_PCIE_SEL_MASK, 0x0)
> +#define REG_USB_PCIE_SEL_USB		FIELD_PREP_CONST(REG_USB_PCIE_SEL_MASK, 0x1)
>  #define REG_CRYPTO_CLKSRC2		0x20c
>  /* EN751221 */
>  #define EN751221_REG_SPI_DIV		0x0cc
> @@ -81,6 +98,8 @@ enum en_hir {
>  	HIR_MAX		= 14,
>  };
>  
> +#define EN_SERDES_PHY_NUM		4
> +
>  struct en_clk_desc {
>  	int id;
>  	const char *name;
> @@ -113,6 +132,18 @@ struct en_rst_data {
>  	struct reset_controller_dev rcdev;
>  };
>  
> +struct en_serdes_phy_instance {
> +	struct phy *phy;
> +	unsigned int serdes_port;
> +};
> +
> +struct en_clk_priv {
> +	void __iomem *base;
> +	/* protect SCU register */
> +	spinlock_t lock;

This spinlock is not initialized with spin_lock_init(). You can do this in
en7523_clk_probe() after devm_kzalloc().

With that fixed:

Reviewed-by: Brian Masney <bmasney@redhat.com>

