Return-Path: <andi.shyti@samsung.com>
Date: Mon, 20 Jun 2016 19:13:05 +0900
From: Andi Shyti <andi.shyti@samsung.com>
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Andi Shyti <andi@etezian.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 linux-clk@vger.kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Jaehoon Chung <jh80.chung@samsung.com>
Subject: Re: [PATCH] clk: samsung: exynos5433: use clock_ignore_unused flag for
 SPI3 related clocks
Message-id: <20160620101305.GA6783@samsunx.samsung>
References: <1466151362-2881-1-git-send-email-andi.shyti@samsung.com>
 <CA+Ln22F9eskcpnFkrnVFc3dJqCJcJ5O-STfXC-8Om5MK-THwNg@mail.gmail.com>
 <20160619055921.GA424@jack.zhora.eu>
 <CGME20160619134424epcas1p31493dfce45a8c817bc353702a07fa4bb@epcas1p3.samsung.com>
 <CA+Ln22HHNnPuEq1WVs+iiEEbAhdvkADhVkj99pqgR0qJODFUXw@mail.gmail.com>
 <20160620054157.GA6498@samsunx.samsung>
 <CA+Ln22FcKQTq4XhHQPd=Y-B_cUMzFd51ZPkgwrtP_KsqUVxnJA@mail.gmail.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
In-reply-to: 
 <CA+Ln22FcKQTq4XhHQPd=Y-B_cUMzFd51ZPkgwrtP_KsqUVxnJA@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

> Unfortunately I have to NAK this patch. Please add proper support for
> them to the SPI driver.

I agree, this is quite a lazy solution.

But your comment is giving me more work than what I was willing
to have, also because in this driver the SPI1 is aslo using
CLK_IGNORE_UNUSED :)

Thanks for your review,
Andi
