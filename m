Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CJQpiKpi"
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02F1510DB
	for <linux-clk@vger.kernel.org>; Wed, 22 Nov 2023 20:09:09 -0800 (PST)
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-581f78a0206so257053eaf.2
        for <linux-clk@vger.kernel.org>; Wed, 22 Nov 2023 20:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700712549; x=1701317349; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7qPw5ycerKBMB3jFyF+3AvRZw5Lq7E7FvIBMNy6g4I=;
        b=CJQpiKpijWiAgVX0N+2CxfAcEJjTM6NPLI1QGUeREw1jaFnPa/gqspfcB1w7gmYU9f
         j5zKXNkWMCerZ1KFHKlBlEZokyJILQp+GbxHIofB64lqceZBt3IDIfxHh1IPA1TPiNB1
         9MT9x3DsMy9EQxS/J9ZXnoNF+Z6xr4UUlsLNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700712549; x=1701317349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T7qPw5ycerKBMB3jFyF+3AvRZw5Lq7E7FvIBMNy6g4I=;
        b=bh36OSbQoyfm0lRhaWK0Vtm/qD0og+r2SHA/6l+NFqBxnp2M3g4sYCLH8ZU3Z8IAYf
         bduXBKWID5pYstQ6PUgu9rxftvpFOesMh1i5OXPBV/AafwU0iQCcW0NweI/3ujNFxRaj
         MGq/yjVQ9lDBVC1vvDUBvfHp4pMRm0IuTUlYEtsDsfOpK7+cG1TmSm1/Ox/jsiwQVWoy
         eSsFxWKPUbvn8aBUhSg4WNZsvuIoXeXyqFmEFCuORwRGZtNjwbY1kb8+TE/GJpnYkU7S
         gV1btKnN2P67anUc1EbPcqpPDXZ3hLeMmTnQl95LhOpQdKjymylbrUbUAOcBPoXznTvU
         Ttcw==
X-Gm-Message-State: AOJu0YxhYqpCYKQTmHpEKHTuk26eq5RGi8hODnUX/+YvjFCLqSIipbuQ
	SOXwwtwXUHZdWn2JOVWadRbrwAs87qu66BA8JQl9wQ==
X-Google-Smtp-Source: AGHT+IHd2fLtlvuVmyv7Cl0zbP3OghOcKZpnIVU7m3BOXM9qGW+aLxaHV7rGSTaKGPeFwrVoWChcDg==
X-Received: by 2002:a05:6358:591c:b0:16d:e922:f002 with SMTP id g28-20020a056358591c00b0016de922f002mr4648780rwf.18.1700712549101;
        Wed, 22 Nov 2023 20:09:09 -0800 (PST)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com. [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id p25-20020ac84619000000b0041b3a1462fbsm168757qtn.37.2023.11.22.20.09.08
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 20:09:08 -0800 (PST)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-77d67000b69so25651485a.2
        for <linux-clk@vger.kernel.org>; Wed, 22 Nov 2023 20:09:08 -0800 (PST)
X-Received: by 2002:a67:c088:0:b0:45f:8b65:28f0 with SMTP id
 x8-20020a67c088000000b0045f8b6528f0mr4023922vsi.12.1700712233600; Wed, 22 Nov
 2023 20:03:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231103102533.69280-1-angelogioacchino.delregno@collabora.com> <20231103102533.69280-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231103102533.69280-2-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 23 Nov 2023 12:03:16 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhS_OckB3ap9Sq1U9D5b7605N=w4WyPjJoRJCSRxW5_5g@mail.gmail.com>
Message-ID: <CAC=S1nhS_OckB3ap9Sq1U9D5b7605N=w4WyPjJoRJCSRxW5_5g@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] clk: mediatek: clk-mux: Support custom parent
 indices for muxes
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
> Add support for customized parent indices for MediaTek muxes: this is
> necessary for the case in which we want to exclude some clocks from
> a mux's parent clocks list, where the exclusions are not from the
> very bottom of the list but either in the middle or the beginning.
>
> Example:
> - MUX1 (all parents)
>   - parent1; idx=3D0
>   - parent2; idx=3D1
>   - parent3; idx=3D2
>
> - MUX1 (wanted parents)
>   - parent1; idx=3D0
>   - parent3; idx=3D2
>
> To achieve that add a `parent_index` array pointer to struct mtk_mux,
> then in .set_parent(), .get_parent() callbacks check if this array
> was populated and eventually get the index from that.
>
> Also, to avoid updating all clock drivers for all SoCs, rename the
> "main" macro to __GATE_CLR_SET_UPD_FLAGS (so, `__` was added) and
> add the new member to it; furthermore, GATE_CLK_SET_UPD_FLAGS has
> been reintroduced as being fully compatible with the older version.
>
> The new parent_index can be specified with the new `_INDEXED`
> variants of the MUX_GATE_CLR_SET_UPD_xxxx macros.
>
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Tested on MT8188 with a Type-C -> DP adapter to an extended display
Gigabyte M32U.
The DP output reacts smoothly to resolution switch and refresh rate
change, and the internal eDP output also never freezes.

Reviewed-by: Fei Shao <fshao@chromium.org>
Tested-by: Fei Shao <fshao@chromium.org>
