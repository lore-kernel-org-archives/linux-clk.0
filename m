Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EADC38A700
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 10:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781693504; cv=none; b=jr1/PuKzeddvoUWcKPu6nr/637HypGaFhMY9SctlA+qeNgzWaXyE+lZTOtXCKabi9QEQ/Dk2zPXJNHO5cWnmgZeeWRDZQaBotbv3Kbnjew8mQJqCAxq6/k7X6q8zL1lJOaxK0G6SqM7JKbsgPlIEoGkLweS0qrDsWdk2ZGTv6fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781693504; c=relaxed/simple;
	bh=iSZMyBLya8ezFCn7gv4uBNh8KRD3vxlGZM/f8tYKfno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=crqzn2Y2laXLD4HmgKGFpPhY464x6dDUgGh/vI3lTYEWD3p5eB6tmgunyEunazEZVJiLuRg+YcuFByHvoCF9TNIp/Y/vJ/gM+Ye/OAuClRsKUm8CbHkcH8i1LUye6xMuS3kiXIEvLPBam2eLYrpzG4Ruy0HAm05wdppalAdnt+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=exW/2PG5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IDV8XC1d; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="exW/2PG5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="IDV8XC1d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781693502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XYxunfnHDUvyIcdiePkjscnLIBJQu3HyLz0jPAf6mkk=;
	b=exW/2PG5/FZRtgyXdbipwi4ovrNLQxpaFNGTGn0OP+LqE5I8xTRa++48oFk96LLg1tRs5W
	ynLdZKy1dv+PKZRvd8l2R/ZbqrhXnPvavQz03t8ejs3TmcZ4btYqK+DfiuDM3qRcvX0gJU
	SmTwah6QSLnpAM0Pn/YIPNsyDUfgkSo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-203-GlaZTBBYMvum0-yrSl4gRA-1; Wed, 17 Jun 2026 06:51:40 -0400
X-MC-Unique: GlaZTBBYMvum0-yrSl4gRA-1
X-Mimecast-MFC-AGG-ID: GlaZTBBYMvum0-yrSl4gRA_1781693500
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915d1d4fc5aso927445285a.3
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 03:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781693500; x=1782298300; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XYxunfnHDUvyIcdiePkjscnLIBJQu3HyLz0jPAf6mkk=;
        b=IDV8XC1dFMfr+2LPtwRzlJYQsWm61Agpk77EJa494TKF5sJgXspeAMnO1XpqQ/Xxfx
         pOUCnuctDVuMekhHV4jZGW04d/xnxLzv4B7wRvdVVI3L6Bc+KePk0GGQVLO8La2HPYSu
         kM6zIm9jaTp2T50CRWbrp2MbJbxfaRhwed/TgR1cMcaO8twbur5ZvzbMwlxKAr1A/KF1
         BJ4c9e6Or461sN+sANQzXR6Y/hPXPNuDtIF0zis3dxpDmbacdyomvpdm3MH1WWrDPcSx
         Ykoea80cnBlyNbN+V/CeqzEjv1qTkKGYNsyDnzXRTWn/3IyX8cg24ZT8/bq0FPzwbpm8
         U6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781693500; x=1782298300;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYxunfnHDUvyIcdiePkjscnLIBJQu3HyLz0jPAf6mkk=;
        b=hxdrHyhudFoH1p59xuiAhHEfw+uMwxpNaSdxdXuhqNjMMaLRiq7i3GUdov26VU/Yo3
         v3tg43v/tXJdAvYTnwjB5fzoK/nuLaeoa9LH/05/IizHcJMQlMjty2+7Xt5JLxOub/Dd
         gzk2KnORuKt7P507AvHKcujgpWGutr9zR24yB+RO+iQhGegZEvX2VowYA7z2Le2zlcGv
         m+XPxdoSlluFoSAMSr8PAzaTKjti1WSTLFbgiUvW7oP7PFgZmUSYb0qvFYkfSxBZhMZv
         MY6Bzm6MemUF6MUoBWeB2tL+Ceb4BF5XT0WxL8jywItcPI1NwqDxv08QGWlCHmwojjiW
         X7JQ==
