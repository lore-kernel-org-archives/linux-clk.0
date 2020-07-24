Return-Path: <SRS0=WVnq=BD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1511EC433EB
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jul 2020 09:21:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7FB42074F
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jul 2020 09:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595582490;
	bh=HwubbuR/t+hJ6vkxOThG7uKVOrXEZxRjWVjQSsjJerk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=T3gj7l2vux5rj/YZsIOK4UJDoeRRlHVmkpI2pkAabnaCnn9MPVhzq0vnKqgST1IdQ
	 VLtZempBQ/ZQMgutmGAeeF2aiiUgqGffHIQNbBE8a/t6IMsUxRGSLoK9InJW56Bdx+
	 oDWJcJs1R0n1rkQ9bI4F2MmazxMts/EuBXrseXcY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728157AbgGXJVa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 Jul 2020 05:21:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:51714 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726591AbgGXJVa (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 24 Jul 2020 05:21:30 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 118822063A;
        Fri, 24 Jul 2020 09:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595582490;
        bh=HwubbuR/t+hJ6vkxOThG7uKVOrXEZxRjWVjQSsjJerk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=zohXG6dg4xiFwUg5K1oeHrpMp9KzEUz2UkP20yI2zYf6DP67dluQmGsnJajRve7U6
         GkYLMKMI7er9nUqhVK4CqsRaPlOj+aeB2Rp9h/D/ZIWpwKI+HlEh+c0L/jvoXksTVw
         ln0J773+gRMZW2CVRK2v7fB/kYLJYZ17Xa5k4ocE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1595403506-8209-10-git-send-email-claudiu.beznea@microchip.com>
References: <1595403506-8209-1-git-send-email-claudiu.beznea@microchip.com> <1595403506-8209-10-git-send-email-claudiu.beznea@microchip.com>
Subject: Re: [PATCH v2 09/18] clk: at91: replace conditional operator with double logical not
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bbrezillon@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Claudiu Beznea <claudiu.beznea@microchip.com>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>,
        alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
        mturquette@baylibre.com, nicolas.ferre@microchip.com
Date:   Fri, 24 Jul 2020 02:21:29 -0700
Message-ID: <159558248945.3847286.10073404787480803203@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Claudiu Beznea (2020-07-22 00:38:17)
> Replace conditional operator with double logical not as code
> may be simpler to read.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---

Applied to clk-next
