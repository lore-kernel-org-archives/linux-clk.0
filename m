Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AAA3E63B8
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 14:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778511024; cv=none; b=nfr6B43FOB7eqnFdJH4iXsuKRdyy2+1yHiCJ2otJJUbjkMjWk9gm3UBCuPCXGohlzUs88ijBb42gtwbs9TTwy6lYJCPo0658QYUpB68TjqXiLXfOWY5B2Fcs1zavBFrSRItzyg3/b0y6V5mZauC0hXxy4P7A7f6dwxIwKclik7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778511024; c=relaxed/simple;
	bh=fOUrQa8a/QDDUgkEhNreHMWABSJfDyt7tmdq34/bNjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJaxVvyNGCGBsUEEuq1L4HVwiCGdfGiEk9DaHZquM/wfEkxch829DjqqEUGEl5vdW1qzgRyhHkE4aHTWWNSb+lHT3+JRNxwTMG4qPVvrvc4CS6bpVSUKxtPMa+9v8DJkj6QrMU0fkaf+yMgLlPgLg2QL39OjmvA624DwMwXU9mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PRDXFDch; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=VfiqniJU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PRDXFDch";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="VfiqniJU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778511019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ffz+WS/kwatrVzg+MFiCHc5tqdSu3w6k7GM/epuJ1A=;
	b=PRDXFDchhEMHXXxFmKnshK2j1jFgX+xL5e1LVCYstyrFC45jGTlgmxZ3UXTVv7yrb3AiiX
	yO3bJNH82oGqxd53U+BGvBdsZEurRkIpsiz/FWeHDnfr0lgHGtf06jLMnFUTXdAp+yWCxU
	7Q9OO86M6UYnkRcBnmBXjlBPeZdS1o0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-k2rey7HGNhahaCxSX0ls6g-1; Mon, 11 May 2026 10:50:18 -0400
X-MC-Unique: k2rey7HGNhahaCxSX0ls6g-1
X-Mimecast-MFC-AGG-ID: k2rey7HGNhahaCxSX0ls6g_1778511018
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-514b673c8f1so44748411cf.3
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 07:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778511018; x=1779115818; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ffz+WS/kwatrVzg+MFiCHc5tqdSu3w6k7GM/epuJ1A=;
        b=VfiqniJUeIdz5pj+Y3G/5zEgczvwGkT69T+ok/wbZ6Q3jWKWjKQ4ZZ+v2FXX6xrRrD
         GgwKD9Hs9Z2/4sOFIy06lK1ieBTxCdoefI6ZZ37/OVCjMLwfTB28BBBHf3DEg8a/k5bg
         HduwoqELELl0leSBwJ9rzdU8IpsoGA+yVDxwGihWZxCLdDnhdV5do6wmJYGsnwpRBF6P
         8DCL+/upDFVIdAsJQNTerMaFECzWD8vQpVBhFf26dHTrLlQ4hatS+brJ5YcHoLCWb8L3
         QLczl6oL9V7H/povMRhowjFNxXpXBerqGhOhud6nvU1E7j36GINZRzgZWuaWapMxnnF4
         e4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778511018; x=1779115818;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8ffz+WS/kwatrVzg+MFiCHc5tqdSu3w6k7GM/epuJ1A=;
        b=FJnhBXkwR/uI8xGhx1WIOmc0BisXf77mqDfneJsDViRQZqkNo5izkc6VeROSPQ0lXL
         6X3YLUIwlU3G2UJKq1zvJmz9s5NlfcVLbmuyRf7VZTJ+9JMKmIJ0njBhX6JiFjevMH+S
         jytPmTUURnsdyOpHbZ+cehcor+j0CohcYLNIBYFtg9P3p6b8PxKiTMReEAOq7OhKvlML
         nzAKv27dwFHC12D2eucuwcLcY80k36LB/HqujY4MgpZUdhzOvs7PToFee2rDYG2Y5mJ7
         2WN3VYCNdNKYiZq7iLVpMAz/qR/IHD+p4KTzmzQHOetjvspArs6bOLDtMknapNUF4FWY
         ybOQ==
X-Forwarded-Encrypted: i=1; AFNElJ/rJxxFA+PwfJtmJCovQtlssaT+Qpaf1XcSytPY2B2OlToZLse8aQQNTPd+V2+8o2pbIuXrLEMtcB4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzY0a+KU1ZVb6sK6n4dVmAFdPGyfCJQAXFvSnYt3uLss1YTJn/
	KCXIjUx0jwzofqstkzZQmTT0amjBus6pkPtbsMDoyjVvRm0kBwxPYrK4MbUhifuhpn5yZmr28Il
	V1/I9nF9fpm47cyBCqF4FI8wKPMKZ1+pnDzpqipNgpJswQ+6e0dr6XzNERkNhrQ==
X-Gm-Gg: Acq92OFtmrqu2+ZfgJsEaa/Ol+qvuS6iJAg7OG6PfyitWQcPwzjkcEPv6CfuEyEkehp
	dGrazlQMRDlU6cBm/UtJ/nNr789PH0FpWvf5JuJHrEBK+u0nBDQU3AYKJ3fxkeyKXg4m5XNMlrt
	Rbma57knZ1Y/nL6B4TLeu79jVatPSran13U1xbDcEIrAVyMxmLf/U7odwYLME1ZMkWVPWjM7YNH
	zv3I6jpvye0G5L3Hxbhjls/46An2QxjRk4bgOTsV/kQ5+r/MfY/8jpFAyyQVHOskPfgv74U0TyD
	HR5LUKJPoUntUk97j2Zn51X4ht5/Ibz8jpMiG7+tdfeB/iiOW13josTzHZWPuCWW6xgVNJb1RjH
	Z8avrueKRNrlCvRPHIB3OPTSfP7FQO0lET0RYK4Mnva5o66F6BY3C7xnv/YxDj0EvB9U=
X-Received: by 2002:a05:622a:1b1a:b0:50d:8c8f:f94d with SMTP id d75a77b69052e-514621eef47mr364491161cf.52.1778511017833;
        Mon, 11 May 2026 07:50:17 -0700 (PDT)
X-Received: by 2002:a05:622a:1b1a:b0:50d:8c8f:f94d with SMTP id d75a77b69052e-514621eef47mr364490501cf.52.1778511017330;
        Mon, 11 May 2026 07:50:17 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf3a906e25sm95748686d6.14.2026.05.11.07.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:50:16 -0700 (PDT)
Date: Mon, 11 May 2026 10:50:14 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-rockchip@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH] clk: rockchip: allow COMPILE_TEST builds
Message-ID: <agHspp1KZHZmMeOy@redhat.com>
References: <20260509003602.956186-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509003602.956186-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Fri, May 08, 2026 at 05:36:02PM -0700, Rosen Penev wrote:
> COMMON_CLK_ROCKCHIP already gates the Rockchip clock objects inside the
> Rockchip clock Makefile.  Allow selecting it for COMPILE_TEST and use it
> for the parent Makefile descent instead of ARCH_ROCKCHIP.
> 
> The per-SoC Rockchip clock symbols already have COMPILE_TEST dependencies,
> so this exposes the existing build coverage to other architectures without
> selecting the Rockchip platform.
> 
> Tested with:
> make LLVM=1 ARCH=loongarch drivers/clk/rockchip/
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

