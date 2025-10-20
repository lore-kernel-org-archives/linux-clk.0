Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CF4331A79
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 17:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760983124; cv=none; b=e36SKHLBZBPBLKFSAjO+kSpd2pScKGMXqqtnEgY+xtR/DiWMxRac2mRUXe6h8QQlqe8sooJe4gmnwi5Kr55kskroYjH90E2XTpTVqfrNy2Y2Y4jzEfEmqigPRMI3RkIHL+PLQQkCScAIFu+KPgpwQkSSanlUol/FJ9ys2T+ecyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760983124; c=relaxed/simple;
	bh=V0ywM16huaA6vxoSrQo9VcxXEvOPk2Rt5CdRZIoeNHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hth/FJjKvc926Fwb/Fod1YKG/Fu79xpNCpe1aarsT0vqqTerwi+q67FY2AgVzBC6ZRSFfEYJfHsP/dm1gpc8VTKuMI+hi+5WcPfGCQAjF+NCQoEh1Ww4g6NXjZzkALbxhM8ehEj5xFIk6nIh+qLejhUzgYWmNbCdlyZHNOk7/uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3yeKzs9; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3yeKzs9"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4282fba734bso1084081f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 10:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760983119; x=1761587919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0ywM16huaA6vxoSrQo9VcxXEvOPk2Rt5CdRZIoeNHY=;
        b=c3yeKzs9FPBDpm8NfVTZjIYNE6HCojwEl7itqNZrHDIWTKGQXhd2ltwrRkFF8QCtQD
         Ny9+scbR1rdywhRHMBiNfWPOQzcqGGadc2c+aHUcB43siKJXSuLZyUBYOzZ36lTOxwnj
         ibGvhkO4KHt6Wgi7t56hlv/L877HrL3iq220+uWlidFv6c8QZEzaCv0/O/SdWbvtYuk9
         tv09hFo9/cjPwzt+UEzVwEWeWPdOH3Bx2HPjCIEb89ZOSZ6Htrjr+vnlHpwy8FcnTNyB
         WuHdhsRb3qMjs3lH2jtsmBPiCxoqZLJ6xH4OHZh/7TodH0DycyKrwd7fMJSJuOPVz8M4
         sfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760983119; x=1761587919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V0ywM16huaA6vxoSrQo9VcxXEvOPk2Rt5CdRZIoeNHY=;
        b=bsR+7dPAm59QBvC3a/oBmhGTW7mT6FBmfEyQYxPEpWUC/g7r/GNzuykBH+eZBvgFza
         49kcAyPlwJuVPXtTchUGtjWQv5NVptZ6g1l5bO7IiJFt9ZV3+L/omIphBWKrTi8+o+q2
         MfcbMoMN1eR5mT50VweFAvn5qbqvqAmhD0sR+FHrUgk1aQnBYw5LW4v/tPetJRzzM/ke
         T6sEnQ5K2q115z1bjUHHXaKAefaUux8eTl69VXhYohyG/as0Vlf1iJlUJS3uxrjrE8Zi
         71SqXV3DHQMSRq663kcAhaDKEki4Ctn/IEieZCR5hRCe3bCKT+Txbu0zHH+/deRR3tnS
         0PRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtcVH1z0pl2q7TPmg3S2KGFLK0uVWJX9hID31NVgImxHfbSwzEzSTgD/keEkwlWMDznYXh+htSGfI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjvnRxNDKqELwgTgRgtm0AC9OkShV/ZAGvW39unLxa1CVvrfE/
	fdpwq4oSTkmrpT07Dyk7zIdYujWZPVsXyi73k6mIie5MsAHLICsss59e
X-Gm-Gg: ASbGnct1nQTnCOglXNYUvjSGA5pBRK6d7gcEMwCZJ3HGmwUAxxvO2ikzievpOzAKrEb
	jO+3Rdwsh1ZDMLQuviBSxegcFzxckWlss7Sp/m/+mbfxmdXlOUPxrVkbSE8cEu1Pa6Ntmj/if+Z
	Fm7ts5qqFTKRG0y4qJNZS/poa7tKn3WitLNWMNs+tunfvmqMwatBGrMmQjZoHQf+GWdNnPEyL4P
	Q2612rPsLMKdRv2XNOCM4XaanUnpxujuuB7tQ57py010WF4sm1furdK1KcZC5+1mMYwfsAw8Hp9
	IQVv3K5pLDqMjkxLaMpBSbrPQphJ5SbF2379zJd7bcyWvOrsVBSOK1fYFisrAUyQaA7bIqdSx1u
	z+LndrQhWp5LB2ArzsBiy6Aba0prp7WWImyhX4U1NMCRHF3n4nTagCDtRPyfEnj5oKO7IT8qzsB
	VibxLVdedIVMGEfnbPgvtEUz0fS0JoeeBUlGgsaCADcshkg14X4m7Th/KO4IanbCb2abGgOQIaf
	iXXqw==
X-Google-Smtp-Source: AGHT+IFevLoNtuerBsIw1VuRArXCqqtvXfnOs340pTPBnyLhuRUJ7DD12vxDIIoA4Zumvg8MBc0QBg==
X-Received: by 2002:a05:6000:2406:b0:427:a27:3a6c with SMTP id ffacd0b85a97d-4270a273c43mr7686143f8f.63.1760983119338;
        Mon, 20 Oct 2025 10:58:39 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5a0f7dsm16168108f8f.4.2025.10.20.10.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 10:58:39 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 08/11] arm64: dts: allwinner: a523: Add device node for SPDIF
 block
Date: Mon, 20 Oct 2025 19:58:37 +0200
Message-ID: <22871360.EfDdHjke4D@jernej-laptop>
In-Reply-To: <20251020171059.2786070-9-wens@kernel.org>
References:
 <20251020171059.2786070-1-wens@kernel.org>
 <20251020171059.2786070-9-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 20. oktober 2025 ob 19:10:54 Srednjeevropski poletni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> The A523 has a SPDIF interface that is capable of both playback and
> capture.
>=20
> Add a node for it.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


