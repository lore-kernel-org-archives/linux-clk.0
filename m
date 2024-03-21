Received: from forward501b.mail.yandex.net (forward501b.mail.yandex.net [178.154.239.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3186D58AC0
	for <linux-clk@vger.kernel.org>; Thu, 21 Mar 2024 19:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711047681; cv=none; b=uMMfFpt2hl3lkPzGGKzGVAcqWSA1ZqNcIPPgsVS0k4BaBMpRll2VtaHAxj7aCaU2HBz9040kjKSMeDU3RuomVbfxI+9dp/CaedNTVoPfkyMpddz/690Dad5ULAgY+8bfasm0ahaFifNCcfJE1VwynF5jfQJs6Oaow2ZWFTJpMUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711047681; c=relaxed/simple;
	bh=Br1qZO/BeHyRu02X77bPdvMURXlQ8zg0ymB3w6Ej8Us=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ujwO5XnnrLhJHF2t/rw49stNUF7EOBKZhVvXjLBf7htB2BKa1jM6itxWwrixGsRJQA3mbmIww8oElzyR6bu4D1kbkMuFWZK/7tJYSAz0lhciTM7L20zba3yiTL2umBRZwUtr2KJx4HT3uk40dMF4+lCWuy60gaO4TFvV9jz+qkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=0upti.me; spf=pass smtp.mailfrom=0upti.me; dkim=pass (1024-bit key) header.d=0upti.me header.i=@0upti.me header.b=LE3TVQ3u; arc=none smtp.client-ip=178.154.239.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=0upti.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0upti.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0upti.me header.i=@0upti.me header.b="LE3TVQ3u"
Received: from mail-nwsmtp-smtp-production-main-24.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-24.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:9309:0:640:3b75:0])
	by forward501b.mail.yandex.net (Yandex) with ESMTPS id BA80760020;
	Thu, 21 Mar 2024 22:01:14 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-24.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id B1MF4pLoAmI0-dMXEILER;
	Thu, 21 Mar 2024 22:01:13 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0upti.me; s=mail;
	t=1711047673; bh=MWztkBz6kKd0LO43h8ylzKetPUPSuWVrPrifryRc2Fw=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=LE3TVQ3uJ8KvVh/bRC6Y3r79zf0cP02BvyTtsa3iZAsAn7xSgICRxEbSIgmXtb+Td
	 n9GSF38rhKS55IHat5pjsVVzKMdbCYFSNnHd/B6INUCW90VU+aM7JwR5Rm6SCPGXWZ
	 /nLrDmF4Fsv0ga9Ix9i/EKhhWw11mIyNuPAdOiZs=
Authentication-Results: mail-nwsmtp-smtp-production-main-24.iva.yp-c.yandex.net; dkim=pass header.i=@0upti.me
Message-ID: <5287754a-e488-4365-9e88-811eb028a91e@0upti.me>
Date: Thu, 21 Mar 2024 22:01:10 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 7/7] clk: rockchip: implement proper GATE_LINK support
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Chad LeClair <leclair@gmail.com>
Cc: "andy.yan@rock-chips.com" <andy.yan@rock-chips.com>,
 "heiko@sntech.de" <heiko@sntech.de>,
 "huangtao@rock-chips.com" <huangtao@rock-chips.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "kever.yang@rock-chips.com" <kever.yang@rock-chips.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "zhangqing@rock-chips.com" <zhangqing@rock-chips.com>
References: <1456131709882456@mail.yandex.ru>
 <uwr335fla4nfvv3mdppcoly6hcsayav26r4r6txmbwrb25ftw7@rxwjtan7evww>
 <7f4b3f38-50ee-480f-a341-ab577e19bb32@gmail.com>
 <2rsu6qa3pwbqic6b7ej6txa34jw4ztrnybzcfcfysue2mky37h@dyrdefbimzdn>
 <97f8b9e7-983c-435e-8fad-11e71be158b8@gmail.com>
 <vetdlmrlwx2bpwliof442zjiir7jy5irs737qu3v7qjhcvubn4@wslcvkis3tsf>
Content-Language: en-US
From: Ilya K <me@0upti.me>
In-Reply-To: <vetdlmrlwx2bpwliof442zjiir7jy5irs737qu3v7qjhcvubn4@wslcvkis3tsf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-03-21 21:31, Sebastian Reichel wrote:
> 
> Ah, that was actually not setting up the clock links at all. Sorry
> about that. I reworked everything again and moved all the GATE_LINK
> code into the separate driver now. Please give it another try.
> 
> Greetings,
> 
> -- Sebastian

Applied this to my 6.8.1: https://github.com/K900/linux/tree/rk3588-test

As far as I can tell, literally everything works now - it boots, runs, and I can read and write the flash even with ROCKCHIP_SFC=m.

Thanks a lot for digging into this, y'all!

