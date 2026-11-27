Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771036;
	b=i+nCD59D8c+xLApUbxU0vM8LFVn93p1xS5iPJzWjoOOniEl4DaMHov61Q/hB2f8iwjzr
	 5BhhTJdgLuCa0HzKbIKlEj6q/ONegfT8vZJTsKI4F6/h4Mxqa16zUApMBHjrzVJoBRvyt
	 ZCtUXOZ33V65Coox3Evclo7N05y419ZFpVUaiMJLbz73xU0l6N/iWClWnKlEvOy84yrwX
	 f3FQ5o1CK0QOA9wZnfJB73iQu6qixSvbQgMxriwJQhCKwfm/f8hRMIDi0PWkJxP+YPPib
	 rTK+sawTMCABedClgC/fVswPFqNZfo/H8ZUwh/Wac5JOHqhJFe1BkgRG8yAxNztVD5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=F15I2fevZFaSQ3g9iMuUelugyCWRoLXcJodfxUxh7tw=;
	b=St1b6eV+ljHFB/gm8R5rMX1jJ7QxXNL6L7YPanZk23137m/u/igt+K5pOGRaaKLOt72j
	 dTAAbNLYxnr9mXMrl8we9wad9x067xRi8LYj9bS0RZkdedEFfH6A5JWSh29uCV2DqRnWX
	 gISgHpnNy4+TmR2j0GRP8w3D+gSuGUuxT+UlMpILnNlD002rIquK1Mc6DvqgBSOaKBhab
	 RgfDIb+gCpiGeiXsEe4wyrRxxSWs0sYjdmUSF8ixzm39SHhaU2nRlVWnGNavvp8c4QE2D
	 EbIX5ORwQZGuuWkTCH4O0wvMtGm7Ppav+CM2Y0VANnX5enlxqMv9nzG8JMyVbSoZZwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	dkim=pass header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=iBRw+JF7;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5158D606A327
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 09:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5158D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=iBRw+JF7
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-49412eb1474so5164903f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 01:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1795771034; x=1796375834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F15I2fevZFaSQ3g9iMuUelugyCWRoLXcJodfxUxh7tw=;
        b=iBRw+JF7XI+FsbMljrWUMpxaiKKpfOzx9BNFr1VLGWhsoqp2VSaP5SWnYO8z1hBxgi
         IQNbBMdeJhsysl+DyR6W0NanRt2DWD8sIglYpY/x5UY1LoWAgPv5ZUnnBfND0YLbUSfl
         Itsk0XaTbtlowa3WI5Gxl3k5nAWrW+1EmwyyX02Xxa/mHvv+dh/iykowrav92nNUb9uO
         Bj83vjke6GeDzVChb/+X4O5URXYdSZf9UGvHEF7bClbXmYZAtIIFShgddgG0GM0/SIrH
         tcAyTh1+lo13Kmdf0MVGZ9iMoPoBNW3igWAXE0c5LOGBN4lH4dIidyqeIIR4bXjt1rJi
         qmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771034; x=1796375834;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F15I2fevZFaSQ3g9iMuUelugyCWRoLXcJodfxUxh7tw=;
        b=rAo/HD610MKnFnV72B2o6AEvF3bC/SgxOlrMmqCT0ondynCDvsaJVYXYaQZguAfTAB
         CMOOZPTLpgfNbw5M3ENXr6crFVJrxzbMpK+NYfID35Lj6EE1MRpXRa328m3sMIrgO6Hc
         SwEIbea8pmvB2XtKyx2ZXzoolAO7/JE1Web6iyA+B859J34QGN639/k3VcATkR2lc0hY
         /5KpkEyX6sW5NudSJbFRbg/9u4v943cGPF5/GomqW31DWVLSM9Yd14LItB+2J5dICwy9
         j3AlFVxnl1gDTtB99NLhVcjO2voOQXXjr4mQk3uUQ/o+oEPjJB40xFBsgDVru3uWxAFh
         ffYA==
X-Forwarded-Encrypted: i=1; AL+hErETW2LrVE6q9qSNlrYLgLcOUKOvJSxxUr++J1dhWtDOIDLE0170ydkoTOrZK8NuodxssFPuL++QZb8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9X9ELXbo1bSNqepY52YbQiUj2GZZqEG6pj0AagxI8SXpsBGZPS
	m+yA9JN7WM4oWt885lVwW55L6TPNVu2o54yu3PxqDk0HmdQbMgTeJ0b8W9TJpeAtX2o=
X-Gm-Gg: AZFdTZdgJxRZd0Ftw5JbvzCQ0HVMbIdx7eHGPfm3tyk19as7alp5GCvbOSt88+4ZmjB
	APk9aYxyLUFfsrBOoTKBYtwbNg1/V3dGkRG7ynmfmutHVY45/JuDwS6FtUOJJR3fw3WScnGvZKF
	CO7pKioYc9na76IckC5yUU8dVIn9ITRC56Uy45Drm4pgNac2e7zwHq2pWVb08ZJRGVwxlIG0XNn
	iOFozPtR9VkuxkrKR41bLz0xAKLVHtXxiBnJeOWcbnIvCar/cnb1T+HqBVu5CBZbJ+4UPhWHcvR
	lobDe72Q33jx+SSX3pDk5kHFOzYVz2zFgScGXyzdbxLXVtuMyFydPOi7BIDfLYw+gzKoEQUJAzb
	OoYphwGCypANfmVoJbSbxPYqVFTZ/zYC2Cjgx+yFLtJ3wCSXHFqEE/OGsdOtD7UR6xIZR0DwPHg
	YgPSyckFv0B1TOdGe3/rWKYjAm+Su8toE5jNC6OsDpVV6oI3fzjsqGLYK6iVPMoKM/wONrdkTjx
	w5RpsgiDexJWOKTMXQCBmVnEML8QK9oZjtoMJGqXokeY1vo/AkHHcYcn0bRTbrWSd+igI85915u
	ENIfBelvuuDxAkGK+YzghBMvwBGgZZZ+2BYp
X-Received: by 2002:a05:6000:2f87:b0:4a6:bc53:246b with SMTP id ffacd0b85a97d-4abb5144ebdmr45324253f8f.30.1795771033589;
        Fri, 27 Nov 2026 01:17:13 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm45914055f8f.42.2026.11.27.01.17.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:17:13 -0800 (PST)
Message-ID: <bc1ac983-16ba-4165-9827-a7cde032c988@tuxon.dev>
Date: Fri, 27 Nov 2026 11:17:11 +0200
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] pinctrl: renesas: rzg2l: Add RZ/G3L support for
 selecting I3C power source
To: Diogo Ivo <diogo.ivo.sx@renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
 <20261026-divo-ssgrlpcsrc-2966-i3c-v2-6-2e76b87209bb@renesas.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-6-2e76b87209bb@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/26/26 13:35, Diogo Ivo wrote:
> The Renesas RZ/G3L I3C pins can be powered at either 1.8V or 1.2V.  The
> pin controller provides a register to select between these two options.
> On RZ/G3L the I3C signals are multiplexed on the P2 port pins.  Update
> the Renesas RZ/G2L pin controller driver to allow selecting the I3C
> power source on RZ/G3L SoC.
> 
> Signed-off-by: Diogo Ivo<diogo.ivo.sx@renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
