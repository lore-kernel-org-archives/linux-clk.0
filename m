Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863E631328C
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 13:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777470870; cv=none; b=QvKmYn/b+wpjwtBjkPUl5PU8MkeHUJ5xcPYHK4O5FvI4iZYxF0xhB6SKe3aJfHG6yk9jZnaZ43+FDdbXMAVXYruxlGe1jZZA6Da0QPcYA/l8Gaq9v29AWB+AOxmytu/zfQRqsQebf35cdlOcK7PbhGwplG104Dp2OuJQt4zthvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777470870; c=relaxed/simple;
	bh=vS8jTlV7vJf5epAPCK8FJZv/5Kw84W+ddsdPAeRG+SM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gBJ/xQ7hSRNCuTQ6aLa6fkxVY97FBiDbtwwHiTXMlniZZKxb4dvK+XcTknfxXWLTsjwFpiNkjvv2hXGIFFt7gYJDiwv0VuXLkcU1EVqiDgymaIZzHDWkWfoCkuRF4TMseEGRfU+KKkJUjIhoKoRFLE5Vb+Sr7VEb7dWyijrc2Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wp7MbYZ2; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CSR+GKQZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wp7MbYZ2";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CSR+GKQZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777470868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bTgoBaxd/nmRcg30O2LqCpudMdofCR0UFhzUM3cD8pM=;
	b=Wp7MbYZ2I5dtMvrWf9vrtpi6JQSzgVEaoac+rInUG4z9KwtAvlE22Ix52FzJONnR1byeqJ
	p1fSSwsfranDcoF6aoOVTOZJnl4k+ABZD9ID5CDOdvm8GqSs80IqJjCMfyeQki9giTu4TW
	pLLxaWGjp2+zKeic0qcw81nn8NqwWNY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-sf8lw_7uPgWhPZDPHGXU3A-1; Wed, 29 Apr 2026 09:54:27 -0400
X-MC-Unique: sf8lw_7uPgWhPZDPHGXU3A-1
X-Mimecast-MFC-AGG-ID: sf8lw_7uPgWhPZDPHGXU3A_1777470867
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50df4c130dbso24049441cf.1
        for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 06:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777470866; x=1778075666; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bTgoBaxd/nmRcg30O2LqCpudMdofCR0UFhzUM3cD8pM=;
        b=CSR+GKQZsGsRt8BBJLYdQHK4Qd/qQ6YemGw4LJ8EM3JiCVfkphbur1zPYTYQTYNg8Z
         zPxGzQ+Zx6iDxVPObnVxedTLAXC/F7mou1FNdxVuA+kQkhaaedg3iv+JqEA2tB1SlCa1
         GpDvOgmjt5nkHZwdAjLQoGIICnrj81YUBwFaAXGEZmmPPhvTwdHkWOx3qpT0NHuWDjK0
         Rn9jgOKB4OyGmmFimN1YOoJy+ZS49WxB3k66eR+29iB52TOjXsAR2DHgGdhXk29HE6x3
         nvvEXGsfrt1UXJj5R9hGjq4/QN+WTfFU/zXB+ZkmkGOfyMIhhLLf3rufqw3235DCvgDZ
         DFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777470866; x=1778075666;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTgoBaxd/nmRcg30O2LqCpudMdofCR0UFhzUM3cD8pM=;
        b=IOkregtxrWCxJsCAPJpWwx68bzZu1clFhBdS6h82fa9S+rOlwYoWMXV/86kDg3gCre
         1SBALXqbmBOjS9wM6z4aMJqHpEOA5/8RdR2fvyTm7fJCanzNb3EJSesytZXG1iuKRVJy
         t1vbDTC+UYWTCm2amF6+//aaBhT5LgqsVJnhpwiP5JQDJkEqMEw3mUkxSnp4TLAWeDoB
         CiDW/JVYfP7cEO3ckyNbjal/YkDBLFBDrwI6NruUjnxB8Ay3VMD0vBmizRlW17NFM4XS
         SI5zMdCx1ZGyFj06xwEGzISrP/BmQdpsisAKQnb8luRezDYPZQ4407R0lJTQAG6rAvIg
         6Y4A==
