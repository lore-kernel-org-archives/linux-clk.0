Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F67433B3
	for <linux-clk@vger.kernel.org>; Thu,  8 May 2025 18:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746729023; cv=none; b=mgMqjNixyQiDNDieqmwHOWSwNTttt+FpVtZtw55BTHVzx/jV0YvHvkERhb+rPqem4HFhjnnbL9O7cqrIN3yiqzq+4urlNFv+xAS8iezeGW7aOFmwKPO0/LwpW1fzeL/h9yR1LbNdz009izquelKYmWvIGZbBwWq1/J0q9IVIUFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746729023; c=relaxed/simple;
	bh=kyb04malG+RwKZmlL7WK3dUsz2SulfWs8ytrGBGsmbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DKyF0KXUVoGOwkaGJMggv+SpuRlHECgTJmcB3KuuIOHUsEhkEKhjpdxEXAQZJ2rjzDC3XJuMLcfsr/X8J5SLTuvon4Ya6OnDYo1o4Y9OMLUTdRkS9b2N7Kzcs9zHyHhkv36M6F36FA1T8/UU7zQMdhOI/tYIomG8J7mm2BZdE5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=QW9CqumX; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="QW9CqumX"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2cca475546fso790328fac.1
        for <linux-clk@vger.kernel.org>; Thu, 08 May 2025 11:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1746729017; x=1747333817; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T3GC3nd2QY3ZXudwqT4kCMNlEBnSWQ4/Y+mWvsZzVRU=;
        b=QW9CqumX3JN95+7Tzx7ZSgHMv33BFzU0MJhtryTLuRG4V1YaGPpz8G9Y5MJonx8i4r
         1su8aBhPkgIvJXI673cfIRf5lDwXnZu6XcaPr1+YQON0wCDOtzoSw0ONX5rTEO3RiVTM
         tQt6Ng7UclnsMpPaOxFdmXAxQfepu9Rd2f82xmj0Lig/gw3yEZfKZQsNsWp6z1/zFqec
         w/RxtXXlsSjfOWHyV4UKgpPldnAQiQjP8iPwcVPzYVlrgK1V4GTNStGNTFy4tifdBMAy
         ZKQsI202Kg5HaDzOQZ7L9UnlJemBDxxkPc7s9sFKb7r8sr7JcvEZFVIW9qc88QUL7fyz
         L7xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746729017; x=1747333817;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T3GC3nd2QY3ZXudwqT4kCMNlEBnSWQ4/Y+mWvsZzVRU=;
        b=RYohe8oI0KkYnzmNf+dMN8dzrd2YTg/M+glBGUgxXRY8jh8Dqq5mb1rG1/0qSsNaym
         YtZhRGMUpqSEYEyScOFzqcDkGEAUju4epeSTA88cRJ3tKAMfqgE/P7ymFHMAXFpn3Pb6
         FgQlLc35YtdT8PVU72xFBRIeYKyElqvcEKuN2wXnWqHlY1fWuzKbCeoEO0QfuakNRifx
         2o84oOU0eRXaMVhP1uXwJvJlUBNDWjDYZFL6GlZpUpymGgN/r8mGnWnH8UlqbG/vLsee
         fKB74xv6qkBwTfbV9jsogpxuiOwQlKdJts00pGH+72poh1gxM71i53H/VDQd0NVw03iT
         ZFmA==
X-Forwarded-Encrypted: i=1; AJvYcCUJP+m/DULgF39q6bfsZDMMaItnp7lGMiNeR21bl4+pLrni5zwikTKrX2uDZn/pyu1KHhi6Jcft+Bg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVnUiSKWaUC7Mbvnux8cZaL33+/LJEE+cSp9uqd5S6WFjIJ8qV
	qziOo+gwDvSvV4NtcALT/reeoO7DPoaJZu8mn3xfbSKdD3BtUW1/8BUFh4aNattTJb7mhz7b+WF
	o
X-Gm-Gg: ASbGncvycR103S2zVBOH1NKkppwlTGhkCEyZhpaEbA6heAA8hqOsB8aERp7lT1xnUmp
	ZOdUl1B8v9R0W1PG50Zjk9GWc68AptUk/VVPR7KYQ9DGJkrlCJJNwPFlwtJRBTjOUcHQX251YET
	FXnnmpJC0toC8pPfP3ltt17l1gEiD9u1IWhApvZWKzVJH4lYoFRLkXliM2w74PsyALYvdfkdds2
	DaPgxl3INH2n1VtbL3cjP4KA2YyT2+7cCJLWZ6IUKQzbgjg6IEharSTTyaZZZSwG0CW+n/qWFy/
	j7SbKk33IXFtcam6h2ibj35k16S/WdoqMiZ+PEaSyGF0AG4=
X-Google-Smtp-Source: AGHT+IEsxgb6xpj/TfNH2Jats/rW7/6lQIZRnNAaVkD3rlO2gB/eCZLowl4BgQ20sS07u8Lsi9VRPA==
X-Received: by 2002:a17:902:cf06:b0:223:517c:bfa1 with SMTP id d9443c01a7336-22fc9185e59mr5399955ad.38.1746728636019;
        Thu, 08 May 2025 11:23:56 -0700 (PDT)
