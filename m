Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1436571223-10959-21-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
	<1436571223-10959-21-git-send-email-sboyd@codeaurora.org>
Date: Sat, 11 Jul 2015 09:24:01 +0200
Message-ID: <CAGhQ9VyhmFa-dVW8ptXe0Sa5=T1SyvkS7F6F-M8O_EH4DwdgCQ@mail.gmail.com>
Subject: Re: [PATCH 20/45] clk: nxp: Remove clk.h include
From: Joachim Eastwood <manabian@gmail.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 11 July 2015 at 01:33, Stephen Boyd <sboyd@codeaurora.org> wrote:
> Clock provider drivers generally shouldn't include clk.h because
> it's the consumer API. Remove the include here because this is a
> provider driver.
>
> Cc: Joachim Eastwood <manabian@gmail.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Acked-by: Joachim Eastwood <manabian@gmail.com>
