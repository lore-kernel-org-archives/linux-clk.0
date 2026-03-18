Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD0521423C
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 00:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773794649; cv=none; b=F3Ikx7w7PvBAOq22sh84F+686og06aNyNyRATN+4VPjcJBzXsfV0ZRxo9O1Izq1Ge//mF26b3vuMTu8+edgE4KG/75vTvs8YVexrEYAOzlRZis+YmQN1rKUuZ8N55dFYAFhFIsNJ2zvP1zhIuLv1pWqWgvODUjBttuiVM8jEXg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773794649; c=relaxed/simple;
	bh=NGoE1cDoBcTftVSQ+ZwV650yL2LvXWLP8EZteCeKrZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SphBn8AgSOomRslLvTDWAWJvuf2DNRiTw0fUbLEAZkzCLwgCipys/ECWnLRySHzdwYi2Ckv30Tnp3edgcPWyuwUhJIxxRiCMMRAnynfyEzkA/KO8cXmJeYuH7HzejuFEA1Ej50cQczyAhrfKeL9QSwIiKqRngrrwQsFbQlln8Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pardini.net; spf=pass smtp.mailfrom=pardini.net; dkim=pass (2048-bit key) header.d=pardini.net header.i=@pardini.net header.b=Am4pLtbB; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pardini.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pardini.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pardini.net header.i=@pardini.net header.b="Am4pLtbB"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2c0d36f3888so2301678eec.0
        for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 17:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pardini.net; s=google; t=1773794646; x=1774399446; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z3klIIEcX92zdVI267329I5bjpI/sVO4ClpefsxUOMo=;
        b=Am4pLtbBfWD8PZl2n9Y7ItBgJdRHbJJ4wRz1cPJQN8FUEya/Yygcsn9a72XH9rRWm4
         hUEHdRynGCs+9UQrxAKx6CLuDjmWX375X8Ha5BuBSObcR92FES47CDAZ8okf0eG8NarZ
         cc82nxQnts02QJ1FtHaQ80BoklPoMIllO/RA2cOB6PBO6MBoEG2pOwG9LS4SnxOOh/eh
         NEUPYIfHI9ARRZXQjl7OPyoBHEXwtQgolKeRhgNxoqd9JXcuLouqS9v7sknKygdMPaoo
         qzNJvxdC4htViSbAY1sfr0z+3QF+oBZVuVtYBnJLhRsh7VTo/GKHM832wjW3SK5Q0/FO
         fc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773794646; x=1774399446;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3klIIEcX92zdVI267329I5bjpI/sVO4ClpefsxUOMo=;
        b=Snj7EG9PGZNQ483nrD6p02d74H/3Ly4/IdwcXfPrtHGVw1gaMmXCKK4XVhn560dlNC
         RrKKmIBRThiIvc6JhA3droZuq/5aGuybNh+8gJ/8LXdVwP4eJVY53HZbNQuzVhGJKCCZ
         JTi6yY7WLggiMCtqJTx8hSILQkdsLsBPvge346jF3f5h691wi5NCTzpLo4RsYu6YLRIo
         e/Nq+YLI5IBmtFQr1bLTpi4OgA5KTy6ralF4gTZn8K7GOWDZT1QCBRbxkVTU/LQ6NOZ5
         WHthTFihMt2tigYSZqJ7WTKGeJbhDtKRYIcIlHg7tBJnpq4aN/id5gSYV5DrDGsU7Grw
         KRVQ==
X-Gm-Message-State: AOJu0YwMzxUBnIK38kpjULU60xpzl8RsY7wgdN9w4YgDPJcbHAe6sajE
	3/viKGfeIBP3XWltpNRDzFaC3wwyGsVCDPxCEBxRMxsgeIYM0zAcGLoFVu6axc2GmA==
