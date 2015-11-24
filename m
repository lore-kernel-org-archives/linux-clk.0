Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:48879 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751568AbbKXCtk (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 23 Nov 2015 21:49:40 -0500
Date: Tue, 24 Nov 2015 11:49:37 +0900
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-sh@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 0/2] drivers: sh: clk: Cleanup clock API
Message-ID: <20151124024936.GG21853@verge.net.au>
References: <1447957927-32738-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1447957927-32738-1-git-send-email-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, Nov 19, 2015 at 07:32:05PM +0100, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> This patch series cleans up the clock API on legacy SH, to make it more
> similar with the Common Clock Framework.  This will avoid different
> behavior in drivers shared between legacy and CCF-based platforms (e.g.
> SCIF).
> 
> Thanks for applying!

Thanks, done.
