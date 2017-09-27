Return-Path: <s.nawrocki@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset="utf-8"
Subject: Re: [PATCH 3/3] clk/mmp: Adjust 12 checks for null pointers
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-clk@vger.kernel.org, Chao Xie <chao.xie@marvell.com>, Michael
	Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <03eb0051-e03b-ee13-c68f-ee76a181a863@samsung.com>
Date: Wed, 27 Sep 2017 11:26:53 +0200
In-reply-to: <e07c8432-3698-8db6-8ce2-7b30efc61fb9@users.sourceforge.net>
References: <051d7ba6-e3cc-8354-8315-93fe039dd2ce@users.sourceforge.net>
	<CGME20170927072816epcas3p1b533de74f5dcdee311045a24f6e60f50@epcas3p1.samsung.com>
	<e07c8432-3698-8db6-8ce2-7b30efc61fb9@users.sourceforge.net>
List-ID: <linux-clk.vger.kernel.org>

On 09/27/2017 09:27 AM, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 27 Sep 2017 09:00:21 +0200

> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit

Can you please fix your process and stop posting with above tags 
in the commit message? These 3 tags are already in the header
of message you are sending. After your patches get applied 
we end up with a mess in commit messages as below.

------------------------------8<-------------------------------
commit 0b08273c8ab7e688832120c4817b1adfdc56e231
Author: Markus Elfring <elfring@users.sourceforge.net>
Date:   Thu Aug 17 21:35:16 2017 +0200

    orangefs: Adjust three checks for null pointers
    
    MIME-Version: 1.0
    Content-Type: text/plain; charset=UTF-8
    Content-Transfer-Encoding: 8bit
    
    The script “checkpatch.pl” pointed information out like the following.
    
    Comparison to NULL could be written !…
    
    Thus fix affected source code places.
    
    Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
    Signed-off-by: Mike Marshall <hubcap@omnibond.com>
------------------------------8<-------------------------------

Please see "DISCUSSION" paragraph of [1] for an explanation 
of what should be put in the message body.

[1] https://git-scm.com/docs/git-format-patch

--
Thanks,
Sylwester

> The script “checkpatch.pl” pointed information out like the following.
> 
> Comparison to NULL could be written !…
> 
> Thus fix the affected source code places.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
