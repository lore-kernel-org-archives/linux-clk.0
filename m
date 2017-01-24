Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:25831 "EHLO
        userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750792AbdAXMuu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 Jan 2017 07:50:50 -0500
Date: Tue, 24 Jan 2017 15:50:39 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut@gmail.com>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [bug report] clk: vc5: Add support for IDT VersaClock 5P49V5923
 and 5P49V5933
Message-ID: <20170124124838.GH4201@mwanda>
References: <20170124093133.GA28235@mwanda>
 <CAMuHMdXYBN=6HZEgx2WVbg4iruG=_tE=erK54FHRbXbDxCkrDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAMuHMdXYBN=6HZEgx2WVbg4iruG=_tE=erK54FHRbXbDxCkrDg@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Thanks.

I've figured out a way to fix Smatch so it doesn't complain about this
particular warning in the future.

regards,
dan carpenter

