Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE093290DB
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 15:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784907904; cv=none; b=tDBdViBQBRdtREDRZZegCA4d4xA6skTtU3L3PwKpvH3XUurWF04OYlEvOhr1UBpvsQojf8MoCYTvjY4u+MAdWNPK/PI3A3nL80VTI+HpWL5PrqUFIwcN/VfK6pDyrgAvyWw2HLWr1udibcOV0G57u4cuOjvwefRqHNgzJ7Hl7Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784907904; c=relaxed/simple;
	bh=UxTQdA2isgDvgKmYscfzhqJ851W9NSTq2A3T2NK1VT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LOne3qhwS2LpbWcOIitMbRtGrwTzZBdH6ewJ2z8VxxEgzHL1H36wQ0g1adFjnVvn+aZG+rmTA4Ma07ZZSZ1i3EQkCRd5XKmjeQo6CM1bb+mVLx1Fwo0AJZwpSsf6qAuTZJXk7SvEMFl6KFiI6K+qsG8l/Obl+C7V0RwsHtXoSJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZpXf4fzh; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yiu/puFU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZpXf4fzh";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yiu/puFU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784907900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w5JjSXmoKI6gVlxYEYG5ahHmEi75NF5JvrpIqRPpGtc=;
	b=ZpXf4fzhU/MZ3tBictY9bsGOOyHZnzRVI5xs9hbOITo6kqCgCcOuB1J/ixh+swDQPE5LZu
	w97kPeFxUDMSCPeDaRRlvEt1Mc7OuA4Y1OMPOVItkMXWQUSQH3eLs21qnD5Ado/t0LMnOa
	gsTSpCa7VQ0sheVaX+UPNhJLIajrPYE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-z4Za08tsOxKhzv_vmN_Lcw-1; Fri, 24 Jul 2026 11:44:59 -0400
X-MC-Unique: z4Za08tsOxKhzv_vmN_Lcw-1
X-Mimecast-MFC-AGG-ID: z4Za08tsOxKhzv_vmN_Lcw_1784907899
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8e97889ac8aso9260906d6.3
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 08:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784907899; x=1785512699; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w5JjSXmoKI6gVlxYEYG5ahHmEi75NF5JvrpIqRPpGtc=;
        b=Yiu/puFUmzMVw4S1BlJ2UOFJybT6zGnzpvQQ+4nZ2A1RAituohMFk2n4AOvWkil+r+
         bIX26oZZqzTY0575uEBLiDnLybJC643cNV7Q89Mr6km5MqH9Zf8TqLdZyE4zj5EodVbS
         WrWI5s8lUcS7uXekqfr77owoEboqSopCwrXULdyjXi8L6geqwPupGCmcYSe+gCPT0Njf
         nMAsgyDBbxxzeh2Qd0XiO9cBSe4fg5Qaahd939PbWXU6vuauabqWE5NI4M5SVbe3vcE/
         3v1GHRp2D3KknoF00Y2xw7QWys7u8QryfY3qRGpAAGTZgEifOvHPtKUdQ1BlS8jP/57w
         2rIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784907899; x=1785512699;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w5JjSXmoKI6gVlxYEYG5ahHmEi75NF5JvrpIqRPpGtc=;
        b=F7gPEEpMpgB4uNLBBtnvjpffSXfPtV7U8yE5XZqMRb8INmwt+Jq5dLdcy+IleTH7GC
         Cno+F2wBFwZeHIa/hzzzoK+VudkaqPWv6pBNNVsOIOYT06TS9RW2jpIqe9e+6hzW10v+
         Q7Ktm3+4WLqLrOLNDpfYPC+RXxeWRWFfxWLzpm/u7wB0uzNIwaOKjgdhHbu4uDHggtwx
         jgacuYliYHLu4JrrkbDMfVVmvWsX599aBijGR0Ko1AfW6uFzzbziWv2qiTVvXe7LIo+A
         NxXFmkaWTMSVxd+5xhdm1CCE9Nx2TAe0YnA/MV6+6djERZHvHoNtyefWNc31xvPo3TMd
         2r6g==
X-Forwarded-Encrypted: i=1; AHgh+RqYdzsNIo6Lf5TocKbvKbbpf5LdsnCt4jzZVMTpbEBCpwqzbvo7RLMPyP/IUh8jQ7unBpOAKAyrO/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoNPYUaxAjOWcq6aJFSM10TeiC9J7n2P+Yq8SZF/uDIa7LJM0u
	aCnWT9j+wD36gQjjmUcBQS789DvzIGx76kHkubiHyp6Qo4ZD/TJTFZLWLsLQ4zCk1WJpiJvk3oU
	dBTfCiWofBK9YduBV+wGfUNTjx7v1vuiAmr13DvpZUF9zQLfuY3IUO5sE1q8wvw==
