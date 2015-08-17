Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-id: <55D1434F.1040502@samsung.com>
Date: Mon, 17 Aug 2015 11:13:35 +0900
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
MIME-version: 1.0
To: Chanwoo Choi <cw00.choi@samsung.com>, s.nawrocki@samsung.com,
	tomasz.figa@gmail.com, kgene@kernel.org
Cc: mturquette@baylibre.com, sboyd@codeaurora.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] ARM: dts: Add MSHC2 dt node for Exynos3250 SoC
References: <1439264784-30322-1-git-send-email-cw00.choi@samsung.com>
 <1439264784-30322-5-git-send-email-cw00.choi@samsung.com>
In-reply-to: <1439264784-30322-5-git-send-email-cw00.choi@samsung.com>
Content-type: text/plain; charset=windows-1252
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 11.08.2015 12:46, Chanwoo Choi wrote:
> This patch add the MSHC2 (Mobile Storage Host Controller) devicetree node for
> Exynos3250 SoC.

s/add/adds/
s/devicetree/Device Tree/

> 
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>  arch/arm/boot/dts/exynos3250-pinctrl.dtsi | 35 +++++++++++++++++++++++++++++++
>  arch/arm/boot/dts/exynos3250.dtsi         | 13 ++++++++++++
>  2 files changed, 48 insertions(+)

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof

