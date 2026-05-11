Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFEB274641
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 15:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778511615; cv=none; b=tGuwh4M/+8p+Ciaewy0xknvTlFt2Rf+ztIBSeLlH83lNfMORmay9Cgf76zexosgBP3NNkTDl01qj4cEdla8zX2SBh/nrIVVFk5Gxfw8yn3/UGOHTtv8nbxymCjrOSw1QW0bOoo8X9TVABL1MTVa+ZQfM1NoOiVNcmhve2n0YEog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778511615; c=relaxed/simple;
	bh=0fl1FVlc4728Jngyah/QPyBoBZjAKjC9+pOxoqQncpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sMS3oZ8rWWlMbaTYhFLvMXdpF6i0eQ0Am/2XLDgijH0IN+R14Vm+QLXcxjshMOZaWky5GZquTvFe/uDMW555BAGXT0cTZBLcr2RpiJGDi+QHURnK21hxxAY2lDPAICQ8Z/BMpQIpzZOZZcEokqeTFX5yO8WY44CD6avRcfru9UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LNP0+Eof; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LX9VnKLD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LNP0+Eof";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LX9VnKLD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778511613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w/eD3OaTHJb0ey72pgYTA9xJ2tegXQL9CnlHMvp4NrM=;
	b=LNP0+EofJ+XpzNQEtRmeYMb4H5i9twuuI24l5tHuioJSxW1lIzdHaMlThopkcZtzaqEB6m
	Ht5wp0s9hgl+pJ4Qr0GKjkqzG0g2zqtbtm/wKqA93nhb7/9WWQ4k71NLC0E+nS6MNZzwQT
	0zHIwNw5znSle1O0XnXuVeTL4nBg0qA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-noOMOGFCOZuGUq7hVzBdLQ-1; Mon, 11 May 2026 11:00:12 -0400
X-MC-Unique: noOMOGFCOZuGUq7hVzBdLQ-1
X-Mimecast-MFC-AGG-ID: noOMOGFCOZuGUq7hVzBdLQ_1778511612
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8b49424ad88so112747496d6.1
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 08:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778511612; x=1779116412; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/eD3OaTHJb0ey72pgYTA9xJ2tegXQL9CnlHMvp4NrM=;
        b=LX9VnKLDV4lHjjMMv1krKDyhN5D0qgYy1IPyGn9gOLFUC4tr8RXBn/yyAkAYaWsqzI
         wkLWh/+0X1BeQ9kEAYkag+ZkWkY97aMwI0B4hT6jnVbYcvGTs7cc06N0zyYxgoxAY2A/
         47PWCHPkzcOTvJnXZRplnlE0MOPqEIW8pom3xL3otnQoub+bowSMw5sKbXgm21+x6pOP
         a5baFSZWR5aBEkUQi77uvLR2F39CUIV5YOhZrWWX4QX2Iks4JSmdp8XgMufj8u4VDb7J
         CRrPo0aumr5EUJwprlOU3xEYknnbHNlrsOrbG3KkeS2CgNbgCvXtRhk+MieFT5B0oqZb
         7OqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778511612; x=1779116412;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w/eD3OaTHJb0ey72pgYTA9xJ2tegXQL9CnlHMvp4NrM=;
        b=pXMri5EFOQlnhlx4e3YXNM0IeCkpTEsPcd1SEq0MR1IW1dX4RT+PjxUiPNBFuis4Kb
         PLS0T2BDpKJcgG8aBL4R03NSskzJ7kCaLA/BtuRjKWLTKwMPBcBs8Zoitx0V0aorDdw8
         Y+cb2a3pXuokNvW1lXQwTqL1KMkPs6FtwSSji29VzS1OcvYQWwUOakFbROkX0AU2CgBC
         XQV3K4Q+k7n2iV8eAvZQyezqa4VuWylWcUTsOj+xlgOv1wDG/dcBiBqMGdm2jjITMAY9
         HLP/6Fz3qJrfLFWi/AHWER7V1xIELEe9Knng8H9mrQXMfuA6QjyjbkkDKdxVakpoZV4u
         8/9g==
X-Gm-Message-State: AOJu0YxwmFWngnwa8X9qQtr2NFU64FchkMWw5usWrTvFZfPtUwqm2thg
	EPOvmLXD2ZTdYK4GYLiTeOYpDmwqUlMzOvdkKJMlGXtib7IqIi2cUXeeCnCMBJBsLdZpOJ+KLLa
	vxAaWgXyzg9CBOFk1g7qNGyT+MNvQAaLZAbfWBUsz4lg9h0kD7TPYUdtncO4cTw==
X-Gm-Gg: Acq92OFICMntKJEUtuO4yFcutpiAqKZoN0inFA0iuTycSuHww7UUL9nxRWaS3mC32Vr
	Uz6CVai8F1DkyATIZNgHV6VPFTMh/MuGbxH0FKhvhgHpzRGnmKYl2MJSRxiy/yl0HOX/0SoCJ7V
	V1MThfo2ugjIYLaaOKGq1fc+8SytTRuELwES3XjnD8wQTFURC7qXyJmMHm19ndz2HasY1mZ7cO+
	Y1vBWALqAG53Fr4ayOgJyHbxH9AJXpwOyjNdh200XzGuhIXXQH0J41If/8GATJcA6MxUbn639wa
	aB4aG6/9u5kQEUph0WH1BXh8Lo32ZTwJvbUYif/anfJHIamHN6NTjH/yvHhV5BPgv1p/eoRoFVx
	T5pEshPcJXPzDgnQ1s7eAwuGRSGxHZe3n8xRowCZL/yvRKcC2xbZyezX/
X-Received: by 2002:ad4:5c64:0:b0:8bb:2e70:7a2a with SMTP id 6a1803df08f44-8bc441e5420mr357792586d6.31.1778511606273;
        Mon, 11 May 2026 08:00:06 -0700 (PDT)
X-Received: by 2002:ad4:5c64:0:b0:8bb:2e70:7a2a with SMTP id 6a1803df08f44-8bc441e5420mr357785966d6.31.1778511600814;
        Mon, 11 May 2026 08:00:00 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf3a438e3csm96354776d6.19.2026.05.11.07.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 08:00:00 -0700 (PDT)
Date: Mon, 11 May 2026 10:59:59 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH] clk: hisilicon: allow COMPILE_TEST builds
Message-ID: <agHu78VflprAM7Yj@redhat.com>
References: <20260509051110.1061393-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509051110.1061393-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Fri, May 08, 2026 at 10:11:10PM -0700, Rosen Penev wrote:
> The HiSilicon clock symbols already depend on ARCH_HISI or COMPILE_TEST,
> but the parent clock Makefile only descends into the hisilicon directory
> when ARCH_HISI is enabled.
> 
> Add a hidden family gate selected by the HiSilicon clock and reset symbols,
> default it for ARCH_HISI, and use it for the parent Makefile descent.  This
> keeps existing platform builds unchanged while allowing compile-test
> coverage.
> 
> Tested with:
> make LLVM=1 ARCH=loongarch drivers/clk/hisilicon/
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

