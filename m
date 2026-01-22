Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD8536604A
	for <linux-clk@vger.kernel.org>; Thu, 22 Jan 2026 23:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769124718; cv=none; b=jF9Wx+8udYSBL9wAt3stccdu7IVXVNwJWMl91iv5hrxLe0IBY8uu3pdKp4/imlp8iesouDnCjrGR7iGHS2j44xD2YKJhGw/rKd3QRmHlmrTcefwUAXi3mwZRaAkUn6GbQDqWoU7SjAXv9IQNdJ3vXYB6a+xVYssw8+v8iTC8wYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769124718; c=relaxed/simple;
	bh=f1Cfg2cnUjT0UcyXwiMiffLjui6lfY4vfenovLngMQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OPL5yOX2ExDsqDXOaG+hcshttxcKMW7Eph4FYZEamcP0zSGlNCF7xeHwr5II7rnHGfZ1zpASKqpKuXGoFbhanhnvRYrgQM7l3X7FcPXFcq8oMYXL3HLGKK1ghG42jccsncP41YtX+uf11buz/o8Cdi2Fb7738ffdKoJmgBM2VGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g6In7IF3; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oXHvKgTB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g6In7IF3";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oXHvKgTB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769124711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RKN8TnoDSmWpOwAv94N5M2R+RBbJgduzlKLXPs+N8/Y=;
	b=g6In7IF3Yq9sDzrTRjGumH6xgnjAxO0X21CDNZPPuUyzuGGpKpMRJdnc2J78pTsB9qc9Q7
	puoOkMG02WUFbtRG/7Hn2m80jv9U6j+zEPnfEYRQaNk47he1T/W+Gp9IZ3qkfHjk7Fg/d6
	JJ0ihOtj9Jum5y///J6xRbvpmgEnanc=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-K2HY8hKfMxC_VZ3_IJwPwQ-1; Thu, 22 Jan 2026 18:31:50 -0500
X-MC-Unique: K2HY8hKfMxC_VZ3_IJwPwQ-1
X-Mimecast-MFC-AGG-ID: K2HY8hKfMxC_VZ3_IJwPwQ_1769124709
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5019f8a18cdso52108571cf.2
        for <linux-clk@vger.kernel.org>; Thu, 22 Jan 2026 15:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769124709; x=1769729509; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKN8TnoDSmWpOwAv94N5M2R+RBbJgduzlKLXPs+N8/Y=;
        b=oXHvKgTBTpw9a+OMXEFp9AdD4rmvjxR6MSc6Il5jlB4d2XIgCR36ordqjK/TKHv7GV
         PEOm28GCZ2oSLvOVqRiqpiW/Hcr776kzySSNATrA6ykw6BA0vBjpukNeFuUR1DddtdpJ
         MBPwVJ50fVqo5C4EnwagTBkYalM352no10u3/IzEZjaBNRCSYKI9pSxK2RqEZJI7M+9V
         c2bkEhCAILlWMZi03743oBAj9LGBNKNv1yi6A53+6SnvV3k30BkaKg7UNSW6Ri5yB/OE
         8NblSSlin/Y+k4A4flR5pUdTYdlXl7iPVWL8l93V7x3N/9UvPuTMgRhEMrdv8LIb78hx
         37gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769124709; x=1769729509;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RKN8TnoDSmWpOwAv94N5M2R+RBbJgduzlKLXPs+N8/Y=;
        b=QzE291+8O7WmLNQLxG8TO0VhT1l2gzlYj92TGZJXd2WhUULSolfnTROlG5GfBR/GCE
         cEkNJOrOW7zDIeDfCBMM694cVulRNB3VfeZ9tZuSQ5VNG4ovrpNhxrold+e9EGKXqf/v
         HZY8nboYsx5Ms8KMmTt6MftrmJ1efOGIIU9FwiiXFn9Br9HQj81zkks2+/ADd/CsR5FN
         2cDNrEkWJ7lNzgs/yvq7PyKgDxZb2RGFIfYq24AA+/n3meA4vcHR9K+AJigJ7yYBd0vi
         wymY7LsnP39C+9LiMM8dU35xO/YUmkUbAH6tiYeV5cKidvt380rSYLQ4eq0wVw2l63FS
         DQXg==