X-Forwarded-Encrypted: i=1; AFNElJ9YPmBHU63u6oGDPXsLFhelRd7uRw8uWvcKMianSiv1LzDT35SixS1Ee9sSpLpi/c/efqck3Xdbtug=@vger.kernel.org
X-Gm-Message-State: AOJu0YysvTwh7ZL6GrUsKzUk7ZxMg33pnsnEfPq1MPJiCcgjBoIV8yz7
	76k0nCxqw5z0xUBaS1PslBT9XMPs95EEQScGPRaZcUSIwurHyFGYyzLNkV+H+SUXzutuXwmUJK2
	lxlpph9ZICTn7+yQ8mb1Um1Ws+CHmn2NS+vsMIIhO226bfDM/xQjmBbrwQXMoEw==
X-Gm-Gg: Acq92OHb5pFiKHJlnZWl2uHFNGMOgJ//dxn/J2K2yHlhfLAfN8zp1DbxYtonaDCdwei
	VKFl+2Dkj43VuaW6KzUPd3Ao+QxrzDOfA4lbpBuv3WA5KdmlaKtDZbozd/FwoxAUiQNcXrfG5lT
	gCDrJbrDuD3sdlXRa5k3pyQA8VLOPuG/UP4F7jOLvDQPFs/23165KUrdX+RpcDIV1N9s0lZIdzp
	k9D/ohP9gOhr5tRrgyeVGZzzD2Poc7deJ733V7UnHwWxhARSpruOb1wo3t0RfQEt4Yv6z7o+37t
	wgSGNVNYHl1QFlYxvh1bFE5aHdvEwDS+9VmBGmlgrscPEh7d1htghAyMYvvzpWJJFIfOG2QXLQO
	naxGH8wAlXJity2cZOMZ/osRG290ekig4NWDSJVvRw5bpNQ==
X-Received: by 2002:a05:620a:2785:b0:915:9bbb:f454 with SMTP id af79cd13be357-91db9e7cc98mr428012185a.5.1781693500325;
        Wed, 17 Jun 2026 03:51:40 -0700 (PDT)
X-Received: by 2002:a05:620a:2785:b0:915:9bbb:f454 with SMTP id af79cd13be357-91db9e7cc98mr428009885a.5.1781693499871;
        Wed, 17 Jun 2026 03:51:39 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d9f4ff2206sm59055256d6.37.2026.06.17.03.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:51:39 -0700 (PDT)
Date: Wed, 17 Jun 2026 06:51:37 -0400
From: Brian Masney <bmasney@redhat.com>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] clk: eyeq: Support for Mobileye EyeQ7H
Message-ID: <ajJ8OSemkwebmolg@redhat.com>
References: <h_BA0KRKTGSANQ5Y4eqo6A@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <h_BA0KRKTGSANQ5Y4eqo6A@bootlin.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Benoît,

On Wed, Jun 17, 2026 at 11:25:03AM +0200, Benoît Monin wrote:
> Here is a pull for the clk-eyeq driver adding support for Mobileye EyeQ7H
> SoC. It has been posted as a patch series previously, this pull request is
> identical to the latest version posted[1].
> 
> Alongside the changes to the clk-eyeq driver, this pull request also
> provides the dt-bindings reviewed by Krzysztof Kozlowski, a change to the
> reset-eyeq driver acked by Philipp Zabel and a small rework of the
> fixed-factor clocks reviewed by Brian Masney.
> 
> [1]: https://patch.msgid.link/20260604-clk-eyeq7-v8-0-53f618174cf6@bootlin.com
> 
> 
> The following changes since commit 5d6919055dec134de3c40167a490f33c74c12581:
> 
>   Linux 7.1-rc3 (2026-05-10 14:08:09 -0700)

This patch set should definitely go in, and thanks for setting up the
pull. Is there a particular reason that this pull is based on rc3
instead of rc1? Stephen usually bases his pull to Linus on rc1. Ideally
Stephen should get the rc2+ changes directly from Linus. It's no big
deal if rc3 is needed, but the dependency needs to be documented at
least. The reason for this is the unlikely case that the pull needs to
be reverted.

Brian

