Return-Path: <SRS0=4wXd=SL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB96AC10F0E
	for <linux-clk@archiver.kernel.org>; Tue,  9 Apr 2019 13:25:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B43A820880
	for <linux-clk@archiver.kernel.org>; Tue,  9 Apr 2019 13:25:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="T1H1xh58";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="T1H1xh58"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726772AbfDINZD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Apr 2019 09:25:03 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:38386 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726464AbfDINZD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 Apr 2019 09:25:03 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 945B160EA5; Tue,  9 Apr 2019 13:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1554816302;
        bh=qpfF1wXJ2MygZdm8EsOSmyDHXlZhszCpV4utacCnG8A=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=T1H1xh58Irvu/XL3jo0gE0zyxeI4H+G7O80IoC4c6QKKN8mhopXeR9DI2wbDiNHKb
         g4gaDU7cQmha44SZEi8ztEsHJh+IvuAD9F0a0Pgq3cTkNajolNdomXxJCCalcHGaM/
         oCVAo0eeyqYPlkakI7nTUi370+zAZem86JDTVdc0=
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7DF5B60E5D;
        Tue,  9 Apr 2019 13:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1554816302;
        bh=qpfF1wXJ2MygZdm8EsOSmyDHXlZhszCpV4utacCnG8A=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=T1H1xh58Irvu/XL3jo0gE0zyxeI4H+G7O80IoC4c6QKKN8mhopXeR9DI2wbDiNHKb
         g4gaDU7cQmha44SZEi8ztEsHJh+IvuAD9F0a0Pgq3cTkNajolNdomXxJCCalcHGaM/
         oCVAo0eeyqYPlkakI7nTUi370+zAZem86JDTVdc0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7DF5B60E5D
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v1] clk: qcom: Skip halt checks on gcc_pcie_0_pipe_clk for
 8998
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>
References: <a7e27415-02d9-bfe9-c0ea-59dc236a7f91@free.fr>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <e88ab0f4-1b9c-78c1-7bc3-39ef6ef82aa9@codeaurora.org>
Date:   Tue, 9 Apr 2019 07:25:01 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.3
MIME-Version: 1.0
In-Reply-To: <a7e27415-02d9-bfe9-c0ea-59dc236a7f91@free.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 3/25/2019 7:49 AM, Marc Gonzalez wrote:
> See similar issue solved by commit 5f2420ed2189
> ("clk: qcom: Skip halt checks on gcc_usb3_phy_pipe_clk for 8998")
> 
> Without this patch, PCIe PHY init fails:
> 
> qcom-qmp-phy 1c06000.phy: pipe_clk enable failed err=-16
> phy phy-1c06000.phy.0: phy init failed --> -16
> 
> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>

Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>

> ---
>   drivers/clk/qcom/gcc-msm8998.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
> index c240fba794c7..033688264c7b 100644
> --- a/drivers/clk/qcom/gcc-msm8998.c
> +++ b/drivers/clk/qcom/gcc-msm8998.c
> @@ -2161,7 +2161,7 @@ static struct clk_branch gcc_pcie_0_mstr_axi_clk = {
>   
>   static struct clk_branch gcc_pcie_0_pipe_clk = {
>   	.halt_reg = 0x6b018,
> -	.halt_check = BRANCH_HALT,
> +	.halt_check = BRANCH_HALT_SKIP,
>   	.clkr = {
>   		.enable_reg = 0x6b018,
>   		.enable_mask = BIT(0),
> 


-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
