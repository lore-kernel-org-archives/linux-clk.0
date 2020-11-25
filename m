Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 734F2C2D0E4
	for <linux-clk@archiver.kernel.org>; Wed, 25 Nov 2020 02:20:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 111582145D
	for <linux-clk@archiver.kernel.org>; Wed, 25 Nov 2020 02:20:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="f3vWr2K6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgKYCUS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 24 Nov 2020 21:20:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:38844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726505AbgKYCUS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 24 Nov 2020 21:20:18 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 863CE20DD4;
        Wed, 25 Nov 2020 02:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606270817;
        bh=lNpr8sGlFbu4/YJ1ljkOaQSkWXG8y+4BsYBBDa8L9vY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=f3vWr2K6gA3pyftCzxaxng6/IYTlO8s5BIgbuJu/O3qhazqCaV3W8uIM9lrLGBXwD
         VztqVdN88TRUH9UFQmwfbuT+07COKGhgYiaOTc9+g8WEn55iJoLqN7PjV5OO57iQa6
         wF6FET815/sfA5lgTgplquZuEoGhtc1nVKzaUZhA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201116141906.11758-3-zhouyanjie@wanyeetech.com>
References: <20201116141906.11758-1-zhouyanjie@wanyeetech.com> <20201116141906.11758-3-zhouyanjie@wanyeetech.com>
Subject: Re: [PATCH v9 2/3] dt-bindings: USB: Add bindings for Ingenic JZ4775 and X2000.
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com, paul@crapouillou.net
To:     balbi@kernel.org, gregkh@linuxfoundation.org, kishon@ti.com,
        mturquette@baylibre.com, robh+dt@kernel.org, vkoul@kernel.org,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>
Date:   Tue, 24 Nov 2020 18:20:16 -0800
Message-ID: <160627081611.2717324.5799688341377220492@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

> Move Ingenic USB PHY bindings from Documentation/devicetree/bindings/usb
> to Documentation/devicetree/bindings/phy, and add bindings for JZ4775 SoC
> and X2000 SoC.
>=20

Acked-by: Stephen Boyd <sboyd@kernel.org>
