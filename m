Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:36193 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751712AbbFRXqT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 18 Jun 2015 19:46:19 -0400
Received: by pdjm12 with SMTP id m12so76702215pdj.3
        for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2015 16:46:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Loc Ho <lho@apm.com>, "Matthias Brugger" <matthias.bgg@gmail.com>
From: Michael Turquette <mturquette@linaro.org>
In-Reply-To: <CAPw-ZTm=GZgUzWQcUAmfQwrDG8kouxj9uxT9L1+G+QCYQ8WjUw@mail.gmail.com>
Cc: sboyd@codeaurora.org, "Kumar Sankaran" <ksankaran@apm.com>,
	"Feng Kan" <fkan@apm.com>, linux-clk@vger.kernel.org,
	"Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>
References: <1434576529-4183-1-git-send-email-matthias.bgg@gmail.com>
 <CAPw-ZTm=GZgUzWQcUAmfQwrDG8kouxj9uxT9L1+G+QCYQ8WjUw@mail.gmail.com>
Message-ID: <20150618234608.9112.72997@quantum>
Subject: Re: [PATCH v2] clk: xgene: Delete duplicated name field
Date: Thu, 18 Jun 2015 16:46:08 -0700
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Quoting Loc Ho (2015-06-17 23:28:56)
> Hi,
> 
> On Wed, Jun 17, 2015 at 2:28 PM, Matthias Brugger <matthias.bgg@gmail.com>
> wrote:
> 
>     X-Gene clocks implement it's name in the clock private struct.
>     This is a duplication of the name field. We can delete the field
>     and rely on the common implementation to retrieve the name.
> 
>     Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> 
> 
> ​I had applied and tested against linux-next. Look good to me. 

Looks OK to me. Since we're so close to the 4.1 release I'm going to
wait until after the merge window for this one.

Regards,
Mike

> 
> -Loc​
> 
