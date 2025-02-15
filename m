Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BB11442F3
	for <linux-clk@vger.kernel.org>; Sat, 15 Feb 2025 13:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739627757; cv=none; b=awB3CuJLcwM3i8N7ysy/SFolneV295otxROn0wAi5ePdmT/ZbkpegEer0yT6StSZrED2ZeMW5CTmxrj+r4p8Md0M1+Ui8tzhLW0dyf+arCJXu0pby8/KmQQhY97O+eN8Eg3bVIpvi9ePrRHFjamLZMGpojfbNeUySryIea/n4yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739627757; c=relaxed/simple;
	bh=ynQRGmv0k2LHJILsKLHBzXzaTuyPYqreNIxN9MimNAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cI5iqjCcknQkajxg+sG1+nuwesOM2HnxEtPJ4D09enNo1pgxhftfWbTrumCCdO5u7DTYRY74dT0DgN/W/1tjEa8t1azrC3NuwK0J7aw1tZY7DJ/lzHuz+hj11Ur7RftLYkDF/xqvRIXwCvHTAqvEX9t12HDHCT2XVZBf9wnNz+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=a3M0S/pu; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="a3M0S/pu"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5dee07e51aaso3169558a12.3
        for <linux-clk@vger.kernel.org>; Sat, 15 Feb 2025 05:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739627754; x=1740232554; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ip35XfUe0PCV8P/WbBPAmeZvVqMfUDUUb94mizXHroE=;
        b=a3M0S/puKA9s5+jkPRpNMfF5c4AExwu9rvdiH4JolodtkWOWuXQrX9X7nuHYHZM4m2
         aUy+q8L0YQR8VVB2tzxna85AxYgKpnQBRe0l6zo2ILvlvSfahx+dUm26K7H2WS/dS0EP
         t7I+Gkc0V6twOFMZBnYvfH6cuc6gGywhECf0zpftwxg5K1sX57tfimXvArkDZkt4BvY2
         OoCTu6hck6N7EyTYhT9pgJvq9/MrM7oHaeVpS8UgmVmDwhwJbT+k3DcTzY4cav0KIx/b
         e5wRJd6WigWbFqGL3sAuMqVFDn5BYdG+QIE2eTd2jubHUy0hHoa8XXEEr5TfiqVHo3EH
         x7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739627754; x=1740232554;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ip35XfUe0PCV8P/WbBPAmeZvVqMfUDUUb94mizXHroE=;
        b=uk4beVxtTJy6oeAng6d8ImXN+4eErtX9QeG8HUznL3dKD9tqwFhtvq6fRb0anYKvPL
         ZGMh5BoEdqm0fVvj6st/4J7nX/Fxg3+2ldbG26U3hCKLKwykoNog27KuCMYRC45xc4c8
         OeFq2Q4lCd4IM2eSU+P78tGyyZ8JiC6LG6Hvp8/StZyL2uCtPf9NHlko3EP+FW6+sAKm
         o+2ks9CRU7D3742EOdqDX4r/sXGYuqNaSjuyPWgJIABXDfkYhYNV6IRlBoVWW2F3dyiV
         rA8TNa5PIqXqAM1frA4S7Wz5P76maqPGGh2T7HNQTp0LZG7+VWGlpXLJfLgl+t9UlMhE
         4xVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkpxPgEoVXquPCgSSWb94u1znO7ppPzHdV6pt2cYYWhz3CURAka6J7oT03V3p+hsh7zijXSwzhen8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi8npLOgqj+ReWQ7Kumk9gqtkSb3ib3//PHQV+YQtRh6b1rn1N
	rpuBtF7zHmVisjvfBp0XiazYvuE6jOzQZzAf6z1DC7J75znvzdi3sDvbUgLS7qA=
