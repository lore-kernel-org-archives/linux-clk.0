Return-Path: <k.kozlowski.k@gmail.com>
MIME-Version: 1.0
Sender: k.kozlowski.k@gmail.com
In-Reply-To: <1437476823-3358-3-git-send-email-vaibhav.hiremath@linaro.org>
References: <1437476823-3358-1-git-send-email-vaibhav.hiremath@linaro.org>
	<1437476823-3358-3-git-send-email-vaibhav.hiremath@linaro.org>
Date: Thu, 23 Jul 2015 14:08:03 +0900
Message-ID: <CAJKOXPeUJ-7je67q+9X1_FcFiczoQ6rqwMAoPLswapFEmqGGVg@mail.gmail.com>
Subject: Re: [PATCH 2/4] mfd: devicetree: bindings: Add clock subdevice node information
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
To: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>, mturquette@baylibre.com,
	linux-kernel@vger.kernel.org, robh+dt@kernel.org, lee.jones@linaro.org,
	linux-clk@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

2015-07-21 20:07 GMT+09:00 Vaibhav Hiremath <vaibhav.hiremath@linaro.org>:
> This patch updates the binding documentation for optional
> clocks node and related information for buffered 32KHz clock.
>
> Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>
> ---
>  Documentation/devicetree/bindings/mfd/88pm800.txt | 28 +++++++++++++++++++++++
>  1 file changed, 28 insertions(+)

+Cc Stephen Boyd (clocks)

We had a discussion whether clock bindings should be put in MFD
bindings documentation or into separate file in bindings/clock but
either way is fine for me:

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
