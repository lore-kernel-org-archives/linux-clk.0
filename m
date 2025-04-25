Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559331BD9E3
	for <linux-clk@vger.kernel.org>; Fri, 25 Apr 2025 19:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745608611; cv=none; b=Ej3pjRXm0jrYkf5Csqnyg0aqcnFADjU2OmILoVQVGe5R57YSB8eTm7qrum5vwsgM0ZAxiVHE9lAs6/4ZGI+JXal73if0FJgnQCsL/Rsogdyw+Ir+JRdeafysd53DAGEEZe2he6Wmn16Z2eHtAD+TZUaxuxh86b+5wKojxoV5PX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745608611; c=relaxed/simple;
	bh=aaF5KoonwPXnBEeEYX5de2+bpxSx1NBVU3iFsDtiboQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uwJjoLHVwM8escYKPb0cwvf6kKeQ5bmmKZmfkMic18ZrqkHucNefTYTaiOB9g6zp+CeOuc6ojfpSwsfxbSr+ruqGnNxu6cLBQE7dKT+Wf57sdaoC2XHDdo2sDleZU3yipU6bOCHw3Z4Tn+BS11k7RtgcSQa0RjpoydWlHJOqQDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=AX6+kZK6; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="AX6+kZK6"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22928d629faso29985355ad.3
        for <linux-clk@vger.kernel.org>; Fri, 25 Apr 2025 12:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1745608609; x=1746213409; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XNI+wkZfospHmLOr+2+jXX5pJdTmqRckjghLYfMtBgk=;
        b=AX6+kZK6ovgYV1OXg4LN+fg8H6PBJfhIUQTz8JijOzGPflZA1GuWotgMtDF+ppDsPt
         hrOrCgpu+YWTVnnXYJYXnnNmxciITMZGPTnJ/XK69nSJh2VyAwMCMqliDrmdszKnkaLr
         QHGcYS0EkDoWsvobRcvCSwmIKh1L0RuLTOph3rOOvmUZaT4KFWbZEidBcdA20HH+TLES
         krPH0yzYlT2TPvQqQgNSI4bJS417IH7jp5A0AZZv/vfx9nb5TX9mo3lteFbLr9UsAG35
         RmqEnWcZT2IgWiZsIDhB07k0RYQALhdTY0jtw8UYOK0zRKIKcfhSeRKVxecLcWRCg/8x
         jO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745608609; x=1746213409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNI+wkZfospHmLOr+2+jXX5pJdTmqRckjghLYfMtBgk=;
        b=mYeEvQiYfINnnH5IxSRZovJIigBKvMhChV2rXaViLwgOfefOhslebAHfzaG2fl+Qb2
         Zaotj0ZcvOpshV5W+cAw5ESGLTJBlGPHUwR8E1QPY6MLJTmdhiHX7KefJkbhNf8Y1cGX
         CWSh331STh3kRiedB0NvGIHmxQXPkYmHS5tS56JoYoXZHf7pjj14c8Z3kCT4fW9C0tx1
         kUvX87ODFP8DFIaxe8ZMkgPKad/Fd8AoqpJTewoXhIQse1VS17GG9D/yJTlo0Co5oaNT
         HGwhvE6nxozvne8Fv+UPus3aNMgbNnEKJUUUfD0cmz2RPALV6bEcQE0zrvpRxMWGDEV3
         yifg==
X-Forwarded-Encrypted: i=1; AJvYcCUM2sfVR/4Nx0Q2w2Uyn7ofFULHszbZcpSFoBUvU1q2/Bvrq9I5h7ScP7Q6Q8ESPA6/YR5v0HdpiR8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI/6cn6EoLM42D4vZKsZpHzv0dqmcYwd3z4RbUmSD9LpjCGOwl
	dbQDXUNjZwmGD+pqcBhtL6TYWfrj4SN8RaksbgabZzAoVPjLCX5qaiyfwEhKSck=
