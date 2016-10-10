Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:33914 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752145AbcJJM7E (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Oct 2016 08:59:04 -0400
Date: Mon, 10 Oct 2016 07:59:02 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: sboyd@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-oxnas@lists.tuxfamily.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 6/6] dt-bindings: clk: oxnas,stdclk: Add OX820 bindings
Message-ID: <20161010125902.GA30591@rob-hp-laptop>
References: <20161005150752.22618-1-narmstrong@baylibre.com>
 <20161005150752.22618-7-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20161005150752.22618-7-narmstrong@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, Oct 05, 2016 at 05:07:52PM +0200, Neil Armstrong wrote:
> Add OX820 bindings and remove clock indices from bindings since they are present
> in the dt-bindings headers files.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../devicetree/bindings/clock/oxnas,stdclk.txt        | 19 ++++++-------------
>  1 file changed, 6 insertions(+), 13 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
