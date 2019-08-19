Return-Path: <SRS0=w22C=WP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55BD7C3A59B
	for <linux-clk@archiver.kernel.org>; Mon, 19 Aug 2019 08:37:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2712F2082C
	for <linux-clk@archiver.kernel.org>; Mon, 19 Aug 2019 08:37:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ir9OqPH+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbfHSIhI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Aug 2019 04:37:08 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35978 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726186AbfHSIhI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Aug 2019 04:37:08 -0400
Received: by mail-pf1-f195.google.com with SMTP id w2so764211pfi.3
        for <linux-clk@vger.kernel.org>; Mon, 19 Aug 2019 01:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=S4GHfSKQyx9obgpD6pUQlhguun535Iv+9qQdLHTCQIU=;
        b=ir9OqPH+14qK5lFOFTNB+sPUzt3MSL7+W/lXJqrmVbjMEUxHpV9idwMPgGnT/J60Yt
         f+jNFB+7G/kVPp5l/0nm08Brh2asukPu9IxfrczHHQyieOLLYPiwjABxf4aD8NEQxsQL
         qNFY+zzVc4suuEeb3qUkrTrxWX/7hVoxlGGiN8g6e0det561n0VNcJhNYzLG/oUUwJHY
         TU8hk1nmGcz6Qn8kxY+XQ0hX3VjFTYc7MR8IK+sXiodffvkzG9VpBISpS+HyQm/7+dwG
         gzd21ZIwtboOMV1L0I1QwlmEpGXTeNuQcIQrmvUMh/dxTkSBNfW+IC4aj4upgNwz+U3p
         bCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=S4GHfSKQyx9obgpD6pUQlhguun535Iv+9qQdLHTCQIU=;
        b=Fw2RfYjBq8DCAwTL1reuw1O11/cJXTvpGh4WADUsymYRrLQ3KTu4e2bZEl7+wxZedV
         XcnfEJo/MgOPjRt/LsCMVRwkhCHVR+oQdri/g7HviBhm2VgHq8B0V4rs8grQ9ufWq3nL
         6HpX79DjUQ5LnR0VFk36bUwjyCm6DTaNJjwrEUFzp3bHld8sWFMQcd6xHATWDQtXylwG
         pFOOqHGn3SMeeG0HcYZ3U8EVajKPczV30qDXSoPH/XLlM7KoS59JfelwinujamVG43mn
         jV5b7R3cH/tpL94DO+8P7yky0P7EJr1z+oj2uOWxKyccKbnvwPtZR3PglC2lzYw6c0Po
         Ocvg==
X-Gm-Message-State: APjAAAXeR4wDW7eE7NO6mBjnRayYk4E+pn0WHJ1p3L4PoUESYXkT0x4O
        nuNRQUqORI9pLG/TYoj5DCVEMA==
X-Google-Smtp-Source: APXvYqzxl6MDX+m2ZXx/oOOpJ6HFlbhtvNzG4FiAtQifvybxRcF5ONNGhiWAU87pm52wiqpLLtBfPQ==
X-Received: by 2002:aa7:938d:: with SMTP id t13mr22083730pfe.180.1566203827811;
        Mon, 19 Aug 2019 01:37:07 -0700 (PDT)
Received: from localhost ([122.172.76.219])
        by smtp.gmail.com with ESMTPSA id s16sm15700182pfs.6.2019.08.19.01.37.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2019 01:37:07 -0700 (PDT)
Date:   Mon, 19 Aug 2019 14:07:05 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        mturquette@baylibre.com, sboyd@kernel.org, rjw@rjwysocki.net,
        leonard.crestez@nxp.com, abel.vesa@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, Linux-imx@nxp.com
Subject: Re: [PATCH RESEND V2 3/7] cpufreq: Use imx-cpufreq-dt for i.MX8MN's
 speed grading
Message-ID: <20190819083705.fqpsyk7rgqmul6y4@vireshk-i7>
References: <1566109945-11149-1-git-send-email-Anson.Huang@nxp.com>
 <1566109945-11149-3-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1566109945-11149-3-git-send-email-Anson.Huang@nxp.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18-08-19, 02:32, Anson Huang wrote:
> Add i.MX8MN to blacklist, so that imx-cpufreq-dt driver can handle
> speed grading bits just like other i.MX8M SoCs.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Reviewed-by: Leonard Crestez <leonard.crestez@nxp.com>
> ---
> No changes.
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index ec2057d..febcec8 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -109,6 +109,7 @@ static const struct of_device_id blacklist[] __initconst = {
>  	{ .compatible = "fsl,imx7d", },
>  	{ .compatible = "fsl,imx8mq", },
>  	{ .compatible = "fsl,imx8mm", },
> +	{ .compatible = "fsl,imx8mn", },
>  
>  	{ .compatible = "marvell,armadaxp", },
>  

Applied. Thanks.

-- 
viresh
