Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5676615C158
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 15:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773759646; cv=none; b=jkA7+u/6MwqYdUMbZ6Vq03N0Nu2IHHd05QD21RhL+gbzrwSmnfjARIO0l1M3ulmGKDtIJrVF8HmDqTBuwrH0eE2ZBFIrpcFDFcNGe4OaeVtLIJKyJrBuPb8dzafe9flL2nOtPYpaH9N99wsyLVhDd4U+v0hIXgJgMBpc5zvz9NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773759646; c=relaxed/simple;
	bh=y0cFwtPG/Cb2k4cmeeXcVJx5e1bEZ27UmXDXdyoJzSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fSZarp0lt6oF1whTVS3Tkua54qajZRvnqaHKmLHjeTB4fc12zvYZQmRfrwtmmilPK0IzV1OenVy11OqBQefxLhvW0R26IsQcWHtiHZD//og7D2FvgECT+N1Y6JLqjYOu2JNUDO00SdreEw8I8Mu1U9bic6T+r6cvEXcS/GzeMo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CJgJD9tU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xunniq1/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CJgJD9tU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xunniq1/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773759644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2ZjyvvzO6j/AYmpeb+MoccEZqlSVtgrWJzOGtOE/3fw=;
	b=CJgJD9tU194jrW5VE+Wx/TQPZDv3SBhup5aAsKdWaR/Xe9v3BPuJ9e62Oj3u5GpUsyl8YT
	j5Ezn6yeDYXGW67CBrJG5OboGoQkq6lPgXoG9I/UmAs2mv8sTwQtSfcOvsBbjodtB2TOft
	4aOcqVEnqq6ZpeSFNEpFIDF7J0hN4as=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-sr3X-IAGPJKM5IZ2gMZspw-1; Tue, 17 Mar 2026 11:00:43 -0400
X-MC-Unique: sr3X-IAGPJKM5IZ2gMZspw-1
X-Mimecast-MFC-AGG-ID: sr3X-IAGPJKM5IZ2gMZspw_1773759643
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd77e5e187so3303105285a.1
        for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 08:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773759643; x=1774364443; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ZjyvvzO6j/AYmpeb+MoccEZqlSVtgrWJzOGtOE/3fw=;
        b=Xunniq1/5jx1ZtYBjiTb6g37nvVY1haf8s8xqibb7dvikipBQzxpsekjPXafUlvwdD
         zvRPQJcnv+4URLRVA7quDV46IiB36jq5W6wV1VFWrR+EJ6aqE1Pluo4evEShxIiIt7vu
         MGxiUzkeMuWz+8le1GJnwXEtCaOBOw+m7DPbHRcqGYh9ggsOpSoyWUbDwGJcMw7xgRNA
         jfMyblzC4xWAJj+Ax11atRG7quFb4iSpxXvV6p6GM1bQg+8U+LdE6lPMjQ5mZTbCbyM0
         /YuXpfa38VfR70SCKYNBJIsoAL/IUCZiygR3VcDUzCaNUIFQhUxuVJjN7qxBigfLgrrL
         l0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773759643; x=1774364443;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2ZjyvvzO6j/AYmpeb+MoccEZqlSVtgrWJzOGtOE/3fw=;
        b=BRn9s0VGWunINWIuR5kO4kXfxzCKYkoNHn8Q7ROxURnmJVnyRUb8lR8kHm2lw2y1LU
         FoCU6umsk42zMb/9hgFKfWxylDD3U6zNl0jwVJKKYOpAmQH9pR9UlDS5iu7irZBnS6xz
         dThzz+Gp1qIiKgVPNLnrJ/4G8B71slFO1u/c5i/4q9HLuo/fvuLp/bWzmbUaPV/LRWKg
         T1QgTHr796S2RY2cGzYXzBdacW1hpqU9ljtAi/0jRbaSJ4/nQPJLZJ7BZt7u1x0fQVIO
         CaqZxRJXi7ak5AQqb/4e/YTMYExTyIj6aswdr4FLSm8FQ5PYHJXdDinPMrj3oxz2SB7v
         ctdw==
X-Forwarded-Encrypted: i=1; AJvYcCU1c8IVVdX8m1RItQUr6BBhRpEqw/F+gR/H7LAaVcTBbU8pQZ1UpMHUnhhx/q+SQbXbTUPa9K9CDOA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6A8UY8J6rtevfAEiv/pRL9p6nbffZns70/6VmPbOac6UwgNrx
	NRo5HWdE2n4+1+Jnm5qAhfgxbe/Hmqpt7uo7qsHlht6Js1HVaPiJJ8ezaFjZjCk+Fy8+W3YEQlg
	N47XwUTOs4oyMtoLsj0wstWEzUWmCFGxZoAN0y0vFtqLND6K1ejZt7kq3SnPhkw==
