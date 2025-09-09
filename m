Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3345289E07
	for <linux-clk@vger.kernel.org>; Tue,  9 Sep 2025 09:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757410794; cv=none; b=RjroyThQfKHDb2oKQD9tpzxWGpNZmKzeqJA3ToO9F7pV6UlRw+Pe5k0EHNcGJ1YNc8rU2kBBuZjTfnV2hHhp7t3gUhcKd9PGoGJ3jmxzJkA6s1DI7SkauNTA34U+/ina+SVwAcW31OkJbmcR9bwIGb1GiNiT2udxeZQcbSwZEL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757410794; c=relaxed/simple;
	bh=ZqTIhoxpRaUsXfMaG4XVvb6F65/P00Xs0kV9aEsz0ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gZm8wkEnekpuVuR5HgDmfze1Ho0aQ5K26m47qmczrc0Iqlt3l7IemfpyTztnPirI9AfapQ1vPs/wgebqOQg8Fws329rakB//ONTtNK1d3U7pltDsxWmBGjYADSOqCghO09xfMgY+pEi1UTQZNJl35RcCBH0KmkyQIwlAE5ueB5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y+epI0zh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y+epI0zh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757410791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R5SuLPKP6QNmvh1TmNhSBXqAPxbhjyq+GV6/uflQ99Y=;
	b=Y+epI0zh2NvHJ8tNDM4XfDtVs0zfX/m/9+oXaBSyGwyINeR1dClIC5KHuTdTEg3dYAT+/9
	wAdLCS/QQuun/oCkIdguX57GUSsBu8pMFNhNQyhEj7UesGTUAw+3lp3dMV8FzybfobO11v
	GhswMExGX3udNIAfH8dqfFzK2EgIWuo=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-jeKLFzniPUCOJi3VB-qD9w-1; Tue, 09 Sep 2025 05:39:50 -0400
X-MC-Unique: jeKLFzniPUCOJi3VB-qD9w-1
X-Mimecast-MFC-AGG-ID: jeKLFzniPUCOJi3VB-qD9w_1757410790
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b345aff439so150419361cf.0
        for <linux-clk@vger.kernel.org>; Tue, 09 Sep 2025 02:39:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757410790; x=1758015590;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R5SuLPKP6QNmvh1TmNhSBXqAPxbhjyq+GV6/uflQ99Y=;
        b=wdsICpBXrBpcGB0P0h0WY1rtUr67D5x5+Hf9HK8rhk7rWacXbvARnZtCjJzuSmOEWX
         TlTQ8uUsC/SZMrgZ0EFessJx/pLFGMporzDGVWDk58HqA/aJpwSwJolwIqlkwz/DneYE
         +z2A/DBH2vR3QYEdQ6DxC2czGCJoXh9/wneNGS/LfwdWPE4F74l0oVjP+ggL3yqrZo7G
         RH9XHpmGC/ANLGt9BtuSUy+7YyfvnQHVLEE/P4n5HkLNRU1JSeTsQ9Izd2CyWaF4zoD3
         8Ig8B7rGfHRQAypPuaYYiKGGFIcn154gFKp5gFQXX4uubH6BoMmb51gt6IqI9CYxuPPR
         XwKA==
X-Forwarded-Encrypted: i=1; AJvYcCXzOHxXFFYOaAqZtmh0E/XsedFWsYtbHL4aF1deDxuT2vJTRaC8JWEoUoCXQabrC9xXgL4LU9CV2V8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz246uoPR+J1UES2C+DfOMpc7SJyopNQ148OjAPagDjXsbjWdfJ
	YJ7t6XNyfsSa/WWESXTT60hMdor3QqiqBbclu4rdgWVuxJla9iqsJChffil51rmTdbG2yEmCK+w
	tEbOQpzW68dRCpmfg/4bWXSI6ndzNE/4Jq07/bAIORGj/nX7QQv8cFoS3Ot6AAA==
X-Gm-Gg: ASbGncthabNk6krh97aLba7UA/TO+ICYnwnYNHelCbXPl3GryNwNuYR4zsGuzW0dUHR
	L3TcUsKKiE32b3QlAL5fcYKficAxdZAu/LoHbeh3lN6ZfhrsUino401MScWA9Y63dtAAqiLWmKT
	XlodLV33Y4+WmkrKnhPgoU7euDNlXhDXu9U5D5FN7YPPc+LKYOpJjn9mV7H+ngNkMfnFHwcw1vA
	OWB3ScPvROcLV+lUf75ha8qha0DDrEv991n1+pmpyYK4UMP7Ng5878553i9qOfedfXCM5+seyto
	M1GmOHVa7liXhBbY0LeZ/GZ5/PTmYijQ6GxAVeb6daMGxK3hygGKUl8Gkz3cc6D0otZAJ4mLTUd
	gZ3cewnkFBLwt2NRR20g=
X-Received: by 2002:a05:622a:14d:b0:4b2:8ac4:ef4a with SMTP id d75a77b69052e-4b5f848239dmr100627921cf.65.1757410789864;
        Tue, 09 Sep 2025 02:39:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF32u03YWf0xFsHNwv4lu2FNzdlBMcHC/jd+orwwY/MAKlb650jQ6YeSwxCEA5UmnrgNTF0kw==
X-Received: by 2002:a05:622a:14d:b0:4b2:8ac4:ef4a with SMTP id d75a77b69052e-4b5f848239dmr100627741cf.65.1757410789492;
        Tue, 09 Sep 2025 02:39:49 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b61bbbc28csm6792371cf.28.2025.09.09.02.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:39:47 -0700 (PDT)
Date: Tue, 9 Sep 2025 05:39:45 -0400
From: Brian Masney <bmasney@redhat.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] clk: conf: Support assigned-clock-sscs
Message-ID: <aL_14XofqnwAd3QE@x1>
References: <20250901-clk-ssc-version1-v2-0-1d0a486dffe6@nxp.com>
 <20250901-clk-ssc-version1-v2-2-1d0a486dffe6@nxp.com>
 <aLdmXcdJnoeXEJaQ@x1>
 <20250909085013.GA26483@nxa18884-linux.ap.freescale.net>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909085013.GA26483@nxa18884-linux.ap.freescale.net>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Tue, Sep 09, 2025 at 04:50:13PM +0800, Peng Fan wrote:
> Hi Brian,
> On Tue, Sep 02, 2025 at 05:49:17PM -0400, Brian Masney wrote:
> [...]
> >> +		if (IS_ERR(clk)) {
> >> +			if (PTR_ERR(clk) != -EPROBE_DEFER)
> >> +				pr_warn("clk: couldn't get clock %d for %pOF\n",
> >> +					index, node);
> >> +			return PTR_ERR(clk);
> >
> >This chunk can be replaced with dev_warn_probe(). Sorry I missed that in
> >v1. Otherwise the rest looks good to me. With that fixed:
> 
> dev_warn_probe() could not be used here. There is no 'device' pointer
> here.

Ahh ok, gotcha.

> I take __set_clk_parents() as example here, so use pr_warn().
> 
> >
> >Reviewed-by: Brian Masney <bmasney@redhat.com>
> 
> Could I still keep this tag with keeping pr_warn()?

Yes. Thank you!

Brian

