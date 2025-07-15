Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4AC1A23BB
	for <linux-clk@vger.kernel.org>; Tue, 15 Jul 2025 04:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752554228; cv=none; b=glA5wi3ehceEnOHdnUabNu1ORqcnnHI0m/hga8Iq4VHhs6jAs8XNNHd9NBgJRW720G1vnNgZcbgVqaMxzGQOOvSyNDXSSs1UGqyWczxRx0/u2p+RwtiXbYSdj2J5jAXBsl35gWFLV+8HIfnOpFFkWgYAog8Xnn3hjf4ZBxiXJAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752554228; c=relaxed/simple;
	bh=HEym2MfRYDRe1WStyHMOT8vdThlsV2VAJ0myxALEAgk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kI0fB/3kMGgdE/XEMQfDtbb9Gv+hjl4uFd9TEzKgAs95h8mdzad7QbZj1QrB8jyzvAi9jJA2riiAgYsv/gBybfoiyYhOXjdchXtVhh5w1euCf0vBIYTMznQcU5dn/g9ADf4bYhBhLb8U4a1BK7exUAu+XK1FOVAqqID73nrFHLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=A43henmj; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="A43henmj"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b31e076f714so4825609a12.0
        for <linux-clk@vger.kernel.org>; Mon, 14 Jul 2025 21:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752554226; x=1753159026; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gqg4UcH4HOCD8WdGE4+ik0rgx/yjtc/u1ELlwLDaNkk=;
        b=A43henmj4KmroWVbHwKFQPtrnX1jzu3bqWZrGcEcn43gimxYAkUn3PRoJ30w9fVUBQ
         0HYPp4Ti/KOmPGMhBaqOsQ5R7qRKn3IxWkeMxxoAp9qwQb3xwAMy9nJYouryCge+thrA
         5GkzURi4DmrwjmLYQ3JDfXVRm36S1Fs7MGY3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752554226; x=1753159026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gqg4UcH4HOCD8WdGE4+ik0rgx/yjtc/u1ELlwLDaNkk=;
        b=vXxftNFXH3vYsBljlgq3TdXXGAL5lV92CebqR4luAD6KPonx0RC3f64yYNBgIFMKL9
         LFkc0b18o3/v70BJH5tq30h1D7AhgBOAcrh6kcM+l3pOOuBHOcsouKxQQibaMNJutTuD
         XkAvsuddol8+fAiF78OkGGQJa1ZFEc0W16bo0Xz5X7pLNFV2jda+1kzw+bzEwx+9FYjB
         5EsHw+Ozfa9slOVg62adT3h8AgB5Ul09I0ys8riowt5cDp78PMZEZ571lJikvZ0thepS
         oK6EwfSa597CpY5E9SAwsHx5Q3I7czx51wEP0gBzcN4yjKhzSEP1nB3BsFYxNGEHQXBE
         q9jA==
X-Forwarded-Encrypted: i=1; AJvYcCXVdwLIhVBD1gzQr81tZfLh3rpWcH2rYdVCslB7XLf+8bn5LILmWnCbc971nCD8w6Y3Gcu4eXnfWQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC2p0kUGCrS6oSmud3kdixto0WmuXa8aYUZuuTxy8y0dYx4pnQ
	84FZun/wTPBmM+eHoe7uglxKiJDwcAiy/yUTIchqgYR+eMa8KqWk4SnewSMIipCEQRK3K1huS0D
	pTxrHbG53lf85a/XU/ro61nPkTD3otrbt1Y940CoH
X-Gm-Gg: ASbGncuhL32i4Qu7nA3s4fB9ztNT+BdRrf6fGxIxK2ozum35eGTzKsqK4B0zFegXoC5
	6vNO9xARPusManOF7IN9MlBv4E98Z2SzVUJ7r2TB0pBEwxijEvPBYBDZo6hCPFoL0TnIQJLOU1i
	L4rIIG/SHUGACu6Fy+LBIgzMtg+71j58EKtvHQq6Yzb+epK19LPzp9PGDfqtE8KDsGto8wDB/cI
	Ie4e4j3yTqBteUm1oL5FaGXLgyG/qeH93jyRPBClIhTZg==
X-Google-Smtp-Source: AGHT+IHf1xc3dLDnNYF/fDC0d2YbPGxvPK9FwAjwgXDKEU1kkJL2K+WT5K+79jl9PQ6eV0yj7I0MMHxdLoUbmyObj2Y=
X-Received: by 2002:a17:90b:57ef:b0:30e:6a9d:d78b with SMTP id
 98e67ed59e1d1-31c8f88d387mr3132859a91.12.1752554225889; Mon, 14 Jul 2025
 21:37:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624143220.244549-1-laura.nao@collabora.com> <20250624143220.244549-19-laura.nao@collabora.com>
In-Reply-To: <20250624143220.244549-19-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 15 Jul 2025 12:36:52 +0800
X-Gm-Features: Ac12FXyo_hm6-LevP76Ht3AHw10mSGdmwELcsNXs6PZZNLb0jYOFlkoLp35KGco
Message-ID: <CAGXv+5ERCTTJVfgfY=LLTKasz7RpTdpPfHJDKtKiUfcYyrS8uQ@mail.gmail.com>
Subject: Re: [PATCH v2 18/29] clk: mediatek: Add MT8196 adsp clock support
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 24, 2025 at 10:33=E2=80=AFPM Laura Nao <laura.nao@collabora.com=
> wrote:
>
> Add support for the MT8196 adsp clock controller, which provides clock
> gate control for Audio DSP.
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  drivers/clk/mediatek/Kconfig           |   7 +
>  drivers/clk/mediatek/Makefile          |   1 +
>  drivers/clk/mediatek/clk-mt8196-adsp.c | 193 +++++++++++++++++++++++++
>  3 files changed, 201 insertions(+)
>  create mode 100644 drivers/clk/mediatek/clk-mt8196-adsp.c
>
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index cd12e7ff3e12..d4c97f64b42a 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -1068,6 +1068,13 @@ config COMMON_CLK_MT8196
>         help
>           This driver supports MediaTek MT8196 basic clocks.
>
> +config COMMON_CLK_MT8196_ADSP
> +       tristate "Clock driver for MediaTek MT8196 adsp"
> +       depends on COMMON_CLK_MT8196
> +       default m
> +       help
> +         This driver supports MediaTek MT8196 adsp clocks
> +

This is part of the AFE block, and really should not be a separate
device node nor driver. The AFE driver should internalize all these
controls and ideally model some of them as ASoC widgets so that DAPM
can handle sequencing altogether.

So please drop this patch, and also drop the entry from the binding.

I've mentioned this to MediaTek's audio and clock owners, though I
assume this request was somehow lost in the process.

ChenYu
