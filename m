Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F07C6FD1D
	for <linux-clk@archiver.kernel.org>; Fri, 17 Mar 2023 16:23:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjCQQXj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Mar 2023 12:23:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbjCQQXh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Mar 2023 12:23:37 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED6F93018D
        for <linux-clk@vger.kernel.org>; Fri, 17 Mar 2023 09:23:36 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id v16so4986874wrn.0
        for <linux-clk@vger.kernel.org>; Fri, 17 Mar 2023 09:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112; t=1679070215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CFTtTxvvW2TaL2/uZrd+qk+RLkOl91PVBRCzxuQjGWw=;
        b=GIhWGXJ5Knl0XVgoVWulLks9QMvK/u2eiLSx1DqrMfzZSv0/XPh4Zbat9/9WMfU7p0
         hW62ixZTKAg6wjaip8CLuMklarycB/B9sFdNhU9X3qw80il/YVHrnKimzpEeXeKDoQrm
         6YPgo8zYPkPObSphfQ/wCp72s+jrS6Q+bDo6jko+dK7JuEmukwHOi3TWXmmsmvkKiU+C
         2oDZkqQaJIG5TxX6kycQDH8i7ZYtTwoPNpBJVWHwBrv1nRnVsIwvx9Hfq4TCEG4ilL0r
         NCOkxPbi/axlNMzYVJx0O5b783LrGpIAtfQFdNenXDYcq4xeO/9kLzEvYct06uA12Sd1
         CRYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679070215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFTtTxvvW2TaL2/uZrd+qk+RLkOl91PVBRCzxuQjGWw=;
        b=o8bKfXNUPepp7Qo6Cr3cQjLdGxRZQFZqXcht1girt1fh6aEUzlCBQ/BtwhiTbAsCxi
         nAXlVCu9t9U4908srd0yBfM4z8T2k5EpaFglJ0N6e2ps4iC6CgcFP8MZQ6r4+Lh2eCay
         5z5o4mmcPx/4r1m/HA1Z5mTRlZlEUij0UtXtj7Y59fH8UZh2knrOAM7bIpzzGsjNLQu0
         E/4vkzT8DJR1x1bZ1suRDcahqBjTYd1D8ILlyIE9GwU9wIlJNM3oWYRcr1Iue1WgDJ+N
         m10g3VV/UIq+K9SqD1doKQ/Doz4pz99S7KTJV1r4CYKtnZubdAh2qpv1+j9PJjXBFbSn
         1LXw==
X-Gm-Message-State: AO0yUKWBdj7om/Vb/owG/ZiuA4YusbNTF4LW2+CXhQZEvQWohyhUBmAK
        axqAdyS+Bm0HBDu8FQnTkpWdog==
X-Google-Smtp-Source: AK7set82AOZ21B+YPX2qFt9bjaX9ZLa16gktIkU6CDKG/dnIuXtZidLv7gQyW/PJP7iAUaN9/opdaA==
X-Received: by 2002:a5d:4908:0:b0:2cf:edf0:f8c with SMTP id x8-20020a5d4908000000b002cfedf00f8cmr6987957wrq.29.1679070215487;
        Fri, 17 Mar 2023 09:23:35 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id k16-20020a5d6d50000000b002cff0e213ddsm2330005wri.14.2023.03.17.09.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 09:23:34 -0700 (PDT)
Date:   Fri, 17 Mar 2023 17:23:33 +0100
From:   Jiri Pirko <jiri@resnulli.us>
To:     Vadim Fedorenko <vadfed@meta.com>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        Michal Michalik <michal.michalik@intel.com>
Subject: Re: [PATCH RFC v6 1/6] dpll: spec: Add Netlink spec in YAML
Message-ID: <ZBSUBWUwC0FLlS/D@nanopsycho>
References: <20230312022807.278528-1-vadfed@meta.com>
 <20230312022807.278528-2-vadfed@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230312022807.278528-2-vadfed@meta.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Sun, Mar 12, 2023 at 03:28:02AM CET, vadfed@meta.com wrote:
>From: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>

[...]

>+/* Ops table for dpll */
>+static const struct genl_split_ops dpll_nl_ops[6] = {

It's odd to see 6 here. Should by just []
But it's an issue of Jakub's generator.

[...]
