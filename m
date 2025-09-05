Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBD31C6FFA
	for <linux-clk@vger.kernel.org>; Fri,  5 Sep 2025 05:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757048493; cv=none; b=icXv/hWMDCghc/56JaVQmPGrpJfE5xbmOoOhx6JGbbaYqh/0W5QLrC+syiSi+aGNwiE7nwFVIxsV/dm1RnuKpXHpfpMIbOIJfZM+RWNvHQe/0xOVDVVMnYHxKsF+M1txcPMzpNP0JSAZ5kjAWxF8nkyz59Ij0r9DF8DXm7DiHJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757048493; c=relaxed/simple;
	bh=njvK5FtQ51xwKW4s0pYsz4x7aMPMIyJMS4OWthiAzGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cmvG4R99G22Et3eF2NFHUl6D+7RObB+bJS6w40UxEcZZEVqA/eQr/H6jNTcEbbPgSjVucfrHgzsluAIRSfvi737XKImo//wkLVcXt1ZZIFWOQLdgSuyqWCaEM7IdGgmzJJ5htHXzicclYlj5YIo5lfdL4EmHVD+i8tJfNYscTOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EqE4M6jg; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EqE4M6jg"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55f6017004dso1879822e87.0
        for <linux-clk@vger.kernel.org>; Thu, 04 Sep 2025 22:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757048488; x=1757653288; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3pbQnf8CUqRojAhpUlOIMWVPCuywXIR601pJXOx+Vk=;
        b=EqE4M6jgR5rIe5A3xGBaoGQXZmnZP4E/gqVhNrv/kjCXnKsX9khbaYkyXBKGzPb+Bd
         zrJcN5xf8rSCZemJI0eE0QKlXb5vXzm70IvIBc9x+vP0uP+mbJUF3L4g/vn4kZQaNLl7
         S1hPR0QEyIcqbXYwqikiaRaU28v05PdWrCe6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757048488; x=1757653288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I3pbQnf8CUqRojAhpUlOIMWVPCuywXIR601pJXOx+Vk=;
        b=dYd9XhYk+dHY8qR+eDa87w/rrqQLcq5nC54zQ07pU9d5/dsnMzuXfyRswY4gp5kuHT
         pK4T3Qv9Rh3gVxUcaMGiZHtlLMN4ajX/rnt0PooJBmKx2MBQ0Gu65Rq5bzq8npsvUvAt
         DyxbxKTXf+/zWHBbfuh5/OPR2kpY6ifeiLgenrUJwM/mJbA7kraStaPKGuwf9/yWjKtg
         BHA9xP698pzis10MzZTwfbkEPencLBWuwzySpqSWq4/jEXSYC7o9Vz6jyZrSzDGbLJ/0
         a1pAUf2G0Y0wiraCWZvsKoFc114stR3UBgCM3PkgzuL3bU6zoo0W1ZR5gIm8K8g9d0oc
         /BhA==
X-Forwarded-Encrypted: i=1; AJvYcCVIotQhJzC5wXNG2KuIH/6sYZ9pGQWdXU9JOeanxThklNEoLiBTDlwn3uiF921BpOCWg6RqAf6UmGw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRQlNmBDL14AEdGKTukQg+IP3g9bs0WWLXOdF5N5dShQEXm7H0
	Y1PHE2y75Cam2Yxl6s4HXFNdOt0I2NayXm26V9nAc5Xk0dZy5BVByjlqYrBcTOjsTW8j67fwDOE
	4prdkBZh0H7xTwcl2PpP8T1V5I7saG0CKui8dwh/n
X-Gm-Gg: ASbGnct0XaWG1X8Ed5ne0sSZdkECRDthAFGAt78CEUC/v9EoWSbDYpsubJzxvk09gYM
	aFs/XmBDEUvVOvmIvbvyKNgNbmVTr4YN5cih4/TCJ6c+g2IQT2gaq6RttPboo/IRgqSvdYWIYan
	MOfBabou/yZxq7X2U94vQXyBxPmyt1FDAWh23PNWVFnic1Dzq99FMQtcP1Lz0Nic1x4kJfHuMOl
	anUV7whnYN9F321GwRmxxyZKelPe1+9aK4goA==
