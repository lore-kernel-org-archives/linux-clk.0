Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E53920D51B
	for <linux-clk@vger.kernel.org>; Tue, 12 Nov 2024 08:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731400633; cv=none; b=SNmAuWYvKCTF/X15u1D3hkUW+y62uXdvEnSnf3Pnwc6JeEe4l7iW566mkEsydNOzCxYLu7j0uBmyegOK1GZN2m2ixb97EQ4oZoQwend53vpk7tny/ILBeJr5qxQ5xeRCjcZIqxzdS4USOR4RmQ1YrrvYeEehedghK3PQwlYWyec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731400633; c=relaxed/simple;
	bh=cygnrUq9k3e5dqDZepXwtHPhJI5XV7QYArniw2Y4IuY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SPZi79/VNELkAN08O32M/qYaJaFBF5RociNpY65rQBZ9A75y2TIbFI8nIsm3Fs6uiY4SpRieh759/cmcZZ7NquOKBOJqwYjTtLo0B/C01xGHncQyIGfMnY7zDGiBu5IL4+yGBGE8p+PsJDgYLBVJHO/T8SWCFJet5ndMGJjHSSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=XMCBjQUU; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XMCBjQUU"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-431688d5127so42411225e9.0
        for <linux-clk@vger.kernel.org>; Tue, 12 Nov 2024 00:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731400630; x=1732005430; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QlQtebEgB86dVhqxQ00g8xwqSY7KjW1J9erC3DabT68=;
        b=XMCBjQUUZrseYqt7P6vEKxQiXrcp/5SvHsvWzTBVBJIBUj8jDKZpCGic3DRdHC0nCv
         GnDkhfHUUrnc1ymPPAcimYiSs8+pFnt47EmddkiKWffWXIPGIUSv9KReDbXad7g+iTO3
         clN6JX10NgYCMsg13Qy1Doax5COvk2VSaYu6jMh7dtqDVy2h9RIhsx3YH+kUInt0jcBb
         b1n43FcO2HJg48rBbO6YDYQPvU0ie+muSrG7DbHaGa2vp39JyuFJacr7ogKke9PP99RZ
         DvV3jq75hAof1Dvwt+pEebPxSgiEohz20VxCi7wejCmhs+qDZun8VjxGX6r8GN2ugfiO
         sTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731400630; x=1732005430;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QlQtebEgB86dVhqxQ00g8xwqSY7KjW1J9erC3DabT68=;
        b=IMsraVzcDxLWlSQTBH/LGZObKpgtzjcYMn+9oVKSpevW32IFmWc4xltcVanMJCT4+X
         O4qv7R9aoUUErvtCkYKKQPv0SvNChfyZxUuFOjd15BX38LCwSr5zuV3KLG75Y4r+zhRP
         WXMY1q2kg5cqwLjx/s1xDAE/jvalGFtQY1DjutFQfe97to6NjFHgPuJLrFRhwUW2Okbi
         ptLKQ37WFnryyPUC8uR4DLKH56KIVdMT3YlWaRH9b/IvvQM9nbannfyiWssUP+VEFlVx
         q235uEGkgMfI5hsXnpeX71i6UxKu4l9sWEvLnAAKkjywMgEpxCYW7qK8ncRC8ISYsTrl
         I/3A==
X-Forwarded-Encrypted: i=1; AJvYcCXuQ7DyTkZdpCtvUbWfbuxA0nosR1zoBkUCAvuoiCAKJauJ+ATx+S8d/raQMSFGOp9t0yhdmjfqjwU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7bt67QbnctFF8nLyymDoC1RmSu1rzy+BQZBAqDpAwMmRQOMuj
	tCTvlopbJw4oejqY2prcT7HzfDVZ5jVOzE8sJFr2h0P1yYmrGfe5AnC+idz+p2s=
