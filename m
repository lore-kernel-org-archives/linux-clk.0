Return-Path: <SRS0=Mnuj=P6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E20CC282C4
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 09:41:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6F2B7218DE
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 09:41:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="Eeoxc4iX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jueVg1SF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727813AbfAVJli (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Jan 2019 04:41:38 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:35683 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726872AbfAVJli (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Jan 2019 04:41:38 -0500
X-Greylist: delayed 500 seconds by postgrey-1.27 at vger.kernel.org; Tue, 22 Jan 2019 04:41:36 EST
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id F0F619721;
        Tue, 22 Jan 2019 04:33:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 22 Jan 2019 04:33:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=AjJ5Ycm1nachfdD3JNudGmpI855
        gZOngSiGL20J/f+E=; b=Eeoxc4iX8Ph3miO+p9h8+vd7Z3vtAciyBjQQKZp27wX
        F7XPzCKEfY1gYjccEEdkfpYxrUZBLAuWpQikQFPl0nMXk/A8PVpX8MVYr2vnsqKQ
        S7BjApsC6o9SZWbFlLy2AJwBzF3jDJjgZESzxKWMKNfiC0lHL498+FSP3LQ+QsVB
        endHhj8luptdqZuBN4iGL/1qWHkVNLzqXFvXdla52+OxuJbMsjTz+RPfYgs3/7Vk
        V7iSiS4Ly9dx20O2xQjRBkl7OvTio3Jyzw4oRIBPjFouMk6mGuwuy8As1l5mH3po
        72LVHnBC3OiDMq5jlfnH5VA6bfGQilddKOkZ1MIDJ8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=AjJ5Yc
        m1nachfdD3JNudGmpI855gZOngSiGL20J/f+E=; b=jueVg1SFPXq8v/9Tgx1zjC
        FIJYRO6LbPVMOjBJtxfocal41MQINe6JJUnaU9RhqiWCDSby7f6ME+32ZzZVoEkk
        SQmx4UqXZ/cbq7NhbM3L/F8+X6ygB5jJTPZMDSPZwox5s7MDREg+FIpu9fQz1wU7
        EvMtR3+xZZGp59jPoNs3CeIXMukthdb0ZzMtRocfrOmDVzaAL3se1tDFwHdKqCBN
        C+1PS5ffRqE1bmXIZQHonIgM40gKxvEfAQmmfxivhXnblAh+oPLeE3/Q/3p0rFcg
        /yihth4uGy9CV2LuO8j1auJ9M8giXgsTzfLI5WGg7zfPoUAglqnH3XpQGmwyf4yQ
        ==
X-ME-Sender: <xms:WuNGXJ3EkHLBx4F7tZfsBU1-E32A_JgbLUbmrzPafLD0Lr8WC2nkEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrheekgddtfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
    tdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegoufhprghmkfhpucdlfedttd
    dmnecujfgurhepfffhvffukfhfgggtuggjfgesthdtredttdervdenucfhrhhomhepifhr
    vghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuffhomhgrihhnpehkvghrnh
    gvlhdrohhrghenucfkphepkeefrdekiedrkeelrddutdejnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:WuNGXEZmuJzrhJmpdmo4DftS1GNAVY4hxdQ3k2ahWEg_L2LNpcUuww>
    <xmx:WuNGXET_YBZ94SexOC12czXtlfxYGc1JHzkthQYcKdfd0lbUTRjsWg>
    <xmx:WuNGXE1e_XaMznUwwsEOo2QH-W4O20bT5mXRouw0tyBCpfyPrbTrXg>
    <xmx:W-NGXBgkHpbk-hNkxyJMPqRotN4lf8mqHx1-lQQHqJN9wkQHcVD_dQ>
Received: from localhost (5356596b.cm-6-7b.dynamic.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 465ED100E5;
        Tue, 22 Jan 2019 04:33:14 -0500 (EST)
Date:   Tue, 22 Jan 2019 10:33:13 +0100
From:   Greg KH <greg@kroah.com>
To:     Kamil Konieczny <k.konieczny@partner.samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        stable@vger.kernel.org
Subject: Re: [PATCH v5 1/5] clk: samsung: exynos5433: fix typo in imem divider
Message-ID: <20190122093313.GA21774@kroah.com>
References: <20190122090232.29194-1-k.konieczny@partner.samsung.com>
 <CGME20190122090249eucas1p161cfc1364fb8ee76d2d04383935e8f3b@eucas1p1.samsung.com>
 <20190122090232.29194-2-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190122090232.29194-2-k.konieczny@partner.samsung.com>
User-Agent: Mutt/1.11.2 (2019-01-07)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Jan 22, 2019 at 10:02:28AM +0100, Kamil Konieczny wrote:
> Fix typo in imem clock divider 200 switched with 266.
> 
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5433.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
