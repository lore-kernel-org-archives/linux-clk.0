Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1DC415F10
	for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 21:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784670313; cv=none; b=dK70EshcgRvtN7FLq4JL7XoG3hoUZihZ5Kj00ZNDSQr5hj3iZhaEdPbs2QO2C8dUwOdVQxW6sUnpu38+2Q1RYDvxwsHPXp5MFRnkXNukhlUigCC2MTonjm1nC58lFnknosrrqbY4S36osdHG6THuT8CWuUzLiBLhxqBk6jXvJcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784670313; c=relaxed/simple;
	bh=P4vEW4E97s/Whcgqzj22YJd6YtHWK8jwLYQ5yOODq4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sxsR+LH3u4f4KRK8T8OCBZ1SZl6OqhKkFRykLVnZZA5pBOVp7clPScfQBGBrD9utHc0f918a+lWZbZAWS52eIPQivCLysHxTJZBfbFVyw51asnhSJL5OPHM5XstdYWJr+9jZqKiBxhz6JTN+JhBUayd3773Tvv1sbGYxKY4Lc1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ysx/c8WK; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=I9Bnz9bp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ysx/c8WK";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="I9Bnz9bp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784670310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CzmiG2Js6lBhSRfjmB0Juw8EH5EE62nACbevKWRU0bs=;
	b=Ysx/c8WKUBomb6FHvx6BSVjU816oOk39pvikopbS/bS9Uq7IQswCxNRV2gznXEegCw6rJP
	C9HM/ucYJbRiAm9PY0/FTQb7Dy4ja/e90H89upwt8/T2O7yBwNOpszWlZdM5wR4I6ds1J3
	n96JUjmdxxblVpfFDH7FmWzFPEzEDc8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-czC5zT50MsGrQgAEi6809A-1; Tue, 21 Jul 2026 17:45:09 -0400
X-MC-Unique: czC5zT50MsGrQgAEi6809A-1
X-Mimecast-MFC-AGG-ID: czC5zT50MsGrQgAEi6809A_1784670309
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e7ee64b25so1429774785a.0
        for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 14:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784670309; x=1785275109; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CzmiG2Js6lBhSRfjmB0Juw8EH5EE62nACbevKWRU0bs=;
        b=I9Bnz9bpOO/NU+Hl305x6+bg7nGZyhweEkH4XEsz7qqNpINXQ7ONU3wo2sP1cqdpLJ
         wKgIIz/a6n4EIin+cHdD8h72Ad62rwL5P4h6bZFEaHuqvk3r/dllgD3VUtSCdhsZCc5l
         nCKwgKE1o15Il8IKrf7oDEY/RhU+lAscD0GkfaUNXPjob449BSKXHIFDD2iIysOL/gXs
         l7PScho2yXkXCNQ2SqaqdBCN7YoztxohSFqwU6PMPA1DItQPHPHzvtRAmt+plW/ODXwd
         nW6qaDR3IF52PZB3Lf6V35q0Zk4PvBAiEbla/1wDrOLqhUIOhn+jvfPO1A8BprO202V0
         DedA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784670309; x=1785275109;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CzmiG2Js6lBhSRfjmB0Juw8EH5EE62nACbevKWRU0bs=;
        b=M+KEFXkchR5LPCLaO+aKfvPasdyLjepGAUdPVBKtCNvzws/h1bDlygAzy+1w8Qg601
         nLzKGPoRbX9Ry+SiLWYG3j4CnMP+cqFXz/J4e5/94u7msjbZRx/ir+S5YzMUPoAg+h/X
         lF1otczx29KcZ4tF/m/7IVKu90g8qQrWSZNPtSkxDQphxP5mgkQo02KmLFlHJT6gSLP5
         K7/Ax1/vx7mkjlc3ncHYR0wQWrg3K2cZZDq98/lqw5AkcN18FYCLWWpFCih6G8n2/oLf
         0euzT+dolQnv5FuopVq5XdBL4fl5R6e+vkKmUwVRiq+BIlU1xrgwVEm7Nrruo8VxesMd
         upGQ==
