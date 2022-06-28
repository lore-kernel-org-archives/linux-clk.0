Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ECEBC43334
	for <linux-clk@archiver.kernel.org>; Tue, 28 Jun 2022 15:59:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348232AbiF1P7m (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Jun 2022 11:59:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348237AbiF1P7Y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Jun 2022 11:59:24 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2577AB01
        for <linux-clk@vger.kernel.org>; Tue, 28 Jun 2022 08:59:21 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id o19-20020a05600c4fd300b003a0489f414cso4326886wmq.4
        for <linux-clk@vger.kernel.org>; Tue, 28 Jun 2022 08:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=NLyzmRX0gxU1uVLdGWUyPh6vEZBg5mfEZjGEa+7dQXA=;
        b=24ZdSO2v3K27CgipyrW2etApOr+Tzt8srge6fqNQ8S16JUN3BWrA3HRzGXNDG55vIj
         gsJBespGZGSYNWUYkyzP/WZENP6jhIcdHSs7g5t4YdNl4WkoBSczTeSyzyZr9PbbqKrv
         1nG2rstr15yQCJGiofpOm911YawzOjBV95g41YkFYygXX2QwpF9WW4KWYgn+ezuZeM8/
         cVLzgQz1WgBeijfhYaXunuAr1Laq8U/ujblZulUAJsNXipGR0M9u/GDfj20OUdVi3Jbt
         d5Hxy8/sXP+WvzCtZK2Y0GUG8jLuPu/rpP+KTtH/uG2ctWFzUC09COP2RThsoo8UJq+4
         fv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=NLyzmRX0gxU1uVLdGWUyPh6vEZBg5mfEZjGEa+7dQXA=;
        b=gPra5Gwx2zw7+yGjRguWI4yhCAJdTiP/zDcCJDVLIcwR3tXP5wETFWlT/5DTCClTjK
         BA7CD2sWdDgQAjCcfD276p0ACRzV7HN/ZUB9MBsxITRFaiIrUzkgL1fX1S2EvLdI9QYE
         ePJWkCKmTX40ebiFgodFqtIyyfMwC4UH49sO9pxK3c/eiJIuCI5tTjew/AmdofO/pm6E
         Ckv/toZGCiVp4aT2GoSyvqNsWKaOWPX9rXeVtOVwq0DQU3T6G5uonEZkQqdzBNMd7dt5
         8RFjbDTr9dwGshCg1an9DB3lwy1jLG0e4ErSn82gxfr2zq8FKl/JNxszPidRHMIccIlX
         fD9g==
X-Gm-Message-State: AJIora/4011P3lgZeFWgodO4+ACT/uGmbadnC5RxkkCHvDloItjx8QTy
        zVE3yMYMUT/5F+8SQuq38dCp04YjOhpMU3gc
X-Google-Smtp-Source: AGRyM1tjL+zAhf5HOGDJC218YeuSrfigz39zoW2joVTjuLT2u8eZJhlyPPB69FFxUvVNsiCDZhZyWw==
X-Received: by 2002:a05:600c:4c94:b0:3a0:4295:8e3d with SMTP id g20-20020a05600c4c9400b003a042958e3dmr296246wmp.165.1656431960233;
        Tue, 28 Jun 2022 08:59:20 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:52cb:c433:b96:9ad? ([2001:861:44c0:66c0:52cb:c433:b96:9ad])
        by smtp.gmail.com with ESMTPSA id e16-20020a5d4e90000000b0021b91d1ddbfsm13752718wru.21.2022.06.28.08.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 08:59:19 -0700 (PDT)
Message-ID: <79915601-5e13-7ba8-c3d2-e170cd52f53c@baylibre.com>
Date:   Tue, 28 Jun 2022 17:59:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] clk: meson: Hold reference returned by of_get_parent()
Content-Language: en-US
To:     Liang He <windhl@126.com>, jbrunet@baylibre.com,
        mturquette@baylibre.com, sboyd@kernel.org, khilman@baylibre.com,
        martin.blumenstingl@googlemail.co, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org
