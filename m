Return-Path: <sboyd@codeaurora.org>
Date: Thu, 11 Feb 2016 16:32:43 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: mturquette@baylibre.com, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 5/6] clk: qcom: gdsc: Add mmcc gdscs for msm8996 family
Message-ID: <20160212003242.GA4847@codeaurora.org>
References: <1448986336-16846-1-git-send-email-rnayak@codeaurora.org>
 <1448986336-16846-6-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1448986336-16846-6-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 12/01, Rajendra Nayak wrote:
> Add all gdsc data which are part of mmcc on msm8996 family
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Applied to clk-next, but I dropped dtsi changes and squashed in
this patch

---8<---
diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
index a0a7338c67d1..6df7ff36b416 100644
--- a/drivers/clk/qcom/mmcc-msm8996.c
+++ b/drivers/clk/qcom/mmcc-msm8996.c
@@ -2918,7 +2918,7 @@ static struct clk_hw *mmcc_msm8996_hws[] = {
 	&gpll0_div.hw,
 };
 
-struct gdsc mmagic_video_gdsc = {
+static struct gdsc mmagic_video_gdsc = {
 	.gdscr = 0x119c,
 	.gds_hw_ctrl = 0x120c,
 	.pd = {
@@ -2928,7 +2928,7 @@ struct gdsc mmagic_video_gdsc = {
 	.flags = VOTABLE,
 };
 
-struct gdsc mmagic_mdss_gdsc = {
+static struct gdsc mmagic_mdss_gdsc = {
 	.gdscr = 0x247c,
 	.gds_hw_ctrl = 0x2480,
 	.pd = {
@@ -2938,7 +2938,7 @@ struct gdsc mmagic_mdss_gdsc = {
 	.flags = VOTABLE,
 };
 
-struct gdsc mmagic_camss_gdsc = {
+static struct gdsc mmagic_camss_gdsc = {
 	.gdscr = 0x3c4c,
 	.gds_hw_ctrl = 0x3c50,
 	.pd = {
@@ -2948,7 +2948,7 @@ struct gdsc mmagic_camss_gdsc = {
 	.flags = VOTABLE,
 };
 
-struct gdsc venus_gdsc = {
+static struct gdsc venus_gdsc = {
 	.gdscr = 0x1024,
 	.cxcs = (unsigned int []){ 0x1028, 0x1034, 0x1038 },
 	.cxc_count = 3,
@@ -2959,7 +2959,7 @@ struct gdsc venus_gdsc = {
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
-struct gdsc venus_core0_gdsc = {
+static struct gdsc venus_core0_gdsc = {
 	.gdscr = 0x1040,
 	.cxcs = (unsigned int []){ 0x1048 },
 	.cxc_count = 1,
@@ -2969,7 +2969,7 @@ struct gdsc venus_core0_gdsc = {
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
-struct gdsc venus_core1_gdsc = {
+static struct gdsc venus_core1_gdsc = {
 	.gdscr = 0x1044,
 	.cxcs = (unsigned int []){ 0x104c },
 	.cxc_count = 1,
@@ -2979,7 +2979,7 @@ struct gdsc venus_core1_gdsc = {
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
-struct gdsc camss_gdsc = {
+static struct gdsc camss_gdsc = {
 	.gdscr = 0x34a0,
 	.cxcs = (unsigned int []){ 0x36bc, 0x36c4 },
 	.cxc_count = 2,
@@ -2990,7 +2990,7 @@ struct gdsc camss_gdsc = {
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
-struct gdsc vfe0_gdsc = {
+static struct gdsc vfe0_gdsc = {
 	.gdscr = 0x3664,
 	.cxcs = (unsigned int []){ 0x36a8 },
 	.cxc_count = 1,
@@ -3001,7 +3001,7 @@ struct gdsc vfe0_gdsc = {
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
-struct gdsc vfe1_gdsc = {
+static struct gdsc vfe1_gdsc = {
 	.gdscr = 0x3674,
 	.cxcs = (unsigned int []){ 0x36ac },
 	.cxc_count = 1,
@@ -3012,7 +3012,7 @@ struct gdsc vfe1_gdsc = {
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
-struct gdsc jpeg_gdsc = {
+static struct gdsc jpeg_gdsc = {
 	.gdscr = 0x35a4,
 	.cxcs = (unsigned int []){ 0x35a8, 0x35b0, 0x35c0, 0x35b8 },
 	.cxc_count = 4,
@@ -3023,7 +3023,7 @@ struct gdsc jpeg_gdsc = {
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
-struct gdsc cpp_gdsc = {
+static struct gdsc cpp_gdsc = {
 	.gdscr = 0x36d4,
 	.cxcs = (unsigned int []){ 0x36b0 },
 	.cxc_count = 1,
@@ -3034,7 +3034,7 @@ struct gdsc cpp_gdsc = {
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
-struct gdsc fd_gdsc = {
+static struct gdsc fd_gdsc = {
 	.gdscr = 0x3b64,
 	.cxcs = (unsigned int []){ 0x3b68, 0x3b6c },
 	.cxc_count = 2,
@@ -3045,7 +3045,7 @@ struct gdsc fd_gdsc = {
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
-struct gdsc mdss_gdsc = {
+static struct gdsc mdss_gdsc = {
 	.gdscr = 0x2304,
 	.cxcs = (unsigned int []){ 0x2310, 0x231c },
 	.cxc_count = 2,
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