X-Forwarded-Encrypted: i=1; AJvYcCVcKbR37ITnH/bVZeWpB45NnsCjlwi7UVciMi1rX37e4n/v+6Bct9FKa0nQhe1KcCQgl8wprdr+GXg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUjjDikhCo7DCfypbXrwS6JDtbuGa/DMIY1YARemNDJYXOSKyA
	972nKeG4By9+qFYG6RrTc9miqXPJQMKz12gwSaFz34Jy+ULHYyYvf3m9JDGymYUeWkSkshivXzA
	4IQu69unAwcHxkkrh5XlrXV/Hvhhw4rNq0bnvMStpGOCFWOuZJrNdWUpUqyMoFw==
X-Gm-Gg: AZuq6aIs1hDEjG+Vk1uIi3ERxMFJmjN1tF9QsVzeO+uleSkG9J+QXEVjj6SESfRiklu
	tDTz0mgZMxqWwUhVV+6tCVj9TUViml3vGQeHcTlIfuizcFBGn4972iX8XkndbpG0jbvfLssn99x
	b54n201fm4MjNVDGlIBMBBd9UtWGRK0KDl2yk+Uizl+oFAumqyED643M+7/5fpf+NBWK339ar6g
	U3lkVFIj7z5TO4lOR4vCHyMeioF3uzgQzRIevXkEiBrP4dLgNzRQHVEOzUs2TucXbnK7ijuPIet
	JcfHD4fqK9Z56sESlkdl1t/U/0ucxrrUvqBJiEwxCfoBd+QPMO3klgzL5drbj9q78gtf
X-Received: by 2002:a05:622a:394:b0:4f1:b9e1:f08f with SMTP id d75a77b69052e-502f771c6bcmr16767861cf.5.1769124709474;
        Thu, 22 Jan 2026 15:31:49 -0800 (PST)
X-Received: by 2002:a05:622a:394:b0:4f1:b9e1:f08f with SMTP id d75a77b69052e-502f771c6bcmr16767571cf.5.1769124709043;
        Thu, 22 Jan 2026 15:31:49 -0800 (PST)
Received: from redhat.com ([2603:301f:1601:7a00::a701])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502f7f747dasm4474461cf.19.2026.01.22.15.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 15:31:48 -0800 (PST)
Date: Thu, 22 Jan 2026 18:31:46 -0500
From: Brian Masney <bmasney@redhat.com>
To: "ping.gao" <ping.gao@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, hy50.seo@samsung.com,
	kwangwon.min@samsung.com
Subject: Re: [PATCH]     drivers: clk: keystone: Fix parameter judgment in
 clk_prepare
Message-ID: <aXKzYgVBLnYgwZ27@redhat.com>
References: <CGME20260122100703epcas5p13f4647a5e62546abc3021383134e824a@epcas5p1.samsung.com>
 <20260122101124.2396139-1-ping.gao@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122101124.2396139-1-ping.gao@samsung.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Ping,

Thanks for the patch!

On Thu, Jan 22, 2026 at 06:11:24PM +0800, ping.gao wrote:
>     The clk may return NULL or an ERR_PTR. Don't
>     treat an ERR_PTR as valid.
> 
>     for example: biu_clk in dwmmc driver request fail, but it's ERR_PTR,
>     not null,it will panic when call clk_prepare
>     log is below:

The patch subject has 'keystone:' that should be dropped. (Along with
the extra tab.)

This is also a nitpick but the extra spaces at the beginning of each
line in the commit message should be removed. Just start it at the
beginning of the line. When the patch is applied, 'git log' will
correctly indent your commit message properly for you.

