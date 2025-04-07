Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F25525A2BB
	for <linux-clk@vger.kernel.org>; Mon,  7 Apr 2025 18:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744050085; cv=none; b=f6ukEF3eEbzyQ7POhX9MJG6ekQCfVubSQaXwhR9yNi7seedAdO3l2uIFPV8rOIgfdzk5FbYIuZBW4Q5P9Ahcws2A+0FkonNWFugvyRoesOGnW6eLBbhmQB+P+D611+yjNgqZsoeK4tZHU/k7uOX/Hn7W09v6wJzMOXavWTYaqQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744050085; c=relaxed/simple;
	bh=k1/9lyFJSiqegBG9DyQcR/UywbSI25i+yvmVs8N1+BI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P+OKtlMq/4WpJnAgt+ZLs0CDFsmeSvP1GHgaDmQo7DpVlxrYF0SkHfKRdrHQNot3sb4auvc0kFYedSv7Z3eFtnBiLG+/w63mwhMCZlkHcDm+GWb6uvw7SsMfU+QgTu6RLMvALox+mdKMuXqsUnQxUE/a83vT6zJQ5Hwzk1dBucg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=gzPe++zm; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="gzPe++zm"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-224171d6826so64586285ad.3
        for <linux-clk@vger.kernel.org>; Mon, 07 Apr 2025 11:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1744050083; x=1744654883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y1Xymma/bXOddjzuMPc0uNib0InwbFB+6iU+FgAga1I=;
        b=gzPe++zm+JekE18C9GWD3KIiM7mEP8NenmYMUF+gK/4JTHHwB8hPvY/OC7opILkV33
         PwoSQDnrLlCAn1jUABQSloGyDUKSbHE9g+ESY4cdpHhznOKRUapg7120/VsvVL1V8B+Z
         5NLmIAITW7+0Mx/TLbQT6mjgpFNoBk4eSSAJaKxwcHIrd9UZ2/c5NzY/pT7HiJgF3c3G
         k96yOjWuCUDqUyDNnwg12ZfcO+bf2TU3loxYAbqUpf4/RrmXf5o3uUpB70op1QBsdUNu
         JFayC2+98G1rcD6n7ehDXjmVBG+7IAlgvV9rPnfHtyoueGgRbTRYP/mhRtMLU1GaU0K0
         QW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744050083; x=1744654883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1Xymma/bXOddjzuMPc0uNib0InwbFB+6iU+FgAga1I=;
        b=Y+6vhlx/dZncxLvDAH1sNUy32y810+20Zsg1Yh9Aq7YKD+bsO0E+DjpDrMeu1X4RKv
         R7X9d5aKZDDm/IKhA/x8FE3l+h20JCFhHhKxKLwj+TMGfFrYfWNA+41jWxj08oMpAIl9
         9FY/qMkxuAEMrxUGn3cKNoaLpwRcmn419vGmGXh0EVP/Mydb+777dXja7IxdCF/O7llo
         J3jX+T/vfwACJSVig0VQK+pMK3BSUdWkZvCcdp0D41rObNFchQVkgYmK9oErYtnif68q
         dlqkpD+S/Wfcgvh4mQREB1TyVl4pIQZ3VyZIFdCEhGm2lp1EyjwNCirFTeHwXQ56ztv8
         epSA==
X-Forwarded-Encrypted: i=1; AJvYcCVsYYIo3rYLPUdXHzUWtnAR27+zTH681Eg3jzIe2WGLgLBG/1rqZY2ypRTOV5ETz3KXqza5CBNssLs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy43wBFzBWd6BdfTxuGIR8/auL71TKyGHMXap0jnz2UMAd2wF+3
	xZFQaIcXBnvzuznoL65vTazwz+I7L6BWI86TjvTgGwLgdjsWT+GRAcCIXeNPkgA=
X-Gm-Gg: ASbGncu7toXTMFUvfS5POBc5S/BgivwRkmg0THd7V2P5aptmTG5Fv0dJcfp3/ip+TK+
	8KOlACRRSbsIpQI8fg+WNYPMUmNYR1uzkiEmzgkBuDINqu12VHYCA7oEwhgCfVBwfvmXjiFXqZS
	6FMV8fLn/2dGJJ+64N26l4FFprc+GU1Nb4ZYJ8I01YmXL5wzHcymQ7Nu1ljYYV302eBbDtm4OAG
	FSGEAaYAmitkNEK3Ipck2ZtEA4ifDsPUVjCCs9xlG4lxY1GMFHVyiyVRtnSEdLj6T1q39cV/j6D
	YE3nDtblq65hce+7ue4i6qAQ
