Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B83C7EE23
	for <linux-clk@archiver.kernel.org>; Mon, 22 May 2023 14:46:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230015AbjEVOqo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 May 2023 10:46:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbjEVOqn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 May 2023 10:46:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85B31B0
        for <linux-clk@vger.kernel.org>; Mon, 22 May 2023 07:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684766756;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ie326rlH5K/agdGsMF2lJMaz9SgyRnB9zBZLWU3/z4Q=;
        b=gu0UQ7Uduh1SlEPPMzS9m/HKuCAEQCi0nzfbE/YKDM+V9bECc3/x5D8c3sP43w5BLDbsYB
        sBJjcscQNlQTJ4YBZtlmdUrsL/wzE2KRUieYqACVJ0aDcBVviyilU311UtVfnlyMh2PMpf
        w3MU48U9HCxaWPZ9r9SxXeaS3TYXu+g=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-I0--LP2SMMSzGcY0aWY6ww-1; Mon, 22 May 2023 10:45:55 -0400
X-MC-Unique: I0--LP2SMMSzGcY0aWY6ww-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-3f6b5f643beso135091cf.0
        for <linux-clk@vger.kernel.org>; Mon, 22 May 2023 07:45:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684766754; x=1687358754;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ie326rlH5K/agdGsMF2lJMaz9SgyRnB9zBZLWU3/z4Q=;
        b=hOV7d9VT8c3iP+gDGILw6aTmphqC9F78UDZ3cn+uWdX2aRO5acO0rh8PUQkAjRD4Nz
         3lfVl03GmAbMS7p8evRB4Ok8Qdn1qJzR/vhEyGyzVwp7/fDXYbOZ9fty2WzefoqWNGVg
         tVTKmjFCGUh6m5fpHWt8LdlFMb4NKjJbjH7LPWuKCyW5+a04gLKfkcXlLdRIpsfq3liF
         i3YkucoUXDN2OfSrmoNyth9fNJEWvoh/ZvpQZdOlgt1VEpHloZYQSjB8jekHzSWXxApF
         sW/vt09ZMIj3shLA5HJifg8UF3XBik2ST/Ksh6j2QrCC3kbaWAct0wi4gl1glOCv00+T
         Wwwg==
X-Gm-Message-State: AC+VfDwEsyitXwU8pxpCBwtetPnUQZ0gG+sJBoPn8i6/iT7c6uK1alfq
        M07A6dj3QoaqPwXaIZSAEJTlmQizJyS/7g7bkNmBl3ZVgVKKtGq3ocSYpwCNOSDN1usFDYIv06B
        jlZTXnFCB303+vjrsFI5vIuv/N+ET
X-Received: by 2002:ac8:7e90:0:b0:3f6:a725:25a5 with SMTP id w16-20020ac87e90000000b003f6a72525a5mr9957480qtj.5.1684766754646;
        Mon, 22 May 2023 07:45:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6zQ3ntI2Fy9ibmT75vWMxnkcWqVuvT4EOZ8atcv8vJGIHBGJENw25Zmqq6Uz6IpcQHfuhO4g==
X-Received: by 2002:a05:6214:4003:b0:625:8684:33f3 with SMTP id kd3-20020a056214400300b00625868433f3mr3375050qvb.0.1684766733949;
        Mon, 22 May 2023 07:45:33 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-231-222.dyn.eolo.it. [146.241.231.222])
        by smtp.gmail.com with ESMTPSA id mh2-20020a056214564200b00621430707f7sm1984090qvb.83.2023.05.22.07.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 07:45:33 -0700 (PDT)
Message-ID: <6c888b44da3235c8405d890c51d77f064d84fd5f.camel@redhat.com>
Subject: Re: [RFC PATCH v7 2/8] dpll: Add DPLL framework base functions
From:   Paolo Abeni <pabeni@redhat.com>
To:     Vadim Fedorenko <vadfed@meta.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Jiri Pirko <jiri@resnulli.us>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>
Cc:     Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>,
        linux-arm-kernel@lists.infradead.org,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-clk@vger.kernel.org
Date:   Mon, 22 May 2023 16:45:29 +0200
In-Reply-To: <20230428002009.2948020-3-vadfed@meta.com>
References: <20230428002009.2948020-1-vadfed@meta.com>
         <20230428002009.2948020-3-vadfed@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 2023-04-27 at 17:20 -0700, Vadim Fedorenko wrote:
> From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
>=20
> DPLL framework is used to represent and configure DPLL devices
> in systems. Each device that has DPLL and can configure sources
> and outputs can use this framework. Netlink interface is used to
> provide configuration data and to receive notification messages
> about changes in the configuration or status of DPLL device.
> Inputs and outputs of the DPLL device are represented as special
> objects which could be dynamically added to and removed from DPLL
> device.
>=20
> Co-developed-by: Milena Olech <milena.olech@intel.com>
> Signed-off-by: Milena Olech <milena.olech@intel.com>
> Co-developed-by: Michal Michalik <michal.michalik@intel.com>
> Signed-off-by: Michal Michalik <michal.michalik@intel.com>
> Co-developed-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
> Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
> Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>

As this patch is quite big and tend to accumulate quite a few comments
- both hard to track and to address - I'm wondering if splitting it in
a few separated patches would could help?

e.g.=C2=A0

- 1 patch for dpll device struct && APIs definition
- 1 patch for pin related APIs
- 1 patch for netlink notification.

(to be considered only if the effort for the above split is not
overwhelming)

Possibly the same could apply to patch 5/8.

Cheers,

Paolo

