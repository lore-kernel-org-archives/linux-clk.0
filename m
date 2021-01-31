Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CDE1C433E6
	for <linux-clk@archiver.kernel.org>; Sun, 31 Jan 2021 15:24:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F59164E42
	for <linux-clk@archiver.kernel.org>; Sun, 31 Jan 2021 15:24:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231867AbhAaOPZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 31 Jan 2021 09:15:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231874AbhAaN2r (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 31 Jan 2021 08:28:47 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E88DCC06178A
        for <linux-clk@vger.kernel.org>; Sun, 31 Jan 2021 05:25:23 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id y187so10894765wmd.3
        for <linux-clk@vger.kernel.org>; Sun, 31 Jan 2021 05:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uQW6zI3kIl4btIs4IkhNoP62juO8z7Dh2Bp1bXM6dNo=;
        b=c1GaODdxNmpvlW856t5VMf73wiUd+a2QSX8K2Wwb72uMjJK5fzkE668Hp0Pdtbzm9D
         QZPlSSMj7toEaFsIe6q4tIdqmKDpfK+p1HTB5KiDaczout4TOnA0c6ScSjY+X8zURnhZ
         u42okppAvnXYXQx2ZqJhcFt/MupRWmTA2gsMWGacqiWiu3pNYB/UK5xl4OgfDPaeTrbd
         WZa4G1EoiF4CDcmsDH/007oVEGtzgGoVKlB/0tvESzKYdrCVwcUGWiK6SgdGyrqktrgP
         OWZzOM68YkpJTOCdhNh5H8giAvxImTOMhXtqvi+eQS+Z8K34Uo7/F2YBQsShDPA8JX1L
         cb5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uQW6zI3kIl4btIs4IkhNoP62juO8z7Dh2Bp1bXM6dNo=;
        b=dra6oSR+QYdn5qpqk6SCdUwo5mZqxuH+/JJTlm5xv+34Y0rYirWDAuJj47IyoWkXep
         DyCNl0ZD+KcX4U9jzkvy3LcrR6yxtKmiL75H/gbu/J8/3P1oxIBVINHU/ceYYx+Jknya
         QkkI7ayowt+hGC98fT+ZLRuy9Jex4QqUsIMASZzOh2gmGeJq8hlQXduXhXeachkxE++G
         IxofNiS/uE8znoqVA2yt1OmqwIpzbugr4gsPsHHJq3WRQU78RGcEE8OQHfYxD+y2BDae
         Ru13dHhSXe5KpMCayXWAXofWfvfYnGuAN7o1/Jl5MYjyP9xZKTE3z6B4WYce4EFuEZtY
         rVuA==
X-Gm-Message-State: AOAM5314jbCgqXcdXECQO21m4VoBlHPbLvYFklj19JK4AR1Xv5y0LkwF
        WEewuazDsGsT80rQF/5QeZ4CzSCNmXBnRw==
X-Google-Smtp-Source: ABdhPJxnLsv4VhLXKNJh1hR/+ox28D7tGWVevho3V4V2qY31AjlWOXpLahbvuRiqtRF/268pj72XXQ==
X-Received: by 2002:a7b:ca4c:: with SMTP id m12mr11332151wml.115.1612099522713;
        Sun, 31 Jan 2021 05:25:22 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
        by smtp.gmail.com with ESMTPSA id d3sm25982908wrp.79.2021.01.31.05.25.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Jan 2021 05:25:22 -0800 (PST)
Subject: Re: [PATCH] clk: mediatek: Remove unused MT8192 mcupm clock
To:     Tinghan Shen <tinghan.shen@mediatek.com>, drinkcat@chromium.org,
        sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
        weiyi.lu@mediatek.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20201222053502.27872-1-tinghan.shen@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <09a1ff48-5341-52ff-715d-3a0d6a914e4c@gmail.com>
Date:   Sun, 31 Jan 2021 14:25:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20201222053502.27872-1-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 22/12/2020 06:35, Tinghan Shen wrote:
> From: "TingHan Shen" <tinghan.shen@mediatek.com>
> 
> Remove unused MT8192 mcupm clock
> 
> Signed-off-by: TingHan Shen <tinghan.shen@mediatek.com>
> ---
> This patch depends on series "Mediatek MT8192 clock support"[1].
> 
> [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=379955

This series is not upstream, so it should be fixed in the very same series and
not as a follow up patch. From what I see, this is alread done in v6.

Thanks!
Matthias

> ---
>  drivers/clk/mediatek/clk-mt8192.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
> index 673dc60182f5..80df1903bd58 100644
> --- a/drivers/clk/mediatek/clk-mt8192.c
> +++ b/drivers/clk/mediatek/clk-mt8192.c
> @@ -649,12 +649,6 @@ static const char * const aes_msdcfde_parents[] = {
>  	"univpll_d6"
>  };
>  
> -static const char * const mcupm_parents[] = {
> -	"clk26m",
> -	"mainpll_d6_d4",
> -	"mainpll_d6_d2"
> -};
> -
>  static const char * const sflash_parents[] = {
>  	"clk26m",
>  	"mainpll_d7_d8",
> @@ -856,8 +850,6 @@ static const struct mtk_mux top_mtk_muxes[] = {
>  	MUX_GATE_CLR_SET_UPD(CLK_TOP_AES_MSDCFDE_SEL, "aes_msdcfde_sel",
>  		aes_msdcfde_parents, 0x100, 0x104, 0x108, 24, 3, 31, 0x00c, 1),
>  	/* CLK_CFG_16 */
> -	MUX_GATE_CLR_SET_UPD(CLK_TOP_MCUPM_SEL, "mcupm_sel",
> -		mcupm_parents, 0x110, 0x114, 0x118, 0, 2, 7, 0x00c, 2),
>  	MUX_GATE_CLR_SET_UPD(CLK_TOP_SFLASH_SEL, "sflash_sel",
>  		sflash_parents, 0x110, 0x114, 0x118, 8, 2, 15, 0x00c, 3),
>  };
> @@ -983,7 +975,6 @@ static const struct mtk_gate infra_clks[] = {
>  	GATE_INFRA0(CLK_INFRA_SCPSYS, "infra_scpsys", "scp_sel", 4),
>  	GATE_INFRA0(CLK_INFRA_SEJ, "infra_sej", "axi_sel", 5),
>  	GATE_INFRA0(CLK_INFRA_APXGPT, "infra_apxgpt", "axi_sel", 6),
> -	GATE_INFRA0(CLK_INFRA_MCUPM, "infra_mcupm", "mcupm_sel", 7),
>  	GATE_INFRA0(CLK_INFRA_GCE, "infra_gce", "axi_sel", 8),
>  	GATE_INFRA0(CLK_INFRA_GCE2, "infra_gce2", "axi_sel", 9),
>  	GATE_INFRA0(CLK_INFRA_THERM, "infra_therm", "axi_sel", 10),
> 
