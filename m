Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3F33B1EFC
	for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 20:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784578102; cv=none; b=Sc0W1JVsRZnZfwppPwbJ0eipsj9EobIA7arLkhuSoJOP++l3nceJOmlawfYCBjVinqOt9Fc3Pk65llf/QraclfE50+Z7aWX3IIN5Iup3qHhgsLjzHuNkfQaM130Ap214HZzBh6tgd1XEC2O5loJQ23aXuQkkoaEHe/PdheGq+iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784578102; c=relaxed/simple;
	bh=EYsXbupgT8p/3lXTHZn/wM30/+DPYmtje10OBPyG05M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZlhhB+T43wX2rbg6vTtsyFsfnLYBM9FGCMGzQUOZbmC5LF1DqVkWh5nj1THhjrp4uABY14xdH8Gb8wDMBqVK1Up0/etpI7udNiJDS9ZcXrRqGqNaWddFrefFmErRtG2fubUQEfXM1FebIpvVMKCmkeEJ/J3BW+B09I5Yn0wTo4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MCwmIF6T; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=F9joQ5GI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MCwmIF6T";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="F9joQ5GI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784578099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tJmWcK7VtygAI73hXpZCkgCwblOmQljwdFQvepVqOmU=;
	b=MCwmIF6TRwos4cIB4wR68p1HPBfNURBWj/n7qd2FiM7vggNxZcrEZbXpRwHXU7UHc8Pdpp
	PvQw6UVEpazVKIiF+tXzdSIM7jSL/uoAoeUoXtv0aL453cS0Sow0fap5/XisMxP/KOe9jE
	cZ1TTtWTaEttxRwsjFLiz1U7awfo+AA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-zT25YatHM0SK9pkuFaWgbQ-1; Mon, 20 Jul 2026 16:08:18 -0400
X-MC-Unique: zT25YatHM0SK9pkuFaWgbQ-1
X-Mimecast-MFC-AGG-ID: zT25YatHM0SK9pkuFaWgbQ_1784578097
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930b6bdcb4fso186287585a.2
        for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 13:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784578097; x=1785182897; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tJmWcK7VtygAI73hXpZCkgCwblOmQljwdFQvepVqOmU=;
        b=F9joQ5GIWNC5Za28k3r1eervtdVDzuq4/mT1MOPAV6jYsdIZmAQ83Ej8KY7UQoPBZy
         aDdxaoESnfR25x9OwwunhZZKnWwX49WFQ0pajP3qagVS8Ks2XbYBPDhYGQDjOyEl4XTB
         CQWgNtUdSf6ig4QBNRDMs1SiJK6yEE8eaX7n9BjqvG8aIsBB1vZ6fN+xtIAaXOu0qdg/
         dpB3dVLvcvojTTpSOOQ6RQbeoMyUoexMrH022PFb3uVIR48uzovJr0ffllcurV4nKzjh
         L/okXQIrrireT+mCzgeY6ep1O+aG9bwWHu0e0MqgGkeuDFfPZ+FIIdBIecGeC2rassbQ
         xtpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784578097; x=1785182897;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tJmWcK7VtygAI73hXpZCkgCwblOmQljwdFQvepVqOmU=;
        b=Wa1D51xrF0rY64Z3AARmW80R9KX80vfrBxfHta3xFav03DOTlQXmZYMeCI1vjP9i79
         z2/Fg9aNLQvHRL1Ga2x8MYHsIgG57+hd29Fm00nf41cCMPijKvtnvfKDlHaJehrl5cvm
         hN8voT3/L2qhzrXfMRsn2T3ZYa+qHk3q9SOrMwxQBTfqjMUlra9Z6+LolehFsmFcNl39
         oe8QmliBIoP+t7vcc3VgHVLWZ5K2oBU+SJ87HBlE4VQZAadz1ph0CgeyHpUQdWUKCACD
         gKInriX3JNnAdpTb9xILS+CiQqXEBuiLpCAtVhT6lElenuVjEHGMIMOrQe+tAGWiJpCT
         3TTQ==
X-Gm-Message-State: AOJu0YwInfidaQ0ENN5ogrew3D2+L2ZCmUBkjhab4p/cb6cOQJgAfRFS
	F8pQeK2apo02zUEgUYT9iCGW5IfbQXQp0ySYG0vitd8BHN9x+WVAvHFf17Qr2/eAN9J57u+293n
	ROWxObzx2fl0ki49r9IAGFXhjfW7ypQ3aQ0seQTpo0PcTA0ZiAV7oJ+GYHfH8aQ==
