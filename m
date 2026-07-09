Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03103F39E9
	for <linux-clk@vger.kernel.org>; Thu,  9 Jul 2026 13:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604911; cv=none; b=CL3Ux1+gxUmO8JmrOghY66xy13AS3litIiocM6531GVJ5QwbGJ38E6AwyPF4YbyJUKBfdkC4aZZCaPcJRsvI6yyMD0gWD6CWENFJ/BfP7RELrMWm4hokWnO6QvTsHuUqgnQTkm3GWUGeJuJsaO99z8z2i2ZCOEyP4gDqreBw6ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604911; c=relaxed/simple;
	bh=oTfYNfnr1dfMrSCaR0BJIVASu18bHLDiq6Qq+l4pxOg=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qRn2KlYM8YrPBD46o01AJaswgTeJE6PueUTl2TC8GiN+ZpnsNRu/FwXHg+zMwQAjcyn5GCkH8e8easmr8hU6WFcZPOqVTgX62etaJbB6wxXXlwE5RE+KrLWnxj9C1RUfJv2VAV6skHRVKsWEfCM4MBtVIaxG/uWV0YxJCg0PDdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=liQqdDtS; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="liQqdDtS"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4703bc0a99aso1140639f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2026 06:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783604908; x=1784209708; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RfxNiyfGalcXxYCujFTGDOzvlUn3o2Vt8N79ndZYWsc=;
        b=liQqdDtSfbk1Yzi6PRyJDbYwSIPq1gusHrdUX95hiY4xeGot7R5IZu8qlF1obnhzSC
         3HnPNUepfdva0sxbXsxgy+fLEl6MwvS9RRqI50gBlnRKOBSKWGQ1SdBQauz5vbyGG+hz
         WWmfK0FV7QUTXs0hpfAi0qfvPdwOFizepAjOwbU1wXzCN4gpQwxMfTiCFwBIYwi90lv9
         Obm9tpNHK0Q7Z96mkitzKylZTHVR/OxrsDdW2Ux33Q74vlzsaer/25xwXt5qECS4BKvD
         mq1gr2WQG3qWgVjzwkXeobzjhUOZsv6+j3gLGm2iP7eFAihGx2jDTXpICvR05Bki8Rc7
         3OXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604908; x=1784209708;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RfxNiyfGalcXxYCujFTGDOzvlUn3o2Vt8N79ndZYWsc=;
        b=XxkkdWFk6xvvmhFwLbrwXreRePpXutJoW7MYKv7vQNpdm0PL0Y6nlw0PlM/SahWPU6
         SR/c07PlkOIq/zoIuzaA1RwEAFGy/9GRnscIlZwPcvR6tSFjZMMoNjWBU2S9LwNuL9De
         LQmMHyF6vb6wcKM0J5WftWaxfoYjkzpW1LudNuRsOiMgx0SlEeLqw2UtZoXA2JiVf+nR
         ePYiW4WsAn6fqvC59xy6x5knYoM3C8dQ76J1Zz5D1cz2/Zpl9HYvQVQoecUfTKL7dYad
         M9wdlIuT/lZVXs0lPpoZ1L9TJMyxjKax+nJOQh1DnHiUC3VgLcC+bV1F9XViM7vG6jda
         zGBA==
X-Forwarded-Encrypted: i=1; AHgh+RrXcLAAg1Tg6QkhULZBXF7EvOQB1vIqCiJJuGi4jYmWsSy5i/LKk6oIaf9pNIaYG5EZDvxiGHzXgK8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDIwaQ1+lA/XGri9Rfql/Qca22G9ATfTJ4xrNHyTSZPW5IWcgx
	XA5FMILf/dOZWDjveEn0pj9VQquYdAjMK8pFkKzVS7Nmle1CYrsMgJ+N
