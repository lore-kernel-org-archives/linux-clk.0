Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EA93B42E3
	for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 17:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789665344; cv=pass; b=Qcbc4YLabTlPSYuXj/6dLzcUtsD/zRftcxhg0t9Dkkb7nIn07ilB68yinWjNtnwbbscvU8e+4JBnjU2zuQd/DyM0OMZx3pR7qSBWSGfNJT1HxA1oX2w8r3fbe4y3syGxASL6P911+nq0Iy21u5ryJbKKg1Ul3am7crwdlhKsPNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789665344; c=relaxed/simple;
	bh=RyOCsoLeUmQHrPIIalVxsKpIalSmo1jF9l7pbYcnRnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZEZZh2/EcmCQltQhs213ykpuMmtcZaFt+t1JpEzxp+IJVvOZ1LPiGt/Mcc3C8cPlK1efdE2TAEsWO13E/UC8i9XQytL9V741h2V0yKkVuNVhCRr3vlgaYN6owHVGZwQqpnLsLOlt43SGugkqppj52ZBulM/n7q6lrqA7GWDfbLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cmtroP1K; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmtroP1K"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b965f447cso9560385e9.3
        for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 10:15:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789665341; cv=none;
        d=google.com; s=arc-20260327;
        b=HV0tsAH0j1ADaGPaYOOtdXruP4pieFHV1id7c/d8JRKe0qiJK7X9dBkpWPYYapHqz0
         yqkUueemvZ/2l/VL7C+mmNYHlpDWqGv+gWvGPolOdyH/bSCEuUIR/5PJqZM4xq2WUCXU
         GYiA5fI9ctgihiq77h8+/2zVEyLvwIof67LvVAYOJCwIASh3gJpZdd3X+gK6g4Fso/hO
         r8cVBRlVCBn+rHfrDMbdJL6Z4N7/ImFlKtSbDAzoPGoJiFVe4cjL/FCK4ii2J43CwBpE
         /TzcbMbafYbcy/6DZSpBVfq3cldja25Rb7nsSfJnIhsEcx2RReZ9AGSYW7tcubwg3Hgk
         lbuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RyOCsoLeUmQHrPIIalVxsKpIalSmo1jF9l7pbYcnRnc=;
        fh=X00eBQO9lvl1iEYsBT9maN525rK32u2NkOL/15FE3u0=;
        b=BTatFI5nkADfPBi7sxsb83EokitcgYsMV+mtvNNHo1iDa1a+h4gvoEwNVWJoA0RgAj
         rnA73sBv8EWiQsxMVXo7adfM860fxQlCStl8vxoKe5mMUksBFkr8FnfBV43ZEIa1Gdj0
         QenG+iNNxNaSqEwsd2Gq4Yl7qTRXUGqIYwLf8JWW5rr64ZW1Y9DBu9LywAAt0gZ6uaxg
         wiYihFs7suRnbg/xQivqO+J09y2avl1PJ6SJ5O8EtJepS7rDPgX+i/8zquo8f1vAEvdW
         a0Zy8uM0fxQP0ITrdpZTNu+pquZ9OHJqtvH4DivXlb9uGJ0jGalgj7ZruApM0gnUR4oz
         8+aA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789665341; x=1790270141; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RyOCsoLeUmQHrPIIalVxsKpIalSmo1jF9l7pbYcnRnc=;
        b=cmtroP1KmslUnoLM63kzYmrrCDDyAqg2yZZaIJoYvaHCxLYr3kTIxse8zMLZwc94sx
         uaHp/ZvqrEN9PUufO2JKRCXpL36d2BaUi4NZ7+IDvDyesP5RLtOwZGgFnIH8zAnQPG92
         hFk/+3X9jcT5KNf7HsmkTWbv50wgcpFGP0qzhNpWeYyq2AqxZU4zK8xMOsbWhJ3M0Qa3
         FQpLr3mE/D5uS9uC/aYm6rPDkL7Q1Du7jMLB5wYFbbH+2EElGKTgGq4T227FxfeHfwLR
         bGCynWV4EQbzbHk078bEeQe9egOYaiSmNiF1S+hTHX73RhYz/pNXQ5aUwCWb9bBCOh6W
         /psw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789665341; x=1790270141;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RyOCsoLeUmQHrPIIalVxsKpIalSmo1jF9l7pbYcnRnc=;
        b=OjTtQ2KevD0DkYuTMcRE6cQbxNuH9pe8dT1Yh9hLcsVLDBJco05aoF7Nyzp/zcUoM8
         cc/+wtdWYxIHAoV2Np9LG/OHE6fSPUNZ1Ifu3scvT1lDZXDLt+gfMww8mY4QnOt0+qCs
         Q6+XlkCStwqzFTLE1E1o1KPr2xpYt1+rmhs7j+MkTw4w2AWI+YZaL58WPq7ovhIIPcsn
         XE0sLgrUIETlcCl4BUebEW74RbzsgLg+H39Auo2zeJt4b0jjgBFrgAOoW+MNWWnKJe98
         u/QQIE7MTKlOK2vSCbxiD9HfEHLVjXn2IOpkG51qPzUAP2kzO1q8Vkx8OQBK6E5g6Dvt
         K8/A==