X-Forwarded-Encrypted: i=1; AHgh+Rro9Clfh61k3GMQ1cpPfocws26SHmZOdUvFTjAJcpRvCLuWlEaOyl7An5fD+lPounQwF33igiDMNmQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrqBlPFot7YzfNbi91JdibPQ2XMDZ+bDVIRoA+0TbEDmeY9VNK
	d3OcTerL/C+B9scT0Rntq4npqaijw7czFgPpWQqUE/CrXy4hTj8KImM/A3Z8LB88OPcunH++mkK
	AWQKuyx4ysKyAWZ5I+3/h7AVk9i2sLrrR5hCXOEUr9CWa3qTd0AvmtcCwjHb2XQ==
X-Gm-Gg: AfdE7cmPwFUR5/S64qZhE5Xh8BJ8xfoZMlQQgwYSW6mP/EhSEdXul0XgWnZvlU57J4b
	6B9oSbi0sYLK4vAskCgCGmclliqHOR5NE2OCAOAdkgufZlZi7I5z0vmQ+PXmZnL61pGCmqo+UZQ
	6z42Txc6UbAMktUP+6EnSzNN0rdNK/Y/v2Ap3q//xIbymiQyLDm6/GcLZAqmvPEizSDUln22X/+
	GEguThHDuVjZzovTd+K0pgPdS67EAft7e/esU2AuazP+3G03V/41zAbFJfPqEmS/p3Z7YWNX3t7
	Y2ikygBLP3no+1Z8aQc7qbudCDTg46VfWUzxNMG1RfcvRxuDngzsBez3yW1YmdFM9nfyouwwkgN
	9LF0/R7XS4ic8j44OHmvi3jgKA1vOe7/xebc=
X-Received: by 2002:a05:620a:6287:b0:92e:44be:bbd2 with SMTP id af79cd13be357-930b3e6fa07mr2011536185a.9.1784670308949;
        Tue, 21 Jul 2026 14:45:08 -0700 (PDT)
X-Received: by 2002:a05:620a:6287:b0:92e:44be:bbd2 with SMTP id af79cd13be357-930b3e6fa07mr2011529885a.9.1784670308359;
        Tue, 21 Jul 2026 14:45:08 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b52df3f9sm1222910785a.8.2026.07.21.14.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:45:07 -0700 (PDT)
Date: Tue, 21 Jul 2026 17:45:05 -0400
From: Brian Masney <bmasney@redhat.com>
To: wangjia@ultrarisc.com
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 0/3] clk: ultrarisc: add DP1000 clock support
Message-ID: <al_oYeD8EKHAGnPl@redhat.com>
References: <20260720-ultrarisc-clock-v4-0-fe639d63bbac@ultrarisc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-ultrarisc-clock-v4-0-fe639d63bbac@ultrarisc.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Jia,

On Mon, Jul 20, 2026 at 08:38:03AM +0800, Jia Wang via B4 Relay wrote:
> This series exports a small common clock helper and adds the devicetree
> binding and clock driver for the UltraRISC DP1000 SoC.
> 
> The clock tree is driven by a SYSPLL and provides fixed-factor clocks for
> the subsystem and PCIe, divider-based root clocks for GMAC and the UART,
> I2C, and SPI blocks, and per-instance gate clocks for UART0-3, I2C0-3,
> and SPI0-1.
> 
> Testing:
> - dt_binding_check and dtbs_check on ultrarisc,dp1000-clk
> - Kernel build for RISC-V and boot-tested on DP1000
> - Modules build test for CLK_ULTRARISC_DP1000
> 
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> ---
> Changes in v4:
> - Drop the initial clk_hw_get_rate() max-rate warning after setting the
>   divider rate range.

I also see this in the diff between v3 and v4. Is this expected?

 +++ b/drivers/clk/ultrarisc/clk-dp1000.c
 @@ -0,0 +1,154 @@
@@ -309,8 +309,8 @@
 +	.frac_mask = GENMASK(23, 0),
 +	.m_mask = GENMASK(23, 16),
 +	.n_mask = GENMASK(11, 6),
-+	.oddiv1_mask = GENMASK(4, 3),
-+	.oddiv2_mask = GENMASK(1, 0),
++	.oddiv1_mask = GENMASK(1, 0),
++	.oddiv2_mask = GENMASK(4, 3),

Brian

