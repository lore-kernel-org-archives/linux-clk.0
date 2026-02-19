Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DC3324B1E
	for <linux-clk@vger.kernel.org>; Thu, 19 Feb 2026 21:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771535450; cv=none; b=pWPg+1Kaw1OpOSmH8p21fSprtel89nC4bxavO6o/pgDWJGjmS74pPaZO+3d7Iw7NUDLrCHwAAIPP7jkO63CtSD2TgFLaObJE+fnFWw8trOV5s26jE7oRKLFtbldsnzTPa2PPrrvY26/QHJK9fjAAxQ3XnVkPq/FIGO4yUEy25Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771535450; c=relaxed/simple;
	bh=JN6SNwJz/PklshsvOgeHq8ajH+qHNKzC5uQ86LGzgXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E2xm87xSHKRIH7rRqtPs12jTTkJEnUqqOIKpredTzCyO08az5qH/6WNie4VzF0pDEVEWGTmTe11uI5XqOEhvNrSA08pZvOYKm2xQl1YZ7qoWy4mEUGWIW6ZcVb40vBt2LAUoI/txUCh5fPgMp0csjB9o4vuZOkSC/CBSPEMr5DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=XZFY59iG; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XZFY59iG"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-414ffb4c0a0so1080837fac.2
        for <linux-clk@vger.kernel.org>; Thu, 19 Feb 2026 13:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771535446; x=1772140246; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UrC+PLfTea68FI9Rr5zEv0pamcCsfXyApvn8rTrZCCo=;
        b=XZFY59iG+ON0v2A+mE7aPxY7ovQXFXZCFqAvxBBG7+znDIMC7LE84n2RNsgUlXmY6P
         tp6Q5b/iZDA9YJluflyDw919fSkX/x+aN9tQX8PDM4JN26ufv4WNR17sBNmLZMMHMJjH
         ceDYrln1/COWBy/vuFrK6p3xSjqWjjhLC2L+ILcynRG0Dq8FwbeeQtp2Er4mFJ14FFlu
         b2bQy0rIHQJzTyCq6RoqFE7W9WAWknQjLTYS/o/ov98roir3oapCYFDnhT4WLB/+uAQc
         nkC6cWWsUmWDDRNmOEOP+HxsR+aCf+GhQ2DYEuD1C/qtv6O/ID2FrjJU7AErBk7ZK43x
         mxyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771535446; x=1772140246;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UrC+PLfTea68FI9Rr5zEv0pamcCsfXyApvn8rTrZCCo=;
        b=cVkX/ArMFqrx9BCxJ+m1zD5nh1n+pFhl7gQsnj/RImqFu4MzW7DnhZ1PaiV4SioJyW
         S6vuhh+MBlcdm2Z1rc5kD8J1l5Fxj/0Tim6vQjmfGnUHe7JzyLpYEAuXnbQRSgFxbA+2
         2kaK4IRnqsiLaNSHU+NlAQrkfHovOEcK/Pm7Q5G9nDQ9tWV95yipDrO3ioXnHohkTJNC
         qRw1thyMtRjsZw99o/O3vgsREJs/s4RjAGp0iafq275Q/ZReSCOXV2pzam1IGR0si68I
         l8SQ03Vhs3Dj1nPAKxDwljG/TZe8vBb1hOtRd9fceBTBekhpxn57m8Vt2C7s9NGi09qn
         KEZA==
X-Gm-Message-State: AOJu0Yzjybqttme43px46lPwSe+gBBBGXKZ2bJvxTUBydigkQch21EFN
	ZI7Mk6GOJ9720PLnOXo/tHjYcY+tVoTLUvOVN0wi0yidIWlxq8noAp9VQM6O0NPU1/g=
X-Gm-Gg: AZuq6aINeJah8N/aKc0NW5UnpAvmmRNUIjhVEjFEC7lplGLoeEpDgIWcbQWqKSlCjy+
	BiIDoXEIuNZpCKdZmhQk7qPkAEYND8OaG0eQ5VkF/Q2s3xsvihMPzvWn5wX9/dvfy+ae7uPrqS0
	L2Pd0jEyIRQXSDyHKWkYbRvfieJKXh+aBGk6dHayXi6IYafuZS9yIBYLNcbjSTMcgH+2q+rgt09
	vvs+O86zpw6hxexjs8ZVrjnn5kGjceCSUjxzT76Mz7Dv5WXZUwx4g+sKT4bAPXQhzKbckVn3UWo
	xwFY13Ke1KjhxR5RWJjqIpTF6aX29aXCwzjGnyyqfmVcUPzb49JmC9RT3yI9OsAQTTcTZYVjCUS
	TVfYsGAg1nQHp2EgNE2qq8kzgAzxPexxJRaLnnBS99OTWlzOUGfaMPI3QlgZUZqearoV/E3NMML
	DvkGQdKDg1+YDkLsHQp33Atcg8jTIC9fFW2L54cXabxr4jKkYgNeXecsnVqkkTiACcJcZaUg==
X-Received: by 2002:a05:6870:4596:b0:40a:5a07:3598 with SMTP id 586e51a60fabf-4152913c255mr4207227fac.36.1771535446056;
        Thu, 19 Feb 2026 13:10:46 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:d4c1:bce:26a1:c903? ([2600:8803:e7e4:500:d4c1:bce:26a1:c903])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40ee06756easm22066534fac.13.2026.02.19.13.10.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 13:10:45 -0800 (PST)
Message-ID: <e0b39f90-f4a4-46c5-90ff-54a261c075b4@baylibre.com>
Date: Thu, 19 Feb 2026 15:10:43 -0600
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/18] clk: mediatek: Add MT8189 vlpckgen clock support
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Miles Chen <miles.chen@mediatek.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Qiqi Wang <qiqi.wang@mediatek.com>, sirius.wang@mediatek.com,
 vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
References: <20260202062840.342707-1-irving-ch.lin@mediatek.com>
 <20260202062840.342707-6-irving-ch.lin@mediatek.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260202062840.342707-6-irving-ch.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/2/26 12:28 AM, irving.ch.lin wrote:
> From: Irving-CH Lin <irving-ch.lin@mediatek.com>
> 
> Add support for the MT8189 vlpckgen clock controller, which provides
> muxes and dividers for clock selection in vlp domain for other IP blocks.
> 
> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> ---

...

> +static const struct mtk_gate vlp_ck_clks[] = {
> +	GATE_VLP_CK(CLK_VLP_CK_VADSYS_VLP_26M_EN, "vlp_vadsys_vlp_26m", "clk26m", 1),

In mediatek,mt8189-clk.h, we have:

#define CLK_VLP_CK_VADSYS_VLP_26M_EN			24
#define CLK_VLP_CK_SEJ_13M_EN				25
#define CLK_VLP_CK_SEJ_26M_EN				26
#define CLK_VLP_CK_FMIPI_CSI_UP26M_CK_EN		27

Are we missing the middle two clocks here?

Or should the be omitted from the header file?

> +	GATE_VLP_CK_FLAGS(CLK_VLP_CK_FMIPI_CSI_UP26M_CK_EN, "VLP_fmipi_csi_up26m",
> +			  "osc_d10", 11, CLK_IS_CRITICAL),
> +};
> +
