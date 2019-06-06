Return-Path: <SRS0=srpp=UF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD3F8C04AB5
	for <linux-clk@archiver.kernel.org>; Thu,  6 Jun 2019 22:56:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7848A208C0
	for <linux-clk@archiver.kernel.org>; Thu,  6 Jun 2019 22:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559861793;
	bh=E9bmdThWnZM5wjGabhY6OrvCZOTpZUpOafsqSHjs9Ys=;
	h=In-Reply-To:References:To:From:Subject:Cc:Date:List-ID:From;
	b=Hv/nQsWNz9Yg5bp6QRrTqF71AVVJnFjWWA06GZb/PMJgaP7bn4x48KHvGUCPMv+W+
	 ciGZxB7FIVe5GQDDo1tUQQUU3uhFOJ3qJ0WDhwubJgySW7PWYjaE6Cu3Uibb+vXauG
	 MLrKby5tf+JU7MGJw2dKZh1DjBPUrAb5a+dF0Yis=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbfFFW4d (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 6 Jun 2019 18:56:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:44722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726352AbfFFW4d (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 6 Jun 2019 18:56:33 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 45EE32089E;
        Thu,  6 Jun 2019 22:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559861792;
        bh=E9bmdThWnZM5wjGabhY6OrvCZOTpZUpOafsqSHjs9Ys=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=1hvEr86WkE0f1Yq9Z/8HZ5ecFcIGHEmS55k3uZCRfL3j2BEhI0D4/CGyT3wZbBOJT
         p05+xotlO1lU8rbyQ98+T942EtW2xoEx0Ad5JE+oNxT5oI+BQxNfw5NFkC7FWk/zBV
         4kVXW0eXIMypcY8YrNOajUZEngWqu7TCRRnESJs4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190502121843.14493-1-fparent@baylibre.com>
References: <20190502121843.14493-1-fparent@baylibre.com>
To:     Fabien Parent <fparent@baylibre.com>, mark.rutland@arm.com,
        matthias.bgg@gmail.com, mturquette@baylibre.com,
        robh+dt@kernel.org, ryder.lee@mediatek.com, sean.wang@mediatek.com,
        wenzhen.yu@mediatek.com
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: mediatek: audsys: add support for MT8516
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Fabien Parent <fparent@baylibre.com>
User-Agent: alot/0.8.1
Date:   Thu, 06 Jun 2019 15:56:31 -0700
Message-Id: <20190606225632.45EE32089E@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Fabien Parent (2019-05-02 05:18:42)
> Add AUDSYS device tree bindings documentation for MediaTek MT8516 SoC.
>=20
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---

Applied to clk-next

