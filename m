Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792448223;
	b=VyddqOA2toU1F2wXHwP9CMME1AxXY3JNGBEKlGyEZcDYobTK9f8uVvUMGV7idPtLB085
	 vk7lGNw5MIyXaENJL8BF7X1XJf8cSMHfxmmQTf4PStT/Tn0j2OVZkkSzZcG86FUwJgsKT
	 27yxPYKwyu1qMXy0Nplf1RxIQzX+2StT7Pp+PrahNashyD7MAG50y0qfdnfGAoMiOs0HM
	 WBitrnkBntKV8TzmYAAhKRoZx7DmkDIMLmqjuttBkJLOWLOiBifuwfEO+vjunr/EGFJeY
	 jFC1E0kRPkc+71R+vbFsyCAxa3D9VZ1F50+fmAE8ZzqIIQaDHMfbu4mR3OOZ0y2xHXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792448223;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=zRJTeMWmwyeteHSitD0X0AULZiFtm+NfCHUhoRCgyVM=;
	b=cRh+jGuH7BRw7ulfKji6zXoM2dT03x+6D8E9MmkMF0LQe74tuv7PzsPGsDDBk9FGDZxP
	 eJr7IREkiUTFegPiOJAHNJKwFxoUZzaDOeaHy2f6wfggKZItMxKsRoqkTdctbyysTz3Fs
	 UhmKxMb1yGiz9uVfSz0ez+72PB3h9UaUOf0RckVhLW1xZI8I/g08u5hOgBvVM03i0ks1Z
	 YAgyr7ZhA1yjtJKyLz5ST+sRXG3yu1FucHlksSjFcD+lnPgy68QFOK28riR9/lX9HKZWE
	 iPICKi8WQ0BF5q3FKcepCYzKivSSW/Srulr3+r4F4qn8LxvXGSn1WWX7tguMuSAykcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="FIwt/DEw";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pgNB6bJT;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355CD606A31E
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 22:17:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 355CD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FIwt/DEw;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pgNB6bJT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792448221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zRJTeMWmwyeteHSitD0X0AULZiFtm+NfCHUhoRCgyVM=;
	b=FIwt/DEwBkbYwoebF3ElzJh2ggGIbj1qzKba4zO8AJ+KpXMYsMrQgg0nblxRYWPWY7TJw8
	jEukznh5LrpvaID9LwxJ2uJrsFHs5Pg5Fb3R/q9dUClFDvTkVz08ZdrajBLGQKo8gpVc2N
	y8ja05GDLpU875yhcsuQvpZi4VQUiTw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-a4Ot5s5rN5yAAhsh6lFbwg-1; Mon, 19 Oct 2026 22:16:59 +0000
X-MC-Unique: a4Ot5s5rN5yAAhsh6lFbwg-1
X-Mimecast-MFC-AGG-ID: a4Ot5s5rN5yAAhsh6lFbwg_1792448219
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so800066185a.2
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 15:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792448219; x=1793053019; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zRJTeMWmwyeteHSitD0X0AULZiFtm+NfCHUhoRCgyVM=;
        b=pgNB6bJTeVm+ECMjWtESp2dfpouBWGGHhEkV2pzYr9op490zYFYmi2XRIGoEt8mk95
         iQBI5c4W2+aQcRCBDEmuE2TbxsOpjCUGJYFwqaqn6GXyU3cCXbmOiaCRDcAqUT9rWxCP
         3VPYztIUZJg8vjw/BasvSaFRSeBuRgQ8FfsN8XkCqmaIWVd6Xv+rijcIQbTRUskQ0xcs
         UTpKhi28zTRoGevzaAuUtXbRQQuyo4+Njrv966VEIijlc+yUUfNssoP1ggWXmDxelUs7
         vd80/Qj9wPnU4QeUl8oad85nIDq1x3uge70Hoyl82d/2pQ3L6YI8+z+g2PsehX9svTFF
         +9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792448219; x=1793053019;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zRJTeMWmwyeteHSitD0X0AULZiFtm+NfCHUhoRCgyVM=;
        b=Ru3AI0Aly0UlFNbxkbNdpmO27US6Xs2t9HSUDUlVfxSfU9JDOqNP0nAwsxl1XFy264
         3v/GFtcv5Fugej1DCBIl26bEbSd4l/8jvvj1LnfueJ3KWBlfc8gZuvAf1d3CwZKD4KQu
         xKKHO6knFxY7c+DQE8Ecj2vzDhRVZ41z2Lo61xMOv7x2Mvb0cHe53XI/lSucrjS/cLuw
         Qs7Q8s8luIbNqGmHtOm5L6KhZ7lFhXxqmtx1/a92eZrtY6pp3hMvCI/MUulNncmjz0qg
         E2MgD4lBoZnhfajw2MZdS3A6wyyLYQIuZIehtncqvAmL+IIiUD+mA16ejZqKAt6lgxAv
         3olQ==
X-Forwarded-Encrypted: i=1; AKwUvBzP++EXuGXxX24GAcYk5osN9LM5xQUj9VvZz4lMxQJANHU7m0GeFcwQsnOV29hduaHGRKBRryHDLY8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsnf7P4x+uMD0Vr2dP1G62t+yscbLuf1L7LeJJLFO4QKykDFUP
	gNyfK0s6IepAiAuNejgZ6n7jAttzh8/xQ8fSxiUYS4ou9KDRsOYnekJhpWjpkLs3mBzsg4FqEJq
	TEmrSWqJUSqRjJuERnyB4PJCTLVzJ68PU4RbE9X96lmWwMs0dxXeBLQq7Zo5n0DzHjDoIDQ==
