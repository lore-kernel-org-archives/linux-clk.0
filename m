Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA9A22D4F9
	for <linux-clk@vger.kernel.org>; Fri, 14 Feb 2025 09:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739524106; cv=none; b=QqjtVWESlrgDVDX5JMmXTbOjU9SFK+QpadxlDv9sqWjtjhV5MLgbvWEe6VUtAeLMPE3MvQDZC5NYCUdChDtjeKETcmxQSTDpG9qH2TeHBgyDXZGuuwkSasFFcTDiTK0jlbOwTUFqu/Lkreo3gZ8alK0TFMwjY0Ewhz4+gellXvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739524106; c=relaxed/simple;
	bh=S/KKmbMokH0GSXh6+xn2Xwon8nvwaj8CZLF3bojbyFQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NbiZZRzIRE156gPHZUZPe4AUi5/jR4W8jhWTzY29auhrVaRuyiDVSOv9K7QBMvCYh6tRVwEoIAt0egk0MUDn/a5ZeUfCBCDhpbdsxlLKEoZE9Gs9KnXN6gP8oLbSDzjwpRw7wvr6B8yueqVjoa3moYK2f59OeF0QyTS0RY8nCxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=g21e2qMc; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="g21e2qMc"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38f22fe8762so884126f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 14 Feb 2025 01:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739524102; x=1740128902; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FRBZ9LnljeKdyPrMlrMbswWuQjbGiHO54rQVeWsI8fs=;
        b=g21e2qMcOnjxZ30r+2Yz/IFN7l24CJ6jquAM+mcJDV+f1PvNYP+Om9UUeRFLd1bqaG
         UJSkxCtfNzv0Ol0tXutTTCCfzAlu9PMysmfVdu1chudjTcmAwyOUXkcOVnd5bzE+GD3O
         wOBDLLtIbnup6OVo/IzYN+Xu6qAywnsUE2klhzoHpq7M7bB6Kr5TNzypWrMoFBCYpg8M
         a8wDmi4Sji3Y0X3K3LwqIazymSo7cTLXITUxQu9Kc02DnzL7z4HpbWkW4BVGckB95GME
         KZ2JPO35slYaxC5vOQeCZcSrWOJIoi37aHQYZ2v6hPnBVYGp5vuwlcFdh6Jou9TUq8Wj
         keKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739524102; x=1740128902;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRBZ9LnljeKdyPrMlrMbswWuQjbGiHO54rQVeWsI8fs=;
        b=VnO+b08kfyLLoS2mdX2l0oyEhLnaWJi23I1eKK/gqVLmorARRI4jAk6HNWhBq4n8+R
         BNjFPwwOaig15F61HLWQPlEw74cWbnb5ho0bd0ID67eENSR8LXQBA7vETAxMt7lyy61Q
         bPrFcqtxyKc2zVk3WW4tpxCnXDM5dv90+o2xO5DL4FlXhIlhuJaNvK5PYgEnaB74qg3c
         ZSCXo6sqoXoKEfO68lwWvDWcBnq7WBfbNywNVRM2J/xA7S6i6Z2GIAvbc+d7SYyhygGT
         GtIxdhn8kLSPkLi23x/Bu0o9sLa8j6SVkyqwvfTr/CJsbn57M6X2WOD0muoxF7mAK4Pz
         NDnA==
X-Forwarded-Encrypted: i=1; AJvYcCX58Mf25HAPzHRsYvYzYSlQQLtlovFBH/Tel+F0YvXFJrM/65eP3YoOIrrUF7Iaqqi/ywQH3fB7Ldo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4iMdjBMs4JdTqVGqsddLcpzOwRZKWBob12/BqOAemBwWQ621L
	1iveNZDUu7jHPfb8dbrt7VwxATyIW7Ovy1Bfjnwvtx5FsICBFmjLqE6ggqOoHuHlDbOGD9naPMZ
	CXLY=
X-Gm-Gg: ASbGncsHh2CW/R5pWTwkcKRsu5WWhHwqyXcC/5Zvto8rK4+o8HLMi4ELpZkvAzLX9yo
	2d7L1zvSejkASHndkiOOPIGU5j0KnK521YD/pYiNgmp3KHL1GhxuWN92vVUyr84WFlC4jKxhQnL
	IXCWDMOkSOePx3lpa+PibQhIQxPDbBQWnYYfqY6XfuuyN17TdMHjV6a7Y/XAYH/ozqRrib7oGy+
	WtmB55OvaDARnFy3H62kA+SfjTjC5NqR8n1I90O1MBoDI4JquHhAlyC4VNlXCEm6d/gx+GDX6X9
	/XcuGZ0k/uUcjH4=
