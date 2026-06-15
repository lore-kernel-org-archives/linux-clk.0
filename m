Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8CB29A9E9
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 16:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781540737; cv=none; b=k7+EQH10AdQdkEp/jO2jgD4drvdEA6UE5GpkzTfhgR5hSNhCNi1jbanFoMRAz1daXoOfDVVjRfr+d67DEGcvhRNyt+lWsf6lF0MaPexCUqL0njA2eyS1OTXRL4FgrMYjV3bnz2w5jQA+MaNLeU+gRG+Elbq8ocOJpJhEJ2ZlHHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781540737; c=relaxed/simple;
	bh=cpdanrEZZHYCGntBgvw4/HKw7MxEee3lLVlcLcKZywU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJSzva6Wn8jpKPOKO3cjxLq7zylDRgH6BadxQtNwM734SF8nI4vN9JIpfDSn/WSsd9fhtKPSW29qj6PJvcjhe4+Kred6VGbbl/i/AsfVW1Jl6mn+0mJMS4QdarmUXun2UGSt19pJKRbodK0GX0RJNoCfrV0M/mUQ2oPnhO5Nc94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F97bjxDB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=EXrGkYhu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F97bjxDB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="EXrGkYhu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781540735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S6+ytjL/MSnSv+jJWWBaXjsErY34EnWmvQDfkC5ZS6U=;
	b=F97bjxDBfPteHLPJSUPFYRhNk6OLcmqzPXWMXvj+Q+lItUhc7AJF56D3XGg8e5udM0FKnd
	ebpuKGSKLtL3Pm+D1IM5b8VmnyvGACTh2LiArn4174chSaZWFLrqT/oZrFYd2nDOEVMr3p
	LXR/f+/BmWLdDdw+pGqIR+ifqMDQNpo=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-NBT2BW3MPqqreUwfLGSijg-1; Mon, 15 Jun 2026 12:25:34 -0400
X-MC-Unique: NBT2BW3MPqqreUwfLGSijg-1
X-Mimecast-MFC-AGG-ID: NBT2BW3MPqqreUwfLGSijg_1781540733
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5175b7946d5so28745661cf.0
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 09:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781540733; x=1782145533; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S6+ytjL/MSnSv+jJWWBaXjsErY34EnWmvQDfkC5ZS6U=;
        b=EXrGkYhuspb2jO7Q1UU5ThlX0C2lyjoAjGNxoKSSmcD7fL+KPUr0zB1Hovnjmgxvdg
         zTpFsLdzpmWtLMJp/Tlo6wjD3pcxlCH92LstTklnBDAUWectJ+NSN9d4fd10MCUzxiN6
         2Dz9t+KJdfsvavIjCnTn2RdekO5/dXryUHzlPGYulYhJVWZd7GIRYbtuw6jBjsA6wdsV
         se8uEsn+TnPLg5vX7V2YnH3C2oaZynoUvxL9dS1j11GOWmjrUlqT5ONycuKMxtufNb8w
         TGeHDUAsipvtAM0amPjNheu57O/xOnLKoEBHXDAa0CxM6+8tphg5khMkAvFei0ueynjp
         Uogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781540733; x=1782145533;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S6+ytjL/MSnSv+jJWWBaXjsErY34EnWmvQDfkC5ZS6U=;
        b=nKgEomZdg9Dn6O2X+nJJfslGsVDzWOwyzIrFZF48GGWPaJGDM605HqQ39JmkYy6JdH
         w+Cno7/RowiEchKY4b4nnZoZOBNDWoqzCPOCwVIN9Anol4m6AlBN5drfxOBPhz5bxWcP
         Ec+Sw8F7D2EmcNObynV77/W2cDSJVN4MCA0kcmxSfdjLhapE6w+TtaUxBnx5x2k4VDGu
         rV3go6XD/JkHSI/jzGYg7VbRpSK5vEY101SljooYuzBu7+GnnI1bdKuh4fXtVh35hniD
         YsgIom4bdjexNx9fyW7EagEF3lMkaGRBdqvnDgA/m5Uc18O4cW7KQWIV+2DDu3mwatXB
         pd4g==
