Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7584E80DC
	for <linux-clk@vger.kernel.org>; Fri,  4 Sep 2026 15:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534223; cv=none; b=ER6Cw0dnoXoAOTiLnBecojhi0hiec3lBtcGqLv16ZCAdD1ipPFiqv2k5kA98IxR0QcOukvaMX3u1teBUTpTGEd/6LN9kMeRPhkL1lkvjJl5fpgrJJROQdLYIHlCwprwiv7BHWt2fcbao6sk/C8j5K0Gch9MpfAbSOVfxhERV5g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534223; c=relaxed/simple;
	bh=fzOREMKstNdN+mmlGhqGbzBVxrEgv8H1fmeOK6xcw88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qTLu/2bSJCP6zjIDv0oiZb8+/9VOL0glwcX2WnvAvm+Dn4R6uV3GNIVz8mKkX7w4LxUzd+6fQ+lFtugu8clGIdTZ4DuPFBb8tp3PegHNvyTYdc/Ys0OxeOVpNiJZdhPo7dOKY9vymWdPMio32zfFj38LPVKIRfINDn5M1TxvEqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7564b7a9490so1813819137.1
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 08:03:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534221; x=1789139021;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FwDxiYsshE/fUWnWj2Ruj2wFFXY+QnXdoCrsnnd25AU=;
        b=VuFiuFEqOoZSSAXsip6O1PujTX1iDQVcSmD4H65UschCXY6dHOhpg0IOQfpUwNFS7h
         ubXCUWyDXNyAVR3pU55QkahPvMo/Dtpb2NZvGyweNJ2sHjAno9qaTTeeHBKCHQDj7oiR
         +2hvoxPUlL1yMDTw+vau4w8hmBDruVfHhyT+JfobEPIQl4amCLVoypNMb+MdTZfTX9hM
         GLmlFp3LCPvFre3mRknd2sr7stYlE42rqs2WLDzxLkBAu1YjO3nPzOBkkd8j+3HJyDP/
         dI5O8czreD/bFD5FVS32w61WG1m1H9ahawcvk5Drn5vmVwmMwuEI0A2yBVw1fiIRMdMD
         b0uA==
X-Forwarded-Encrypted: i=1; AKwUvBx844iQa4YQJIGX7eO1JP38IfNhwz+WySYWoq9kFGoScdptrRhygajSNPb0ORyq8mjqWZjQ1NmDWvs=@vger.kernel.org
X-Gm-Message-State: AFuF++llEQUmmFJ+0FJvHIvNBN8xuWLNV8TCpegNUkZf2zodE+xXUOsz
	v8u9LhlZ8VOd0DH8OTKaQjVGTvn9OVJOTNOUOgh6UlpFhPYRTkfmcCMdaCPZTBdW
X-Gm-Gg: AYBFou1QjSKFQMIQ8/Py9vxrjUgkBhmzOLWn4QQKHSicV0qZG58d7aKlF4XGQ2xDZaR
	CWt0k9MObE50zPatuEsiJbnTIn8BF5uz3iht9MezKPYXz5DzD4VDt8n2ks4Cug2bILc2/76xKJ/
	MJT2rIInMMV77buOgSzYZcVZPd6TUW2OLq3NfoZInWW3pp/MQwX/bZz2xXeVc5loB0d1Dw+60CN
	pwUOFBQW7k+uh/uSPNJsgmUsUHJENelk8Rv2R8HbIeoYPUYgmKk2HFzFZuQIxt6emnz03fSRVpy
	fptjWQbBqfk4dO4J8QthpqWsf/93SqRRhZfIeNverhvDmyHBs3A6LY+zAmia9BZOPLxV26AIlj4
	msWeyeczDVgTCPd52WZQiri3+6n3ughvmqBMgxduCfdlA+YJyKnl+Ctd6hBcYj5tin6AEUzAY5l
	s9onYjDVij0zRv+3rbriJh7/h3t8nGOdnijgWF2ZZH5KfRHI4xjyvixh64Xg9gel5xJ08AqZHi3
	AJkr9aXUj2agjngYLgDamghew==
X-Received: by 2002:a05:6102:3753:b0:781:1ac:8242 with SMTP id ada2fe7eead31-78a4a8996bbmr1222549137.7.1788534219239;
        Fri, 04 Sep 2026 08:03:39 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47a76aaasm1953202137.3.2026.09.04.08.03.37
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:03:37 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-78a338fe106so1688191137.0
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 08:03:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBytx1Tt5yajGKbohS/yonPJzEF8cWffbtqBH5df1c6KgeauhF5mNYwRTmNIN8i5UGTsjXQjcSSuKQE=@vger.kernel.org
X-Received: by 2002:a67:ecd7:0:b0:78a:568a:616e with SMTP id
 ada2fe7eead31-78a568a7517mr457415137.5.1788534217450; Fri, 04 Sep 2026
 08:03:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-5-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-5-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:03:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW1gcLybr06anojAeym-Y8ogRCavOOfJiiWeJRHrOePtg@mail.gmail.com>
X-Gm-Features: AcwNN1UeX_tHY_zGLACot_ynQRVuzMQ5hoKZFPwjcrfLfwgwmaAT5NZ4wqS9wQ0
Message-ID: <CAMuHMdW1gcLybr06anojAeym-Y8ogRCavOOfJiiWeJRHrOePtg@mail.gmail.com>
Subject: Re: [PATCH 04/10] soc: renesas: Enable SYSC driver for r8a774a3
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Aug 2026 at 17:05, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Select SYSC_R8A774A3 config option if ARCH_R8A774A3 is enabled
> so that System Controller driver is enabled on Renesas RZ/G2M v3.0 SoC.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
