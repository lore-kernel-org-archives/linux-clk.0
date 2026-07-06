Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5D43A8753
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 15:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352256; cv=none; b=AVgFvPg9n6jY/YZVZZlK8wqdizRhAYr30VEXrqh6/hCGMC3qr4RwFsW+lnJDyaT4SUlUuknbejmSMka4veWyMndQd269yyxzYkwfIDqHgD8eZ7Yz6UymoFSl032ZD7EeHxSfx/2GqcUGU5+vT5oX/F+HEVjY0aewMEStw/7nh6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352256; c=relaxed/simple;
	bh=4R23QBTPWJ6UJ+Hm7rrPtubC3nhZVFMbWF4OiXPDw5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d7k2Eym4RCAvCSgO1vBW/3Mc+H0SQ3phatbv2aM97NzdDNIB5F0c53w3qFzk6ynhNABQT99Rj/fIucfdRgrsgKPBAgVohaCM00TTiUhhYH30u5KhicVBJx980hr3df+3XKo5WuLdGd2JM6vApfU92Fi6A+1pOBAzGKL0+pis2ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NMJ9GV6c; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ksAGzro9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NMJ9GV6c";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ksAGzro9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783352253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W/pDoKEoQmk2z1wFY/sJFIdvOlkBp5OVP4wtVG7Rdj4=;
	b=NMJ9GV6cX7vFnkh8V5Y7gkgaTzvT1TGe5GHv6a1bwzrbGDXQ2v8QiUAccjZ2lEY4LKx9TC
	Y6LXx5qVd3QICFyUMUiqmXeVM6OYAxgwD9YZNJ536V3TsRGUK1u05sg+Mq2hVWfuiA4RWM
	0hnpxtgAQsRdrKkDf2LUa03SwNMMsXs=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-VxxeiV18OfKdIe4BNmJWcw-1; Mon, 06 Jul 2026 11:37:32 -0400
X-MC-Unique: VxxeiV18OfKdIe4BNmJWcw-1
X-Mimecast-MFC-AGG-ID: VxxeiV18OfKdIe4BNmJWcw_1783352252
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-6651d030185so4632094d50.3
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 08:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783352252; x=1783957052; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=W/pDoKEoQmk2z1wFY/sJFIdvOlkBp5OVP4wtVG7Rdj4=;
        b=ksAGzro98aVO+jF1A09FY5ABL39x4fINkg5fwef23Cfhg7/pOp5lk89b/ObKpa/Sec
         KTFXOOkkzRc6DF6pFButAyoFZ3ZHFsy3EqMHR6VtBl/2vzFXEfrfYYq4lrdTLldCGv5F
         Xy3CgeNchTqMB7S3SBhZNIUYdprP+5UeEqL3UVpCVocFEDLF8mt9n7FE3bDsazxmtliZ
         YcepqpAvQw8WPKo8ldirTW52spHs3+Io/V7jGIQ3S/BgA2NLeTQxKOPWIreJrVcvfIYm
         roL6bY4uwWcBoImCHHENMD/9mKxpUCdhi1r41W0QLEMl7gtf3aINyHRQGR3vb2yryMZ8
         fI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352252; x=1783957052;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W/pDoKEoQmk2z1wFY/sJFIdvOlkBp5OVP4wtVG7Rdj4=;
        b=RTlN9th3OdF7G33NZBPESPH5+I9/Je3sStq6msjLmScRdAFkvyZ3UwHDrG4RP5SG2F
         SYbs1lBnVzcxlZF8xW1bE53UWD6t6FDPxBcslQUn7AT6bu3lYFL5b2zUz3AI7/Hhig9i
         GsgILSOo2s49syl4Hayfg9vC8dqMvIBA8Q4yY68qaC1x8HOf19+7cArRQ2XBCpA0/sGQ
         tGX1N+/QxK4fQpBsTf0hQPs51cbxNpPOn2Q/Ou3ZFeCYx7d6bIrWDxw65EWdcR1t7yq2
         kXDtc7QbL+Mkj3sVIm4FCCKJSqvAr22YKwqeHbwYc+bqneFaKztd12geL8R+QKEE78NM
         0ODQ==
X-Forwarded-Encrypted: i=1; AHgh+RqD/Xws7Sl/vFfkAzLRuDmfmDxcZnUjFadLW4Y4SD2uVSfOsuF2+3EBvS7KMM5UgEw0xEjOCwubg4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWWjzK8DlBCdcilBEo6P01y45obK7kbIsRsj2Pl9ivIJV6WgQH
	QIiNdKd9QlfU7jufbgtoRlk341QEHzWfLnljilyEHWKIvX6ilfzVkmFtknc6lL+xXsXXguwWXJ7
	5AKibJmYlWtyMqtAD1hrdYimDzLSAZ7s9wNoYbBZUcgROkbaq9/wFi+1U6+oI8A==
X-Gm-Gg: AfdE7ckSZoeisrs3To3VLytcU4YqMk5UQY/7klGpZN0mB0Z1rEiPG+KDqMQ1puLgaM+
	V5m1SJ/L8sn/FxO1ndANPqSuznrYpdHhz7/PZ6Dwz9c9NZtnmh6338Tzry3oBQizKlLwHDpP+mE
	f/7exbH9HU4TSy8rSqK8RvfhrjalVeap9a+UGhWm5r8JN+CaN+r2p11u5V65D72z++K7but7qKP
	2tXvw0+WR9Yh+RJdrkhulHkmDu3xBwgDf9YJCbl8De/fThQVqgjhVJroUtC5a379el+lJ/14ZrA
	CGMJnm5aNca9C5f8FcuSETjAroXyFMi43+v+h6cA5v4uUzA4AHDftUK7rB2unvoYOAO+iCnpHbb
	WfAcBDKBXNgYfEbN2uZWv5xult3/GyDPijxkXisNrLhrHKg==
X-Received: by 2002:a05:690e:4850:b0:667:78df:cc0a with SMTP id 956f58d0204a3-6677fbff299mr832911d50.51.1783352251781;
        Mon, 06 Jul 2026 08:37:31 -0700 (PDT)
X-Received: by 2002:a05:690e:4850:b0:667:78df:cc0a with SMTP id 956f58d0204a3-6677fbff299mr832885d50.51.1783352251259;
        Mon, 06 Jul 2026 08:37:31 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66640402ec3sm4964158d50.5.2026.07.06.08.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:37:30 -0700 (PDT)
Date: Mon, 6 Jul 2026 11:37:28 -0400
From: Brian Masney <bmasney@redhat.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] clk: mediatek: remove unneeded 'fast_io' parameter in
 regmap_config
Message-ID: <akvLuLVq5SmaNro2@redhat.com>
References: <20260705163523.1797-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705163523.1797-2-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Sun, Jul 05, 2026 at 06:35:24PM +0200, Wolfram Sang wrote:
> When using MMIO with regmap, fast_io is implied. No need to set it
> again.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

