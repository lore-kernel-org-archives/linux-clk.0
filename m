Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5439EC05027
	for <linux-clk@archiver.kernel.org>; Thu,  2 Feb 2023 12:36:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbjBBMgS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 Feb 2023 07:36:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231463AbjBBMgR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Feb 2023 07:36:17 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1BC584B46
        for <linux-clk@vger.kernel.org>; Thu,  2 Feb 2023 04:36:13 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso3608978wms.5
        for <linux-clk@vger.kernel.org>; Thu, 02 Feb 2023 04:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mZpUTCzTOESHEsJ+JC7V0K5g6eGsyAIVNhopcWkbTBs=;
        b=B0QKURtXzW8Thkl9H6uDO2+X0a+/gk2AiwN1VRPah6Cdemr/o6CKVdARu+5J/05Er1
         3E2qREGbaEZS3be5JU/HBG4pdMI+aMhfcLjO1gRis/BM0hpF+2r2QYBHh2eY7sxdF3MB
         UdajEmZf5o8p4HrqnCYk/pIj5BaylWOU40UgOQpoVP9MgJQz5UQlL9OR38QwulzqhFUl
         6perm48qtzGEPdBZafPs92ykgv0OJsFWz3xclUWgIzG7v0RxrYKYa+NCID3LyKFekid0
         GW83rXpND6yQ6tzzBy6GEXaLyfmhcNCcAevsjr8ijfJBi+7xZdtmMQQAPyHunSk4QCO3
         3VUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mZpUTCzTOESHEsJ+JC7V0K5g6eGsyAIVNhopcWkbTBs=;
        b=SspXsOwRmyRzTSMnHxAykKmax4VlkI3PI4ZZiMf//dLTSRxrreKmK/rSPZEiDJ8LU0
         rBQMSED/Gw1ySMqirQO1Sm5gEEqh4Sd0daeP0kazE2Kr5iLQ5nThKTQvdkH6hQh17UDL
         h419BYNAea6l9Xm5eD0/perQbg3/3S3znPj/Fk9pLpmXsAdKRqytV1N5/2L6/bttDOfw
         BD1axZE67r6jRW1LZR9n++w2ERTM5I7Mc3lUEF25+HoO4aVFRxrDc0StwZuS6EEuLFEX
         /XZ40siNU3Q5BDIqEp6iHsDTK/V0gxvGmp6hGB0m3k9EHL31z1B5iFugsfsax+OgpTW8
         plPw==
X-Gm-Message-State: AO0yUKW90hQ1aZCGdh29Co9UYJZEo7b81z1nqx2kdeSN75gxo8RT8FV2
        k/mcYlNRALRPjygllE4INDY=
X-Google-Smtp-Source: AK7set8Bp5WyKUg1RlcnJMaK2qGTLQYAJpaMWkjadimizx/xPoiPWnKcHvmyAKao//8kX1IZEE8VAg==
X-Received: by 2002:a05:600c:601b:b0:3db:1ab:b91b with SMTP id az27-20020a05600c601b00b003db01abb91bmr5897672wmb.15.1675341372431;
        Thu, 02 Feb 2023 04:36:12 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k32-20020a05600c1ca000b003ddf2865aeasm5144981wms.41.2023.02.02.04.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 04:36:12 -0800 (PST)
Date:   Thu, 2 Feb 2023 15:36:07 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     angelogioacchino.delregno@collabora.com
Cc:     linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [bug report] clk: mediatek: mt8173: Break down clock drivers and
 allow module build
Message-ID: <Y9uuN4NNqjjdbAAU@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello AngeloGioacchino Del Regno,

The patch 4c02c9af3cb9: "clk: mediatek: mt8173: Break down clock
drivers and allow module build" from Jan 20, 2023, leads to the
following Smatch static checker warning:

	drivers/clk/mediatek/clk-mt8173-apmixedsys.c:95 clk_mt8173_apmixed_probe()
	warn: passing zero to 'PTR_ERR'

drivers/clk/mediatek/clk-mt8173-apmixedsys.c
    85 static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
    86 {
    87         struct device_node *node = pdev->dev.of_node;
    88         struct clk_hw_onecell_data *clk_data;
    89         void __iomem *base;
    90         struct clk_hw *hw;
    91         int r;
    92 
    93         base = of_iomap(node, 0);
    94         if (!base)
--> 95                 return PTR_ERR(base);

return -ENOMEM;

    96 
    97         clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
    98         if (IS_ERR_OR_NULL(clk_data))
    99                 return -ENOMEM;

mtk_alloc_clk_data() does not return error pointers.  This needs to
call of_unmap(base);.  The ->remove() function doesn't unmap base either.

    100 
    101         r = mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
    102         if (r)
    103                 goto free_clk_data;
    104 
    105         hw = mtk_clk_register_ref2usb_tx("ref2usb_tx", "clk26m", base + REGOFF_REF2USB);
    106         if (IS_ERR(hw)) {
    107                 r = PTR_ERR(hw);
    108                 dev_err(&pdev->dev, "Failed to register ref2usb_tx: %d\n", r);
    109                 goto unregister_plls;
    110         }
    111         clk_data->hws[CLK_APMIXED_REF2USB_TX] = hw;
    112 
    113         hw = devm_clk_hw_register_divider(&pdev->dev, "hdmi_ref", "tvdpll_594m", 0,
    114                                           base + REGOFF_HDMI_REF, 16, 3,
    115                                           CLK_DIVIDER_POWER_OF_TWO, NULL);
    116         clk_data->hws[CLK_APMIXED_HDMI_REF] = hw;
    117 
    118         r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
    119         if (r)
    120                 goto unregister_ref2usb;
    121 
    122         return 0;
    123 
    124 unregister_ref2usb:
    125         mtk_clk_unregister_ref2usb_tx(clk_data->hws[CLK_APMIXED_REF2USB_TX]);
    126 unregister_plls:
    127         mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
    128 free_clk_data:
    129         mtk_free_clk_data(clk_data);
    130         return r;
    131 }

regards,
dan carpenter