X-Gm-Gg: AfdE7cloYDapTazq+xNQn46W0dkEiYn5vJ3ZdGk+IkGDKHn5W5e4Al9n1ynkRCpezRw
	OHs2eBojsALQipgBNzQTtYuqVDzlwImXpYoemRNfHGBPM0D6ndfCjj6DxU6J2cKw0R2JMyoD1uy
	CwN9b7oE6vWeSwzxyWqbkD4lRmFMAzaATv64EN0txaeaQiCYbAAVnCo+i4TpG8YEZvU06eUSy3S
	8ZK3MLiWIK2YZelTHa1tfyEPsaBXhOTG/KJsPzJmskW/V8jztpPfWfG7FW3Lc95GbaXpO09bOXm
	mQE8s1vemImC5kKLVyKUxu/pzmK3le4FjRlcDzoApzTKTsGNQDHCQTnps5LsmWT/fSeJIuZeqYj
	cROeacQ26s/8YZPiGbQ88DLb2VjKYimznSy4=
X-Received: by 2002:a05:620a:2985:b0:915:94f7:55df with SMTP id af79cd13be357-930b3ed9e37mr1488514985a.20.1784578097381;
        Mon, 20 Jul 2026 13:08:17 -0700 (PDT)
X-Received: by 2002:a05:620a:2985:b0:915:94f7:55df with SMTP id af79cd13be357-930b3ed9e37mr1488512285a.20.1784578096959;
        Mon, 20 Jul 2026 13:08:16 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b52e02desm954762485a.10.2026.07.20.13.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 13:08:15 -0700 (PDT)
Date: Mon, 20 Jul 2026 16:08:12 -0400
From: Brian Masney <bmasney@redhat.com>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Cc: linux-clk@vger.kernel.org, Rosen Penev <rosenp@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Marvell PXA1908 SOC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH] clk: mmp: allow COMPILE_TEST builds
Message-ID: <al6ALM2eIWots1Zr@redhat.com>
References: <20260719214349.734351-1-rosenp@gmail.com>
 <YBsaITDCQyaUWFnnWTe4Fw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YBsaITDCQyaUWFnnWTe4Fw@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Duje,

On Mon, Jul 20, 2026 at 04:46:40PM +0200, Duje Mihanović wrote:
> On Sunday, 19 July 2026 23:43:49 Central European Summer Time Rosen Penev 
> wrote:
> 
> [...]
> 
> > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > index 4b2c089f46a1..8383f9f1da51 100644
> > --- a/drivers/clk/Makefile
> > +++ b/drivers/clk/Makefile
> > @@ -130,7 +130,7 @@ obj-y					+= 
> mediatek/
> >  obj-$(CONFIG_ARCH_MESON)		+= meson/
> >  obj-y					+= microchip/
> >  ifeq ($(CONFIG_COMMON_CLK), y)
> > -obj-$(CONFIG_ARCH_MMP)			+= mmp/
> > +obj-$(CONFIG_COMMON_CLK_MMP)		+= mmp/
> 
> Could it be possible to select mmp unconditionally, like most of the other 
> subtrees are? AFAICT, that would also require creating new Kconfig symbols for 
> the PXA168, PXA910 and PXA1928 clocks, but I suspect it may be the more proper 
> choice in the long term.

Just by sheer numbers, the CONFIG_COMMON_CLK_XXX approach is the most
common use case right now.

    x1:~/src/linux/linux-next ((next-20260720) %)$ grep "CONFIG_COMMON_CLK" drivers/clk/Makefile | grep "+=" | wc -l
    68
    x1:~/src/linux/linux-next ((next-20260720) %)$ grep "obj-y" drivers/clk/Makefile | wc -l
    25

I have no strong opinions about this either way other than to drive
consistency across various drivers as much as possible.

Currently the mmp directory currently only has COMMON_CLK_PXA1908
defined. When the other PXA* drivers are introduced, will there be a
CONFIG_COMMON_CLK_MMA_COMMON that all of the drivers will use?

If so, we could put that MMA_COMMON in the toplevel clk Makefile.

If not, then yes I agree that obj-y will be fine.

Brian