X-Gm-Gg: ASbGncu5FVPqSg3APttQmw2Y/u5qIxdqKizOvzxiGSJPDSK+7FJGUiDcxjlmYP0LiTW
	Uvmy500/osBJLhvsuGpax8hykMAQqq8Cuso0X2NzgOQDEBN8XlWj2vCKASwdbikegSoS8WDErRT
	06CQcr+01vgul1Bv9he/ZG2MhrNAfSXCLhsshE+v9KGryYc+z+S/WR6alz+A5mzqeSXvywMgzr8
	A7Cm5LQ/zOEXU4okuxUyjbPJ1HCxxolYN28Jmj+gUWIyOga4m/L9S2qdcyZHSaWAzX5BktC20xy
	EMAx+g/SwVpxCQc9ftA7t/te
X-Google-Smtp-Source: AGHT+IHKDmH405xdj0jPJHIKuZ0K0kF6FFhjrC1+AWHo4C3rQtUztDXAnjVwRXBOlB15UUxyrtHq7g==
X-Received: by 2002:a17:907:7209:b0:ab7:b589:4f9e with SMTP id a640c23a62f3a-abb70de294cmr262384866b.39.1739627754103;
        Sat, 15 Feb 2025 05:55:54 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.173])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba533bce23sm532277766b.161.2025.02.15.05.55.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Feb 2025 05:55:53 -0800 (PST)
Message-ID: <ed953445-9c55-4658-af16-04eaa71d746e@tuxon.dev>
Date: Sat, 15 Feb 2025 15:55:51 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] clk: Overwrite clk_hw::init with NULL during
 clk_register()
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Doug Anderson <dianders@chromium.org>
References: <20190731193517.237136-1-sboyd@kernel.org>
 <20190731193517.237136-10-sboyd@kernel.org>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20190731193517.237136-10-sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Stephen,

On 31.07.2019 22:35, Stephen Boyd wrote:
> We don't want clk provider drivers to use the init structure after clk
> registration time, but we leave a dangling reference to it by means of
> clk_hw::init. Let's overwrite the member with NULL during clk_register()
> so that this can't be used anymore after registration time.
> 
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---
> 
> Please ack so I can take this through clk tree
> 
>  drivers/clk/clk.c            | 24 ++++++++++++++++--------
>  include/linux/clk-provider.h |  3 ++-
>  2 files changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index c0990703ce54..efac620264a2 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -3484,9 +3484,9 @@ static int clk_cpy_name(const char **dst_p, const char *src, bool must_exist)
>  	return 0;
>  }
>  
> -static int clk_core_populate_parent_map(struct clk_core *core)
> +static int clk_core_populate_parent_map(struct clk_core *core,
> +					const struct clk_init_data *init)
>  {
> -	const struct clk_init_data *init = core->hw->init;
>  	u8 num_parents = init->num_parents;
>  	const char * const *parent_names = init->parent_names;
>  	const struct clk_hw **parent_hws = init->parent_hws;
> @@ -3566,6 +3566,14 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
>  {
>  	int ret;
>  	struct clk_core *core;
> +	const struct clk_init_data *init = hw->init;
> +
> +	/*
> +	 * The init data is not supposed to be used outside of registration path.
> +	 * Set it to NULL so that provider drivers can't use it either and so that
> +	 * we catch use of hw->init early on in the core.
> +	 */
> +	hw->init = NULL;

I found that this line impact the drivers/clk/clk-versaclock3.c driver when
doing unbind/bind. The driver provides statically initialized hw.init
object for registration, the hw.init pointers are set to NULL after clock
registrations then the next registration (when re-binding) fails.

In the driver probe the clock are registered like:

	for (i = 0; i < ARRAY_SIZE(clk_pfd_mux); i++) {
		clk_pfd_mux[i].regmap = regmap;
		ret = devm_clk_hw_register(dev, &clk_pfd_mux[i].hw);
		if (ret)
			return dev_err_probe(dev, ret, "%s failed\n",
					     clk_pfd_mux[i].hw.init->name);
	}

and entries in clk_pfd_mux[] are like:

static struct vc3_hw_data clk_pfd_mux[] = {
	[VC3_PFD2_MUX] = {
		.data = &(struct vc3_clk_data) {
			.offs = VC3_PLL_OP_CTRL,
			.bitmsk = BIT(VC3_PLL_OP_CTRL_PLL2_REFIN_SEL)
		},
		.hw.init = &(struct clk_init_data) {
			.name = "pfd2_mux",
			.ops = &vc3_pfd_mux_ops,
			.parent_data = pfd_mux_parent_data,
			.num_parents = 2,
			.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT
		}
	},

// ...

};

I tried with the following diff, too:

diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
index 9fe27dace111..c1776c313e9b 100644
--- a/drivers/clk/clk-versaclock3.c
+++ b/drivers/clk/clk-versaclock3.c
@@ -1022,10 +1022,11 @@ static int vc3_probe(struct i2c_client *client)
        /* Register pfd muxes */
        for (i = 0; i < ARRAY_SIZE(clk_pfd_mux); i++) {
                clk_pfd_mux[i].regmap = regmap;
+               pr_err("%s(): hw init=%08x\n", __func__,
clk_pfd_mux[i].hw.init);
                ret = devm_clk_hw_register(dev, &clk_pfd_mux[i].hw);
                if (ret)
                        return dev_err_probe(dev, ret, "%s failed\n",
-                                            clk_pfd_mux[i].hw.init->name);
+                                            "test");
//clk_pfd_mux[i].hw.init->name);
        }

        /* Register pfd's */
@@ -1034,7 +1035,7 @@ static int vc3_probe(struct i2c_client *client)
                ret = devm_clk_hw_register(dev, &clk_pfd[i].hw);
                if (ret)
                        return dev_err_probe(dev, ret, "%s failed\n",
-                                            clk_pfd[i].hw.init->name);
+                                            "test");
//clk_pfd[i].hw.init->name);
        }

        data = i2c_get_match_data(client);
