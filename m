Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8BB2874F5
	for <linux-clk@vger.kernel.org>; Thu, 19 Feb 2026 20:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771534162; cv=none; b=KgU518xZhCUfXwr92nfdQ7oQCDVfPJg/lI1YynLJCPDICPl/Z5BQxzTjA95NZ7vB3LDqqm8K1qZDH+eIaqdko4gOz6Ogx1ewvcKyNC2JVNU5sh2iuYY7z+aPgfsqsJ7GA2BwUZHRcqiGXgejKGl9U1b1i3Bi9ZOQaXbUM87q7aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771534162; c=relaxed/simple;
	bh=w9oLg1R0wW4uMVOKbUTIgtKGy4OR4ye6n/7fMiajz5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mvODgobNAoH6Tqb+URuCu2kkbB37+IcieR3+4tGywV3PqJoUSv1RFEtssOevuHpuIyDAS8veqNgtimhLudUc+lFjMRmMCIxu3x/v4oAknJIj1dZyzsvy4+P+zy94kX5mpg8G2vksemEyi8xVpCbiHgul9co6EQxeczcxlb6k2Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=OnxGDHIE; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OnxGDHIE"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-46391e91e16so821354b6e.3
        for <linux-clk@vger.kernel.org>; Thu, 19 Feb 2026 12:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771534158; x=1772138958; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UtgTLfGOcjGDe5PL0CHRRM4ZPGAPDgJhQWgABhxIwOI=;
        b=OnxGDHIEpSgwydxSo+Ox0VIZVoezIpwv0gPA9dVBHDoIXE+cFEhYjiudytjBVTJLi0
         haAJDy4WNEAh0KMiVylCLsKeVZGR/1j5Niy8TNxNd2jNxpWrCZbkSejWOQxzcE4epwua
         9NVQdpdK6BjwN5k9nO+opyGACXpSaK+GxRNKCh0okr6pTCLiWn1Zixw5HIe6WTQF9ABt
         aLdvpQjgYbeHSgSWCRIGsbNhXfj+ZoGdSP9PDQKFH5nGFpvOqAtCz08TpneJBdUPmqba
         FQodCMNIHSTG63bQkGY9N8/2WdA2ZhECvS9MABFC9RyqQddQ81zeKOKpsaKKWefmh3l+
         X1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771534158; x=1772138958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UtgTLfGOcjGDe5PL0CHRRM4ZPGAPDgJhQWgABhxIwOI=;
        b=jwFWj38RqlqqJdfW1KLV67A13VeH//De52L/GwdUAzPc3rNVy81hH195wA/8ezcGPV
         HF5zb37j5EmuUIZp4Rrlm6FMP7fvyNuZXmc+AM9kKBI9UeEGQDUkdOBPg7Xv4Pnue9oV
         2yZYilfZ9+38uTOlCejHxfXC88WxkEDB+31O30HASBDymEhpDlxTriW9qxTZ2ZScUwEr
         +V4aoYQITsBPRAly5Eg2xlfDK9DM05ZcULehPwOacTWBw70A30A4/HRapa7d1NGtTbFH
         2BgcoCtYAaE0Kt5OWIAszuylGRk3mZkl8fcmLETZYCmFNA2IjJ1PneNHq+9gRzUHuqrV
         2peg==
X-Gm-Message-State: AOJu0YzGVe4m8q9Qug0ibadkmqyC3hkGiL27LtrOhUVJyVynnadJ0hpZ
	pJieCqvJhmHTt6LWmxZPB00yF/Xx57YsNVwpQyXG/ABFLbqcmCkTzNz2WKqi9AzI14Y=
X-Gm-Gg: AZuq6aIErG8vYAXTgC4ma5fM9rlbBVbkQ55zU0X89X2I7BbMj0ot/EBqYlo6+UKpIp5
	XHMx2ney4K1r5s4/qbkwcU1AbVYIT/oxVKO2Kpxc6HQq8iDo6pcza82U7MD06vw9ux6M6pozL7z
	diavLkKTSzLSuGrQUlfDdlHYfwuxh/tRhkKSQ5aSGLqdVmaq/b1PlrkpSCadT9qLo4+5jdniylE
	diBvmcQaFsjtms1yi7mMdDqg+B9zmamnSQ6tnop0Pqq7ylclpc0eujFknXPyg3ZPh5owBx5iDbj
	KuJapCD7ioeb+ZNK6+IbCS4IBYcPqUQzZXa+CEcgj+1spRcon+Jgjl6qwvtoVzf9KCKR0kI/tyD
	3xFwTHWvIBxXmcEmYwIMTPYIU1+XxTE2D+L5tdjiUrGfxUnnQpmztVyRBP6zjBzUn3K3BpkLhJt
	4Ot3+9eOeiyyRgPg+q/ginim6V0mfd4mobmaOO9pkHpuOZZX/f2nKJWd6UwikXk6PcipQAudyMY
	JlyFIj7
X-Received: by 2002:a05:6808:1448:b0:459:b569:702f with SMTP id 5614622812f47-46410b94689mr3904867b6e.15.1771534158258;
        Thu, 19 Feb 2026 12:49:18 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:d4c1:bce:26a1:c903? ([2600:8803:e7e4:500:d4c1:bce:26a1:c903])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-463a4ede045sm13618351b6e.9.2026.02.19.12.49.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 12:49:17 -0800 (PST)
Message-ID: <4b22e998-b38e-4452-82ce-1389d7086a04@baylibre.com>
Date: Thu, 19 Feb 2026 14:49:16 -0600
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
> +	GATE_VLP_CK_FLAGS(CLK_VLP_CK_FMIPI_CSI_UP26M_CK_EN, "VLP_fmipi_csi_up26m",

Should "VLP_fmipi_csi_up26m" be all lower-case to match the style of all of
the other clock names? i.e. "vlp_fmipi_csi_up26m"

> +			  "osc_d10", 11, CLK_IS_CRITICAL),
> +};
> +
