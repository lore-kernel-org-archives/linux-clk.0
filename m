Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60630C77B7F
	for <linux-clk@archiver.kernel.org>; Wed, 17 May 2023 10:18:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbjEQKSp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 May 2023 06:18:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbjEQKSo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 May 2023 06:18:44 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC6173A80
        for <linux-clk@vger.kernel.org>; Wed, 17 May 2023 03:18:40 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f42c865535so6182275e9.1
        for <linux-clk@vger.kernel.org>; Wed, 17 May 2023 03:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1684318719; x=1686910719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sh6TUytTx8wxEeH05oUpSXv6G2yuZqNrzgF6N7Kf/JE=;
        b=zCe8LxzUKmyqw6vOO9CGBnHOQlVUnRVuNRoTfZ+57IrX+pAxQArgqo5yLGdGZT4i1T
         8mPj2Jy4pjxdx1shCpWJZrBa+PxUOOufGz4FOs/5GO035D+guuPpq4q62NC0Q458d6b3
         AedB8pwzHc10YUnrtba6YW5HBAp9QKEFanoFO5QavAJbL11bDlWMXTQbc0BT7ZpSs9vY
         HE7sbsLMtEbdT674wlHtmpR8SpucMzOMS90hXpbA0OTGbDdhtsOXTPVL/PEp9Z+wIXXq
         XaNFy3PfbNd9ttUYXVgnwM+l0J/mLDXIzMr+QTE+pc8S0ovoLUb4kEruf4z5EUFPiu0X
         43Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684318719; x=1686910719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sh6TUytTx8wxEeH05oUpSXv6G2yuZqNrzgF6N7Kf/JE=;
        b=fo2QT/ebjR7XziWgfUpGAJ0HqCykRvLLHwrbyTDCyPQ912jwQ1Uy9NaUN6F9hBIY+N
         vBSN4xxWD8bChhaQioX7dv2IyC4vJ6Iv6juLT42N3wV2m+XB6l02RATsBBIxEcElyNin
         u5y5ZdGxgPR65A4yPxB+zY5uSIUkojry8p5YV3O0eU7M1Lh/9f4NpY/ZXmpZ63uYxc9v
         vUOjcPnZbD3yJnvDSvJTJ2Rtq5XuCWEqvDZGlAF2hIsfv5jScH6zOBv5v/Iby8pzAYHF
         jdiWK9zXPG7+bVXzFW/XP/q+Y88OY1SxjV1HenAcA1/2RAzX7cmv7ptRaeEX8Z4UTukv
         vdOA==
X-Gm-Message-State: AC+VfDyyqL04OEk4hdvHBTlOqgz4ZctmqwKQDpfHzRg7EjRTvktMxSV0
        EcrEhL2PIs+wxMJeqDgkhA5sZQ==
X-Google-Smtp-Source: ACHHUZ4UlQsr2kc2g5MqE1OgdmK2YuPWRilWxI/M6/tgf2zjPIaxmYm87qqMrU+Uw79xVyRVicyNIA==
X-Received: by 2002:a05:600c:ac6:b0:3f4:2770:f7e9 with SMTP id c6-20020a05600c0ac600b003f42770f7e9mr20925393wmr.17.1684318719016;
        Wed, 17 May 2023 03:18:39 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id n10-20020a5d67ca000000b0030796e103a1sm2511144wrw.5.2023.05.17.03.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 03:18:38 -0700 (PDT)
Date:   Wed, 17 May 2023 12:18:37 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Vadim Fedorenko <vadfed@meta.com>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>,
        linux-arm-kernel@lists.infradead.org,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [RFC PATCH v7 0/8] Create common DPLL configuration API
Message-ID: <ZGSp/XRLExRqOKQs@nanopsycho>
References: <20230428002009.2948020-1-vadfed@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428002009.2948020-1-vadfed@meta.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Let me summarize the outcome of the discussion between me and Jakub
regarding attributes, handles and ID lookups in the RFCv7 thread:

--------------------------------------------------------------
** Needed changes for RFCv8 **

1) No scoped indexes.
   The indexes passed from driver to dpll core during call of:
        dpll_device_get() - device_idx
        dpll_pin_get() - pin_idx
   should be for INTERNAL kernel use only and NOT EXPOSED over uapi.
   Therefore following attributes need to be removed:
   DPLL_A_PIN_IDX
   DPLL_A_PIN_PARENT_IDX

2) For device, the handle will be DPLL_A_ID == dpll->id.
   This will be the only handle for device for every
   device related GET, SET command and every device related notification.
   Note: this ID is not deterministing and may be different depending on
   order of device probes etc.

3) For pin, the handle will be DPLL_A_PIN_ID == pin->id
   This will be the only handle for pin for every
   pin related GET, SET command and every pin related notification.
   Note: this ID is not deterministing and may be different depending on
   order of device probes etc.

4) Remove attribute:
   DPLL_A_PIN_LABEL
   and replace it with:
   DPLL_A_PIN_PANEL_LABEL (string)
   DPLL_A_PIN_XXX (string)
   where XXX is a label type, like for example:
     DPLL_A_PIN_BOARD_LABEL
     DPLL_A_PIN_BOARD_TRACE
     DPLL_A_PIN_PACKAGE_PIN

5) Make sure you expose following attributes for every device and
   pin GET/DUMP command reply message:
   DPLL_A_MODULE_NAME
   DPLL_A_CLOCK_ID

6) Remove attributes:
   DPLL_A_DEV_NAME
   DPLL_A_BUS_NAME
   as they no longer have any value and do no make sense (even in RFCv7)


--------------------------------------------------------------
** Lookup commands **

Basically these would allow user to query DEVICE_ID and PIN_ID
according to provided atributes (see examples below).

These would be from my perspective optional for this patchsets.
I believe we can do it as follow-up if needed. For example for mlx5
I don't have usecase for it, since I can consistently get PIN_ID
using RT netlink for given netdev. But I can imagine that for non-SyncE
dpll driver this would make sense to have.

1) Introduce CMD_GET_ID - query the kernel for a dpll device
                          specified by given attrs
   Example:
   -> DPLL_A_MODULE_NAME
      DPLL_A_CLOCK_ID
      DPLL_A_TYPE
   <- DPLL_A_ID
   Example:
   -> DPLL_A_MODULE_NAME
      DPLL_A_CLOCK_ID
   <- DPLL_A_ID
   Example:
   -> DPLL_A_MODULE_NAME
   <- -EINVAL (Extack: "multiple devices matched")

   If user passes a subset of attrs which would not result in
   a single match, kernel returns -EINVAL and proper extack message.

2) Introduce CMD_GET_PIN_ID - query the kernel for a dpll pin
                              specified by given attrs
   Example:
   -> DPLL_A_MODULE_NAME
      DPLL_A_CLOCK_ID
      DPLL_A_PIN_TYPE
      DPLL_A_PIN_PANEL_LABEL
   <- DPLL_A_PIN_ID
   Example:
   -> DPLL_A_MODULE_NAME
      DPLL_A_CLOCK_ID
   <- DPLL_A_PIN_ID    (There was only one pin for given module/clock_id)
   Example:
   -> DPLL_A_MODULE_NAME
      DPLL_A_CLOCK_ID
   <- -EINVAL (Extack: "multiple pins matched")

   If user passes a subset of attrs which would not result in
   a single match, kernel returns -EINVAL and proper extack message.
