Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:54556 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbeHEKlT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 5 Aug 2018 06:41:19 -0400
Date: Sun, 5 Aug 2018 01:37:22 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Songjun Wu <songjun.wu@linux.intel.com>
Cc: hua.ma@linux.intel.com, yixin.zhu@linux.intel.com,
        chuanhua.lei@linux.intel.com, qi-ming.wu@intel.com,
        linux-mips@linux-mips.org, linux-clk@vger.kernel.org,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, Jiri Slaby <jslaby@suse.com>
Subject: Re: [PATCH v2 15/18] serial: intel: Support more platform
Message-ID: <20180805083722.GA30000@infradead.org>
References: <20180803030237.3366-1-songjun.wu@linux.intel.com>
 <20180803030237.3366-16-songjun.wu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180803030237.3366-16-songjun.wu@linux.intel.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The subject line also seems odd, your are changing deps on the lantiq
driver, not some (nonexistent) intel serial driver.
