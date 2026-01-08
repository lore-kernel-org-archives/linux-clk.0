Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6895F2BEC41
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 23:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767914164; cv=none; b=WsvPK3PSKMo+mB2F6ECx/UKlfioJ+UhhOl9GoeKawBrDSViWcpWSoTbRi/Y+hppG+T2wAof09NeKp2txY0KpYdFV04yvk/56nR600LiFHdamvQJmcbI07yg3IxkovQRlag8nTmXisvTWajkB0MBg8OSesXNIjCReOWxrcFmhbag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767914164; c=relaxed/simple;
	bh=17+rkJP20nYV9IDZK9BQLbswUyY9XqQmiPMs4eJwmo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jfxyyWlfyguPI/VWQeh0Xc998B7cr47EvUQWgl0ByVJLXa7nxiTxG9VD/7P2HQvJjd0NyRwUqN/pUUydX0mQox3VwfPKG/e76A3oE4oAWke9E3Cs3Fcqy0UStqJtz1Oqr8JJ/KZ86MMlzpfHB4f7UhTX9MIWnLszXzepxXkIk1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S5mDZp3J; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SHEwDmGS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S5mDZp3J";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SHEwDmGS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767914161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eU5UycVxm9L8yb8bT1auwceOFZnjF7UXaeyNQkK13z8=;
	b=S5mDZp3Jo2v9g3eK+HfWLNC+1lYLoz3dgeVPHPAy3Uz7QuLlsrf50KGNaoLVgteIQZHsj8
	E9iVGEe/74ZU7wh5i+QwbJFUiLbDNlU4PcVXEgFqVJHarwe+zY0biHN/RFvgxQvvU2NPPx
	KA04r+f6j7Jp3LCkPFdSDV+5V3knqZY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-08CDYJjTNJ6IirEDibVyTg-1; Thu, 08 Jan 2026 18:16:00 -0500
X-MC-Unique: 08CDYJjTNJ6IirEDibVyTg-1
X-Mimecast-MFC-AGG-ID: 08CDYJjTNJ6IirEDibVyTg_1767914159
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a3929171bso73800376d6.3
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 15:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767914159; x=1768518959; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eU5UycVxm9L8yb8bT1auwceOFZnjF7UXaeyNQkK13z8=;
        b=SHEwDmGSjTvg+wTlnYMclBA2SNAK9WM4gVR9wXpNB4nPClJ29GxgIQrnXDF5Wfhavq
         2z/3VO5yZLGRm825JBuCrw+ZL25csgltL+N9sh1rdOHJ015SFoCm242lkJeQoH7pUhVA
         k+Vq1SXQ4hoBKLEGO8DFDRgmpdts/v3S6O++oVPWwkqAVpoVEWkKf6T0L7H3MpVV4ypm
         Tbr/CgQIS59heQUwkvNfNe5UKzfMCN6tz3BeXcNi29dZKeLW6k58aE/0kMC0O/f0UuLS
         L3bYLn0qbgiqS2ceMWTHAc2KwlUrvFlmNAsi1UiGG4ynJmuQ3QHYgN5RGW89wC5rGt3+
         KFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767914159; x=1768518959;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eU5UycVxm9L8yb8bT1auwceOFZnjF7UXaeyNQkK13z8=;
        b=wjTIAC/D3C0pq+6MhQvoqloDbFMLR2/PG5t9QQPkkn9gcQJoHOOQ8FNmxC1UfMqo/y
         dyoDDNiBjeLaOoOivDXrKPBWh8Bq8xyVJngEP8zOC2FDGtdeFM9ZRLbme2QJnUsTogbv
         3Mffd+q94k0JJM5lHuk+YhSol07VDmF8ekzbBLltFG90oXelncQUYh1YOsQp7MyPCgb8
         H4bfQfcmEIvd6k3it7sFN6fZme12vidhyjribJM2B1scFVdpk5lD5rRsVFp4HAvXoNlv
         UbQv2edxnqlof/VXOjtrG5t7p1Otouyn/9HrMcwPNPYh0lKGiqYeuJ4BFdIB+xKPTcdx
         vyHA==