X-Forwarded-Encrypted: i=1; AFNElJ9cNj7FDUvGVW8TctVX+w/FpyYQNa4N5wDAkcb1PiB4fkDunBYarOuMuvCfaio9RMvnG/sHWGcdaVU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhcWHQChuvczk6E4n/DLmxw8rCiRk1Kolb1kOXe8rbBVwv+R03
	wPZ3Mw8490GrYY4I5buCvuGrneFZdbiFfsFYYq9EYz1MlsQkeC0JCa57cfGJEhO6VruexoNnsFX
	8UA4G7LoXfQowqzJyaZ6o7XIle10J2RcrFhFp03TLyiuK5hKIYfq93NXU9SKYag==
X-Gm-Gg: Acq92OFE6QTdZlcVKL/QWDVYbmWTL0Q3NpuudqIOUt7/0JABAJlBErmgnrMF68iyz6x
	4JZ2rfBDLz71lchUZt7hqZD8sVJmUovAnhd5WY/G5i/jOu4SQSCH7tQzawKdJr0CNCIXKor71B1
	z2adhGmtMjUzVCniwZM4UawMsznOH0K5IEk1qe8QURNkdLjpr/cH0iI31cRREiGyvsbp+ntnzy7
	6jWL50vGH7Ij7RU8a87CfbrSpJNrK91QsnTgqsLlJtVl5Z1WLgZDCSMaCSlzSTL7/HtI7Uf7itO
	h6ZCb/B+ujIlExpMPJyn1qunE2LRFSQ78dUGGu0vm2xjFN9FMNd8jgKaSloPjHtt+NQ/sUfUbSt
	T+TlGDHcBbp+y5/oJ52DOXBlTejhWUM6iAeOOM19LCOiyuIik+fXBQBoY
X-Received: by 2002:a05:622a:8d10:b0:517:75d8:b95d with SMTP id d75a77b69052e-517fe5e362bmr202151391cf.40.1781540733543;
        Mon, 15 Jun 2026 09:25:33 -0700 (PDT)
X-Received: by 2002:a05:622a:8d10:b0:517:75d8:b95d with SMTP id d75a77b69052e-517fe5e362bmr202150821cf.40.1781540732938;
        Mon, 15 Jun 2026 09:25:32 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d9f4557d43sm2803126d6.31.2026.06.15.09.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 09:25:32 -0700 (PDT)
Date: Mon, 15 Jun 2026 12:25:30 -0400
From: Brian Masney <bmasney@redhat.com>
To: dongxuyang@eswincomputing.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, huangyifeng@eswincomputing.com,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com
Subject: Re: [PATCH] clk: eswin: Add CLK_IGNORE_UNUSED to NoC clock
Message-ID: <ajAnepoevsCEHdqg@redhat.com>
References: <20260605092118.1945-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605092118.1945-1-dongxuyang@eswincomputing.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Fri, Jun 05, 2026 at 05:21:18PM +0800, dongxuyang@eswincomputing.com wrote:
> From: Xuyang Dong <dongxuyang@eswincomputing.com>
> 
> The gate_noc_nsp_clk provides the essential clock source for NPU,
> DSP, and PCIe subsystems. During kernel init, the clock framework
> attempts to disable unused clocks when clk_ignore_unused kernel
> parameter is not set.
> However, gate_noc_nsp_clk is required to remain enabled for these
> critical subsystems to function properly, causing PCIe boot failures
> when auto-disabled.
> 
> Add CLK_IGNORE_UNUSED flag to gate_noc_nsp_clk to ensure it stays
> enabled even when clk_ignore_unused is not specified in kernel
> command line.
> 
> Fixes: cd44f127c1d4 ("clk: eswin: Add eic7700 clock driver")
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

FYI, I posted a series to implement sync_state support for the clk
subsystem, which should fix these type of issues for the long term. If
you happen to have time, I would appreciate it if you have time to test
this series on your hardware, and drop a Tested-by.

https://lore.kernel.org/linux-clk/20260603-clk-sync-state-v1-0-457120eed200@redhat.com/

I have a new series ready that I'm planning to post tomorrow. I'm
waiting to hear back about the ongoing conversation on that thread.

Once this lands, there shouldn't be much need for the CLK_IGNORE_UNUSED
flag. I'm curious if you revert this patch in your tree if the need for the
flag goes away with the sync_state changes applied.

Let's get your change in the tree though. If we merged sync_state today,
it won't be eligible to be backported to the stable kernels, and the
CLK_IGNORE_UNUSED flag is an easier backport.

Brian

