Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A291A9B3E
	for <linux-clk@vger.kernel.org>; Wed, 26 Mar 2025 09:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742982171; cv=none; b=ML2uIZ8GHYwH085qLGyentpIPo1s2lgXzmX+EGCErMVXmWmqxXVk8ZdgG46073D8p49k6aag/ni4IOzbpBbvEjlOuVwucaDr/Zt/Tub301owhAzWk2uCUwa7MnNQNZ4fIcxfkbzIleEpm8c3xu18E4SbvOOiCjDjXeqLega9e8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742982171; c=relaxed/simple;
	bh=oK9w0PHHeYSQoiTSBw6ii01fBfUomipWqhc0pGmOdEs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SFGcBCG2m9xKrlwIB4mmDIkL+ZQzcIwK1z1uXqqGdX1SX10j68zuwr/JZnfRnwyyCg9ekR0X4UVBMKxqHzkpz9zoYEPHHdIo19JARYQCEx/a5jpn6AJ3Pvhe5M3/qkH0eM57/SooussaPwodA3OkSC5IECOnpU1hkpZXAxTicY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zqjeVpyr; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zqjeVpyr"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-394780e98easo3765095f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 26 Mar 2025 02:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742982167; x=1743586967; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oK9w0PHHeYSQoiTSBw6ii01fBfUomipWqhc0pGmOdEs=;
        b=zqjeVpyrhgQ/NXGty1PgUN3b8mwx56PVRJzxDHl4Ock4WqFoi73/XTjZ0yMA2yGROM
         nJHE7xet4YKfMUS4U1/t8DktJHik+cttkZ+x3CZzDXWd2wzIB/JlvsvevgJMj6NMoCrV
         GVw1nag1t9U5b6r2H18ZqB3HquVxcwr6sO3qS0gdw3kL+Vd/4v0fR23qVSZERRq/hjDr
         YFMsw4ULzqT4HhK/pRkwhtPYJW881jF+5yaeABRjneatqdKAq/TVWfSYTCgfDL7TaI0i
         2l0uPOn+yEea31cxsVGhvUoO2GhphEGl9wqrQ07X5p+fTdiJxmjar+h3MHwXGb2S76+C
         nfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742982167; x=1743586967;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oK9w0PHHeYSQoiTSBw6ii01fBfUomipWqhc0pGmOdEs=;
        b=fhpGUmuq7CGNEHVSjLLlkXtyjFoPHts1kGgxC1SRGbdjSbjHo88CD6l1ipalOk4giI
         8tJfWH24stkd1jN+NwbUOoyq4k6GOjZZK5+cFIwpW9oRwTEFRSKsDqVBTkNSRlwGBT6a
         +a4KO1Blsg62qNBKHvSx+xZIK3ZOF/xQx8HbDC68lQZVb25aZ0Wi1V8CnZEsNtH2jhbu
         RxSUekrACTX3nrFbOqmNi1HcGPwxS1BPHvbi0qCTygcz7VUT1z9iUqpjzyPmS4rPosA7
         tdujD2KvsZEE0EpSeF6uGgWECmGNV0uysm6pYMkBLZBFR1ZN5l8rGpmiRd7mDcjzeL3/
         0GHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBXR1nbTxoIxjLJXLks1TWq7/TSTa1IqGqa/EIAzZDLgil90Du1Nc9Pvw0ZeZbnIW52cg9wAZ7DXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNXenS09aBuFafMkqdQN01bZxMM/lJXjSOI1NWPs9gve4X9kAP
	C98xYFUAyMQgUfddaCEW6Ils3snCJxLOl2vdVrjvyUwCXv/1hZCrc4IqEWka9YQ=
X-Gm-Gg: ASbGncsR98dPNA5wOuVXPYSKkeWivfRvt4glewj2ia87cvSf26NzYqiq7c37WFilLt0
	rKD0SfPGDssCDMLQm1LhCSNHke2OLENfBaBKjWcPSns0dZ3Hk0MlzQqgt3b385T2g7MDYn7Mc1V
	z/7ozREhhCEXxUaD+E56PiGo6mypnx0ekoTYZ7HjG/MREXKFbm1bKBS1D3l3IpO/wfyjsCGRsOH
	C6r8EQbU2J0dH19KNC/yekQ97ws6GgtWV7PT402oQWL7KdJPTY3khTFhzBzWr6GVYJ+exacIOvj
	VJAY+LBBbRGrNnJROQD6OEA8o2wD3vNX8evN605t0IZXQJVlXw==
X-Google-Smtp-Source: AGHT+IFPYFB/K6M208ce6TYKpgzYD2gbxBVrga6S1jcpfDNM/sLdTcLlHMBJoMx/mLpGmNEqFLCYBQ==
X-Received: by 2002:a5d:64a2:0:b0:391:2c0c:1270 with SMTP id ffacd0b85a97d-3997f8ed9d4mr17888571f8f.1.1742982166969;
        Wed, 26 Mar 2025 02:42:46 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f995778sm16406564f8f.11.2025.03.26.02.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 02:42:45 -0700 (PDT)
Message-ID: <53e7fd763da3748dbc7a5205b4f93cdf9476aded.camel@linaro.org>
Subject: Re: [PATCH 15/34] mfd: sec: use dev_err_probe() where appropriate
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sylwester
 Nawrocki	 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Alim Akhtar	 <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas	 <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Alexandre Belloni	 <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org
Date: Wed, 26 Mar 2025 09:42:44 +0000
In-Reply-To: <e3dee29a-dcee-40b5-8bf4-22a6a8a7993a@kernel.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
	 <20250323-s2mpg10-v1-15-d08943702707@linaro.org>
	 <e3dee29a-dcee-40b5-8bf4-22a6a8a7993a@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-03-26 at 08:24 +0100, Krzysztof Kozlowski wrote:
> On 23/03/2025 23:39, Andr=C3=A9 Draszik wrote:
> > dev_err_probe() exists to simplify code and harmonise error messages,
> > there's no reason not to use it here.
> >=20
> > While at it, harmonise some error messages.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> Maybe such cleanups should be before you start moving the code and
> splitting modules into i2c/core/acpm.

Sure, I can re-order them. I didn't want the new PMIC to depend on
all that cleanup, as I believe that had been previous feedback (but
maybe I misremember :-), and also to avoid the new PMIC being blocked
on potentially contentious earlier cleanup patches, if any.


> Anyway:
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks!
Andre'