X-Forwarded-Encrypted: i=1; AFNElJ8j9eFqIG2wLpFpyfwbezHTeMZ6qG6zf1l+ng89c+fh3ERbs5GWlLSOJ6LUTyMCYxn9xx0Q0opBPZ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwA2Mv0344td1ePrEcyybykXMierKNmZ7VyLc2FoCqeY1VGWyUV
	t6tU+iafpZ4uHeCtAKJ5xfDXrUCQF+tzjfdHWLa/6+UeUQqnQSF8T6p3bKKsm8mqYk7k0neb8fl
	AOF9M2iRdM2Yz4w4i5us9tzv9UUZJ7gygS9coHLaHxYd+CH5dQNm4yO+x1c0khA==
X-Gm-Gg: AeBDieujSlnJEAe8q209JIVASza/1SVCYVl1Pn+hZ/+HHSfunuSzk/ZnroP+WV+Y+tS
	+6cAKsryUELqs+yOUkF7qqi1GtajqLnQhcN0UcCx/eGrEK85aqR9t7rweMS6huOeF6tA1uVDRAq
	AzIfvPJtJFWkLyI6mS2DNBth6JSgb3G6aB9GynCOisRqk3ZkBPoi1R3crhB+zeRBK4SsltE9qZ7
	5tW4LUUpCRArGAHZKmPYXVuhikTa7SmvPtsU8p3C4JBtZPQ0flmHUPakR3tLxCDDEmcjRwGB4pn
	SVofrF5panuhncul3lC7hwjn3oc375cdr0rydVJ8fGrmeliWfDX7GJoxbuIZQLYYSLe6nWnxk6b
	5gcj9ztZpwmtgOJxvHGOWNq8cpVf5czqLMZfW5UNiUlLStNBY/Ct3eFVpzaqtCTeNi9Q=
X-Received: by 2002:ac8:5813:0:b0:50d:7632:ddb2 with SMTP id d75a77b69052e-51019a37774mr41879461cf.12.1777470866500;
        Wed, 29 Apr 2026 06:54:26 -0700 (PDT)
X-Received: by 2002:ac8:5813:0:b0:50d:7632:ddb2 with SMTP id d75a77b69052e-51019a37774mr41879021cf.12.1777470865999;
        Wed, 29 Apr 2026 06:54:25 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ef7e88fcsm18011566d6.31.2026.04.29.06.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:54:24 -0700 (PDT)
Date: Wed, 29 Apr 2026 09:54:22 -0400
From: Brian Masney <bmasney@redhat.com>
To: Xuyang Dong <dongxuyang@eswincomputing.com>
Cc: Stephen Boyd <sboyd@kernel.org>, mturquette@baylibre.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
	huangyifeng@eswincomputing.com, benoit.monin@bootlin.com,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com
Subject: Re: Re: Re: Re: [PATCH v3 2/3] clk: eswin: Add eic7700 HSP clock
 driver
Message-ID: <afINjhKluCxeb9LK@redhat.com>
References: <20260423090904.2108-1-dongxuyang@eswincomputing.com>
 <20260423091114.2326-1-dongxuyang@eswincomputing.com>
 <aeo8nn-eigzlojWx@redhat.com>
 <4e5c887.5a31.19dbf179fb6.Coremail.dongxuyang@eswincomputing.com>
 <CABx5tqK7p_XJHfXZ70gXhR88PzAteV7cVSFPoRzccgmjanADMw@mail.gmail.com>
 <177733570840.5403.12558106273673899411@lazor>
 <7a76d8cb.5bab.19dd3645d4e.Coremail.dongxuyang@eswincomputing.com>
 <177742748214.5403.15526965667317467444@localhost.localdomain>
 <4257942f.5c6d.19dd89b06f8.Coremail.dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4257942f.5c6d.19dd89b06f8.Coremail.dongxuyang@eswincomputing.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Xuyang,

