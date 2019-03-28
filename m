Return-Path: <SRS0=OKnm=R7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98660C43381
	for <linux-clk@archiver.kernel.org>; Thu, 28 Mar 2019 16:27:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 696A92183E
	for <linux-clk@archiver.kernel.org>; Thu, 28 Mar 2019 16:27:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727237AbfC1Q1C (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Mar 2019 12:27:02 -0400
Received: from ns.iliad.fr ([212.27.33.1]:46294 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725816AbfC1Q1B (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 28 Mar 2019 12:27:01 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id D69341FF78;
        Thu, 28 Mar 2019 17:26:59 +0100 (CET)
Received: from [192.168.108.8] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 795E21FF4B;
        Thu, 28 Mar 2019 17:26:59 +0100 (CET)
Subject: Re: [PATCH v1] clk: qcom: Skip halt checks on gcc_pcie_0_pipe_clk for
 8998
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Vinod Koul <vkoul@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Amit Nischal <anischal@codeaurora.org>
References: <a7e27415-02d9-bfe9-c0ea-59dc236a7f91@free.fr>
Message-ID: <c1762201-a1fa-8ed1-24ff-f30916ee45dd@free.fr>
Date:   Thu, 28 Mar 2019 17:26:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <a7e27415-02d9-bfe9-c0ea-59dc236a7f91@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Thu Mar 28 17:26:59 2019 +0100 (CET)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25/03/2019 14:49, Marc Gonzalez wrote:

> See similar issue solved by commit 5f2420ed2189
> ("clk: qcom: Skip halt checks on gcc_usb3_phy_pipe_clk for 8998")
> 
> Without this patch, PCIe PHY init fails:
> 
> qcom-qmp-phy 1c06000.phy: pipe_clk enable failed err=-16
> phy phy-1c06000.phy.0: phy init failed --> -16
> 
> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> ---
>  drivers/clk/qcom/gcc-msm8998.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
> index c240fba794c7..033688264c7b 100644
> --- a/drivers/clk/qcom/gcc-msm8998.c
> +++ b/drivers/clk/qcom/gcc-msm8998.c
> @@ -2161,7 +2161,7 @@ static struct clk_branch gcc_pcie_0_mstr_axi_clk = {
>  
>  static struct clk_branch gcc_pcie_0_pipe_clk = {
>  	.halt_reg = 0x6b018,
> -	.halt_check = BRANCH_HALT,
> +	.halt_check = BRANCH_HALT_SKIP,
>  	.clkr = {
>  		.enable_reg = 0x6b018,
>  		.enable_mask = BIT(0),

Actually, 5f2420ed2189 is not the only similar instance.

$ git log --oneline -G BRANCH_HALT_SKIP drivers/clk/qcom | grep -v controller
924a86bf9793 clk: qcom: Skip halt checks on gcc_pcie_0_pipe_clk for 8998
5f2420ed2189 clk: qcom: Skip halt checks on gcc_usb3_phy_pipe_clk for 8998
2abf856202fd clk: qcom: gcc-msm8998: Disable halt check of UFS clocks
5f75b78d3d67 clk: qcom: gcc-msm8996: Disable halt check on UFS tx clock
12d807cd34b8 clk: qcom: gcc-msm8996: Disable halt check on UFS clocks
096abdc296f1 clk: msm8996-gcc: Mark halt check as no-op for USB/PCIE pipe_clk
7d99ced8f4c6 clk: qcom: Add support for BRANCH_HALT_SKIP flag for branch clocks

Regards.
