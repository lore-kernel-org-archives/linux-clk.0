Return-Path: <k.kozlowski@samsung.com>
Message-id: <5546CFB5.3040105@samsung.com>
Date: Mon, 04 May 2015 10:47:33 +0900
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
MIME-version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Mike Turquette <mturquette@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Barry Song <baohua@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Alexandre Courbot <gnurou@gmail.com>, linux-mips@linux-mips.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
 Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 3/8] clk: tegra: Fix inconsistent indenting
References: <1430196383-9190-1-git-send-email-k.kozlowski@samsung.com>
 <1430196383-9190-4-git-send-email-k.kozlowski@samsung.com>
 <20150501184655.GA29653@codeaurora.org>
In-reply-to: <20150501184655.GA29653@codeaurora.org>
Content-type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 02.05.2015 03:46, Stephen Boyd wrote:
> On 04/28, Krzysztof Kozlowski wrote:
>> Fix the indentation - spaces used instead of tabs and actually wrong
>> number of spaces.
>>
>> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> ---
>>   drivers/clk/tegra/clk-emc.c | 16 ++++++++--------
>>   1 file changed, 8 insertions(+), 8 deletions(-)
>
> What branch is this against? I don't see this in linux-next or
> clk-next.

It was rebased on next-20150427. But now I cannot find it in newer 
next... Could you skip these two patches then?

Best regards,
Krzysztof
