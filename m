Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631302;
	b=QNZK8OVBY2cX25enJCpvMjkb9nedKK5Ud0Ls7lTAObJ37+ZxMxsG/c45LH78tzQ45S+t
	 Dc9sOdO5RoCsxcDchrzXUW3F7fvxLDSVuKBCscU+KMhVI0J07LrWO5Y0sXeWJZmEPANkQ
	 zPMlsxLLfw2RmB/73LqrubeQwyVO9qTTD4tIxKAsYM4V5l5sfjdaYzuDcK94jxAC/Sqh6
	 vgxSHIHJV6go0niHLjzty2GNGatL6+45r9Slf4e27/3bKyt5nWyy+EToJiJ8ytbmpsQzw
	 28OqqIctT3LAaYge6anWDORsQvoERQU+yYwzMzPqUiaooLM/C3yAMXey3lfBmMkm26g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631302;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=eoXHqv1rfEc+TJjF3CsngnCxXTqYRvHqAmrtTn1BgMo=;
	b=SK1ySiYBLwpmhoB4PNVrkLZEv3s4fns8GE7OOGUP98mnZ4NTcxriJpPil0ruPKIEjsw1
	 qfaACV71QUDGoieRyj2NspbtFppA254FMChR8e5tWLQh9vXofeiBAklu2A+M82jCWnL/K
	 I7xMphi7wGjo5Otsc8f8c0TDZBD6Tv6W6W7hhsOGG8ELfQq3XOtFgoQS45J775z4uoxW3
	 0gJsQs5O5KyJ2EcSeRS2xJaOGA+Ab2gfrgld4hSVMXs7EW6dwWq0DCAKO2YgL3oun0yiN
	 GlJxJ5QY+no9SRJUFAfWyLPJjw7rxxnG3M7zBsOP51fxbbdlVj7iBFGqqCCBsb+g/wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18539606A5A1
	for <linux-clk@vger.kernel.org>; Mon,  2 Nov 2026 14:55:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18539606A5A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5eafb65e169so2148395e0c.1
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 06:55:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631301; x=1794236101;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eoXHqv1rfEc+TJjF3CsngnCxXTqYRvHqAmrtTn1BgMo=;
        b=0qNDWvKm6d8WPbZbel6VUtO7iq35gfCyE9qmH/l/jWDBRHDPyjKP0f21r2jUTXzlJD
         vt/bHvACySFF5x7dAPhdASIbQ5sxEGG5NyjLkBd7RsUqEhsg0h5QdsnmXE0L8J4EA+wf
         T4pl3xxeY4cVuUvq9w9Ywk2mfmeN3ZkwcL4zc9L6EB8QMWPp3qzutc60xY8GipwU7yAo
         ZADjbUAekvdSGwtQIZZA3EMJ2sjUjIdLJFGgoUxQLktwEqf+qzpyj1wJIo+9jAblbTTn
         PofRRPxxtYaUHEgyX1qlH6Igw9QyRGwLuVmaK1/IDHk7gz69GR9HzhsEgvyZXfuN9BmU
         4Few==
X-Forwarded-Encrypted: i=1; AKwUvBzSdlsCcw+F1Qxo6Q+an47S8kUrLHUJww8BoW4dRtobd1kAg3qT4OLTDTWPRCWk+x/Nw6EYC3P+XSY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/huqdOnvreggXzjk2vL29r0Y2Ti7pQvXzi2KAZmHFSVszsTju
	wJec4yrgbRAcx9TWLHxVPY92OAhwhenEQaB6IT5AygCy5HN9SD8rz5mGacXMQKSiNYw=
X-Gm-Gg: AYBFou1ej/heTFwwEPpm2BHVpTo9GKjq+/dfEsnn/fCCn8WG4uUGi2QgF7xwmo9vMW3
	bBM45dBrmbM6fIr3aIF6qoQr+FPpoLjOvEP/ZDbKeE67/a2bCyR5EskZajZ3pc8iI98SWyQMsNH
	rS00cRTzMKL4hIiDMUAqfUhT9FLaoi1DF4RG2TuwqXvi0KSeK7hEqOf0Q3bo8kQVAGKR8ybiUf2
	NQP+CnoN37bOLMhR8O45NV7TxAq4GR+MJ0L6X8q4IhgwvRRCZOCg5eMripc/CuwOAGjdwiFJsi9
	4/1+4T3PDkqzBe/Sf+WwtjABPB5USFGu7xZcznUjSMeBWdnKXr1QzN9A5l+T+U91dnLAwnqWkfA
	GIeunFxZ88zPfNOqGXwd1p1ZSZ1C4lanwvkAC15yiyfBt7GgFQBouQEyN+Ac+cOGqODDNCnxm/p
	CrmUD7TMKu3PyZges5gv9SqNQbX8S8oZwb8B+DYpMms/7NxJWztQqjyzIiu+gHurGbM8nG0tlud
	QnGl421GVwlLR/9cen/8+91vxsjd/cUfNMAX9nUD40AFhYFSbs8OMcsbGudKrWf2llci6Usp5i+
	KtS4u/2IpQ2Cwel0PZWUlsVp6VI/Sc4cVT3U81A1YejbTBa//OGkTgYyU/Vh8+DrRQ==
X-Received: by 2002:a05:6122:21a3:b0:5cd:590:c22e with SMTP id 71dfb90a1353d-5ec689aed88mr4686938e0c.21.1793631301151;
        Mon, 02 Nov 2026 06:55:01 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec69a459e2sm10321572e0c.1.2026.11.02.06.54.58
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 06:54:58 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7a6e560f580so2133603137.1
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 06:54:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxJfbP5do9jrORoqOoVIQCUnYnVAdt2ZD6LzM/sQIkLhtoxcHLmp1Z0UxvDHkagK6wYhtYpKR0731E=@vger.kernel.org
X-Received: by 2002:a05:6102:3f44:b0:7cc:24e1:77b with SMTP id
 ada2fe7eead31-7d072270da8mr4006528137.4.1793631297177; Mon, 02 Nov 2026
 06:54:57 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031194225.118516-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20261031194225.118516-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Nov 2026 15:54:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWp_Hozv0AV6utNDDPP1=gGZqBa+rRUhguDxJg=ZXssDg@mail.gmail.com>
X-Gm-Features: AclHuK8owA5gBLpZ-YfZBpEjdWIL1T2us-ie8-rr38WVdKeR-uDunLB-LXslBB4
Message-ID: <CAMuHMdWp_Hozv0AV6utNDDPP1=gGZqBa+rRUhguDxJg=ZXssDg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rzg2l: Use str_enable_disable() helper
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das@bp.renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 31 Oct 2026 at 20:42, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Replace the open-coded "enable" : "disable" ternary in
> rzg3l_cpg_pll_clk_endisable() with the str_enable_disable() helper from
> <linux/string_choices.h>. This keeps the strings consistent across the
> kernel and avoids duplicating the literals.
>
> No functional change intended.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/r/202610301526.XkacnSyK-lkp@intel.com/
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
