Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC922BB17
	for <linux-clk@vger.kernel.org>; Mon, 29 Sep 2025 19:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759175670; cv=none; b=STS33A09HbM+H98eQeIUWQ8ycInINOgxMLdBs4YqGVmXnU812jHLFxmvd+H2tJ3QKVvogp/LL41UrXi+gcxkk25eQ3GNtmzq6guk62nxUZaqt3iX6mDp4ktpastIoVOi96TQnYa3nan5fj3BpPMb2zB8ojXEJL9qh9/L18hRino=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759175670; c=relaxed/simple;
	bh=qUNzPnV32PU/DAWJwLGiD+OFWfCnah077HcVK6ugnWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YiyFu7x3gd0SZ4Tm5Zz0Nrjc0rp8QLV5UPyEbGX2gFqN4zfowM314ybkB4Vr+7yqe2pKh6aEp8EDsP7bDajftiYN1m2S+N0tgy4WeRwzEgAnnX43IEyLdYLEcDBOgvPxoCk/BmYAV4d+XzRfcoSBBDZhYLPZaSljZuAk49k8mOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iR3ii/Za; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iR3ii/Za"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759175667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MtPA+6dU4CCxMU2eK/4bdnBfarm4rw4G5s3tke0e2sk=;
	b=iR3ii/Za1gJyGlOkIY5l80aVSFcoiODLIfMlT6cIoUiG2nubMy1tfyQ+6m3xKqJ/gCQQDo
	Ppgx22divVATLyyWpL/4ZL+CKO7yXAwedqxBCHsurkfXIa6//J0kHFu3Xt0v8V6/vpphtI
	QcuM8G3voHnxkIfLzuq6MhuOuX0OjSA=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-WhR-5MNVOFOY1jlA5haKEw-1; Mon, 29 Sep 2025 15:54:26 -0400
X-MC-Unique: WhR-5MNVOFOY1jlA5haKEw-1
X-Mimecast-MFC-AGG-ID: WhR-5MNVOFOY1jlA5haKEw_1759175666
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d8b8c3591fso142691251cf.2
        for <linux-clk@vger.kernel.org>; Mon, 29 Sep 2025 12:54:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759175666; x=1759780466;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MtPA+6dU4CCxMU2eK/4bdnBfarm4rw4G5s3tke0e2sk=;
        b=qrKcI2LTqzCOo6oOEK3n23dlnUixNclSRYPzbbWAUIioIMLgqZpRm7jLl7ckh9bEgc
         jx+RHISMIpwu91EWwv91uYbvLSTx3bKHIuAXlSjWy9E+/mWB6Ng/foIj39uNImjxkVm6
         hfWCjGDwiHUCQIFLJT+f2J36RqqafeunxChAv2cXjc+eryfTIA7qmflXF3Izx1OAwQaq
         xZykAo9Ru/WFYJIeyUFwwge/rKtZm3tG3zKX7IBc2lIYpAZLa+l6a0T8xB127/mw2hlO
         UCV+ayQgoBq7Rjo53czEPsapM3iJwj3j8iZr5BzDAnIcEf0Vc14YGozjh1ywpBeN/Oer
         WPoA==
X-Forwarded-Encrypted: i=1; AJvYcCUdHvXWt6Gl6fYDmgFR+J6GE15duoWQ6uVZWDd03dzC504BpWlZWHg9hzBn9JxV1BSnZlH4L8Ks6O8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPpK5GJGH7eg8vmxyosnDH2qDTZY33K6N1QUqd6AAuhkJTOYLC
	fCCXWnZgTACo/QOhqg0g2edzoQ2vaL8xrIqmmhlk2XImcXbQ072bQew4UF89Z4JsAeDiztXh+Ej
	htovlvwDLythX2FAKw/XYcaqxUr1+5YE8V/I7wlKl3K94tqKwbElsqXJbAoW2RQ==
