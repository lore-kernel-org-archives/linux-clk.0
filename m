Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEADA4E56E3
	for <linux-clk@vger.kernel.org>; Fri,  4 Sep 2026 15:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534075; cv=none; b=RfJhXmUMmXhGsAa7omj64Ems2nBRZXFkD/IP0F5ncgCIr0dl5w8xIIpbMciTUxlnKCF7u/vkn4Vro+JA5pgUpVJ0iePtotYaHLLnfLC19hGGZC7+oVjIQN9gzXlZF44EuEe6riEwM6JmdjhjDgU9GKCHuB0MpZ+FEMHTK/CAvKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534075; c=relaxed/simple;
	bh=90rHthjt/yGjs8ruJ73s4ajxZDBI6dnx8TaoyliYuBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eZ5iUAPsck/xVBBhsif8uZaUgJRmPTHZQNwVKqyyuumQHUc/Zw9N+KypDrT6bFGPgQ5woBV+SUbC4mO9/vcMc5xsPae2VBe47mlciC83mdZgr8PqNdtlJ8SQvVL8BjVz/C0mV0u+9QaPIYuMG91iXfeKN26ncsNNRg7P5B67M+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-97e9c0da212so732622241.1
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 08:01:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534069; x=1789138869;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hlQwu8m1wQp2ta11biuk/tG/NCV6kSdttoO7IfG7LVw=;
        b=fFT6Nx4FBYLJLBmI31ZHm0yc8uFgzvktE9QCgG12Y3mjHzzY4IO3x68QuKFyzegR0Y
         jreiuHZJrq0T37ID9IOSk/6qW+3Yxm+5JOHtPpjCPJ+yIptlUVhUL9tRUJLjR/hs2VSo
         Jf0KmbPLwzU3SfK1K8S5x/MdA9TsQGwNwMK0dDNbmJiYleQpOig8XGhe80eD+mKO07S8
         XGFhIbLOpRhiORdGI0wL1WRDdbqHXAO4fVs1/DdLgR/BA7oaHxy6qK568dIzLO+zz4YB
         ZcjX/VBLhCj9et7ixU/maHYcqazQEgKwQXHsTJFSIGXsr7flw50GV9piq1jgveKVfjjf
         ZGeg==
X-Forwarded-Encrypted: i=1; AKwUvBwrw4j961LCl1kQ/4jdGp9PLz6086gy1zGjR0TNniTOuwASV3l0H8F+7YCDo+cxuhgi4/MfOh9fi24=@vger.kernel.org
X-Gm-Message-State: AFuF++lIm4e+DhRMgGxH1V72FbU8AOYZF+nSVssu1CV0Bb3cpx5BYFfK
	e10/Lb02QeuEqW7Y10Tr0FtNkMzCE3kVYKgBqPoaG7DfVU1agnUORa3Fh/bL5t3n
X-Gm-Gg: AYBFou386NbPBVmVMA1rx4Oo5Sw4kckMCJ4nnadb+PXEnrC2O1H7euhXaAxvTMVayi5
	HzEFPTTG+s7cDcQ86L6M0GS2wfwXOJNMt319l/C/F3zMekjrFJFzXVlaUCr6Sjus5DfOi/kRRa5
	vSemEEKw5mR5Xd608YawEuiKf68gKmiLIJFTj5ypVCaGwD0DVb35EjKkUu3yHsnfw1aP8JdG1g2
	qw0iCFMYW8Cz3MopfUxlOEFhdnRGySbhH4Ll8z9h4WhAib69ZgEGnbLgEPKAZ4gtYkBDowdwCx/
	4GRuHGVy/K+9/tVhj+3wjCvAIm3KTQehk0YMp73RVJirIudll8qw1aRoRRr+4/7t2u+RwgsPn52
	dHY+hjR3RCU36GVJBiike/tjAPOZzjITS/VnBgqbINv9L32yP6G4js8o3/Q2aze0SsCl85o2uL2
	38Q8ym5wZ4zkpjZi7qmq0/Wlv41lzcHYPiECgxGAi/C2HnXeOZ5k0PyB3aJ0zHotqPp8Xw1Cx5A
	RW0mUpnTpfdacNoy9LWzRGn0qZX9sjP8QMf
X-Received: by 2002:a05:6102:3914:b0:784:a169:194a with SMTP id ada2fe7eead31-78a4aa13b4cmr2432777137.10.1788534068512;
        Fri, 04 Sep 2026 08:01:08 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47b3468csm1970491137.11.2026.09.04.08.01.08
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:01:08 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-966e7380109so880687241.3
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 08:01:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByGdIvQB7pGvWb3Xn+0u9aQZdKbfXJ5375y1Vgg64XkQLpSaaNxcoMRGYLe6xxllWzKfcBEqIuLk6c=@vger.kernel.org
X-Received: by 2002:a05:6102:570f:b0:785:e444:15de with SMTP id
 ada2fe7eead31-78a4a8b86c6mr2573960137.6.1788534062781; Fri, 04 Sep 2026
 08:01:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-2-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-2-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:00:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVuyEXPJpCaE+MGwWN1qJVyzePA5--wsRTZRtFP8woCZw@mail.gmail.com>
X-Gm-Features: AcwNN1We_3fExHm_K1_nUZIVYeTkuFzPE8r5pnBYIyrcPLEEf_cM8LoiXO9Ji0A
Message-ID: <CAMuHMdVuyEXPJpCaE+MGwWN1qJVyzePA5--wsRTZRtFP8woCZw@mail.gmail.com>
Subject: Re: [PATCH 01/10] soc: renesas: Identify RZ/G2M v3.0 SoC
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
> Add support to identify the Renesas RZ/G2M v3.0 (a.k.a. R8A774A3) SoC.
> The RZ/G2M v3.0 is assigned the same Product ID Number in the Product
> Register as the Renesas RZ/G2M v1.3 (a.k.a. R8A774A1), so use the same
> SoC data.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
