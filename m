Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B14948F001
	for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 08:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789634572; cv=none; b=ugl6f4hn0oscJDlHfdH96Rjm64f0Cq3JmEQNyO9oJgXsd0Eu4Fdkyom5scJd2Yo5Ts6utYjQMWkFJHb2sDN7J3k3stMEovDqL3+uCgd8olUH2AiloIXwVAv+TL/d6eqEX6MtLlLGt6CjkGZQKfpw10WO3bXLjAg1wVcMyztQiKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789634572; c=relaxed/simple;
	bh=nVMG1SbekNaLvNRQlQ39Yo+Gy2z6qKasZ304GKCy2GQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FGqXx3l1A/+qXhnp+nOz5OzW+x/xzt19VV1zCRW5jxSpc9/hsssclkBK9edynF/9zztR8jxB2AlUvIQEX2WMMcQ6KJRgzQkTWxe8Ks0yHvmt1Qkid2/6idjGP1zDsdTSaBG5TlVQ8WZaGUMsKEZrksOMsTXPQH/iW5F+lKKSEus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=He8UH1C3; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="He8UH1C3"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so5259425e9.0
        for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 01:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789634555; x=1790239355; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qhnvHXmqUmnS9g4y5J7KmcXx39UVV4BRbHPaDoXYC7Y=;
        b=He8UH1C3TTEZOxKwlduC92ahxT5UbiUOC7rtz6FAidL5Z3omGGvbgw9944Emm15S7N
         JwRcshv1tk8TY0Pj1l2YGEAZeVZY8yHhlaSSqgyfFClN4Z+QGO7sgwTC9VJ/+XPNT0oa
         mNjyKZM7wfckQ5De/YI1mzPjOez4YepfoizBAGiV+lrb3drSgKhEPM9SYLLFZx9MwrWG
         asNF0f9ZOhWfK8LXEbfQgydZjfTTeNuj0OkLjCE5/hcZtrEISdFffBb7vBfiv569iK4G
         7u5cD1mWdOtZFqWkTpM5VSyqQTWy0zsowKATO5srX3ZogVEsbdiXjfkRgUYaJVR0DUuN
         fzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789634555; x=1790239355;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qhnvHXmqUmnS9g4y5J7KmcXx39UVV4BRbHPaDoXYC7Y=;
        b=ASHIKDaDX3ztYYgWJVgG3laGcZZZmhm9oWSrqDINdEm/zxM7f0z96+128v0sjmP9LF
         NkmqSUYsS8JmOiM1sWsXQs3mAzI62V6zf78/MPT5ixjIs3JSz61okhsz1HDNClclFoQ4
         zOxRy/5Nijdsv85NUMw0B/FlEZr8L8ep9oGJ5VI7p4IGNBRJS9PV8b78I5bWl6k1pWPq
         rM+ih9c4YocKqut56+UNvO/fKgI0C4zjt8xBPxn6F/4h/2XiWENtYs2XixNcRUEXwRjk
         M7spe+Y3Y5CdNgubIfqCdqtNTWk0ok2HZM1YPUyvkv91I+SyFoUSOfTzAssoNmUayObY
         8pCg==
X-Forwarded-Encrypted: i=1; AKwUvBwHhvYwjfh9OVabXYl7gQxchpVwzmoyuzNeNYijKMB4E6W7CfUP2AHT7+D9pgmJIlBvcKLfA3qQhMQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kf57mmwW2h2VYgBOKVAkbF4Nx0H7Z5w7dZH1Ngzlm3V9bYiktr
	rEoPhjMha//J6OxcB+lzhbu79TFH3tKhrN6sUP2+q7P/v8tmI1ADn638
