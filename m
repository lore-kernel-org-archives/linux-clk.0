Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB0F26C39E
	for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 22:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777589492; cv=none; b=bTETyPKYVRpNrNGuHcrJH6fvLQAt2RzGliBtluhxMiJ53LUL9ebeAiJVd94jrZ4tbLDnLqdLaGNl1FA8JgxFxbDHf7EFO5E3S5CR1d6egIqI38HbAMfFosyKos6H7fUTdKfdjPECp2rxtTfGJOS3GbMdc1jREkf7GA532wpTO24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777589492; c=relaxed/simple;
	bh=ccySoFKEoNVQ75TK1fIyIDu/J5XEcUCUomg+Rj0oapg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MSpK4o68tyeBn1Sh1fcdzAcMnpbf9Un/Yt8dyDLfZxGzJvg3ip6+RCvWv+TkbdEfqFfMM4bVJWrXfEpQ5jSG/C9Rsc9Iq4VbCB0DU/HuABhmMmT9pwrWAwXuYpVrLtL5ILfTRh4pWOpFFHdcdvKRy5470S6F1zZy2vv4hC6kKKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KAjd6ZLn; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hTbEVrAs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KAjd6ZLn";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hTbEVrAs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777589489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HdVxrW5qbfv9o4/xQYAtdxN+n/sFjjbbXDDlDPx+0zc=;
	b=KAjd6ZLnsawFsmiirUyuJUIPCw8UVWjB6Ny1k8biVgKfYk6ikBi6nD8Dbc1x19zTU2RJbe
	aVajoESGW+Vak5vHOI5ujh0JLKjr2b/c7VFg38Hlt+KhBO3AXJRauDaNZQ/uV8NiaZIOiY
	VbahPUyuZv8mRZTEy4O4ej7LPa+Rjms=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-OlnPY3oANRiFurL5m4y4-g-1; Thu, 30 Apr 2026 18:51:27 -0400
X-MC-Unique: OlnPY3oANRiFurL5m4y4-g-1
X-Mimecast-MFC-AGG-ID: OlnPY3oANRiFurL5m4y4-g_1777589487
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5102a9671c8so27465991cf.1
        for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 15:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777589487; x=1778194287; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HdVxrW5qbfv9o4/xQYAtdxN+n/sFjjbbXDDlDPx+0zc=;
        b=hTbEVrAsUsjjGdpfbVWRlj1ctolSZLULfSkcePLvxvDxEH7xGSuu2M6QYH6MH28L7T
         I48zkN6lYytB2W6sAzy7+5Ta6iguzzPdHrA87Ja8sOeQqQe5IaqT2Ttk7vl7zD3Z5B4f
         Tmd1EWdRjBT5JUz4mXAHiCZpWpmblOgGmWk5gqEdjBnh1Sr8vQoXJzIw6PHusT9eUhb9
         nK4mQPpAkmbVyk0FCLXqSVOidaAKYqCkAQvoyxpo4auUk7y0IfM4PNkEb6j7znV32uXv
         ZIHfD89ICl065y4RY+lhM9gqNK1IlC4TXiHoLX+VvlEHLka4De4NKV2FuaxMrhihw/nr
         z6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777589487; x=1778194287;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HdVxrW5qbfv9o4/xQYAtdxN+n/sFjjbbXDDlDPx+0zc=;
        b=Vbw+aDxsPUufaehYWD88rPd2UWB9zj2OtfFKf6LYsM44AeTrE8fhQWHD/pRzbXzGJP
         pPjdi3ZArn0V7g1bPlQsQaCIZVPi0bR2qirL9G+0DfHCuybNN5wuV7Vld6ukkJ5bwv/X
         pYiBRxVDF8fmJVbj9P/yNm/rcU+TuASSu1KWZrSZfNV/Tgkzkeh3Rit5RHfxW8JRituj
         oqWBvbkd6zr4NSS7BPJMq2QwACuRfOo2OQxFQz18+Hw+zOMaPr3VmuTObRI1xFVHVL4F
         LC4LZrG1Q/DzH4iooAAI7UpFMR2Z57MLUeJq2Rk0vDwhV0fQPwEl+3iQ1jGaOIuqPVNG
         p6Zw==
