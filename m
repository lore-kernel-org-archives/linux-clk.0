Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.138]:59197 "EHLO
	regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754717AbbLCAaR (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 2 Dec 2015 19:30:17 -0500
Subject: Re: [PATCH] clk: rockchip: rk3368: protect aclk_bus and aclk_peri
 clocks
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
References: <1449062551-2498-1-git-send-email-jay.xu@rock-chips.com>
 <4430667.DaSfi9RHQ7@diego>
Cc: huangtao@rock-chips.com, mturquette@baylibre.com,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
From: Jianqun Xu <jay.xu@rock-chips.com>
Message-ID: <565F8D09.4010402@rock-chips.com>
Date: Thu, 3 Dec 2015 08:30:01 +0800
MIME-Version: 1.0
In-Reply-To: <4430667.DaSfi9RHQ7@diego>
Content-Type: text/plain; charset=gbk; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi heiko

I can see the patches on your clk branch for next
thanks

在 03/12/2015 07:31, Heiko Stübner 写道:
> Hi Jianqun,
>
> Am Mittwoch, 2. Dezember 2015, 21:22:31 schrieb jianqun.xu:
>> From: Jianqun xu <jay.xu@rock-chips.com>
>>
>> Add aclk_bus and aclk_peri to the list of rk3368 critical clocks,
>> which are the base clocks that supply for all peripherals, never
>> to be disabled automatically.
>>
>> Signed-off-by: Jianqun xu <jay.xu@rock-chips.com>
>
> applied to my clk branch for 4.5
> [after adapting to Caesar's other critical clock]
>
>
> Thanks
> Heiko
>
>
>

-- 
****************************************************************************
许剑群
Fuzhou Rockchip Electronics Co., Ltd
地址：福建省福州市铜盘路软件大道89号软件园A区21号楼
ADDR: No.21 bldg, Fuzhou Software Park,Fuzhou,Fujian,P.R.China
Email: xjq@rock-chips.com
****************************************************************************
保密提示：本邮件及其附件含有机密信息来自福州瑞芯微电子股份有限公司，仅发 
送给本邮件所指特定收件人。若非该特定收件人，请勿复制、 使用或披露本邮件 
的任何内容。若误收本邮件，请从系统中永久性删除本邮件及所有附件，并以回复 
邮件或其他方式即刻告知发件人。福州瑞芯微电子有限公司拥有本邮件信息的著作 
权及解释权，禁止任何未经授权许可的侵权行为。
IMPORTANT NOTICE: This email is from Fuzhou Rockchip Electronics Co., 
Ltd .The contents of this email and any attachments may contain 
information that is privileged, confidential and/or exempt from 
disclosure under applicable law and relevant NDA. If you are not the 
intended recipient, you are hereby notified that any disclosure, 
copying, distribution, or use of the information is STRICTLY PROHIBITED. 
Please immediately contact the sender as soon as possible and destroy 
the material in its entirety in any format. Thank you.
****************************************************************************

