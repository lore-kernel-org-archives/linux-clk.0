Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797526;
	b=Jbyl2aHW3tN7a8GcjzmW0fHGHxc2Cb2R0WD2YM6r81N4q/XQzKQqud+1F4JA3oixiNmj
	 pkI79AS0OuAp18jGbtXTKotDTIMvQ94PgdJGBXI8SQRJTOlQaBjkAeSkYGfQO6+7ZFuoU
	 0vfE/w1hwjz4VfIBjP4A7SGE8hN3S4S5Q23f2LaK1GsCKlMDCEVxo5CDe0+dlCUYeIr8p
	 1+7qQFvBhSO5ySjb1CbU2LEUOBXjay0MVUrS+NTfO7MnRltAkWK2QlMJggLv/Hsuzn5FY
	 0ldqJ9Q74pZzfAlq+DtN0jZjE9vgdRN1L3EwpO63tH/8bVmdw2uexD9VqxPxDRAcy4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797526;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LPKBxmhyg89L22fIaf9IQyOx1ftYYGNVMEyFVHYOx+w=;
	b=vq6dtigpNFXPAo8KEcYsLpXU+DV5qP1s6BXD26fD1yfB4HgU9pakNNtM2CZwAIGWDOlq
	 +uSd+12+KzpTh6vOe9/5HcYw6Y73kSGriob7tgoe9OB94Sato/BFDZpqHbAenNiNyECmH
	 zhvpT5ilyHgiPyOvla7Rc7tZYxH1jmHWzmQskhE0nEgm5kSsqWifFcmwFUNx5CY/X2sib
	 aYRrjGeBrHLMuv0RRxAl78CFfyU2VkfVqt9XKK33w3buaxAxUJOdBp6Jo4io6lzTqPLvf
	 AktIfrioz962w27Za6UWxUodsz3iBZy2GM8CmlvEiLnGBEFopOrTWZYU/sed2DGHNWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WLqSLvYw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02050606A326
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 13:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WLqSLvYw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFBDC1F00A1F
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 13:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793797525;
	bh=LPKBxmhyg89L22fIaf9IQyOx1ftYYGNVMEyFVHYOx+w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WLqSLvYwRuBRb2z2uy097jLLlVZenw1O0Ud3+HdLZPMW2W/yzMsw4PoGFqDOIDUwu
	 bYeTnemOekwxxrWyrcu3N1/2zGODfTWspcTCv2AIYLDuBbLuQUV8lPQQYsoeeaXIZo
	 s9pxZA4n1vrlJHdLmklh37T+D8AiUXYc4GVoPjPUCjjcMlonowAys/U2PRW90Kfnup
	 tuf9hIDTCB7oNt5tvVL+asbU98CD4ARrQUGqF8Nf8SlgNeuq/Vl88CJ3YEo52TiM8A
	 criMClDoEAWjWwpB9F04k/fO5WKv51xfXn5g8+JQfVgeQbC0d/BD2BPOItMFG3+Cjh
	 JM4GUMBVSYcnA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5ba36cc21cdso656447e87.1
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 05:05:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByim28PqMo2bNp0m4fwcazIVl8MTxz6CNYkE5dOmp3BgJcneDukU03rfFPQ1owqQz+GhLRNt5m8K2A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TLzvfdT8RAqAUcjSPky6WOU+9StHnwzf8gC3wd9EFvPTcK3nk
	ORxdyqc6VsM6mtXqtihchgQmqpU5oWFagDoJtVnXDP3OyYMOtKjPgRlw/b/Zwet6endE+udY1/N
	nSe2wkW0xljLAwQHBj9SI60N1iPXjz+o=
X-Received: by 2002:a05:6512:3a89:b0:5bc:c446:760c with SMTP id
 2adb3069b0e04-5bfd956f3c7mr5830020e87.48.1793797524594; Wed, 04 Nov 2026
 05:05:24 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-add-board-ok3572-c-v1-0-0b0fd85a31ee@qq.com> <20261022-add-board-ok3572-c-v1-6-0b0fd85a31ee@qq.com>
In-Reply-To: <20261022-add-board-ok3572-c-v1-6-0b0fd85a31ee@qq.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:05:11 +0100
X-Gmail-Original-Message-ID: <CAD++jLkfnsnqr9DeJG1UY1BNPmXV=L1fh0o1fRgq2N70k3Aq2A@mail.gmail.com>
X-Gm-Features: AclHuK_mv5t_ofBXXvFmTtsscxk8ZZZWMu9yfbYuWEEuKyuLUDpVdyNQz1Is1sQ
Message-ID: <CAD++jLkfnsnqr9DeJG1UY1BNPmXV=L1fh0o1fRgq2N70k3Aq2A@mail.gmail.com>
Subject: Re: [PATCH 06/27] dt-bindings: gpio: rockchip: Add RK3572 GPIO banks
To: 1579567540@qq.com
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Elaine Zhang <zhangqing@rock-chips.com>, Lee Jones <lee@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, David Wu <david.wu@rock-chips.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Shawn Lin <shawn.lin@rock-chips.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	mfd@lists.linux.dev, linux-gpio@vger.kernel.org, netdev@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-phy@lists.infradead.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 6:12=E2=80=AFPM Cunhao Lu via B4 Relay
<devnull+1579567540.qq.com@kernel.org> wrote:

> From: Cunhao Lu <1579567540@qq.com>
>
> RK3572 GPIO banks have four parent interrupts and a separate debounce
> clock.
>
> Signed-off-by: Cunhao Lu <1579567540@qq.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Perhaps Bartosz can just apply this one patch to shrink the series?

Yours,
Linus Walleij
