Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B242431E78
	for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 14:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784559216; cv=none; b=pcrvfPQrNM38NboUUmqkvSto0vV1+lEHiIz2/bN+v1FnxV+3Lcxn3J4UKgNdR4Z4qhTKJdZquPHAi2vIEtB86kQwgTztQWn+CT1Gxq8T5cHL+TLL0VniEJgDjS40W8JBT1SYlX+B7M+NCtRv4F4lwcp+a7DexKxPgTIJd8By11I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784559216; c=relaxed/simple;
	bh=iLYRWaNk/L+zEf51Fw1AJnt56OpG7F/Gckhy92hAdCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hGrzlGoVp94SC7CDVSPgSzrW7vmdR48Yny3yIHY1zWhcT0jGNu0aClcHtZ+j60TYs1av5GelpvBvYPzC83wmgBmYFwHrL46lhF+tY3o0FkAWrR6+7R1mF1MN9+YVlHjgOOhgG2MBUgCC7LAU1bbCY7kqULFJAtFTFTJW6J/XiVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XWtefR57; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=VYxR+5Yy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XWtefR57";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="VYxR+5Yy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784559214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=evDvOiGDhmVXHHfwqNhuM4pd8+K7f8icKN4u95tqZg0=;
	b=XWtefR57NgDx+9iJeTKsMasu1p45HLjAAjzhslTiaDZfiC0BOJ8Z46we+hiDeggBIDejLf
	c37podfNExyQsyTvndgqzwdknpS3QSXua3/PXpA6eVdCyhSUpQsksBFPoo4VMCS3bH4XuO
	e+OQkjHvINIlLqPdFQI+Y6WV+REYYlA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-203-l5V8QD68Po6isX6qm2ji4A-1; Mon, 20 Jul 2026 10:53:32 -0400
X-MC-Unique: l5V8QD68Po6isX6qm2ji4A-1
X-Mimecast-MFC-AGG-ID: l5V8QD68Po6isX6qm2ji4A_1784559212
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f39a46efd9so72485286d6.1
        for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 07:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784559212; x=1785164012; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=evDvOiGDhmVXHHfwqNhuM4pd8+K7f8icKN4u95tqZg0=;
        b=VYxR+5Yy6Jctdy5MZZWt6Ekw45SqRGEMaQt8zJTcDLVu+44jVE2g7TqfWtbV1gj307
         pcrkOnaF+FqckqS/weqeEIHXxzRGkNcKax/PDmpruLGZH6m2ptb+diSwnchQN0+pH4GL
         uoFt/P+71kGtOYeuRTfZJ1BuYv7fI9iv5yv4781rHcUqBlZFEuccoQ7XGdgyfbb+oU9G
         PTtcjTsLoJiuz62kj8ITpd73KSvvktB/UetbBM2eHT9PebAHNTvdaCVajcCv1JWgl/I9
         AMkYinYDwcRJ0y5ywx1jvAPXhuVw7GZrx6Xz26AcAQUV6i2AENwF/tZcrRZLvDY4u4Jx
         ulDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784559212; x=1785164012;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=evDvOiGDhmVXHHfwqNhuM4pd8+K7f8icKN4u95tqZg0=;
        b=aC4ly+lxwg740CoYN2qwVDn7+aTcf1CjRQPx1KtqfS/MDSazr7k1x/+0jaufrAkLKP
         VkZpzqNnjMENek+hKKTAH01PEW44b6NwOpc9+2eujZIpMhvdOCvjek3h6sr/I7CtYaeC
         /QtQrWjwtLo2ZV/45JJJmXzQUEOW/dpNGlqbjEH75t/erDqalHMS6+P2xTGop5WppMAl
         tQumqxIQ1StzJiOIMpe/XgPBM2knxD12+hqmIYbeKgtJUrN2ybHwN14yWAgMbU4S/+hE
         iQ1TjrOkNJrYKM8j7ItnayYvTCZIaYnTukRqVxv51enVmT10hJX6HlINyDU1bfs3hME3
         hiFA==