X-Forwarded-Encrypted: i=1; AKwUvBztq6Oo+yiOfylIkfb9/x40lg0pqdd1a5c4XuIIfcz/Y5SYkwukQ0Rrys7Yk36yMvetSQuVPAO512g=@vger.kernel.org
X-Gm-Message-State: AFuF++lbCpn7fe5syBYPNd6PD7Pu0Vs+hM4t6FCf26ZgGQuk15E/6ZsX
	YYborj7vzzlZkN4bqzToH8e7hg/FJUNglawrJSn1MtknQw27LsqPtBRaBHOhmu55PE1jPpVEljv
	aVIqHZXmbzwjkDWohpvpfX3Gc2hHyVJU=
X-Gm-Gg: AYBFou1bB7Y390z2UnK73lNHDWWqpY+f/QsR1mZTDU0WBN1ngfKqnvqoEJUFhCjoj1k
	QBpXaChpQ/a2d1cQfB7rQOYUrPXpMFWO2nmWt3lXaAGJ6diedk3ljoKflc6be5G7szinXlzfF7e
	IzEVngrY+92MqzmsAW/i+Bf6n4JOnRzN5wf/SKhPTzZcOTJ3r6G9JR+ywB4AQJIQa/+sDs06BgK
	bjvkHT5+O+zEukdOcBiHRWxxeb/0QGZjE5njbB4lYSuTe76HQVuDa4e8eq6cHXl5c6OhTQlAfaz
	HoBUaw/1Y16vtOscCYpeqYZ7d171gpRFI990lSTmvyBoQR3e9UnOGnyofL8EIir2pLNviXVMY+a
	cQCfvwE/gZJyGxVXUzThm77L9Z1/c4nonJWdtQUsfieSOgb08uiVZE+VziGkGfh+M11voss/Xlb
	BYMs+c00QMtzAGJYOlJLnj2LUIESJCpIC1AjRotLmi3Q0OKv3G/o4z+7subteQdyLA7II9Zt/Se
	UtB4gqsQzwU1EmYLs0GOFuc8UF/dU76bbRd55CJ4AuCeGYvyxxltqGVHQ==
X-Received: by 2002:a05:600d:4447:20b0:49f:bcce:13f5 with SMTP id
 5b1f17b1804b1-49fbcce1a1dmr41833255e9.24.1789665341002; Thu, 17 Sep 2026
 10:15:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915103345.1334-1-joshua.crofts1@gmail.com>
 <aqpgUPWUGZp5Cjzt@hovoldconsulting.com> <aqq_ymTi1I951uQp@SMW015318>
 <20260917102429.00002faf@gmail.com> <20260917104233.00007a85@gmail.com> <aqwUky1jSMGbiXCf@SMW015318>
In-Reply-To: <aqwUky1jSMGbiXCf@SMW015318>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Thu, 17 Sep 2026 19:15:29 +0200
X-Gm-Features: AcwNN1Vx0h8quqew4hNT7uRkgLUXPW_uCN9SLNcg_QuQOygx9-cYOKOmc0EAV7A
Message-ID: <CALoEA-zMXhy1VX1MLVCy3d9pmC0fx22sJULamLhMmBX6xHutwg@mail.gmail.com>
Subject: Re: [PATCH 0/2] clk: imx: add missing pm_runtime_dont_use_autosuspend()
 calls
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Johan Hovold <johan@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Sept 2026 at 18:26, Frank Li <Frank.li@oss.nxp.com> wrote:
>
> On Thu, Sep 17, 2026 at 10:42:33AM +0200, Joshua Crofts wrote:
> > On Thu, 17 Sep 2026 10:24:29 +0200
> > Joshua Crofts <joshua.crofts1@gmail.com> wrote:
> >
> > > On Wed, 16 Sep 2026 11:11:54 -0500
> > > Frank Li <Frank.li@oss.nxp.com> wrote:
> > >
> > > > On Wed, Sep 16, 2026 at 11:24:32AM +0200, Johan Hovold wrote:
> > > > > On Tue, Sep 15, 2026 at 10:33:43AM +0000, Joshua Crofts wrote:
> > > > > > Several drivers in the clk subsystem forget to call dont_use_autosuspend()
> > > > > > on teardown or error, causing potential resource leaks. This series adds
> > > > > > the missing calls.
> > > > >
> > > > > No, as I've explained repeatedly elsewhere, it does not cause any
> > > > > resource leaks. [1][2]
> > > > >
> > > > > The autosuspend setting leaks if you will, but that only matters in the
> > > > > theoretical corner case of someone rebinding a different driver (which
> > > > > will soon also taint the kernel).
> > > > >
> > > > > So don't exaggerate the impact, this is essentially just a cleanup,
> > > > > which is fine in itself.
> > > >
> > > > Is it possilbe to create/improve runtime pm API, let runtime_pm enable/disable
> > > > include these pair functions.
> > > >
> > > > I get many similar patches since scan tools is more powerful now.
> > >
> > > I suppose that could work. One would still have to scrub the kernel of legacy
> > > use/dont_use_autosuspend() calls though, so it could end up being a large
> > > patchset.
> > >
> >
> > On second thought, some drivers do tend to disable PM runtime system sleep
> > etc. so it probably isn't as simple as adding the autosuspend stuff to
> > enable/disable.
>
> if runtime pm disable, does autosuspend still work? suppose it should be
> disable also

If we add dont_use_autosuspend to disable then every time the system suspends
and resumes we lose the autosuspend config, meaning it will never autosuspend
again.

I guess adding dont_use manually to the driver's remove() function is the only
way (which according to my cocci script it's 195 drivers that should be patched)

--
Kind regards,
Joshua Crofts