@@ -1050,7 +1051,7 @@ static int vc3_probe(struct i2c_client *client)
                ret = devm_clk_hw_register(dev, &clk_pll[i].hw);
                if (ret)
                        return dev_err_probe(dev, ret, "%s failed\n",
-                                            clk_pll[i].hw.init->name);
+                                            "test");
//clk_pll[i].hw.init->name);
        }

        /* Register divider muxes */
@@ -1059,7 +1060,7 @@ static int vc3_probe(struct i2c_client *client)
                ret = devm_clk_hw_register(dev, &clk_div_mux[i].hw);
                if (ret)
                        return dev_err_probe(dev, ret, "%s failed\n",
-                                            clk_div_mux[i].hw.init->name);
+
"test");//clk_div_mux[i].hw.init->name);
        }

        /* Register dividers */
@@ -1068,7 +1069,7 @@ static int vc3_probe(struct i2c_client *client)
                ret = devm_clk_hw_register(dev, &clk_div[i].hw);
                if (ret)
                        return dev_err_probe(dev, ret, "%s failed\n",
-                                            clk_div[i].hw.init->name);
+                                            "test");
//clk_div[i].hw.init->name);
        }

        /* Register clk muxes */
@@ -1082,7 +1083,7 @@ static int vc3_probe(struct i2c_client *client)
                ret = devm_clk_hw_register(dev, &clk_mux[i].hw);
                if (ret)
                        return dev_err_probe(dev, ret, "%s failed\n",
-                                            clk_mux[i].hw.init->name);
+
"test");//clk_mux[i].hw.init->name);
        }

        /* Register clk outputs */

Can you please let me know if this is a wrong pattern? I noticed there are
other drivers following similar approach, e.g.:
- drivers/clk/clk-axm5516.c
- drivers/clk/qcom/camcc-sm6350.c
- drivers/clk/meson/c3-pll.c

Full console log with my trials can be found here:
https://p.fr33tux.org/9d976f

Thank you,
Claudiu
