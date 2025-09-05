Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDF723B609
	for <linux-clk@vger.kernel.org>; Fri,  5 Sep 2025 04:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757045409; cv=none; b=hpbRKDDHisCl1tHoaZhzIy9rP4NwqjbQkAg1viq93Ycpy+5KuVhSgs9bT6MpSYGxH4YRmNLLXV5UmbsecGghaGx+GeyYXxidkpQxtLLPpgbfYOPvzS0UF/iwLJ8uPWfvUA0i8aRgeYWDhtBM3Z/N1N/cA4evVLkhPnW+3G4iK2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757045409; c=relaxed/simple;
	bh=KLKUHPIcRB0O4muuVCBP8C+yFYqPCsP1VfYmF9nYOvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PezEe1+cyxhF6lGwMLE9EgBGXQkMFXDlzmYOVC+BH1XZs7iwsnUqMPxuXxhgAwjjts1wW4sP2bk//9/N9NXfouo0AEBY7HUMjDiTU2jEcfSp+iPOK/Bs/IULo5udpKDvPXYZLwdPdy6VZrXwACGx1TnZIysdRqUr1XbBaXKVMHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AJmhAq/I; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AJmhAq/I"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55f7039a9fdso1884144e87.1
        for <linux-clk@vger.kernel.org>; Thu, 04 Sep 2025 21:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757045405; x=1757650205; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLKUHPIcRB0O4muuVCBP8C+yFYqPCsP1VfYmF9nYOvI=;
        b=AJmhAq/IP/BSeLkYccBXDi13Lp40Tvzens1nJ4WoC96MTkj51upPoaMdlbP2lw+rek
         HmuWGup7FR1jfacuCYzjWNmncw6qQwsRlHjJUpn0vB55FPRTxJZdnhEB+CjTekrH6Lht
         IhNDMHwmyGKR9OQW7QmfLz4Z7E3axvGkJpoXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757045405; x=1757650205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KLKUHPIcRB0O4muuVCBP8C+yFYqPCsP1VfYmF9nYOvI=;
        b=LqV+5ViMdDq/qG/FbV1VS7h/r5R5HsCXtsH9TviORJVzvubUJf1MMxouomV3VpFFdM
         O/ZnWVzv0rHOuuL/zmNN4pkojUssEZvIPlqmvGNmUjnztdnGn+kKKdvweqIZSIDQgNRS
         yB+p+mmsVLTsqt4kDpml0MayMjdivubtkNz5dFm4y284fKoKytEW501upkbEdh7ZWo01
         BB0G49hTbyGfJJuj5bvr2lOa5UMsYl4PtRlDfC2GcOdQNbnVguPaZMACoPVTAPxgH6nT
         M49G+dXpmsHn9WGpol6H9vHA2Sw3sN9B3OgAk/wcS++uNlytTlbKvvbyvn1yo78p9Ici
         oEmw==
X-Forwarded-Encrypted: i=1; AJvYcCXpVVlKLtfg/NSxMeSZAp8koLtEGo3J7TjaAXfh+aypYTDyDjCUAvz2UkUC0TQ1Enk9azZaVO/dYcw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq0NatZHd0eV/TuhmABPuK+w3Skupnm5aPSFRtnIiR5s77RyNC
	pknY6TR2iBtmTge6bpLDuUd59JzfhxsFgDh+3UpyhybEHgOri86Tjb53NA9VaX+x+rE+5fqGOM4
	DjYqpoh9m2deU97VQ49zPZNmeiZ5VxUVhq+EV0nzc
X-Gm-Gg: ASbGncuSXL7l3eIPeCurOajRkfZGqImSQtvlJFER1iT6tkBhIytJutGNjRe3FQZ/CHh
	4CVVN2fmujiOa947Rz8whQFLOAlUq/ZQZwAN/5DzK68QBAfVAyZ92etM7Np/wg9+ODvOgJiJMAl
	w1NRDuYV/QkBcwnRD/CRhIEVHSeBGxxxRRungDXXp0EQrbljgCM0x8f7bupXT68BMWZgdMai5ac
	SRGHNhcQfWJLyMWDzLJkDVQ3kH14Pu/CUMZEQ==
X-Google-Smtp-Source: AGHT+IH7HKhnxC6o9ewQ28R2ZzX9RmDQokY2C+2i+wMjE8WlWqsz+BTU++rL/6Yzgiv59B7OTvBGnUhQzmndeoe72TQ=
X-Received: by 2002:a05:6512:650f:b0:55f:65f9:512e with SMTP id
 2adb3069b0e04-55f708a2a7fmr4251279e87.6.1757045405415; Thu, 04 Sep 2025
 21:10:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250829091913.131528-1-laura.nao@collabora.com> <20250829091913.131528-4-laura.nao@collabora.com>
In-Reply-To: <20250829091913.131528-4-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 5 Sep 2025 12:09:54 +0800
X-Gm-Features: Ac12FXx6pAx7CiAA-H5MAQbshXKRXROm_6MtHlpf5-g4LpJf9Fu8XFakXK69rOQ
Message-ID: <CAGXv+5ELv9vR7i_Xd7XCC7gBciMXPfQfDAD1WyNy89=pJaLC_w@mail.gmail.com>
Subject: Re: [PATCH v5 03/27] clk: mediatek: clk-mux: Add ops for mux gates
 with set/clr/upd and FENC
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

On Fri, Aug 29, 2025 at 5:20=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> MT8196 uses set/clr/upd registers for mux gate enable/disable control,
> along with a FENC bit to check the status. Add new set of mux gate
> clock operations with support for set/clr/upd and FENC status logic.
>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
