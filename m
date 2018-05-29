Return-Path: <horms@verge.net.au>
Date: Tue, 29 May 2018 17:13:45 +0100
From: Simon Horman <horms@verge.net.au>
To: Gilad Ben-Yossef <gilad@benyossef.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will.deacon@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Ofir Drang <ofir.drang@arm.com>, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH v2 3/5] crypto: ccree: silence debug prints
Message-ID: <20180529161345.rhx73mixbnxrfzum@verge.net.au>
References: <1527171551-21979-1-git-send-email-gilad@benyossef.com>
 <1527171551-21979-4-git-send-email-gilad@benyossef.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1527171551-21979-4-git-send-email-gilad@benyossef.com>
List-ID: <linux-clk.vger.kernel.org>

On Thu, May 24, 2018 at 03:19:08PM +0100, Gilad Ben-Yossef wrote:
> The cache parameter register configuration was being too verbose.
> Use dev_dbg() to only provide the information if needed.
> 
> Signed-off-by: Gilad Ben-Yossef <gilad@benyossef.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