References: <20220628141038.168383-1-windhl@126.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220628141038.168383-1-windhl@126.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/06/2022 16:10, Liang He wrote:
> We should hold the reference returned by of_get_parent() and use it
> to call of_node_put() for refcount balance.
> 
> Fixes: 88e2da81241e ("clk: meson: aoclk: refactor common code into dedicated file")
> Fixes: 6682bd4d443f ("clk: meson: factorise meson64 peripheral clock controller drivers")
> Fixes: bb6eddd1d28c ("clk: meson: meson8b: use the HHI syscon if available")
> 
> Signed-off-by: Liang He <windhl@126.com>
> ---
>   changelog:
>   
>   v2: change the name of 'tp', change the title format, keep reverse christmas tree
>   v1: hold reference returned by of_get_parent()
> 
>   v1-link: https://lore.kernel.org/all/20220624102719.4166125-1-windhl@126.com/
> 
>   Patched files have been compiled test in 5.19rc2.
> 
> 
>   drivers/clk/meson/meson-aoclk.c | 5 ++++-
>   drivers/clk/meson/meson-eeclk.c | 5 ++++-
>   drivers/clk/meson/meson8b.c     | 5 ++++-
>   3 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/meson/meson-aoclk.c b/drivers/clk/meson/meson-aoclk.c
> index 27cd2c1f3f61..434cd8f9de82 100644
> --- a/drivers/clk/meson/meson-aoclk.c
> +++ b/drivers/clk/meson/meson-aoclk.c
> @@ -38,6 +38,7 @@ int meson_aoclkc_probe(struct platform_device *pdev)
>   	struct meson_aoclk_reset_controller *rstc;
>   	struct meson_aoclk_data *data;
>   	struct device *dev = &pdev->dev;
> +	struct device_node *np;
>   	struct regmap *regmap;
>   	int ret, clkid;
>   
> @@ -49,7 +50,9 @@ int meson_aoclkc_probe(struct platform_device *pdev)
>   	if (!rstc)
>   		return -ENOMEM;
>   
> -	regmap = syscon_node_to_regmap(of_get_parent(dev->of_node));
> +	np = of_get_parent(dev->of_node);
> +	regmap = syscon_node_to_regmap(np);
> +	of_node_put(np);
>   	if (IS_ERR(regmap)) {
>   		dev_err(dev, "failed to get regmap\n");
>   		return PTR_ERR(regmap);
> diff --git a/drivers/clk/meson/meson-eeclk.c b/drivers/clk/meson/meson-eeclk.c
> index 8d5a5dab955a..0e5e6b57eb20 100644
> --- a/drivers/clk/meson/meson-eeclk.c
> +++ b/drivers/clk/meson/meson-eeclk.c
> @@ -18,6 +18,7 @@ int meson_eeclkc_probe(struct platform_device *pdev)
>   {
>   	const struct meson_eeclkc_data *data;
>   	struct device *dev = &pdev->dev;
> +	struct device_node *np;
>   	struct regmap *map;
>   	int ret, i;
>   
> @@ -26,7 +27,9 @@ int meson_eeclkc_probe(struct platform_device *pdev)
>   		return -EINVAL;
>   
>   	/* Get the hhi system controller node */
> -	map = syscon_node_to_regmap(of_get_parent(dev->of_node));
> +	np = of_get_parent(dev->of_node);
> +	map = syscon_node_to_regmap(np);
> +	of_node_put(np);
>   	if (IS_ERR(map)) {
>   		dev_err(dev,
>   			"failed to get HHI regmap\n");
> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> index 8f3b7a94a667..827e78fb16a8 100644
> --- a/drivers/clk/meson/meson8b.c
> +++ b/drivers/clk/meson/meson8b.c
> @@ -3792,12 +3792,15 @@ static void __init meson8b_clkc_init_common(struct device_node *np,
>   			struct clk_hw_onecell_data *clk_hw_onecell_data)
>   {
>   	struct meson8b_clk_reset *rstc;
> +	struct device_node *parent_np;
>   	const char *notifier_clk_name;
>   	struct clk *notifier_clk;
>   	struct regmap *map;
>   	int i, ret;
>   
> -	map = syscon_node_to_regmap(of_get_parent(np));
> +	parent_np = of_get_parent(np);
> +	map = syscon_node_to_regmap(parent_np);
> +	of_node_put(parent_np);
>   	if (IS_ERR(map)) {
>   		pr_err("failed to get HHI regmap - Trying obsolete regs\n");
>   		return;

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
