Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E532C21DD
	for <linux-clk@vger.kernel.org>; Fri,  9 Jan 2026 18:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767984196; cv=none; b=NkDIspIoBWw/zqn0TXEegwPVpDJgthQSOtBK2M3Q7ostFA9tDZsO2PXq6kqV+/WLe04nzeJq90yJomWofuKHXvCCJygr3QXeEDBDKV7itNK6mpExJ/jtJrGLcZep/kC8+kuqVDP87to6QhKX2lEqI91iOeOrfrwq48XYHXkKQ+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767984196; c=relaxed/simple;
	bh=xPYDi2PcZo5deiOcw0lB7iYzQ4VCFpOyH/0YueLqgmk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tzpc5LLUXd2RwJTyYlQAELxLQu4Edcq9iOTAppabhgi3Sl9MrHlqujjMCfCNFZadf99dDrJ3olU90q2pGTrzfkJZo+HTlkYYTX0KCRD0h5IEHQC9z92mzDbuEtdKlnCwRU7Kp0dmg5eVa8bHwk54na67xwVkWAKKItQGOnnybrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5636784883bso745001e0c.3
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 10:43:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767984193; x=1768588993;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRHLGasfyR69c6srR1G3LqlEAk+Zi7+IjINLOavqaCU=;
        b=kj25Za4QPQsC73JKf9w+1unmgLjMyP7VFSUrsybJx81VcPZIBULFx/xBy4cHfasLPG
         i5mmdPVKZu2FM70JNuvTSJuHd081xHVzRQgmf0kuHd/KRl9w8Ysxh/7NJzP3UNlO7/l/
         ed5EPTl+Gcei/jo9l0UF1/bCnkUfH2CRkMKQn9pia3bsKsqeJANJpRE/P/6Wv+dHBT6H
         iQGdI3OZt71eszin9P+Ng1EXDiW/DO7tutM/9n1tiu6EQGSZGOkdGd8e0zD2VOfpt0CC
         k+ZEom+Yzp7e/sIsWosvugKn5EiJqtPd2QV4VqGRKyQ53//+BqS1fLSBSwAWqY9wEvGF
         ugVg==
X-Forwarded-Encrypted: i=1; AJvYcCVAPH0VU64dKkEhLsQV0mQgyEg0j3paJK7mz/NgLqJOQtBP1nS0CgXs4tUsvtG0+I/wDcjmDkx25hA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl/R8foFh41C+tblUEmu8pOpFuB7Pl1qqVYID5kffhEJ3Za05b
	sqwSNFfFq+h2dEWrzo3WuietD9w01gWaBfBmbVsG+BAaLD9RkmytwdyDB/CBSAOr
X-Gm-Gg: AY/fxX7rTxhmGSe2TPAWFFyGzu1delghqtlIf3Gsd2exQ9a67JVPFqikY9VOKovf4R0
	3goIw1UcLzHOLGq3bZgZOSt/hq9M0j3WW3tFq5AlDqGdQ6fnWIXkWFKxAgyjNuLfdedOvDsd07F
	YilAA+4QVmhjUuGx2lOujeoHKqiXklghmORtOZ0j3+ZJ4kPnHoj4gUEAVtdWGPEeqtlMDlX5lw+
	M9jkap7szvYyesAkRv8N/n1wDZsfuynmkFXzwXmdT3lAZyJCVgJg+tG4IS9UYIPz5rNsML/95af
	9pd8NGpjo27iXIRjAbasALETRppuXwo+mOdNqxYpVQPNFCMLcvJ68VTnvLadcZv/TW+5H7WM/V/
	HkJUPXkfzylD6UXf2em8HJdePv3s4rr9GHd+cFS+Hq5NBXrqvX+EPOT7t1fv477wJ1mkIMN/A4i
	YtJc6g7yyVB2q9h9AqL1cUTXk9FKk27/uYOqrkxZ20Nwm5pWfF
X-Google-Smtp-Source: AGHT+IF7krR7dMht7d+ZXKhguof9T9nEsYKKUJ3/X+YBOOdAEfzftPZJ5wGEkkZTNj9ocsTXT5Tp/Q==
X-Received: by 2002:a05:6122:35c3:b0:563:66b6:2a5c with SMTP id 71dfb90a1353d-56366b62bf5mr1111640e0c.20.1767984193367;
        Fri, 09 Jan 2026 10:43:13 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5636134be9fsm4298436e0c.16.2026.01.09.10.43.13
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 10:43:13 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-93f5729f159so2787605241.0
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 10:43:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWsnDLbej4gPsDWbmwHVKNPkJZYYHtUQVwgV+uBsPCvT8swiLSJlkCpHh6aBwLTf2GV/qu+EZvNaGw=@vger.kernel.org
X-Received: by 2002:a05:6122:459a:b0:563:6d01:a514 with SMTP id
 71dfb90a1353d-5636d01a684mr805296e0c.17.1767983883673; Fri, 09 Jan 2026
 10:38:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com> <f7130b18f20fe80f4187cf0b024dc10438f2820e.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <f7130b18f20fe80f4187cf0b024dc10438f2820e.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 19:37:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW74u0a7eKN_xS9hc6Y0GycGbnwF7170KjV5oNi3QnY2Q@mail.gmail.com>
X-Gm-Features: AZwV_QjTECnB1PZN8BE8Sxq6bqzf7JgBJC7TEeRima6lECENgoL1jMbZT1RrYiI
Message-ID: <CAMuHMdW74u0a7eKN_xS9hc6Y0GycGbnwF7170KjV5oNi3QnY2Q@mail.gmail.com>
Subject: Re: [PATCH 05/22] clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_CSDIV clocks
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Nov 2025 at 15:09, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add the CLK_PLLDSI0_CSDIV and CLK_PLLDSI1_CSDIV fixed-factor clocks to
> the r9a09g047 SoC clock driver.
>
> These clocks are required to enable DSI and RGB output support.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
