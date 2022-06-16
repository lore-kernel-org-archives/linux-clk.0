Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53C49CCA47A
	for <linux-clk@archiver.kernel.org>; Thu, 16 Jun 2022 11:52:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbiFPLwr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Jun 2022 07:52:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376388AbiFPLwr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Jun 2022 07:52:47 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F2F9DE83
        for <linux-clk@vger.kernel.org>; Thu, 16 Jun 2022 04:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1655380363; x=1686916363;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=vk7Af8JwsrfACg/0fCg/GedJCunirCOg2VKS3d1gDLI=;
  b=EOjVCmUwHjXuOKkLGLacyVmf4qcQJW/ZGQ6sz+T9FxynSdN1nfWDlJg4
   KxNT5HqDuFaaKpQ3yIiL+p6xM9ZSXHu3jDFaCwMXAESclwSUpBwNphfoS
   B+jdkJvijWjbVpZyTGkdMz9C6aUp6GZ5p7p2+CmCVX8xzdW1VNgfC1izP
   JbEpCqT2wWku/CRhnAgyEhPQYrOdrUZGBKvUdwxSgAJ7nuWXprptsYYFz
   4PRTg/5Hne63cVu0Jz2v3AJVNuoFWyKXn8/QyMv2zxgKoPKl9UuZcWZFK
   wmSdqmsv5t9fpsQrWK8GpmVX+bqoe4lNJK/MVw3eHLxX1n4pOEOjQphB+
   A==;
X-IronPort-AV: E=Sophos;i="5.91,305,1647298800"; 
   d="scan'208";a="24495252"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 Jun 2022 13:52:41 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 16 Jun 2022 13:52:41 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 16 Jun 2022 13:52:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1655380361; x=1686916361;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=vk7Af8JwsrfACg/0fCg/GedJCunirCOg2VKS3d1gDLI=;
  b=Itpau83LTSdpVfkrBD6ETqMTBKOmX8nK/OYpmbUoZT1OGX+bVOgWoH9V
   S7btTRnRH5fZdo1khqpQp2aJTteKwdeqQ91mUtB/Y425A71+x2ea0SFC8
   RwDN37+g52fYADvcONEwskumf5Opa4C5sn0qEDudxjBK79Ispy7DbTPUj
   uLW7P5qraEF7AXtS8AnjmVFgWTA7Xxck3nPqG95ocg/GypON5Fcw07uNl
   GW/lrAFqq/2ITs8cmZ2Gvv5HwIShKBL/wt0iUWEzln1nO7O00fg711neP
   ePeV/8Grejfk/t01pVdjuP7TSPtNOmVlBEcX4QX/vpcaNPEeTAnRVsp1M
   g==;
X-IronPort-AV: E=Sophos;i="5.91,305,1647298800"; 
   d="scan'208";a="24495251"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Jun 2022 13:52:41 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 91EE6280056;
        Thu, 16 Jun 2022 13:52:41 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
Subject: Re: (EXT) Re: clock consumer for output clocks?
Date:   Thu, 16 Jun 2022 13:52:41 +0200
Message-ID: <7958678.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220616025252.36F7CC3411E@smtp.kernel.org>
References: <3677796.MHq7AAxBmi@steina-w> <20220616025252.36F7CC3411E@smtp.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Stephen,

Am Donnerstag, 16. Juni 2022, 04:52:50 CEST schrieb Stephen Boyd:
> Quoting Alexander Stein (2022-06-01 07:15:54)
> 
> > Hi,
> > 
> > I want to use an output clock, which provides some internal clock on an
> > putput pad, such as IMX8MP_CLK_CLKOUT1 or IMX6QDL_CLK_CKO.
> > To prepare and enable a clock I need a consumer, but in my case there is
> > no
> > (local) consumer. Is there some way, DT node or some kind of driver/uapi,
> > which I can use to enable the clock?
> 
> I think you want to use an "always-on-clocks" property in DT for your
> device. See the proposal[1].
> 
> [1] https://lore.kernel.org/linux-clk/20220517235919.200375-1-marex@denx.de

Nice, this looks interesting. Thanks for the link.

Best regards,
Alexander