X-Gm-Gg: AYBFou3ciaUkqWJUvPTI1aceBHKTDw68SbgO+y0wOgTZXdhSU20VlGkMyTZnSV0Aobm
	y3GD61LFfUvf54XJjcdPEV2YjfB6Nymcldl2cTIhoVOKVq7zOr+g0MNb8V5AhY+ldnPmZqmsUdY
	8B1vERxp80l7E/uwu7yy2waf7IpdoAT9ASMWJWnyXa4xIGqM3S48y0KcBN4KbUDe/hfkYcQGY9N
	p5mpoRB6oIIlpp4NtAcBLFoXXMUSrYoqCf6lndc2Uxi+H5JyRAsoTy8TjBQH9zeVsTsWTdapblr
	n3Yxb4AIq5y6vFhd3Cb//O9WWWLzNSK1q0n6y9SUNdfNCf8S4mfeNe9MDSBleyzIOK+cdMRyyJT
	VzFy3l2IMD68pM8X88OClD8WFoNgbeze3PSUxF56v/MuIL0+I0bT0NyMbuCh9frkY11xLhOO3SP
	c/Lkxsgg6zQmQunur+UOsHTbklUSezRgV+yJ4pmgrRnYhhXPO/JbTciYCPMZd06/uK5WPdIqFe8
	pLuMVZdLRLNW4O6wAsDifFBquhII4jFHxQrakAyzuqadBGRd65aXTksZpgFQ9wQcy1+mw5VdOiE
	WlEAr734SDSNAvaPw7VZ5asrpQbiCU1JEsIJk60uQuCwaI14fhn+P2oZFp2PVSrHyoU0/1vgTPT
	jCUrvDG4Df+6RBgD1XpWjp+r4MOmo1vtYyHl4Ic7bpKIELRHIfoJcHx8AhWbw9DkTleb0s4Vlhf
	OC37a67iOm+ABypaQ=
X-Received: by 2002:a05:600d:6446:10b0:49f:bc43:9e8e with SMTP id 5b1f17b1804b1-49fbc439f6dmr34380115e9.26.1789634555063;
        Thu, 17 Sep 2026 01:42:35 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd1d0978sm56898145e9.2.2026.09.17.01.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 01:42:34 -0700 (PDT)
Date: Thu, 17 Sep 2026 10:42:33 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Johan Hovold <johan@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Peng
 Fan <peng.fan@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
 <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Frank
 Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 linux-clk@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: imx: add missing
 pm_runtime_dont_use_autosuspend() calls
Message-ID: <20260917104233.00007a85@gmail.com>
In-Reply-To: <20260917102429.00002faf@gmail.com>
References: <20260915103345.1334-1-joshua.crofts1@gmail.com>
	<aqpgUPWUGZp5Cjzt@hovoldconsulting.com>
	<aqq_ymTi1I951uQp@SMW015318>
	<20260917102429.00002faf@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Sep 2026 10:24:29 +0200
Joshua Crofts <joshua.crofts1@gmail.com> wrote:

> On Wed, 16 Sep 2026 11:11:54 -0500
> Frank Li <Frank.li@oss.nxp.com> wrote:
> 
> > On Wed, Sep 16, 2026 at 11:24:32AM +0200, Johan Hovold wrote:  
> > > On Tue, Sep 15, 2026 at 10:33:43AM +0000, Joshua Crofts wrote:    
> > > > Several drivers in the clk subsystem forget to call dont_use_autosuspend()
> > > > on teardown or error, causing potential resource leaks. This series adds
> > > > the missing calls.    
> > >
> > > No, as I've explained repeatedly elsewhere, it does not cause any
> > > resource leaks. [1][2]
> > >
> > > The autosuspend setting leaks if you will, but that only matters in the
> > > theoretical corner case of someone rebinding a different driver (which
> > > will soon also taint the kernel).
> > >
> > > So don't exaggerate the impact, this is essentially just a cleanup,
> > > which is fine in itself.    
> > 
> > Is it possilbe to create/improve runtime pm API, let runtime_pm enable/disable
> > include these pair functions.
> > 
> > I get many similar patches since scan tools is more powerful now.  
> 
> I suppose that could work. One would still have to scrub the kernel of legacy
> use/dont_use_autosuspend() calls though, so it could end up being a large
> patchset.
> 

On second thought, some drivers do tend to disable PM runtime system sleep
etc. so it probably isn't as simple as adding the autosuspend stuff to
enable/disable.

-- 
Kind regards,
Joshua Crofts
