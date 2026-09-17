Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2142417366
	for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 08:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633482; cv=none; b=jjqw+7LP0YX1GoVbuYZGE02W/ImIOzdhiSfjdMnCNfaQilRGNjTJ/BlaS9fjAxQgVbJsOJppWGcE6vFC0BoNBX6gw3Fzk+4WXD79m3OrJ8/LMUB+1MX8qz4rjT8bGXtrEfUIpEy2EepU/yqwhY9ufcSB3aBn3h/dBsZ3izzt43I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633482; c=relaxed/simple;
	bh=L9v9q98gPrJzJTT1P+rysIIc1Lf8YnVgiDYtobB54jQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MhENvokWPxLoESKyRTqvCCCj/E1geJR2lXHN9HP0eKDSyKuyN9reW4b+/xqDgD4WdlafcL5jpUeOmhANLmeKfZdaom1CqkVtpBirw1k2NgmMVTwFCDHA6mcXD6sFjqTl1x7ybEe2EVuGzr7wALqgH8R8d57bRdy9rqEtRiOK7tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bE57fl7Y; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bE57fl7Y"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso5287785e9.1
        for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 01:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789633472; x=1790238272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DFlrcxSZmPD5dZXM5GhCeqxfFV5r+Gw3spLtAai033g=;
        b=bE57fl7YT2VHCDXMweQkJ6TSCAvOwhs7l9Zkr4F5IU7l8QEr0fvlbLIhRAZQo9SsfG
         fGqOzBIHpSU1qGIF57Kuo1G8kT5TSjma0K4fwgqBzMvfbHRkNQirYy2jg3sDZCCxNiAa
         UgCwdTlqiypXSA7UnXfv4DBF6UNbloDBrfU/Ghqy/+7IFSnXTsAGbbcNINUFhMg+Kgrh
         hgCWjyDLfKiiJKpmISDg53AgzT/NvKBHMblZ0+/M86sQNnLFr1qGTc1UdZkU3artMQ7C
         dDBR0zqRV65qqhXSprm2ZUOjxy2Nze68CxTlCXSCZZBDVvL5+sv5CLWBUyidLxpZHP7F
         w+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789633472; x=1790238272;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DFlrcxSZmPD5dZXM5GhCeqxfFV5r+Gw3spLtAai033g=;
        b=CMG3C36EjCEUfvfPdq6QfaLGP9upFM1HgJXHddcllzn3UxJUN4+F+rZCT0WxzSssVv
         nsVpWHqAnyxDZLvrqthtmjBx3SfCgShi0t84uepYVPjThbAN/dD7/Lxz0FkURhaEb8Y1
         EpWn6IiqwafaMhEQsl4UEi50FvnWJ0Xhf+qHyIAEFCYjnfqDRTXH1+1QsWYSrcbGkDYP
         XIFI6IaMOh/shzQt4Hd+5JoLQF7vg6C/aww0PyZ55162q/Euk0o9EC0B0uYyk4dDfADU
         k7m51d27heovzE7ptXAZDQcSfvxP2GnBrN2liYdH4TEixjbSXKA8omi3S6D4XasLOG9Q
         owbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzS6cTglDhGP+e1Tqc71dXlNtyvRsbWmq8xnOtK5DJin6FQSWwk5gkR/d8PKyIgoe2/pcqzyCUAVNA=@vger.kernel.org
X-Gm-Message-State: AFuF++mYmhSAzvJBhZAzdCRVS+1aQBw2RL7N90Kd5sQaSCmQMWq0CK1q
	ilNJwQoDO8Xe+NXObu9/fD8jGwKQ76112M3QVNPeXsxXGL4EepjKP0fb
X-Gm-Gg: AYBFou1RHGZVIvfqlQWqcNMYtDNrw2sKzhJ82oWT102M+yOZ3JF8Xi+2z52dPzJJ3zr
	jCIhiMomP0dUyZVW346DkxE3ksgVWS/coA/PHgp+JpPK484sop3pxMs/CwGJ7HAtxZ/OYK+gLFw
	KPpPWvdXEMFL6iBeidlcYHoTYLNszRXj2wYJO3P7j0tOgvVbxiQFCESRhmm8QxZuYET6pouICpC
	CjtzXzVNHzsxrDj1Q+IqlOHH8y+/pm/YSxp/vPzvsVT1pEE/rPmiuoZiqd/6xKsRzyzawQvAJhc
	EfWQpn7yhl42kc/3RxApXXReWpgz+hKP+SFxXsDNlhC8ldiBE/DrYXHcj/adsiBkKpWqCyFIUHZ
	mIjX3UACU1headX87Y1D7tGBgeMWJWGVMdJeTQpWe3EbRoC4ebj3MS1enpyBcySGY4/HwOpjj1y
	L1rkXDaR29n+ITWYOM0lqscu0FnaszoTP/6UAy31JIUhNnrfAcT70zNOEonJgFjjeDgpsWqvkWk
	6FkQzaDYY7vNYo6xfCNSlxrpFtrTFf31+W6npT9tPI8Q3qctCfZ/0njGspIY7hLDEZ+qmdWyVSm
	xymRFRmq1+Q+7TGd2tSwGcQj6/1UCJwxMMGibX1bBXJKBRE7G5/PRsUUOj9YaIEfFZUa97cD+OV
	ojLgi0I1+DDP+oDfqHxE6Z/jDifH8M59WBf5wtBmW7Wsof+HH70jC/+HR0vU//E3Ii+GQ0bY9Eg
	XyJFfABubmr/yqiPY=
X-Received: by 2002:a05:600c:35d0:b0:49d:827:e5b6 with SMTP id 5b1f17b1804b1-49eb7320b76mr75942795e9.20.1789633471744;
        Thu, 17 Sep 2026 01:24:31 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbefe1791sm38435265e9.1.2026.09.17.01.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 01:24:31 -0700 (PDT)
Date: Thu, 17 Sep 2026 10:24:29 +0200
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
Message-ID: <20260917102429.00002faf@gmail.com>
In-Reply-To: <aqq_ymTi1I951uQp@SMW015318>
References: <20260915103345.1334-1-joshua.crofts1@gmail.com>
	<aqpgUPWUGZp5Cjzt@hovoldconsulting.com>
	<aqq_ymTi1I951uQp@SMW015318>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Sep 2026 11:11:54 -0500
Frank Li <Frank.li@oss.nxp.com> wrote:

> On Wed, Sep 16, 2026 at 11:24:32AM +0200, Johan Hovold wrote:
> > On Tue, Sep 15, 2026 at 10:33:43AM +0000, Joshua Crofts wrote:  
> > > Several drivers in the clk subsystem forget to call dont_use_autosuspend()
> > > on teardown or error, causing potential resource leaks. This series adds
> > > the missing calls.  
> >
> > No, as I've explained repeatedly elsewhere, it does not cause any
> > resource leaks. [1][2]
> >
> > The autosuspend setting leaks if you will, but that only matters in the
> > theoretical corner case of someone rebinding a different driver (which
> > will soon also taint the kernel).
> >
> > So don't exaggerate the impact, this is essentially just a cleanup,
> > which is fine in itself.  
> 
> Is it possilbe to create/improve runtime pm API, let runtime_pm enable/disable
> include these pair functions.
> 
> I get many similar patches since scan tools is more powerful now.

I suppose that could work. One would still have to scrub the kernel of legacy
use/dont_use_autosuspend() calls though, so it could end up being a large
patchset.

-- 
Kind regards,
Joshua Crofts
