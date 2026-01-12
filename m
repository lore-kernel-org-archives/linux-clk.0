Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C795C2561AA
	for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 14:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229619; cv=none; b=UCjzqFAifZ5gnKCvcn2p1guKdjlFr5dSTnIQngUwpK9gZht8CEB++kQ2tzbcCy5mKCzWjMpewOO2yWbKXtaxQMJFvw4St/wqYHWOUzWtiZjoIIAZj4UKLW567ySu1olNHEVZP7M8H6DtglTmF2jkcRYx4r3SAFtMDd7aRkq50hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229619; c=relaxed/simple;
	bh=pDZDm+F+vmrFcUjSN8q/XEiPjVl5A43rJxAi5NUM+pU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tXMxeo/VOluXSQqnC/MWMnPX8JMPVOpsIe97BGexicwOM3qtVR44iof7rf33hmUgpH6XZxcBHrUfqmltjA6ej5daAMb03OVY9px+k1mASMX1ci2mxtmxo869AakIoCLQhHKpAQ3Dt9Y/QpMKH3DwwPdFXyuK2MQMwtG+NPZSJyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vj3GhAml; arc=none smtp.client-ip=209.85.222.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vj3GhAml"
Received: by mail-qk1-f194.google.com with SMTP id af79cd13be357-8b2d7c38352so555515485a.0
        for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 06:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768229617; x=1768834417; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pDZDm+F+vmrFcUjSN8q/XEiPjVl5A43rJxAi5NUM+pU=;
        b=Vj3GhAmlIePXTh2b5Q8nf02OFyHS3ifCtAmmpK2VSoISkLSGSB2Q05/Zr8uOHdddJd
         7chTYyjFmEeDQss2kZNBF97g8b5qVBlz9z84FYuPnUCOICkx3++ljA9hQZcycvQSnDOZ
         /ugPpjugXZvLc002l2+kOxpGyI6O1qch5ER8M4nyGraxd/xaZqYOHw24BwuMKQpt5BvW
         GD4VFNkej5UuOe6LxmgVonzaymMauoVxEZ+gOLIFOMDY0t9HawyLUxSZa/649UyXg12c
         lKtrYHFndZFvzo2hHsPS/Tzq3LMKANvArj8su3O94+qfZFG1de3oUUJocG3ivIHhp8Jz
         2+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768229617; x=1768834417;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pDZDm+F+vmrFcUjSN8q/XEiPjVl5A43rJxAi5NUM+pU=;
        b=vp7pH94YdxU4b10YoZGPJVvMltkG8bVuqqILH0tOE3bstomYxlxzmEUm3xC/cKwEqA
         pO4GbU76T0fpzkpU9kH66d93prtqyEJoIKjpa0GUmH0zhXsH7q5jDMCHCRHqixbfOMrg
         6T6F9yI48+Xg+8XoPsBYZK09lajPV78oNo2E8xRVBGRRPEcAMH/Je1ULe0UX5omRZ6xh
         oPwkv9qk8RjE8dxLoMotxEIMGMVsTWXxfFOk1qKBjWB6avNmNMn6AL/mE7fScE//7FWO
         77PzvX7NojvYChDroK8utA1C4a2DH/K3Oa33yUTwx2ElhZSzqHVaai8hS7moIJQPRysL
         xyvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaVbGJbhike2S9A4K+gyGHgSwYVGWo4F34M+hr7oJrq2nIlvhWZg2VttxaAlBUTfRuDosT404MXSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1NDHjabA2RxQDP7XGgJKzIEFwPjju6sTkvq6m+VwNhRnG83jm
	TYdltOx9m3sdxfu/T7ivYzSriswXRLZcqXVkClluQrxjlfhSoOWT9rGpkQ5Xh7Qh8Ew=
X-Gm-Gg: AY/fxX4p6gy2qSvNX57Jy90gf4pxraGHljf4U7j5bQfzpoR+cUWuUS2EMvIHFaJp8bX
	GqZq7pPUwaoYJc5QNFOexWch24OqkCBZUlPTUkkEXqK9VaYOxuRylJEOKpnTD2/bpF+Gii98dsz
	Ri26UX8R8OFAvKJGJSrxga3cIiZkJhnMWofEJucZPIdOoT0vBXNP0uUdGUi0f2cZn+dW7PgZ1iF
	xlPS6sJ+yW03H1sYw12bXS38VwPc1KqWPmnlGYec87UDtM1Hbfz8qPWtImqUTZByUa9+bNBHeWX
	NwAkY/pq6dvGoNJv5k6i5vo4O1AbH923lnqwJkDv/JRzhF7Rhd74frfTvN/2ayLLVlUHrAdYpQZ
	yNBcm9a8RurT6L6bTphwqnWo3NLOA2PqfpsbJoXmWLVXGR/2Jp6wTdx8zTdvluCBX69Fuigf8TT
	WoDT2DKpuhotfNDexx
X-Google-Smtp-Source: AGHT+IHT8VjWMJ5Rzt6/g2IIlWMwlHfMloJNg8k85JHX1D4CqQQ3AYqCTokG+u+U2mL3ZC97mPnI+A==
X-Received: by 2002:a05:620a:4096:b0:8b8:7f8d:c33d with SMTP id af79cd13be357-8c37f54eb44mr3088215685a.45.1768229616536;
        Mon, 12 Jan 2026 06:53:36 -0800 (PST)
Received: from draszik.lan ([212.129.79.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f53c422sm1585790285a.46.2026.01.12.06.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:53:36 -0800 (PST)
Message-ID: <b30ca585bf401a3f68316afa8c217ff7130e0af3.camel@linaro.org>
Subject: Re: [PATCH v2 5/5] arm64: dts: exynos: gs101: add cmu_dpu and
 sysreg_dpu dt nodes
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki	
 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	kernel-team@android.com, Will McVicker <willmcvicker@google.com>, Juan
 Yescas	 <jyescas@google.com>, Doug Anderson <dianders@google.com>
Date: Mon, 12 Jan 2026 14:54:14 +0000
In-Reply-To: <20260112-dpu-clocks-v2-5-bd00903fdeb9@linaro.org>
References: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
	 <20260112-dpu-clocks-v2-5-bd00903fdeb9@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-01-12 at 14:16 +0000, Peter Griffin wrote:
> Enable the cmu_dpu clock management unit. It feeds some of the display
> IPs. Additionally add the sysreg_dpu node which contains the
> BUSCOMPONENT_DRCG_EN and MEMCLK registers required by cmu_dpu to enable
> dynamic root clock gating of bus components.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/google/gs101.dtsi | 17 +++++++++++++++++
> =C2=A01 file changed, 17 insertions(+)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