X-Google-Smtp-Source: AGHT+IE0/rSxXHcT0d8T4npVkX/xeGrYvHZ7lAWe+eAfluyBR05NqZXCHJQG0OjEOL1oPVBXgPrHSg==
X-Received: by 2002:a05:6000:18a4:b0:38f:3009:61d7 with SMTP id ffacd0b85a97d-38f30096396mr623237f8f.4.1739524100676;
        Fri, 14 Feb 2025 01:08:20 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:baa6:bc65:b9db:3759])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38f259d8dd6sm4117993f8f.62.2025.02.14.01.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 01:08:20 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martijn van Deventer <linux@martijnvandeventer.nl>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: meson: g12a: Fix kernel warnings when no display
 attached
In-Reply-To: <20250213221702.606-1-linux@martijnvandeventer.nl> (Martijn van
	Deventer's message of "Thu, 13 Feb 2025 23:17:01 +0100")
References: <20250213221702.606-1-linux@martijnvandeventer.nl>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 14 Feb 2025 10:08:19 +0100
Message-ID: <1jpljkzyf0.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 13 Feb 2025 at 23:17, Martijn van Deventer <linux@martijnvandeventer.nl> wrote:

> When booting SM1 or G12A boards without a dislay attached to HDMI,
> the kernel shows the following warning:
>
> [CRTC:46:meson_crtc] vblank wait timed out
> WARNING: CPU: 2 PID: 265 at drivers/gpu/drm/drm_atomic_helper.c:1682 drm_atomic_helper_wait_for_vblanks.part.0+0x240/0x264
> CPU: 2 UID: 0 PID: 265 Comm: setfont Tainted: G         C
> Tainted: [C]=CRAP
> pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : drm_atomic_helper_wait_for_vblanks.part.0+0x240/0x264
> lr : drm_atomic_helper_wait_for_vblanks.part.0+0x240/0x264
> Call trace:
>  drm_atomic_helper_wait_for_vblanks.part.0+0x240/0x264
>  drm_atomic_helper_commit_tail_rpm+0x84/0xa0
>  commit_tail+0xa4/0x18c
>  drm_atomic_helper_commit+0x164/0x178
>  drm_atomic_commit+0xb4/0xec
>  drm_client_modeset_commit_atomic+0x210/0x270
>  drm_client_modeset_commit_locked+0x5c/0x188
>  drm_fb_helper_pan_display+0xb8/0x1d4
>  fb_pan_display+0x7c/0x120
>  bit_update_start+0x20/0x48
>  fbcon_switch+0x418/0x54c
>  el0t_64_sync+0x194/0x198
>
> This happens when the kernel disables the unused clocks.
> Sometimes this causes the boot to hang.
>
> By (re)adding the flag CLK_IGNORE_UNUSED to the VCLK2 clocks, these
> clocks will not be disabled.
>
> This partially reverts commit b70cb1a21a54 ("clk: meson: g12a:
> make VCLK2 and ENCL clock path configurable by CCF").

It looks like DRM needs those clock enabled regardless of connection
status on HDMI. Even with this change applied, you would get the same
problem again if the bootloader does not take of turning the clock on,
which is not a given.

CLK_IGNORE_UNUSED gives not guarantee a clock will be enabled or stay
enabled at any point.

A proper fix to this issue should be done in DRM, IMO.

>
> Fixes: b70cb1a21a54 ("clk: meson: g12a: make VCLK2 and ENCL clock path configurable by CCF").
> Signed-off-by: Martijn van Deventer <linux@martijnvandeventer.nl>
> ---
>  drivers/clk/meson/g12a.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index cfffd434e998..1651898658f5 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -3234,7 +3234,7 @@ static struct clk_regmap g12a_vclk2_div = {
>  			&g12a_vclk2_input.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_GATE,
> +		.flags = CLK_SET_RATE_GATE | CLK_IGNORE_UNUSED,
>  	},
>  };
>  
> @@ -3270,7 +3270,7 @@ static struct clk_regmap g12a_vclk2 = {
>  		.ops = &meson_vclk_gate_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2_div.hw },
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>  	},
>  };
>  
> @@ -3354,7 +3354,7 @@ static struct clk_regmap g12a_vclk2_div1 = {
>  		.ops = &clk_regmap_gate_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>  	},
>  };
>  
> @@ -3368,7 +3368,7 @@ static struct clk_regmap g12a_vclk2_div2_en = {
>  		.ops = &clk_regmap_gate_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>  	},
>  };
>  
> @@ -3382,7 +3382,7 @@ static struct clk_regmap g12a_vclk2_div4_en = {
>  		.ops = &clk_regmap_gate_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>  	},
>  };
>  
> @@ -3396,7 +3396,7 @@ static struct clk_regmap g12a_vclk2_div6_en = {
>  		.ops = &clk_regmap_gate_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>  	},
>  };

-- 
Jerome