X-Gm-Gg: ATEYQzyG21vAq7WsH8ZVFjhDtaxLZ6MjOu5LNLj+nRpzl7mBR+E2QfbdsHZ9B4WVTEJ
	Gu00Z1sLH9UTGT+GbXf1MQ1Yi0mzE0TkM3FpqGnOwmyJHJlIz75k1HK+jjjjAtE9fZYiU6kwsBt
	dd0G2aF6VgP7gtVn+HdFCywFYyFHRei3/kLdkLQ6ZTVs25fef6s5eyY/qbaUWcUud7jd0YAHAEP
	kBCcrML2j6Gn+yH/+m1iCrNmg6QerYrfICkDgn0YupSMBXCkhs4uMl2GGsjVIVSSOvUVxZefPiV
	Nf44uWZ5eXqKusGPsVFY5qXHrfrYJPRQRgGVrjKCYmi174bnmTPZWLnGoQLdnzI53wuQCLxRWSW
	2EzSvvA/754HRR6BMTKyxCMCwYdM1SltMuEGdbPBQsJBAYbeu44eXb4ZS
X-Received: by 2002:a05:620a:1a25:b0:8cd:8cb8:6ff9 with SMTP id af79cd13be357-8cdb5a70fecmr2086629285a.34.1773759641504;
        Tue, 17 Mar 2026 08:00:41 -0700 (PDT)
X-Received: by 2002:a05:620a:1a25:b0:8cd:8cb8:6ff9 with SMTP id af79cd13be357-8cdb5a70fecmr2086616785a.34.1773759640773;
        Tue, 17 Mar 2026 08:00:40 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda21484casm1462547685a.40.2026.03.17.08.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 08:00:39 -0700 (PDT)
Date: Tue, 17 Mar 2026 11:00:37 -0400
From: Brian Masney <bmasney@redhat.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Maxime Ripard <mripard@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: add new Kconfig to control default behavior of
 disabling unused clocks
Message-ID: <ablslaSoUraCRPKl@redhat.com>
References: <20260316-clk-ignore-unused-kconfig-v1-1-6e95a4fb0c94@redhat.com>
 <20260317-almond-leech-of-correction-2a2ef6@houat>
 <com5zf4bfgb3eoelbmy5pfykhdow6ne3nteua6l7bnzkr72dsb@pehxxygji5z2>
 <20260317-notorious-classic-sunfish-d016d5@houat>
 <2dsd7hq4bn25dibqk62a7o56tt2tecf645tq3upccneq4hby67@cmjjc5d6ximt>
 <ablhdKJgEhU8KmtO@redhat.com>
 <hdagvfcxoh4nukz5sqocbp7qbezv3rxct3aygb7fvhsej7zp27@iyeoi74q2w7n>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hdagvfcxoh4nukz5sqocbp7qbezv3rxct3aygb7fvhsej7zp27@iyeoi74q2w7n>
User-Agent: Mutt/2.3.0 (2026-01-25)

On Tue, Mar 17, 2026 at 04:20:06PM +0200, Abel Vesa wrote:
> On 26-03-17 10:13:08, Brian Masney wrote:
> > FWIW, the only reason I posted this patch is because at the end of
> > Stephen's LPC talk I got the impression that this was also an acceptable
> > change. I'm fine with dropping this change.
> 
> Here is the scenario that proves adding such config isn't the right
> solution: think of single kernel image working with different SoCs from
> different vendors. This is actually the case where distros need to have
> a way to provide one kernel image + thousands of DTBs and be able to
> boot one each one of the boards. Whatever this config is set to in the
> kernel image, it will not work with all platforms.

Agreed.

However, with or without this new Kconfig, we have this problem today.
Right now the kernel isn't bootable on large numbers of systems, and
people have to manually add clk_ignore_unused.

I agree though that we don't want to penalize boards that are doing
things right, and have a full clock tree described with higher power
draw. 

As a test, on my Thinkpad x13s (sc8280xp) clk_disable_unused on Fedora
43 turns off 96 clocks on this laptop! I can infer what some of the
clocks do based on their names, however I'm not in Qualcomm, and some
of these clocks I'm not entire sure which ones would need
CLK_IGNORE_UNUSED. I got it down to a set of 7 possible clocks that
may need that flag by excluding some classes of clocks, such as usb.

Brian

