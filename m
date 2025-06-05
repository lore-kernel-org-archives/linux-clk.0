Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE57225405
	for <linux-clk@vger.kernel.org>; Thu,  5 Jun 2025 13:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749131458; cv=none; b=Q8W7iKuUZnbuaJh5/8JcUOKO3nMaWCQ4NiaDjKEu/TFJ9JbT6wPk6bIihuwHc+L5vwn3nZpFGqJLZM/WO7kiQPLsLlnkHVCI71cZ8+aqxXWDDBNA/J/jRbrwWE6pxzSSEzsG+GxcCIaT2F3W2vkt8doPdqKC92dk0pT0L8/MAxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749131458; c=relaxed/simple;
	bh=pGhX/wVZN0RGvBVwSNXI+HlZVCiN3e9tQXYEg1OIFho=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j6JKbGG8hJGv5WnwcjGcm6R0W1ECA9eU8wvFzENlSrBFepOzEVtTo/CFlGD6Y/llohJfSOV7NFtsw1C6NHX3AfUIOXRvs3SD6OJ9SOVzEPhvzfOOxtV1c4gYYRZvV595f9XjYOacdPYeUcClSNb8vjHtRxk6TUyCcIIDGvtmJts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LxqEvHXJ; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LxqEvHXJ"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-adb2e9fd208so195317866b.3
        for <linux-clk@vger.kernel.org>; Thu, 05 Jun 2025 06:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749131455; x=1749736255; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ggZCkgQEfMCBTbPPekOLvTIApHTIQLiYr/IDAMWkO24=;
        b=LxqEvHXJLYk18bGojUrSLXq17kg7fltNrkO3UaA1AFcH2GbiI1eui22s/l6ekjeMX8
         U0qiCZZ6Ay6LrYnyuJ18iuQIjZiF1vEGuBGankf8vkdBZBk7qTNO247haDL0jwUL3eHP
         XwHc5Vmw1tP5pTDCkmXFqM1n6FgPz7L3mZ0K9Ml001YWaGW2J7ZvrkwCPV0nkoWv93Vl
         y5sDrPL27oxg/hg48BoYip8H+7oMpFWmjev4Sy/HjqKfVSH1VXZel+0/77VX3/KsMhzm
         45eBu4xreuHYW5V4Ondzg2e32GjHi4AN+GfEpP2z02zBOwvGxWGrwegzkPz6tvlSNwek
         KjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749131455; x=1749736255;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ggZCkgQEfMCBTbPPekOLvTIApHTIQLiYr/IDAMWkO24=;
        b=BAe4paGjMdkkolnPpJkhFzEv20r8faCWFh0P/a4d+yGngsgMchp6XunJHHLQDzy1UT
         hb+OxG2WU+iybtzg5iuTkFtFGfLgoc0gRn8zB7ummj1+bEnTqjKeOg+SwMiliSeWqaEM
         VzvzORDKbs32mwG/1p06SvImQL92/y2BS0TlDhQZzK1iVgngJiDUlWyMPwoIO9QpWZ+U
         nRHdvixx1vkk3Ab55dVYNZFmz5y6UqlXu+OsOG7Cf333HioFj7luBkN5Tmn9x/U6Zupp
         og5yNAS+YnvAVdQ0pQcTeZnU7ZXY4kreeclogerg51RIGP8JHxIZGcLKOJ+pimMWfKfz
         uOZg==
X-Forwarded-Encrypted: i=1; AJvYcCWq+hm463s33qVDNvk/BtgstcpzQ/yEsnmyG0PdQwGjQ1oBn+aGdFB+Rw3MX7davCwKmBOshUrwUY4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaUdnVUQWrGx8T4jymQQOAHJpK0ma7l6UKEP71TlJF6yReajKm
	yCTXtvvtnMQmq3HCwT1c1FBwbXLlu06RO/BNOdppNZOaDXQsvKlr0bpBFNWJCxZFCRw=
X-Gm-Gg: ASbGncvucbqfLRJeogtKGUlcshodWd09qpGtG/fv5v+ilccXXld5i1YxK1nBFVpoa7O
	yHtWwIGItukyePaRJF4BRdzIxLtPrVsbUWZmeP/jXNF4yDyiT08Zp2dXlAuHR5pQW74fLkWPwzL
	64lh9PpTkre17raaFUlSgz9HeqvzXMBRhqOb911PybaH4d65rQpk7ebBf7CsrwtigKfg+au3kbu
	p7KKL0+dBJZ3GQ1R0rk2TURMwd1zjoouOrvOjHfXBftpYHfGnzMYRFf9uqXedeG45YmMHOA9I+j
	jtHnXxwmZHbFHoq6JscTTgX8B88Gloy/rrCgymGFPhzSyUMDyjw2RVA5+tvNN9smflL4kL2Y/hG
	SWL4O6uLzvgFOBOno99VDtQtE+FM4LGdm3KFmMnx3+7Q=
X-Google-Smtp-Source: AGHT+IGsZK01GTgeXRGvrF2f+PIjoQHuluhsLAHTkeb0wTJPNILx+jwsb/VHsmQ9utQ5doDtE/qnrQ==
X-Received: by 2002:a17:906:7951:b0:adb:41b1:feca with SMTP id a640c23a62f3a-addf8ff443cmr600103066b.61.1749131454652;
        Thu, 05 Jun 2025 06:50:54 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82e760sm1275872866b.52.2025.06.05.06.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 06:50:54 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 5 Jun 2025 15:52:31 +0200
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	linux-clk@vger.kernel.org
Subject: Re: linux-next: Tree for Jun 3 (clk/clk-rp1.c)
Message-ID: <aEGhHy7qPyIjG5Xp@apocalypse>
References: <20250603170058.5e1e1058@canb.auug.org.au>
 <cee929b0-8b09-4e6b-95c1-c4067a8c389d@infradead.org>
 <6e88587d-f426-4841-b370-b46917822212@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e88587d-f426-4841-b370-b46917822212@broadcom.com>

On 20:06 Wed 04 Jun     , Florian Fainelli wrote:
> 
> 
> On 6/3/2025 10:01 AM, Randy Dunlap wrote:
> > 
> > 
> > On 6/3/25 12:00 AM, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Please do not add any material destined for v6.17 to you rlinux-next
> > > included branches until after v6.16-rc1 has been released.
> > > 
> > > Changes since 20250530:
> > > 
> > 
> > on i386:
> > 
> > ld: drivers/clk/clk-rp1.o: in function `rp1_pll_divider_set_rate':
> > clk-rp1.c:(.text+0xba1): undefined reference to `__udivdi3'
> > 
> > caused by
> > 	/* must sleep 10 pll vco cycles */
> > 	ndelay(10ULL * div * NSEC_PER_SEC / parent_rate);
> > 
> > 
> 
> Andrea, do you mind fixing this build error for a 32-bit kernel? Thanks!

Sorry for the delay, this should fix it:

@@ -754,7 +769,7 @@ static int rp1_pll_divider_set_rate(struct clk_hw *hw,
        clockman_write(clockman, data->ctrl_reg, sec);
 
        /* must sleep 10 pll vco cycles */
-       ndelay(10ULL * div * NSEC_PER_SEC / parent_rate);
+       ndelay(div64_ul(10ULL * div * NSEC_PER_SEC, parent_rate));
 
        sec &= ~PLL_SEC_RST;
        clockman_write(clockman, data->ctrl_reg, sec);

should I send a new patch with this fix only (against linux-next or stblinux/next?)
or Florian is it better if you make the change in your next branch directly?

Many thanks,
Andrea

> -- 
> Florian
> 
