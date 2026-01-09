Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFE827E1C5
	for <linux-clk@vger.kernel.org>; Fri,  9 Jan 2026 18:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767983974; cv=none; b=R+haiqNqGs6AEEe5FtsOa7yrUClcXwyrtyeWb6fFO1bRqgM/bxPlqL0Mx6AKvgTOeSNhkFmJvbbPB3qAeA8jm2QYXiYq5kUNl5yrkYzz0TK5aWmE6sWoNioiyKTJIo3virw8GJ9ZrEfDAaStzaB4bdwUcpGBL+GtH/F+EvyrLMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767983974; c=relaxed/simple;
	bh=y1gtTxi2yb3k6kp7O25uyIdCMmBuVjPt0jggABGGS+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r87DxjoYFrmGUzkwrkFofCXeoFtGiMBUpMh1AfsjNqDKl46dlADZzlTNe8SN4kYMYbTVXMwa0iLx7NxmrSDc372ZXbeco2hlY1GTfFIftoY9+n0wFlsGw9jDKSiPQFu3NTmiuG38eQ0pKogeLkwqc/ej/FlBMyLt56XFRDF4ORE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-563610de035so1188147e0c.0
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 10:39:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767983972; x=1768588772;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DI2vaQ4j4Y7F+Kqlo0E9lSJxr88gYTxnhRjrPcAUZdM=;
        b=jzzaVa/tn9/KjS82yPQoBvCP4QTRA0NiyQvGQ3UMhbxadJSn3RT3LnbkKBOs1Rlx/1
         finckqcAQIe1dKUK4w7s92ARO51vxTqXMlsk6Nc3YXvT+rA+y/WKPtp42TnaXE3wonO7
         3a8wmjxx0C8pcvl6MP3cQh+zlZo10wbY9Ta1g2ei0goHYNjJ4tPnk1T0m1IDmp33YalD
         jGqfebyZaT09YwdWznXpp2G+TaY5V9UJTxywe3iTeWrpORybJjgdh21WR2izW3XQttz6
         XFKmlKDMC72mjjxVaCEM39RM2/EY1Rk9W24rDFJKKjkDio0veGe1IxGi5TCEOeyBkIj7
         4z4w==
X-Forwarded-Encrypted: i=1; AJvYcCU6FC77HN1v+3yCjMStt3XD67kJEO0buG1GVmXiTa+JRMyEdNDoUXMsgZPBWhJBkKgj854LQDD2Oek=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdeIXMSAnlfd781HFYKhoEGX5qJ0FVtIIMhybm7S5yaT8ubMmH
	fD3i971etSGEHYOB1eXu0gr6YGeKgxDZic3u5aa9YgoRPX0/JtFNbKQJHwUyp3yh
X-Gm-Gg: AY/fxX7Qv7MVQgJukGYelK9E0OJ4kBe39guq+vH6lXNyIMEVD9j7YralVh4+ArOshpn
	2YikF3BMiqozFeUC1rkyUsYFp4K+qpvWkJQP+AWnJPokTFg1MQ64D5u6bmIOZ+bxdGLwHmSd/CN
	bJcU0nRuAUK8KEACKE8cday5jfBh33KfdJTB+SK7lnRvedPpdUs5KruTdnmhT8zF2AuAdCIsRlW
	WGJvjcS2ARy3WLnFOX8jBlNjc2APvvWNtSim2Q5NPHRNObcSzufwy0B+zcC1wZ9LNwF/P8nh7wd
	nTbHY9VAMPecfhP7nSSN8mq4xmlSoJbQNB115HRocnLZ6W6cjC/EjYhR2cj99iKb6RWbNvQDgdL
	jVJtr5JGa2FFPyvGec7Oj6CKj5CzPZWjTRhbKf9Cj2RRc2R6ypAHN8w2i63TCFVYd5Sgbo1jrGT
	nHBb95C2OjPliUhN8+IL50/EuIl21MHNpyzCwk24u0DZ3n6ZZg
X-Google-Smtp-Source: AGHT+IFydlOfpCnKR9VufncmWtvjYu+XtXQdZECZHYggeddC66GA34mqgt9n/+zwSgXkVaNsAPZsLA==
X-Received: by 2002:a05:6122:c86:b0:55b:f45:1874 with SMTP id 71dfb90a1353d-56347fe43eemr3894630e0c.11.1767983972074;
        Fri, 09 Jan 2026 10:39:32 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5636dc36a20sm1368664e0c.13.2026.01.09.10.39.31
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 10:39:31 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5eeaae0289bso1020820137.2
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 10:39:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXp8GwGIOST7pSQuMqngsYuJxZI7YWKtgLUKG+gX2NMnTYd56EOhZkwSmBMIYgY3wccXOwwX7TkJfI=@vger.kernel.org
X-Received: by 2002:a05:6102:26cb:b0:5e5:5ed7:60ae with SMTP id
 ada2fe7eead31-5ecb6900d02mr4442716137.31.1767983970833; Fri, 09 Jan 2026
 10:39:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com> <679042b205b9596b79463b89c31d9e3f74cd0e63.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <679042b205b9596b79463b89c31d9e3f74cd0e63.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 19:39:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUt=yQwGw3sgQ9gBhOEa6TWW59srEE69dyzr+Fq6j+=Yw@mail.gmail.com>
X-Gm-Features: AZwV_Qj05tdYznd7IbXD-D9LpPaUhjdHWee49H2zOy9lEKLzWfR8oEQJBva10AA
Message-ID: <CAMuHMdUt=yQwGw3sgQ9gBhOEa6TWW59srEE69dyzr+Fq6j+=Yw@mail.gmail.com>
Subject: Re: [PATCH 08/22] clk: renesas: r9a09g047: Add support for LCDC{0,1}
 clocks and resets
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
> Add LCDC{0,1} clocks and resets entries to the r9a09g047 CPG driver.
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
