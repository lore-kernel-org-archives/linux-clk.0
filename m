Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D50263C;
	Mon, 23 Dec 2024 09:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.89.224.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734944516; cv=none; b=ZPwl6YDFCejqsTEqrbU4NayShE6NlndqN720HLJkOC2pO7SKE5kcuqbHn4hCvGIAJ2KrG4ZZ2w7AurAm7c86bPYna1eElml2dIJsCU27Knr2kVXHO6W8FnYi/K2azpU/KD5kfWOCvmgbssRP8KuEIhUlu5RYw8NWzQCash8fu4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734944516; c=relaxed/simple;
	bh=326KEhqo4F9QWWsvg1l8wQk0+ffhwwCoqJyhYS1CWkA=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eNHxE/cHALOQg3fivlxaubSDr2vk7VrgHP/8ZpkNIRdXTmcfTre4h3l1vqSI64zffSoelazLuYYVWNXiFYNBnYc4JKzjhwb8klr6itW6mlj2zuyFryYoM9fJ51Wl7x93v6SAtNyzvH+CnMa2I0DTzGriXa4/6Tr+IvhXgRBqZw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=Fzerw90+; arc=none smtp.client-ip=45.89.224.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="Fzerw90+"
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id EA04E120002;
	Mon, 23 Dec 2024 12:01:37 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru EA04E120002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1734944497;
	bh=QDrTsEzWaOX89BojzNH8QfMOE2AqATecLGA8bl4b9H8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=Fzerw90+2sw2l3OYYJAjcsRRxc5JBP/63yqNHAn/V7MWkkMOOgIZQYLM2vSOhXpeD
	 YPdTlfTZ38U9SIZtMrElQ21v/RfltO5KGiC2yjGqXYPHLfktU4Ds1a3OgO3r5lq6s/
	 OK0Z9woh+genAzmYtt9yAadd+G2+5ATviOGIvapRa9Ni9Tpa/V+cUbr7u8dHg1aybp
	 9/yZuWPfabHUOelkcf01+IZGVsNJvsrseHBzf41Kh5Vr1EP8w0WdCrgwWmSMLBo4OO
	 z84ZOP7fQ94cpeO7uzHcMEr5S1YpCjvhMvI40pBDw6kaJazjdhca6Bc1iGOjF6mbo2
	 94ftDwetSyU3w==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 23 Dec 2024 12:01:37 +0300 (MSK)
Date: Mon, 23 Dec 2024 12:01:37 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: Chuan Liu <chuan.liu@amlogic.com>
CC: Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [DMARC error][DKIM error]Re: [PATCH 3/3] clk: amlogic: s4:
 remove unused data
Message-ID: <20241223090137.jbzwrlazhkumatfx@CAB-WSD-L081021>
References: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com>
 <20241220-amlogic-clk-drop-clk-regmap-tables-v1-3-96dd657cbfbd@baylibre.com>
 <3ce97435-71c6-4a7c-8d6c-fa387f68494d@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3ce97435-71c6-4a7c-8d6c-fa387f68494d@amlogic.com>
User-Agent: NeoMutt/20220415
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-i-exch-a-m1.sberdevices.ru (172.24.196.116)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 189997 [Dec 23 2024]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 49 0.3.49 28b3b64a43732373258a371bd1554adb2caa23cb, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/12/23 05:07:00 #26899502
X-KSMG-AntiVirus-Status: Clean, skipped

Hello Chuan!

On Mon, Dec 23, 2024 at 03:59:07PM +0800, Chuan Liu wrote:
> Hi Jerome:
> 
> Thank you for pointing out.
> 
> 
> On 12/21/2024 1:17 AM, Jerome Brunet wrote:
> > [ EXTERNAL EMAIL ]
> > 
> > Following the removal of the big clk_regmap clock table from the
> > s4-peripherals clock controller driver, it appears some clocks are unused,
> > which means these are not exported or even registered.
> 
> 
> I have confirmed here that these clocks are used for the demodulator
> of DTV (Digital Television). The DTV-related driver will use these
> clocks.
> 
> 
> > 
> > In all likelihood, these clocks have not been tested. Remove the unused
> > clocks for now. These can added back later when they have been properly
> > tested.
> 
> 
> I will complete these clocks later after testing.

Are you planning to submit the DTV drivers that will utilize these
clocks to the upstream?

If I correctly interpret Jerome's patch series, it appears that these
clocks will not be applied to the upstream kernel unless there are
clients present in the future.

Please correct me if I'm wrong.

[...]

-- 
Thank you,
Dmitry