X-Google-Smtp-Source: AGHT+IG10f/KUXsl9teEaeQj7H79dcAZoPGx48y81i6F/mMxgob5Z7ShaCVyVzMRSRmKn/PqDEFL3jvm3MNUmJiY2p8=
X-Received: by 2002:a2e:be1d:0:b0:336:dd88:6a02 with SMTP id
 38308e7fff4ca-336dd886e73mr50101251fa.43.1757048487955; Thu, 04 Sep 2025
 22:01:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250829091913.131528-1-laura.nao@collabora.com> <20250829091913.131528-14-laura.nao@collabora.com>
In-Reply-To: <20250829091913.131528-14-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 5 Sep 2025 13:01:16 +0800
X-Gm-Features: Ac12FXxt8YDULnOSESMbWAKIOZ29Yui3hZN9Zs_7tmp-v_md5T4Hs_0EWckqSKk
Message-ID: <CAGXv+5E-EM6aMR3M=rk2HMT8qCn5J-zuqFtPJP0G1x7+Lj1gEg@mail.gmail.com>
Subject: Re: [PATCH v5 13/27] clk: mediatek: Add MT8196 vlpckgen clock support
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

On Fri, Aug 29, 2025 at 5:21=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> Add support for the MT8196 vlpckgen clock controller, which provides
> muxes and dividers for clock selection in other IP blocks.
>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  drivers/clk/mediatek/Makefile              |   2 +-
>  drivers/clk/mediatek/clk-mt8196-vlpckgen.c | 729 +++++++++++++++++++++
>  2 files changed, 730 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt8196-vlpckgen.c
>
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefil=
e
> index c415453e02fd..031e7ac38804 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -151,7 +151,7 @@ obj-$(CONFIG_COMMON_CLK_MT8195_VENCSYS) +=3D clk-mt81=
95-venc.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_VPPSYS) +=3D clk-mt8195-vpp0.o clk-mt8195=
-vpp1.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_WPESYS) +=3D clk-mt8195-wpe.o
>  obj-$(CONFIG_COMMON_CLK_MT8196) +=3D clk-mt8196-apmixedsys.o clk-mt8196-=
topckgen.o \
> -                                  clk-mt8196-topckgen2.o
> +                                  clk-mt8196-topckgen2.o clk-mt8196-vlpc=
kgen.o
>  obj-$(CONFIG_COMMON_CLK_MT8365) +=3D clk-mt8365-apmixedsys.o clk-mt8365.=
o
>  obj-$(CONFIG_COMMON_CLK_MT8365_APU) +=3D clk-mt8365-apu.o
>  obj-$(CONFIG_COMMON_CLK_MT8365_CAM) +=3D clk-mt8365-cam.o
> diff --git a/drivers/clk/mediatek/clk-mt8196-vlpckgen.c b/drivers/clk/med=
iatek/clk-mt8196-vlpckgen.c
> new file mode 100644
> index 000000000000..c38d1e80a5ba
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8196-vlpckgen.c

[...]

> +static const char * const vlp_audio_h_parents[] =3D {
> +       "clk26m",
> +       "vlp_clk26m",
> +       "vlp_apll1",
> +       "vlp_apll2"
> +};
> +
> +static const char * const vlp_aud_engen1_parents[] =3D {
> +       "clk26m",
> +       "vlp_clk26m",
> +       "apll1_d8",
> +       "apll1_d4"
> +};
> +
> +static const char * const vlp_aud_engen2_parents[] =3D {
> +       "clk26m",
> +       "vlp_clk26m",
> +       "apll2_d8",
> +       "apll2_d4"
> +};
> +
> +static const char * const vlp_aud_intbus_parents[] =3D {
> +       "clk26m",
> +       "vlp_clk26m",
> +       "mainpll_d7_d4",
> +       "mainpll_d4_d4"
> +};

The above parents lists are incorrect. What we want is to exclude the
"clk26m" parent and only have the latter three parents. That is why
we have the parent index table below.

So please remove "clk26m" from the lists that are used together with
vlp_aud_parent_index.

I apologize if my previous explanation wasn't clear. The index table
is meant for "skipping" parent mux values when the values don't start
from 0 and/or the values aren't contiguous. The number of values still
has to match the number of parents given. The index list below is
essentially saying that "parent 0" is actually at "mux value 1".

> +static const u8 vlp_aud_parent_index[] =3D { 1, 2, 3 };

After this is fixed,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

[...]
