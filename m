Return-Path: <javier@osg.samsung.com>
Subject: Re: [PATCH v2 19/22] ARM: dts: exynos: MCT is not an interrupt
 controller and extend length of iomap
To: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <1462734367-5619-1-git-send-email-krzk@kernel.org>
 <1462734367-5619-20-git-send-email-krzk@kernel.org>
From: Javier Martinez Canillas <javier@osg.samsung.com>
Message-ID: <cd2cfef1-f9a8-0daa-e4bc-c00b0943c52e@osg.samsung.com>
Date: Mon, 9 May 2016 17:44:54 -0400
MIME-Version: 1.0
In-Reply-To: <1462734367-5619-20-git-send-email-krzk@kernel.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

Hello Krzysztof,

On 05/08/2016 03:06 PM, Krzysztof Kozlowski wrote:
> Multi-Core Timer generates interrupts but it is not really an interrupt
> controller so remove the "interrupt-controller" and "interrupt-cells"
> properties. Additionally extend the length of mapped memory to cover all
> registers (last SFR is at 0x0A40).
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
