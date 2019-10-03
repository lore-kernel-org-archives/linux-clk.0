Return-Path: <SRS0=L6e3=X4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93225C10F14
	for <linux-clk@archiver.kernel.org>; Thu,  3 Oct 2019 20:58:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5A222215EA
	for <linux-clk@archiver.kernel.org>; Thu,  3 Oct 2019 20:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570136301;
	bh=VXtfhm4MCyTB8FL0mbnkMg/+WmSjmrsIjCL8sHMGddY=;
	h=In-Reply-To:References:From:To:Cc:Subject:Date:List-ID:From;
	b=ivxbNCQcp7pbe1fvw6WqaO1XOSJMByfOLLoIVhZaFKptU77ao0xaDMWalhUevJbUk
	 kHpyOrF1SV+yfSxm97i7B9T+47a8fFPgKUa8tY6HSn2SDPIAZafEQM9GxMk1A/cp1M
	 MTGW89Yeki0pEUsRPQ0FKQsGiaXTELpj2Ji0vKXw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727326AbfJCU6V (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Oct 2019 16:58:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:44862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728503AbfJCU6U (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 3 Oct 2019 16:58:20 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 840732086A;
        Thu,  3 Oct 2019 20:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570136299;
        bh=VXtfhm4MCyTB8FL0mbnkMg/+WmSjmrsIjCL8sHMGddY=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=tDmKe2mpKqmNknrs6D684WpOXmqFWxub0qx7yKALwUDEi9u7sV09hY8nrlSAeutof
         gK4qPiWfRmNuJu4IwpwufhESvRyya7xeZN/HzX2kfJZrjnFU9ZNFJOU7fwKEHvRhQz
         AtrPNRAZW7jt1OOQWtOm39FqevLvIAQdauJfl6Q4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190925112347.14141-1-ben.dooks@codethink.co.uk>
References: <20190925112347.14141-1-ben.dooks@codethink.co.uk>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Ben Dooks <ben.dooks@codethink.co.uk>, linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH 1/2] clk: hisilicon: fix sparse warnings in clk-hi3670.c
User-Agent: alot/0.8.1
Date:   Thu, 03 Oct 2019 13:58:18 -0700
Message-Id: <20191003205819.840732086A@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Ben Dooks (2019-09-25 04:23:46)
> Fix the following warnings from sparse by removing the 0 initialiser
> that is actually a pointer.
>=20
> drivers/clk/hisilicon/clk-hi3670.c:298:64: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:300:64: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:302:64: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:304:64: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:306:63: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:308:63: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:310:63: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:312:63: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:314:64: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:316:64: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:318:64: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:320:64: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:322:63: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:324:64: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:326:64: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:328:63: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:330:64: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:332:63: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:334:63: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:336:64: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:338:64: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:340:64: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:342:64: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:344:63: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:346:64: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:348:65: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:350:64: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:352:64: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:488:69: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:490:70: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:492:70: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:494:69: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:496:70: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:498:69: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:500:69: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:502:70: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:504:69: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:506:69: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:508:69: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:510:70: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:512:69: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:514:70: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:516:69: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:518:70: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:520:69: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:522:69: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:524:70: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:526:70: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:528:69: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:530:69: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:532:70: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:534:71: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:536:71: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:538:69: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:611:64: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:614:64: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:616:64: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:653:70: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:655:70: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:657:70: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:659:70: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:661:70: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:663:70: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:665:70: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:735:63: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:737:63: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:739:63: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:741:63: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:743:64: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:745:64: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:802:69: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:804:69: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:806:69: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:808:69: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:810:70: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3670.c:812:69: warning: Using plain integer a=
s NULL pointer
>=20
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---

Applied to clk-next

