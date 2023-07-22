Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B9AEB64DD
	for <linux-clk@archiver.kernel.org>; Sat, 22 Jul 2023 02:08:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbjGVCIj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 21 Jul 2023 22:08:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbjGVCIi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Jul 2023 22:08:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7A4930D0
        for <linux-clk@vger.kernel.org>; Fri, 21 Jul 2023 19:08:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6CC2161DC5
        for <linux-clk@vger.kernel.org>; Sat, 22 Jul 2023 02:08:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B441C433C7;
        Sat, 22 Jul 2023 02:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689991715;
        bh=9NGLbvUwwVAcvCYY973O4b6WDduuentH0GBBnEGBEjk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=AlMhkIbLgYxczvUbEIs65r6z2G26WTaynmjVeFpH9To5eyI2SkBfTnuGtaA4KKdcO
         FBQLWKP+x7nLBxc4fosekBHr+8Us9J6YCsBbODXPdBaWt6RBqydCQTGDXeQGgqqgKz
         kLKuzk0DDq3KGIUJxRw8ahKvO9perKPLATJhgiMI9QIbhygni+vamJGo29+yJtoBqF
         /8/MoDlY3RgnPhfNlQl8K9nC1TQjv5lPqKrAzeTEeH88LC5wewXa97zbfBRnFnyqGB
         5EoT8+iDCq8a8uPTNOsa3zLx7d6MF64ZcOh/8hyErWqfYObChp2A13b01mKxYoGEhi
         q1PesA+s/3oNw==
Date:   Fri, 21 Jul 2023 19:08:34 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Jiri Pirko <jiri@resnulli.us>
Cc:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        "Olech, Milena" <milena.olech@intel.com>,
        "Michalik, Michal" <michal.michalik@intel.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>, poros <poros@redhat.com>,
        mschmidt <mschmidt@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH 09/11] ice: implement dpll interface to control cgu
Message-ID: <20230721190834.375dbb79@kernel.org>
In-Reply-To: <ZLo0ujuLMF2NrMog@nanopsycho>
References: <20230720091903.297066-1-vadim.fedorenko@linux.dev>
        <20230720091903.297066-10-vadim.fedorenko@linux.dev>
        <ZLk/9zwbBHgs+rlb@nanopsycho>
        <DM6PR11MB46572F438AADB5801E58227A9B3EA@DM6PR11MB4657.namprd11.prod.outlook.com>
        <ZLo0ujuLMF2NrMog@nanopsycho>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 21 Jul 2023 09:33:14 +0200 Jiri Pirko wrote:
> >d) SyncE daemon uses PIN_SET to set state of pin_id:13 to CONNECTED with
> >   parent pin (pin-id:2) =20
>=20
> For this you need pin_id and pin_parent_id because you set the state on
> a parent pin.
>=20
>=20
> Yeah, this is exactly why I initially was in favour of hiding all the
> muxes and magic around it hidden from the user. Now every userspace app
> working with this has to implement a logic of tracking pin and the mux
> parents (possibly multiple levels) and configure everything. But it just
> need a simple thing: "select this pin as a source" :/
>=20
>=20
> Jakub, isn't this sort of unnecessary HW-details complexicity exposure
> in UAPI you were against in the past? Am I missing something?

=46rom just reading what I'm quoting - I don't think so.
Muxes are meaningful because they limit valid configurations.
We can implement "automatic mutex config" in the kernel
if user wants it, centrally in the core, otherwise each
driver will have to do it on its own.
