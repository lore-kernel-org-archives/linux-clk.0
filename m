Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A5C3ED3C8
	for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 14:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779199582; cv=none; b=O6UU4D8QYR5EsrZ/QLHMsjrm6ebzfFSaYvoxIN3Ti0uNL6MoeXC7jBWNFchELfA4j9UETcMTVEwT9quuTi7RrjIEV0gbWJ4jW05vpZte+V5GrfQUdXlq45ZYoJmtYCAdfCnYd+8fhOze/0fKM/KAkpr81/IIpM0o7CbLWIcOZVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779199582; c=relaxed/simple;
	bh=yXR/8vsDWfBlIw16XhJL16Hga3EGXjRfXGeaN88k5Co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c0uuVmStdaa/VyAAyqlWUD0b8DNME3fkwO2JRaKQfkV3Ssd1Yqzd/kn0giRUn4ta+iRmL6nVNLASTQHeXuwhb/qXI9iDuUD2m+0+0UyS6geLqfm5xKxQ9tOCuh2vys4WMaHYcKdUZ8LjXUMFCzqJkgCmzAEy596GfvdHgdKFKts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ca+Y41O8; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q8h9fZyn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ca+Y41O8";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q8h9fZyn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779199575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vw8Hh4r9dRAzD/JG3jLtKlSPp2FykYGxNH+YocMZs0c=;
	b=ca+Y41O88ng/qBM8JMobKkQdMHoKR/sxK2GITOK0AlH6raVS/0ba8oOFAcDT3wiqIwUv3W
	1C9/xzAhxRQ5d8jtbYJ8POc+zi3PmujRqgkpBqRE47ChebsiFIXBR3J8njmhFr6U8JrTWC
	IPtwws//hLfV+WW7+2tnt1Y1F36LH9Q=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-FPh5o0VyPNGT63l8KlfZxQ-1; Tue, 19 May 2026 10:06:07 -0400
X-MC-Unique: FPh5o0VyPNGT63l8KlfZxQ-1
X-Mimecast-MFC-AGG-ID: FPh5o0VyPNGT63l8KlfZxQ_1779199566
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-696307c7f2eso7834868eaf.0
        for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 07:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779199566; x=1779804366; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vw8Hh4r9dRAzD/JG3jLtKlSPp2FykYGxNH+YocMZs0c=;
        b=Q8h9fZynj7jtYjZvZmVLiwZ3YlCEj+MkzBcR7Ma5vEOUUj1CvwvjJ2tfWtOjkmPn5I
         1E4DZBh72+897rJofBLIXbflONUSvjeHZdgL32IYIgEDcv5GYoru8UMSy/G5tOI63HeY
         58rBCRPsi2xEJK3m5BJ8iZRmMCWzi604zaGsw0llvVNAr6Gj0r4PQ2ji87hsoyCrg9Kf
         d1Ch8ULnQPHSqT7jREpBw++ACGNRNIbv2IeKwLF22FhWwUg2FV3jMU52wjB8kfSKQzeN
         SodpfODJYPW5Yx9B358XAgEtIaKgpRd+m3wDKs9YP4TEAv6fAx2+PPBirad3KeUaCkkB
         zyUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779199566; x=1779804366;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vw8Hh4r9dRAzD/JG3jLtKlSPp2FykYGxNH+YocMZs0c=;
        b=F2uiu9bFuPKQ6kTuZAdfsKblM+evJiiMwSEYSBtBXrMpf1JVp5byoDkA6JptE5ItyM
         fxkJCtdN1I4B0x/JIj18wXvQu2lruIYebJ2ePpOPWK2iQjhW6Mm0AUZigEOx1GzuTaN8
         TrLbOeHZX4pZBcCqYk2N5ZjDoKC6+J/mwN/8dt6UFawi2UV5gjr7ecnm0/y8ggumLTpO
         3YKxWwvUb+Ed+CE3e1gXrKe/5n4owByje4FqqLr6qMQHIfNSNbCNAPbyTuaaB0ihVIzR
         8KZOiK1S3GAJ0/n9mKXi2aPtrf26lbt023JXQtbYZSoKDxLW5SY+c0Et+dQV+TWjz0F9
         TwRg==
X-Gm-Message-State: AOJu0YwoPXlDx8tkxA9N4behCQmhcy7/JYgn/HaFHNYdjNd4lDekTs1s
	rXxP8XeO1nPra1JJEthtipYVxBwF1iN8LHYxRz399mtxx5bE+EkupnBJRi17xH5LaZMnNN2quyY
	KYta3DFqcpaFUwswQuli82cv6EA2JVsv/vpB6XTtWDbPIbVRcsbHrI8Zs2RwBNg==
