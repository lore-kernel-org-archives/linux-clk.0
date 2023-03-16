Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8682BC6FD1F
	for <linux-clk@archiver.kernel.org>; Thu, 16 Mar 2023 13:46:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230425AbjCPNqy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Mar 2023 09:46:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230427AbjCPNqv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Mar 2023 09:46:51 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD23DC5AC1
        for <linux-clk@vger.kernel.org>; Thu, 16 Mar 2023 06:46:30 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso3230413wmb.0
        for <linux-clk@vger.kernel.org>; Thu, 16 Mar 2023 06:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112; t=1678974389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pMb6/PASsupcr6he8sVzXRQlrPIQGgN7Aqxu5r+q+nE=;
        b=E/y8VUFvKXomJ/FdeOo5PGL9JIEzDa2mVhlFzrW9r/M/xKB/UisLO4wjyi0MK26zo8
         FgvDCRK7JDCocFRCurnAznWiTiSiHOW6kIwcQQyZP/63zXD17PFbw5vZ+KrIXhsVquC4
         ecgQPkNC0YF+SUv5Jbm7qddv4w8KP1hCTEPvRO4w/yYztrioP74W+0RDns++yJgGWfSC
         mGtq7CjogqN5f2HeV+akQTZfw1OHuAn8Hz5MvOn/mUqGDc6YaFi62jU6It2rcd5s2A6z
         Ir59f/z4yTlZfxeBONafJeZrpepzQN1bQCdTdAhoKFvqSRPplBmj3CrTh2+87E/jQep0
         UYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678974389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMb6/PASsupcr6he8sVzXRQlrPIQGgN7Aqxu5r+q+nE=;
        b=RJY1g5n6bWUT5mZKHJBiK9z1sekbFPx68Ms0FWxpCuXNLwa3w1Y6+4RaijO/F4VX14
         HTtPB9qKKwbNRB2HzkexcU4D66nxa0QNsthWSmwtEKUk5rHaJzfBWqZM/sXCfgrCsrVe
         /oOIszk0rjHUu16Ua4viyQjQXKzCDtaZgvXpZ/rspR5vJyr/Jzwg/p1ArMxnCo+tSO8S
         9JKQM0ylQJ3B+7XjIHCQJ9xdIyxQCRjBOBIQZ10pvlny3XMVJ5XkcBDbI9nbtJUxUlrU
         IaUOxxMMzZDIkpEnTf5qv2wNrwgxuDJA/PQAsmra55vgA4KTVUe626bPcstbqKCNwK9P
         nFdw==
X-Gm-Message-State: AO0yUKUvcTYjIiXCJqFbRBumA5ZA21JXsytgh4X2cmub4OCEOUujnzvZ
        P4lk5RjiE8rKUj8SjVenggKUhg==
X-Google-Smtp-Source: AK7set/nW5zUSHMaxTpv2Pw31kptGyNdFxLbvmzoEzS/oND2VCzl2/1KbVC607PtsYw3wTt5haUUTQ==
X-Received: by 2002:a05:600c:3b99:b0:3ed:2352:eebd with SMTP id n25-20020a05600c3b9900b003ed2352eebdmr14221295wms.11.1678974389093;
        Thu, 16 Mar 2023 06:46:29 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id o23-20020a05600c511700b003ed29b332b8sm5678370wms.35.2023.03.16.06.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 06:46:28 -0700 (PDT)
Date:   Thu, 16 Mar 2023 14:46:27 +0100
From:   Jiri Pirko <jiri@resnulli.us>
To:     Vadim Fedorenko <vadfed@meta.com>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH RFC v6 3/6] dpll: documentation on DPLL subsystem
 interface
Message-ID: <ZBMdszEWZNN2VFz1@nanopsycho>
References: <20230312022807.278528-1-vadfed@meta.com>
 <20230312022807.278528-4-vadfed@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230312022807.278528-4-vadfed@meta.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Sun, Mar 12, 2023 at 03:28:04AM CET, vadfed@meta.com wrote:

[...]


> Documentation/networking/dpll.rst  | 347 +++++++++++++++++++++++++++++

Why this is under networking? It is not networking. Please move,
probably directly under "Documentation"

[...]
