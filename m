Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:56709 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750953AbcBJOoE (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 10 Feb 2016 09:44:04 -0500
From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Lars Persson <lars.persson@axis.com>, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, mark.rutland@arm.com,
	pawel.moll@arm.com, ijc+devicetree@hellion.org.uk,
	Lars Persson <larper@axis.com>, linux-kernel@vger.kernel.org,
	robh+dt@kernel.org, galak@codeaurora.org
Subject: Re: [PATCH 0/8] arm: Add Artpec-6 SoC
Date: Wed, 10 Feb 2016 15:43:27 +0100
Message-ID: <3600743.1EoOBI7uCq@wuerfel>
In-Reply-To: <cover.1455107681.git.larper@axis.com>
References: <cover.1455107681.git.larper@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wednesday 10 February 2016 13:41:49 Lars Persson wrote:
> Basic support for the Axis Artpec-6 ARM SoC. Timers, interrupts, UARTs and
> ethernet are wired up.
> 

Hi Lars,

Looks nice overall, I just have a few small comments on some of the patches.
Please also add a patch do add yourself in the MAINTAINERS file.

	Arnd
