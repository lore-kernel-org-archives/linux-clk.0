Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9253A7F6E
	for <linux-clk@vger.kernel.org>; Tue, 24 Feb 2026 17:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771955004; cv=none; b=jtcB84APrwTLvM+9gsqdf7Z/JwFtowu0Rg3zd9rPkUmU8RWjPf9gdbuNq0MXb7y7iOduKzgbD4OG49j0kvqb3AuL1XJNEJU1KyPOrNUHL0Qw3D/jHEa97O8LIHvYL7fjMF6HcHjV6QDnCrZ13AOEJEl7q75MdQPl6x4wnz/QkjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771955004; c=relaxed/simple;
	bh=VwJm/H50HwtkYlPXgl934LYqPjjHei/BOTuhANYY8GI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bT3JpzeUlpRfIAHEiuD6TEDt9TYx1IVVLTPc6pYMrabyrJZ8fI/rGS9683bHKxm+2wiOL7o75WlQcTQKZG/biDv9rbwrSh9Mdr6RZ6D4V4BuMYc3At9t6HDeY+nvRTdF/M7PoFpWqTfsyRAOvZbwgBWUydHHhAQhLhkE5uKremc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PwRvMMk5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nKPfaoFf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PwRvMMk5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nKPfaoFf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771955002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7SSKOMRCXLqGgwbJ0pXKqOXYDhtfP9EHjfpT7ob/Svk=;
	b=PwRvMMk5ELtCVOwdohJA19YTbd1VfRj9HUYaEFL9c8JM5E5Ngw3IBsqWdqZJh4uyq70ni1
	wWA0d7vMGjU9kI5Iw2UB4jbuN4cTxjxCHh5sxYJbJ5HHZV3GoFVAw8046QjEX/pwdRwBLq
	IhF3VL/1Q62SGz3DpaMvoDZJxe34s1c=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-WKNtHWMkOSyOp2mKOcHctw-1; Tue, 24 Feb 2026 12:43:20 -0500
X-MC-Unique: WKNtHWMkOSyOp2mKOcHctw-1
X-Mimecast-MFC-AGG-ID: WKNtHWMkOSyOp2mKOcHctw_1771955000
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5033b62efa7so606496421cf.1
        for <linux-clk@vger.kernel.org>; Tue, 24 Feb 2026 09:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771955000; x=1772559800; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SSKOMRCXLqGgwbJ0pXKqOXYDhtfP9EHjfpT7ob/Svk=;
        b=nKPfaoFfHKPqokRLbf/mMPfjwa27H0wh7Fq68d1JALyl91HQIu9DeWd3PZ8kyuQWUJ
         D6UNbF7y+vttkJQCdr7FP+1Uuxd3r9qf9lvuN26E7hPXrEY79L3Da+UcMCTViKaaHcz9
         ttSY6eQB6k4MyhAqzbgfvroABWiOZm2MxUc/H2Ou1BWKHtD+6O1/L0QMonMN+vwg+gHW
         u9e0/0oSAWD9z5N7mddQH56kz0JLnXWhHcdme+I9jZr8DRuN0p7ZMPORDqDNaZ1UhSZ6
         nvIWZ8UUnoku4f0pHFdX6Pc5f3bZj9oHvIdh2aYLipAzzTY69HaNyVh/yyfKpB8eO2l7
         dOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771955000; x=1772559800;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7SSKOMRCXLqGgwbJ0pXKqOXYDhtfP9EHjfpT7ob/Svk=;
        b=aeyOK1NBxua83/jHNrOiF8yiGbYOH1/zT7PPJFH5GuPYn/O23uPF1OimKtEgU7E0QP
         GPb9gEaRrR6S1gcsSqFxgemtgqE2TxOucjtp6cG6ZVpuPdFXe2JwvU9Zg+nbR1a2aMTV
         Upa+vpP+287ZLRMvkzhZU9xbpjmE3trrLS4i8dEGBp/rbEQeCYCOYkyMCFjUKQdWLwy9
         w5qa7Jp00qIcFa9sXaozjewH5kZ1a/bC9k2DZNgZs4ohdlT0UpRCPOmhA+xeLKiTMWsl
         Gx4rOMAUpg7lc0UVfF7Nj8l6GZAipwh0FU7TFUEFHecxy9Cs8RukhNUdz7+CWB8/HJaj
         KiKA==