X-Google-Smtp-Source: AGHT+IFzDHkJMsiPY/G7pxE8S7GTZggldEzwx+YMOP/7/uY3NLuy5dZgZ2YEbvlJHaRdqr51oMUYZw==
X-Received: by 2002:a05:600c:3b82:b0:431:50fa:89c4 with SMTP id 5b1f17b1804b1-432b74fdef5mr135892675e9.3.1731400629260;
        Tue, 12 Nov 2024 00:37:09 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:50f9:1df6:c2b9:a468])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa73a2d8sm232645355e9.41.2024.11.12.00.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 00:37:08 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin
 Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] clk: meson: Fix glitch occurs when setting up
 glitch-free mux
In-Reply-To: <20241111-fix_glitch_free-v2-3-0099fd9ad3e5@amlogic.com> (Chuan
	Liu via's message of "Mon, 11 Nov 2024 11:37:03 +0800")
References: <20241111-fix_glitch_free-v2-0-0099fd9ad3e5@amlogic.com>
	<20241111-fix_glitch_free-v2-3-0099fd9ad3e5@amlogic.com>
Date: Tue, 12 Nov 2024 09:37:08 +0100
Message-ID: <1jzfm426h7.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon 11 Nov 2024 at 11:37, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> From: Chuan Liu <chuan.liu@amlogic.com>
>
> glitch-free mux has two clock channels (channel 0 and channel 1) with
> the same configuration. When the frequency needs to be changed, the two
> channels ping-pong to ensure clock continuity and suppress glitch.
>
> The glitch-free mux configuration with CLK_SET_RATE_GATE enables the mux
> to perform ping-pong switching to suppress glitches.
>
> Fixes: 84af914404db ("clk: meson: a1: add Amlogic A1 Peripherals clock
> controller driver")
> Fixes: 14ebb3154b8f ("clk: meson: axg: add Video Clocks")
> Fixes: f06ac3ed04e8 ("clk: meson: c3: add c3 clock peripherals controller
> driver")
> Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
> Fixes: fac9a55b66c9 ("clk: meson-gxbb: Add MALI clocks")
> Fixes: 57b55c76aaf1 ("clk: meson: S4: add support for Amlogic S4 SoC
> peripheral clock controller")

Same remarks.

> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/clk/meson/a1-peripherals.c |  8 ++++----
>  drivers/clk/meson/axg.c            | 12 ++++++++----
>  drivers/clk/meson/c3-peripherals.c |  4 ++--
>  drivers/clk/meson/g12a.c           | 12 ++++++++----
>  drivers/clk/meson/gxbb.c           | 12 ++++++++----
>  drivers/clk/meson/s4-peripherals.c | 20 ++++++++++----------
>  6 files changed, 40 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/clk/meson/a1-peripherals.c b/drivers/clk/meson/a1-peripherals.c
> index 4b9686916b17..7f515e002adb 100644
> --- a/drivers/clk/meson/a1-peripherals.c
> +++ b/drivers/clk/meson/a1-peripherals.c
> @@ -423,7 +423,7 @@ static struct clk_regmap dspa_a = {
>  			&dspa_a_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -471,7 +471,7 @@ static struct clk_regmap dspa_b = {
>  			&dspa_b_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -569,7 +569,7 @@ static struct clk_regmap dspb_a = {
>  			&dspb_a_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -617,7 +617,7 @@ static struct clk_regmap dspb_b = {
>  			&dspb_b_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>  	},
>  };
>  
> diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
> index a1217dff40fa..e2d3266f4b45 100644
> --- a/drivers/clk/meson/axg.c
> +++ b/drivers/clk/meson/axg.c
> @@ -1077,7 +1077,8 @@ static struct clk_regmap axg_vpu_0 = {
>  		 * We want to avoid CCF to disable the VPU clock if
>  		 * display has been set by Bootloader
>  		 */
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED |
> +			 CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -1126,7 +1127,8 @@ static struct clk_regmap axg_vpu_1 = {
>  		 * We want to avoid CCF to disable the VPU clock if
>  		 * display has been set by Bootloader
>  		 */
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED |
> +			 CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -1194,7 +1196,8 @@ static struct clk_regmap axg_vapb_0 = {
>  			&axg_vapb_0_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED |
> +			 CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -1242,7 +1245,8 @@ static struct clk_regmap axg_vapb_1 = {
>  			&axg_vapb_1_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED |
> +			 CLK_SET_RATE_GATE,
>  	},
>  };
>  
> diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
> index 4566c2aeeb19..27343a73a521 100644
> --- a/drivers/clk/meson/c3-peripherals.c
> +++ b/drivers/clk/meson/c3-peripherals.c
> @@ -1364,7 +1364,7 @@ static struct clk_regmap hcodec_0 = {
>  			&hcodec_0_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -1411,7 +1411,7 @@ static struct clk_regmap hcodec_1 = {
>  			&hcodec_1_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>  	},
>  };
>  
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index 4d3b064d09fc..21a25001e904 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -2746,7 +2746,8 @@ static struct clk_regmap g12a_vpu_0 = {
>  		.ops = &clk_regmap_gate_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &g12a_vpu_0_div.hw },
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED |
> +			 CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -2790,7 +2791,8 @@ static struct clk_regmap g12a_vpu_1 = {
>  		.ops = &clk_regmap_gate_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &g12a_vpu_1_div.hw },
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED |
> +			 CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -3035,7 +3037,8 @@ static struct clk_regmap g12a_vapb_0 = {
>  			&g12a_vapb_0_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED |
> +			 CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -3083,7 +3086,8 @@ static struct clk_regmap g12a_vapb_1 = {
>  			&g12a_vapb_1_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED |
> +			 CLK_SET_RATE_GATE,
>  	},
>  };
>  
> diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
> index dfa9ffc61b41..812b3e20c366 100644
> --- a/drivers/clk/meson/gxbb.c
> +++ b/drivers/clk/meson/gxbb.c
> @@ -1543,7 +1543,8 @@ static struct clk_regmap gxbb_vpu_0 = {
>  		.ops = &clk_regmap_gate_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &gxbb_vpu_0_div.hw },
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED |
> +			 CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -1591,7 +1592,8 @@ static struct clk_regmap gxbb_vpu_1 = {
>  		.ops = &clk_regmap_gate_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &gxbb_vpu_1_div.hw },
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED |
> +			 CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -1674,7 +1676,8 @@ static struct clk_regmap gxbb_vapb_0 = {
>  			&gxbb_vapb_0_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED |
> +			 CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -1726,7 +1729,8 @@ static struct clk_regmap gxbb_vapb_1 = {
>  			&gxbb_vapb_1_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED |
> +			 CLK_SET_RATE_GATE,
>  	},
>  };
>  
> diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
> index 79e0240d58e6..cf10be40141d 100644
> --- a/drivers/clk/meson/s4-peripherals.c
> +++ b/drivers/clk/meson/s4-peripherals.c
> @@ -1466,7 +1466,7 @@ static struct clk_regmap s4_vdec_p0 = {
>  			&s4_vdec_p0_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -1516,7 +1516,7 @@ static struct clk_regmap s4_vdec_p1 = {
>  			&s4_vdec_p1_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -1586,7 +1586,7 @@ static struct clk_regmap s4_hevcf_p0 = {
>  			&s4_hevcf_p0_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -1636,7 +1636,7 @@ static struct clk_regmap s4_hevcf_p1 = {
>  			&s4_hevcf_p1_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -1712,7 +1712,7 @@ static struct clk_regmap s4_vpu_0 = {
>  		.ops = &clk_regmap_gate_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &s4_vpu_0_div.hw },
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -1756,7 +1756,7 @@ static struct clk_regmap s4_vpu_1 = {
>  		.ops = &clk_regmap_gate_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &s4_vpu_1_div.hw },
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -1921,7 +1921,7 @@ static struct clk_regmap s4_vpu_clkc_p0 = {
>  			&s4_vpu_clkc_p0_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -1969,7 +1969,7 @@ static struct clk_regmap s4_vpu_clkc_p1 = {
>  			&s4_vpu_clkc_p1_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -2049,7 +2049,7 @@ static struct clk_regmap s4_vapb_0 = {
>  			&s4_vapb_0_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -2097,7 +2097,7 @@ static struct clk_regmap s4_vapb_1 = {
>  			&s4_vapb_1_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>  	},
>  };

-- 
Jerome
