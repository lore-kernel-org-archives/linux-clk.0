Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F0C292B4B
	for <linux-clk@vger.kernel.org>; Fri, 15 Aug 2025 03:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755228353; cv=none; b=Xc6WzfYBOK7yKO/UavjHPYyhLiYZHFU4GTWxdQMRXaIvU28plNImRUEIGo6rHfhYnJnRG6XITl8uI+yHKhiPtAGtc50YO1QdoBmbRv5kr2Y9QI1o3quXNSZhojvsEQw9sAjOFRHrW3KMY4HdNe9PZ+aBNVZ/0uEmGPevYWbSbng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755228353; c=relaxed/simple;
	bh=PJdg2qnj0enHiTuyutu3+3woV8+hTcgzDCVgV816pbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kqLpMN70Oy84D/Dnme1ulI6UjXhXnWj+KUhRq6TxNV/BgFo09Vk/AJdF7Z+iv2VAkXDwy4kC90V60U0ONA5ckXrpThTO93nUEHStS3sjl3qAOLNzxCSh48uan5J6NFb1uYXiuPS9hsvviEq9HKymih15EFceowTTtv7elDTDyCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UTy90Jwe; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UTy90Jwe"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55ce510b4ceso1799200e87.1
        for <linux-clk@vger.kernel.org>; Thu, 14 Aug 2025 20:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755228349; x=1755833149; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJdg2qnj0enHiTuyutu3+3woV8+hTcgzDCVgV816pbw=;
        b=UTy90JweiHk+QihDlHIv3C9zyQDP2jNFuoORTcldb3m/DzIXDysredFO4TFamtPMXs
         g/DSVFGgouORpZzJBb/m/OyXK1gYWwOB9dImTzBJWx5CIfavyV7vW3yUUyPoBgRRcbnF
         IVwy9Nz4E4vr2IReImGxIECqKcIG31yKvw1IM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755228349; x=1755833149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PJdg2qnj0enHiTuyutu3+3woV8+hTcgzDCVgV816pbw=;
        b=JCg3EO7cVEGW1tm6CiDJ8tU1gL5Ac9mWxbfxnm+H0SamQkigmVm6EiYTfBCV0KJxvW
         WZAJ5UJPyYwGjwK4AGby/jGbj1vJqydLfR+24dDUqHR6vkYHs3eNjYZscMhMekonMLz9
         h/wmgXqWLLJx7en1fXYs2gjOMXQD6dUNAWAH8/Vab52RqPZ6KWJh+e2x/efICcEAcALa
         Pt4kjseMR2T+uxlO91gWQJQjFaIATTNGybzGQ0Tw/fnDsj0wfAcVADECBpuP+rCnHUxW
         h5eSKmc30Ls8OFPpW9jvi1mWeNx+CUd37Sojh/R00UDi/SeO2WZYUHmWFSCKGDRtxqvu
         IYew==
X-Forwarded-Encrypted: i=1; AJvYcCXUregcKV+jds5KbW8VG87diwx6SzqbfiHQbmcmkvwkyNgas/10QRqyjrEKMvGmFwSbVFek+R3NzmY=@vger.kernel.org
X-Gm-Message-State: AOJu0YytdX3l95DnuLnkR36xtGKc5AiTTDnVz5gmUOcHgUFde2G7SGMZ
	zmWIxaq0iRtfWAxw3Xzdrm6CcTqNdCMKsVMWkgRgC4PfBgLgOB604gAVkZ4aw9Ae3oMcXMELlW1
	0mimiNGmmAV1OZGKUYo6jg8jmUDaWKg+svstXLhPn
X-Gm-Gg: ASbGncv4B3y4NA4wvkBRBw/gI7bI+xI2Fb+NMcOxmY49WC/iSe8GJPmnoqvB4eRx0y8
	lnD18gjJUo6nuxbtLl2RYLZHHM82ejnsj+sF8dGiLdrbw9hvh0lSKtLo3UfWNn2uXxtB3yGlsOc
	/vRKIGInHjx7es30ONbssMJNGzC3ilhPQdFlf/S57VvXuK2mzoziQd8z7MStsG8PtQXIpN7RSNt
	KrGEiDzyKsdjrO08I7xI/yAEtTucqSAoq/lWfv3wFDvmw1m
X-Google-Smtp-Source: AGHT+IHML+FnX/LTF4Glnv3hTMjadeJlzca/Pry92PrR9MSNtfqTK7+3shW4DsnQEIw8uD+VwPOVAyVIaNye6SvIV90=
X-Received: by 2002:a05:6512:250d:b0:553:3a0a:1892 with SMTP id
 2adb3069b0e04-55ceea26136mr167317e87.15.1755228349428; Thu, 14 Aug 2025
 20:25:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250805135447.149231-1-laura.nao@collabora.com> <20250805135447.149231-5-laura.nao@collabora.com>
In-Reply-To: <20250805135447.149231-5-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 15 Aug 2025 12:25:38 +0900
X-Gm-Features: Ac12FXyNFrgNnv9v_gZ4B-DIdoLeQQJfDCsM2y3l0UccKVx-_zcaQDAz8pYASzA
Message-ID: <CAGXv+5F4r+tN4vFVFcL5U=o2WrNZHUQN_VNTy=qLo4MKTrjmcQ@mail.gmail.com>
Subject: Re: [PATCH v4 04/27] clk: mediatek: clk-mtk: Introduce mtk_clk_get_hwv_regmap()
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
> On MT8196, some clock controllers use a separate regmap for hardware
> voting via set/clear/status registers. Add=E2=80=AFmtk_clk_get_hwv_regmap=
() to
> retrieve this optional regmap, avoiding duplicated lookup code in
> mtk_clk_register_muxes() and=E2=80=AFmtk_clk_register_gate().
>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
