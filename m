Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022A925D216
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 10:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769856872; cv=none; b=iK9id+Sn914MWeTG2kiRgQDNhx+2JvWae33+8n3HcdcyFxx4zsD/oZMVe7+JS/T6nNdRM2unzvK0WxOuQcTsgLHTuozY6tnaQYFo/pxjwKGBggm70J0yvg/UKvZbTSfzGwdiizm/D+lx1n9V9RP+4mvyxQUZwsTySD1Ysu+IYM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769856872; c=relaxed/simple;
	bh=mJVOTxS4H1fQMVs9Cl4pmdL3ojtFAbbWBqx33IPSTe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ky7iLx44JAC3nfoUaPbSq0wlgRpfgTtyo4Xfr24ak8KKLSZADJWAHdkspj6v0ltMMIYMhnQLvZBljrJ9/T7fALXrTJ82WenRhCrXYQdvwMILKrxOSVJ7L0gnXbyIKtePqZepZqISB+QuCFQi1Y+cYJjTQwdCrHrk1+Zci2w1vmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=c/Sr79W1; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="c/Sr79W1"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4801bc32725so21690055e9.0
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 02:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769856869; x=1770461669; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kft2vd6sCFHP1Kc6YzTKiQk6KPdEUPeMtNpgXRj7ZmI=;
        b=c/Sr79W1xz+17rtwsq+kRXAcCJYluQcpFCvH6tXOg3RBatzHTjJ/Kax8jc5Vx2nPo7
         JfSWpcA4eu+dvcBHT2CA0qa+rzAPqrzj1xokTn3tiI7dC1F4bkQ+/KCdGMn+4Beizc7G
         m5VDejo0uw9iku32Yn4EgXoBLVWzHbArZowtAORYe1YZRktnjOrq2UNGQED3x3wjcoLv
         Da/bGUTh9Np/phM+QcL1Xa/O5rBYGvrhTW748lWgMpcUwnqyJ0+YXqj9mneoAaERnWmR
         B+jxhW1sAoThtXOfPH2HONmEI4ZmFExMtflxl6TqdE9I1MuYsqNMnLSrv9iF1D3SmKfC
         3+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769856869; x=1770461669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kft2vd6sCFHP1Kc6YzTKiQk6KPdEUPeMtNpgXRj7ZmI=;
        b=G+LQaOBjme20qqnm+IckfIn+RIKqCsoCrC4vxmvCDfaqsEtjxD763B38FC0Tp1aDk0
         jAtx0kr2mqlNhNiSfa7Fjoj+Ikxir4blKtUFLAh3PTnfD3BI0C6auQjqgGVRTb4g8Ald
         b7OoptThhsFccJUAypGTX957xS6It2ffWw9Dq/OehtAXubdfYQM+dyZcvfAHkhNOkU3M
         1SMNKX9QVj9evlKHerTb00s0QMJvovTQS6Dr++BqmCqgQe4YMqoi4bcc0swcXifgT8A9
         hzp7V5tj/6vtakYabrx8upT80G/bKTUX77OGVzt570UhKUGkFtVLZY7YbAmKOxyMmIDW
         DWUA==
X-Forwarded-Encrypted: i=1; AJvYcCUiRrpmwJWgJdSJkfbfc/W2RGq7bEPPVrNW63Zu4bu0EUOmjpkv0fNgLmZpPX1DMqE3Q8wANFDqG7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA3iRhGcrK64EYYGSHj9/b1mQJH+WSL0y5ZcdV5w4xEfn7q7Z6
	qtZWvGu+4P6RS4J0/Vr6UFwPgi039sk35Ar2dW7B4+OD93Nwf9LhZM8G2ITVGCzfA64=
X-Gm-Gg: AZuq6aJHS8U2v75SJQnJM+ZFULNGien11YUsxA4yx5/vbYF7AXdWW4lktd9Tq5JUegt
	tFHO39Hf7YL0Af/SeTQJGr3Bkpq8+zFQtjqYYPUnrouA7UmIKc1mjkak2XLopGfEJ0Px4AEJCOH
	puQ/glMupXHMmBLonh6ZBCh5RtO5YE77x6o5NUD7ppuR80jXn49R/SAyeVKdrqUOLZ11025sU7f
	1AshiAdrOfmjYHQB3SKV2z7lT15rgq7lhBopOBefhsYFeiubu+hO5v5TBbQQm297X5yWYKdmeMO
	p7bTxzTmF0nuGYFl0s1hMEn0DgaNTowv1AimrHfyhGXaynsEpyYGfCLn2gVUJ5t9EDPx3oF0UcP
	x07ldxe47vy1cmi2KcinLp7prsnNjgsYEzMVPcy9OAX1cM0nBFzW5Q4sHQBAlzrU+q7LF0GQe2j
	NtFylSQE92kukmj2sl1Z8fbP6T
X-Received: by 2002:a05:600c:4ec7:b0:47d:586e:2fea with SMTP id 5b1f17b1804b1-482db46b38dmr68726415e9.15.1769856869427;
        Sat, 31 Jan 2026 02:54:29 -0800 (PST)
Received: from [10.100.159.246] ([213.233.108.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1354205sm29033129f8f.41.2026.01.31.02.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 02:54:28 -0800 (PST)
Message-ID: <09f5ae66-9e38-4733-bdb1-044c41a996a5@tuxon.dev>
Date: Sat, 31 Jan 2026 12:54:25 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 18/31] clk: at91: clk-i2s-mux: add support for
 parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <0d5517f708a262924c6aa6f97a23d078891c218a.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <0d5517f708a262924c6aa6f97a23d078891c218a.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> 
> Add support for parent_data in i2s mux clock driver.
> With this parent-child relation is described with pointers rather
> than strings making registration a bit faster.
> 
> All the SoC based drivers that rely on clk-i2s-mux were adapted
> to the new API change. The switch itself for SoCs will be done
> in subsequent patches.
> 
> Signed-off-by: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
