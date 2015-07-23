Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1437476823-3358-5-git-send-email-vaibhav.hiremath@linaro.org>
References: <1437476823-3358-1-git-send-email-vaibhav.hiremath@linaro.org>
	<1437476823-3358-5-git-send-email-vaibhav.hiremath@linaro.org>
Date: Thu, 23 Jul 2015 13:58:11 +0900
Message-ID: <CAJKOXPd_cKoj05DmriyKu3xrNMtEr0A=CsRJJP2-JZ0JyrdOrQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] mfd: 88pm800: Add support for clk subdevice
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
To: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
	mturquette@baylibre.com, lee.jones@linaro.org,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

2015-07-21 20:07 GMT+09:00 Vaibhav Hiremath <vaibhav.hiremath@linaro.org>:
> This patch adds mfd_cell/clk-subdevice for 88PM800 MFD
> (and family of devices).
>
> Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>
> ---
>  drivers/mfd/88pm800.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>

Looks OK:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
