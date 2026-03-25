Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1553E1CE2
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 16:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774455897; cv=none; b=kBiz/QWIodSxopF1BSTxrIGaZlp9dvz2IIcMdjgT2NcfhAl2CBcUaqC00fphaGRQUe0ZPASNvmkcC35b3V70W8q89jugCWFcLsYB1zZPTHAJVwrVoFcnran2TPfkn+l48mvqPvRPWVOISUNzaKH/bxJP9v5d2IHDkRUshiejseU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774455897; c=relaxed/simple;
	bh=rmeZVPSOtvHKsudTVqrd29mAkraoSiHAZ4PP1RwACbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ob+rD467WdgACJO+yNwkFLaMFHLf6pES38KdGcVMDhg7FuHzJdT263NNgz0qMakx69WDEW08Up9LsfQJE3DFUdq+ePKWNmrYDAxaioVd2h529T96M8z/VFU13yEY9f/UYbhhekYr1gqpboTQ+KOu9hVX5CLplQB3XgrgV3bCOlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-94ec56c6f05so1333781241.3
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 09:24:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774455893; x=1775060693;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gAXhHrpF27wFNXFA6QhJ48A7x34w2nxZZrvrXeYgHw=;
        b=jynrcM1l95EX6GSjIZqRcCnS645HxbkDnxn3dhr+0h+ujng3x8m0rGQqIWuvG3GsSF
         iatywE49stsGHwAvHgOX7yRtWLrjvRBGkWhjcwVP7zdNlUqQAT/5gVS7e9Uw6E3dEKx1
         Rmeu/iH0qDfEg9cikBV8P+FNIfbJFG+U91FElYuWiNXyrlkxyaFibl7fWudyDqpDUb8i
         2mwp1gwtzk9goNUfbZqNssvs5YTKW9xmMcb3ZPI6zRW6KBNX1sw+bhyW3vvqxYPdnXSd
         JuotFZHdm+vraqFLe1J+VC54a1ktXRoUYkmrgIaexUI+ioVlteUZPktsbLkhxROkhj8q
         3Ltw==
X-Gm-Message-State: AOJu0YxBkPY1Bbb0ZBVpNx3F+avBC8ok37QdseF4aQQi/HbwwIFcYwQ4
	tqGTc3Q4JvTC1QrnX2fisqMeUNjCyRSWDclrFhTAz5YAfGF1+86UjkMJ8nXuPLzKB8o=
X-Gm-Gg: ATEYQzzTZKFJIVD7ltMjGFImCxxEy5KFetAs2tM/yaqqkj3PpL55KjC3M+rrRm+HwqM
	3ie3ergoY0gObX6ThYffdVfidBUcqNS18T++zGqk9ONybcbVK4/+DeE+y2XxIFU94TT3P2wdbZx
	teCoEsYIcvH0PJQMevUjJvfPNotBwekSrKncREx//bJmKBVXja/vOa4T6Wjigfykym0Psanfa+Q
	IbYxxM5fNrdO1ubVGxG9JD7egZ758+l8KjAg4az6wDPvFsIqbOJnsnbSjUlGKDX3dCgJUm5zU7f
	2PEdjSpBNWN/Goivov0TYbP6X8Pkv1M4O2wbpxilRysuKFChJF9Zzv5heR7K9c9oj8byVGoHLTk
	gxzy2s/BCGXNJTJu2YbdVva7mPtmzkkZ17CefR2Q1EKb8KJDxAI2YYYE4GdfD4p6ef99uCOWnMJ
	HBNaXb3ksauoZuFeAsyW0BXbrNtqndE+PWbIT8quHUhLJBmwT+1FuMVDbTLj2igOY+
X-Received: by 2002:a05:6102:84c1:10b0:5ff:c289:47d with SMTP id ada2fe7eead31-603872abe9emr1529928137.22.1774455893278;
        Wed, 25 Mar 2026 09:24:53 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-951be5afc43sm481177241.13.2026.03.25.09.24.52
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 09:24:52 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56a9a7e762bso90588e0c.3
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 09:24:52 -0700 (PDT)
X-Received: by 2002:a05:6123:4c:b0:56b:a534:42c0 with SMTP id
 71dfb90a1353d-56d220ef9f1mr2094685e0c.15.1774455891759; Wed, 25 Mar 2026
 09:24:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324021103.13651-1-rosenp@gmail.com>
In-Reply-To: <20260324021103.13651-1-rosenp@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 17:24:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV6tBG7zQX_eGuLnvp1he1kQxTxj+8QmYj=jbo2OTGbMg@mail.gmail.com>
X-Gm-Features: AQROBzCGGCNDC4VvyRbtehsEECFBYE5hrIOwkI-_9A4YzO91h6FhBZCpQfgFjIE
Message-ID: <CAMuHMdV6tBG7zQX_eGuLnvp1he1kQxTxj+8QmYj=jbo2OTGbMg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: use struct_size
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"open list:RENESAS CLOCK DRIVERS" <linux-renesas-soc@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Mar 2026 at 03:11, Rosen Penev <rosenp@gmail.com> wrote:
> struct_size is what is normally used when a flexible array member is
> present to avoid accidental mistakes. pm_size is still needed for the
> memcpy call below.
>
> Added __counted_by for extra runtime analysis.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

FTR, no changes in generated  code.
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