X-Forwarded-Encrypted: i=1; AFNElJ9yYAuAOqAk5vAWU4UOJtbxsU+/bJYmeFoR5wyySxadTdnzz1W+2QD2UVsTdH91oSH++014MdEALjY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIyiJ6qgyoqPNTs8O4ov6GK1xf3TJipIZAlMEXcNPokdAwUhdc
	xNHhH1AwG/xdsfjs4vyVDXDPznyqXa6Br7AQ4Z3yysr2WwUeKPeXwB5RvHk1kzQTYnFeMt/d3/T
	QrZGMovMqUfv5VyyARv16BVY9h4puu1z4k8gEPdXCP8T+QxNplo8OHmtanxzwUQ==
X-Gm-Gg: AeBDietT/klujDBedCal5ohCsZ2L6mL4XvHaw0FJmd9uwSGH+lRWD72fHpQl8BDBq2b
	3Rx5qMvYJkqTyn2UYU5IPOh7jTQ1zr9pNvvCaOB9Dc7GmF3AxSmC/6Cpqmyq271roWLptKqlnjS
	WoRtdv0F9WoiUuTAZsQdWVW+hPy/HsP6IqcVHs22A8wxkd6HLq9UFbtZoNG753EyGUsEXdwZh4l
	gOk3SM6Uan3N06tpO8X94dQMWPPq+dqyqLLLs70/jcOD05SsuFJBxcb/oNN21FKvo2NI3qELwE/
	3raOSRuXYjzSJGgCnkMGr5sELuiWiPg6VjgZEhKs3eEwFRAmssd8DN4Fe1ATD620Bb32lRolNRO
	9OflQ9T3ki6HVCrcgjIkmblqjefzqTAo=
X-Received: by 2002:ac8:5ad6:0:b0:509:4406:44e0 with SMTP id d75a77b69052e-5102ab52a6fmr73290381cf.27.1777589486776;
        Thu, 30 Apr 2026 15:51:26 -0700 (PDT)
X-Received: by 2002:ac8:5ad6:0:b0:509:4406:44e0 with SMTP id d75a77b69052e-5102ab52a6fmr73289921cf.27.1777589486342;
        Thu, 30 Apr 2026 15:51:26 -0700 (PDT)
