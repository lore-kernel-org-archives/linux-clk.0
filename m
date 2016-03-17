Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:40585 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1031021AbcCQRTw (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Thu, 17 Mar 2016 13:19:52 -0400
Date: Thu, 17 Mar 2016 12:19:47 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 10/18] dt-bindings: Add PLX Technology OXNAS Standard
 Clocks bindings
Message-ID: <20160317171947.GA3294@rob-hp-laptop>
References: <1457005210-18485-1-git-send-email-narmstrong@baylibre.com>
 <1457519060-6038-1-git-send-email-narmstrong@baylibre.com>
 <1457519060-6038-11-git-send-email-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1457519060-6038-11-git-send-email-narmstrong@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, Mar 09, 2016 at 11:24:12AM +0100, Neil Armstrong wrote:
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../devicetree/bindings/clock/plxtech,stdclk.txt   | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/plxtech,stdclk.txt

Acked-by: Rob Herring <robh@kernel.org>