X-Gm-Message-State: AOJu0YynjsE1NhdlVF6nYrtV6DCeqBdq0lRzOUkgrDMpaZjiilAIBZbu
	3V8W83dzR80PGL+tciVZsT8b/tiWPWvD/NNytdsI7VfdvlnFJ+/nk5SCaMtJuoTBm5BGXWBgL31
	N2CmYvoP7YHSUOcOjBL5lPGrzPZiFrIM9kkiMSgwGXaDpE5sxNsxCZ4nHlxylkw==
X-Gm-Gg: AY/fxX6cTKtx7b3hEODysU6EgnbFmj3X/XMrH4ujbkLq97zUUUhcV7MFQuEBuJhrUxf
	EgorE8/rMgZ+yWOZIJ5uPIqPSWJnR+dulYwiRnBzLWdNw4o1WwN4EsaIs83lADMEUPmC/RvBD51
	dEX7O5h2/0AYa4O0/ruNmPGwAMUWZb+jiw0fF9wy81qTVPPJTZPkYQCR5vvSc9gwXu0kkhuayMa
	hnsZWaku+AIf8io1Pj0zAPN7fbHxBaAw6SncyvV9DpwrFkpMTAQTNehNQ4lTiqHNxAx7pDepIfe
	EMbTsBNxDUdVue62QqaViPgk637g46bnxAN82bMiCU7mlx0eTsnFXGtM1eRccxnlHA2jjN5ON/2
	shLlsd58=
X-Received: by 2002:a05:6214:622:b0:888:1e72:afb5 with SMTP id 6a1803df08f44-89084175278mr119247706d6.2.1767914159612;
        Thu, 08 Jan 2026 15:15:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFL7O7vPMZW6sOxaNaFuKBoLR2gPzCvuZ7UhBJzab6n5voe+e3YSYX8tknOCwa8suxDBgRotw==
X-Received: by 2002:a05:6214:622:b0:888:1e72:afb5 with SMTP id 6a1803df08f44-89084175278mr119247296d6.2.1767914159183;
        Thu, 08 Jan 2026 15:15:59 -0800 (PST)
Received: from redhat.com ([2600:382:850d:c75b:2aa0:b08c:d81b:f52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f540650sm692982185a.47.2026.01.08.15.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 15:15:58 -0800 (PST)
Date: Thu, 8 Jan 2026 18:15:56 -0500
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Conor Dooley <conor@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 0/4] clk: microchip: core: fix issue with round_rate
 conversion and allow compile test
Message-ID: <aWA6rNLNqYfJKTzf@redhat.com>
References: <20251205-clk-microchip-fixes-v3-0-a02190705e47@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205-clk-microchip-fixes-v3-0-a02190705e47@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Stephen and Claudiu,

On Fri, Dec 05, 2025 at 02:46:26PM -0500, Brian Masney wrote:
> Here's a series that fixes an issue with my round_rate conversion on
> this PIC32 driver, fixes a minor bug, and allows building this driver
> on other architectures with COMPILE_TEST enabled.
> 
> Changes in v3:
> - Mock out cpu_nop5() in the case of COMPILE_TEST
> - Don't return -EINVAL in *_get_parent()
> - Link to v2: https://lore.kernel.org/r/20251201-clk-microchip-fixes-v2-0-9d5a0daadd98@redhat.com
> 
> Changes in v2:
> - Add new patch to drop unused asm/traps.h
> - Link to v1: https://lore.kernel.org/r/20251125-clk-microchip-fixes-v1-0-6c1f5573d1b9@redhat.com
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
> Brian Masney (4):
>       clk: microchip: core: remove duplicate determine_rate on pic32_sclk_ops
>       clk: microchip: core: correct return value on *_get_parent()
>       clk: microchip: core: remove unused include asm/traps.h
>       clk: microchip: core: allow driver to be compiled with COMPILE_TEST

Stephen: Can you just pick up the first 3 patches in this series? Let's
drop patch 4 for now. I'm going to send to the MIPS maintainers a patch
to move arch/mips/include/asm/mach-pic32/pic32.h to
include/linux/platform_data, and update all of the drivers to use that
new header.

Once that's merged, I'll repost patch 4 from this series to enable
COMPILE_TEST for this driver.

Brian

