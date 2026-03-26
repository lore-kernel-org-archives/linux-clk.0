Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92BE3D9DD7
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 10:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774519592; cv=none; b=Ov2TuEQbHFQmP8qPLwaPlLyWNYmHyGocpqXq2PpqUQCxvZ2U3T6CLhDFwEOWSMOmY9Ra3OxosLNfKRBztf/lJuXX7EgFrnl2aiZIPZcDXn3IBjMWmCwob0hibB0DAStNX0sOr51O7g3wvVkgJLZZrvB8N8W8mw+DnlGIeOuZlXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774519592; c=relaxed/simple;
	bh=Dnk/Ep000DxDlm30ft/36GISAeJC6MWSp0hczCHVrsI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B9jB7poiadZRsL8PLH/RrWJrXT3mh3/Q6wtAOYhbCCUCckOQF88o3a+Bo/vEOReuCUygsjikOYxjkCsT7xxRFuNCQGPLGyyzfaw97OxLnJ8WBdagTJeew/YTQ0Xz0jjFJ8wcQBGv7g+HJmgwz7b/M0fDSHRS4rx3tSwcj18FjGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56cd842b60bso617514e0c.0
        for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 03:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774519588; x=1775124388;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTtqqo6x9S580GU00V14/uSms4ERMBvfiBHq57QUXIo=;
        b=Qs53LcUKrYanszpu9/S2V56uIbiIL+9dpIgam3Ah42DfdujbIgtN7og6TqUlMy5PSJ
         uNB3sknW46Ypglaq1z//UhL22jP+vFuygcbTu9ib5i6paajGOzHqkHJcVWA0kpK/mEps
         LrfV3qPbQfHH5PGd1fYqIOyV/WeepcsLJ822KfBS/K/EnrTATXjrFMf22Ld4PSJvXbJ8
         nwuM6VaY6qCIPtndOYOk6IvwPTB21ztNHJ3z73mcuffvYbasziXJjuHCk1BrNYh1SI3g
         16fZvkM0YK8Ef551FMozACqE1tovjxFCI5Wp9Th22ZHBUtgDCxQK1nvluncjDXFD1/Fd
         sTzQ==
X-Forwarded-Encrypted: i=1; AJvYcCV53hBePUHXFHLPggoYiRA+fLYefuVzSTaJy6d+Nxekw1pQ7QwUfsGdJppk3sM+Atnda2GOWMRm51w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1uGBivb2K86RWvoB3ZpZPXcLInf7rjOnsCZcvXYPsZ/vuYplV
	aGBMdh5J4Ei8Icg0PBQlZBNLoOr4Z9beCr/7JRiTyYA0o0PhfTOvvrLSy1twemdXQtY=
X-Gm-Gg: ATEYQzwDCy3M/j8HQKCZ29n1e2jTan3qUrN4asUuJs1rQLW5pNFhXlsqpFFXAMamaHz
	epfiFAYoWmDwDHwwoOLIZi7sI4EIdyH47hx6HhWgGPt2vV4W8QxZsjghv5R5R71RGyrj/OrmwY0
	k5Dc/SRtZcK6l4VOncStFxnTUq8eRlt/5lYgKXLzuevQMf8yHnmNibbLl4andcHnGH/WFSiJ7wQ
	aU9rn84bfycPg5qEbt3TFtJzuxanjh+SRfsne8MCRmICRoRpL+5HcTgJtDFlVj4Qs+lxrAbRds8
	jVxw9OiCK1yzziC1wfD/lVl2fOq40+L0QoE7iMMd1RQBQTH4bf12gJn97wB10FeEQzflZ6j2PBs
	L4fLmhi/9raBq58sA9PkyCdito4KPpK8HxQqqxVydz7fWdPNGf0elwneJ5mQxJK8VWx4UuHZWAJ
	6duMyaZmo7xuMNZGrv+SIWEL367ri33mxXjXm85T9f2F6bIXwU0RK4EMaKkO7t
X-Received: by 2002:a05:6122:6d13:b0:56c:3a57:aee2 with SMTP id 71dfb90a1353d-56d21f68dfbmr3007776e0c.6.1774519588419;
        Thu, 26 Mar 2026 03:06:28 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31d81edbsm3407344e0c.15.2026.03.26.03.06.26
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 03:06:27 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-94ac8cbf3feso478998241.0
        for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 03:06:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWXTXEi6vi5BToCHTPf0IqiD5FwG4PPhu2Zri15bKFWCAJTQOIfb4qPVca8HFlRyloNtwSjgmXokXg=@vger.kernel.org
X-Received: by 2002:a05:6102:ccb:b0:5f7:307e:80d9 with SMTP id
 ada2fe7eead31-60394931699mr3392374137.28.1774519586614; Thu, 26 Mar 2026
 03:06:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302165441.4457-1-ovidiu.panait.rb@renesas.com> <20260302165441.4457-8-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260302165441.4457-8-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 11:06:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXu13hd95vQGKnwhJvamYEU30stfqpEup-UES0T1WJwwg@mail.gmail.com>
X-Gm-Features: AQROBzCyFc0L7MNPsR8v6JpI5CURIKpqB0sB1nizHY9j3c8L_BX7fUgN2HFl9ps
Message-ID: <CAMuHMdXu13hd95vQGKnwhJvamYEU30stfqpEup-UES0T1WJwwg@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add
 versa3 clock generator node
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Mar 2026 at 17:55, Ovidiu Panait <ovidiu.panait.rb@renesas.com> wrote:
> Add versa3 clock generator node. It provides clocks for the RTC, PCIe
> and audio devices.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> ---
> v4 changes: None.
>
> v3 changes:
> - Added comments to document rtxin_clk and qextal_clk routing.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
