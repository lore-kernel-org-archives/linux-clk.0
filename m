Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56821A9F97
	for <linux-clk@vger.kernel.org>; Fri,  7 Aug 2026 11:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786101437; cv=none; b=dCla+qgeoNY1n3DSsJ3vd9i38xvYbN62/1OEm6XSjUHKYksKTrTpO8W/gwcFv/KxAA9ZdEaISyxjhxuZydYIgb1969C9CkQdEgzRSueNaaNLwxaBwzPfUIA9Tk57NUG3QaatvGZCMbCp0J5xP5fPVD5yHlvJ2paz4sT5UuTgcvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786101437; c=relaxed/simple;
	bh=tQWX9qVQmwbhRMeFCbhXfhYBiz/Mh4vtCAlkc2tgB7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n+Htyp7/AC8VUjtm8j/AOShPgYh5wMM6kV5qp8h3GZxly1OzhTdOxYtECx+13tLEXYW2aBR/WXss3EvpOGvZX4anwYaybEOlUhNPYqCHSx7nCeKrogvIT2XPKr2Y11071h/3n8aTmzTDMpMzazoCMV6gUzwapVJHrSe6yzRQZhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZVVdQjD1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=X7L+r0u6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZVVdQjD1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="X7L+r0u6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786101435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KXiDjLLWbXS/DFlQuw5Vf60s5TYQFfJ4zum3WzxW4Qc=;
	b=ZVVdQjD14TmFaA1b+/ka+UzH5mqYOKVRbJiPN0iMUO2rWgfvqw/THhnXCJqbq3DsaTruTs
	l8n4MITNGPYJQlXq8sKGclALEffnA6qlg5Jr8RcEg+9x8Qv4by4Vk4K8sj2o2keyAH+yiQ
	1X96KjWsHVFMYMiIUXgM9t2annIrZck=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12--LRlUiRuPKCPnLdZyWWHJg-1; Fri, 07 Aug 2026 07:17:14 -0400
X-MC-Unique: -LRlUiRuPKCPnLdZyWWHJg-1
X-Mimecast-MFC-AGG-ID: -LRlUiRuPKCPnLdZyWWHJg_1786101434
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-668848d0422so6604608d50.1
        for <linux-clk@vger.kernel.org>; Fri, 07 Aug 2026 04:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786101434; x=1786706234; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KXiDjLLWbXS/DFlQuw5Vf60s5TYQFfJ4zum3WzxW4Qc=;
        b=X7L+r0u6aG/BhKC5aNhvvPraio1DhiCRQAuINKnSoWpCAa+dkfC0WqGVYdtRDbN6EW
         ECDFccSx8EyJ1GxeK9Rstuhlqb3wfhBf+4U1ISnogDdL/ReW/P0DJ9NmX07WOB4BSrL7
         J4O8LrbH6tLg4uUP83RiBvKpnNXrRnjSddykzZHKp5B81mA3n1zQ8ABCNJgkJ5wX+7bZ
         AfqdTwdUgwoVp5BWRpDKH4WRSowYixUPk4JAmVMZxfzc1KMBFhG2a4GZ5C5H7inXPBmh
         1Val9xLcUnd3h97pbU9C3VqkkU/rgw2LoZZ3dqKvHtAFZHhiIFe0UPGDhHIH8wu3K+3K
         Axlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786101434; x=1786706234;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KXiDjLLWbXS/DFlQuw5Vf60s5TYQFfJ4zum3WzxW4Qc=;
        b=Es3pPaO1lIyAkJah/4o7TC9EWkSqHtRh+1uwjBWcrcp49SmAHdg+9MVSHWNcX7A0bg
         11blKtsX2wm72OqVO26kWkeLRa+tJV1qcJTMKhTYxgBvZNxQ6vuMxRYMC0gjqXEeURY9
         wzRKBxquUfcvE1fujSHqKfw7Y33rFbzr+ZfjzYRVd9gcfVW0LVVA/KeTYKTK4NFMfWg9
         WDBG0QmvpvjeVK7tJgXU+Ufsi5OFtlKxSJwCkLdZAtSwBG69tCStlVL73gBt7kci29Qs
         5zPnTOlDQ2D+cKcyXq8jdRAk+ad3mzGGLVmn15aJaIz+pE/ilvVDovqycgtmU1/ANfD+
         yrBA==
X-Forwarded-Encrypted: i=1; AHgh+Rq74Nbwn7/HgifmBkGEAv24eQCZZssuBBXevv6k6JngjHB57jWzOb6m2xdMWv1J0hHynRteJlxWYYA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwBYsZ9bhyWIetrVMOloCReGIk0lVvl7xJekI7sClqVEJ3r2Rw
	I5Shwxt2e6Ls8ChFX+iK8p09+D8zkZM6u12yqbUUvzFEKPa2fst1JY3vW34xglRrroZj7ZdKI7H
	JW6ic75cKoQC7U2v2M0hV7kjAsRZ0EVAl90eCLdkK6j12Wi6eu/kf/LojJXoGsQ==
