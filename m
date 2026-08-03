Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9C3415F09
	for <linux-clk@vger.kernel.org>; Mon,  3 Aug 2026 15:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785770628; cv=none; b=FOQ8EKEhyBekxn5hKOM3E1aIWR0oihUG5U2alDP2TYCYfV69UHkITs2uX65fk4J9A6k198KXyeMv5P/Vdv2iY+LkFvtniZR52b6M5pozOxn+g6nclOZEBlrMSNVsPksgRlRyP89SngAERa0+9lIExhkNHSoNsVQfThb74C1mwEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785770628; c=relaxed/simple;
	bh=OCVftXde3sBO00RpOwzolA/HUS8iy7qx6tDI5+HP70E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bhkKnDWucD1DK6ENk/kLlkHgV37WoWEQvaHkOO91P6rOuXhbRFiryFktJvrnTgzHybvC2QDitpo7a59P/RQmAw875omekiLrQ/5OHZRMErhzT2wtFaHXFvuF4/6GL3zbYF8ghTkOldE9lib9pUIgnt5A5rOymDkbmfhActfqHyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UftY0Tc8; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=g0eVq3n0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UftY0Tc8";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="g0eVq3n0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785770625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B+vZ8FUC6EzJTLpIOuSsz/wpLgYkJ6eDVgEjXOFLrVc=;
	b=UftY0Tc8pKsWLMe5hB5GJQWPGlSdhH5WfSmhRFXcG6hQIPfCe6PaoxV3Lwp2Qy0nl0NGHW
	prjtY5PCl7rHmqPM02m1qXlWv9h7cHheHMOuXRHVWWAcTf3goytE584EQCj24x6yDu0p/s
	s23Gk+NZVGDGyqOWitI2jfaPrG7CXKY=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-oasoGXrGNayJjndAuTjLCQ-1; Mon, 03 Aug 2026 11:23:44 -0400
X-MC-Unique: oasoGXrGNayJjndAuTjLCQ-1
X-Mimecast-MFC-AGG-ID: oasoGXrGNayJjndAuTjLCQ_1785770624
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81e6bb29581so127384807b3.2
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2026 08:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785770624; x=1786375424; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=B+vZ8FUC6EzJTLpIOuSsz/wpLgYkJ6eDVgEjXOFLrVc=;
        b=g0eVq3n0IGBZygi/e32CtABKv+7haKjof4XMQfYkR0i/0gzykTEQaL2r0ezoP2t5mD
         5e26HVzsc+sX3Ie8oYJdaehsuzPRxkoWhpIx1LMtX/lu3VttzEfMkJpXE+3h3Lfu2e43
         tZeEnp2IiLBfFbMkGRdvu8DE79x95rfpQBkf4hjRYhhjvAgMUPyleshAPCzJlZg49cHN
         +8g5mokC+H8pvY+ATNyxNiNTyRNXg5sruUN3HZb3ZndUe5Kh2FiYksAk7SH7Oc34/Dd9
         rSjGBhhx/tGRMCy94EHaFIUO0o08ElwRtxshEjijfv+DtPkxrN19/nbl+FTscVxrN+PL
         7KGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785770624; x=1786375424;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B+vZ8FUC6EzJTLpIOuSsz/wpLgYkJ6eDVgEjXOFLrVc=;
        b=aJ2/MNzx9mOrVCQjrk6dX9vG7BpQK5cyev+ex80Y/b7K0Sl+iN7uLqXG2jnPxVMGkj
         tfkhFMFnOq9uyh7WUh0YcdcrzSzsZxfWgNYh35tN+0jKP7YQdQrMhJIZg/V1nZpqxFe3
         t0ccvTdMOQb9Gro59BC2s2JxsVn9Z2eCVa3ztJfchy+40QSWFIT5xn08y6FkLLmllvl0
         +dFEGxkvwvy0lsc6s4QNGGFe3OUPzt/n6qTfWO0pL/kgyfBwh+CURbiDIULTNrmuowvG
         F29tjQkrF9RuRGtjjHFy4nvd9gyBxDS6oB/7vrBsEIvInHBEDA7IG/6/RWxnKPW9h68K
         v8Yg==
X-Forwarded-Encrypted: i=1; AHgh+Rp7OEocSV1rCkBHezLKGChNCFq4mcuFKSTJhzFZcuSCq19Km8No82kJcW9rBUc7R6ciNW2YqBOShP4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyvhYyjAT/lFG/F4bBY7wVgGgmbeXE+WTZJHyOotBPkJKrAwFl
	NYbjb0krHmHmPyGlU9C5mlbdKEtnObddbHrZiudjwL+Boch1OAEDuQM+4KVRkWvDLoOmGIM+Coj
	4zOt3zamUlyxr5mTVbSy+lveH4TZOAmhVLQYpNJCJYEQXt9MQXk8oaGqzRtZgtg==
