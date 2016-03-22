Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:39603 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751359AbcCVQ11 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Tue, 22 Mar 2016 12:27:27 -0400
Date: Tue, 22 Mar 2016 17:27:10 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [RFC 4/5] WIP: clk: shmobile: r8a7795: add R clk
Message-ID: <20160322162707.GB14057@katana>
References: <1458587984-6313-1-git-send-email-wsa@the-dreams.de>
 <1458587984-6313-5-git-send-email-wsa@the-dreams.de>
 <CAMuHMdW0o9Po8pmJx8=xDi5VQc6ToqrENOHCOr64RffcUNPdSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAMuHMdW0o9Po8pmJx8=xDi5VQc6ToqrENOHCOr64RffcUNPdSQ@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

> > +               if (0) { /* FIXME: how to check if EXTALR rate is > 0? */
> 
> Can't you just get its rate?
> Please cc linux-clk for questions like this.

I wondered if a clock provider has an easier method than simply becoming
a clock consumer of its own clock. I thought some of you might know
something. I'll have a second look. If that fails, I'll ask the clk
list, of course.

