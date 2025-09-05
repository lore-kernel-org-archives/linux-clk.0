Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E70321D3CA
	for <linux-clk@vger.kernel.org>; Fri,  5 Sep 2025 04:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757045639; cv=none; b=N0n8nchVdlE4DK96Q8bb9zc0ocrsQCfibHNOAuHBhZbM07kzSbhC+bBDC7/vCWyRebqrozwdGoq9YwtO6IluVhf9/ey07cJDd+QZod1WOSEYrCykHTWh7ImBoLOgcjtH3E0FsiPwfNK88BGXVohwqGXXbq0NQtLyJ1Y727+Naeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757045639; c=relaxed/simple;
	bh=0fYRl15KIX0WePQH2MFQdJgEu6wtt4B+4sM9XqpEHp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xxm+hEaDZ1Gx5UO8FQ6F5hUttHte8xHWlYlHUnJ31/+CLazwrO/A83PcPuvl8EQdyBKdzRjTMZ1Q5w4ckyCH76+515TGSVM/fQWM9MnNYiQr+dx/v3UDGMoO98iR8MToTk14Ct4YLJBianvCh/6QrBqiiJA3AiVOrXNmI3cH+YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Pa0nujBX; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Pa0nujBX"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-336af6356a5so13788411fa.3
        for <linux-clk@vger.kernel.org>; Thu, 04 Sep 2025 21:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757045636; x=1757650436; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0fYRl15KIX0WePQH2MFQdJgEu6wtt4B+4sM9XqpEHp0=;
        b=Pa0nujBXCifPQc3nIHCWUFY3HJpuGZw9+3DSEDyNLt7E6+n5KjdX3pLQI4hxrfHixA
         lln7Gh9oqN7xgSaWqTJLqCrnDbX+b4f3yCy2mKf4+mVZpEWnmJDLz+JPP7kITlHBT7yq
         VJlYjFM2/38gZsSnil4Vi96SpNsC2vB8Legb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757045636; x=1757650436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0fYRl15KIX0WePQH2MFQdJgEu6wtt4B+4sM9XqpEHp0=;
        b=HWUij1qcjr+OUUAZY0UxJEkkLtfLHcrGkMDwpORXoTYNULGljo5HVEuUQTMm4PJdws
         BxPswlcjSTaauXH0kUaNLarVEd70L1Rd3NSEUGexTaVEu9ySvwfAmk2obxNC+7875WyP
         MrqZQdDqWoF5SMqDHLYXuxkpsuU3mHSw405Nu2G95lchKY8RSuHBEtII74wvsaaIOyGg
         WO6lgqI9Jwob/aP0BePRToYEeT8+DWcDKJo09HHyR/MB5Kjc1X5f0q2y+E1NDsz5zTOs
         a9QWrwyXTWsqPK3QtXEnx0L6CDRixl4CPfOFQgzt10J2esDHalCCnLolc7lItHV2nRiI
         DuZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV8qKhK8iH/D+b7A4WPL/O+iU28VpUmkJkj4uE+fozWNLmoW+UFXSnAFgBrvA0GpoJ1Ud7IAJYqTo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuBLFY/wjENmcogEur4n66KjCofTzLuR1q6kHGXyz4sqtfNqxb
	6wOWJJyrtfJ+gNwtw5mseevSqrsnWKtNrLFO1ZaBJbk2qFge1NUyUdIFKMQR4jlvAYVIQER8Y67
	d70yAiYrtinDGyJQcJarqQFzyNOh7t7UtQ8flYgRA
X-Gm-Gg: ASbGncuq0kEURiodaS8eAoQa6nay0vvUExzADOc7dOpND9TA5QAkJGr9rFuDUV4Yb77
	Rs7Wa3g8v/KXWHJbPJhmmjXwr5eob1XtMBWyWuRqBO+4BE/gqRMhT7CMpUsYweiB+cjPc3YrrS1
	Gt9KpRDVAzc+svf1CFgoacPayVsl9nt0+pxTb8S5kVb5oxulJ70cKkg3AwJwZdPTtfAQwinp8qy
	RWVAujUiuDIMZv5962uYBvKYuTRnINqlv/7d/2VFXgapzSZ
X-Google-Smtp-Source: AGHT+IEa0TMIVMFiRNiOTeyQqmllYD/2S0wrm6EQ9v6TWvwu76YIEfNVYAC1dteqcnsTmIHsn61yA6m1gNmuAQeVk3M=
X-Received: by 2002:a05:651c:2129:b0:336:51d4:16b3 with SMTP id
 38308e7fff4ca-336caa4a818mr59122681fa.10.1757045636072; Thu, 04 Sep 2025
 21:13:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250829091913.131528-1-laura.nao@collabora.com> <20250829091913.131528-7-laura.nao@collabora.com>
In-Reply-To: <20250829091913.131528-7-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 5 Sep 2025 12:13:44 +0800
X-Gm-Features: Ac12FXztQWtNoog-vK5ygrU2ksjNm_shuXo3XvVwDmyxsQtnU3LNJR6VMH81zew
Message-ID: <CAGXv+5HjikmVaK_++METYBvTciQt1OTm77TU_e4Zh52MpCZ8bw@mail.gmail.com>
Subject: Re: [PATCH v5 06/27] clk: mediatek: clk-gate: Refactor
 mtk_clk_register_gate to use mtk_gate struct
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
> MT8196 uses a HW voter for gate enable/disable control, with
> set/clr/sta registers located in a separate regmap. Refactor
> mtk_clk_register_gate() to take a struct mtk_gate, and add a pointer to
> it in struct mtk_clk_gate. This allows reuse of the static gate data
> (including HW voter register offsets) without adding extra function
> arguments, and removes redundant duplication in the runtime data struct.
>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
