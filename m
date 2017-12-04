Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Mon, 4 Dec 2017 15:49:32 -0600
From: Rob Herring <robh@kernel.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: sboyd@codeaurora.org, jassisinghbrar@gmail.com,
	bjorn.andersson@linaro.org, mturquette@baylibre.com,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v10 5/6] dt-bindings: mailbox: qcom: Document the APCS
 clock binding
Message-ID: <20171204214932.u5rbrwzijoknqry3@rob-hp-laptop>
References: <20171201170224.25053-1-georgi.djakov@linaro.org>
 <20171201170224.25053-6-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20171201170224.25053-6-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On Fri, Dec 01, 2017 at 07:02:23PM +0200, Georgi Djakov wrote:
> Update the binding documentation for APCS to mention that the APCS
> hardware block also expose a clock controller functionality.
> 
> The APCS clock controller is a mux and half-integer divider. It has the
> main CPU PLL as an input and provides the clock for the application CPU.
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---
>  .../bindings/mailbox/qcom,apcs-kpss-global.txt         | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
