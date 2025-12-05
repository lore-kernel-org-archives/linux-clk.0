Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF9B13AD05
	for <linux-clk@vger.kernel.org>; Fri,  5 Dec 2025 11:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764934436; cv=none; b=g/BcgLMbOYqX/C/8Rf1VMf932ewpaB8fJUfFT2ymi8A4txH+j+Pm34M+mv0vkqSEs/ZdvWmzHiUuIxoWD0ZbD8vHGekzehk7eOoNZPy89cXXhMNPYjH+vKwNQqaSFqHg66EZ9uN4z2sm0B9VtILTs2aFMpJRoNneFvaa8LBbY5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764934436; c=relaxed/simple;
	bh=LbT3jVPLKHvakm9K5J5rWn/tGJu+SgRY8N4vHbBATcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DJuuqSZpz9cF6OLl6j6AXf73NUoWkx2sExqLVPUeugbxjwTf/M6PiVdtG6Es6buWAxJjgTMmxxWfc3rxw9AriiKI9TZ5MhrEYVfnYEUCs46b80+EY0p0XNdSLJnlcUH6DSKE6XO2GlvFkValp5h904lK8oXvEhjEKqDMENkTBx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H2jpKsDr; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=txG1N8zc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H2jpKsDr";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="txG1N8zc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764934432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7SiuR9d+PsViqtUAja0334g1LJzjIh7Uvcnu3cxAFw0=;
	b=H2jpKsDrtoG9emjeoE87kxNuP3gXOETZnvOvkff51K2TvNWDjCw92VCOVPtgpjQGwIIHzu
	tx+RxVZ14JIRXocsj1y+7F5f52umS9Ay6zdTXXgmizAW4ScLlzPJxRZmyR/Xp2aJ8XWuZm
	Ok3ebRWGiCJ20hdvBaqo8Fx7D14DBvs=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-6UEyVOxAOhmLPFlONlR0-A-1; Fri, 05 Dec 2025 06:33:51 -0500
X-MC-Unique: 6UEyVOxAOhmLPFlONlR0-A-1
X-Mimecast-MFC-AGG-ID: 6UEyVOxAOhmLPFlONlR0-A_1764934431
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2217a9c60so157073485a.3
        for <linux-clk@vger.kernel.org>; Fri, 05 Dec 2025 03:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1764934430; x=1765539230; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SiuR9d+PsViqtUAja0334g1LJzjIh7Uvcnu3cxAFw0=;
        b=txG1N8zclEC4mURszwqYmKGacWHFTNQ+ig6ebRsI/OCUvbb/M5bqmmsyuMDZiAsTbx
         G/5a9BJVxKn77EF3ZvY7gzh0+Wpddo6adTmtsF4vg869CKXli/EaFvUsOke/v5GQ2rFT
         PLS08qFxX5eveQAUHvzRmNWDUJ3JpvBPTOtfZoTB3zROejCTJymWdNZSAjlJWpzZDWIq
         fiNCS846Ke6YlYc3mb/MRVHCSpOcvaipKp/Am9uV8K3Lql/s/syP6SGLuYhF2Yhl6P9E
         DvJXSyRgTwbSa3w7LOuLsok2kkxA3NZBJt1cA1FxOeeiAjRcNxbLenEryC0nDSOtNZvb
         FdgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764934430; x=1765539230;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7SiuR9d+PsViqtUAja0334g1LJzjIh7Uvcnu3cxAFw0=;
        b=twBiGlhLj0uBNDT+IMPTWhfoHnMJkcGuz36J5r3bRmV5KntEFH+DXjJf1setdblwjR
         7uMSec/0/2oY42wCtHv9iDI9b30Lk14XDWGrRtgOekFyHAa4GRRdeza+58IAotwhKjvC
         /0dW6xiXWH7Gi3HsWQ8pPxOM4s5T7L33flaR0wXEuFHR4/F07Qo0JkwGFCx9mvB5TFPm
         S5KF472i9tfxg/3jWmu0fjTwvnz9gvFuEB8nz4yNooOmfPacz4FHQBt0I+75f6HAFpa6
         uNf28fQOeNHoUna2KTUz3Gnyeg4LNH6RrqZIaTF/RxXWdJbH3XG8dy8FQ5/uIJMuZI/y
         WU2g==