X-Forwarded-Encrypted: i=1; AJvYcCXV9mvLfUiJrDr4Nd8eHVIkctXOAI8q9f9yuyHetYd3pbv2qbFzemQrfKZayPCuV/nOz+mpH79h31U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwU+wDSano2pJfkI881FUIymrD7BlMlNisEtVx0XpQlZgsNjEo7
	aRShUPcQN5T7oVGDhi0QzXsLRWiS3s90z/WOnGVAy/Sj31aeW+Yxu0Zc1Gao6wtscHBQ7zhnbU2
	Ip2g56NblGio8zrkdKNFomRYWq4iiGLbK8nBRiu9H9P9kqxl2zf4y/SSP3WKHng==
X-Gm-Gg: AZuq6aJql3JhUALDkAiFFtziSPPaiD76HJkjOtsnhJeAHABnGdOPl+GnIxzHvmU4x06
	7kq9jfHk+ZDI3U9lPpaEN7E/EsMVIGlEJQxn5CZ00YWbiZRP/C+bDo2aIjIv9yORO5RFlo+9DV7
	Cl3z9nJd+qvTMDHM6rsitdw+WHhG/55Hra+xN68q3y1ZsCFFIKDZ79yOizK8EscxXy6qox91dYr
	rUxi0Ieklopcj+2h8ClosS9KTUvm1W6kH+KFu77IMFJ0LkjsnNU5zJwfYhPvXU7UJnuYUDL+Zka
	mnZIkx2qUQyRoRxSBgljHqPK6G2sjZdN1eHVDGftVCyLk70+e+3ExwWdmLf9Qxy4qeMV4JOOtGH
	EhMLEe49byXdxY4cRNkKkfcOA9HzTJ2yOX5hfnpIt3eo4EAztEN5IdUeJ
X-Received: by 2002:ac8:7f06:0:b0:506:a57e:ae0e with SMTP id d75a77b69052e-5070bbe6e7cmr189193611cf.29.1771954999982;
        Tue, 24 Feb 2026 09:43:19 -0800 (PST)
X-Received: by 2002:ac8:7f06:0:b0:506:a57e:ae0e with SMTP id d75a77b69052e-5070bbe6e7cmr189193231cf.29.1771954999504;
        Tue, 24 Feb 2026 09:43:19 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb8d1036besm1064368385a.39.2026.02.24.09.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 09:43:18 -0800 (PST)
Date: Tue, 24 Feb 2026 12:43:17 -0500
From: Brian Masney <bmasney@redhat.com>
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 0/3] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Message-ID: <aZ3jNaDR5eaCtX7p@redhat.com>
References: <20260222-clk-microchip-pic32-v1-0-ceacbcd515d1@redhat.com>
 <20260224-placate-runt-54aa8419ec40@spud>
 <aZ3ff9vq9yuCkwTQ@redhat.com>
 <20260224-gotten-showing-f5f276daa541@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-gotten-showing-f5f276daa541@spud>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Tue, Feb 24, 2026 at 05:36:25PM +0000, Conor Dooley wrote:
> On Tue, Feb 24, 2026 at 12:27:27PM -0500, Brian Masney wrote:
> > On Tue, Feb 24, 2026 at 05:10:42PM +0000, Conor Dooley wrote:
> > > On Sun, Feb 22, 2026 at 06:51:03PM -0500, Brian Masney wrote:
> > > > Here's a small series that lets us enable COMPILE_TEST for the pic32 clk
> > > > driver so that this driver can be compiled on all architectures in the
> > > > future to help avoid breakage.
> > > 
> > > Why do you care about this platform? Originally I thought you cared cos
> > > you were getting involved in clock subsystem stuff, but I see you doing
> > > stuff with it in pinctrl etc. Is that just general cleanup work, or do
> > > you actually have an interest in the platform?
> > 
> > My sole interest is to clean up the clk driver, which spilled into
> > larger work to clean the include header to allow this driver to be
> > compiled on other architectures. If I was going to do this for the
> > clk driver, it wasn't that much work to do the other pic32 driver
> > cleanups while I was there.
> > 
> > Honestly, I hope to done with all of these pic32 drivers after what I
> > posted this week has been merged.
> 
> Not to pooh pooh your efforts, but I asking as I am wondering whether
> the whole platform should be deleted. I'm gonna ask internally about it,
> but none of the authors are around anymore and seeing
> | git log --grep "pic32" --author="@microchip.com" --pretty="%h%x09%an%x09%ad%x09%s" -n 2 --date=short
> | 5e972ac119c87   Conor Dooley    2026-02-24      clk: microchip: rename clk-core to clk-pic32
> | a726f1d2dd4fe   Purna Chandra Mandal    2016-06-02      MIPS: pic32mzda: Fix linker error for pic32_get_pbclk()
> is bad omen.

Yea, that's not a good sign. No objections from me.

Brian