X-Gm-Gg: ASbGnctNh9eSjpFBPaLkJ+F0IrLOhwEvAEGED94BdUxd+yJaUMMKRqcqaYgi4JV6BIy
	5BYLNv3rmnok8N7umOdRftILO0BKAj1rw+2WBE5rDAe9akIBD7dzVqx7ppaup8HeEJO90tESzPd
	Yeb9EZjSUgVHB7C88X07azaBSWm0i+FmFlvI16NFKCXMxhUgOBnvPzNUJ4+yk7yRWvHMDUq+mUd
	DyRck0fLxCUc2i/X8AJFLK9Ke4twoYJ72ncie2O4FR+rS101bghq6GdLsz8DekpHp5R4hGth5tF
	xuS/FvhC0BvVaeAIJFQKUGAoTus2Qqj6/Jgh7xi/6y7QhtrDoqNNIqHgfZX6qIFxrZlRPFYMv6h
	ukqZ22GobBnD9agjm3kKj4SS0rsieTYc=
X-Received: by 2002:ac8:57c9:0:b0:4b5:781c:883b with SMTP id d75a77b69052e-4da4dcc0865mr214472941cf.73.1759175665656;
        Mon, 29 Sep 2025 12:54:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3rXfc1pQBT6ofriZhAlQo27Y96yvwbHi4cZvFjayDhyDGYvTZaYgQnn2UmUxIX+Jm3FBmfg==
X-Received: by 2002:ac8:57c9:0:b0:4b5:781c:883b with SMTP id d75a77b69052e-4da4dcc0865mr214472691cf.73.1759175665315;
        Mon, 29 Sep 2025 12:54:25 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4db09f19da2sm83348481cf.6.2025.09.29.12.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 12:54:23 -0700 (PDT)
Date: Mon, 29 Sep 2025 15:54:19 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yun Zhou <yun.zhou@windriver.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, dianders@chromium.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: fix slab-use-after-free when
 clk_core_populate_parent_map failed