X-Forwarded-Encrypted: i=1; AJvYcCUAKCxEW64XAaXIFw2lZrCmHFyFjV7bAOgL1W2R7M2qQxUvcDH2Vxoi1WICmr759haBUa1CHPAn8Vs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSUE0QkhV3e20TzyOYqlrhTKCCyLbhp5Kr6ziAbQzDrEtlEf0t
	NFPwoAPyQ1deqGijsmE0huzw9XGAEhcqV8o/Vi0D56ohYyL6xFPfX8risiRyvQmJ3IbUh5aajG7
	joFWHvFOHqna4hmkUATH5CjCQM1BSFzFLfBOXNDyDKEtlY0jTsMeAvbjfGN7R0g==
X-Gm-Gg: ASbGncslKUg49buaviGJljp1KgHVHUKZ2WStcjNVcQFh5ZAaXV6UPXrELVNG0fkgE3s
	in/2Rc7YETUjIw1Pj1rzL1ifyFi+KbwVfxumcqZu+3WkU0ARuRHsDJaSQJEY4gEqDf3gxTTLyvx
	eH13MkBsqg7jyKpPYg1oX0uPR9ceGTD6FsNmc0z+BHdhJcF33UhK4Insha5LlaENaY0ZyXGyixq
	l1oHb+Sl8cXa0mHgUSRDBG3234SqOceKoJLBNYIMbZ9qM6VuUBYityODCr6utFVIv4WXe5n8Kf2
	+r1XC/gScqjpqqFAA//fBakNgp6mMe7tB7tQAzzFhRN8YfyueXiNGdES47xm8tpc4D6Ew/9bXmZ
	IEuEDSSG72i/SczJt67j+rVyBqdrMCVKkrpk3Lbq1hrrF
X-Received: by 2002:a05:620a:bce:b0:8b2:edc8:13d0 with SMTP id af79cd13be357-8b5e47a48efmr1441748785a.17.1764934430548;
        Fri, 05 Dec 2025 03:33:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9wykJ16DbQPdhh4wIDn2WMVE/7FVuzUzyijuNYKHdKL3aiyIVqnHcx/xOhxOQZ464+ZuuBg==
X-Received: by 2002:a05:620a:bce:b0:8b2:edc8:13d0 with SMTP id af79cd13be357-8b5e47a48efmr1441744585a.17.1764934430021;
        Fri, 05 Dec 2025 03:33:50 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b6252a08fbsm375431085a.8.2025.12.05.03.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 03:33:49 -0800 (PST)
Date: Fri, 5 Dec 2025 06:33:47 -0500
From: Brian Masney <bmasney@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Conor Dooley <conor@kernel.org>, oe-kbuild-all@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Message-ID: <aTLDG_LEGQwgJUwg@redhat.com>
References: <20251201-clk-microchip-fixes-v2-3-9d5a0daadd98@redhat.com>
 <202512051151.N3iZUKEG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202512051151.N3iZUKEG-lkp@intel.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Fri, Dec 05, 2025 at 11:51:12AM +0800, kernel test robot wrote:
>    drivers/clk/microchip/clk-core.c: Assembler messages:
> >> drivers/clk/microchip/clk-core.c:721: Error: unrecognized instruction `nop'
> >> drivers/clk/microchip/clk-core.c:721: Error: unrecognized instruction `nop'
> >> drivers/clk/microchip/clk-core.c:721: Error: unrecognized instruction `nop'
> >> drivers/clk/microchip/clk-core.c:721: Error: unrecognized instruction `nop'
> >> drivers/clk/microchip/clk-core.c:721: Error: unrecognized instruction `nop'
>    drivers/clk/microchip/clk-core.c:722: Error: unrecognized instruction `nop'
>    drivers/clk/microchip/clk-core.c:722: Error: unrecognized instruction `nop'
>    drivers/clk/microchip/clk-core.c:722: Error: unrecognized instruction `nop'
>    drivers/clk/microchip/clk-core.c:722: Error: unrecognized instruction `nop'
>    drivers/clk/microchip/clk-core.c:722: Error: unrecognized instruction `nop'
>    drivers/clk/microchip/clk-core.c:862: Error: unrecognized instruction `nop'
>    drivers/clk/microchip/clk-core.c:862: Error: unrecognized instruction `nop'
>    drivers/clk/microchip/clk-core.c:862: Error: unrecognized instruction `nop'
>    drivers/clk/microchip/clk-core.c:862: Error: unrecognized instruction `nop'
>    drivers/clk/microchip/clk-core.c:862: Error: unrecognized instruction `nop'

That's related to these calls: __asm__ __volatile__("nop");
In the case of compile test, I'll just make this a noop. I'll post a new
version.

Brian