X-Gm-Gg: AR+sD13x/dJ8pURkMwlEeB6NMCPvMSOKNyLLVnjl9wa2gdv5Tt/TQCMaaCuP9O58+GH
	4U02/Ey7D4rFs1U8kTE+kiaeKA542qNqOSFUSxmO6ilizkbaiaMYF94KbtIZ3Gu9d7bukvBlzuD
	eAVUUxVb9SbnDlXRa49K4UsFdKgT2Zo9h8oMWLUJFTi7L4zl2Mg/ueVZmIzsbVjNhHI+29vvkHY
	98iBDH6xNOT2zFGGd50/1RwB2KvXAZCWjaiyy10ooo4P+UJhOUjAmBdPQWQXAxhjYIH2VoNxRnD
	UdA1RZuWdMqRYZlYBCTb4vRttO4IwgOP1rTM0orp0MI4n2uEnDm/kNk3Ice6i3qD/a2+mTv6EUw
	YOr9kqdoR+yFK9df1FImH7lIxPfOugqI5puU=
X-Received: by 2002:a05:690e:806:10b0:664:a1a9:9921 with SMTP id 956f58d0204a3-6699ab8c781mr10240796d50.48.1786101433861;
        Fri, 07 Aug 2026 04:17:13 -0700 (PDT)
X-Received: by 2002:a05:690e:806:10b0:664:a1a9:9921 with SMTP id 956f58d0204a3-6699ab8c781mr10240775d50.48.1786101433466;
        Fri, 07 Aug 2026 04:17:13 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66acad24d53sm1015328d50.6.2026.08.07.04.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 04:17:12 -0700 (PDT)
Date: Fri, 7 Aug 2026 07:17:11 -0400
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	=?iso-8859-1?B?Suly9G1l?= Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] Drop Michael Turquette's clk maintainer entry
Message-ID: <anW-twyN9XccL2pO@redhat.com>
References: <20260729121640.3864006-2-ukleinek@kernel.org>
 <CAEG3pNCwa8ZyQHuDLDiCWXDUrGcuLpT8n6O75yN8tLsgZ5x-Lw@mail.gmail.com>
 <anIL_FKn9O4evOlL@redhat.com>
 <CAEG3pNBTOHz59qN08AKJ1p3yXtB3E=8veq1LN8nyQMx2iGKMHg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEG3pNBTOHz59qN08AKJ1p3yXtB3E=8veq1LN8nyQMx2iGKMHg@mail.gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Thu, Aug 06, 2026 at 09:57:57PM -0700, Michael Turquette wrote:
> On Tue, Aug 4, 2026 at 8:57 AM Brian Masney <bmasney@redhat.com> wrote:
> >
> > On Sun, Aug 02, 2026 at 06:34:06PM -0500, Michael Turquette wrote:
> > > On Wed, Jul 29, 2026 at 7:16 AM Uwe Kleine-König <ukleinek@kernel.org> wrote:
> > > >
> > > > Mike wasn't publically active for the clk subsystem since years. Stop
> > > > pretending that there is a maintainer team caring for clk.
> > >
> > > I was hoping to send this patch myself, and to recommend a couple of
> > > folks for promotion to the clk subsystem. Alas, you beat me to the
> > > first half of my plan.
> > >
> > > >
> > > > Signed-off-by: Uwe Kleine-König <ukleinek@kernel.org>
> > >
> > > Acked-by: Michael Turquette <mturquette@baylibre.com>
> >
> > Thanks Mike for everything you have done over the years with linux-clk.
> >
> > I posted this patch to make me co-maintainer to help out Stephen:
> >
> > https://lore.kernel.org/linux-clk/20260804-clk-masney-maintainer-v1-1-de593189a9a1@redhat.com/T/#u
> >
> > To help make this subsystem more sustainable from a maintenance
> > standpoint, I propose:
> >
> > - To push more vendors to participate in meaningful reviews, and send in pulls.
> >   A recent example of where I did that is with Mediatek:
> >   https://lore.kernel.org/linux-clk/amuWdRD-TBQtFT_4@redhat.com/
> >
> > - Try to find more people to help with the subsystem as a whole so that
> >   this all isn't on just one person.
> 
> I acked that patch. Per your second proposal I also suggest that
> Jerome Brunet join you on the team. This is something that should have
> happened forever ago and it's my fault it did not.

Just to close this thread, adding Jerome sounds good. I added more
details to that patch.

Brian