X-Gm-Message-State: AOJu0Yw7za2by5InMMfCpmTq/cIYjNFgy3EGz3DwDAqin+UZ6wqWSA4j
	mXf7taXwb1e8KX6A/Fs8jooQxjuvw6FPnk/TeRIZvjPVmHzpboBgpCrJF5XpUi5VTOzMHd/dm1W
	M2Zt+acBGJpq8nzCckUNpKkk5PQ2cYbWK7kXCQbXl0HkR7zWatArXAfofx3yf2w==
X-Gm-Gg: AR+sD10OxY8ajNMEJNgZMtDXwvLMtS/JsPW0Cd0+pqCZY0boW+N2uXn3rBX1VLFz50H
	3i7Rebk+T2N9t/GEQNP/ytAEMes/rZAC3YL5IpQpqnumSkgKU054n1Io4W0cD+1uuEdz0v0Lur8
	7qYwdyZT4KW2jlnnNhxogJp8vRJGf2cNDzzUxc6MJ13aW0qVMSy1wBUP0eTLXf8KBV5xVmX/ofK
	iM/pTYVEqpikLgHqys/geYru7HtlSfUG9KeV6J0nK6Ho0CEuxqvASk+sLJk2NWpACF7pYsLTHr6
	YM3OvYqSJ4KUTMEgeyvdAf1dLBIMsv9xU0vbs59DZvNdk4RuP0gAdTBfmjh5RypiqAF1rRnw0T+
	eZ1Zhf+4ra+GCDILvHCcwBLZsr4cp8hSkTYk=
X-Received: by 2002:a05:6214:411d:b0:8fd:b96d:195b with SMTP id 6a1803df08f44-90768e13aefmr201311096d6.15.1784559211648;
        Mon, 20 Jul 2026 07:53:31 -0700 (PDT)
X-Received: by 2002:a05:6214:411d:b0:8fd:b96d:195b with SMTP id 6a1803df08f44-90768e13aefmr201310706d6.15.1784559211220;
        Mon, 20 Jul 2026 07:53:31 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907786ed2e2sm91787956d6.33.2026.07.20.07.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:53:30 -0700 (PDT)
Date: Mon, 20 Jul 2026 10:53:28 -0400
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
Message-ID: <al42aFXfvbPUIJAV@redhat.com>
References: <20260509051110.1061393-1-rosenp@gmail.com>
 <agHu78VflprAM7Yj@redhat.com>
 <CAKxU2N9Wf07ZNvVyOz=WR+8TdzxoivnAp5x3_FN5rqpU6M7maw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKxU2N9Wf07ZNvVyOz=WR+8TdzxoivnAp5x3_FN5rqpU6M7maw@mail.gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Rosen,

On Sun, Jul 19, 2026 at 02:44:03PM -0700, Rosen Penev wrote:
> On Mon, May 11, 2026 at 8:00 AM Brian Masney <bmasney@redhat.com> wrote:
> >
> > On Fri, May 08, 2026 at 10:11:10PM -0700, Rosen Penev wrote:
> > > The HiSilicon clock symbols already depend on ARCH_HISI or COMPILE_TEST,
> > > but the parent clock Makefile only descends into the hisilicon directory
> > > when ARCH_HISI is enabled.
> > >
> > > Add a hidden family gate selected by the HiSilicon clock and reset symbols,
> > > default it for ARCH_HISI, and use it for the parent Makefile descent.  This
> > > keeps existing platform builds unchanged while allowing compile-test
> > > coverage.
> > >
> > > Tested with:
> > > make LLVM=1 ARCH=loongarch drivers/clk/hisilicon/
> > >
> > > Assisted-by: Codex:GPT-5.5
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> >
> > Reviewed-by: Brian Masney <bmasney@redhat.com>
> Should I resend?

Yes, it missed the last merge window, and I submitted it to Stephen on
June 29th via this git pull:

https://lore.kernel.org/linux-clk/akLzCVzbMbUsgDda@redhat.com/T/#u

Let's see what he says. Hopefully you won't have to resend.

Brian