X-Gm-Gg: ATEYQzwqJY3ZaJxTPYisw/W54KSuOO0G9gd8CIhAi+pDpsNyNLk2yCyMddXBIIYKsnp
	HjRAn1ZuCELFMNL+/afSgfJqOuKhL1SjahXR3Tue0iZ0PurD0JFldJ6S2uCr+lTHnoJ+6aDZnAV
	2bA7ILhmndJamLtdMCfk/1qI+Hs/987alFaH3ksBlATiy9Vb2Ogx9AyiLm9KHrIUGzSl+kldJr3
	FAP1GjYBad28brTcO1XeHKBB8NTLHEuVe7o+CMosDkuhmTnIYUPeOo7TeBcxqXKOvH2PQ6pAZrX
	naW/Gk4RjGn853Bd6bPiR/3zII851UWMy7p3UXYpd1zJ1dOyh5VEC4xsp0xVJ72dbtgePDls4gB
	trrGF7oTcrmtun7vJra1/gwEw2M+mwKsiq351fEH1QE7tG34ER3ABsUaQcCGT7CSkPu0o1jfaoo
	FXhVz9zWb8+hj3EGHga6yMmM5q59SQGKltPwV8l8Zx088OSl8Rk4kZZ//2+35mxtS1aqs2tjzY6
	WTxjzKBVr0Gl/zpSg==
X-Received: by 2002:a05:7300:ad2d:b0:2ba:6723:503d with SMTP id 5a478bee46e88-2c0e5193913mr637584eec.20.1773794646317;
        Tue, 17 Mar 2026 17:44:06 -0700 (PDT)
Received: from ?IPV6:2804:7f0:6980:fbfc:7d22:811:8e46:acbe? ([2804:7f0:6980:fbfc:7d22:811:8e46:acbe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e55ee672sm1972724eec.28.2026.03.17.17.44.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 17:44:05 -0700 (PDT)
Message-ID: <c8f0883b-6000-4439-a716-4436100ffc25@pardini.net>
Date: Tue, 17 Mar 2026 21:44:00 -0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] clk: rockchip: rk3588: add I2S MCLK output gate
 clocks
To: Daniele Briguglio <hello@superkali.me>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
References: <20260316-rk3588-mclk-gate-grf-v1-0-66fb9a246718@superkali.me>
Content-Language: en-US
From: Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <20260316-rk3588-mclk-gate-grf-v1-0-66fb9a246718@superkali.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/03/2026 10:06, Daniele Briguglio wrote:
> On RK3588, the four I2S master clock (MCLK) outputs to external IO
> pins are gated by bits in SYS_GRF SOC_CON6 (offset 0x0318). These
> are set-to-disable gates with hiword mask semantics.
> 
> The TRM documents the reset value of these bits as 0 (gate open),
> but in practice the Rockchip firmware (BL31) may set them during
> early boot, preventing the MCLK signal from reaching external audio
> codecs. The kernel should manage these gates explicitly so that
> audio functionality does not depend on bootloader register state.

Hi Daniele,

This series fixes ES8388 audio on a board (Mekotronics R58X-Pro) which 
I've not "yet" sent to the list due to lack of time but also because 
analog audio was not working.

Without these patches, the i2s0_8ch_mclkout_to_io gate remains closed
(enable_count=0 in the clk_summary), and the codec receives no master
clock. DAPM reports all widgets as powered on and playback streams run
without errors, but the hardware produces no sound — a rather
frustrating failure mode to debug.

With the series applied and the board DTS updated to reference
I2S0_8CH_MCLKOUT_TO_IO from the codec node:

     es8388: audio-codec@10 {
         compatible = "everest,es8388", "everest,es8328";
         reg = <0x10>;
         clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
         assigned-clocks = <&cru I2S0_8CH_MCLKOUT>;
         assigned-clock-rates = <12288000>;
         ...
     };

audio playback then works correctly, tested on headphone output; thus:

Tested-by: Ricardo Pardini <ricardo@pardini.net>

Thanks a lot!

--
Regards,
Ricardo
