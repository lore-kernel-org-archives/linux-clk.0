Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-qk0-f175.google.com ([209.85.220.175]:36470 "EHLO
        mail-qk0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751542AbeBYMNW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 25 Feb 2018 07:13:22 -0500
MIME-Version: 1.0
In-Reply-To: <1519483851-31135-1-git-send-email-yamada.masahiro@socionext.com>
References: <1519483851-31135-1-git-send-email-yamada.masahiro@socionext.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 25 Feb 2018 14:13:20 +0200
Message-ID: <CAHp75VdKDFnrk6i9vBZL2YnqeUH3AaxdZJ_f6ZNOUtnq1pjM3Q@mail.gmail.com>
Subject: Re: [RFC PATCH] drivers: use 'depends on MFD_SYSCON' instead of
 'select MFD_SYSCON'
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Lee Jones <lee.jones@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        USB <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Sat, Feb 24, 2018 at 4:50 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Also, make MFD_SYSCON 'default y' because some defconfig files may
> rely on someone select's MFD_SYSCON.

I'm not sure this is right thing to do. You basically imply that there
always a user of it.


-- 
With Best Regards,
Andy Shevchenko