>     [  438.400868] [7:   binder:436_2: 4998] Unable to handle kernel paging request at virtual address fffffffffffffffe
>     [  438.400877] [7:   binder:436_2: 4998] Mem abort info:
>     [  438.400881] [7:   binder:436_2: 4998]   ESR = 0x0000000096000005
>     [  438.400887] [7:   binder:436_2: 4998]   EC = 0x25: DABT (current EL), IL = 32 bits
>     [  438.400894] [7:   binder:436_2: 4998]   SET = 0, FnV = 0
>     [  438.400899] [7:   binder:436_2: 4998]   EA = 0, S1PTW = 0
>     [  438.400904] [7:   binder:436_2: 4998]   FSC = 0x05: level 1 translation fault
>     ...
>     [  438.409424] [7:   binder:436_2: 4998] Call trace:
>     [  438.409429] [7:   binder:436_2: 4998]  clk_prepare+0x10/0x24
>     [  438.409439] [7:   binder:436_2: 4998]  dw_mci_runtime_resume+0x50/0x2d8 [dw_mmc_samsung cd210e210975263404c28fc89778f369f8398f0c]
>     [  438.409471] [7:   binder:436_2: 4998]  dw_mci_exynos_runtime_resume+0x18/0x58 [dw_mmc_exynos_samsung 2735a594c7c9c9e8c65b0b87523fbf70dcaabfff]
>     [  438.409496] [7:   binder:436_2: 4998]  pm_generic_runtime_resume+0x40/0x58
>     [  438.409506] [7:   binder:436_2: 4998]  pm_runtime_force_resume+0x9c/0x134
>     [  438.409517] [7:   binder:436_2: 4998]  platform_pm_resume+0x40/0x8c
>     [  438.409529] [7:   binder:436_2: 4998]  dpm_run_callback+0x64/0x230
>     [  438.409540] [7:   binder:436_2: 4998]  __device_resume+0x1d8/0x394
>     [  438.409551] [7:   binder:436_2: 4998]  dpm_resume+0x110/0x2b8
>     [  438.409561] [7:   binder:436_2: 4998]  dpm_resume_end+0x1c/0x38
>     [  438.409570] [7:   binder:436_2: 4998]  suspend_devices_and_enter+0x828/0xab0
>     [  438.409582] [7:   binder:436_2: 4998]  pm_suspend+0x334/0x618
>     [  438.409592] [7:   binder:436_2: 4998]  state_store+0x104/0x144
>     [  438.409601] [7:   binder:436_2: 4998]  kobj_attr_store+0x30/0x48
>     [  438.409610] [7:   binder:436_2: 4998]  sysfs_kf_write+0x54/0x6c
>     [  438.409619] [7:   binder:436_2: 4998]  kernfs_fop_write_iter+0x104/0x1a8
>     [  438.409628] [7:   binder:436_2: 4998]  vfs_write+0x24c/0x2f4
>     [  438.409640] [7:   binder:436_2: 4998]  ksys_write+0x78/0xe8
>     [  438.409652] [7:   binder:436_2: 4998]  __arm64_sys_write+0x1c/0x2c
>     [  438.409664] [7:   binder:436_2: 4998]  invoke_syscall+0x58/0x114
>     [  438.409676] [7:   binder:436_2: 4998]  el0_svc_common+0xac/0xe0
>     [  438.409687] [7:   binder:436_2: 4998]  do_el0_svc+0x1c/0x28
>     [  438.409698] [7:   binder:436_2: 4998]  el0_svc+0x38/0x68
>     [  438.409705] [7:   binder:436_2: 4998]  el0t_64_sync_handler+0x68/0xbc
>     [  438.409712] [7:   binder:436_2: 4998]  el0t_64_sync+0x1a8/0x1ac
> 
> Signed-off-by: ping.gao <ping.gao@samsung.com>
> ---
>  drivers/clk/clk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 85d2f2481acf..6d62f69323b5 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1171,7 +1171,7 @@ static int clk_core_prepare_lock(struct clk_core *core)
>   */
>  int clk_prepare(struct clk *clk)
>  {
> -	if (!clk)
> +	if (IS_ERR_OR_NULL(clk))
>  		return 0;
>  
>  	return clk_core_prepare_lock(clk->core);

With a cleaned up commit message:

Reviewed-by: Brian Masney <bmasney@redhat.com>

Just to help Stephen: It looks like this is what ultimately causes the
problem:

dw_mci_probe() in drivers/mmc/host/dw_mmc.c sets up host->ciu_clk, and
if an error is returned by devm_clk_get(), it leaves the error pointer in
host->ciu_clk, and the probe continues normally. Later
dw_mci_runtime_resume() calls clk_prepare_enable() on host->ciu_clk with
the error pointer.

Additionally, clk_unprepare() already has this IS_ERR_OR_NULL() check.

Stephen: Do you think that clk_enable() should also be updated as well?
I see that clk_disable() also has the IS_ERR_OR_NULL() check.

Brian

