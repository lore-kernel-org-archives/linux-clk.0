Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAB2EEB64D9
	for <linux-clk@archiver.kernel.org>; Wed, 12 Jul 2023 14:30:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232814AbjGLOah (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Jul 2023 10:30:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232932AbjGLOaa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Jul 2023 10:30:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68313213C
        for <linux-clk@vger.kernel.org>; Wed, 12 Jul 2023 07:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689172166;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=SmfB+i5ITyD8VcQT6H0n4jQbBtZaHz3osNrT9kioxiQ=;
        b=Bar3sXD3aLbhQtdKqgnNFIHRH0zAF53UoTAXHJXNgLXFe0qBC4gdAEwbEkTS8k8DO/dhmW
        a1aY3K6IMaVg2JvrE/RP2GTIKVYyYP2sTMZEYAYLWQFluPR9oNxHqZSraliyJyYS4FBujc
        bg4gUSMEuUdn8PDV1Zr45fwXMWhU4sg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-EbmGOEriPKSXs9Ntum-HrA-1; Wed, 12 Jul 2023 10:29:24 -0400
X-MC-Unique: EbmGOEriPKSXs9Ntum-HrA-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-315af0252c2so358680f8f.0
        for <linux-clk@vger.kernel.org>; Wed, 12 Jul 2023 07:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689172163; x=1691764163;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SmfB+i5ITyD8VcQT6H0n4jQbBtZaHz3osNrT9kioxiQ=;
        b=S1yL1VIJoY7q25+ImngqGlZmskCBlv2ZWm5tpDxXzmHj0jvlIoird/9c/10VjXesW5
         CSgKSDrxghqcN8vVUyKb/xgxZ2nI5Ez37d7hYSmVgLUVsNtb12L+wdvgG4sGZ1JEySjY
         7/Ew4wFfI61NfWWMyiOF1rclMhywH0AdwtgzHGzEPOSRHSbFtP86VaFqqWs2argJUBgl
         g73R4gITRxgXQd0Dpzk6sdNYy3EMBrQce+nEEeVy8tGTGOLy2ARV3GICO+kCEfwSxy5Z
         zMAAuf3RT8sPKBKLk6FdINwaoCz2h/ueKMOtInyV8Ifqah1XlG9bpncVo7gZ8avJvhM1
         xS6w==
X-Gm-Message-State: ABy/qLb3P2NxFdRzpTHaxUolu8Wllx3/P1+rLR3ThxAPxZ4ph6FtyViW
        PcEWlIFXnvf0RY+w4JE2Ecl+S3baudQACgcG8aENDqHQ8YZ7GvnZySriGJQJb90bWU99vwb309s
        Wlp4N0HFnUGZ23NTHh8LgQllNcuQog5X1hLOc
X-Received: by 2002:adf:ec8e:0:b0:314:1ebc:6e19 with SMTP id z14-20020adfec8e000000b003141ebc6e19mr17387183wrn.64.1689172163285;
        Wed, 12 Jul 2023 07:29:23 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGrLy4XTfg4SYrDedL3LjN5ZHr+LA3Ut1XmsVNXLi1zBJheiu9Ajx5OzglpHTo4/1SshVrdO+NlkBUDSAisljg=
X-Received: by 2002:adf:ec8e:0:b0:314:1ebc:6e19 with SMTP id
 z14-20020adfec8e000000b003141ebc6e19mr17387145wrn.64.1689172162850; Wed, 12
 Jul 2023 07:29:22 -0700 (PDT)
MIME-Version: 1.0
From:   Vitaly Grinberg <vgrinber@redhat.com>
Date:   Wed, 12 Jul 2023 17:29:12 +0300
Message-ID: <CACLnSDhA1io1tU0rVvuz6KYx3-c_4zEniLEs3KFUqsvLWATYWw@mail.gmail.com>
Subject: Re: [RFC PATCH v9 08/10] ice: implement dpll interface to control cgu
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
        jesse.brandeburg@intel.com, Jiri Pirko <jiri@resnulli.us>,
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
I'd like to clarify about the DPLL phase offset requirement. We can
live without it during the initial submission. The addition of phase
offset can be an increment to patch v10.
Thanks,
Vitaly

