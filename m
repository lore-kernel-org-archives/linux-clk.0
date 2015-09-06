Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-la0-f53.google.com ([209.85.215.53]:34703 "EHLO
	mail-la0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752691AbbIFRtZ (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Sun, 6 Sep 2015 13:49:25 -0400
Received: by laeb10 with SMTP id b10so40357439lae.1
        for <linux-clk@vger.kernel.org>; Sun, 06 Sep 2015 10:49:23 -0700 (PDT)
MIME-Version: 1.0
From: Manuel Lauss <manuel.lauss@gmail.com>
Date: Sun, 6 Sep 2015 19:48:43 +0200
Message-ID: <CAOLZvyFF0bzHBDQSb+2UdFk5iF0JOVgYWtpJEnGTiRP-FhuXQw@mail.gmail.com>
Subject: 4.2-rc0: cannot clk_get() clocks added with clk_add_alias()
To: linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hello,

in arch/mips/alchemy/common/clock.c, function alchemy_clk_init(), as a last step
a few aliases are added with clk_add_alias().  Now in
arch/mips/alchemy/devboards/db1300.c,
line 811, the clk_get(NULL, "aliasname") returns NULL.
This used to work in 3.19 and got broken in 4.0.
Is there anything I did miss?

Thanks!
       Manuel Lauss
