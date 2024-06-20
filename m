Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF351AB539
	for <linux-clk@vger.kernel.org>; Thu, 20 Jun 2024 08:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718873398; cv=none; b=WzXIPhaQkGKVUFAZN82A4DHIMs/VgdGcCCYEQhg20Ugbzo17MELVm4TirE8/4VGg+U9BxJMVeiwkHdVW4mIs4l0tGEoKpbMpu9LBnPSVIhkiSfPGh0Qam+fQrNAcEPipk4VwOL6083/irWDXovFLQfCPRbollapQfCSYJ7wfg4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718873398; c=relaxed/simple;
	bh=2CIj8Y9AUmvIjg+JAcqcZ+r+tVIYJcXIr4N0cIi9dVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ci9TS4SCX0rtYR6gqbm0QUUXvSQc5OILKTq3gWwC2cm+XaNiAY7RXkL2zikYdcPLuaoKjCDKxnr9vG+jHSSETf+BlhoESAj7KbDsjuXk3EAKxZtXLwpONYuxc0Z6yYjlhG0WIbuxrrctPu2EhQfLDuGlnTZpTFJkzGp/GmmDO2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VMx6jyOA; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VMx6jyOA"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-4eaf67ad82dso182578e0c.1
        for <linux-clk@vger.kernel.org>; Thu, 20 Jun 2024 01:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718873395; x=1719478195; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnzPQkY7olrxeTisghk4ynlDr11qeA45cqHLGGh55Sg=;
        b=VMx6jyOAEKOX8z2b0EXx2+mh5v4QPkZkGlLiyFjMQDAoN/Cq87cRfe9iFaCDjghauj
         +zKLm42RmUH62NF96b9b7k/AfNd54XtjzpQSy7WIVEv00q006838UnLIE5swpx5198Ju
         8IJhlJV1F8/6IicVr80KePG3uv9M48wJHlnUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718873395; x=1719478195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wnzPQkY7olrxeTisghk4ynlDr11qeA45cqHLGGh55Sg=;
        b=vt/oRadoKFKa2zYg6gKgoMcR6vP1nxcBjhYTE5NGQbQGgEwZ4CBGZj9SrKGM6hIg2Q
         HOuZ1VW6xrJG5uM4V3WZVY8jFkf7HkKMp0245h37wbgL3Wa6vMJvVpXOPWmNltZDuH5p
         a9YbOnCmv1dXJBDfzqpa1ZrGlXrnQQGtcZfkLN0Nm9gHEecDSKuk/FP3f0mC6uds/ueB
         mMgSC5iYrqUvKln/o87idEIQKDxwYbTvQplsIY2vCcQ1d/z381q325KRrfM22sCHrR3Q
         ToUHmAZDM6/kfu7aKMFvIh8Bx+RnrYH1o0nJQARSeVV3B/Pau+ktQaOax7QTnVh20vfO
         nXxg==
X-Forwarded-Encrypted: i=1; AJvYcCUyBvc2QOy8r/dk+UsW8TM7oR3jhOkHS/V+g/I/pKpm1TevTT31c7u3ogimla4E6nki6ae14a0zUuQkzf71mMQPwj2LHLlv9iYK
X-Gm-Message-State: AOJu0YxptiCXfO8MASRKU4m7llPEuNSIGvs0pjs1hQxE5/CPwWW6H1VC
	FquYKe1qWHveB0ns3iAjX59pGgqBVGNN8Lbx+wwyf+ST2gv40OXbJkZ18gOrlyuBpZcMHTLZtRQ
	=
X-Google-Smtp-Source: AGHT+IEPrLl5Hj2Q02v2S9/ykaDPDiIMDcWGRkb/qE485162TlMf/BOW+ZxmAZi5bGHm44oaxlHBGA==
X-Received: by 2002:a05:6122:4128:b0:4eb:5f62:d605 with SMTP id 71dfb90a1353d-4ef277a7356mr5691637e0c.10.1718873395219;
        Thu, 20 Jun 2024 01:49:55 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-4ed40e5011fsm2121562e0c.41.2024.06.20.01.49.54
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 01:49:54 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-48d7a81a594so246692137.2
        for <linux-clk@vger.kernel.org>; Thu, 20 Jun 2024 01:49:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUWWD2nRC527/zSgZfWeurkTy64ushVsC0dNLZWr37Zk7eHH6lYNbdG4aomanOlTsQIsNNxN1UwVvFOay8C5Bgm59fOc2rNGfdt
X-Received: by 2002:a05:6102:1889:b0:48d:7692:51ba with SMTP id
 ada2fe7eead31-48f1304d706mr4853217137.4.1718873393626; Thu, 20 Jun 2024
 01:49:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240619085322.66716-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240619085322.66716-1-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 20 Jun 2024 16:49:16 +0800
X-Gmail-Original-Message-ID: <CAC=S1njt1tEH-S2YYKvewRmqta468DuteZFCXKgC02vMUoiBdA@mail.gmail.com>
Message-ID: <CAC=S1njt1tEH-S2YYKvewRmqta468DuteZFCXKgC02vMUoiBdA@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: mediatek: mt8188: Fix VPPSYS0/1 node name/compatibles
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzk+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	jassisinghbrar@gmail.com, garmin.chang@mediatek.com, houlong.wei@mediatek.com, 
	Jason-ch.Chen@mediatek.com, amergnat@baylibre.com, Elvis.Wang@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 4:53=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Like VDOSYS0/1, the VPPSYS0 and VPPSYS1 are syscon nodes, as
> described by the mediatek,mmsys binding: fix the node name to
> be syscon@address and add "syscon" to the list of compatible
> strings for both VPPSYS0 and VPPSYS1.
>
> Fixes: 9461e0caac9e ("arm64: dts: Add MediaTek MT8188 dts and evaluation =
board and Makefile")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt8188.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8188.dtsi
> index 3b02170562ae..77c4f2d104cd 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> @@ -1331,8 +1331,8 @@ mfgcfg: clock-controller@13fbf000 {
>                         #clock-cells =3D <1>;
>                 };
>
> -               vppsys0: clock-controller@14000000 {
> -                       compatible =3D "mediatek,mt8188-vppsys0";
> +               vppsys0: syscon@14000000 {
> +                       compatible =3D "mediatek,mt8188-vppsys0", "syscon=
";
>                         reg =3D <0 0x14000000 0 0x1000>;
>                         #clock-cells =3D <1>;
>                 };
> @@ -1349,8 +1349,8 @@ wpesys_vpp0: clock-controller@14e02000 {
>                         #clock-cells =3D <1>;
>                 };
>
> -               vppsys1: clock-controller@14f00000 {
> -                       compatible =3D "mediatek,mt8188-vppsys1";
> +               vppsys1: syscon@14f00000 {
> +                       compatible =3D "mediatek,mt8188-vppsys1", "syscon=
";
>                         reg =3D <0 0x14f00000 0 0x1000>;
>                         #clock-cells =3D <1>;
>                 };
> --
> 2.45.2
>
>
