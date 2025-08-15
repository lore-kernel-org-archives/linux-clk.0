Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0316A29B23E
	for <linux-clk@vger.kernel.org>; Fri, 15 Aug 2025 03:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755227034; cv=none; b=BCArGi/92/GxWYr4Tq/cDstYJjA+zRs3N7KS0I2xbEqNou4m75IwYFgP3jLxSfK8SizxKowSCzEq0eR8ESWX5f0oPcM0bkQlYEXsjW9MXmhjeahF1oQU7Ciae+B+m9Vb+O3js9NSp8e95upL92zfoEJTRgsikvArZZ/B29sNMaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755227034; c=relaxed/simple;
	bh=HinHQKZUtxe4t41iR9D9bn+PEZ105vFBbOQmMnTwk9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NCDxZhFPEQtf7/h9uF7BUkvxab2hHXBb6j+GrR0n7UTt7A1YvzHzHulOpVi1feHpEb1CqNTDQVIFlTNJGQMs6dhPxRW3rN9eegOQ8iL2U5z+cTUmZP6MKnOu8Q6IG8LJuMml50HnE10w612hB9d5sNXHfPYSsmUxKRsq4SoRu1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eFSyTybM; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eFSyTybM"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55ce5097493so1625386e87.0
        for <linux-clk@vger.kernel.org>; Thu, 14 Aug 2025 20:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755227031; x=1755831831; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HinHQKZUtxe4t41iR9D9bn+PEZ105vFBbOQmMnTwk9Y=;
        b=eFSyTybMep2zGs8cgTE9pFyv+RTx1qg/TRgwPwPzjOQ7yhv/VSIHID5g3GxVInSYYs
         MEYzYAInQbb171Zo4sOPVbxWclPPKuptT/OeJ9TBJAvsCWXlngg9fkFLbU6PW1q805dl
         OiqErf0N1aN3mvk2cDicMkezFJiuU/xQAQxCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755227031; x=1755831831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HinHQKZUtxe4t41iR9D9bn+PEZ105vFBbOQmMnTwk9Y=;
        b=hO1DojvW9kqE6/DD4fuLIi0YswZtID1bXUrvch728sZkBO59i81qMSEu/jAcVaRPO4
         egtUvucL5hnm0u6uwkGg7NSu1xz+Fin4hMEyjkTxX3lLeaTRADtZq6vhCxFVH2LgLrhB
         idz0x1hvyTvyIy5SiNgJwvRX9YtO2GXeYb0wEGdCdbWHx9/BpnhbWdfK/HBF9JcfWmn8
         pVAGn31KaWHueO5xq668cRpYSPB8A2bk0xQKPHbpxLj4aLkjT2d1+2k/UWmK2NdoIkXv
         hYUVWwPtT2E1SPrhbqWWl+/Dlo3ipoFF3wGt8TCIdnxDjjP0PY+He13Jr0PNH0m4sjOC
         MC2w==
X-Forwarded-Encrypted: i=1; AJvYcCVSWRDsEaSRNGtDoCakOi+1HmU7N/6VtG0s++v8QNavwXqMtC6+rE0TxfNI5VZ4kNwEFnFtt1j46r8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXw8grZgkzqJqKJ8tr/8ffRxLTGLsoj090R/qvLCNFU+3oBnsK
	+aMwcp0rGcFk5TTF/ieUXGiU84ZP6L4fJ/1L6BaqcaJj+cpV/fuOZzTQ22VtM8I/mXo6G2gaYuV
	wZOVLkdPfprPdUV3E9apEcV2S/1emsyS4rp9nJE6f
X-Gm-Gg: ASbGncv/kL7iYM2AMk6x7kF3XgcpQEMR9nwLK45IZp/5fzcRzrBieB/g4WvG0Uh2bwA
	p3QPQdBDuuieMLzrXtyo9o/v/JuQalF8ni66Uukf0XzElYk0H1J5FLQzoKq6E6lSueI8LmVtuWl
	HRwwuTasyYYViq6VYhgwEY0NVgesAKSOclsG/+9OQR+OJEWaMOGif1UdWzYlNaW6QCWBbHN5Avo
	GiZ0vidtw+Scn47Ly5O5CIdbvSzVmwv4ebfyw==
X-Google-Smtp-Source: AGHT+IE5oudoWOuExXFcWc613ObdeU+xcba/kkjYM4lQww+ElYzSmi2/gSXFiaP7UzcFCgh/kx+W9zwxu3OJ8SIUDuU=
X-Received: by 2002:a05:6512:1104:b0:553:a9af:9e43 with SMTP id
 2adb3069b0e04-55ceeb906demr143594e87.53.1755227031067; Thu, 14 Aug 2025
 20:03:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250805135447.149231-1-laura.nao@collabora.com> <20250805135447.149231-2-laura.nao@collabora.com>
In-Reply-To: <20250805135447.149231-2-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 15 Aug 2025 12:03:40 +0900
X-Gm-Features: Ac12FXzlE2kni0q5NyqXgX7d170kjvAVh0V3KwwS63urIxRRXRRBW2zdHpmR4vA
Message-ID: <CAGXv+5GDU45O46A+mpdu1HQ_sfT2Su4fgFCtr4xPjoRPzwOWmg@mail.gmail.com>
Subject: Re: [PATCH v4 01/27] clk: mediatek: clk-pll: Add set/clr regs for
 shared PLL enable control
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com, =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 5, 2025 at 10:55=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> On MT8196, there are set/clr registers to control a shared PLL enable
> register. These are intended to prevent different masters from
> manipulating the PLLs independently. Add the corresponding en_set_reg
> and en_clr_reg fields to the mtk_pll_data structure.
>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
