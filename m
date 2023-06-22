Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04CC9EB64D8
	for <linux-clk@archiver.kernel.org>; Thu, 22 Jun 2023 07:55:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbjFVHzu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Jun 2023 03:55:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230243AbjFVHzt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Jun 2023 03:55:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64809185
        for <linux-clk@vger.kernel.org>; Thu, 22 Jun 2023 00:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687420507;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=Eox6kzJ0KXGmAxPu1zCtO8SWj1o8YH/kpH0QF8X1TQs=;
        b=AvjvZFGq1D7F7kUm268mcKadsIlbaY53/rkh4kIe+5SKdZhN7hAKdvXu2NWUL2Duh/3dCp
        x5PhTAYrIRGiM5SSFTg3GJC8cHwPbBQnP2gFizLH1+v5pEib3GKTt7gvXk6GOLUMTNq60T
        /UxeqN4VAShAnvCcGJTjAj0D2aq5f/M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-mGGy-gpYO_e-RpaCqbT17w-1; Thu, 22 Jun 2023 03:55:06 -0400
X-MC-Unique: mGGy-gpYO_e-RpaCqbT17w-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-31273e0507dso1843811f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 22 Jun 2023 00:55:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687420505; x=1690012505;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Eox6kzJ0KXGmAxPu1zCtO8SWj1o8YH/kpH0QF8X1TQs=;
        b=M9DrOwJV0BvVOUCgD+1mqhC/DLJSzgeZLHGJ72SOsx9vykcpVtnCuPY/+P414wH6pG
         fumBYNTZVuXfUtIN13GdLb4TLzTDfOY/Nl0MJfakMcuwlVbHBHxFE1LeMyhp3BJYzDc8
         /pu4+ceX1vaV7HJYl1ndzeD36PUVsHVnzf7ft1MN1FiGfF6vYchtF2+YRZphLrKYkIcG
         gvqYeTmU2zdtkmZet5V/GUdqgsU9tAfxUcTBkxKo+6HPh+A6SpwUU0Y8We/1+Z24UJwo
         Z0LvWyvWzM1QD8oYUIlkdnPnKPuxFbVrSsdmJSFWB1oIFLUgtJT4wY+yIl/yWBmw3t9L
         BPRA==
X-Gm-Message-State: AC+VfDy0KhV+hYkQY59Y/VEQyyU2dJU4lUNndrEQB+xFSbrKbRuZcI5B
        Sc6xzqQWjPwgBvTjMyNjmCxHdUKo0/wQQjw25onzNuRKJ6yDvP70w7mY6mllct3mp4vyQjdaDFR
        uUnAYKh9Z1z63gvo/0o5CDRnSx6l13fa7rVjC
X-Received: by 2002:a5d:590c:0:b0:30a:8995:1dbc with SMTP id v12-20020a5d590c000000b0030a89951dbcmr13481425wrd.26.1687420505048;
        Thu, 22 Jun 2023 00:55:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5XXdP5mBFYeXjHFqCUFXHfOsqZzMCP4KunAaLqWfIWum2C8ZQg8p8aPknYzd7pBcBBJ2gzkZCOOq3kQ/vNoxc=
X-Received: by 2002:a5d:590c:0:b0:30a:8995:1dbc with SMTP id
 v12-20020a5d590c000000b0030a89951dbcmr13481390wrd.26.1687420504759; Thu, 22
 Jun 2023 00:55:04 -0700 (PDT)
MIME-Version: 1.0
From:   Vitaly Grinberg <vgrinber@redhat.com>
Date:   Thu, 22 Jun 2023 10:54:54 +0300
Message-ID: <CACLnSDiBML3R_K5ncFsuritvid5nGsBLx5pGR2c9pR9L=qhPiQ@mail.gmail.com>
Subject: Re: [RFC PATCH v8 00/10] Create common DPLL configuration API
To:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>
Cc:     David Airlie <airlied@redhat.com>, andy.ren@getcruise.com,
        anthony.l.nguyen@intel.com, arnd@arndb.de, axboe@kernel.dk,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        claudiajkang@gmail.com, corbet@lwn.net, davem@davemloft.net,
        edumazet@google.com, geert+renesas@glider.be,
        gregkh@linuxfoundation.org, hkallweit1@gmail.com,
        idosch@nvidia.com, intel-wired-lan@lists.osuosl.org,
        jacek.lawrynowicz@linux.intel.com,
        Javier Martinez Canillas <javierm@redhat.com>,
        jesse.brandeburg@intel.com, jiri@resnulli.us,
        jonathan.lemon@gmail.com, kuba@kernel.org, kuniyu@amazon.com,
        leon@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
        linux@zary.sk, liuhangbin@gmail.com, lucien.xin@gmail.com,
        masahiroy@kernel.org, michal.michalik@intel.com,
        milena.olech@intel.com, Michal Schmidt <mschmidt@redhat.com>,
        Michael Tsirkin <mst@redhat.com>, netdev@vger.kernel.org,
        nicolas.dichtel@6wind.com, nipun.gupta@amd.com, ogabbay@kernel.org,
        Paolo Abeni <pabeni@redhat.com>, phil@nwl.cc,
        Petr Oros <poros@redhat.com>, razor@blackwall.org,
        ricardo.canuelo@collabora.com, richardcochran@gmail.com,
        saeedm@nvidia.com, sj@kernel.org, tzimmermann@suse.de,
        vadfed@fb.com, vadfed@meta.com, vadim.fedorenko@linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,
Could it be possible to add PPS DPLL phase offset to the netlink API?
We are relying on it in the E810-based grandmaster implementation.
Thanks,
Vitaly