X-Gm-Gg: ASbGncsjJ1ENNc6v1lgsFXejamQJY4aZYgGI3pLacQROe9+tFKQiKy9E7XMbk48qqjR
	Ef8jQnAE+mp619vwkFkTr61DGl7nYiXj+cKdHirCVTUPgrHMmCa+L/Il/M8HdBKOv4M86LRxG3w
	NmTZDmG6DLsttIyQX1lbvJqYXLNfQ8C4TZgd3dR8Vw+a4Azpl12EcZ2W0MhsMVwL16XidIz5RK4
	FP7k0NsSs4JcAS7PfUdUlG0rJ+tmxk5Z+xia8mivX4MDfsFYwB3TPzZNHB2cIOyxyDTA0e9IQqf
	s5KGFHIU75B49NLV0LqjOaYGJwSu6nXPCl7PjPsXcsjS7Pk=
X-Google-Smtp-Source: AGHT+IFhMLeZWxbEN2BcydszBZXCVk7gJnHRAGc8GbZQro6UfqEPZMk7uHs43lBLaNwzfikdBQk+ag==
X-Received: by 2002:a17:903:1cf:b0:224:721:ed9 with SMTP id d9443c01a7336-22dbf73e8bfmr61560135ad.44.1745608609541;
        Fri, 25 Apr 2025 12:16:49 -0700 (PDT)
Received: from x1 (97-120-122-6.ptld.qwest.net. [97.120.122.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db510304csm36179535ad.204.2025.04.25.12.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:16:49 -0700 (PDT)
Date: Fri, 25 Apr 2025 12:16:47 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, guoren@kernel.org,
	wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com,
	matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, ulf.hansson@linaro.org, jszhang@kernel.org,
	p.zabel@pengutronix.de, m.szyprowski@samsung.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 20/21] riscv: dts: thead: Introduce reset controller
 node
Message-ID: <aAvfn2mq0Ksi8DF2@x1>
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <CGME20250219140316eucas1p29a76023868946f090f261bf78d5103e3@eucas1p2.samsung.com>
 <20250219140239.1378758-21-m.wilczynski@samsung.com>
 <aAP1BW3RmMb/Irya@x1>
 <81e53e3a-5873-44c7-9070-5596021daa42@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81e53e3a-5873-44c7-9070-5596021daa42@samsung.com>

On Tue, Apr 22, 2025 at 09:47:34AM +0200, Michal Wilczynski wrote:
> 
> 
> On 4/19/25 21:09, Drew Fustini wrote:
> > On Wed, Feb 19, 2025 at 03:02:38PM +0100, Michal Wilczynski wrote:
> >> T-HEAD TH1520 SoC requires to put the GPU out of the reset state as part
> >> of the power-up sequence.
> >>
> >> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> >> ---
> >>  arch/riscv/boot/dts/thead/th1520.dtsi | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> >> index 474f31576a1b..6b34aab4b455 100644
> >> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> >> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> >> @@ -7,6 +7,7 @@
> >>  #include <dt-bindings/interrupt-controller/irq.h>
> >>  #include <dt-bindings/clock/thead,th1520-clk-ap.h>
> >>  #include <dt-bindings/power/thead,th1520-power.h>
> >> +#include <dt-bindings/reset/thead,th1520-reset.h>
> > 
> > Are you okay if I omit this hunk? My thead-dt-for-next branch is based
> > on 6.15-rc1 but thead,th1520-reset.h only exists in next until the merge
> > window.
> 
> Yeah, I'm not exactly sure how to coordinate such stuff, obviosuly it
> would be best if this chunk would make it to the 6.16, but if you think
> it would be problematic then omit it, no problem.
> 
> I will then update this patch series v3 [1] to gracefully handle lack of
> reset, as the 6.16 will not contain the required reset line for sure.
> 
> [1] - https://lore.kernel.org/all/20250414-apr_14_for_sending-v2-2-70c5af2af96c@samsung.com/

I've applied this patch to my thead-dt-for-next tree:
https://github.com/pdp7/linux/commit/1b136de08b5feca37ebdb6d28db3c9c6285aba5a

We should be able to test with the driver in next once a new next is
published (which I assume will be on Monday in Austrlia).

Thanks,
Drew
