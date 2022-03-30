Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5478C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 30 Mar 2022 07:49:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240821AbiC3HvX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Mar 2022 03:51:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230274AbiC3HvW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Mar 2022 03:51:22 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E1E5C0D
        for <linux-clk@vger.kernel.org>; Wed, 30 Mar 2022 00:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1648626577; x=1680162577;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=F7QOZcXDJHgFfdqnoR4AZONS8EHxJAoFj0YGsWZBkcw=;
  b=J3X0F5dCPRqpk9oy2ZvRmWIKwC0GtKigIYAODy2Uhw96DrF7jknEQX3j
   r1/3jyhdQE5buzmuV91GHKTqeBnCL+RYZu2grl2X9VCLYhGhMrLkztH19
   Mv+nI+SNCiV9dxZix+s5avKOLOiois6tyRRkoKr2NEVJUava3ztWMll6B
   zkB1JCQW6xrZvm+tmfOzfWfbr3OaeOTzMkRABV5dQoAON78+wPF2jIeA5
   gIxYQg9VKrdaE9xguoDriTcsUX8RMcxdzf2jLfxmcShz5GLQaDSqgoWIK
   Jnik2g3fZYo3mhXlx8U6s3wY0aQ5WN/SahjD4FurqDbeKDXlzYAzJxIgP
   g==;
X-IronPort-AV: E=Sophos;i="5.90,222,1643670000"; 
   d="scan'208";a="22978904"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 30 Mar 2022 09:49:34 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 30 Mar 2022 09:49:34 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 30 Mar 2022 09:49:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1648626574; x=1680162574;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=F7QOZcXDJHgFfdqnoR4AZONS8EHxJAoFj0YGsWZBkcw=;
  b=CC/YSE6SB8k2Mi7wNInQKNS8qxGe/TZ5KspiDVhPeW1nVXKyMYMZAueH
   aWYcQ4PmC0FA4+mypQOqNetopJ4lKYvbhw1P/GmMG2K+6qSIp0iklizcp
   FX9S8B3dmNYMeOwUg1mZakPp7mfMYAKLKibkSLfdWysSuXWo/lFw9BeL9
   hGv4lB1wg2zKZ+W+HICN1S3ofRaTY4DdLhOvQGOIEOa7CvQi0yP60sSwN
   NEy31pfD3NJ644YcJo5tbnOP40CWdnvT9CcbKyG34KVrrjvpFN2oOMNf2
   ShiOu4hpwLeTTXgaFPzBBAo+icBgZis9hbo98oCFE8WGqf8WbtBHUzN0O
   w==;
X-IronPort-AV: E=Sophos;i="5.90,222,1643670000"; 
   d="scan'208";a="22978903"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 30 Mar 2022 09:49:34 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 07A0D280065;
        Wed, 30 Mar 2022 09:49:34 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Boot lockup on imx8mp in llinux-next
Date:   Wed, 30 Mar 2022 09:49:31 +0200
Message-ID: <1911426.usQuhbGJ8B@steina-w>
Organization: TQ-Systems GmbH
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello everyone,

I noticed that my imx8mp based board (TQMa8MPxL, not yet mainline) locked up 
during boot in linux-next. I bisected it down to commit [1].
I found out that disabling 'fec' and 'eqos' (both ethernet controller) nodes 
in DT resulted in booting Kernel, alas NFS boot failed eventually obviously. 
Reverting make things working again.
I have no idea which clock is the actual culprit here and how to fix it. I 
just wanted to make you aware of this issue.

Best regards,
Alexander

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/
commit/drivers/clk/clk.c?id=7dabfa2bc4803eed83d6f22bd6f045495f40636b


