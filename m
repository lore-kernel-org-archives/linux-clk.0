Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:38820 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754709AbeFNKHW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Jun 2018 06:07:22 -0400
MIME-Version: 1.0
In-Reply-To: <20180612054034.4969-5-songjun.wu@linux.intel.com>
References: <20180612054034.4969-1-songjun.wu@linux.intel.com> <20180612054034.4969-5-songjun.wu@linux.intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 14 Jun 2018 12:07:19 +0200
Message-ID: <CAK8P3a0K6qezHLcjkeq0zd+iQJQc_qbT2JhtZGrCNRT495sUvQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] tty: serial: lantiq: Always use readl()/writel()
To: Songjun Wu <songjun.wu@linux.intel.com>
Cc: hua.ma@linux.intel.com, yixin.zhu@linux.intel.com,
        chuanhua.lei@intel.com,
        "open list:RALINK MIPS ARCHITECTURE" <linux-mips@linux-mips.org>,
        qi-ming.wu@intel.com, linux-clk <linux-clk@vger.kernel.org>,
        linux-serial@vger.kernel.org, DTML <devicetree@vger.kernel.org>,
        James Hogan <jhogan@kernel.org>, Jiri Slaby <jslaby@suse.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ralf Baechle <ralf@linux-mips.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jun 12, 2018 at 7:40 AM, Songjun Wu <songjun.wu@linux.intel.com> wrote:
> Previous implementation uses platform-dependent functions
> ltq_w32()/ltq_r32() to access registers. Those functions are not
> available for other SoC which uses the same IP.
> Change to OS provided readl()/writel() and readb()/writeb(), so
> that different SoCs can use the same driver.
>
> Signed-off-by: Songjun Wu <songjun.wu@linux.intel.com>

Are there any big-endian machines using this driver? The original definition
of ltq_r32() uses non-byteswapping __raw_readl() etc, which suggests
that the registers might be wired up in a way that matches the CPU
endianess (this is usally a bad idea in hardware design, but nothing
we can influence in the OS).

When you change it to readl(), that will breaks all machines that rely
on the old behavior on big-endian kernels.

      Arnd
