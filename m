Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-yw0-f193.google.com ([209.85.161.193]:34928 "EHLO
        mail-yw0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753069AbdGJDue (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 9 Jul 2017 23:50:34 -0400
Date: Sun, 9 Jul 2017 22:50:31 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: jbrunet@baylibre.com, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: clock: amlogic,gxbb-aoclkc: Update
 bindings
Message-ID: <20170710035031.rdbi64ookkbq6zeo@rob-hp-laptop>
References: <1499336663-23875-1-git-send-email-narmstrong@baylibre.com>
 <1499336663-23875-4-git-send-email-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1499336663-23875-4-git-send-email-narmstrong@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jul 06, 2017 at 12:24:23PM +0200, Neil Armstrong wrote:
> On the first revision of the bindings, only the gates + resets were known
> in the AO Clock HW, but more registers used to configures AO clock are known
> to be spread among the AO register space.
> This patch adds these registers to the Ao Clock bindings with direct access
> and shared extcon access.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt         | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)

This looks like the binding might be too specific with a reg list of 
single registers, and you should define a system controller node 
instead. Depends on what else is in the "A0" block.

Acked-by: Rob Herring <robh@kernel.org>