X-Gm-Gg: AfdE7cn9C6Rn1CjgG0dIsL7neTjkQDXk/KiEVhdFtP0Iq2/Rfi0mosy1Jizxn5QFElU
	kKWtPI/5ZZCwzw9ym6Y004+kAdIe9Vh9uS4fbdMYaf1O7sT3GOiAr4KV9Vm0GGDrS8WkC/70wJT
	M8DCJA3XkPL1ChqHM66VmhCd0wnKjQ/5jo6glk8Y9LIMWcef+8BlcDvkHHYDr3WvavzEbOxwzGh
	+bZQ8jStSRhmD7nO+2qzDPMFZOVyu3sTKtTA+DLWE0x/TRkLvSkdDu2WaurpFTRX2N90CjnISMm
	AE4+2s9Y/LXHxdDUTcQLVhkvu99E89sDnIudc5sJcbV6GVhQCCqP5Om6UyJ96SpvNYtQlGV4Xem
	MGifvc2jJY/DndjAc9UJS7lHY2+LSZ7xcyy2oyJ61HXRCj4VO/ZH2ha1R4zd9KV4lUOjOkMU5hM
	JuyoOvF6E9336ozH9xVs+RGvH0EHWoyJa6aIwa+jQRTQNx2VVuHpjRA9uVl586d9U=
X-Received: by 2002:a05:6000:4613:b0:47d:ecaa:3f60 with SMTP id ffacd0b85a97d-47df077b2dbmr7296836f8f.46.1783604907964;
        Thu, 09 Jul 2026 06:48:27 -0700 (PDT)
Received: from Ansuel-XPS. (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d8cdsm55329868f8f.1.2026.07.09.06.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:48:27 -0700 (PDT)
Message-ID: <6a4fa6ab.b2781ae3.385c0f.d696@mx.google.com>
X-Google-Original-Message-ID: <ak-mqjsTP-TDVfti@Ansuel-XPS.>
Date: Thu, 9 Jul 2026 15:48:26 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: en7523: reset PCIE HB on init for AN7581
References: <20260708084045.8380-1-ansuelsmth@gmail.com>
 <ak6AYe5ZZrzyf1UB@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak6AYe5ZZrzyf1UB@redhat.com>

On Wed, Jul 08, 2026 at 12:52:49PM -0400, Brian Masney wrote:
> Hi Christian,
> 
> Thanks for the patch.
> 
> On Wed, Jul 08, 2026 at 10:40:44AM +0200, Christian Marangi wrote:
> > It was reported that PCIE HB should be reset for AN7581 or some instability
> > or link training issue will be present on warm boot scenario.
> > 
> > Reset PCIE HB on clk HW init to handle warm boot problem with PCIe.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/clk/clk-en7523.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> > index 1ab0e2eca5d3..c450d89bfa96 100644
> > --- a/drivers/clk/clk-en7523.c
> > +++ b/drivers/clk/clk-en7523.c
> > @@ -57,6 +57,7 @@
> >  
> >  #define REG_RST_CTRL2			0x830
> >  #define REG_RST_CTRL1			0x834
> > +#define   REG_PCIE_HB_RST		BIT(29)
> >  #define EN751221_REG_RST_DMT		0x84
> >  #define EN751221_REG_RST_USB		0xec
> >  
> > @@ -853,6 +854,12 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
> >  	val = readl(base + REG_NP_SCU_PCIC);
> >  	writel(val | 3, base + REG_NP_SCU_PCIC);
> >  
> > +	val = readl(base + REG_RST_CTRL1);
> > +	val |= REG_PCIE_HB_RST;
> > +	writel(val, base + REG_RST_CTRL1);
> > +	val &= ~REG_PCIE_HB_RST;
> > +	writel(val, base + REG_RST_CTRL1);
> > +
> 
> Sashiko has a question about whether or not a delay or a flush is needed
> between the writel() calls?
> 
> https://sashiko.dev/#/patchset/20260708084045.8380-1-ansuelsmth%40gmail.com
>

Hi Brian, from the test done by me and Airoha with their CI on 10000 test,
no delay is needed. If we want to be on the save side I can add it anyway
for consistency with the other code. What do you think?
 
-- 
	Ansuel
