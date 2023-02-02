Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09272C61DA4
	for <linux-clk@archiver.kernel.org>; Thu,  2 Feb 2023 13:06:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231643AbjBBNGM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 Feb 2023 08:06:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231546AbjBBNGL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Feb 2023 08:06:11 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6B1B8E696
        for <linux-clk@vger.kernel.org>; Thu,  2 Feb 2023 05:06:01 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id hn2-20020a05600ca38200b003dc5cb96d46so3668131wmb.4
        for <linux-clk@vger.kernel.org>; Thu, 02 Feb 2023 05:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bM3yc7qiXwWhlRaDbvJOzi40+GQTbt6YaLYioRnS8R4=;
        b=Rvww/bxfQGrNRtt90fBevNZNxYfMjFXMeYA2Q4f/J3H8lHX6JQyrOuYTIf8O0E8+qC
         UbXjTVeFtmdkOR71jPEyHKlFHV2kOomW2NYaRYkALBqeRTKFlTpauCdvvNkEGwPWkQKG
         En4FBMqMzUXanl8eTdkXNBZnLkURg6nATxfMdozkvfI6vDG3BYGJ8gfPOR22W1zZOQgy
         QLqoUc+h6NvUAKaSiH1Csn+Y/4ObEJy1n05Wu/zDmTcMXBddYsPPW6BG4PoVrSW9qxpS
         XfWFc4kIWUfd2QFSBO8oQY+k1c2H6FvvI0do/3KbWCSPh+8eMaABM9fwLDRg5KDWuYbu
         16Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bM3yc7qiXwWhlRaDbvJOzi40+GQTbt6YaLYioRnS8R4=;
        b=gnwDzPRF//RbMQxyvbXPGq1WKmjVDM8neTlnRRqr6ilzLDmzjTMtiNZD3NuhbT0omq
         rMbqTIo64sqRrF3vS2U9vIDyZ0IW/yKObleFYwjuv09YbocdtM58Y+1IARPl6ZpwugNV
         jpkpYnx++eYjg7JkVXnQwtCmKmAa8pPEjDQNxUFgYILn1J7U4ncOloUHhOoUTtzzBg5c
         ydEERwi0juRCH6yZmAcmYiFvo7/ARy16yy3/qy1xHjC72aslpavIGVKrLMBJq4/nWzSb
         CxUAbISeiK9GHIQj1/qlh3ecScQxYPgaaT7yAMOn6TtoVQNiFVwjv1FTfRYA/PjJpsHp
         iGxw==
X-Gm-Message-State: AO0yUKVdYW5Gm0Z+b99WbYNyuiLS6eFDDoL5rI0YC5LHQ3rw5jRPwXPp
        3mDimW+rxod5oFUOKj05K+U=
X-Google-Smtp-Source: AK7set+CWWn3Q1cPAOl+tVYu0Gng86xv9JLLy78eQfNvT9wgbId9PYFNHu1x7ipl1iVwDAHfpAzSVA==
X-Received: by 2002:a05:600c:35d3:b0:3de:e8c5:d82c with SMTP id r19-20020a05600c35d300b003dee8c5d82cmr5210093wmq.29.1675343160466;
        Thu, 02 Feb 2023 05:06:00 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p17-20020a05600c205100b003dd1bd0b915sm1814074wmg.22.2023.02.02.05.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 05:06:00 -0800 (PST)
Date:   Thu, 2 Feb 2023 16:05:56 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     angelogioacchino.delregno@collabora.com
Cc:     linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [bug report] clk: mediatek: clk-mtk: Extend mtk_clk_simple_probe()
Message-ID: <Y9u1NNZ4I6w4vygt@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello AngeloGioacchino Del Regno,

The patch 7b6183108c8c: "clk: mediatek: clk-mtk: Extend
mtk_clk_simple_probe()" from Jan 20, 2023, leads to the following
Smatch static checker warning:

drivers/clk/mediatek/clk-mtk.c:558 mtk_clk_simple_probe() info: returning a literal zero is cleaner
drivers/clk/mediatek/clk-mtk.c:581 mtk_clk_simple_probe() error: uninitialized symbol 'base'.
drivers/clk/mediatek/clk-mtk.c:583 mtk_clk_simple_probe() warn: 'base' from of_iomap() not released on lines: 496.

