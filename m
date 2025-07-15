Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D46426A0EB
	for <linux-clk@vger.kernel.org>; Tue, 15 Jul 2025 05:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752557205; cv=none; b=bxSyvjFyglxqYwdlAyRwu4k5i++gwwctG12Nqem/v9a9746VJzSrYMs6ShZz6ttHpB4q2R385A0iVsVQH06zQbEs7qLqplw6m6H5g3dAXGHIfTnBv5WD1HjnZJNsvE+C2mWy5nlcC0C0sAocgRXfqn4FgCDnKNYVIgpHF5aJQ1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752557205; c=relaxed/simple;
	bh=Vok3sAiLujP5+hTf7U9u6KkZUMEHc7gwTOuzgIEBsWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gA8AqVAXrOng3dMcNjCxxd36VPIvqF/xJ2V9Ste8MRWSQDegss3N4frG/WBsWJ5mWaxoZFNreG+nUqqOxwxrmR00LQnkr8ZFzXuivUbIABuQIsSd5HdGK4xQWW4svoVbKVLt8ypDXnAFVz+fhYM64lidhCSFaYlf28akNm4b/QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UtP3Cg2J; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UtP3Cg2J"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-556fd896c99so4360263e87.3
        for <linux-clk@vger.kernel.org>; Mon, 14 Jul 2025 22:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752557201; x=1753162001; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EriOcw6Ti5BC4myF5JQ02kFXKB9Pwigas67q+yAyzZY=;
        b=UtP3Cg2JB1Gh2e3V/wnmeHpFpvPqHf03QPPoGYlyiv4DE3nTeYn9cIdoM+J4oB0vsi
         PLGdDg7yOAsnFwC6rLkIUTEldxTQyypC94wClnaRR+5ihly/0CW1wU6iWf/OupOtHKRp
         hBArkONR4cuiWfaXs/peRUT7zJ4sIuutOL3jk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752557201; x=1753162001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EriOcw6Ti5BC4myF5JQ02kFXKB9Pwigas67q+yAyzZY=;
        b=C3hFT1oaUg/J9WR+TemVgQTCwFGRRL2WOzAwMa6VmC6/e2TEOSd92DRrdeTp3dHQ53
         NjiYzDl+TJ8oJAsJ2rQcs1xmChqYqjtRqHgJ/I3qSTdAiyY8fRHZZVv8tRliiR+kqrCP
         gCr1RKaoWaci8sVqLeT1E2VwkWbRtmJGQuCXJYMU0KSktVSaf0j52o0US9gPE6XMgWuF
         Rs7P1QGTrWIhoDgRApgqgYQRzF+Lvko6wlt4t0kFKOPaNH1kgcb1onnXjlSw/Z0qvFXK
         VhirtLPMpMu6lzh/yS7hF7iSbkrCixwOpFZbBhQrP53qG/gxxOQt2g5DKS+Zig6HY55r
         xrAw==
X-Forwarded-Encrypted: i=1; AJvYcCVac7TeeGY/cx5HFN14Q64QU7DBabjnhj5HCb0IxJYLH6sThg3X6zqLmdqcaJ1OCK5KuhgYb7b4/Fw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbwQPKro2LsbHKMth+RwEdVvGUg7ZjZ7hvBcdqrn/TLdkksqnP
	gE8AeGlz8y3jOZrdKhNcMNOE0tMyUfwarZWQYqVh/T0F6rmMF3iGMT77MFg3HEu77ijahn2XTr3
	pK4fRWdADR6cz5SM/zXCfeBDaFqcY/8o+RTQFY2b1
X-Gm-Gg: ASbGncu/P7bstI0CY29XNeMWM+Sm1cdr5QVM2Z5Hg9geSRh3grKWiZUVhu7VCLmd/Hn
	soHg7IbSiGmJ7YHQG79QDev0ynNGpu6rsnATJyBPFNJAlZI13t75ZMg7WzIFG6k5Yj0usDnk4qm
	I4cNujGXi41AXNoIlaORKjFIOEzBKY1w1S07aD0jt2kzwaJPi1NRB5jh80Vnhf9VTD9FjdSbPr2
	HB1IJjhNCEspUfBHurlcjp9oy3jokkij0E=
