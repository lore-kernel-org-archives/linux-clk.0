Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4C6143893
	for <linux-clk@vger.kernel.org>; Thu, 16 May 2024 10:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715855255; cv=none; b=c5wwJTLArDELXQzam+GuF3bIVTQtdPAuJCcZSgdLmhXuf07yckSLqvoj85cgo/v4s9/GPksobAaqrlXFU7UtksppmCIuIPFUHYgemGGwcXGy3sJBb6YfpCDBmzDXfdSxFfuxiedra3m/opYGLfvY+ouqesC7lCCamv07i/F9m2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715855255; c=relaxed/simple;
	bh=kBASHLh2eyH3I0mizgz8GzGzaOda0gqP4B/VWaD/CaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L+rIFvopDrMByzW/FJ2AMrqPSnaUuXQHvdVQGrGHRBMYVLim9nlJYT0bgbkd8uCr/vnFv1GGQzs6PaMqZIQ3n21nQT4/cIlkkT9MIUBbAq5kIikrVzmPDMCietS3EIRxsWdNpsNjh7Y4CQ+25MA3HED69JxDKz8u/AQ0V6QV6N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IVnLRMNM; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IVnLRMNM"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-7f919bc2e1cso3866245241.1
        for <linux-clk@vger.kernel.org>; Thu, 16 May 2024 03:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715855253; x=1716460053; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wr/BX8NF3zifG/NDTQUbMR51wrpA+K5HDZ0+1mCSbgg=;
        b=IVnLRMNMadF/4dU0qEl+RlajbVlNal3GHavEfSz1MQ8n4ZNMwk3j79ajhAVG8jDCqd
         Dexo2TcApqG1AhwshoNiQMlpm54ZuT/7N0RxxXD8wZIVDZuhwvQt8buPgvZukeq5nklb
         MvM6JBZqz685Qdb6awErt5lNWsaaGv++kAQ6nfAaurRkpFt3VzEECK8KhBMCVmn1mouX
         GIoCynCCxX95iF54oN8BjOy2JkrVDP5MfFCJp256nsWJxeBreSwPpKJQq1wur+Ij2jV3
         PzrvIMaNfz7wSESFNBMGKfRIVB9QX7PcgyJaTf25+GAKikUIcU+ZL6lGILkOb9cAHHDv
         0BQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715855253; x=1716460053;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wr/BX8NF3zifG/NDTQUbMR51wrpA+K5HDZ0+1mCSbgg=;
        b=NHqECiCDcnX8kvG1eTW+r54sUPSOuC61FebQGWw6B8dfP1zm5BC3tj+pvF+olq+p5U
         X/3pjqRWgKhwafMllt19PUaCVm1U+Ttr8nUuJqfjV1PDQ59BteGsPkmApz28w4Z4/ots
         ZmjRNmry0xRikXZo0oZYjbS010daUEAsgnzoYrsQ/UT+GRfvxcUycjVXqeaI5ABmQHLn
         rzvFYgD+5bcP4JikqWV9Yq1MUEAMIM9s9T27AIGDGqBOzGszUNTBXomkR8r/v/yiZCXd
         iJjzMOgu4yERcT2Ik3T/Nipev1G2ERdQphosrF+02qLa5Yr6O2PuyEVN1uSScuTWfv9h
         F4mQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdaEDhOkeinC0Bgby7Vrg/0qlpRCqObEtRP0LmtUr+tjPXa3Vn2o8S3W0+12/seOpKHRzhwrW8RlHO9/nxwJyDv51oayzT40rj
X-Gm-Message-State: AOJu0YzNGpB8wQWxgB2V3glPv69cotiNOc+zh7TAZPatt/F47GcbaH6h
	QKpOHuDNZtr4+/6yoACuyChjDs+yAJ4OTmLxLMMlrAsQMEJ6uS/cKOixd/bidsEItFPLP11rXpm
	WKoq5UnsCxbhMdavt4GRGeLH4wpxaNYTH65aKHQ==
X-Google-Smtp-Source: AGHT+IGWpVZvSMUt20NSMuau/tfLKHpp/+EepllazSc5v5QmheoZd7J0sjLY5dmSCxrLYl3d79vmIUTSg2jw7h7stwc=
X-Received: by 2002:a05:6102:117b:b0:47c:254:2919 with SMTP id
 ada2fe7eead31-47fb6c62c31mr15440141137.13.1715855252928; Thu, 16 May 2024
 03:27:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYuZd_ur56H8fwDSvUywopvn_b7ogprGkjEatQ7EPTLwYQ@mail.gmail.com>
 <11be44d3-0f32-49c6-b4ae-ba97a9f97763@app.fastmail.com> <820ddc2ec70780ae1ecd3af864dc8bd6.sboyd@kernel.org>
 <ZkUgqzUn1EmjrPdl@shell.armlinux.org.uk>
In-Reply-To: <ZkUgqzUn1EmjrPdl@shell.armlinux.org.uk>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 16 May 2024 12:27:20 +0200
Message-ID: <CA+G9fYurPNaW=u2E+h+segnXhY3cfWo3BJpfYDJxKRFPY4epsQ@mail.gmail.com>
Subject: Re: clkdev: report over-sized strings when creating clkdev entries
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-clk <linux-clk@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	open list <linux-kernel@vger.kernel.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 May 2024 at 22:53, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Tue, May 07, 2024 at 01:26:17PM -0700, Stephen Boyd wrote:
> > Quoting Arnd Bergmann (2024-05-07 00:44:15)
> > > On Tue, May 7, 2024, at 09:20, Naresh Kamboju wrote:
> > > > The WinLink E850-96 board boot failed with Linux next-20240506 but there
> > > > is no kernel crash log on the serial [1].
> > > >
> > > > Anders bisection results pointing to this commit,
> > > > # first bad commit:
> > > >   [4d11c62ca8d77cb1f79054844b598e0f4e92dabe]
> > > >   clkdev: report over-sized strings when creating clkdev entrie
> > > >
> > > > After reverting the above patch the boot test passed [2].
> > > >
> > > > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > > >
> >
> > There are two fixes on the list: [1] and [2]. Perhaps one of those
> > resolves this?
> >
> > [1] https://lore.kernel.org/r/20240507065317.3214186-1-m.szyprowski@samsung.com
>
> This one has (I think) ended up in the patch system last week, but it's
> not clkdev, it's only related. I'm also not Cc'd on its posting, and
> it's not posted to any mailing list that I'm a part of. So I've not
> been following any discussion on it.
>
> Digging in to the discussion, I see various attributations, and a final
> message reporting an unused variable, and a promise to send v2. So,
> I'm guessing that
> http://www.home.armlinux.org.uk/developer/patches/viewpatch.php?id=9397/1

I do not have access to this link ^.

> is now superseded in some way... I wouldn't have known without locating
> this email and checking the links.
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

- Naresh
