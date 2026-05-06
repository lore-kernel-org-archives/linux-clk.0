Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E6B368271
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 07:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778051989; cv=none; b=DVYU3uUw7eBUzmRKSMNI7z5I22PPG0SC1hw1wTwzYflauUaYlTtJkqB9P/Ug2hBcuNVXLeMrWKft7aIfy6pSW7BJWwRMr6ys0MaC8p+lzL8CjAcVWvgRJtM4OUT7/jvmXASxZzzhyXeEJ1ctiHiuomGq0t+x4z0BveUAxdX1D4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778051989; c=relaxed/simple;
	bh=kCaOvIzrUuZaZ9zllpWZlClqzHH+Po6WdcxW6bwXC1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RaOjMTJhg829LK1CoiMfvBXo4dvG5IRJMkQxLxNhzc7o2UMWvVFlM9toVgrOAORimzU74uHs4h5ophCjYelGVwvb1qs4uodR3cs+D5tP7JlUyYf1Uto2IUsmwil9l5xJzIUdfVGG9PVn+Ydn/FbCorURu/q/o6PjEovjcgOuyss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-94de68feaf4so3517083241.0
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 00:19:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778051987; x=1778656787;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFUn+S4/jA9VkVtPTANA9vhies8/mQGo7p0EcziVSIc=;
        b=B2BSkKLSUBgxxT/mhwjkdNCfur1O6nEUGpRyoDLO0Nt4QnPzSt6ZhzxFONaMoymHzA
         rgcd0yw61jDH/+rAD1NP1hI7GY7N/ybozsVYCSdwu9ctiOPKul/Gcax+NTXIq93YfKTg
         8cSMeu8vLNYTJksdSVLLLsPri4a4afCXBORHev+vpagDCVqd069fgbDcUapi4d3wdSSR
         HUe2vdZTSu168jR5Opmwb2TZT5fWJmSaeWkRG0XzIX91M5Wb+RwR6TludR37B8nYUwq4
         UD80vKkDrLZ0JRsnzXIK48QT2775EFzGlDjA5y0j1azult1Hwr7y5le/wEB3VTk7tyR/
         E9aw==
X-Forwarded-Encrypted: i=1; AFNElJ9NCnMDBE0nCY+OOuBTtG3h3+XqSxtetAAL9W2RVc/0XHsAYLYFcy2vJ9+tl1LyInmNXaSl3whQYX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHoTIRGtA4uyfGJzbVn0SyaluHWJ2HAZOPk8b6QmIarMMnov5V
	PDNlxWxp6Baf6X4krD1TgvI6fEK9VEFEwWfaeI7rl/W08WigkA6kaLmSJ9GxaXBN
X-Gm-Gg: AeBDievEywEAfOMYCNiBSxIkJAT82pxO49D92oCip5M2EMHnYyaXLMZJdhjWOgxXxGg
	SeyGGO/sGjtgM1woXR+7lENfBjYmc89ajI7mWA5+Z48VX+Shf9jNsiWuL2NBV7iMtKLEJKvsvcy
	0AKl1bmL1vMaiSFBr+IqtnTHKsfROD8jIapCp4ElNWYSzDEnvZrcR8Jv1gfnvGA2OD/Tnrd9leC
	Yv/X2DN0tcA6kZnZLedGMpunVW0SICCxyNJgL9Hp3yXY9w3QmkAaLSxrNhKBV81EnTyB2LAgU+C
	axn755TGzxTkRf1PamLcjzuYOAzc0zvWzwOu368i4m3g1AzicEJDQk9a6PFPdEu6OtjKvgmVNeK
	Q4HSQEFRJ/CT9bIoCowONc7pYzhv3P0OvkhGDSRoHHI6IO8ZNerdnnAh1gCnC7QxF5rmUajbHTb
	Nb5ZFFXUz8qCOjbYg6wBdI+BCxf0VktS1mWXpEtvmBabtpeC7DKFl2IZawAcqDPX+8mZmhHBw=
X-Received: by 2002:a05:6102:5f08:b0:611:82b:a599 with SMTP id ada2fe7eead31-630f9032649mr818659137.21.1778051986898;
        Wed, 06 May 2026 00:19:46 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-62bfbb75140sm8695092137.5.2026.05.06.00.19.46
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 00:19:46 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-62f33bad185so1930441137.3
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 00:19:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/mzXx0aoUfQWEt5rV5IB00NRu3WglJlGWLzNF5PbD70AEcgWekXJ07cTmGXj2bwTHr+bE9S9Ac2RA=@vger.kernel.org
X-Received: by 2002:a05:6102:5787:b0:62f:3abe:907f with SMTP id
 ada2fe7eead31-630f8e78da2mr845360137.4.1778051985729; Wed, 06 May 2026
 00:19:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com> <20260505-clk-determine-rate-noop-v3-8-f3f829fbacdf@redhat.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-8-f3f829fbacdf@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 May 2026 09:19:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVWBx0Ob8BUWaRzeK_4OEHA1wwhfdPcBSG+jGV7dbbqgw@mail.gmail.com>
X-Gm-Features: AVHnY4LSv9zQeRlq1BPG1reoiAmWUtec3W-OeL3hQqk0PVXd-J0IaxIjKyjNPVs
Message-ID: <CAMuHMdVWBx0Ob8BUWaRzeK_4OEHA1wwhfdPcBSG+jGV7dbbqgw@mail.gmail.com>
Subject: Re: [PATCH v3 08/15] clk: renesas: rzg2l-cpg: use clk_determine_rate_noop()
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 May 2026 at 02:50, Brian Masney <bmasney@redhat.com> wrote:
> Drop the driver-specific empty determine_rate() function and use the new
> shared clk_determine_rate_noop() helper.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