X-Google-Smtp-Source: AGHT+IEQf0W1yeQYNRbpUyAxFlgjb3kYw5Q0BNqfDsziWw7aP+1TqaYvLMXYRwQa9tomb76nSKuU56uoGnkXehDyLpc=
X-Received: by 2002:a05:6512:3b9c:b0:556:341b:fb0a with SMTP id
 2adb3069b0e04-55a044ca226mr6271614e87.15.1752557201192; Mon, 14 Jul 2025
 22:26:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624143220.244549-1-laura.nao@collabora.com> <20250624143220.244549-13-laura.nao@collabora.com>
In-Reply-To: <20250624143220.244549-13-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 15 Jul 2025 13:26:30 +0800
X-Gm-Features: Ac12FXx0XfJFXA_DIIE4IblGQiwtiWyeXBGiD295gCS64kpCUO8jzl3QeCZ10ZM
Message-ID: <CAGXv+5EWEsLBS86G828ezpnD3x-MaC3F-AtyGFyzKxPvZ0GcAw@mail.gmail.com>
Subject: Re: [PATCH v2 12/29] clk: mediatek: Add MT8196 topckgen clock support
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

Another thing,

On Tue, Jun 24, 2025 at 10:33=E2=80=AFPM Laura Nao <laura.nao@collabora.com=
> wrote:
>
> Add support for the MT8196 topckgen clock controller, which provides
> muxes and dividers for clock selection in other IP blocks.
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  drivers/clk/mediatek/Makefile              |    2 +-
>  drivers/clk/mediatek/clk-mt8196-topckgen.c | 1257 ++++++++++++++++++++
>  2 files changed, 1258 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt8196-topckgen.c
>
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefil=
e
> index b1773d2bcb3d..bc0e86e20074 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -160,7 +160,7 @@ obj-$(CONFIG_COMMON_CLK_MT8195_VDOSYS) +=3D clk-mt819=
5-vdo0.o clk-mt8195-vdo1.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_VENCSYS) +=3D clk-mt8195-venc.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_VPPSYS) +=3D clk-mt8195-vpp0.o clk-mt8195=
-vpp1.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_WPESYS) +=3D clk-mt8195-wpe.o
> -obj-$(CONFIG_COMMON_CLK_MT8196) +=3D clk-mt8196-apmixedsys.o
> +obj-$(CONFIG_COMMON_CLK_MT8196) +=3D clk-mt8196-apmixedsys.o clk-mt8196-=
topckgen.o
>  obj-$(CONFIG_COMMON_CLK_MT8365) +=3D clk-mt8365-apmixedsys.o clk-mt8365.=
o
>  obj-$(CONFIG_COMMON_CLK_MT8365_APU) +=3D clk-mt8365-apu.o
>  obj-$(CONFIG_COMMON_CLK_MT8365_CAM) +=3D clk-mt8365-cam.o
> diff --git a/drivers/clk/mediatek/clk-mt8196-topckgen.c b/drivers/clk/med=
iatek/clk-mt8196-topckgen.c
> new file mode 100644
> index 000000000000..fc0c1227dd8d
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8196-topckgen.c

[...]

> +       FACTOR(CLK_TOP_APLL1_D4, "apll1_d4", "vlp_apll1", 1, 4),
> +       FACTOR(CLK_TOP_APLL1_D8, "apll1_d8", "vlp_apll1", 1, 8),
> +       FACTOR(CLK_TOP_APLL2_D4, "apll2_d4", "vlp_apll2", 1, 4),
> +       FACTOR(CLK_TOP_APLL2_D8, "apll2_d8", "vlp_apll2", 1, 8),

These aren't used anywhere in this driver, but they are referenced
directly in the vlpckgen driver. Maybe these should be moved over
to that driver instead? Otherwise we end up with some weird circular
link between the two clock controllers which doesn't seem correct
to me.

[...]
