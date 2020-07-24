Return-Path: <SRS0=WVnq=BD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E5EC433E0
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jul 2020 09:21:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E733520767
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jul 2020 09:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595582500;
	bh=riuqeLyNVshiSfZYDo1v2vcHN26ZUo5B8j3F1CBljWk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=bhqJhWn3XlwZDGy4UHODyuek46GFyfFjtZqk4IT9UQ8uoYfZXAXO+YKLSL3vIyEoZ
	 zBGhfpTQtA4ihimCOg4u+oOzYyi0N5zUMm6U2H+KxdDaLwRfoUNWDFnor7K600CfIY
	 GTfsVCruZ4RpkmflwlLJfUnF7B5t/uAlnPeFJAnI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726995AbgGXJVk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 Jul 2020 05:21:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:51938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726591AbgGXJVk (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 24 Jul 2020 05:21:40 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0E38820674;
        Fri, 24 Jul 2020 09:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595582500;
        bh=riuqeLyNVshiSfZYDo1v2vcHN26ZUo5B8j3F1CBljWk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=FJnZDUnu8bkp0r7/aeAu4su67AA4tqo/ELSHvy6BPu3Ddd3gL7TO6oA+6ascUZ3xv
         jE3qY3K2ASgsZOZrKgAwu7xPbY1JiBd60u74ZQwpqVtwBv6adK2dMN105Fs6ypsZ3x
         zVQGRg4Q10i/M95FMBCZL6o4oAq6i3J417Dp8Wc4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1595403506-8209-12-git-send-email-claudiu.beznea@microchip.com>
References: <1595403506-8209-1-git-send-email-claudiu.beznea@microchip.com> <1595403506-8209-12-git-send-email-claudiu.beznea@microchip.com>
Subject: Re: [PATCH v2 11/18] clk: at91: clk-generated: add mux_table option
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bbrezillon@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Claudiu Beznea <claudiu.beznea@microchip.com>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>,
        alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
        mturquette@baylibre.com, nicolas.ferre@microchip.com
Date:   Fri, 24 Jul 2020 02:21:39 -0700
Message-ID: <159558249936.3847286.2848059381976968941@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Claudiu Beznea (2020-07-22 00:38:19)
> Add mux table option. This is necessary for IP versions that has
> gaps in the range of available clock sources (e.g. SAMA7G5).
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---

Applied to clk-next