X-Gm-Gg: AR+sD11TgDIKJEDplYj3tffnwLO3dw6vDXHlsmkZHSTjOYaoWyeNgJlpDfUWl68h1Yt
	fO/3ziNNlyoGJc19gLQA/nNOvQypVsTMc73M9rlrw4R9mIonGMI8sq7e5OB/adf3BYjVLo4kZ8T
	0ZGP2zZMRmIEZX22KKQyo0EDoEQ6Z6MdAAE3sAblh5XEvLI3aDQv9nwKpzpXJ+GeuDbjxOnl31k
	XdqlOndDlL6nFYjZnBp/YYX9VjizrtjPkUKWZRbUtIbCyECmFKqoRVxCt5RDFdkPvSCNz86ChBx
	BPy7C9Eauwqa/iHDorNhnjo8YDkBhaOLvDmcJiMUfzT+FGDtfyTY1kkbYNqf6m3llmJdHTUUace
	JavoMsVJMojtc/qSDYdczAB/vspfawl/ex5M=
X-Received: by 2002:a05:690c:3709:b0:80c:72a1:fca3 with SMTP id 00721157ae682-81fd4a8e63dmr141736217b3.16.1785770623688;
        Mon, 03 Aug 2026 08:23:43 -0700 (PDT)
X-Received: by 2002:a05:690c:3709:b0:80c:72a1:fca3 with SMTP id 00721157ae682-81fd4a8e63dmr141735747b3.16.1785770623266;
        Mon, 03 Aug 2026 08:23:43 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd0d5ec2sm56111587b3.23.2026.08.03.08.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 08:23:42 -0700 (PDT)
Date: Mon, 3 Aug 2026 11:23:40 -0400
From: Brian Masney <bmasney@redhat.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Irving-CH Lin <irving-ch.lin@mediatek.com>
Subject: Re: [PATCH v5 00/25] MT8189: Add support for system and base clock
 controllers
Message-ID: <anCyfAxujzRS3wf2@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Sat, Aug 01, 2026 at 01:20:46PM +0200, Louis-Alexis Eyraud wrote:
>  .../bindings/clock/mediatek,mt8186-clock.yaml      |  128 ++-
>  .../bindings/clock/mediatek,mt8186-fhctl.yaml      |    1 +
>  .../bindings/clock/mediatek,mt8186-sys-clock.yaml  |   24 +-
>  .../bindings/clock/mediatek,mt8188-clock.yaml      |   93 --
>  .../bindings/clock/mediatek,mt8188-sys-clock.yaml  |   58 --
>  .../bindings/clock/mediatek,mt8192-clock.yaml      |  191 ----
>  .../bindings/clock/mediatek,mt8192-sys-clock.yaml  |   68 --
>  .../bindings/clock/mediatek,mt8195-clock.yaml      |  238 -----
>  .../bindings/clock/mediatek,mt8195-sys-clock.yaml  |   76 --
>  drivers/clk/mediatek/Kconfig                       |   79 ++
>  drivers/clk/mediatek/Makefile                      |    8 +
>  drivers/clk/mediatek/clk-mt8189-apmixedsys.c       |  203 ++++
>  drivers/clk/mediatek/clk-mt8189-bus.c              |  200 ++++
>  drivers/clk/mediatek/clk-mt8189-dbgao.c            |   98 ++
>  drivers/clk/mediatek/clk-mt8189-dvfsrc.c           |   58 ++
>  drivers/clk/mediatek/clk-mt8189-iic.c              |  122 +++
>  drivers/clk/mediatek/clk-mt8189-scp.c              |   77 ++
>  drivers/clk/mediatek/clk-mt8189-topckgen.c         | 1025 ++++++++++++++++++++
>  drivers/clk/mediatek/clk-mt8189-ufs.c              |  133 +++
>  drivers/clk/mediatek/clk-mt8189-vlpcfg.c           |  116 +++
>  drivers/clk/mediatek/clk-mt8189-vlpckgen.c         |  285 ++++++
>  drivers/clk/mediatek/clk-mt8196-apmixedsys.c       |    2 +-
>  drivers/clk/mediatek/clk-mt8196-vlpckgen.c         |    2 +-
>  drivers/clk/mediatek/clk-pll.c                     |  130 ++-
>  drivers/clk/mediatek/clk-pll.h                     |   13 +-
>  drivers/clk/mediatek/clk-pllfh.c                   |   15 +-
>  drivers/clk/mediatek/clk-pllfh.h                   |    3 +
>  include/dt-bindings/clock/mediatek,mt8189-clk.h    |  433 +++++++++
>  include/dt-bindings/reset/mediatek,mt8189-resets.h |   17 +
>  29 files changed, 3136 insertions(+), 760 deletions(-)

I went through the rest of the series and didn't see anything new in the
last half dozen or so patches beyond some deprecated headers.

Just for completeness: There's still the maintainer issue that I brought up
in v4 that needs to be addressed. I saw the message from Angelo about
responding to that in mid September.

Brian

