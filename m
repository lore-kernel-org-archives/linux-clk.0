Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9986E3B14D0
	for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 19:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784576986; cv=none; b=ZhhDRT9MJhLthH0g5trV9DWh3rpy6NsprMgumRRltDS5I4+Lw7hWRaVHwrxtZ1+lOLFplH9a4eP/crdJzp71BmUSFRZLb4rh9vGqE2bg567b3FNnJcYdxBnwGbL1OhZhSMbyh2cy8/eqZ3V+yM38RmlvEV1nlUQmJvqytybghi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784576986; c=relaxed/simple;
	bh=fUXGc8N7lOiu/ttSB1jFdmerxyjFkHx94HszQ6mCydA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GL5e1Wa2Bg4+B/UD0HxO+6Xcg6UUhSKWTbU2o6uSODLWeX3RJcPcpNzEepOPjJFrZcq6qMCLkqpcvTlrD8EaU14WR12RMwsL+F10XGYr+5I8UlWN3S1PVqx/NyG+W9L7LyemBrFRttLVcinnQm/Fr4HjyCrbUmUcTCs1PTLbsQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JcAWHv08; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OqEPmjd8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JcAWHv08";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OqEPmjd8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784576983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R3g8Y+ZL+PfTaYg0OUzAkvSo6d0BBLLMuCBAXDGcKtE=;
	b=JcAWHv08PZi5ozUjYuGZ+hiVuU1IQ4J9Els+y1yOWCGgTp9+1IkSR1qPV10cehN0xHgmio
	yem66H0/qxbQv2DrXrrEo2B+8EGAUyxFiUqg2T09TXt+Alo2YnSixzkngGdE2ngwTtOBEs
	fCW87sLTJT+qOPIACGDX+FkWvC9d2pY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-Bd-zTlfWN2-2TTaXFPeZVA-1; Mon, 20 Jul 2026 15:49:42 -0400
X-MC-Unique: Bd-zTlfWN2-2TTaXFPeZVA-1
X-Mimecast-MFC-AGG-ID: Bd-zTlfWN2-2TTaXFPeZVA_1784576982
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c20762d21so98867271cf.0
        for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 12:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784576982; x=1785181782; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=R3g8Y+ZL+PfTaYg0OUzAkvSo6d0BBLLMuCBAXDGcKtE=;
        b=OqEPmjd8Kag8XWGuooCokVeavZqx2AGeP04kNpfl87axcdz6wUG76Ace32otD4A5h3
         g8ffhJSAMooVy2G3s8Tl5eHDaalo9dTOZEyqcaorUvmuLD17S5L3y2Pvh2t7kIjCyhnL
         lLMOFHKc7pwD/SFDSeE0I2Il/bw4XVHuTbvbGXbLGbMzMRVGn2tmjnoTCMC2MN4wsDDA
         rNUKNYbcNwqjtmkBR/t5SN/qjvKU9CZ1K0tSgZqolgfCJi7fPT5bmdTjQgN32iB7cgmi
         3nTAsPoUrx91Cwyt8EHQ+XZPxWbDOrhIPWz8e/f03kjvROaKdQY5afnVAY1DUjNn+Eud
         Kt0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784576982; x=1785181782;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R3g8Y+ZL+PfTaYg0OUzAkvSo6d0BBLLMuCBAXDGcKtE=;
        b=Sp+Bvalylyf8EWTpUhMDu3VqLJxQouFN4u+dmgwf/alpKtx4O8pi41jW0LaaSWvPWq
         i/bmuNhEvmHK9aAYmEmNq7BJNY1odxhVydLPQ9QGCsNMPDM7NZoBpWRpnply5zbWQTRE
         nS6RAeDRFPgfzKxKVyXo17xuhHaej9s+OWHnuWwmyeGJ6MzfzaLwN1Z9gDTJc6c4d+nZ
         V1heXP9DbKJ2O/Qhrs48qTxayZRMSnXABBexLMpmQoQPFC7ZehFyaNU/sxi+tXMFoUcH
         gegLHrz8TMm9qTvKHYf9Vz7NcYq/mPaEoZIVkiQIGOc1tTbEXV1looO08O9VkamrIXnG
         AZ6A==
X-Gm-Message-State: AOJu0YyJAweS9S2HD5bsMPE+3XZnUL/eoozqjasHJGHOsQnOgMuIy8rp
	eZOaPrKqxOKGb1zLVmnjp6CfAWdgNyDkBLkD33aSveNg04+zaSjDIxqC7gUoO/vPgb+tzqYbbiG
	8R7jiwyg0/z2fnObYGKzYtkw73AHH9lUDQbjHTgbEzVQst7PXJmoY5xlIcf+ZSw==
X-Gm-Gg: AfdE7cknHHrHEQCzDttSB6Stz155AFBxNBY4Fzus+F9SNXmtiraDPw7mHu/9Lx9keLB
	HXWjFgvXGDIdhUHvj+W8YLkaBgwEm4JgX+YnBALp7lYePuiQWAxyCGK3uuNazxEx3RrESaBiXKJ
	1RuJC5GoaIGnVKbX6GJw4MqgUptf3h12pHi/QD1mrE58rPmYT4QIwyV/xGpgajSzsxYMiN4VKMw
	DU1n1oabGNd3PAcpPUpsdXHyFxoEugatAcFGJvc8soLGw79VIe61bvE7kG7MuuF6Kq/kMUEX687
	/18LDBjjRZ4BxM6JwvF40VeuSWYJAcLCHUZ3bsvoE7v/czncKFO9VTb9S3WXkpoMb3XgGbj9o9b
	LFEhR7wFLuM5W8bs/XzLXuXDW/ybMXZa0Hto=
X-Received: by 2002:a05:622a:1cc4:b0:51b:fe7a:4eb8 with SMTP id d75a77b69052e-5213cdca291mr135213791cf.35.1784576981665;
        Mon, 20 Jul 2026 12:49:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1cc4:b0:51b:fe7a:4eb8 with SMTP id d75a77b69052e-5213cdca291mr135213501cf.35.1784576981250;
        Mon, 20 Jul 2026 12:49:41 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5214fae361dsm79033051cf.25.2026.07.20.12.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 12:49:40 -0700 (PDT)
Date: Mon, 20 Jul 2026 15:49:38 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH] clk: hisilicon: hi3660-stub: use
 devm_platform_ioremap_resource
Message-ID: <al570vTZ5ZXCCYUz@redhat.com>
References: <20260719215456.787188-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719215456.787188-1-rosenp@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Sun, Jul 19, 2026 at 02:54:56PM -0700, Rosen Penev wrote:
> Replace the open-coded platform_get_resource() plus devm_ioremap()
> sequence with devm_platform_ioremap_resource(), which fetches the
> resource, requests the region and maps it in one call. Switch the error
> check to IS_ERR()/PTR_ERR() and drop the now-unused struct resource
> pointer.
> 
> The only in-tree user (stub_clock@e896b500 in hi3660.dtsi) has a single
> 0x100-byte reg region, so the region reservation added by
> devm_ioremap_resource() is exclusive and does not introduce overlap
> failures.
> 
> Built for ARM (drivers/clk/hisilicon/clk-hi3660-stub.o) with LLVM=1.
> 
> Assisted-by: opencode:hy3-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

