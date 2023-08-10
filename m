Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D16C001DB
	for <linux-clk@archiver.kernel.org>; Thu, 10 Aug 2023 06:45:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231833AbjHJGpc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 10 Aug 2023 02:45:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbjHJGpc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 10 Aug 2023 02:45:32 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E928F2
        for <linux-clk@vger.kernel.org>; Wed,  9 Aug 2023 23:45:31 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3178dd771ceso578212f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 09 Aug 2023 23:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1691649930; x=1692254730;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W4ffl1XH7KIn+SiaL6sUHT2H7UHV5v1krkqjETa0n6A=;
        b=DDldgCJW7Dq2a+hTMqDydw8C3st3SKwTwiqzsxjJPrc3F2RqjST2+aBrsgFow/Ecu4
         tlKbUhPybA89feLYcoUS1F9cXFxRHxDtcK0OebvThMtEYUuM/TQhZu19oUwdZLRpu8sg
         wZbgAFehdUp+N8899eV1nkf7vs6kPSZF4ibaWVaI3IqWnq3jEZdQl3/vjEQjStW9iDX3
         hBar7reO22GFSQlDwp8tAlEROVglqHuZyUhBEi6X1VZAXi+pYW2jDGGBK4XXWc6joaWN
         sxuW0EwIfgDDHEo5eyGq3Cti9t/W4ksHHctTFpahH/mNqbdsqRPMiaGSqBmUY5x5iev9
         DHiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691649930; x=1692254730;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4ffl1XH7KIn+SiaL6sUHT2H7UHV5v1krkqjETa0n6A=;
        b=JCLUhSvRFKsoMtol13TZ9vx0pBkgySbRH95/RL9uTBS3Z++HGTLmZz0Hd1Fxd8exMm
         0RAXBFctWOIaL8n5dwg4x1kcpzsfBG0iQApqplCQOos1JNxdLtxB/zJD59c2lDHQAtWR
         yL/LIJ/VIxrb/oc9jlvDE6J9kP+Y7Ad8PHEdK80HKXZJCu5BZcKA6bYihwK5sO0sFwyV
         F69qIQG1rnHASlROdQC/ilPGw0/x3mEt/quhK7XEU9XN7sFMr4VYnAeJRBdowHTwoCdy
         SiSQI3YehpQCagxK2RVJ9iZBBFv7KjcZ6hP40yxvqmzM16klKGpMBZ3KgWL9IHqjLmaQ
         dElQ==
X-Gm-Message-State: AOJu0Yw8mnLGcgHmsGtFEdBObU118tWR7zgqtfI6RJd+c1iepDMypzf9
        JHoGsz8+W9Cf0XzD5jcYa0/SzQ==
X-Google-Smtp-Source: AGHT+IGFvrLjbuJB4FD5M6F0v2JfDH28y3XkYhjdjaautLE8uNRvGJeA5rtj65lI/y4KtK3nZqgikA==
X-Received: by 2002:adf:da45:0:b0:316:f3cf:6f12 with SMTP id r5-20020adfda45000000b00316f3cf6f12mr1233331wrl.48.1691649929884;
        Wed, 09 Aug 2023 23:45:29 -0700 (PDT)
Received: from localhost ([212.23.236.67])
        by smtp.gmail.com with ESMTPSA id x13-20020a5d444d000000b00317f29ad113sm1060251wrr.32.2023.08.09.23.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 23:45:29 -0700 (PDT)
Date:   Thu, 10 Aug 2023 08:45:28 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>,
        linux-arm-kernel@lists.infradead.org, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-clk@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>,
        intel-wired-lan@lists.osuosl.org,
        Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH net-next v3 1/9] dpll: documentation on DPLL subsystem
 interface
Message-ID: <ZNSHiOUiTbOAFIIR@nanopsycho>
References: <20230809214027.556192-1-vadim.fedorenko@linux.dev>
 <20230809214027.556192-2-vadim.fedorenko@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809214027.556192-2-vadim.fedorenko@linux.dev>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Wed, Aug 09, 2023 at 11:40:19PM CEST, vadim.fedorenko@linux.dev wrote:
>Add documentation explaining common netlink interface to configure DPLL
>devices and monitoring events. Common way to implement DPLL device in
>a driver is also covered.
>
>Co-developed-by: Bagas Sanjaya <bagasdotme@gmail.com>
>Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
>Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
>Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>

Signed-off-by: Jiri Pirko <jiri@nvidia.com>