On Wed, Apr 29, 2026 at 05:38:51PM +0800, Xuyang Dong wrote:
> > > 
> > > The common gate API, the HSP private API, and the reset driver all access 
> > > the same register space.
> > > Therefore, they need to be protected by the same data->lock.
> > > 
> > 
> > If everything is accessing registers through regmap why aren't we using
> > the builtin lock with struct regmap_config::use_raw_spinlock? I don't
> > understand why we're rolling our own here.
> 
> Hi Stephen,
> 
> In the HSP clock driver and reset driver, there are three components that
> access the HSP register space: a common gate clock, a custom gate clock 
> (i.e., 0x800), and a reset.
> 
> 1. The common gate uses eswin_clk_register_gate() to register a gate clock 
> via devm_clk_hw_register_gate_parent_data(). It accesses the register 
> using clk_gate_endisable().
> 
> static void clk_gate_endisable(struct clk_hw *hw, int enable)
> {
> 	struct clk_gate *gate = to_clk_gate(hw);
> 	unsigned long flags;
> 
> 	if (gate->lock)
> 		spin_lock_irqsave(gate->lock, flags);
> 	else
> 		__acquire(gate->lock);
> ...
> 	if (gate->lock)
> 		spin_unlock_irqrestore(gate->lock, flags);
> 	else
> 		__release(gate->lock);
> }
> 
> The gate->lock in use is the data->lock passed in from the clock driver.
> 
> 2. The custom gate uses hsp_clk_register_gate() to register a gate clock. 
> It accesses the register using hsp_clk_gate_endisable().
> 
> static void hsp_clk_gate_endisable(struct clk_hw *hw, int enable)
> {
> 	struct eic7700_hsp_clk_gate *gate = to_gate_clk(hw);
> 
> 	guard(spinlock_irqsave)(gate->lock);
> ...
> }
> 
> The gate->lock in use is the same data->lock passed in from the clock 
> driver.
> 
> 3. The reset uses eic7700_hsp_reset_assert() and 
> eic7700_hsp_reset_deassert(), which call regmap_assign_bits() to access 
> the register.
> 
> All three methods access the same register space; therefore, they must be 
> protected by the same lock (data->lock).
> 
> That's why we introduced eic7700_hsp_regmap_lock/unlock for 
> eic7700_hsp_regmap_config.
> 	eic7700_hsp_regmap_config = {
> 		.lock = eic7700_hsp_regmap_lock,
> 		.unlock = eic7700_hsp_regmap_unlock,
> 		.lock_arg = lock_ctx,
> 	};
> 
> The 'lock_ctx->lock' in eic7700_hsp_regmap_lock/unlock is the 'data->lock'.
> 	static void eic7700_hsp_regmap_lock(void *arg)
> 	__acquires(lock_ctx->lock)
> 	{
> 		struct eic7700_hsp_regmap_lock *const lock_ctx = arg;
> 		unsigned long flags;
> 	
> 		spin_lock_irqsave(lock_ctx->lock, flags);
> 		lock_ctx->flags = flags;
> 	}
> 
> The similar approach can be found in clk-imx8ulp-sim-lpav.c.
> 
> The annotations what we mentioned previously is the above 
> "__acquires(lock_ctx->lock)".

I see what Stephen is saying. Take a look at __regmap_init() in
drivers/base/regmap/regmap.c. If the lock/unlock ops are not specified,
then the final else will automatically setup locking. By default, it'll
use a mutex, but there is the ability to use a spinlock.

So you can drop the lock/unlock ops from the driver, and add to the ops:

	fast_io: 1,
	use_raw_spinlock: 1,

Given the critcal nature of clks, I agree with Stephen that a raw
spinlock should be used here.

Brian

