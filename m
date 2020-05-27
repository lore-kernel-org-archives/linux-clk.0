Return-Path: <SRS0=u/0O=7J=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF20CC433DF
	for <linux-clk@archiver.kernel.org>; Wed, 27 May 2020 06:41:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9EB5A2078C
	for <linux-clk@archiver.kernel.org>; Wed, 27 May 2020 06:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590561708;
	bh=QpNYKFKx7ckcBkR6naSh/oUlIx0fcoSuSSzXtHe3yvo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=xR8+yF0t+pXmPv08b+5chTvhTSi6SfXFeHOTnuykkLt93pVGCwczKF+tKbxCBr3/J
	 LxoGVxz7GWH/uAHHDl4EsxilokixCfrfledlucT+WQibSnPQxZKJ4JaHCFRfHvz9Ay
	 YwXthOQFLbIXKTKmfgYqINEbN/N4oal0wjfVSuj4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725613AbgE0Glr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 27 May 2020 02:41:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:58422 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728772AbgE0Glp (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 27 May 2020 02:41:45 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7BB2020787;
        Wed, 27 May 2020 06:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590561705;
        bh=QpNYKFKx7ckcBkR6naSh/oUlIx0fcoSuSSzXtHe3yvo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=DiBqHaTqSemyKGkQmHZfWPJYbL+CYpoeMGV7hEF6Y5qY2lOxIYDTkZlBWibYzF2VK
         JZrH0H94r4oWRoWA8uhuYf3VxeAMVAHfhZVJ4Km/5XIHMWm4FWVLSyeupIs5B/+1qi
         NP4b5iMw1Dwpb0JXMKwAFGF+G5ShjJxmet07svy0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200527053638.31439-4-zhang.lyra@gmail.com>
References: <20200527053638.31439-1-zhang.lyra@gmail.com> <20200527053638.31439-4-zhang.lyra@gmail.com>
Subject: Re: [RESEND PATCH v2 3/4] clk: sprd: add dt-bindings include for mipi_csi_xx clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
To:     Chunyan Zhang <zhang.lyra@gmail.com>
Date:   Tue, 26 May 2020 23:41:44 -0700
Message-ID: <159056170466.88029.14133993234242460459@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Chunyan Zhang (2020-05-26 22:36:37)
> From: Chunyan Zhang <chunyan.zhang@unisoc.com>
>=20
> mipi_csi_xx clocks are used by camera sensors.
>=20
> Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next
