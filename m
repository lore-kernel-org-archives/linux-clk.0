Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mga12.intel.com ([192.55.52.136]:62407 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726468AbeHFJ3C (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 6 Aug 2018 05:29:02 -0400
Subject: Re: [PATCH v2 15/18] serial: intel: Support more platform
To: Christoph Hellwig <hch@infradead.org>
Cc: hua.ma@linux.intel.com, yixin.zhu@linux.intel.com,
        chuanhua.lei@linux.intel.com, qi-ming.wu@intel.com,
        linux-mips@linux-mips.org, linux-clk@vger.kernel.org,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, Jiri Slaby <jslaby@suse.com>
References: <20180803030237.3366-1-songjun.wu@linux.intel.com>
 <20180803030237.3366-16-songjun.wu@linux.intel.com>
 <20180805083722.GA30000@infradead.org>
From: "Wu, Songjun" <songjun.wu@linux.intel.com>
Message-ID: <8589b777-1fa9-5c27-3a78-8c9e7af2fc01@linux.intel.com>
Date: Mon, 6 Aug 2018 15:20:04 +0800
MIME-Version: 1.0
In-Reply-To: <20180805083722.GA30000@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



On 8/5/2018 4:37 PM, Christoph Hellwig wrote:
> The subject line also seems odd, your are changing deps on the lantiq
> driver, not some (nonexistent) intel serial driver.
>
Your suggestion is reasonable, it will be changed to "serial: lantiq".
