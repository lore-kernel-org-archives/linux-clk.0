Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:39586 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729025AbeHMUge (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Aug 2018 16:36:34 -0400
Date: Mon, 13 Aug 2018 11:53:17 -0600
From: Rob Herring <robh@kernel.org>
To: Songjun Wu <songjun.wu@linux.intel.com>
Cc: hua.ma@linux.intel.com, yixin.zhu@linux.intel.com,
        chuanhua.lei@linux.intel.com, qi-ming.wu@intel.com,
        linux-mips@linux-mips.org, linux-clk@vger.kernel.org,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 18/18] dt-bindings: serial: lantiq: Add optional
 properties for CCF
Message-ID: <20180813175317.GA31286@rob-hp-laptop>
References: <20180803030237.3366-1-songjun.wu@linux.intel.com>
 <20180803030237.3366-19-songjun.wu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180803030237.3366-19-songjun.wu@linux.intel.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Aug 03, 2018 at 11:02:37AM +0800, Songjun Wu wrote:
> Clocks and clock-names are updated in device tree binding.
> 
> Signed-off-by: Songjun Wu <songjun.wu@linux.intel.com>
> ---
> 
> Changes in v2: None
> 
>  Documentation/devicetree/bindings/serial/lantiq_asc.txt | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
