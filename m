Received: from forward500b.mail.yandex.net (forward500b.mail.yandex.net [178.154.239.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F746BB5B
	for <linux-clk@vger.kernel.org>; Wed, 20 Mar 2024 17:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710955251; cv=none; b=iQuK7BbShXKfEt8JQhTxtID+5YDWYESQuraHTE3gL7pBgTh3wFEC8KC3ubQopomTHGUdK/zBEaWgIckfLlzgyp9mLE2n8TsnCq0E8Lga2H2fWt/n6+ACm1y8p2WP8fAgQXt8nm3/by3tH50nmqakCZTuw6z6j/9uZxrTQwyPI7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710955251; c=relaxed/simple;
	bh=k+AEx4AaGvjv+BIIGB82mWPAWonEHHUKOUG+k35POEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=COsgDG0Z+W1V++zanIS2xBFfDbhEY4NJfWkJhlic/yucbWSb4vc3EfbVXdoJaPZqeJ4BgTXEpERtx0rgro5jdQhGeNgJmV+e1zdaIQvpHwf9Nym5oCKjL2lw3W1QRfjmbtNqyQUkS0+tU5AdMmzSgqV2Zmm3P4CMwgKJhLCQaD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=0upti.me; spf=pass smtp.mailfrom=0upti.me; dkim=pass (1024-bit key) header.d=0upti.me header.i=@0upti.me header.b=QOlslN2N; arc=none smtp.client-ip=178.154.239.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=0upti.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0upti.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0upti.me header.i=@0upti.me header.b="QOlslN2N"
Received: from mail-nwsmtp-smtp-production-main-54.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-54.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:410d:0:640:81ab:0])
	by forward500b.mail.yandex.net (Yandex) with ESMTPS id D1B9061609;
	Wed, 20 Mar 2024 20:20:43 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-54.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id dKJCmv6OkGk0-AoiXGOs0;
	Wed, 20 Mar 2024 20:20:42 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0upti.me; s=mail;
	t=1710955242; bh=hc1vbtlKdrSBHuAxPHv4xGyYQrXCyDJSzItdrBoYHy8=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=QOlslN2NiDix2xstfFgVflxTHo9jBFlOrLm5otc5urFdaA6PIjokcPatKucPJlIpZ
	 RnOZwTjeG8g/k1Q8eoNB72R2dl9rKg2IggPBB2l54RIyXZvw506b8/AEIorOXOa425
	 i6ssmQKVLuphPhT6HlfDwp52oJ6C2cHDwsArQ7ho=
Authentication-Results: mail-nwsmtp-smtp-production-main-54.iva.yp-c.yandex.net; dkim=pass header.i=@0upti.me
Message-ID: <1a83c0b8-2831-4b05-b29a-1ff6ed9a7c70@0upti.me>
Date: Wed, 20 Mar 2024 20:20:38 +0300
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
Content-Language: en-US
From: Ilya K <me@0upti.me>
In-Reply-To: <2rsu6qa3pwbqic6b7ej6txa34jw4ztrnybzcfcfysue2mky37h@dyrdefbimzdn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-03-20 19:36, Sebastian Reichel wrote:
> Can you test again using rk3588-test [0] (which is based on today's
> master branch) from today as base? Ideally it should work with your
> Orange Pi 5, since it contains "clk: rockchip: rk3588: mark hclk_nvm
> critical".
> 
> I also worked on a cleaner solution for the issue you described and
> integrated it in the patch adding proper gate clock support. So
> please also test with HCLK_NVM not being marked as CRITICAL.
> 
> [0] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/commits/rk3588-test
> 
> If everything is fine I will prepare a v9.
>

Tested this on my end, and I'm getting the same SFC issue, so there's probably another clock that's missing somewhere. Building with ROCKCHIP_SFC=y (instead of =m) removes the error message, but any access to the flash just locks up, so it's probably placebo, unless there's a second, unrelated issue.

