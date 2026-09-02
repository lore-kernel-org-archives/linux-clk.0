Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31BB405C5C
	for <linux-clk@vger.kernel.org>; Wed,  2 Sep 2026 22:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788386732; cv=none; b=DuydHgzjCfK4uaJYKFjbi0oigdy6b1B6pyuXV8+4V+uC4eLCoVLjP2+tc4uAV1pwVz83m89GldzkMYJ1EqQLMNrJhUC/DvE7dfNWPZeOib0eUbn3yrnzHPoTdI298wxQVGy9fOWqS+3gjxbhZzwSK4SK35NAHOxuS2X3HhzOcLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788386732; c=relaxed/simple;
	bh=5VUr1g1wC1nEP/ami6aHb3Q2voXt0cHbG0PQMdsphZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJk0iTrryV7rMCaZRdMMSRIKfj2VzeNpAro+6vFdhUrExiGtrkncTCiVe/DIg0Brve42TjdwsA+T8t5b4r0oieltV++8WXyB8IdrDirzlHwEF6VB0lsbJLYUXMDUWovTatrlrCh3ehkl/JkgsmYqnERdOuP2DjL1yAvn57Agq8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AlhxEK1e; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OZEae8o5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AlhxEK1e";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OZEae8o5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788386724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+Di8U2A7Z3tpZBcs42uVo91xChtGCHTKjzJEmp7OKOE=;
	b=AlhxEK1e66pkLl5UGBouCjbH7WCu/C6zLXVnTIlwpsJZZesh52MbJv599tBH9saDKQNPmz
	jblq2Q8Y/KANM/rn5btTfHavWCh4PyLp4CmzvdQ5ykGQOuezZi1qfmxubgjyDM2b2WKJA/
	rLEJ01AdcGxUoAGXVGurI7Hj9ecI7wM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-kNqjGraiNgWHegG2RaYs3w-1; Wed, 02 Sep 2026 18:05:23 -0400
X-MC-Unique: kNqjGraiNgWHegG2RaYs3w-1
X-Mimecast-MFC-AGG-ID: kNqjGraiNgWHegG2RaYs3w_1788386723
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9390a2c895bso440638785a.0
        for <linux-clk@vger.kernel.org>; Wed, 02 Sep 2026 15:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788386723; x=1788991523; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+Di8U2A7Z3tpZBcs42uVo91xChtGCHTKjzJEmp7OKOE=;
        b=OZEae8o57oUHEqQAnfpGiZP/Za5dv5RCqO1xpywu9TEWnWnvuSafy/J4tj1415tyWS
         c7soNpsRihemuxEWoqiFSdSv1cIsj2zNUI8LpZyzkj5pghZ1jHzB4Lh08MsrLxiYUZHR
         +OrJnry1dALgVJMPzbxdBKI7NOB3JUoZahWWGh/Hak0pF9hC0tZ9aOd+BDSnG4S86oOF
         Bkkzlj27yh7ggs/rYc0IGC3rn9uR7vMtW1NczbbcUS4jvBCTscoc16LQ617Jh5rNXRJ5
         IzFLCgi12AWu7DmPfaBBuwm2uJF9ElTu6OQzCahyeNRSMfNENS6IM6guIzRMiNIZ+c9P
         4Ikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788386723; x=1788991523;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Di8U2A7Z3tpZBcs42uVo91xChtGCHTKjzJEmp7OKOE=;
        b=JXMmcrrgkbnIlmcYQ7cXJzXIxX+59eO++xxu2aam9BSgSwgpj8MPtQo8Zjad0rJ92u
         2CG68C/xrFpqYMyCJK/Uu3DjfuQ3dCsteIUlCn8fiq39NuTHVTPs1+86tpDjh1egGIuf
         qFut4VXPs3F7KYAOVf7A5gQ5OQX27fuBr9QGMib0mwQKVXzmAvDTlufVLaoH5YVn0j2V
         KGIa1fsYji2vr1JvfNDWQOsWPZI63eRPk8Lcb7D1qsRZRjA9sYELfyxRrTigm1HFG8NA
         DxNbJFx+kIpHkWVa6MxY9QcDhF5aO/PQdFgdCNv/tF21Efb+1NG/WCdC6Bce/FwfloDy
         dm3Q==
X-Gm-Message-State: AFuF++mD8tbi7iQpbbZxkIH5+1FtpYMlwJs/hWQrBta/ZgfKDNkcMrpA
	S+SnFM1OGYMMmJIeDiCA/dioUDU2i/Hg9NrRcl45JUFvuuOwhlaOlKGUJZg7n4naE3qQooUylc1
	D9exsSFSDb9GUavh9O0NX6FZDnl3Jn0MGSYEjrnp838D3x8Jn1Z8NBlUZhxO/thOMRvZPDQ==
X-Gm-Gg: AYBFou1AvKBsFt6Pu0xnO4WvXoSb+YsHQfVNOLHTmDpYJfBZKx9WtFAlKaTBqkRSo5S
	NkwS8vH9xdwEqxHn93QixV9uMYLwQPgnOQudFAXJKP+H5HKpeRmHeX7pW4kVz+E9WWJXJQ8PxKx
	zwCbx9P4l83X9AlH9LyNWx+OZ+ocb8ZtW9emaob7hHM7P4rQpJWLK24JX9ELvBm13bCKW98aqRJ
	TwFHnBf54KYavjQHWDTmHHcNsvcr2zmKwoj4/YCfbVCBGM7iOfbVOK1uDkrkli7ppiPR6HA7xvx
	tzySC7BGRzEL9qD8ahM3CmxIgjjcki5zw/0d0ef2WnC0UvijkfsOh9MAxDFmavY8SmCL11c=
X-Received: by 2002:a05:620a:29d2:b0:939:6de9:4cf9 with SMTP id af79cd13be357-9396de968e1mr286042785a.44.1788386722586;
        Wed, 02 Sep 2026 15:05:22 -0700 (PDT)
X-Received: by 2002:a05:620a:29d2:b0:939:6de9:4cf9 with SMTP id af79cd13be357-9396de968e1mr286036685a.44.1788386722116;
        Wed, 02 Sep 2026 15:05:22 -0700 (PDT)
Received: from redhat.com ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f1ae7f8sm321649685a.18.2026.09.02.15.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 15:05:20 -0700 (PDT)
Date: Wed, 2 Sep 2026 18:05:19 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	David Lechner <david@lechnology.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv3] clk: davinci: add COMPILE_TEST support
Message-ID: <apidn5onRt_p4FOL@redhat.com>
References: <20260812184001.75093-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812184001.75093-1-rosenp@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Rosen,

On Wed, Aug 12, 2026 at 11:40:01AM -0700, Rosen Penev wrote:
> Add a driver-scoped Kconfig symbol for the DaVinci clock drivers so
> they can be built through COMPILE_TEST without selecting the ARM
> DaVinci platform symbols.
> 
> Keep the existing ARM platform behavior by defaulting the new symbol
> from ARCH_DAVINCI, and use it for the davinci clock Makefile entries.
> ARCH_DAVINCI_DA850 is the only remaining DaVinci platform symbol, so a
> single COMMON_CLK_DAVINCI symbol suffices; the whole directory builds
> together just fine.
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> Reviewed-by: Brian Masney <bmasney@redhat.com>

This doesn't apply against the latest clk tree. Can you post a new
version that applies? I'll be able to pick it up.

Thanks,

Brian

