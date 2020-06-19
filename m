Return-Path: <SRS0=8Vdj=AA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD23FC433E1
	for <linux-clk@archiver.kernel.org>; Fri, 19 Jun 2020 09:40:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C25DB20786
	for <linux-clk@archiver.kernel.org>; Fri, 19 Jun 2020 09:40:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732108AbgFSJkF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Jun 2020 05:40:05 -0400
Received: from lucky1.263xmail.com ([211.157.147.132]:50432 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732095AbgFSJkE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Jun 2020 05:40:04 -0400
X-Greylist: delayed 486 seconds by postgrey-1.27 at vger.kernel.org; Fri, 19 Jun 2020 05:40:02 EDT
Received: from localhost (unknown [192.168.167.209])
        by lucky1.263xmail.com (Postfix) with ESMTP id 67FA2E988E;
        Fri, 19 Jun 2020 17:30:28 +0800 (CST)
X-MAIL-GRAY: 1
X-MAIL-DELIVERY: 0
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.64] (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P10489T139787484784384S1592559028011652_;
        Fri, 19 Jun 2020 17:30:28 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <62c480b8cc5a488bc414f885ceaa2db0>
X-RL-SENDER: shawn.lin@rock-chips.com
X-SENDER: lintao@rock-chips.com
X-LOGIN-NAME: shawn.lin@rock-chips.com
X-FST-TO: linux-arm-kernel@lists.infradead.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Cc:     shawn.lin@rock-chips.com, linux-rockchip@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: =?UTF-8?Q?Re=3a_=5bRESEND_PATCH=5d_Revert_=22clk=3a_rockchip=3a_fix?=
 =?UTF-8?Q?_wrong_mmc_sample_phase_shift_for_rk3328=22=e3=80=90=e8=af=b7?=
 =?UTF-8?B?5rOo5oSP77yM6YKu5Lu255SxbGludXgtcm9ja2NoaXAtYm91bmNlcytzaGF3bi5s?=
 =?UTF-8?B?aW49cm9jay1jaGlwcy5jb21AbGlzdHMuaW5mcmFkZWFkLm9yZ+S7o+WPkeOAkQ==?=
To:     Robin Murphy <robin.murphy@arm.com>, heiko@sntech.de,
        mturquette@baylibre.com, sboyd@kernel.org
References: <c80eb52e34c03f817586b6b7912fbd4e31be9079.1589475794.git.robin.murphy@arm.com>
From:   Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <0dd5e173-a656-a1be-0a44-1ea8a03ca6fd@rock-chips.com>
Date:   Fri, 19 Jun 2020 17:30:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.0
MIME-Version: 1.0
In-Reply-To: <c80eb52e34c03f817586b6b7912fbd4e31be9079.1589475794.git.robin.murphy@arm.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 2020/6/19 1:56, Robin Murphy wrote:
> This reverts commit 82f4b67f018c88a7cc9337f0067ed3d6ec352648.
> 
> According to a subsequent revert in the vendor kernel, the original
> change was based on unclear documentation and was in fact incorrect.
> 

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> Emprically, my board's HS200 eMMC at 200MHZ apparently gets lucky with a
> phase where this had no impact, but limiting max-frequency to 150MHz to
> match the nominal capability of the I/O pins made it virtually unusable,
> constantly throwing errors and retuning. With this revert, it starts
> behaving perfectly at 150MHz too.
> 
> Fixes: 82f4b67f018c ("clk: rockchip: fix wrong mmc sample phase shift for rk3328")
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
> 
> Resending with the edited commit log I actually meant, rather than the
> earlier draft I managed to generate the previuous patch from, since that
> one seems to have slipped through the cracks anyway.
> 
> ybetter commit message
>   drivers/clk/rockchip/clk-rk3328.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/rockchip/clk-rk3328.c b/drivers/clk/rockchip/clk-rk3328.c
> index c186a1985bf4..2429b7c2a8b3 100644
> --- a/drivers/clk/rockchip/clk-rk3328.c
> +++ b/drivers/clk/rockchip/clk-rk3328.c
> @@ -808,22 +808,22 @@ static struct rockchip_clk_branch rk3328_clk_branches[] __initdata = {
>   	MMC(SCLK_SDMMC_DRV, "sdmmc_drv", "clk_sdmmc",
>   	    RK3328_SDMMC_CON0, 1),
>   	MMC(SCLK_SDMMC_SAMPLE, "sdmmc_sample", "clk_sdmmc",
> -	    RK3328_SDMMC_CON1, 0),
> +	    RK3328_SDMMC_CON1, 1),
>   
>   	MMC(SCLK_SDIO_DRV, "sdio_drv", "clk_sdio",
>   	    RK3328_SDIO_CON0, 1),
>   	MMC(SCLK_SDIO_SAMPLE, "sdio_sample", "clk_sdio",
> -	    RK3328_SDIO_CON1, 0),
> +	    RK3328_SDIO_CON1, 1),
>   
>   	MMC(SCLK_EMMC_DRV, "emmc_drv", "clk_emmc",
>   	    RK3328_EMMC_CON0, 1),
>   	MMC(SCLK_EMMC_SAMPLE, "emmc_sample", "clk_emmc",
> -	    RK3328_EMMC_CON1, 0),
> +	    RK3328_EMMC_CON1, 1),
>   
>   	MMC(SCLK_SDMMC_EXT_DRV, "sdmmc_ext_drv", "clk_sdmmc_ext",
>   	    RK3328_SDMMC_EXT_CON0, 1),
>   	MMC(SCLK_SDMMC_EXT_SAMPLE, "sdmmc_ext_sample", "clk_sdmmc_ext",
> -	    RK3328_SDMMC_EXT_CON1, 0),
> +	    RK3328_SDMMC_EXT_CON1, 1),
>   };
>   
>   static const char *const rk3328_critical_clocks[] __initconst = {
> 


