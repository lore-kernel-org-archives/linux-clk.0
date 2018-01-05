Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:33029 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752125AbeAEQeC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 Jan 2018 11:34:02 -0500
Date: Fri, 5 Jan 2018 10:34:00 -0600
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Ralf Baechle <ralf@linux-mips.org>,
        Maarten ter Huurne <maarten@treewalker.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@linux-mips.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 05/15] dt-bindings: clock: Add jz4770-cgu.h header
Message-ID: <20180105163400.qg6q7znrv4s5wrfd@rob-hp-laptop>
References: <20180102150848.11314-1-paul@crapouillou.net>
 <20180102150848.11314-5-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180102150848.11314-5-paul@crapouillou.net>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jan 02, 2018 at 04:08:38PM +0100, Paul Cercueil wrote:
> This will be used from the devicetree bindings to specify the clocks
> that should be obtained from the jz4770-cgu driver.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Acked-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>  include/dt-bindings/clock/jz4770-cgu.h | 58 ++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 include/dt-bindings/clock/jz4770-cgu.h

Reviewed-by: Rob Herring <robh@kernel.org>
