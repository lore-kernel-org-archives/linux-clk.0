Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CAA0C6FD19
	for <linux-clk@archiver.kernel.org>; Thu, 16 Mar 2023 12:13:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230326AbjCPMNV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Mar 2023 08:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbjCPMNI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Mar 2023 08:13:08 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 329C15A920
        for <linux-clk@vger.kernel.org>; Thu, 16 Mar 2023 05:13:01 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id w11so17487wmo.2
        for <linux-clk@vger.kernel.org>; Thu, 16 Mar 2023 05:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112; t=1678968779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0WO9ZvpvbKYXwSvZnqpXO8L+DfOB3WdQq1e9D11Fqd0=;
        b=oVUGF0yasUG8tgP9FJtlDU/de74oAD79T9FS8r2MSfGFRpIJ41K+41e7qS9sP+Twqy
         poSmiTR1VOUd7g/CNm4uEosBAw/QbRSjHOidSfW1UQ1gKZKVjl/k3L2LBFDyHHt8Yeh3
         obq842Lj9kLvR5Iezk7uIybJ95+rkTGkrCMkapwdWCnqdFCnaA3EG4/EaDi7iI6fEFJM
         FuuaRUzjeEKWrVMalcg4VDenEqeJu59L+o+GkDhBRaN+WJyU4dVVNoe7fRgYhXz2cLzR
         hosk2HHNsANeiYufiHrjD5UyhGxJatkAlqUiN0kjipFVS8h6VtQrH+u5qIt14qdX7MpF
         WW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678968779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0WO9ZvpvbKYXwSvZnqpXO8L+DfOB3WdQq1e9D11Fqd0=;
        b=KqA0YRMc/JWgdBticFDW7Mj26dK9DXGgiIAZWiMzi9xV4iSeTfdNoDz7MufIhwzYz0
         5mcC4PEzh/TJVjiNovUs+borV2v+zgofk0J1l6MnsHvhosNDbaE13Gddw+hncQU6GUO7
         +dzXPtd662dWK9E0a85Pz4OIO1ERqZr5EXMVmYA7xdVqGAqpnVAam+XIXtAJMSJwClhZ
         tae3IS4enBlE1Cce+MgNJqrZh55KHMACM1HgOKgLL8WVaseM9rPZBY97ZqIs5pHE9RR1
         OrBZ8vn1ZFxnFtFfuqaUfqO6zF/7qYO5zKlP9/wQvhSe52NpXOW/hQ+NJMW4rIfEOBfC
         v2iQ==
X-Gm-Message-State: AO0yUKVIJc1EKLaVRLB1ns1Nr1jZVzCWlOHYqG5IwgToPRxwPQXvXjYf
        bemF+fprjzCO/Gbbd9dgb7QJzA==
X-Google-Smtp-Source: AK7set9NjrFBLZ4ieAlm3ZW5QgEeNlqzUCFNjWu5qAKobxPwLHR5HhGvM2v06tBMGI6Yp5t1wJ1/sw==
X-Received: by 2002:a05:600c:458e:b0:3eb:37ce:4c3d with SMTP id r14-20020a05600c458e00b003eb37ce4c3dmr19992464wmo.38.1678968779589;
        Thu, 16 Mar 2023 05:12:59 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id f13-20020adff44d000000b002cfe29d2982sm7048067wrp.103.2023.03.16.05.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 05:12:58 -0700 (PDT)
Date:   Thu, 16 Mar 2023 13:12:57 +0100
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
Message-ID: <ZBMHyarasEzecvlW@nanopsycho>
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


>@@ -4243,6 +4430,8 @@ ptp_ocp_remove(struct pci_dev *pdev)
> 	struct ptp_ocp *bp = pci_get_drvdata(pdev);
> 	struct devlink *devlink = priv_to_devlink(bp);
> 

You are missing pins unregister and put here.

Btw, It would be probably good to add a WARN_ON into
dpll_device_unregister() to catch bugs like this one.



>+	dpll_device_unregister(bp->dpll);
>+	dpll_device_put(bp->dpll);
> 	devlink_unregister(devlink);
> 	ptp_ocp_detach(bp);
> 	pci_disable_device(pdev);
>-- 
>2.34.1
>
