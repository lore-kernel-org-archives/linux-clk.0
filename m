Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D073AC001DC
	for <linux-clk@archiver.kernel.org>; Wed, 26 Jul 2023 15:21:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234511AbjGZPV2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 Jul 2023 11:21:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233822AbjGZPVG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Jul 2023 11:21:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68A07BF
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 08:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690384818;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TfB4MnHU7wOaq39Gfi79NM8bvabdTimuYGs0f51W0MI=;
        b=VkB5Y4HpiA/a95EdnxnygzTtsLC+5WR5I7cwgEvqsTc7OkLJKMUlphhER39mp7p9gNfpkM
        kPZgzGGJ1JsQ0VjF/augzsTgdogSba0MkHjunIFnmuZAWHnljCjJZldOGpVHgBw7cu+ks1
        TkX7zS5AyPiNNemTLvqzZYiz2XRpCJA=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-UShR-tWkMLmuk0K14vFepg-1; Wed, 26 Jul 2023 11:20:17 -0400
X-MC-Unique: UShR-tWkMLmuk0K14vFepg-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-40631b647cfso10265721cf.1
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 08:20:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690384817; x=1690989617;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TfB4MnHU7wOaq39Gfi79NM8bvabdTimuYGs0f51W0MI=;
        b=gYoxXHnEoBWc/thv4RdY9sSrq43TaVNaYP+il4FYott9XODylZG9LTznU0HW2hgOUn
         FnKybeiM6LQboeHWrm13ICLqCe28s3jWrM0iv1/r/0I/ptHkjM6wKHufA0U3A+RG/KER
         XiPtxAT87rskcCxspSeJl+CSD0ZyB55JhGwLHu8EooT8cOlkY8YLFrUq9GNwUK+tFNej
         gqVzjlS6eFlEjkoNDfMb9+56obtOlnFTeGmHrK7YssTqhGG3M0UB35yQG487qRMq4gun
         /BOVjWnOdl7Sz4dnObNp5VDnmoyYOef9bK+c1MZv+dfp+QclFVqwtAHFBllMw7a6J1bv
         c5Ng==
X-Gm-Message-State: ABy/qLY6cRo2A4iz+4De0h1jL36FugyGssoFaIo73vJH+ORMYbucT3TL
        hECs8ERC9hnFjs58/d9cZsn6AVZHIdXDUDx7XIDsNMPzQffzyrRzOSYzuoSoxqPhfiLTt8ZOE+D
        MO0HYqXCPJWoQSgFrJPan
X-Received: by 2002:a05:6214:509b:b0:63d:2d7e:39f1 with SMTP id kk27-20020a056214509b00b0063d2d7e39f1mr1618582qvb.2.1690384816923;
        Wed, 26 Jul 2023 08:20:16 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE+h7yvFNeBANsn2r2QuvZPeWcHmYPmNYg397zB+UR7jYKmOTyAoiGJaCdczG6Mv8Nk/O/Fjw==
X-Received: by 2002:a05:6214:509b:b0:63d:2d7e:39f1 with SMTP id kk27-20020a056214509b00b0063d2d7e39f1mr1618560qvb.2.1690384816586;
        Wed, 26 Jul 2023 08:20:16 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-225-81.dyn.eolo.it. [146.241.225.81])
        by smtp.gmail.com with ESMTPSA id i5-20020a0cf485000000b0063d03e59e07sm2236356qvm.130.2023.07.26.08.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 08:20:16 -0700 (PDT)
Message-ID: <a3870a365d6f43491c8c82953d613c2e69311457.camel@redhat.com>
Subject: Re: [PATCH 09/11] ice: implement dpll interface to control cgu
From:   Paolo Abeni <pabeni@redhat.com>
To:     Jakub Kicinski <kuba@kernel.org>, Jiri Pirko <jiri@resnulli.us>
Cc:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        "Olech, Milena" <milena.olech@intel.com>,
        "Michalik, Michal" <michal.michalik@intel.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>, poros <poros@redhat.com>,
        mschmidt <mschmidt@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Bart Van Assche <bvanassche@acm.org>
Date:   Wed, 26 Jul 2023 17:20:12 +0200
In-Reply-To: <20230725154958.46b44456@kernel.org>
References: <20230720091903.297066-1-vadim.fedorenko@linux.dev>
         <20230720091903.297066-10-vadim.fedorenko@linux.dev>
         <ZLk/9zwbBHgs+rlb@nanopsycho>
         <DM6PR11MB46572F438AADB5801E58227A9B3EA@DM6PR11MB4657.namprd11.prod.outlook.com>
         <ZLo0ujuLMF2NrMog@nanopsycho>
         <DM6PR11MB46576153E0E28BA4C283A30A9B3FA@DM6PR11MB4657.namprd11.prod.outlook.com>
         <ZLpzwMQrqp7mIMFF@nanopsycho> <20230725154958.46b44456@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 2023-07-25 at 15:49 -0700, Jakub Kicinski wrote:
> On Fri, 21 Jul 2023 14:02:08 +0200 Jiri Pirko wrote:
> > So it is not a mode! Mode is either "automatic" or "manual". Then we
> > have a state to indicate the state of the state machine (unlocked, lock=
ed,
> > holdover, holdover-acq). So what you seek is a way for the user to
> > expliticly set the state to "unlocked" and reset of the state machine.
>=20
> +1 for mixing the state machine and config.
> Maybe a compromise would be to rename the config mode?
> Detached? Standalone?

For the records, I don't know the H/W details to any extents, but
generally speaking it sounds reasonable to me that a mode change could
cause a state change.

e.g. switching an ethernet device autoneg mode could cause the link
state to flip.

So I'm ok with the existence of the freerun mode.

I think it should be clarified what happens if pins are manually
enabled in such mode. I expect ~nothing will change, but stating it
clearly would help.

Cheers,

Paolo

