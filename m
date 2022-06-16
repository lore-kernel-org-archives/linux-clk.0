Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81857C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 16 Jun 2022 16:01:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377357AbiFPQB6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Jun 2022 12:01:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237882AbiFPQB5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Jun 2022 12:01:57 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C726D45ADB
        for <linux-clk@vger.kernel.org>; Thu, 16 Jun 2022 09:01:55 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id m24so2451391wrb.10
        for <linux-clk@vger.kernel.org>; Thu, 16 Jun 2022 09:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fDpptzLHw4Uf98ATfaDvWk2RI324uTrH2wMxpJWMHDM=;
        b=up4O2HccUmVrpuUM2kscgGbI6UVb7idsbYT+nw9G84eoifDcsHZkNzMQD+vuJZ/7Cz
         uHmqCZmd8DlOBROpDabzsZ8tOrlz7Fq2QwcVHvKtvHvlk4QV0k1Td3DR11GjApNRWPYc
         8gjiMujkBmEZxbVYxynKK4nKBmLeHyoAnJsWZHW9EnN1/qfjRo4fRXsQ6Nh/i3vb/glh
         3TfId7o8XfI47blXRtA/5V9/3ogvV4YHl1FlzSBvOzFKA5kNuGeFLyLMcBj9BA0zOJNC
         O8vBXgQ3G5Fyejl/ptrU/5bR21PaoGeMeKjMoD1zzD+TeA7UzD6x1I7BurpaNFNDwRZr
         wapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fDpptzLHw4Uf98ATfaDvWk2RI324uTrH2wMxpJWMHDM=;
        b=o1PmyHNRf2bONw3zxYO1SgHALXdlqeGcnr64h6PYrneRfPJNo+ulcO/C7UMlcLTW75
         PI1BEz0QKsubfcEA/kPaOTgis/EOM76Lydd2ofgejt2R0/y6rfiMnDEjORtVAO20nioV
         M8JhNsq+RvEu5fl4woI7GtblspSwDIaT7UKo/3yxYyBuvTbxeFDeFQpSzae3+7w4CKjX
         lhQbNjl6ZEwbpr4HKhXXQM0R4H5YgEs/9o6dtznPCF+mIwJrwNmNtnmyPHqdovCKuwag
         W2Fzh9Qn5oCrmv+qeukzxmRq4OY3A2m6LZ7/p6s3k/whKWX7X2N/FtjMfJ6TH3kdsQPt
         8thA==
X-Gm-Message-State: AJIora9qZ4Ek7bwzvAWMYVk8Ag8pf4zUl2aLHalAwsHZ/7mEVRcAgoh1
        FSdHRRQE815OFk8CLFq0b1nvZw==
X-Google-Smtp-Source: AGRyM1sPf418xHWiCQdMTOL82E/BmMZ+P8xYSL/p1HJFjlzMJCMrCUE6kDNOqMiha4tRCnInDwHwWw==
X-Received: by 2002:adf:d1ed:0:b0:215:98d7:2a93 with SMTP id g13-20020adfd1ed000000b0021598d72a93mr5360534wrd.637.1655395314406;
        Thu, 16 Jun 2022 09:01:54 -0700 (PDT)
Received: from ryzen ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id v11-20020a5d4b0b000000b0020d07d90b71sm2211270wrq.66.2022.06.16.09.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 09:01:53 -0700 (PDT)
Date:   Thu, 16 Jun 2022 19:01:51 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     abel.vesa@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 0/7] clk: imx93: pll/imx93 fixes and update
Message-ID: <YqtT70KkSnLzG1zH@ryzen>
References: <20220609132902.3504651-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609132902.3504651-1-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-06-09 21:28:55, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> This patchset covers a few Fixes to pll and i.mx93 clk, also includes
> one patch to update pll freq.
>

Applied all, thanks.

> Haibo Chen (1):
>   clk: imx93: use adc_root as the parent clock of adc1
>
> Jacky Bai (1):
>   clk: imx93: Correct the edma1's parent clock
>
> Liu Ying (1):
>   clk: imx: clk-fracn-gppll: Return rate in rate table properly in
>     ->recalc_rate()
>
> Peng Fan (4):
>   clk: imx93: correct nic_media parent
>   clk: imx: clk-fracn-gppll: fix mfd value
>   clk: imx: clk-fracn-gppll: correct rdiv
>   clk: imx: clk-fracn-gppll: Add more freq config for video pll
>
>  drivers/clk/imx/clk-fracn-gppll.c | 36 ++++++++++++++++++-------------
>  drivers/clk/imx/clk-imx93.c       |  6 +++---
>  2 files changed, 24 insertions(+), 18 deletions(-)
>
> --
> 2.25.1
>
