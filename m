Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-id: <55B0377D.10908@samsung.com>
Date: Thu, 23 Jul 2015 09:38:21 +0900
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
MIME-version: 1.0
To: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Cc: Sangbeom Kim <sbkim73@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	"open list:SAMSUNG MULTIFUNCTION PMIC DEVICE DRIVERS"
	<linux-kernel@vger.kernel.org>,
	"open list:SAMSUNG MULTIFUNCTION PMIC DEVICE DRIVERS"
	<linux-samsung-soc@vger.kernel.org>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: s2mps11: Use kcalloc instead of kzalloc for array
 allocation
References: <1437557693-29433-1-git-send-email-vaibhav.hiremath@linaro.org>
In-reply-to: <1437557693-29433-1-git-send-email-vaibhav.hiremath@linaro.org>
Content-type: text/plain; charset=windows-1252
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 22.07.2015 18:34, Vaibhav Hiremath wrote:
> This patch cleans up the driver for,
> 
>   - Use devm_kcalloc varient instead of devm_kzalloc for array
>     allocation.
>   - clk_prepare/unprepare, remove "ret" variable as it is not required
>   - use __exit for cleanup function
> 
> As I am referring this driver as a reference for my 88pm800 clk driver,
> applying same changes here as well.
> 
> Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>
> ---
> Since I do not have platform to test, it would be helpful if someone
> tests it for me.
> I have build tested it.
> 
>  drivers/clk/clk-s2mps11.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)

Looks good, simplifies the code and fixes the __init/__exit.

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
