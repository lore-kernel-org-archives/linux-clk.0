Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE251EEE6
	for <linux-clk@vger.kernel.org>; Mon, 29 Dec 2025 10:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767003549; cv=none; b=j91lfHyONTlqanbpxx8qy77tM7ZX6acgRs2ht8eABHs4klnt9n6MUUHadzIEWRfOEV/JTDTmMaHoChPN/D+WwxfbMntgp4Kzb/yG0J69nmjo68fBkZYQyJLoHapLsHmbP84M4VtjcRRXIZh7mp+lORI3QfH7SV9WZ/eL5G05bT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767003549; c=relaxed/simple;
	bh=wOvZYVr1Xmht+qg4N/eWC1Dqx8L6NJMYCGXov6tSwow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iSlUSZo9VYUlebpgLTS0zPn0q1lNIir90ZM37KtCPjGZDmshrDvtmiCXn6eXtTA+O8IOpF1Af/K+es7deQc2xndaEaM7HESaE4UIUluVkGa4lDLb2OzoC0xmRKZvkLH6o939VU0dqAMVFVS6lFuCUNw6ughq5JUNxOm6fGI1TJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-55b09d690dcso3116371e0c.1
        for <linux-clk@vger.kernel.org>; Mon, 29 Dec 2025 02:19:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767003545; x=1767608345;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEHua9B0eiJ9krPOOGN9l1YijNcHX4oQExQFKvr6EFA=;
        b=bAHqlGje0SWwu3pKr8OmDD+x60rTjVV2PbIahsWA2G8ZTJGFYlyS6tkypW52GtdypF
         mh7FE2eOd4fA3ctUDPf2ebHw7Ja0SwjksJ4waALzZlqirW6YTlTEJiS+UOVHtIdvMnli
         I0nHHrqa9ET40wUY3sYZtMiMaHmcU3iV4VycPAhB4rCuJQH5AaUwHB8naLGptvjfkBgp
         /nRApQgVBEeWLWDEEawCJ4wiLxe3r+p0voEBI6i0hbVn8084XRSHfckbzd97c76EZNBp
         J/H/5kz2X3i3wg9uI97tMSW5YKm+ppuB8nyH0AtxQfjRjbDnDzlMP3FlclSSQ0KOBuhB
         NfVw==
X-Forwarded-Encrypted: i=1; AJvYcCWjweHqALtd5MqYUkxvR6jSbfUQuCLzV2RtYPspuwoZtP4IUgBnRB4OwoZmGoYJ6T9u/ROqjmWSdaA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIM1N5YNOWEZyfkimsYW6r+4aD9UT7lJJF/x+SWpgv+XbJfdfN
	ZCQgTydYapI6be93RyMFJwNl9gsvxKp+kaTv2QNRUXJaNiJeH7ouU85SgJX9+eNN
X-Gm-Gg: AY/fxX7ROlqJy53dOu24RgFTmvBzNJlHP+dgWWzhbFaErdBtHqhrCgrq0rVo0PvXJya
	BlOj2pfhGeVuPO6m3exACnL8HpF+uK3PLWDWuVNcr5q9cbpl9zZ0ZpxmwVuUMtRcDazL1oxxAts
	HmJ0Abik9djCaUZ1rEDiuZfWm1v3ydv8tfYEm9iGXoxNuuRq/Dx8ORRykvYTUyj5ilvC4LdNK5T
	4x8M7EiEqi0RszVHMuWmIbh5HNXWWaGLTvaXF1Q/ncxddPPUbVN4z2ypn1RjcCi4H+aHLMOrTiW
	dl1eX6Lk7SfAwdlao5t4PpoS8X0Yth2xmc46AcHtwjNjCgN0E6HXe0Pknn5JGfli/g3aCumUd7m
	fX191U/qmxTv0undAfSj3dX3iGFctmmm6oFHaYd7snkVPXgPo/3pEJDB3N+GQJcsR+BGTIn5m41
	f0M8xkQZOL+KnfOCVJNDYFRYWyAy/8N5vaAWWBxkFLFEq4jH2rKJzW
X-Google-Smtp-Source: AGHT+IEpg/I8xfx644VVaBE9975HSKHnI8DyNsPh8QsfXyAUyRtzzEz/jIEHW9ehnFsCEuIWrV8oqg==
X-Received: by 2002:a05:6122:8c0f:b0:55f:e6f5:4794 with SMTP id 71dfb90a1353d-5615bd70f29mr10136067e0c.6.1767003545548;
        Mon, 29 Dec 2025 02:19:05 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5615d1665f2sm9762301e0c.21.2025.12.29.02.19.03
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 02:19:04 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-55b302b8369so7384155e0c.0
        for <linux-clk@vger.kernel.org>; Mon, 29 Dec 2025 02:19:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUC9oZTLnaUR/X1ddChHEfwlzXJLYCdnS2U33CIVVAe8WXySUUk5+2TyGOKPsREjhXe72j/OWTmHBY=@vger.kernel.org
X-Received: by 2002:a05:6122:d85:b0:557:ddc4:dea4 with SMTP id
 71dfb90a1353d-5615bd7150bmr9849393e0c.5.1767003543582; Mon, 29 Dec 2025
 02:19:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com> <20251212-phy-clk-round-rate-v3-9-beae3962f767@redhat.com>
In-Reply-To: <20251212-phy-clk-round-rate-v3-9-beae3962f767@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Dec 2025 11:18:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXudWW3MPKqP0-d+DyMNRF-X62oyHRnj=MM_9MSpJw6sw@mail.gmail.com>
X-Gm-Features: AQt7F2rKWfaXfoMj8qssy3Tj3BKKzf9SWfuNGXkoZ2xYV04eFqP8YoD995Ts3mk
Message-ID: <CAMuHMdXudWW3MPKqP0-d+DyMNRF-X62oyHRnj=MM_9MSpJw6sw@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] phy: ti: phy-j721e-wiz: convert from round_rate()
 to determine_rate()
To: Brian Masney <bmasney@redhat.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Heiko Stuebner <heiko@sntech.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

On Fri, 12 Dec 2025 at 00:21, Brian Masney <bmasney@redhat.com> wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Thanks for your patch, which is now commit 27287e3b52b5954b ("phy:
ti: phy-j721e-wiz: convert from round_rate() to determine_rate()")
in phy/next

> --- a/drivers/phy/ti/phy-j721e-wiz.c
> +++ b/drivers/phy/ti/phy-j721e-wiz.c
> @@ -934,12 +934,15 @@ static unsigned long wiz_clk_div_recalc_rate(struct clk_hw *hw,
>         return divider_recalc_rate(hw, parent_rate, val, div->table, 0x0, 2);
>  }
>
> -static long wiz_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
> -                                  unsigned long *prate)
> +static int wiz_clk_div_determine_rate(struct clk_hw *hw,
> +                                     struct clk_rate_request *req)
>  {
>         struct wiz_clk_divider *div = to_wiz_clk_div(hw);
>
> -       return divider_round_rate(hw, rate, prate, div->table, 2, 0x0);
> +       req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
> +                                      div->table, 2, 0x0);

Is this correct?  divider_round_rate() can return a negative error code
(from divider_ro_determine_rate()), which is not handled here?

Looks like several other users of divider_round_rate() use this
same logic, and thus are affected, too.

> +
> +       return 0;
>  }
>
>  static int wiz_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