X-Gm-Gg: Acq92OF1PMLViNLiDYhaxSLGr3XObqygPCDkHdvDRb8pdH/KlQKyghMVhC3X3R6NT1M
	+ctovbtMftpqBv8qKaXHLn4uvM/MPz9wVvu8Im5P7nlp5TnQ6OMJwT9qtvM8PR1AhwUim1pC+B7
	0GOvAGkpA/5aQ7FxLO/Dcs97wHe5nr54zxQ1p2y1/bDG8DrZDcKFJhV4dC96sg1bYmHUu2LD/E+
	L4r5rX/KLsRbwOvFc94+iFKAYJHL7t6zFe35+5Zx+13ZQA6Q7yrR4sx34EDdsYtSLao8woSoH/g
	+3gmko8Fo4jhUVazJSaoxi3stL5uNW9ajpy9XTiHT013Eo/MF+ZqWZM6OY6j5EyalyZJX4tzmea
	zi60lgYiljcTCZk1FNfz49EitdC/ZdWx0s8SqaAvniQL+Mi+xbJELGQum
X-Received: by 2002:a05:6820:6189:b0:69d:521d:a4f1 with SMTP id 006d021491bc7-69d521da817mr581311eaf.55.1779199566339;
        Tue, 19 May 2026 07:06:06 -0700 (PDT)
X-Received: by 2002:a05:6820:6189:b0:69d:521d:a4f1 with SMTP id 006d021491bc7-69d521da817mr581253eaf.55.1779199565643;
        Tue, 19 May 2026 07:06:05 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ca3608bb6bsm91862306d6.6.2026.05.19.07.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:06:04 -0700 (PDT)
Date: Tue, 19 May 2026 10:06:02 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH] clk: stm32: allow STM32MP COMPILE_TEST builds
Message-ID: <agxuSsAhreZJVYcc@redhat.com>
References: <20260518221230.19879-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518221230.19879-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Rosen,

On Mon, May 18, 2026 at 03:12:30PM -0700, Rosen Penev wrote:
> COMMON_CLK_STM32MP already allows COMPILE_TEST, but the parent clock
> Makefile only descends into drivers/clk/stm32 for ARCH_STM32.  Use the
> STM32MP clock symbol for that directory gate instead.
> 
> Building the STM32MP21 and STM32MP25 clock drivers then requires direct
> linux/bitfield.h includes for FIELD_GET(), so add them as part of exposing
> that compile-test coverage.

The second one needs to be it's own separate patch, along with a Fixes
tag.

Brian

> 
> Tested with:
> make LLVM=1 ARCH=loongarch drivers/clk/stm32/
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/clk/Makefile              | 2 +-
>  drivers/clk/stm32/clk-stm32mp21.c | 1 +
>  drivers/clk/stm32/clk-stm32mp25.c | 1 +
>  3 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 9c3a9703ad92..0cd2223de3ca 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -150,7 +150,7 @@ obj-y					+= spacemit/
>  obj-$(CONFIG_PLAT_SPEAR)		+= spear/
>  obj-y					+= sprd/
>  obj-$(CONFIG_ARCH_STI)			+= st/
> -obj-$(CONFIG_ARCH_STM32)		+= stm32/
> +obj-$(CONFIG_COMMON_CLK_STM32MP)	+= stm32/
>  obj-y					+= starfive/
>  obj-$(CONFIG_ARCH_SUNXI)		+= sunxi/
>  obj-y					+= sunxi-ng/
> diff --git a/drivers/clk/stm32/clk-stm32mp21.c b/drivers/clk/stm32/clk-stm32mp21.c
> index c8a37b716bd5..3c143371c77e 100644
> --- a/drivers/clk/stm32/clk-stm32mp21.c
> +++ b/drivers/clk/stm32/clk-stm32mp21.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <linux/bus/stm32_firewall_device.h>
> +#include <linux/bitfield.h>
>  #include <linux/clk-provider.h>
>  #include <linux/io.h>
>  #include <linux/platform_device.h>
> diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
> index 52f0e8a12926..cc95fac66449 100644
> --- a/drivers/clk/stm32/clk-stm32mp25.c
> +++ b/drivers/clk/stm32/clk-stm32mp25.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <linux/bus/stm32_firewall_device.h>
> +#include <linux/bitfield.h>
>  #include <linux/clk-provider.h>
>  #include <linux/io.h>
>  #include <linux/platform_device.h>
> -- 
> 2.54.0
> 

