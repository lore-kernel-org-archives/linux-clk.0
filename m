Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1962340D93
	for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 15:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769443050; cv=none; b=Gr6Itlio4A8TC9d7to8zsO2WxCnLmEtguMjAN0gZfjPP1wMKGKETA4jWeQ9xrir7IWjJ6WfhpVPeKYsAu2S1nVTgYkYXW1lX5p+mXslE6bgm2iqwysn+r6JzAoC1lY387vQYmfJoSLzheQE2sKTTCOZQ8gg4c+TZtQYIwCadPyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769443050; c=relaxed/simple;
	bh=bXHAel1NwLDuPGwtU7+OMOyzgPqVLj6MKMo+sEVl6lY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qc8TsRWhim+L87vvCBm9aw7aB+gt9bPqQANbTEZnaQkHSZBq535UM63I+xM06VFPpvBe0OP6uAiHedcZG1peod/LLhn6qC3cMfRIsHmmQ4klS0DUERcAyNmK096SA1Xca7tVNKWcAdSsdjGV++I0q3DLNQIk4u0D16itVGbSmcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56376c3e866so4480523e0c.3
        for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 07:57:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769443048; x=1770047848;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWlsYApapvL5A9IWANUoDMRFQZN+NsL2oKDWoPXwI+E=;
        b=QUKL7EusuXuiNbVeZi3O7XZcNBrXIEpwmzR5n+eFWuX1d3ytlAg0VXk+Dgi+O3iELG
         B/Nyn2hp5D9Z7T+MplPiXSaVK+tAKFmEi9uNwBBHNHvE/84zhWyQ1GGSuJ3gY2nDKVBH
         lOEwV1snNt3a72RTyGXgCRxmhEVlVvysmM+Y04n9jCAOIMzU6JRKAtxj+YaySbt97zUR
         EX/97IdxrqddykJl++h1kyySvMY1r0Xn0VsnlZR+yaAEbkiKc8v5IUqDLzgCJbiiCMW8
         eJiHj6YuYIZR9zUmlKccEBy8xO8/buGOjL6rkP2FAY8Jc7m0YcVlhft84eXuUTQKplBn
         NDeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYbKb+Lc20lI60zgKieG09miJeUeYaSd8gur7ddCFMWJO1jW2O7HIkx5bBHIwCImOMsLiPrg08EoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4b7YFCEm7C9oVY/K5mP1aCD/lpS2uKIkRNwkuxGCsGmv26FLV
	7dkBdheTaN7tiUYjtaGtOjFTjrqwyC62v9vhc5PXp8HSbzfSiTIUQ77qtLoODO7W
X-Gm-Gg: AZuq6aJ6TI+LyFa5I0gT9Dn+UG1WWq1lG005qxQjzRT8bA8zPbQ9YFzUKnlfkLu1hsm
	2Sq0B0qu3R2EAGRAtImBv5fL5BQNJIGkVJHPn0F9/uSY4pHzoJi7MyH0u+1NTHYuwJDd9oWiCTQ
	vyO5SYRvaGi2/73F2fWaMW2kUb7WArzdLZ1FkyrfD1uQs1TwPFa9eRkU5Hki0xkUBbtWcVPoQYi
	UZcOsWggABnLqkHP1d62FPowqfCq6Ew120p7WV6aDJox5QGUZtWQsXRZr4qPMyH/UfKZ6S+6i+X
	Db38OL7+K+s2E6i6iEO6wAB4p4wd+CugYt7Fdmr/8J71y1D84sF65ThSRzbrJ+2zvQl56jrXdPz
	YUJbt6MjT+YKoxJViAAHcXAq9gXJuvTYxwcnu4ya0cG9sNb2kkIUOehC62/Thd73SRiAWRvkK8Y
	LyxvpUta/j9WsWTm/N1E8pZCxUAxtUtIv+6fw+8asjJ2fzETZj
X-Received: by 2002:a05:6122:e211:b0:564:f4ef:d805 with SMTP id 71dfb90a1353d-5665c964d61mr1420213e0c.8.1769443047749;
        Mon, 26 Jan 2026 07:57:27 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5663fa632e3sm1812335e0c.4.2026.01.26.07.57.26
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 07:57:26 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5f526c39718so4175340137.2
        for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 07:57:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVsr/4kJTVBpz9MmiTVeYmDrI384Ut5Gq5gEaFnu9jHX139gTYC4O4IE7RzH+7/cZi2iyNrpBDyYfI=@vger.kernel.org
X-Received: by 2002:a05:6102:2920:b0:5f5:2ab7:cefc with SMTP id
 ada2fe7eead31-5f576514c47mr1614515137.41.1769443045773; Mon, 26 Jan 2026
 07:57:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125192706.27099-1-ovidiu.panait.rb@renesas.com> <20260125192706.27099-6-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260125192706.27099-6-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jan 2026 16:57:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVgn_hViAO13HE_AY7KG-guAwSMTMOdHwzzK+K=kUstkQ@mail.gmail.com>
X-Gm-Features: AZwV_QgRCwoHhziZOmAhSnKes9efiAhzVMELZ9SF4N6lYcHkaUa7uPK8VSG_D2s
Message-ID: <CAMuHMdVgn_hViAO13HE_AY7KG-guAwSMTMOdHwzzK+K=kUstkQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable RTC
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, alexandre.belloni@bootlin.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 25 Jan 2026 at 20:27, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> Enable RTC.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
