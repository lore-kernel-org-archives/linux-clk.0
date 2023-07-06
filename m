Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C25EB64D9
	for <linux-clk@archiver.kernel.org>; Thu,  6 Jul 2023 14:16:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232473AbjGFOQr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 6 Jul 2023 10:16:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232824AbjGFOQp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Jul 2023 10:16:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED6D3DB;
        Thu,  6 Jul 2023 07:16:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7F0BB6197C;
        Thu,  6 Jul 2023 14:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6F76C433C7;
        Thu,  6 Jul 2023 14:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688653002;
        bh=lraYQAJXhHpy9MSMrp5qu/kbYkDxLEvcUxrU86TfB1w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mFAa304XjGxl6aLh/YKat/QN9Nfw1HuZqYPxZJtONiB69fd7YPwgTj869obxilMeQ
         mksioec18Y7PJiZvV0fBdNbl2OOslDsfV6rn6v7l6AeQ/5d4UCy/vZGsEs4DrYmYGa
         i64gvXQWqyLH1Nr6QLilpmTwSezE36tMog2T0GLT1hsm7g5GnolHvfSc9dT3hHXo9e
         EsRzInKIukhETa8jy/pCJ1Ygosqzh3L3LXnGbfmc+8fKXHFGLTl/Yag6aJpW1/Umce
         MvMqnOyqzsZp3jYU1RB2PdIaPeWGMcmgis2mF0evR+iSEcnIsA1FBVHjIFoTBmKSIS
         JKJDoNrGm0NXg==
Received: from johan by xi.lan with local (Exim 4.96)
        (envelope-from <johan@kernel.org>)
        id 1qHPn8-0006hZ-1j;
        Thu, 06 Jul 2023 16:17:06 +0200
Date:   Thu, 6 Jul 2023 16:17:06 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        konrad.dybcio@linaro.org, johan+linaro@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: gcc-sc8280xp: Allow PCIe GDSCs to enter
 retention state
Message-ID: <ZKbM4vLpk_T3cGWC@hovoldconsulting.com>
References: <20230706140842.18059-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230706140842.18059-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jul 06, 2023 at 07:38:42PM +0530, Manivannan Sadhasivam wrote:
> With the minimal system suspend support in place for the PCIe driver that
> keeps the interconnect path voted, the ALWAYS_ON flag can now be dropped.
> 
> Also, the PWRSTS_RET_ON flag should be used to allow the GDSCs to enter the
> retention state when the parent domain get's turned off during system
> suspend.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
> 
> Changes in v2:
> 
> * Changed the patch from simple revert to changing the ALWAYS_ON flag to
>   PWRSTS_RET_ON.
> 
>  drivers/clk/qcom/gcc-sc8280xp.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
> index 04a99dbaa57e..c59b0f91c87d 100644
> --- a/drivers/clk/qcom/gcc-sc8280xp.c
> +++ b/drivers/clk/qcom/gcc-sc8280xp.c
> @@ -6786,7 +6786,7 @@ static struct gdsc pcie_2a_gdsc = {
>  		.name = "pcie_2a_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = VOTABLE | ALWAYS_ON,
> +	.flags = VOTABLE | PWRSTS_RET_ON,
>  };

This is not correct either. PWRSTS_RET_ON is a pwrsts mask...

Johan
