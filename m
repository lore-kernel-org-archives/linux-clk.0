Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="POwUu8GZ"
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com [IPv6:2607:f8b0:4864:20::a34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 096F61726
	for <linux-clk@vger.kernel.org>; Wed, 22 Nov 2023 20:05:59 -0800 (PST)
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-4ac4cd60370so141836e0c.3
        for <linux-clk@vger.kernel.org>; Wed, 22 Nov 2023 20:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700712351; x=1701317151; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uB5imdoPod8S9hEhNPZ14DUI1/eZZtU6LRuwv6Kh2nc=;
        b=POwUu8GZxKXJnLLlAm1XaQIkh9GYni4F4BzkP8ugLdCJL2QH5kwfXtQH2jHLmA4tw6
         OSj7RSA/tcf1q7tQQpj8zBjm9IngVMO5FFlIgl9hPWIa8P3Vz6/cHuHAo91q8nlHf716
         FuqaG4zEpUw8tWHpOpJaZ9AY9GVc8iAEB3LLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700712351; x=1701317151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uB5imdoPod8S9hEhNPZ14DUI1/eZZtU6LRuwv6Kh2nc=;
        b=PoE0M3TrUWoZ/kPYU5OtSiy86rLt3cudf+mQxa+NVVl9v3uOxM2qxEjjutOBJeqNwa
         XP30RgRX/HB0SQ4OjgvqAUS15HeXe2k4c4J2GycLaZOydbjZ5avaDI8ZDgRZieydwjSk
         oRhX6eTFTRIdayYHHo47pEXxqfL6aCH19Vcn83CBPHi741EsscrPnMRLOgSyeEMPhltd
         is19AN6OmjLbUC7pOE4IIoH+RNCCDULxE0qihdQ2daSdt3NZScLWctbAxMJdatn/8iHu
         32Wuo3V59eMgq01FUrRaKKroU06mm2FbpyFCzSWCPFlRfVmgDvis8OFh0PzZFn/ySRHp
         yVCQ==
X-Gm-Message-State: AOJu0YwcwwG1blvK8ItE1VaXJN2LxAccfPfp/rdFBKdWew6J8HsDADMZ
	K+aNPB2k7jfuHw+5Oy2nAoDQFCXaJohd1iJhYOafKw==
X-Google-Smtp-Source: AGHT+IHE/56OM3453p+nEve3nJ0IPaC87PhNUQ5PE8A1xHCZjF4ugjaxEevaSxPir1ypmPncFmYi6Q==
X-Received: by 2002:a05:6122:2988:b0:4ab:f40f:c50 with SMTP id fn8-20020a056122298800b004abf40f0c50mr5836799vkb.10.1700712351049;
        Wed, 22 Nov 2023 20:05:51 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id h13-20020ab0134d000000b007abc40a9543sm85568uae.20.2023.11.22.20.05.49
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 20:05:49 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4629afba9acso137641137.2
        for <linux-clk@vger.kernel.org>; Wed, 22 Nov 2023 20:05:49 -0800 (PST)
X-Received: by 2002:a05:6102:1285:b0:462:a479:79fd with SMTP id
 jc5-20020a056102128500b00462a47979fdmr4441694vsb.23.1700712349221; Wed, 22
 Nov 2023 20:05:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231103102533.69280-1-angelogioacchino.delregno@collabora.com> <20231103102533.69280-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231103102533.69280-4-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 23 Nov 2023 12:05:13 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhL-i7GhP=qRwf+Z_=K2Ee42ZceiPHAuQznsmP2ENXp9g@mail.gmail.com>
Message-ID: <CAC=S1nhL-i7GhP=qRwf+Z_=K2Ee42ZceiPHAuQznsmP2ENXp9g@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] clk: mediatek: mt8188-topckgen: Refactor parents
 for top_dp/edp muxes
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, matthias.bgg@gmail.com, 
	wenst@chromium.org, msp@baylibre.com, amergnat@baylibre.com, 
	yangyingliang@huawei.com, u.kleine-koenig@pengutronix.de, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 3, 2023 at 6:25=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The top_dp and top_edp muxes can be both parented to either TVDPLL1
> or TVDPLL2, two identically specced PLLs for the specific purpose of
> giving out pixel clock: this becomes a problem when the MediaTek
> DisplayPort Interface (DPI) driver tries to set the pixel clock rate.
>
> In the usecase of two simultaneous outputs (using two controllers),
> it was seen that one of the displays would sometimes display garbled
> output (if any at all) and this was because:
>  - top_edp was set to TVDPLL1, outputting X GHz
>  - top_dp was set to TVDPLL2, outputting Y GHz
>    - mtk_dpi calls clk_set_rate(top_edp, Z GHz)
>  - top_dp is switched to TVDPLL1
>  - TVDPLL1 changes its rate, top_edp outputs the wrong rate.
>  - eDP display is garbled
>
> To solve this issue, remove all TVDPLL1 parents from `top_dp` and
> all TVDPLL2 parents from `top_edp`, plus, necessarily switch both
> clocks to use the new MUX_GATE_CLR_SET_UPD_INDEXED() macro to be
> able to use the right bit index for the new parents list.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Tested on MT8188 with a Type-C -> DP adapter to an extended display
Gigabyte M32U.
The DP output reacts smoothly to resolution switch and refresh rate
change, and the internal eDP output also never freezes.

Reviewed-by: Fei Shao <fshao@chromium.org>
Tested-by: Fei Shao <fshao@chromium.org>