Message-ID: <aNrj60UeYQfXmlJ2@redhat.com>
References: <20250929083119.2066159-1-yun.zhou@windriver.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929083119.2066159-1-yun.zhou@windriver.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Mon, Sep 29, 2025 at 04:31:19PM +0800, Yun Zhou wrote:
> If clk_core_populate_parent_map() fails, core->parents will be immediately
> released within clk_core_populate_parent_map(). Therefore it is can't be
> released in __clk_release() again.
> 
> This fixes the following KASAN reported issue:
> 
> ==================================================================
> BUG: KASAN: slab-use-after-free in __clk_release+0x80/0x160
> Read of size 8 at addr ffffff8043fd0980 by task kworker/u6:0/27
> 
> CPU: 1 PID: 27 Comm: kworker/u6:0 Tainted: G        W          6.6.69-yocto-standard+ #7
> Hardware name: Raspberry Pi 4 Model B (DT)
> Workqueue: events_unbound deferred_probe_work_func
> Call trace:
>  dump_backtrace+0x98/0xf8
>  show_stack+0x20/0x38
>  dump_stack_lvl+0x48/0x60
>  print_report+0xf8/0x5d8
>  kasan_report+0xb4/0x100
>  __asan_load8+0x9c/0xc0
>  __clk_release+0x80/0x160
>  __clk_register+0x6dc/0xfb8
>  devm_clk_hw_register+0x70/0x108
>  bcm2835_register_clock+0x284/0x358
>  bcm2835_clk_probe+0x2c4/0x438
>  platform_probe+0x98/0x110
>  really_probe+0x1e4/0x3e8
>  __driver_probe_device+0xc0/0x1a0
>  driver_probe_device+0x110/0x1e8
>  __device_attach_driver+0xf0/0x1a8
>  bus_for_each_drv+0xf8/0x178
>  __device_attach+0x120/0x240
>  device_initial_probe+0x1c/0x30
>  bus_probe_device+0xdc/0xe8
>  deferred_probe_work_func+0xe8/0x130
>  process_one_work+0x2a4/0x698
>  worker_thread+0x53c/0x708
>  kthread+0x1b4/0x1c8
>  ret_from_fork+0x10/0x20
> 
> Allocated by task 27:
>  kasan_save_stack+0x3c/0x68
>  kasan_set_track+0x2c/0x40
>  kasan_save_alloc_info+0x24/0x38
>  __kasan_kmalloc+0xd4/0xd8
>  __kmalloc+0x74/0x238
>  __clk_register+0x718/0xfb8
>  devm_clk_hw_register+0x70/0x108
>  bcm2835_register_clock+0x284/0x358
>  bcm2835_clk_probe+0x2c4/0x438
>  platform_probe+0x98/0x110
>  really_probe+0x1e4/0x3e8
>  __driver_probe_device+0xc0/0x1a0
>  driver_probe_device+0x110/0x1e8
>  __device_attach_driver+0xf0/0x1a8
>  bus_for_each_drv+0xf8/0x178
>  __device_attach+0x120/0x240
>  device_initial_probe+0x1c/0x30
>  bus_probe_device+0xdc/0xe8
>  deferred_probe_work_func+0xe8/0x130
>  process_one_work+0x2a4/0x698
>  worker_thread+0x53c/0x708
>  kthread+0x1b4/0x1c8
>  ret_from_fork+0x10/0x20
> 
> Freed by task 27:
>  kasan_save_stack+0x3c/0x68
>  kasan_set_track+0x2c/0x40
>  kasan_save_free_info+0x38/0x60
>  __kasan_slab_free+0x100/0x170
>  slab_free_freelist_hook+0xcc/0x218
>  __kmem_cache_free+0x158/0x210
>  kfree+0x88/0x140
>  __clk_register+0x9d0/0xfb8
>  devm_clk_hw_register+0x70/0x108
>  bcm2835_register_clock+0x284/0x358
>  bcm2835_clk_probe+0x2c4/0x438
>  platform_probe+0x98/0x110
>  really_probe+0x1e4/0x3e8
>  __driver_probe_device+0xc0/0x1a0
>  driver_probe_device+0x110/0x1e8
>  __device_attach_driver+0xf0/0x1a8
>  bus_for_each_drv+0xf8/0x178
>  __device_attach+0x120/0x240
>  device_initial_probe+0x1c/0x30
>  bus_probe_device+0xdc/0xe8
>  deferred_probe_work_func+0xe8/0x130
>  process_one_work+0x2a4/0x698
>  worker_thread+0x53c/0x708
>  kthread+0x1b4/0x1c8
>  ret_from_fork+0x10/0x20
> 
> The buggy address belongs to the object at ffffff8043fd0800
>  which belongs to the cache kmalloc-512 of size 512
> The buggy address is located 384 bytes inside of
>  freed 512-byte region [ffffff8043fd0800, ffffff8043fd0a00)
> 
> The buggy address belongs to the physical page:
> page:fffffffe010ff400 refcount:1 mapcount:0 mapping:0000000000000000 index:0xffffff8043fd0e00 pfn:0x43fd0
> head:fffffffe010ff400 order:3 entire_mapcount:0 nr_pages_mapped:0 pincount:0
> flags: 0x4000000000000840(slab|head|zone=1)
> page_type: 0xffffffff()
> raw: 4000000000000840 ffffff8040002f40 ffffff8040000a50 ffffff8040000a50
> raw: ffffff8043fd0e00 0000000000150002 00000001ffffffff 0000000000000000
> page dumped because: kasan: bad access detected
> 
> Memory state around the buggy address:
>  ffffff8043fd0880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>  ffffff8043fd0900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> >ffffff8043fd0980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                    ^
>  ffffff8043fd0a00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>  ffffff8043fd0a80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> ==================================================================
> 
> Fixes: 9d05ae531c2c ("clk: Initialize struct clk_core kref earlier")
> Signed-off-by: Yun Zhou <yun.zhou@windriver.com>

Is that the correct Fixes tag? What do you think about this instead?

Fixes: fc0c209c147f ("clk: Allow parents to be specified without string names")

Otherwise, the patch itself looks good to me.

Brian

