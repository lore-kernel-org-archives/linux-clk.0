Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A80155C80
	for <linux-clk@vger.kernel.org>; Wed, 19 Jun 2024 18:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718820911; cv=none; b=hm0lmou4LM4slC+y+uKp8Yr1AjVnS/fc5+b7EkgMdfrFV+6yuvzEJQz2yyHHMCeTlyFmg1aoElSYhaSmeVYU+uVNQTWN+RrlejjVj16rYOnPxD2lfthMKK5gS3BGxAFUIO8rgd6OMUwm7bWoAGvVtCZvRVrdbA2QQmU8F3NZpTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718820911; c=relaxed/simple;
	bh=fVNJ46LFa+YhWYpSphStOCOSpTawRC5Ibrt5BRhp/I0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQaeD2qBnGao0QjuP9yrnbAsZkUkDQEKOimpM0mv3LVaEScSk3AVAjk9dGbF7ZkwSlaiwSSPpAThAdD42X73d4STv7nCeOyFg85QiHnwYbwCbNdqJE1oY1qUt0XKFI7gHVoSMdsiHil61JDPcycRRkQ/ciUH+y33KTmtUD8cSNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=VJCjcqGa; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="VJCjcqGa"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-706264e1692so108436b3a.1
        for <linux-clk@vger.kernel.org>; Wed, 19 Jun 2024 11:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1718820908; x=1719425708; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ObNK4nw+goLT3sduvlOOitPrsfAxlE+HFMLfQaVSTdo=;
        b=VJCjcqGaTcR6AOxzCG/JkLBXnFVZ/voA0rOBgBYAJOsr5yqXKTSBeV2SHrA4CVbTvD
         guW4fPs6ZDfD4JT7afhhC8nMZGqI0fZtWnDaZmSZ6B/9jamvb7SEg/2ceREW3r7pBOlh
         9U2939CqmKxIEM6XlwPbF4qd5bOTxGJCGmn9TmPkDr9V8snlNbIjk2lcQiAHikPQAHWt
         LZG16jK0W9fdKYXFr5zp6+QF8hO/Lb5F3+RHlLyvXeBm3sU7H+UjLC4s2EGCXm0qb7EC
         WcgUzLhrYYK7f8/swgI6FYXVDxlvKK6pYTCoaVmuseHN/21NgqCVW4+kt9qnPFi2P7/K
         bqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718820908; x=1719425708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObNK4nw+goLT3sduvlOOitPrsfAxlE+HFMLfQaVSTdo=;
        b=bGKmBJ4u8wKYG+fsv8ICPwBa93+JhSYitLQDYsfaO1Awy8kdJgJ8MjEBINCPg0lI0C
         u5dXunXIkx6K4eCmoqSuW8eH4sD7GZJLuRpbEZmn58SGTeoID3ToPvDtJmdugjmTHbPZ
         uF8fLhvr7kibCAZdd4o2seIvRuqaTwzljo0/ilFfviqEkMTQnJWimBKADsFRt6F0enXS
         xZDuXsqqySAPMHjG0sNg1ElSBFv1+EF88TQ8WRR7WoggEaBroyt8h41ulnxPOtfcdUFu
         nWtRByx8mkn3Xe5q6LaUhR2XEAduFkNB0cFFyLo/b+iveqgpkhpmuSdnLJse0GZxjK0U
         5yTA==
X-Forwarded-Encrypted: i=1; AJvYcCV7+ZHfynueozUMzFCn03JEfX3I4EHvisatmUamql6a6yepRglLeqqdvbVEhXTpiAKhW00V5Sy4glVJ+ipMoq1sB5WIek4llu77
X-Gm-Message-State: AOJu0Yy/Qpt5AeMemospvKM5f530JEpW11BO+CVShDliQSTAPmN06Zrf
	+OmEQytgchBcObdUwbi+ShXLsFCqd0W3s8Y11QrfC+LcdIG/FIDpHbzMovDnSzM=
X-Google-Smtp-Source: AGHT+IGj5wpO/mjLKZrOGKZvpPOXW2hKDnc/Jp/UqhQuyCI6Q1OQJ7aj2Y4azc+GePSR7cngyftNOw==
X-Received: by 2002:aa7:9e90:0:b0:706:29f0:33fa with SMTP id d2e1a72fcca58-70629f038d4mr3002643b3a.6.1718820908271;
        Wed, 19 Jun 2024 11:15:08 -0700 (PDT)
Received: from x1 ([2601:1c2:1802:170:7627:e2a7:42c9:f02c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc967334sm10993307b3a.57.2024.06.19.11.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 11:15:08 -0700 (PDT)
Date: Wed, 19 Jun 2024 11:15:06 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Yangtao Li <frank.li@vivo.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] clk: thead: Add support for TH1520 AP_SUBSYS clock
 controller
Message-ID: <ZnMgKs/dUcYXiisk@x1>
References: <20240615-th1520-clk-v1-0-3ba4978c4d6b@tenstorrent.com>
 <20240619-tapping-jaundice-471811929d96@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619-tapping-jaundice-471811929d96@spud>

On Wed, Jun 19, 2024 at 12:12:30PM +0100, Conor Dooley wrote:
> On Sat, Jun 15, 2024 at 06:54:29PM -0700, Drew Fustini wrote:
> > This series adds support for the AP sub-system clock controller in the
> > T-Head TH1520 [1]. Yangtao Li originally submitted this series in May
> > 2023 [2]. Jisheng made additional improvements and then passed on the
> > work in progress to me.
> 
> One thing I noticed on the dts side is that the GPIO controllers have no
> clocks provided. Does the AP sub-system clock controller provide their
> clocks too?

Good question. I see that dwapb_get_clks() in drivers/gpio/gpio-dwapb.c
does call devm_clk_bulk_get_optional() for "bus" and "db". There doesn't
seem to be to many in-tree examples of clocks being defined for gpio
controllers with compatible "snps,dw-apb-gpio", but I do see that
k210.dtsi defines K210_CLK_APB0 for "bus" and K210_CLK_GPIO for "db".

From the TH1520 System User Manual, I do see the gpio related clocks in
Section 4.4.2.2 AP_SUBSYS. The peripheral clock gate control register
(PERI_CLK_CFG) has:

Bit 20: GPIO3_CLK_EN
Bit  8: GPIO0_CLK_EN
Bit  7: GPIO1_CLK_EN
Bit  6: GPIO2_CLK_EN

I will add these gates to the clk-th1520-ap.c and reference them from
the gpio controller nodes.

Since each gpio controller will only have one clock, do you think I can
omit the clock-names property?

Thanks,
Drew

Link: https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/tree/main/docs