Received: from x1 (97-120-122-6.ptld.qwest.net. [97.120.122.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc828b37asm2411005ad.187.2025.05.08.11.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 11:23:55 -0700 (PDT)
Date: Thu, 8 May 2025 11:23:53 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Stephen Boyd <sboyd@kernel.org>, mturquette@baylibre.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	guoren@kernel.org, wefu@redhat.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	jszhang@kernel.org, p.zabel@pengutronix.de,
	m.szyprowski@samsung.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 3/3] riscv: dts: thead: Add device tree VO clock
 controller
Message-ID: <aBz2uePXAtY6c6jD@x1>
References: <20250403094425.876981-1-m.wilczynski@samsung.com>
 <CGME20250403094433eucas1p2da03e00ef674c1f5aa8d41f2a7371319@eucas1p2.samsung.com>
 <20250403094425.876981-4-m.wilczynski@samsung.com>
 <Z/BoQIXKEhL3/q50@x1>
 <17d69810-9d1c-4dd9-bf8a-408196668d7b@samsung.com>
 <9ce45e7c1769a25ea1abfaeac9aefcfb@kernel.org>
 <475c9a27-e1e8-4245-9ca0-74c9ed663920@samsung.com>
 <c46de621e098b7873a00c1af4ca550a1@kernel.org>
 <91ecca14-2102-4c29-9252-025ce6b6a07f@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91ecca14-2102-4c29-9252-025ce6b6a07f@samsung.com>

On Wed, May 07, 2025 at 12:04:01PM +0200, Michal Wilczynski wrote:
> 
> 
> On 5/6/25 23:30, Stephen Boyd wrote:
> > Quoting Michal Wilczynski (2025-04-30 00:52:29)
> >>
> >> In the v2 version of the patchset, there was no reset controller yet, so
> >> I thought your comment was made referring to that earlier version.
> >> This representation clearly describes the hardware correctly, which is
> >> the requirement for the Device Tree.
> >>
> >> The manual, in section 5.4.1.6 VO_SUBSYS, describes the reset registers
> >> starting at 0xFF_EF52_8000:
> >>
> >> GPU_RST_CFG             0x00
> >> DPU_RST_CFG             0x04
> >> MIPI_DSI0_RST_CFG       0x8
> >> MIPI_DSI1_RST_CFG       0xc
> >> HDMI_RST_CFG            0x14
> >> AXI4_VO_DW_AXI          0x18
> >> X2H_X4_VOSYS_DW_AXI_X2H 0x20
> >>
> >> And the clock registers for VO_SUBSYS, manual section 4.4.1.6 start at offset 0x50:
> >> VOSYS_CLK_GATE          0x50
> >> VOSYS_CLK_GATE1         0x54
> >> VOSYS_DPU_CCLK_CFG0     0x64
> >> TEST_CLK_FREQ_STAT      0xc4
> >> TEST_CLK_CFG            0xc8
> >>
> >> So I considered this back then and thought it was appropriate to divide
> >> it into two nodes, as the reset node wasn't being considered at that
> >> time.
> >>
> >> When looking for the reference [1], I didn't notice if you corrected
> >> yourself later, but I do remember considering the single-node approach
> >> at the time.
> >>
> > 
> > If the two register ranges don't overlap then this is probably OK. I
> > imagine this is one device shipped by the hardware engineer, VO_SUBSYS,
> > which happens to be a clock and reset controller. This is quite common,
> > and we usually have one node with both #clock-cells and #reset-cells in
> > it. Then we use the auxiliary bus to create the reset device from the
> > clk driver with the same node. This helps match the device in the
> > datasheet to the node and compatible in DT without making the compatible
> > provider specific (clk or reset postfix).
> > 
> > That's another reason why we usually have one node. DT doesn't describe
> > software, i.e. the split between clk and reset frameworks may not exist
> > in other operating systems. We don't want to put the software design
> > decisions into the DT.
> > 
> > It may also be that a device like this consumes shared power resources
> > like clks or regulators that need to be enabled to drive the device, or
> > an IOMMU is used to translate the register mappings. We wouldn't want to
> > split the device in DT in that case so we can easily manage the power
> > resources or memory mappings for the device.
> > 
> > TL;DR: This is probably OK, but I'd be careful to not make it a thing.
> 
> Thank you very much for the comprehensive explanation. Because the
> registers don’t overlap, it’s fine in this case. Since Drew also seem to
> agree, we can probably push these patches forward, while keeping in mind
> that for future SoCs it would be better to use a single node.

Yes, I think in this instance it makes sense to go ahead. I sent a pull
request [1] to Stephen for my thead clk for-next tree with this series
applied.

Thanks,
Drew

[1] https://lore.kernel.org/all/aBus+Yc7kf%2FH2HE5@x1/