Received: from redhat.com ([2600:382:7701:f83c:fba1:9a93:4c64:db25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b538b1d761sm4868636d6.9.2026.04.30.15.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 15:51:25 -0700 (PDT)
Date: Thu, 30 Apr 2026 18:51:23 -0400
From: Brian Masney <bmasney@redhat.com>
To: Xuyang Dong <dongxuyang@eswincomputing.com>
Cc: Stephen Boyd <sboyd@kernel.org>, mturquette@baylibre.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
	huangyifeng@eswincomputing.com, benoit.monin@bootlin.com,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com
Subject: Re: Re: Re: Re: Re: [PATCH v3 2/3] clk: eswin: Add eic7700 HSP clock
 driver
Message-ID: <afPc66GcXiSzQ6uN@redhat.com>
References: <20260423091114.2326-1-dongxuyang@eswincomputing.com>
 <aeo8nn-eigzlojWx@redhat.com>
 <4e5c887.5a31.19dbf179fb6.Coremail.dongxuyang@eswincomputing.com>
 <CABx5tqK7p_XJHfXZ70gXhR88PzAteV7cVSFPoRzccgmjanADMw@mail.gmail.com>
 <177733570840.5403.12558106273673899411@lazor>
 <7a76d8cb.5bab.19dd3645d4e.Coremail.dongxuyang@eswincomputing.com>
 <177742748214.5403.15526965667317467444@localhost.localdomain>
 <4257942f.5c6d.19dd89b06f8.Coremail.dongxuyang@eswincomputing.com>
 <afINjhKluCxeb9LK@redhat.com>
 <1f0a2d11.5cd2.19ddcf8114a.Coremail.dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f0a2d11.5cd2.19ddcf8114a.Coremail.dongxuyang@eswincomputing.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Xuyang,

On Thu, Apr 30, 2026 at 01:58:58PM +0800, Xuyang Dong wrote:
> > On Wed, Apr 29, 2026 at 05:38:51PM +0800, Xuyang Dong wrote:
> > > > > 
> > > > > The common gate API, the HSP private API, and the reset driver all access 
> > > > > the same register space.
> > > > > Therefore, they need to be protected by the same data->lock.
> > > > > 
> > > > 
> > > > If everything is accessing registers through regmap why aren't we using
> > > > the builtin lock with struct regmap_config::use_raw_spinlock? I don't
> > > > understand why we're rolling our own here.
> > > 
> > > Hi Stephen,
> > > 
> > > In the HSP clock driver and reset driver, there are three components that
> > > access the HSP register space: a common gate clock, a custom gate clock 
> > > (i.e., 0x800), and a reset.
> > > 
> > > 1. The common gate uses eswin_clk_register_gate() to register a gate clock 
> > > via devm_clk_hw_register_gate_parent_data(). It accesses the register 
> > > using clk_gate_endisable().
> > > 
> > > static void clk_gate_endisable(struct clk_hw *hw, int enable)
> > > {
> > > 	struct clk_gate *gate = to_clk_gate(hw);
> > > 	unsigned long flags;
> > > 
> > > 	if (gate->lock)
> > > 		spin_lock_irqsave(gate->lock, flags);
> > > 	else
> > > 		__acquire(gate->lock);
> > > ...
> > > 	if (gate->lock)
> > > 		spin_unlock_irqrestore(gate->lock, flags);
> > > 	else
> > > 		__release(gate->lock);
> > > }
> > > 
> > > The gate->lock in use is the data->lock passed in from the clock driver.
> > > 
> > > 2. The custom gate uses hsp_clk_register_gate() to register a gate clock. 
> > > It accesses the register using hsp_clk_gate_endisable().
> > > 
> > > static void hsp_clk_gate_endisable(struct clk_hw *hw, int enable)
> > > {
> > > 	struct eic7700_hsp_clk_gate *gate = to_gate_clk(hw);
> > > 
> > > 	guard(spinlock_irqsave)(gate->lock);
> > > ...
> > > }
> > > 
> > > The gate->lock in use is the same data->lock passed in from the clock 
> > > driver.
> > > 
> > > 3. The reset uses eic7700_hsp_reset_assert() and 
> > > eic7700_hsp_reset_deassert(), which call regmap_assign_bits() to access 
> > > the register.
> > > 
> > > All three methods access the same register space; therefore, they must be 
> > > protected by the same lock (data->lock).
> > > 
> > > That's why we introduced eic7700_hsp_regmap_lock/unlock for 
> > > eic7700_hsp_regmap_config.
> > > 	eic7700_hsp_regmap_config = {
> > > 		.lock = eic7700_hsp_regmap_lock,
> > > 		.unlock = eic7700_hsp_regmap_unlock,
> > > 		.lock_arg = lock_ctx,
> > > 	};
> > > 
> > > The 'lock_ctx->lock' in eic7700_hsp_regmap_lock/unlock is the 'data->lock'.
> > > 	static void eic7700_hsp_regmap_lock(void *arg)
> > > 	__acquires(lock_ctx->lock)
> > > 	{
> > > 		struct eic7700_hsp_regmap_lock *const lock_ctx = arg;
> > > 		unsigned long flags;
> > > 	
> > > 		spin_lock_irqsave(lock_ctx->lock, flags);
> > > 		lock_ctx->flags = flags;
> > > 	}
> > > 
> > > The similar approach can be found in clk-imx8ulp-sim-lpav.c.
> > > 
> > > The annotations what we mentioned previously is the above 
> > > "__acquires(lock_ctx->lock)".
> > 
> > I see what Stephen is saying. Take a look at __regmap_init() in
> > drivers/base/regmap/regmap.c. If the lock/unlock ops are not specified,
> > then the final else will automatically setup locking. By default, it'll
> > use a mutex, but there is the ability to use a spinlock.
> > 
> > So you can drop the lock/unlock ops from the driver, and add to the ops:
> > 
> > 	fast_io: 1,
> > 	use_raw_spinlock: 1,
> > 
> > Given the critcal nature of clks, I agree with Stephen that a raw
> > spinlock should be used here.
> > 
> 
> Hi Stephen and Brian,
> 
> In the HSP clock driver, hsp_clk_gate_endisable() only accesses the 
> registers at 0x800/0x900, and reset accesses the same registers as well, 
> which leads to concurrent RMW (read-modify-write) races.
> 
> There are two approaches to solve these races.
> 
> The first method is the current implementation. All three functions 
> (clk_gate_endisable(), hsp_clk_gate_endisable(), 
> and eic7700_hsp_reset_assert()) use data->lock to prevent concurrent 
> RMW races.
> 
> The second method is as Stephen said. If I understand correctly, it is to 
> change the register read/write operations in hsp_clk_gate_endisable() to 
> use the regmap API and use the same lock (map->raw_spinlock) as reset.
> 
> Is the second approach preferable?

Use the same regmap everywhere. Also you don't have to explicitly define
the raw spinlock in your driver since the regmap API will create a raw
spinlock for you if you use the fast_io / use_raw_spinlock options I
described above.

Brian

