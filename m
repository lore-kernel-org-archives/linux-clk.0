Received: from mail-m49212.qiye.163.com (mail-m49212.qiye.163.com [45.254.49.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EFC38E5C9
	for <linux-clk@vger.kernel.org>; Fri,  6 Mar 2026 12:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772799066; cv=none; b=Old/xCWuKmVJhG0svzM0O3gGAsPyGQ52DKSVgrMihYY0ET5k9NC+fZllfBOtewXJ0D1trIklhQiLKE0zLI5rLjq47X0I0YhhuU4vtUgyDf6tK8G7v3DQhxgP+q5+VvqsB3VPXuHV5QDf2QhcausGDQQVDjFsO4jvBcqpl5qFSDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772799066; c=relaxed/simple;
	bh=lIHrGjyNMSwg8lNh2KFvWlFmsyGwlNKJGs/7ldMuurI=;
	h=Cc:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=nfz6a2LbXG/vBdnh4p8+ADVYA/KLr21baV1m8UXrwtKZwYLZjw+yE46JeCJaw73S3qMTw9NYuRJAfOkuVUkjeV6iev060U3uvgtfG1jN1COp8G2+A+IqOiyFdNiUWrEGsqflzOrkL/QaTR3Cxt65J8Q1tLM03jjy8iF8AcjarRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=c6qwPOrY; arc=none smtp.client-ip=45.254.49.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="c6qwPOrY"
Received: from [172.16.12.14] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 36060f672;
	Fri, 6 Mar 2026 20:05:45 +0800 (GMT+08:00)
Cc: shawn.lin@rock-chips.com, linux-rockchip@lists.infradead.org,
 linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: rockchip: rk3568: Add PCIe pipe clock gates
To: Heiko Stuebner <heiko@sntech.de>
References: <1772698011-145625-1-git-send-email-shawn.lin@rock-chips.com>
 <3742329.R56niFO833@phil>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <65431f69-811c-61af-9c33-3dee6992ac71@rock-chips.com>
Date: Fri, 6 Mar 2026 20:05:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <3742329.R56niFO833@phil>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cc30a1c1209cckunmc3da3282143748f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGhkZTFYaGUtKH0tKGh5PQ05WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=c6qwPOrYRMiNOZvNiazi5AcVcMXIfa3avBYrMky8wlVDGAQUrjiBaIU+XhaJCgrZ6GT57No0Vxq6HqmZOLl4MKhSoxRKI3HOwKNqDEr3YHWxLn/l+exT8zORhHfJkE1EaPEIHYVF0TqS8mXRR7IvpBfIWWbPfNHMgiT4Qhvuh5A=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=18SAF6l9IUr8WQgBnZ4/fTJP3r6H7Na38YobGr1twPA=;
	h=date:mime-version:subject:message-id:from;

Hi Heiko,

在 2026/03/06 星期五 18:52, Heiko Stuebner 写道:
> Hi Shawn,
> 
> Am Donnerstag, 5. März 2026, 09:06:51 Mitteleuropäische Normalzeit schrieb Shawn Lin:
>> The PCIe pipe clocks are currently left as orphan clocks and remain
>> enabled indefinitely, which is suboptimal. Add the missing clock gates
>> so the PCIe driver can explicitly manage them when not in use.
>>
>> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
>> ---
>> Hi Heiko,
>>
>> This patch should be considered only after David's patch[1] is merged,
>> otherwise it breaks PCIe on RK3566/RK3568 due to clk_disable_unused().
> 
> This would also break compatiblity with old devicetrees.
> 
> The devicetree used by the kernel can also be embedded for example
> in an already installed u-boot and handed to the kernel from there.
> You cannot expect board devicetrees and the kernel image to be updated
> in lockstep.

Indeed.

> 
> We also sort of guarantee this backwards compatiblity - old DTB with
> newer kernel.
> 
> The solution is to add a CLK_IGNORE_UNUSED flag (but not CLK_IS_CRITICAL)
> to the newly added gate.
> 

Thanks, will improve it.

> This lets the clock stay and keeps the original behavious on old DTBs,
> but also allows the PCIe driver in newer kernels to turn off the clock
> if it wants to.
> 
> Thanks
> Heiko
> 
> 
> 
> 
