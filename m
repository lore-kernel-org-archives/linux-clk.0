Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0326D426ECB
	for <linux-clk@vger.kernel.org>; Thu, 14 May 2026 15:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778771611; cv=none; b=Q1wmCuyEqJuzkZUlI+lHcjG/eFyB9xEO79xPYkMT7dDndnPjgEp195CpyIKMW7WwtQJ4gIsjhYSQnjlklRl9NBQKanLS9aasmXQQ8qzLIUdy45eZ2eJ1FYi0CBQlnyKDD4JkM7aYHJCNLmb27YA3s8xYh0+KHgQaap6x38rQ04k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778771611; c=relaxed/simple;
	bh=uMb4ZbSplRAY7kyHR/j0eXA2cPzF5uZsroIjreRVzS4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZCeGlOE/dcQ0uDGm8j8M13n2Cn7Pvv7GheDYGVBnw9qZXH4bhPgibP9OiHX755TrTnf2JnRxhkraONBOxvNqq1/T+qmqNSoFXTDJspV8s5k9yPLXExJBNF4AXztS+IfPoTrwCBSDu7DQkE/HQ9FWW+ojPo8VoNoojwd+8bj+NDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=BIRCIgPF; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="BIRCIgPF"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48fde648a71so5359545e9.0
        for <linux-clk@vger.kernel.org>; Thu, 14 May 2026 08:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778771596; x=1779376396; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GMG+MYf2mIEZOo4k7BKQu+vHso1LCBH/45mKDm5C2Qg=;
        b=BIRCIgPFmkwlES/ERB5xv17HgmgDjY3cSxS8A29mi+lFPdb8hgElSRZRNYxVOkXM8U
         ez5t38fzXnhI8ehcLycNaw2VqC89e4d3kemKxyX3jV+Nw0aMHo433zrCnuEjSB4BnEtU
         VkEGTCmtC3O/RLk1AOjZEq0KbkDgECbmlr5u59jznSSu6OLbJwrGu6DxEovBuQX+Sz0n
         A72vtWlX4PjSagtjHcNVCZ+veEA/FrYBBaAhcGzpPdspAvU1fznPgE8hQNF1b9wbp231
         BDY8z6Us7KoiFunXgSo8kzF6ujwjE57bV1yvJt1etmrkmu7zRgNn3TN3utz8MfjgHpyP
         KReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778771596; x=1779376396;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GMG+MYf2mIEZOo4k7BKQu+vHso1LCBH/45mKDm5C2Qg=;
        b=NVmMymhrHAAIUQuJjTF9+hEfDbAt8muhXqQCHYdSHofGicRsO4JIKBcb18qzqi7xQi
         EplLaS81u8hlkAc0ciexmsj/VYtZwX0LvW2uJDTy1n7XS4PlAJelKn9VNVh7wmSjs29T
         pMBLkneLh2hS9P13p7PMkWTDz2d9ojxF5gwDIMqMXm51EAbHU7Q8pPiWURFYLZAZuccw
         v0Ts0AN0mQftiFOZf/Uu6FVIB48C9G3uUeBhtB0qkSpKFcIgOroxI94KkRnlHtM0vdYy
         SBPbuLHE+tv3+d3Z3Gl866AIIZWVW5cE81td/B1HEmMFQc3h4qlM14KSG7SY/VLHmsLO
         AR6A==
X-Forwarded-Encrypted: i=1; AFNElJ/UGMtrjjB+4b2cI9da47ugSg3jNX82Ai3YKNt8XYayJyWiFaq4A2Z3V6SfuuZV/sP3XdzYRJzT1Uk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuvyp6Gi4P2bF/ORMUU/EAMv/G56BIInAEPeILIQNRJe5bi8b3
	kxPWmcjEhMQWq8n/+QKuAqGJLAa3u0WrWdl+qZPWGsBaSDiu9BlNqkew1HGgXRTmeHQ=