X-Gm-Gg: AYBFou13fqyr35gMhpeMAeAvzP3LYKwtErAqB2loXgZFtDEudslPkZijTyknyr5HWxT
	BB9TtFmUa5U31cpOhcv8xchhvCDLGn8b5vO1VveW5XKTESCcHw85BvBICh6kg0kp86JLIhmX3OF
	wGFZChbY1rDB8aLZoC8adBhABz5PmK6P0YmBNODYAQsi05U53eaZ8lJF5H5oHHIBxy2g7at5H4g
	FrNioNQsZPm39zVq5TUR3Wg9K8QPxkD1/UrmJjqX4YRhffZOpDdGcgbxrKzNY9nfQVSCZuyR+rJ
	toOLH+rMbHDiG0vjK/6XyQmTzBlUiLQnjRSp5FRvJMl17G3Z6U4dDut26CaAEH2pkAjIpYOjK2i
	2t1ast1mdskJgs3g89vre6Z41F/s=
X-Received: by 2002:a05:620a:444b:b0:93f:47fa:b727 with SMTP id af79cd13be357-93f47fab7d0mr334485185a.28.1792448218963;
        Mon, 19 Oct 2026 15:16:58 -0700 (PDT)
X-Received: by 2002:a05:620a:444b:b0:93f:47fa:b727 with SMTP id af79cd13be357-93f47fab7d0mr334481985a.28.1792448218430;
        Mon, 19 Oct 2026 15:16:58 -0700 (PDT)
Received: from redhat.com ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c0405ec3fsm7982966d6.7.2026.10.19.15.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 15:16:57 -0700 (PDT)
Date: Mon, 19 Oct 2026 18:16:55 -0400
From: Brian Masney <bmasney@redhat.com>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] clk: Free the parent map only in __clk_release()
Message-ID: <ataW1-SGLhXJIcBB@redhat.com>
References: <20261016164050.790594-1-nickolai@csail.mit.edu>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016164050.790594-1-nickolai@csail.mit.edu>
User-Agent: Mutt/2.4.2 (2026-08-30)

On Fri, Oct 16, 2026 at 12:40:49PM -0400, Nickolai Zeldovich wrote:
> clk_core_populate_parent_map() can fail in two ways, and since
> __clk_register() answers every failure with kref_put(&core->ref,
> __clk_release), both end in clk_core_free_parent_map() walking a parent
> map that is not there to walk:
> 
>  - If the allocation of the map fails, core->parents is NULL while
>    core->num_parents was already set from init->num_parents.
>    clk_core_free_parent_map() only tests num_parents, so it reads
>    core->parents[i].name through a NULL pointer: an oops.
> 
>  - If a later kstrdup_const() of a parent name fails, the function
>    frees the names it copied so far and the map itself, but leaves
>    core->parents pointing at the freed memory. __clk_release() then
>    frees the same names and the same map a second time: a double free
>    on top of a use-after-free read.
> 
> Both arms are the -ENOMEM path of clk_register(), clk_hw_register() and
> of_clk_hw_register(), so of every clock provider in the tree with
> num_parents > 0. A user sees it when a clock provider's probe hits a
> memory allocation failure (in practice under fault injection, as these
> allocations are small): instead of the probe failing with -ENOMEM and
> "failed to register clk", the kernel oopses in __clk_release() called
> from __clk_register(), or, for the second arm, corrupts the slab
> allocator and reports a double free.
> 
> clk_core_populate_parent_map() has cleaned up after itself since commit
> fc0c209c147f ("clk: Allow parents to be specified without string names"),
> when __clk_register()'s fail_parents label skipped
> clk_core_free_parent_map() and only the later fail_create_clk label
> freed the map. Commit 9d05ae531c2c ("clk: Initialize struct clk_core
> kref earlier") moved the freeing of everything into __clk_release() and
> pointed all failure labels at kref_put(), so the map is now freed by
> __clk_release() on this path too.
> 
> Make clk_core_populate_parent_map() leave the map to __clk_release():
> return the error without freeing anything (the map is zero-allocated and
> kfree_const(NULL) is a no-op, so the partially filled map is freed
> correctly by clk_core_free_parent_map()), and have
> clk_core_free_parent_map() return when there is no map rather than when
> num_parents is zero, which is what clk_core_get_parent_by_index()
> already does for the same state.
> 
> Found by formal verification of __clk_register() against the kernel
> binary. Reproduced on riscv64 under QEMU by re-running a fixed-factor
> clock provider's probe through its sysfs bind file with failslab aimed
> at the parent map allocation: the unpatched kernel oopses with a NULL
> pointer dereference in __clk_release() (clk_core_free_parent_map() is
> inlined there), the patched kernel fails the bind write with -ENOMEM
> and logs "failed to register clk". A userspace transcription of the
> four functions reproduces both arms under AddressSanitizer before the
> change and is clean after it. The clk KUnit suites pass before and
> after on x86_64 and riscv64.
> 
> Fixes: 9d05ae531c2c ("clk: Initialize struct clk_core kref earlier")
> Assisted-by: LLM
> Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>

Cc: stable@vger.kernel.org

This looks good to me. Can you summarize the commit message since this
is a bit too verbose?

Brian

