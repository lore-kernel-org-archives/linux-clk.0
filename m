Return-Path: <SRS0=jGkl=OQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 007BBC07E85
	for <linux-clk@archiver.kernel.org>; Fri,  7 Dec 2018 13:50:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BAE9F20868
	for <linux-clk@archiver.kernel.org>; Fri,  7 Dec 2018 13:50:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="QYs8D0Q6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAE9F20868
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726034AbeLGNum (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Dec 2018 08:50:42 -0500
Received: from hqemgate14.nvidia.com ([216.228.121.143]:1029 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbeLGNum (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Dec 2018 08:50:42 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c0a7aaf0001>; Fri, 07 Dec 2018 05:50:39 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 07 Dec 2018 05:50:41 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 07 Dec 2018 05:50:41 -0800
Received: from [10.21.132.148] (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 7 Dec
 2018 13:50:39 +0000
Subject: Re: [PATCH 02/19] dt-bindings: clock: tegra124-dfll: add Tegra210
 support
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-3-josephl@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <0c3e8844-45af-dc45-f082-8693907dd83b@nvidia.com>
Date:   Fri, 7 Dec 2018 13:50:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181204092548.3038-3-josephl@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544190639; bh=U01B4DW+llYB5T02zmtXDBoVSRRnGJDFVA80M80tZOE=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=QYs8D0Q6SfwQyLJ6YHv8XWR3LPxWgzidOb6YA0WqGNiMV8oyUZ9o0J4ybifjYmSYa
         eHAk5qCy+h8OIzDbiHaBhRvdv3a5sITq7Wknzj/ZDJ4fNbxv2/5u1DDCh9gi5AEcr3
         pdAlZ/+XaRdsbCxORnvFubwNc/Bis9TuXLwMbacKmEReBVF08SNvBD3u5F559q0vY3
         ccro9vj8y/cb6dZJU5KZ8QbastkcfVuh1RNotGPaBNqyrAtQyJlpQ2HUe/BpOQPHu6
         ++44NaoGHWF4D2OZx2K9ZnmhDtPmhZiSL/wp3Kw/+LYpv7GW2GVyb77d9v5bZhwId7
         V4ENSjfr1EElQ==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 04/12/2018 09:25, Joseph Lo wrote:
> Add Tegra210 support for DFLL clock.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
>  .../devicetree/bindings/clock/nvidia,tegra124-dfll.txt        | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
> index 8c97600d2bad..4bd44dd7ec1e 100644
> --- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
> +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
> @@ -10,7 +10,9 @@ control module that will automatically adjust the VDD_CPU voltage by
>  communicating with an off-chip PMIC either via an I2C bus or via PWM signals.
>  
>  Required properties:
> -- compatible : should be "nvidia,tegra124-dfll"
> +- compatible : should be one of:
> +  - "nvidia,tegra124-dfll": for Tegra124
> +  - "nvidia,tegra210-dfll": for Tegra210
>  - reg : Defines the following set of registers, in the order listed:
>          - registers for the DFLL control logic.
>          - registers for the I2C output logic.

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
