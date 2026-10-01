Received: from mail2.ecloud.global (mail2.ecloud.global [135.181.6.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDCE3BED55;
	Thu,  1 Oct 2026 15:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=135.181.6.248
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869635; cv=pass; b=WVFzChe3lHNyPEW4Eb9EZkquNQVR1/xAoZgaUZLq/K8zBNgeOqYy3+/elIF4ZJ3yHdtCD816Jt/Y/eQKyLQnyPEPl81toUDOK/ujq4opb3V8VR8CQYjqBdm9f4QCqYtA81VL1UA8gimFc7jOp9aqHnVo8Ny565cOd8bNQkas7S4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869635; c=relaxed/simple;
	bh=Hycg+eHMvOk2sA+o4i2tioxz/WQ58uqCri60Ft6E+qM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C60CvCOPzLXjgS4HSd1uzewh0Ldo9DvwF1luNIvxBU66PbGtGiUS4cHlNm/Jf3LmemUCHRqo6O/so5ZQRtSwKGo9yte6zFzYkvN4k1J1nYBt0+FzPjwOt2wcj5w2YqDu9Rc+VwXBPjPN0tLOiMwIN74fam2Nxhh608/12aypMn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=murena.io; spf=pass smtp.mailfrom=murena.io; dkim=pass (1024-bit key) header.d=murena.io header.i=@murena.io header.b=ToqdSVrd; arc=pass smtp.client-ip=135.181.6.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=murena.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=murena.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=murena.io header.i=@murena.io header.b="ToqdSVrd"
Received: from authenticated-user (mail2.ecloud.global [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.ecloud.global (Postfix) with ESMTPSA id 3A32C720B98;
	Thu, 01 Oct 2026 15:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=murena.io; s=mail2;
	t=1790869113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xx70lC/bWUp788wCvnZl/epp/8zx5Fhu34iv8tJWVos=;
	b=ToqdSVrd1HsEwQzmjfBFjYDZriKj3Sm05yKCCOdKEyfTliJyEP2YF4EEk8MenyLA9MSni7
	GG43lHUfIUmAetKOeV1Ptr15wnRIInrp1qj7QaJKcQOslpMkya+w288xPjrp06HiB9VkwE
	WXIw4BIPap4JOIojeomLaOpZ/sdWYWw=
ARC-Seal: i=1; a=rsa-sha256; d=murena.io; s=mail2; cv=none; t=1790869113;
	b=Ko5QVLSK+WrA7oMsstFqO36iwQ4nJpom37gtaBSd3BXP7TUrNUIDhYeZVK9BeJt3RMRkKj
	vzWcU8F9J8ZrlYnMOUcDK6T404QQg1U0Gsx6kLkH1JPbEJkf6kFJyDFAP39PSJadud8ohU
	e3c/yGRhMRfGyQuktdMVJ7V+6ZLnsNI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=murena.io;
	s=mail2; t=1790869113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xx70lC/bWUp788wCvnZl/epp/8zx5Fhu34iv8tJWVos=;
	b=KPA9poo3H1N3+NopbQsllMRGvV20jq2v4Z9vJVtKN2JJKhB3uNRwhvrNu7iSWLfZvfTH0G
	1fynS3FwlDKdQJiNqQhOIDExt0R1yFuv8eNBmGwcEvIpkwnw6luXLOgu1Nw0747QfDpET6
	IZf+7KD7h27N9TPbnX3mv2Y7mMc8R/g=
ARC-Authentication-Results: i=1;
	mail2.ecloud.global;
	auth=pass smtp.mailfrom=maud_spierings@murena.io
Message-ID: <7d41064a-1f7f-4461-a4ea-513d6afce267@murena.io>
Date: Thu, 1 Oct 2026 17:38:30 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 13/21] drm/bridge: inno-hdmi: Make the register clock
 source selectable
To: Michal Wilczynski <m.wilczynski@samsung.com>,
 Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Yan <andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, Hal Feng
 <hal.feng@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Dominique Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Graham Markall <hello@big-grey.co.uk>,
 Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Joshua Peisach <jpeisach@ubuntu.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
References: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
 <CGME20260929103233eucas1p1bc0682334aad710c3894271f46ba1f47@eucas1p1.samsung.com>
 <20260929-jh7110-clean-send-v5-13-82b4d8e3c6c7@samsung.com>
Content-Language: en-US
From: Maud Spierings <maud_spierings@murena.io>
In-Reply-To: <20260929-jh7110-clean-send-v5-13-82b4d8e3c6c7@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

Can confirm that this is fixed now! Thanks for integrating this!

Tested-by: Maud Spierings <maud_spierings@murena.io>

Kind regards,
Maud

On 9/29/26 12:31, Michal Wilczynski wrote:
> inno_hdmi_init_hw() drives the register interface from the system clock
> on every platform, by setting v_REG_CLK_SOURCE_SYS unconditionally in
> HDMI_SYS_CTRL.
> 
> That is not right everywhere. On the JH7110 a Framework 13 (fml13v01)
> panel flickers continuously with the system clock selected and behaves
> once the TMDS clock drives the register interface instead. Maud Spierings
> found this by diffing HDMI_SYS_CTRL against the StarFive vendor kernel,
> which leaves the bit clear.
> 
> Add a plat_data flag for it rather than changing the bit for everyone.
> The Rockchip integrations keep the system clock, so this is a no-op for
> them; only a platform that asks for it gets the TMDS clock.
> 
> Reported-by: Maud Spierings <maud_spierings@murena.io>
> Closes: https://lore.kernel.org/all/e780ecb8-918f-4816-99c8-b69b10b25a18@murena.io/
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>   drivers/gpu/drm/bridge/inno-hdmi.c | 4 +++-
>   include/drm/bridge/inno_hdmi.h     | 2 ++
>   2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
> index 56f7d41cdae49ae872599a86799412c421158369..db92013a3b1e7c1b6668e9257523a0ca8d2c23d7 100644
> --- a/drivers/gpu/drm/bridge/inno-hdmi.c
> +++ b/drivers/gpu/drm/bridge/inno-hdmi.c
> @@ -580,7 +580,9 @@ static void inno_hdmi_init_hw(struct inno_hdmi *hdmi)
>   	usleep_range(100, 150);
>   
>   	msk = m_REG_CLK_INV | m_REG_CLK_SOURCE | m_POWER | m_INT_POL;
> -	val = v_REG_CLK_INV | v_REG_CLK_SOURCE_SYS | v_PWR_ON | v_INT_POL_HIGH;
> +	val = v_REG_CLK_INV | v_PWR_ON | v_INT_POL_HIGH;
> +	val |= hdmi->plat_data->reg_clk_source_tmds ? v_REG_CLK_SOURCE_TMDS :
> +						      v_REG_CLK_SOURCE_SYS;
>   	hdmi_modb(hdmi, HDMI_SYS_CTRL, msk, val);
>   
>   	inno_hdmi_standby(hdmi);
> diff --git a/include/drm/bridge/inno_hdmi.h b/include/drm/bridge/inno_hdmi.h
> index 1e9974401c39e3773bb339eaec0b45ff1dd9c975..620f035eb9846762ff91cd933b30e07eaeeae8ed 100644
> --- a/include/drm/bridge/inno_hdmi.h
> +++ b/include/drm/bridge/inno_hdmi.h
> @@ -32,6 +32,8 @@ struct inno_hdmi_plat_data {
>   	const struct inno_hdmi_plat_ops *ops;
>   	struct inno_hdmi_phy_config *phy_configs;
>   	struct inno_hdmi_phy_config *default_phy_config;
> +	/* Clock the register interface from the TMDS clock, not the system clock. */
> +	bool reg_clk_source_tmds;
>   };
>   
>   struct inno_hdmi *inno_hdmi_bind(struct device *pdev,
> 

