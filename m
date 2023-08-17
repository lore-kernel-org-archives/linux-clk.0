Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3FDAC678DD
	for <linux-clk@archiver.kernel.org>; Thu, 17 Aug 2023 23:37:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356105AbjHQXgw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Aug 2023 19:36:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356185AbjHQXgo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Aug 2023 19:36:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6DEF30D6
        for <linux-clk@vger.kernel.org>; Thu, 17 Aug 2023 16:36:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3B7B161EDC
        for <linux-clk@vger.kernel.org>; Thu, 17 Aug 2023 23:36:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27221C433C9;
        Thu, 17 Aug 2023 23:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692315402;
        bh=RhegQx5uRaKcu1E0Rcckw5IZtC6q56UwuK3vF+HLjhU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=oFbxa95Hfo/FdXazIXS1L4w163X1hkyZix7WC7BswVsZltRRJV70Ia5RhDke9RQmW
         v5hMxYFTDPzxcMcC/GvJ3Y6U135ShOZAwlJqQ/LudBbm5whE1X7PpULwONQt8x2GYD
         Az+eOYwcn5MjbP3m/psJ++7Fvg/c/ryL/n91X1rY5W4YzM4jMBtKNSJRV0qKYPc7Wy
         ujm/9LHTqEDTlOq6wzgAehvprfFveA++VHaLyRvgActcHbER5qLtY2rU+RAJeFjmph
         q9Vg1g8N/HCHlJIdko6OagOrS2NcV5TemgTsF+CEdKLCl4DtaFR6661uo6FA/+8WN/
         WpXlldD11n9DQ==
Date:   Thu, 17 Aug 2023 16:36:40 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>
Cc:     Vadim Fedorenko <vadim.fedorenko@linux.dev>,
        Jiri Pirko <jiri@resnulli.us>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        "Olech, Milena" <milena.olech@intel.com>,
        "Michalik, Michal" <michal.michalik@intel.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>, poros <poros@redhat.com>,
        mschmidt <mschmidt@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Bart Van Assche <bvanassche@acm.org>,
        "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
        Jiri Pirko <jiri@nvidia.com>
Subject: Re: [PATCH net-next v4 2/9] dpll: spec: Add Netlink spec in YAML
Message-ID: <20230817163640.2ad33a4b@kernel.org>
In-Reply-To: <DM6PR11MB4657AD95547A14234941F9399B1AA@DM6PR11MB4657.namprd11.prod.outlook.com>
References: <20230811200340.577359-1-vadim.fedorenko@linux.dev>
        <20230811200340.577359-3-vadim.fedorenko@linux.dev>
        <20230814194336.55642f34@kernel.org>
        <DM6PR11MB4657AD95547A14234941F9399B1AA@DM6PR11MB4657.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 17 Aug 2023 18:40:00 +0000 Kubalewski, Arkadiusz wrote:
> >Why are all attributes in a single attr space? :(
> >More than half of them are prefixed with a pin- does it really
> >not scream to you that they belong to a different space?
> 
> I agree, but there is an issue with this, currently:
> 
> name: pin-parent-device
> subset-of: dpll
> attributes:
>   -
>     name: id
>     type: u32
>   -
>     name: pin-direction
>     type: u32
>   -
>     name: pin-prio
>     type: u32
>   -
>     name: pin-state
>     type: u32
> 
> Where "id" is a part of device space, rest attrs would be a pin space..
> Shall we have another argument for device id in a pin space?

Why would pin and device not have separate spaces?

When referring to a pin from a "device mostly" command you can
usually wrap the pin attributes in a nest, and vice versa.
But it may not be needed at all here? Let's look at the commands:

+    -
+      name: device-id-get
+        request:
+          attributes:
+            - module-name
+            - clock-id
+            - type
+        reply:
+          attributes:
+            - id

All attributes are in "device" space, no mixing.

+      name: device-get
+        request:
+          attributes:
+            - id
+        reply: &dev-attrs
+          attributes:
+            - id
+            - module-name
+            - mode
+            - mode-supported
+            - lock-status
+            - temp
+            - clock-id
+            - type

Again, no pin attributes, so pin can be separate?

+    -
+      name: device-set
+        request:
+          attributes:
+            - id

Herm, this one looks like it's missing attrs :S

+    -
+      name: pin-id-get
+        request:
+          attributes:
+            - module-name
+            - clock-id
+            - pin-board-label
+            - pin-panel-label
+            - pin-package-label
+            - pin-type
+        reply:
+          attributes:
+            - pin-id

Mostly pin stuff. I guess the module-name and clock-id attrs can be
copy/pasted between device and pin, or put them in a separate set
and add that set as an attr here. Copy paste is likely much simpler.

+    -
+      name: pin-get
+        request:
+          attributes:
+            - pin-id
+        reply: &pin-attrs
+          attributes:
+            - pin-id
+            - pin-board-label
+            - pin-panel-label
+            - pin-package-label
+            - pin-type
+            - pin-frequency
+            - pin-frequency-supported
+            - pin-dpll-caps
+            - pin-parent-device
+            - pin-parent-pin

All pin.

+    -
+      name: pin-set
+        request:
+          attributes:
+            - pin-id
+            - pin-frequency
+            - pin-direction
+            - pin-prio
+            - pin-state
+            - pin-parent-device
+            - pin-parent-pin

And all pin.
