Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IHn+nJNz"
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8529F359D
	for <linux-clk@vger.kernel.org>; Wed, 22 Nov 2023 20:05:18 -0800 (PST)
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-7ba8e3107c9so125490241.1
        for <linux-clk@vger.kernel.org>; Wed, 22 Nov 2023 20:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700712317; x=1701317117; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDuyynkQJjhNuDv7Y3RcwbZVUcM2IlduXLPOC7/Q8To=;
        b=IHn+nJNzb0H9Kb7cIuWq2ZoTl5FnaZJEwBmIOzSCYPfxWdiErYo5sAS6VVIlf3sLGg
         IxZYI4RgqdPnp/tebirW1m8IjcF70fR5FZVIP5z6J46ENWq2AVXEF2yKGqQxChl5Zfzi
         hjHoPlkecedF9IE02uq6EMXEOAIjafYVyXQJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700712317; x=1701317117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cDuyynkQJjhNuDv7Y3RcwbZVUcM2IlduXLPOC7/Q8To=;
        b=PQ0KQ0EY/ggV69xc40Pr9qWXW+DZ8AmkTrD9jxbzjW94nO12oQJronGaPxhm+5cK1/
         Z3gsGU9SD9OiYbnc6Cs6n0jauWA3vwVon/THrG0INx51fvuujaemYiGzUJER/APpuyfA
         n4SjTaM+u4YLt7vBt4otK+BrLi56wS2RFAiwTsr09/qosWZykbYkm0pPO9qImi3d/XZh
         a4a/Ikv22r/HQtEHlCgLH1tD9XwaAx0Vv4qaBUVFxS1NQejf74nxgvKdUs8YOioopcdJ
         Eraq0GQCbofQFA9jLBHWCpEJ/TvNW0ywBWR4Hr9eshB1pWqOGDBntT2kqTFudpB/BqHc
         eUYQ==
X-Gm-Message-State: AOJu0Yze6xdpUeI9cj7L5N1gecA0ZHKLhwp+EIwLiv5NJpiU7vLFTdlX
	3AYdIg0WVjjPIYvVm7rol0hXUoy8ybJFULxCe95yBQ==
X-Google-Smtp-Source: AGHT+IEdlODgnoWQO41RcppYWylmdFmTmKFiYxOCx8OOYwajArR0QED0trL/8hI4/R6N/4eloKFThA==
X-Received: by 2002:a1f:df44:0:b0:495:cace:d59c with SMTP id w65-20020a1fdf44000000b00495caced59cmr4873433vkg.0.1700712317243;
        Wed, 22 Nov 2023 20:05:17 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id b3-20020ac5c743000000b004ac8f79baf3sm130670vkn.13.2023.11.22.20.05.15
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 20:05:16 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-4af6a700086so167687e0c.1
        for <linux-clk@vger.kernel.org>; Wed, 22 Nov 2023 20:05:15 -0800 (PST)
X-Received: by 2002:a1f:dac4:0:b0:496:2282:5c2f with SMTP id
 r187-20020a1fdac4000000b0049622825c2fmr4788680vkg.6.1700712315456; Wed, 22
 Nov 2023 20:05:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231103102533.69280-1-angelogioacchino.delregno@collabora.com> <20231103102533.69280-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231103102533.69280-3-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 23 Nov 2023 12:04:39 +0800
X-Gmail-Original-Message-ID: <CAC=S1nimsor1k+sRXw67OrM8U_kANgLdnn6E++gR_O6S_tisLQ@mail.gmail.com>
Message-ID: <CAC=S1nimsor1k+sRXw67OrM8U_kANgLdnn6E++gR_O6S_tisLQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] clk: mediatek: mt8195-topckgen: Refactor parents
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
>      - top_dp is switched to TVDPLL1
>      - TVDPLL1 changes its rate, top_edp outputs the wrong rate.
>      - eDP display is garbled
>
> To solve this issue, remove all TVDPLL1 parents from `top_dp` and
> all TVDPLL2 parents from `top_edp`, plus, necessarily switch both
> clocks to use the new MUX_GATE_CLR_SET_UPD_INDEXED() macro to be
> able to use the right bit index for the new parents list.
>
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>
