Return-Path: <s.nawrocki@samsung.com>
Subject: Re: [RFC PATCH 03/15] clk: samsung: exynos4: fixup reg access on be
To: Matthew Leach <matthew@mattleach.net>
References: <20160608183110.13851-1-matthew@mattleach.net>
 <20160608183110.13851-4-matthew@mattleach.net>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>,
 linux-clk@vger.kernel.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <575A8DBC.4070403@samsung.com>
Date: Fri, 10 Jun 2016 11:51:56 +0200
MIME-version: 1.0
In-reply-to: <20160608183110.13851-4-matthew@mattleach.net>
Content-type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 06/08/2016 08:30 PM, Matthew Leach wrote:
> Use the byte-order aware big endian accessors, allowing for kernels
> running under big-endian.
> 
> Signed-off-by: Matthew Leach <matthew@mattleach.net>

Patch applied, thanks.
