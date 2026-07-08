Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B65943711D
	for <linux-clk@vger.kernel.org>; Wed,  8 Jul 2026 16:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783528918; cv=none; b=BUe/cFjSl0JvPphSdEvgpCQigihK/qLbVPwP809BgYeuqglpDi5bjbWBdAYQ+PC2i34zs0wRmOyTLTrQFTzFMyOctZ8fnJmh6sV39N3a/ZPYW2jG7hIGfNs/Z4PuXRh13R6lBO2JGGKc7difgOgc1OG1LnY1RUumW/zquohs/vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783528918; c=relaxed/simple;
	bh=hxJeTTJpCgngpttgBKLmH7ptP6ELM2r7kNGcEsfXpko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XugiIq4xK4pcT+rlAxY1BekQr9mjOEfOVnp2hkeEPSr0wUstrKgweLwCAqtatDBSf83l2b8BzcTQ68XFenMIWorrXsaj5SJWr3zunPCgXYIvwDAK6UBIa0jnhAZBtanhNiKjkEKiDg1moPel5Uz7qbVaE4lJr8U2PWIwJbUKOHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SbCly8Jc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=klTcNqng; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SbCly8Jc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="klTcNqng"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783528912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KeN+eUGcS7y43ntst2e5pfjhEcVMN4wZLhE8yfU/Pkc=;
	b=SbCly8Jcz7CsAGIkkhNDDOYapG4eKnngeTw1HENSCWE/nO2SFisGsPeorTWdC9uiV+kIZy
	RcWVAwp3kxCmgOuohF75S771E/X+RfgSkhzGeybMFm+LRbLjKmHo4R9ZbNl9pG8wYJbMjU
	qnJg31weL8foaouLJtCza2a13/CU5x0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-eqbdfkOsNYWiSbaT7lrSpw-1; Wed, 08 Jul 2026 12:41:51 -0400
X-MC-Unique: eqbdfkOsNYWiSbaT7lrSpw-1
X-Mimecast-MFC-AGG-ID: eqbdfkOsNYWiSbaT7lrSpw_1783528911
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1b4d961dso487161cf.1
        for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 09:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783528911; x=1784133711; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KeN+eUGcS7y43ntst2e5pfjhEcVMN4wZLhE8yfU/Pkc=;
        b=klTcNqng2n3y589/zhRXCK9iucBkPG1i/Gos/foP6On4pSkdRuMZTY2acTb7lFQrKW
         Xcb+x1zRSKoth2qwBRsQ+xnyEOLqoOd5pIDKPY+cHJoFq35FKCl0/DNFNFXaySWMwnxh
         1eN8nZD/3UZH4Yyhv+bzvuukTvm0xetO2KpdINBQ5WmfSd+9ymzqHC5cu1y+GF8pXFh1
         Ua0b7kY47FEzZgV929s1EGqGPMCWLmY8DmYQGW/6Dk2ia2Gn7lEm1BeJY3XrsZeKp9Bi
         oSplTPy1obMOiZMg80LFMfvPWtdpnuIQQ7M9LsHACM4ibvXYV8m2aplVSRPniT3d+W6T
         KBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783528911; x=1784133711;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KeN+eUGcS7y43ntst2e5pfjhEcVMN4wZLhE8yfU/Pkc=;
        b=b2gw5LknbUjbmtTGQl7JpafpeiO/Mgd96Jg2QWCh7XFJnyFpg7KtpjVX9RjZs211ME
         zS1YV4TcXRmRESDMCpwCMDMltzir/0rboCYReWxYorWbdGIH7XYpH7RHWhNeTbBBrdiv
         t7iOGRXiD44YYftIUnQGcXuP2bULsCiMJ9MngB2Q6m2KttCeuKB2p1ISWVacpKRzifK6
         NfPL8fdwLn0TOCQ9oY8B8rO2g/sZ5SJrN3CrpstoP3npVWOF0Lsc0rCgwwe9CSo00mKb
         bvLA+etDOHbeJyhbe0dh3uNvZvjG0JaHwd/qKfb/Y3lI+lvswsqAz/AYqp1Ht8pUE8x5
         t2Sw==
X-Forwarded-Encrypted: i=1; AHgh+Rqh6h9KK81gZYAS8JoysuIbcrJ7bjTeEHyrjy2MepCi6Up2J5CwIjgSRQ/9LyJpLJ0tYJlHQMp8rvU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvbRsZrGEoPdEl1mzh3RSmu5DVBKpPlqoTHNOKP+WyDK+hLPcc
	V+/Qa2JT93dY0SigcJB/M3wxtuWHoKmSLcaYgajEGhKP2Mcb55/qYhpGfin/2Qp+p7E2Skep9co
	b54/wCkw0bhqW4e68fsVpQJC43yqJ3nWXyS1g0Y59VWbXZ4eWMsZ277ctMno0/w==
X-Gm-Gg: AfdE7ckAHMReZ6RXb5KMHd+f6IW/dkwa+ttU52Pmu7V90s27kvoQrqHATufLyjk+JuQ
	dXanYUEzGqHIK7MvLk130ZFZfABaSEbdvkoVy4mvXRiKxOHH3DQkEzmOKWlwxli6+g5ggPIOzA2
	mSEnnk8NOXX3KcDZgwSDlTepXvsyECLXA4Ijfazlxvos/m6V+B7FtxdozQN0l799KtWoICvO6Mn
	hvBL2I3Lukkr2H+0+c4UX24yflYzzATi8zUhXj3Cc0lI5NNTbu5w732v0f+a+EBNkpRcDThyA7S
	sHqrjWG9D0rFIdzpI/v8jge4I7keRnGmhAq9/IWi69L+a3Jdd3P1+CjrTWUGzvoCPAUCqfb5GaA
	UuPv2BRNWO39vJ1415ijldtgf323GAhWqjk+i1TJxBi+6+Q==
X-Received: by 2002:a05:622a:4cb:b0:517:f9cc:1fb2 with SMTP id d75a77b69052e-51c8b30e312mr36983761cf.19.1783528910855;
        Wed, 08 Jul 2026 09:41:50 -0700 (PDT)
X-Received: by 2002:a05:622a:4cb:b0:517:f9cc:1fb2 with SMTP id d75a77b69052e-51c8b30e312mr36983291cf.19.1783528910398;
        Wed, 08 Jul 2026 09:41:50 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c41b55495sm147695021cf.11.2026.07.08.09.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 09:41:49 -0700 (PDT)
Date: Wed, 8 Jul 2026 12:41:47 -0400
From: Brian Masney <bmasney@redhat.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>, linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: tegra: tegra124-emc: put EMC node on register
 failure
Message-ID: <ak59y2H3IsHsZ15L@redhat.com>
References: <20260708112058.750952-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708112058.750952-1-lgs201920130244@gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Wed, Jul 08, 2026 at 07:20:58PM +0800, Guangshuo Li wrote:
> tegra124_clk_register_emc() stores a device node reference returned by
> of_parse_phandle() in tegra->emc_node.
> 
> If clk_register() fails, the function returns an error before that
> reference can be consumed and released by the normal runtime path. The
> tegra_clk_emc object is freed on this failure path, but freeing the
> object does not drop the OF node reference stored in it.
> 
> Drop the EMC node reference before freeing the tegra_clk_emc object.
> of_node_put() is safe for a NULL node, so this also covers the case where
> the phandle is absent.
> 
> Fixes: 2db04f16b589 ("clk: tegra: Add EMC clock driver")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

