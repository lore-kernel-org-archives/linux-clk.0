Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF4A1C4332F
	for <linux-clk@archiver.kernel.org>; Wed, 16 Nov 2022 20:41:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231221AbiKPUlT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Nov 2022 15:41:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232851AbiKPUlS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Nov 2022 15:41:18 -0500
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 08B9CD5A
        for <linux-clk@vger.kernel.org>; Wed, 16 Nov 2022 12:41:16 -0800 (PST)
Received: from [192.168.50.220] ([146.241.88.137])
        by Aruba Outgoing Smtp  with ESMTPSA
        id vPDfousiuEclovPDfoJfGd; Wed, 16 Nov 2022 21:41:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1668631276; bh=ua4Hct9zgOjT9Ac685aAx6spkrDlHZGn59ZRs5eaYP0=;
        h=Date:MIME-Version:Subject:To:From:Content-Type;
        b=jKjnFGcRyeZJ8+3/LauE7ThKXsIBtvJmfbj4n020e6kUu7hTuyMnqRCUzQNvd/pnR
         bSZkq6vBJfJRQANaxJrD3tQW1A2Lt2HOjI/tAuyOn8QY06Ol1UEUywS/rdEGQGZzU4
         ImexpHOdcsVfJqNePa10tSkhRwneJXIxbiGiF/I8sYMBJPj21ccpu+kPOSVQcYP3yC
         HW6F/fS1u/xrL9NYFt2U2KrX915YywKvEugziM6jtfwvByEt+lUZVY7rNzRrbig+I5
         ceHelVRPgWOfmRndQ9QhoRKl2xIeXS2/V220Z1jqnAT4voGzm/NES+MZNV/BH054Hv
         mhazheT2kGAcA==
Message-ID: <3149ce35-14bb-7df0-b578-b426b8e365fa@benettiengineering.com>
Date:   Wed, 16 Nov 2022 21:41:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 3/4] ARM: dts: imxrt1050: increase mmc max-frequency
 property
Content-Language: en-US
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bough Chen <haibo.chen@nxp.com>,
        Jesse Taube <mr.bossman075@gmail.com>
References: <20221116203520.8300-1-giulio.benetti@benettiengineering.com>
 <20221116203520.8300-3-giulio.benetti@benettiengineering.com>
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20221116203520.8300-3-giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPVpncSEOCCHpzyD8TvUG1v+Q4+0n/jgcG/RkU/q3r1jBC4VIBiGT9ANThQyvIMtxM6agnBjalzv3sYR8xWmpVtvKfyAY4J3+DdPF28FhLW3D73/x2Jt
 WbCypBvZfIg+inE5SunvSuoHSmfhG0Rbh/Wrj+Qv35iXBWwRv0Hf37gNyceMvoM0jVB69kkdHJfqXEOESDjg2MDA32vJCmMp7j5WeT1S7HWMaihZZkqaSGts
 7kwmbtQ12auHH05PgI/iy3lk/gXny06MupIirDs73nhokfbfljAK1j8NagcuilFySOrzPYxonBDcBkRjiVV/TIgA1wG4D3NuEYatNBPmgPfSBCtkiVHuDa8K
 gZqGJIXvWTNviNG+wf0jkHcvBpgQKBvrLYX8udm/KrfYwl/yzOsY4Ey12gIKFaIRHjEpRkvZc1gPHoIThxPUjakg5uepFD5HNYtiBR9Rt1WJze8mMgLdiPGj
 H2nuauIp4KhOmzRyxd5m16wCWTF6CVIrNnd89HoerhOWQdAYuJ6+n5vOjiymaHrNl34SRk7WW/RpVQ82XJKftuNYkoZtxnnilMyp48FFRpkpJ9CTV2+kvimK
 EGOUXJnUhP4OTljepZ5QPT4cGisKGKYH7HZma2TjHj9XfZVIM9qYRvNBwKlbel4S75WYkDoAM60C1W1aCRZ+VJoobx/usJW+m40/MkamtuzSJs9c7CThBjuW
 H4G5lsOy0+4BbUt7kOnzU4G6tI1J7dXcIRBA6f64dLmmytAMquRoyw==
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/11/22 21:35, Giulio Benetti wrote:
> According to i.MXRT1050 Datasheet usdhc supports up to 200Mhz clock so
> let's increase max-frequency property to 200Mhz.
> 
> Cc: Jesse Taube <mr.bossman075@gmail.com>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Acked-by: Jesse Taube <mr.bossman075@gmail.com>
> ---
> V1->V2:
> * nothing done

Pardon:
V1->V2:
* set max-frequency to 200Mhz instead of removing it as suggested by
   Bough Chen

-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas

> V2->V3:
> * added Jesse Taube's Acked-by:
> ---
>   arch/arm/boot/dts/imxrt1050.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/imxrt1050.dtsi b/arch/arm/boot/dts/imxrt1050.dtsi
> index 114465e4dde6..5b1991c32748 100644
> --- a/arch/arm/boot/dts/imxrt1050.dtsi
> +++ b/arch/arm/boot/dts/imxrt1050.dtsi
> @@ -93,7 +93,7 @@ usdhc1: mmc@402c0000 {
>   			bus-width = <4>;
>   			fsl,wp-controller;
>   			no-1-8-v;
> -			max-frequency = <4000000>;
> +			max-frequency = <200000000>;
>   			fsl,tuning-start-tap = <20>;
>   			fsl,tuning-step = <2>;
>   			status = "disabled";