X-Gm-Gg: AR+sD11iksiHlH3+KD6GbxAz7pb8BYp3Ad4yruKlXT5dYLp1i09DfcwqJmNbRiEIE5c
	K6fCf1eYh5G9KcCpLlZTCjJPMFpGJvooFoYxslH4rU2jPNHCo2EQyZllYuE0D/4fZ1POFQW8C52
	hH71FLtzTNh3/GMsFfT/w23URjkPunrd51iErEFz3h9f246jyyYL8JRA33Sy32B2CKBZWsa/SP8
	ehWFJzhTypruabvx4FVJhE4p7XtqJtD1HbNlVd/LeT+1Wcopn6e8YEUmzXYHZ3TrTRZbpZLVpA6
	DzAsOo5NPWST6qxoxOEybuyTUVwcMr+C/1N7TR9IMylGj0SmhA7Fq8xAKr2H1Gy4Tme1MNAyhLR
	yriNwnrkp91KC+fjeSQNw6kglcz0anDNv4t0=
X-Received: by 2002:a05:622a:2b4f:b0:517:7d9a:a88 with SMTP id d75a77b69052e-5283de69606mr71786251cf.37.1784907899015;
        Fri, 24 Jul 2026 08:44:59 -0700 (PDT)
X-Received: by 2002:a05:622a:2b4f:b0:517:7d9a:a88 with SMTP id d75a77b69052e-5283de69606mr71785901cf.37.1784907898485;
        Fri, 24 Jul 2026 08:44:58 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529a27f4346sm2103881cf.8.2026.07.24.08.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:44:57 -0700 (PDT)
Date: Fri, 24 Jul 2026 11:44:55 -0400
From: Brian Masney <bmasney@redhat.com>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: bjorn.andersson@oss.qualcomm.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, konrad.dybcio@oss.qualcomm.com,
	mukesh.savaliya@oss.qualcomm.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, chandana.chiluveru@oss.qualcomm.com
Subject: Re: [PATCH] clk: Guard clk_round_rate() against error pointers
Message-ID: <amOId3MHkryiFwC1@redhat.com>
References: <20260723-fix_ptr_check_on_clk-v1-1-568a7ed87746@oss.qualcomm.com>
 <amIlYNjWeJQ9tcOB@redhat.com>
 <bbea2bd8-adf9-497d-a159-1871aaa9cce3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bbea2bd8-adf9-497d-a159-1871aaa9cce3@oss.qualcomm.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Praveen,

On Thu, Jul 23, 2026 at 10:10:06PM +0530, Praveen Talari wrote:
> On 23-07-2026 19:59, Brian Masney wrote:
> > On Thu, Jul 23, 2026 at 11:40:47AM +0530, Praveen Talari wrote:
> > > clk_round_rate() only checks for a NULL clk pointer before
> > > dereferencing it, but callers such as dev_pm_opp_set_rate() can pass
> > > it an error pointer (e.g. ERR_PTR(-ENOENT) left behind by
> > > clk_get() when a device has no Linux clock and is instead managed by
> > > firmware via a genpd/OPP performance domain).
> > > 
> > > Dereferencing that error pointer to read clk->exclusive_count
> > > crashes with an unhandled kernel NULL pointer dereference, since
> > > ERR_PTR(-ENOENT) plus the field's offset lands on a small, unmapped
> > > address:
> > > 
> > >    Unable to handle kernel NULL pointer dereference at virtual
> > >    address 000000000000002e
> > >    ...
> > >    pc : clk_round_rate+0x3c/0x188
> > >    ...
> > >    Call trace:
> > >     clk_round_rate+0x3c/0x188 (P)
> > >     dev_pm_opp_set_rate+0x114/0x33c
> > > 
> > > Change the guard from "if (!clk)" to "if (IS_ERR_OR_NULL(clk))",
> > > matching the pattern already used by other clk consumer API
> > > functions such as clk_unprepare(), so an error pointer is rejected
> > > the same way a NULL pointer is.
> > > 
> > > Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> > > ---
> > >   drivers/clk/clk.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > index 048adfa86a5d..8c1ad3d10284 100644
> > > --- a/drivers/clk/clk.c
> > > +++ b/drivers/clk/clk.c
> > > @@ -1780,7 +1780,7 @@ long clk_round_rate(struct clk *clk, unsigned long rate)
> > >   	struct clk_rate_request req;
> > >   	int ret;
> > > -	if (!clk)
> > > +	if (IS_ERR_OR_NULL(clk))
> > Can you provide more details about the clk_get() call point that starts this
> > error? Specifically which driver this occurs in and the exact scenario that
> > triggers this.
> 
> On SA8255P platform there is no Linux
> clock for the SE, and the perf domain device's OPPs are populated entirely
> from firmware via devm_pm_opp_of_add_table() (through
> of_genpd_add_provider_simple()/onecell()), so the perf domain's OPP table
> has entries even though no clk_get() ever succeeds for it.
> 
> The clk_get(-ENOENT) case comes from _update_opp_table_clk() in
> drivers/opp/core.c:
> 
>     opp_table->clk = clk_get(dev, NULL);
>     ret = PTR_ERR_OR_ZERO(opp_table->clk);
>     ...
>     if (ret == -ENOENT) {
>         /* ... no clk provided ... */
>         opp_table->clk_count = 1;
>         return opp_table;   /* opp_table->clk left as ERR_PTR(-ENOENT) */
>     }
> 
> Because the perf domain device has no "clocks" property (its OPPs are
> supplied purely as performance states by firmware/genpd), clk_get()
> returns -ENOENT, and opp_table->clk is left holding that error pointer
> rather than being reset to NULL.

This looks to be a reasonable change. Thanks.

Reviewed-by: Brian Masney <bmasney@redhat.com>

