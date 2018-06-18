Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:61495 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755259AbeFRJj7 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 18 Jun 2018 05:39:59 -0400
Subject: Re: [PATCH 4/7] tty: serial: lantiq: Always use readl()/writel()
To: Arnd Bergmann <arnd@arndb.de>
Cc: hua.ma@linux.intel.com, yixin.zhu@linux.intel.com,
        chuanhua.lei@intel.com,
        "open list:RALINK MIPS ARCHITECTURE" <linux-mips@linux-mips.org>,
        qi-ming.wu@intel.com, linux-clk <linux-clk@vger.kernel.org>,
        linux-serial@vger.kernel.org, DTML <devicetree@vger.kernel.org>,
        James Hogan <jhogan@kernel.org>, Jiri Slaby <jslaby@suse.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ralf Baechle <ralf@linux-mips.org>
References: <20180612054034.4969-1-songjun.wu@linux.intel.com>
 <20180612054034.4969-5-songjun.wu@linux.intel.com>
 <CAK8P3a0K6qezHLcjkeq0zd+iQJQc_qbT2JhtZGrCNRT495sUvQ@mail.gmail.com>
From: "Wu, Songjun" <songjun.wu@linux.intel.com>
Message-ID: <f992c920-7e57-8099-b13c-f3651c0d1594@linux.intel.com>
Date: Mon, 18 Jun 2018 17:39:53 +0800
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0K6qezHLcjkeq0zd+iQJQc_qbT2JhtZGrCNRT495sUvQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



On 6/14/2018 6:07 PM, Arnd Bergmann wrote:
> On Tue, Jun 12, 2018 at 7:40 AM, Songjun Wu <songjun.wu@linux.intel.com> wrote:
>> Previous implementation uses platform-dependent functions
>> ltq_w32()/ltq_r32() to access registers. Those functions are not
>> available for other SoC which uses the same IP.
>> Change to OS provided readl()/writel() and readb()/writeb(), so
>> that different SoCs can use the same driver.
>>
>> Signed-off-by: Songjun Wu <songjun.wu@linux.intel.com>
> Are there any big-endian machines using this driver? The original definition
> of ltq_r32() uses non-byteswapping __raw_readl() etc, which suggests
> that the registers might be wired up in a way that matches the CPU
> endianess (this is usally a bad idea in hardware design, but nothing
> we can influence in the OS).
>
> When you change it to readl(), that will breaks all machines that rely
> on the old behavior on big-endian kernels.
>
>        Arnd
It will not break existing big-endian SoC as SWAP_IO_SPACE is disabled.

Disable SWAP_IO_SPACE will not impact ltq_r32 as it uses non-byte 
swapping __raw_readl() and it makes readl work in big-endian kernel too.

The old Lantiq platform enable SWAP_IO_SPACE to support PCI as it's a 
little-endian bus plus PCI TX/RX swap enable impacted both data and 
control path.
Alternatively PCI device driver has to do endian swap, It is better to 
let PCI device driver to do endian swap instead because SWAP_IO_SPACE is 
global wide macro.
Once we set it, other peripheral such as USB has to change its register 
access as well

