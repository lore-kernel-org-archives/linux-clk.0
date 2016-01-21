Return-Path: <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3 3/4] clk: s2mps11: remove redundant static variables
 declaration
To: Andi Shyti <andi.shyti@samsung.com>, linux-samsung-soc@vger.kernel.org
References: <1453284864-8082-1-git-send-email-andi.shyti@samsung.com>
 <1453284864-8082-4-git-send-email-andi.shyti@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Andi Shyti <andi@etezian.org>,
 Yadwinder Singh Brar <yadi.brar01@gmail.com>,
 Jaehoon Chung <jh80.chung@samsung.com>
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Message-id: <56A02663.3030302@samsung.com>
Date: Thu, 21 Jan 2016 09:29:23 +0900
MIME-version: 1.0
In-reply-to: <1453284864-8082-4-git-send-email-andi.shyti@samsung.com>
Content-type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 20.01.2016 19:14, Andi Shyti wrote:
> The clk_table and clk_data are declared static. The clk_table
> contains the three clock data stractures belonging to the s2mps11

s/stractures/structures/

Rest looks good:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