X-Google-Smtp-Source: AGHT+IH4N8/3oA4wTPg2n7e91UEX+RmIscvqAqA1lYwbrZipQb/yeKPrP5GdySfDb3Kadj7CbVN/Yg==
X-Received: by 2002:a17:902:d4c2:b0:21f:74ec:1ff0 with SMTP id d9443c01a7336-22a8a0a3892mr142523725ad.32.1744050083610;
        Mon, 07 Apr 2025 11:21:23 -0700 (PDT)
Received: from x1 ([97.115.235.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e612sm84407055ad.200.2025.04.07.11.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 11:21:23 -0700 (PDT)
Date: Mon, 7 Apr 2025 11:21:21 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, guoren@kernel.org,
	wefu@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, jszhang@kernel.org,
	p.zabel@pengutronix.de, m.szyprowski@samsung.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 3/3] riscv: dts: thead: Add device tree VO clock
 controller
Message-ID: <Z/QXofChW/HeJ7DJ@x1>
References: <20250403094425.876981-1-m.wilczynski@samsung.com>
 <CGME20250403094433eucas1p2da03e00ef674c1f5aa8d41f2a7371319@eucas1p2.samsung.com>
 <20250403094425.876981-4-m.wilczynski@samsung.com>
 <Z/BoQIXKEhL3/q50@x1>
 <17d69810-9d1c-4dd9-bf8a-408196668d7b@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17d69810-9d1c-4dd9-bf8a-408196668d7b@samsung.com>

On Mon, Apr 07, 2025 at 05:30:43PM +0200, Michal Wilczynski wrote:
> 
> 
> On 4/5/25 01:16, Drew Fustini wrote:
> > On Thu, Apr 03, 2025 at 11:44:25AM +0200, Michal Wilczynski wrote:
> >> VO clocks reside in a different address space from the AP clocks on the
> >> T-HEAD SoC. Add the device tree node of a clock-controller to handle
> >> VO address space as well.
> >>
> >> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> >> ---
> >>  arch/riscv/boot/dts/thead/th1520.dtsi | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> >> index 527336417765..d4cba0713cab 100644
> >> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> >> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> >> @@ -489,6 +489,13 @@ clk: clock-controller@ffef010000 {
> >>  			#clock-cells = <1>;
> >>  		};
> >>  
> >> +		clk_vo: clock-controller@ffef528050 {
> >> +			compatible = "thead,th1520-clk-vo";
> >> +			reg = <0xff 0xef528050 0x0 0xfb0>;
> > 
> > Thanks for your patch. It is great to have more of the clocks supported
> > upstream.
> > 
> > The TH1520 System User Manual shows 0xFF_EF52_8000 for VO_SUBSYS on page
> > 205. Is there a reason you decided to use 0xFF_EF52_8050 as the base?
> > 
> > I see on page 213 that the first register for VO_SUBSYS starts with
> > VOSYS_CLK_GATE at offset 0x50. I figure you did this to have the
> > CCU_GATE macros use offset of 0x0 instead 0x50.
> > 
> > I kind of think the reg property using the actual base address
> > (0xFF_EF52_8000) makes more sense as that's a closer match to the tables
> > in the manual. But I don't have a strong preference if you think think
> > using 0xef528050 makes the CCU_GATE macros easier to read.
> 
> Thank you for your comment.
> 
> This was discussed some time ago. The main issue was that the address
> space was fragmented between clocks and resets. Initially, I proposed
> using syscon as a way to abstract this, but the idea wasn't particularly
> well received.
> 
> So at the start of the 0xFF_EF52_8000 there is a reset register GPU_RST_CFG
> I need for resetting the GPU.
> 
> For reference, here's the earlier discussion: [1]
> 
> [1] - https://lore.kernel.org/all/1b05b11b2a8287c0ff4b6bdd079988c7.sboyd@kernel.org/

Thanks for the explanation.

Reviewed-by: Drew Fustini <drew@pdp7.com>

