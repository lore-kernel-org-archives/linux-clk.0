Return-Path: <sboyd@codeaurora.org>
Date: Tue, 22 Nov 2016 13:39:00 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	michael.scott@linaro.org
Subject: Re: [PATCH 1/2] clk: qcom: clk-smd-rpm: Fix clk_hw_onecell_data
 references
Message-ID: <20161122213900.GB25626@codeaurora.org>
References: <20161121140450.12353-1-georgi.djakov@linaro.org>
 <20161121231312.GZ25626@codeaurora.org>
 <e70a844a-c8c3-68b3-2cce-7296bfed2b12@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <e70a844a-c8c3-68b3-2cce-7296bfed2b12@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 11/22, Georgi Djakov wrote:
> On 11/22/2016 01:13 AM, Stephen Boyd wrote:
> >On 11/21, Georgi Djakov wrote:
> >>The clk_hw_onecell_data struct is missing references to the
> >>actual clocks. Fix this.
> >>
> >>Reported-by: Michael Scott <michael.scott@linaro.org>
> >>Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> >>---
> >> drivers/clk/qcom/clk-smd-rpm.c | 20 +++++++++-----------
> >> 1 file changed, 9 insertions(+), 11 deletions(-)
> >>
> >>diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> >>index a27013dbc0aa..58821f7213b0 100644
> >>--- a/drivers/clk/qcom/clk-smd-rpm.c
> >>+++ b/drivers/clk/qcom/clk-smd-rpm.c
> >>@@ -148,8 +148,7 @@ struct clk_smd_rpm_req {
> >>
> >> struct rpm_cc {
> >> 	struct qcom_rpm *rpm;
> >>-	struct clk_hw_onecell_data data;
> >>-	struct clk_hw *hws[];
> >>+	struct clk_hw_onecell_data *data;
> >
> >How about rolling our own xlate function to return hw pointers?
> >We already have a list of hws here, so it doesn't seem like much
> >more to do.
> 
> We could do this, but is there any benefit of adding and using our own
> xlate function instead of the of_clk_hw_onecell_get, which is already
> there? Maybe I'm missing something..?
> 

Yes, the benefit is reusing the static array of rpm clocks that
already exist. In a sense, we already have the hw_onecell_data
array in those list of clocks. Now we just need to implement the
function to return them to the framework when the appropriate
identifier is requested.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
