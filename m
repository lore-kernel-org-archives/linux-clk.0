Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0461514F3
	for <linux-clk@vger.kernel.org>; Thu, 11 Jul 2024 08:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720686008; cv=none; b=SzGYTHQDsCgmUsr2Z03WmbeedSS4/eNKSnFQEg3zgH3CEUzwvxqPSdo9WAVl0+l4ArZi2VRZd2yvF6FRJhjohi5q3gWCNqYztgKf5MrYw+o9DuYtsZlZyWv15qKhyWVsrU0UqRtXB1XGL97sZ2PwV+OTseGdq/hKv4Li9MKJ3f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720686008; c=relaxed/simple;
	bh=zUXuuTdZC1gW6ONubxV+eGQkbjsKypgRFVdFLS0VZRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aiAgpd/39aMQZ6/66CiHDPBoU4gvaciMPo2a4MEskt2y4kRgL8HZDYUzxgu6E6huNW7mvgnZ0XGRgTbXqMepMUhpzs+bY5kXwhnpWQer9FXVz0pfDbZm/yaWwT2BX2i0dAub4UZYZcfshW1mQMOh845Avoc//HDqcZoH2/52MpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gFCuKmKb; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gFCuKmKb"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6510c0c8e29so6204177b3.0
        for <linux-clk@vger.kernel.org>; Thu, 11 Jul 2024 01:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720686005; x=1721290805; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yCOXCel+OkgFY3x3XxhTpu9K68s0AxsfBCkZfuzSswU=;
        b=gFCuKmKbJ0Y+tzsp6D7knrd7jxrUSwmh9Fc7aqc5S+Y/IjI0wfny0Hai5Ns3teRqaT
         kOvCLHiAQL0/oIt51/ODE0Zz4R0FDuK7rxRLK5rHNayE+azKhM6XUk0FGWNp+P0G0MjV
         MvcAE+T1i12ND5CqG1urUanIoJvAG38k+s0plmgmqKN8Swct9NM3TLLYTh63qu8XsqEG
         78OglYp5SLEB3IpY4pwVaBVbxrBXC2TJ85RSN5q40twCQYKCGp1UhALHZyimQPJPima4
         m8/w5Z/4ISud+/GO9e5FEBgQCJoWmkOHznb2LmTDMm9Ssenkz7GigJ+ch8T5MufLGSQK
         CS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720686005; x=1721290805;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yCOXCel+OkgFY3x3XxhTpu9K68s0AxsfBCkZfuzSswU=;
        b=Vp2IM9Oqkd35xz8TDOkASO3xyYColUlSlHOfPaSrca7UHR+KlOpBn6qenBJiDUfHlH
         r9a4KDYs0dy+MTn2Xe3c3aO/jR2AHVFgRdl+4LP3/BOz9IY1hpxohWWjx7x9iKS7iVeI
         Yg7/tJLcXfrdVQziSRA5vbNFz/HvFjFvdpL/cYt1woKmCSpcGLv3I1n66Qe2JITedJ17
         2WoP0738ncMOmPBsH7l+VsUU5f9ehlvOPVst87MxyqEvZV5VRKgMuGT9wfnmV3ZdNht5
         BuUxLBET459mYl2zc+CwORi/DWfJzDHJ0oaPGYHrlzW2qpFDBPeZZTwZa+Qocaor1LS1
         /ClA==
X-Forwarded-Encrypted: i=1; AJvYcCWeLNZjjBeE9eYCRL98WRgZNizvEDo6ck4S0nkqHZCwFoUv9OktxE375SYW7/TMAS9QrC7jvPnRq9ELczkDQKP9F4/sH0PECmjo
X-Gm-Message-State: AOJu0YwvkpCCLLUHTlMHh5YSPdd7YvYAKk5fPFgts+rLAwC6nU2PcaTg
	XpsIq4Xip8kKa/FRc5jwJz07U7syb+mkyOBq79JYurR+IJUj1lGyABHUKDfjvBD9XBTxAJl4w4G
	LJC4tGdpe7nNYFSZ+QafCDtZcGvi86OsGigdtPg==
X-Google-Smtp-Source: AGHT+IHES1E6Jos117gUDZhq9HN4sMFmUNFMxL9n1Xf9pBOpCOipbf6kJgCp8kRnNRqsB2zfpRqhPvb9GEPeIaC9oZk=
X-Received: by 2002:a81:b50f:0:b0:632:58ba:cbae with SMTP id
 00721157ae682-658f0fb34d3mr73868857b3.52.1720686005368; Thu, 11 Jul 2024
 01:20:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628-gpucc-no-request-v1-0-b680c2f90817@linaro.org>
 <20240628-gpucc-no-request-v1-1-b680c2f90817@linaro.org> <5153b8f8a6c6ffdc1254e00c47a888ed.sboyd@kernel.org>
 <CAA8EJpqOD-JKGCJiC7yAkiG3oAOEbHQ-_aCmDiP5HdeEVZm8fw@mail.gmail.com> <9cb3f57ed4b41fb51600610a3a1c9437.sboyd@kernel.org>
In-Reply-To: <9cb3f57ed4b41fb51600610a3a1c9437.sboyd@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 11 Jul 2024 11:19:54 +0300
Message-ID: <CAA8EJpq+Mgbrh_M+WN7VT90hC=5TPAC1dkgC5PzSeO22WOyGUw@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: qocm: add qcom_cc_map_norequest
To: Stephen Boyd <sboyd@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Jul 2024 at 03:04, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dmitry Baryshkov (2024-07-10 16:32:18)
> > On Tue, 9 Jul 2024 at 01:30, Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Quoting Dmitry Baryshkov (2024-06-27 22:20:22)
> > > > The GPU clock controllers use memory region that is a part of the GMU's
> > > > memory region. Add qcom_cc_map_norequest() to be used by GPUCC, so that
> > > > GPU driver can use devm_ioremap_resource for GMU resources.
> > >
> > > Why does GMU map the gpu clk controller? Does it use those registers? We
> > > don't want to allow two different drivers to map the same region because
> > > then they don't coordinate and write over things.
> >
> > It's not that GMU maps gpu CC separately. It looks more like gpucc is
> > a part of the GMU address space. I think GMU manages some of the
> > clocks or GDSCs directly.
> >
>
> I imagine GMU is a collection of stuff, so the register range is large
> because it's basically a subsystem unto itself. Can the range in DT be
> split up, or changed so that different devices within GMU are split out?

No, we have to remain compatible with existing DT. It's not a problem
of a single new platform, the issue has always been present there.

> Or maybe the gpu clk controller can be made into a child of some GMU
> node, where the GMU node has a driver that populates devices that match
> drivers in different subsystems.

Well... Technically yes, but this brings another pack of issues. There
is no separate GMU driver, so we will likely have a chicken-and-egg
problem, as probing of the GPU driver will also create the gpucc
device which is further used by the GPU.

-- 
With best wishes
Dmitry
