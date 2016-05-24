Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp2-g21.free.fr ([212.27.42.2]:58204 "EHLO smtp2-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752485AbcEXLD4 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Tue, 24 May 2016 07:03:56 -0400
Subject: Re: [PATCH RESEND v4 5/9] MIPS: Loongson-1A: workaround of pll
 register's write-only property
To: Binbin Zhou <zhoubb@lemote.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, linux-clk@vger.kernel.org
References: <1463622432-10298-1-git-send-email-zhoubb@lemote.com>
From: Mason <slash.tmp@free.fr>
Message-ID: <57443510.4020105@free.fr>
Date: Tue, 24 May 2016 13:03:44 +0200
MIME-Version: 1.0
In-Reply-To: <1463622432-10298-1-git-send-email-zhoubb@lemote.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 19/05/2016 03:47, Binbin Zhou wrote:

> +#ifdef CONIFG_CPU_LOONGSON1A

As I pointed out last week, CONFIG is misspelled.

Regards.

