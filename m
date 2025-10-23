Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819392E5404
	for <linux-clk@vger.kernel.org>; Thu, 23 Oct 2025 14:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761230552; cv=none; b=HCuH9Z7UdcmSlLkyeU+wUT6MgbM0pjPMq/FTXm67Kfk1fJiDTEfeOpagvnBNeiQ5b7wEK+6ExCf301UcfoNHoxZu1PULWzDTbR5HfNIuCBAP8cedoV47ZLQB610/GDEDaKSvZ1SYUtbIqu2lPewCaywIuDX6dbbExx/veudgdvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761230552; c=relaxed/simple;
	bh=k7d7L/Nh6fQVgygKQp5+lal2MdQ3vWdFGswzj2ik54Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MkokWomBlhdRvHIlHavKyiofkAaO6n43YNH/+4WOeSD1Fpm1RfNMeyKvljX9juH2+aWwCdsx2NSvkfeVTIO+nq2/SCF8CsFZwpyhx65QfFUPTLHuIopzjgF7wh021/tVqQp3MiQLVtKFclRjyEC5eEKelJzAj/XY+IQHcR+/9ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S5PXgpVw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S5PXgpVw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761230549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IFicMu98gfAcT9m3j73eRKJRP9V5+Hez4KBiO4yt0/Q=;
	b=S5PXgpVwbNZoqR+HzzsVzaj4dcI1OoOof+wBM9vz7quhJrYtYBeD19JTZ8jdjJ79XnK78z
	y3tcYJtMRljtpPyj8C4zJ8ClEQUM2BgvBi9kCOfLOTSh28qvwzqbdi5K8OisCN4T0vjXpz
	+l4cXC3yxBYEXexgzpCuATbqCigrUs4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-u4kt5_XUNZmgtPDEGO2-JA-1; Thu, 23 Oct 2025 10:42:28 -0400
X-MC-Unique: u4kt5_XUNZmgtPDEGO2-JA-1
X-Mimecast-MFC-AGG-ID: u4kt5_XUNZmgtPDEGO2-JA_1761230548
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-87c2085ff29so23618556d6.2
        for <linux-clk@vger.kernel.org>; Thu, 23 Oct 2025 07:42:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761230547; x=1761835347;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IFicMu98gfAcT9m3j73eRKJRP9V5+Hez4KBiO4yt0/Q=;
        b=ADObTIzIqWM1iNpg5YOOvxmStuVZlOkVPneT+VtiqdG6oyJgs7hbbB0tVHlciD6v6Y
         JoFw4xufuIGcu53Soigp2yXuVrAZDK+5q5ONxTr0uLbXfjMsmkVNqB2mFvLzqEZ/jpHD
         1mEQRztY5MXsrdJiKitn1B+TtPDe7z2FOjEaAwYfS/AqS8jdUFVvwpFrjxeUAYfNsjnV
         PZkzhapp15kDUGKvWBDpleqLurl2Bihl3h+8D+VY3vXhRBhESTHmbu9DpUlS/CnBl1AX
         1mv63hyd6WI3uDwv09P8wCKRQiBKrLgouJ66HiMPKUVbXWZJIQWqHJ4LYy734viPKJSR
         688Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZ00P5awzP+JnElo2si2OrTo8AXHP/VYyYm0Op0V96f/+dmi23J0TGhwO8ydtdv9uxLmC5WNGDk1A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf5wwUjpr4op1FWWquJKEnL9tBSHkxlhPzB9sK3J1Txciaqp/k
	6h+IC/b3JdoIqB6oY/eWka2bK+f/mg1lYh4qdaJG33ezYSH35qliUPKKByWZkDWzXrduBNfr3/E
	Cs58ZJQmcxJpqoKg2DxI3ZQ/axwtAivN6xS8y8M64MnjwSsK2bcfPnhdMU5wkAA==
X-Gm-Gg: ASbGncsOrDRbhVVh15QPqd4AXV3voswXScsSugccoFCmfHCQyfhfgq4PBTaL+GR5D9U
	4Gkws3Xq47yXBr8kZRrJrH+z43ykO7qXiNdsHF1AqENwBiPAMMdgc45HofyD529AZtJMFUmxPSE
	42DxrBHBxDVzSS57XRkkM9QuW3pOFIdEdXbxrx2IfaDBw+cK1JD8EIZU1ze1Gw0wlhA1annJaAM
	7EMywsQYgy7aLtPwDGQUH4V/Kh4L/ag1IH6tiMVooc+sq6cOmbFXBHNdu01Ovy+/m1NIbVGm8yR
	r2HN+W2KwuiKZiad1ZSgJN5NoIpsDvzEQ++Tqs5oJK1NiXjbKt2t1fHo5mEIJo3oKteA8Jfy9zE
	2udQIed6Flci7JQKte0PtvgSAgCnqLaAuHoqL8K5lF9RFpt14QIGRXRInqxDjo0SL7g==
X-Received: by 2002:a05:6214:5289:b0:797:1a0d:cdd3 with SMTP id 6a1803df08f44-87c2057312dmr353179236d6.19.1761230547690;
        Thu, 23 Oct 2025 07:42:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHoA7a6YUkbzjRlWZlCvM1CpjEdcBUEk6K50Ddg8gNV5roej8uXfTpBfwhxN8OmaIZYnha0A==
X-Received: by 2002:a05:6214:5289:b0:797:1a0d:cdd3 with SMTP id 6a1803df08f44-87c2057312dmr353178766d6.19.1761230547171;
        Thu, 23 Oct 2025 07:42:27 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87f9e824cc2sm16169526d6.61.2025.10.23.07.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 07:42:25 -0700 (PDT)
Date: Thu, 23 Oct 2025 10:42:23 -0400
From: Brian Masney <bmasney@redhat.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Conor Dooley <conor@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/9] clk: microchip: mpfs: use regmap for clocks
Message-ID: <aPo-z9QOIqd9kxS7@redhat.com>
References: <20251013-album-bovine-faf9f5ebc5d4@spud>
 <20251013-undercook-flatfoot-70dca974cd19@spud>
 <ab443375-524d-4e6c-a640-7e580c2d0c64@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab443375-524d-4e6c-a640-7e580c2d0c64@tuxon.dev>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Thu, Oct 23, 2025 at 07:06:01AM +0300, Claudiu Beznea wrote:
> On 10/13/25 20:45, Conor Dooley wrote:
> > +static const struct clk_ops mpfs_clk_cfg_ops = {
> > +	.recalc_rate = mpfs_cfg_clk_recalc_rate,
> > +	.round_rate = mpfs_cfg_clk_round_rate,
> .round_rate is now considered deprecated. Brian (added to cc) tried to
> remove all its users.
> 
> .determine_rate() should be used now.

Thanks for referencing that. I'm still waiting for a few remaining
patches outside of drivers/clk to be merged. Hopefully I'm able to get
these merged for v6.19. Then I'll be able to post the patches to
actually remove round_rate from the clk core for v6.20.

Brian

