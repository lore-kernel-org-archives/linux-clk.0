Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C21BFC6FD1D
	for <linux-clk@archiver.kernel.org>; Wed, 15 Mar 2023 15:34:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232348AbjCOPei (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Mar 2023 11:34:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232234AbjCOPeh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Mar 2023 11:34:37 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E14134025
        for <linux-clk@vger.kernel.org>; Wed, 15 Mar 2023 08:34:36 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id m18-20020a05600c3b1200b003ed2a3d635eso1529919wms.4
        for <linux-clk@vger.kernel.org>; Wed, 15 Mar 2023 08:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112; t=1678894474;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iSn5kfdhykvLhyEuzFDrK08azEwQSSmZ1qquAFvnjIQ=;
        b=BToH7Z3bKMbzK2RjYie+EhidShhg+xhjJZAE5+GlddA9dzbs0n1hStJfanyTI1tNUU
         8E1aha0lNNN3OjR7fF0Nc/0gKastWb83+rZhAadJO1UCkOyQ9F0oMhQbLabowqy2pg8u
         XEJoo3m4hk9F4wwPsYf2rgKizCMsCzYthDZW1cKkVyXuIFrXms8mWqKNhLHLcBrwoCB3
         dOGWuiSQLGKOQhqryeEpVAWL2t/cpc6J7AnbuxyStvtNbCbDyxHrrGLlJh40OdBNEO+Z
         fwQ4p2pCV2/u6guFFwurxcdXBRJGd+4gx3RM0/eHNNxjXt2KRUAtY6Yl/nN1yyVsK1F4
         MBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678894474;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSn5kfdhykvLhyEuzFDrK08azEwQSSmZ1qquAFvnjIQ=;
        b=0lLnMZ8vG9t7qeUuqqwv1+chSv4YxJjI/wOeKnB6eUJM/pwFwGyStHQIZ+UUsKC/Q0
         LyWU9CsYD8Ata5bmws48HRIBG1DHCtQSNpEsXHlN4qfSuW7JQk1k7YnM2TddLtrui5UF
         7jDqMco5y0tzJVtJ1exmHtefToFTVe7rmiNPJEMindUGrzE5bXzqgvRu0VkLFqaYQHi7
         sZGZq+C+GwyOG3m+5DWmf4ZWi+9VS4XxxmR5JeA32TW79L1IMzkpvLutHNctDRalLuJy
         p0WCA2Jca0khoHjDKwgV/sijKPU7HzMMf4eycywRN75OlftHXFrmd+ki5GJyMsLkwt5H
         Xo5Q==
X-Gm-Message-State: AO0yUKVId0FaoPUWDvlV45V6T18pkDQXqtWdKxIbN5LyVIJTBwjW/k0V
        N+1RDFY7ZI1JKFx8FmRGDGEu1I8aNDGBbTwdB/s=
X-Google-Smtp-Source: AK7set8Yoa8+IOiarZ3IfL/VWla0xR5U0UapuEedg4o2wA11yz28lAI5nnin9ac7ZaYZUjGvpdwgrg==
X-Received: by 2002:a05:600c:3c9e:b0:3e1:f8af:8772 with SMTP id bg30-20020a05600c3c9e00b003e1f8af8772mr18006250wmb.9.1678894474641;
        Wed, 15 Mar 2023 08:34:34 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id o23-20020a05600c511700b003ed29b332b8sm2643610wms.35.2023.03.15.08.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 08:34:33 -0700 (PDT)
Date:   Wed, 15 Mar 2023 16:34:32 +0100
From:   Jiri Pirko <jiri@resnulli.us>
To:     Vadim Fedorenko <vadfed@meta.com>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH RFC v6 6/6] ptp_ocp: implement DPLL ops
Message-ID: <ZBHliPPS+e5d5JQe@nanopsycho>
References: <20230312022807.278528-1-vadfed@meta.com>
 <20230312022807.278528-7-vadfed@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230312022807.278528-7-vadfed@meta.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Sun, Mar 12, 2023 at 03:28:07AM CET, vadfed@meta.com wrote:

[...]

>@@ -4226,8 +4377,44 @@ ptp_ocp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> 
> 	ptp_ocp_info(bp);
> 	devlink_register(devlink);
>-	return 0;
> 
>+	clkid = pci_get_dsn(pdev);
>+	bp->dpll = dpll_device_get(clkid, 0, THIS_MODULE);
>+	if (!bp->dpll) {

You have to use IS_ERR() here. Same problem in ice.

[...]
