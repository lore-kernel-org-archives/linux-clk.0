Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7FC6C77B7C
	for <linux-clk@archiver.kernel.org>; Thu,  4 May 2023 11:18:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbjEDLSy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 May 2023 07:18:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbjEDLSx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 May 2023 07:18:53 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBF8A358A
        for <linux-clk@vger.kernel.org>; Thu,  4 May 2023 04:18:52 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-306f9df5269so208035f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 04 May 2023 04:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1683199131; x=1685791131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+zf/6Kk7wlwMzgoieI4ADc/0KpgI0PIbW0Orbu7zEQs=;
        b=mHXJwM4DZUdQ9nMOoHFqCV/rylGCREHQlvXjGTuXiu4NuSqSjbKOkFDi1AqL/VrWIa
         8bgpj35qpmDVlsHPnkhZyLoX3YPGNREIGgzQqWhJZ6F7na4krZHnJVkeBa6DmyZIbOSb
         vWX6aImlbHkXQOqAR+RErvc51Tt/O1NA+cyxGjyrGoJ25fuiyK28H6TWs5f+Ho3nD9eG
         y+L7XVA0jJaADlVKBJsH+98VFvKkQImvCuMlBkchaW7wFE42tNRikWSoDPQFa3AkKNuq
         m4g33KwCJqdY/OsZffYNNECF0lTL/Kxhq22llvRBGPUB4Pbr9LFU/Pxumr+D+ShHbBFo
         CwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683199131; x=1685791131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+zf/6Kk7wlwMzgoieI4ADc/0KpgI0PIbW0Orbu7zEQs=;
        b=GtK4Uyl1mZ8wWWqP+M7kZXlpQ6s3tNhYyf9KoWfyy5DNG3jvA5s2GEYhu9gdRmyeIi
         BpgGbj8OS+RnppXF2pcpjOpJavt+s8XmAZdKbljdMMx/vv7XbVKkeHbBC+PatNBmouC1
         iHVMKh4TiqedcQ9wQ+StkKqOhBPNr6M77ZuZAulngEnEvhTEaZzrdKorkwGW4/YRdi4b
         fwP34p9hqWKz+j8mmLCFQ8e8GRXB1u+jxgnDm1JitIY+1mZl2fT5t7VbSbEEqpeKQd3C
         0WtHnUTAs8Tl/1gaCCCtSJnY21IrBXETJMCm3ya5G/aBn1VsC5Em+EOlSNQKg0WIwI82
         zBOg==
X-Gm-Message-State: AC+VfDxCWyqCMsAjNHStCHXMJSNnrIvKmsSK7tiNdcKUxN4mTwQnLfwC
        fCSSo645VpYoXIwdQMFPvkzZ6g==
X-Google-Smtp-Source: ACHHUZ5Yxe+2HE+FmRZTFXmd1OCmP7KFW6mShX4t7u7KkCglAhepqWTRe15E6vN8DjmdQO4CSD6gLA==
X-Received: by 2002:a5d:6681:0:b0:303:97db:ae93 with SMTP id l1-20020a5d6681000000b0030397dbae93mr2001914wru.44.1683199131275;
        Thu, 04 May 2023 04:18:51 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id d2-20020a5d5382000000b00306423904d6sm4514221wrv.45.2023.05.04.04.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 04:18:50 -0700 (PDT)
Date:   Thu, 4 May 2023 13:18:49 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Vadim Fedorenko <vadfed@meta.com>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>,
        linux-arm-kernel@lists.infradead.org,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [RFC PATCH v7 2/8] dpll: Add DPLL framework base functions
Message-ID: <ZFOUmViuAiCaHBfc@nanopsycho>
References: <20230428002009.2948020-1-vadfed@meta.com>
 <20230428002009.2948020-3-vadfed@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428002009.2948020-3-vadfed@meta.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fri, Apr 28, 2023 at 02:20:03AM CEST, vadfed@meta.com wrote:

[...]


>diff --git a/include/uapi/linux/dpll.h b/include/uapi/linux/dpll.h
>index e188bc189754..75eeaa4396eb 100644
>--- a/include/uapi/linux/dpll.h
>+++ b/include/uapi/linux/dpll.h
>@@ -111,6 +111,8 @@ enum dpll_pin_direction {
> 
> #define DPLL_PIN_FREQUENCY_1_HZ		1
> #define DPLL_PIN_FREQUENCY_10_MHZ	10000000
>+#define DPLL_PIN_FREQUENCY_10_KHZ	10000
>+#define DPLL_PIN_FREQUENCY_77_5_KHZ	77500

This should be moved to patch #1.
please convert to enum, could be unnamed.

[...]