drivers/clk/mediatek/clk-mtk.c
   466  int mtk_clk_simple_probe(struct platform_device *pdev)
   467  {
   468          const struct mtk_clk_desc *mcd;
   469          struct clk_hw_onecell_data *clk_data;
   470          struct device_node *node = pdev->dev.of_node;
   471          void __iomem *base;
   472          int num_clks, r;
   473  
   474          mcd = of_device_get_match_data(&pdev->dev);
   475          if (!mcd)
   476                  return -EINVAL;
   477  
   478          /* Composite clocks needs us to pass iomem pointer */
   479          if (mcd->composite_clks) {
   480                  if (!mcd->shared_io)
   481                          base = devm_platform_ioremap_resource(pdev, 0);
   482                  else
   483                          base = of_iomap(node, 0);
   484  
   485                  if (IS_ERR_OR_NULL(base))
   486                          return IS_ERR(base) ? PTR_ERR(base) : -ENOMEM;
   487          }
   488  
   489          /* Calculate how many clk_hw_onecell_data entries to allocate */
   490          num_clks = mcd->num_clks + mcd->num_composite_clks;
   491          num_clks += mcd->num_fixed_clks + mcd->num_factor_clks;
   492          num_clks += mcd->num_mux_clks;
   493  
   494          clk_data = mtk_alloc_clk_data(num_clks);
   495          if (!clk_data)
   496                  return -ENOMEM;

goto free_base;

   497  
   498          if (mcd->fixed_clks) {
   499                  r = mtk_clk_register_fixed_clks(mcd->fixed_clks,
   500                                                  mcd->num_fixed_clks, clk_data);
   501                  if (r)
   502                          goto free_data;
   503          }
   504  
   505          if (mcd->factor_clks) {
   506                  r = mtk_clk_register_factors(mcd->factor_clks,
   507                                               mcd->num_factor_clks, clk_data);
   508                  if (r)
   509                          goto unregister_fixed_clks;
   510          }
   511  
   512          if (mcd->mux_clks) {
   513                  r = mtk_clk_register_muxes(&pdev->dev, mcd->mux_clks,
   514                                             mcd->num_mux_clks, node,
   515                                             mcd->clk_lock, clk_data);
   516                  if (r)
   517                          goto unregister_factors;
   518          };
   519  
   520          if (mcd->composite_clks) {
   521                  /* We don't check composite_lock because it's optional */
   522                  r = mtk_clk_register_composites(&pdev->dev,
   523                                                  mcd->composite_clks,
   524                                                  mcd->num_composite_clks,
   525                                                  base, mcd->clk_lock, clk_data);
   526                  if (r)
   527                          goto unregister_muxes;
   528          }
   529  
   530          if (mcd->clks) {
   531                  r = mtk_clk_register_gates(&pdev->dev, node, mcd->clks,
   532                                             mcd->num_clks, clk_data);
   533                  if (r)
   534                          goto unregister_composites;
   535          }
   536  
   537          if (mcd->clk_notifier_func) {
   538                  struct clk *mfg_mux = clk_data->hws[mcd->mfg_clk_idx]->clk;
   539  
   540                  r = mcd->clk_notifier_func(&pdev->dev, mfg_mux);
   541                  if (r)
   542                          goto unregister_clks;
   543          }
   544  
   545          r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
   546          if (r)
   547                  goto unregister_clks;
   548  
   549          platform_set_drvdata(pdev, clk_data);
   550  
   551          if (mcd->rst_desc) {
   552                  r = mtk_register_reset_controller_with_dev(&pdev->dev,
   553                                                             mcd->rst_desc);
   554                  if (r)
   555                          goto unregister_clks;
   556          }
   557  
   558          return r;

return 0;

   559  
   560  unregister_clks:
   561          if (mcd->clks)
   562                  mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data);
   563  unregister_composites:
   564          if (mcd->composite_clks)
   565                  mtk_clk_unregister_composites(mcd->composite_clks,
   566                                                mcd->num_composite_clks, clk_data);
   567  unregister_muxes:
   568          if (mcd->mux_clks)
   569                  mtk_clk_unregister_muxes(mcd->mux_clks,
   570                                           mcd->num_mux_clks, clk_data);
   571  unregister_factors:
   572          if (mcd->factor_clks)
   573                  mtk_clk_unregister_factors(mcd->factor_clks,
   574                                             mcd->num_factor_clks, clk_data);
   575  unregister_fixed_clks:
   576          if (mcd->fixed_clks)
   577                  mtk_clk_unregister_fixed_clks(mcd->fixed_clks,
   578                                                mcd->num_fixed_clks, clk_data);
   579  free_data:
   580          mtk_free_clk_data(clk_data);
   581          if (mcd->shared_io && base)
   582                  iounmap(base);

This needs to be:

		if (mcd->composite_clks && !mcd->shared_io)
			iounmap(base);

   583          return r;
   584  }

regards,
dan carpenter