X-Gm-Gg: Acq92OEdvIG/yxy08RN44788GyAfJOyYwuQdtFUTgOyCjtgDyNkElyVPlGVn3aji64b
	9LWK6CZbyYVrbTueTcq5kuzD3AZpHfbeSJqL7zLCaQRcMgbVhxmTbzQZ+Hi6szdiyDNRK0Z+M+Q
	TWOwMzQqK5+YLsqEbCs/LZyQcGUHkzaWPGvTW+Hq941M6oorttHD3hq0wDqg9WgM9AQyT60jywj
	kvfhtdWRZVtpAY46rTysnk590iPIu9pc5Eyed5lVUUIbmSzrr5rth5vd/JtsRbX6LcM8prerd2e
	6qWl2jUNQarCSKAtDZikIqZ3olxph8VQc1l4aNWNT+k5Z6pxOm7KsMKy/qTyduwUKpyVCMCFkUT
	cAdYrpR/yB2XhsCUlTkArUl8P6GPCFCPtVJVUOlZCFwtsJZFKxdj63d6KyXMshwNNiAIzcIWbBi
	6VOoRsT/h7GTMXEJbQVJY=
X-Received: by 2002:a05:600c:8906:b0:488:aa33:dc8f with SMTP id 5b1f17b1804b1-48fe486cca4mr514625e9.0.1778771595855;
        Thu, 14 May 2026 08:13:15 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8f63:bf1e:b5:28d8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48fe46f4647sm3184745e9.14.2026.05.14.08.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 08:13:15 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  jian.hu@amlogic.com,
  linux-kernel@vger.kernel.org,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 05/10] clk: amlogic: PLL l_detect signal supports
 active-high configuration
In-Reply-To: <20260511-b4-a9_clk-v1-5-41cb4071b7c9@amlogic.com> (Jian Hu via's
	message of "Mon, 11 May 2026 20:47:27 +0800")
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
	<20260511-b4-a9_clk-v1-5-41cb4071b7c9@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 14 May 2026 17:13:13 +0200
Message-ID: <1jse7u6n3q.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On lun. 11 mai 2026 at 20:47, Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org> wrote:

> From: Jian Hu <jian.hu@amlogic.com>
>
> l_detect controls the enable/disable of the PLL lock-detect module.
>
> For A9, the l_detect signal is active-high:
> 0 -> Disable lock-detect module;
> 1 -> Enable lock-detect module.
>
> Here, a flag CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH is added to handle cases
> like A9, where the signal is active-high.
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  drivers/clk/meson/clk-pll.c | 9 +++++++--
>  drivers/clk/meson/clk-pll.h | 2 ++
>  2 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 1ea6579a760f..5a0bd75f85a9 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -388,8 +388,13 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>  	}
>  
>  	if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
> -		meson_parm_write(clk->map, &pll->l_detect, 1);
> -		meson_parm_write(clk->map, &pll->l_detect, 0);
> +		if (pll->flags & CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH) {
> +			meson_parm_write(clk->map, &pll->l_detect, 0);
> +			meson_parm_write(clk->map, &pll->l_detect, 1);
> +		} else {
> +			meson_parm_write(clk->map, &pll->l_detect, 1);
> +			meson_parm_write(clk->map, &pll->l_detect, 0);
> +		}

I'm not a fan of this code duplication.
Use the introduced CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH to compute the
first value, then flip the bit.

>  	}
>  
>  	if (meson_clk_pll_wait_lock(hw))
> diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
> index 949157fb7bf5..97b7c70376a3 100644
> --- a/drivers/clk/meson/clk-pll.h
> +++ b/drivers/clk/meson/clk-pll.h
> @@ -29,6 +29,8 @@ struct pll_mult_range {
>  
>  #define CLK_MESON_PLL_ROUND_CLOSEST	BIT(0)
>  #define CLK_MESON_PLL_NOINIT_ENABLED	BIT(1)
> +/* l_detect signal is active-high */
> +#define CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH	BIT(2)
>  
>  struct meson_clk_pll_data {
>  	struct parm en;

-- 
Jerome
