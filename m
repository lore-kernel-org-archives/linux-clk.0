Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C6DCC6FD19
	for <linux-clk@archiver.kernel.org>; Thu, 16 Mar 2023 16:16:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbjCPQQy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Mar 2023 12:16:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230093AbjCPQQq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Mar 2023 12:16:46 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C2BECB04B
        for <linux-clk@vger.kernel.org>; Thu, 16 Mar 2023 09:16:12 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id bh21-20020a05600c3d1500b003ed1ff06fb0so1532802wmb.3
        for <linux-clk@vger.kernel.org>; Thu, 16 Mar 2023 09:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112; t=1678983368;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wX835sOTXGenDvrM9Jk5H9iGd+G5Ry9hzVMonTiqeF8=;
        b=8W0GlkXluf3WSvAkb2eCYF1ksoQ+1Ay9zcraA9kwWP4UCSDo89FkIS+UE/JTNtOr+R
         AKtVGGwXB55JlOnOqDS8UWhoXIjfn1F0XrT1FCJY9/4OYjKsobz+Xm6NxUmo8DWwNwbh
         wUOsAGtwBt8Ytz43m0FzmZZfaLPazDYjWOyo92vt15hBpmyyKrOVwRbB1iglpMhYMJSq
         l6/Aqee0FuI59mTebLgsv34/RvnB9QPfUOSgGdv/CPoCNKZnihLdPc3zKVZDmaIN+SEJ
         1SULjAWVRvZo/NcvXuTm7RKLJV3DkiNZ3nA3bXME910UCXQPgAf/0RIgMwU4wxo4/ynf
         jlmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678983368;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wX835sOTXGenDvrM9Jk5H9iGd+G5Ry9hzVMonTiqeF8=;
        b=uPpeHD1MDMMvfnhTzCvBxN6auUfd6J50SAtegs1uVEu5GKPmuSS2Yf2mRfJo0NMNvQ
         eu0vfF+Ogx5UsJx5XRt08VkU8JgwsE0JtxP2SkWdKio9IrrYDF8yxsQHOCzar8K5uHlU
         ZWSFy3Bdnnav3K+jGYv2MfllHCZQidddQ9oCoz10/tuAZvt1gTy36z5fHrMhPufJ10O/
         Wpzndvj6RDLl21v75GVbNMePKNjlmJ6Is33xxJgpcWGenaVkSJIT2Dy88Av2nCg82lsY
         ymDXOvnPSgHKjfqZRVVmsYl7aruNyOK62vKfle0COAuW+MGu5LeOnYuE9aIBxl9h91mW
         pyug==
X-Gm-Message-State: AO0yUKUOgXWygu6bMK+zCmZicRxj+OkdieiOmZOMj7N+dNP0SGxtcj4P
        J8t7q9AG0yKfp8HIQSzN1KzBbA==
X-Google-Smtp-Source: AK7set/5iz9jce0skzNhfyE7OilWfOKtLGfxC9x0HFGwKgdOeFNkTmKmSTfB37p5pR3ZiYxJTEBuXw==
X-Received: by 2002:a05:600c:4f07:b0:3ed:3cec:d2ec with SMTP id l7-20020a05600c4f0700b003ed3cecd2ecmr4720861wmq.15.1678983368217;
        Thu, 16 Mar 2023 09:16:08 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id p3-20020a05600c358300b003ed2eb5c2dcsm5734716wmq.43.2023.03.16.09.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 09:16:07 -0700 (PDT)
Date:   Thu, 16 Mar 2023 17:16:06 +0100
From:   Jiri Pirko <jiri@resnulli.us>
To:     Vadim Fedorenko <vadfed@meta.com>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>
Subject: Re: [PATCH RFC v6 2/6] dpll: Add DPLL framework base functions
Message-ID: <ZBNAxlNhSnTxNz3z@nanopsycho>
References: <20230312022807.278528-1-vadfed@meta.com>
 <20230312022807.278528-3-vadfed@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230312022807.278528-3-vadfed@meta.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Sun, Mar 12, 2023 at 03:28:03AM CET, vadfed@meta.com wrote:

[...]


>+int dpll_device_register(struct dpll_device *dpll, enum dpll_type type,
>+			 struct dpll_device_ops *ops, void *priv,

ops should be const


>+			 struct device *owner)

[...]


>+
>+static int
>+__dpll_pin_register(struct dpll_device *dpll, struct dpll_pin *pin,
>+		    struct dpll_pin_ops *ops, void *priv,

ops should be const


>+		    const char *rclk_device_name)
>+{

[...]
