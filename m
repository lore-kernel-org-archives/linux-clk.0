Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mx1.emlix.com ([46.4.235.150]:56754 "EHLO mx1.emlix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933646AbeFKONA (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 11 Jun 2018 10:13:00 -0400
Subject: Re: [PATCH] clk: imx6: fix video_27m parent for IMX6QDL_CLK_CKO1_SEL
To: Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-clk <linux-clk@vger.kernel.org>
References: <20180608101924.31195-1-pp@emlix.com>
 <CAOMZO5C8CA02V+oiag5tGpKBWN+UP28KwQ98jQ9PpQ2_aCq_bA@mail.gmail.com>
From: Philipp Puschmann <pp@emlix.com>
Message-ID: <40261c5f-285f-66f3-41dc-7107c487a47e@emlix.com>
Date: Mon, 11 Jun 2018 16:12:58 +0200
MIME-Version: 1.0
In-Reply-To: <CAOMZO5C8CA02V+oiag5tGpKBWN+UP28KwQ98jQ9PpQ2_aCq_bA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

> Hi Philipp,
> 
> On Fri, Jun 8, 2018 at 7:19 AM, Philipp Puschmann <pp@emlix.com> wrote:
>> q/dl datasheets list the 5th selection value for ck01_sel as
>> video_27M_clk_root.
>>
>> By replacing the dummy value we then can set IMX6QDL_CLK_VIDEO_27M
>> as parent for IMX6QDL_CLK_CKO1_SEL.
>>
>> Signed-off-by: Philipp Puschmann <pp@emlix.com>
> 
> You could still have added my Reviewed-by tag that I sent previously :-)
> 
> Here it goes:
> 
> Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
> 
> Also in the future, when posting a new version of a patch, please mark
> it as such:
> 
> [PATCH v2] clk: imx6: fix video_27m parent for IMX6QDL_CLK_CKO1_SEL
> 
> and write below the --- line what are the changes in this new version.
> 
> Thanks
> 

Hi Fabio,

thank you for your hints, next time i will do it that way
