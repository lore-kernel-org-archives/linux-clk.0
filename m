Return-Path: <SRS0=uxtc=SM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D323C10F11
	for <linux-clk@archiver.kernel.org>; Wed, 10 Apr 2019 21:38:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4B0F120830
	for <linux-clk@archiver.kernel.org>; Wed, 10 Apr 2019 21:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1554932334;
	bh=KNZ+V4guxDz7I1m/+uxfndhn0q9ZHeSFprO5a6KTJ5Q=;
	h=In-Reply-To:References:From:Subject:Cc:To:Date:List-ID:From;
	b=PlnebKT/I5XXWUv9TFZCkCPh4FabtZUZzkHO/k3uW8KNcmnnTBGPU0/aAaOpzgR+9
	 JD7cFaGdnjah3fvM46rEvDWK3RLQ7OXRxSehOy3VquOefQ6MLaH7Hc3YMLCHuIEKXc
	 O+Ld0D3jUZWjqaMOAKroNqBzYywuO6zyUE/EedIg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbfDJVix (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Apr 2019 17:38:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:53532 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725982AbfDJVix (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 10 Apr 2019 17:38:53 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1470A2082E;
        Wed, 10 Apr 2019 21:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1554932333;
        bh=KNZ+V4guxDz7I1m/+uxfndhn0q9ZHeSFprO5a6KTJ5Q=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=SUMeLv8YZsX3lz69SsoAnO2d0EmU/086N8mWy23bhDxF3asMYUjlxjxcaqieWYNv6
         XZj+QLaveYyL1+JR45Daco5i0pmCrWp0RzRSb1EwVtNO8PJFBBdm0goL7G19ffnN63
         ZpwsRD0L0zLl9lomYNaEqIiiubkirXcvkLYRM7v4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1553947338-12470-1-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1553947338-12470-1-git-send-email-shubhrajyoti.datta@xilinx.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [LINUX PATCHv5] clk: clk-fixed-factor: Return EPROBE_DEFER to wait for dependent drivers
Cc:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-clk@vger.kernel.org
Message-ID: <155493233223.20095.12130810844931176424@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Wed, 10 Apr 2019 14:38:52 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shubhrajyoti Datta (2019-03-30 05:02:18)
> In case the provider clock is not yet probed the fixed factor does not
> find the name of the parent clock. This is because the parent clock is
> not yet probed and in case of zynqmp the output-names is omitted.
>=20
> This is a temporary solution however the critical components
> like firmware probe should happen early.
> Fixes a probe failure.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---

I'd prefer we move this to use the clk parent rewrite series I sent the
other day. That way the parents can be fetched when the clk is
registered or found later when the parent is registered. Can you try out
that series?

	https://lkml.kernel.org/r/20190404215344.6330-1-sboyd@kernel.org

