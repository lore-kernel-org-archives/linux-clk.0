Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911838;
	b=xUy8ZJ8CDwSlGgydhSz0g1GaTmqRU6vkI6gHR8l3q14hi1euennAjq3biHBS9hzzVZOZ
	 hMahli5j5qqh1THAdne2qqN+uLxZuh6FRFohvv5S/gOKKIgtW27mHBSbDmK5Fr1yUJrES
	 6PEgm5vNKTsqAx6RC1+oDT/HTrEFpdjPqylnjfSkRTePV5HBdayFV2e28TULMwqs7R+NL
	 3V+FfLCwW1xVMnmiwNJPmnS2R5ndJN9zTkOxW/yQOMfrdTg6WYKZqyMufzPe7UF7+uU74
	 mNwL8WrYkAoG1QM5sFzCJNfLhw3REScu1Pn5ymQ2vGryR5xqC/se7zkFzOJycSFNYhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911838;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=oS2IzMkOTOqwVbbaSiypFnCxcg+JUiRxAqauHYkYtVk=;
	b=cE1fBzFORqXNgo1ukflZ7UNvsFp8hKh64gdcL/39sB29q+86A6ajQJZmlWarcjm9NAA5
	 QAtzyQBmsz3f+NJD5ERWYZ4PL/ZnIFifOG8YXZyT61WArDm9He+7ZbDo9rB1n+U3XdCXd
	 lv5hdK8QyQe66d/Bdmui1pjR6HRMhzsN44ge0kGISIv/CoZ+lEBO7OS9VCnYiXclmRH4Y
	 XQ2m3RSkCb9tbfciNR/gjr/upIVIMW1igVDyqWBVZqnXFUjlMSuWEy7wZ6Up9Mn/+JYjg
	 WXoI2GcuY73Z3fPSVikjXIU5r/g1nTRuajAlON1+c2UbwUCh30apPg2uIsCwj7f3jNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=BXM+M8fc;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C5C606A33F;
	Tue, 17 Nov 2026 10:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3C5C606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=BXM+M8fc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794911821;
	bh=GyVg3xRAsxKtx70hQeC7sX7CbfKbBqKN62u5s+MslSE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BXM+M8fcUEGGoeCViqwr0zSdncbEkEpmhsaTgHxCS4SgKjc7DAnBhVImbYQEtHVhi
	 owaszfU6TBE0BVoLJbBw4WC+1FYhp30sUeNCVa0znSIdsRM2M/X11Rit8wkKmhPXUF
	 7TnHHckG7KmqnwxUiGXp5eWAk6lUW9jEBfYp5OHom1L0yJAgujsBHg+yo69zr8Xp7g
	 HZUN+cXCwclet40iReSxZOPaCJCSQuyepO5mQ52YIzHcw+RbLj3fx8APOhb4QroNRj
	 PHqdGr0SU2eS6jcYxhnSj4Kk7wQMzFxTbmMd4fzhpKx+Uc6kjDpixUHwIMpPMANHoK
	 Yj0tN17wIlxpg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E8B7117E00E8;
	Tue, 17 Nov 2026 11:37:00 +0100 (CET)
Message-ID: <004a959f-e213-44ee-bad4-58376431b83e@collabora.com>
Date: Tue, 17 Nov 2026 11:37:00 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/35] clk: mediatek: Migrate to common probe/remove
 helpers and fix memory leaks
To: Akari Tsuyukusa <akkun11.open@gmail.com>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Kees Cook <kees@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Danilo Krummrich <dakr@kernel.org>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>, Haotian Zhang
 <vulab@iscas.ac.cn>, Miles Chen <miles.chen@mediatek.com>,
 Sam Shih <sam.shih@mediatek.com>, Daniel Golle <daniel@makrotopia.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Laura Nao <laura.nao@collabora.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/26 17:16, Akari Tsuyukusa wrote:
> This series migrates most MediaTek clock drivers to the common
> probe/remove helpers provided by the MTK clock framework.
> 

Thanks for this big series finishing the migration, that's really appreciated.

I have applied everything I could, but had to leave out anything that is touching
FHCTL/PLLFH because that code changed a bit in one of the previous series that got
sent for MT8189 clocks.

Anyway - I also had comments about that, so it's not a big deal... specifically,
can we avoid those ifdefs please?

I seriously don't like having ifdefs around.

Cheers,
Angelo

> Key changes:
> - Fix memory leaks on module removal caused by missing
>    platform_set_drvdata() calls (patches 1-6).
> - Add missing MODULE_DEVICE_TABLE() (patches 7, 8).
> - Add missing support for cpumux, PLL, FHCTL, and child-device
>    population to the common helpers (patches 12-15).
> - Convert all compatible clock drivers to use struct mtk_clk_desc
>    and mtk_clk_simple_probe/remove (patches 16-35).
> 
> The memory leak and MODULE_DEVICE_TABLE() fixes are split from the
> migration patches to allow backporting to stable.
> 
> Drivers not converted:
> - MT6765 apmixedsys: requires direct register init.
> - MT6795 apmixedsys: uses mtk_clk_register_ref2usb_tx().
> - MT7629 eth/sgmiisys: uses a hacked probe sequence (multi-instance
>    sgmii gates).
> - MT8173 apmixedsys: uses mtk_clk_register_ref2usb_tx() and custom
>    divider registration.
> - MT8188/MT8195 topckgen: call devm_clk_hw_register_mux() and register
>    a notifier.
> - MT8196 vlpckgen: requires direct register init.
> - MT8365 apmixedsys: uses devm_clk_hw_register_gate().
> 
> Patches 1-6 are based on
> "[PATCH v2 0/6] clk: mediatek: fix memory leak on module removal"
> (In addition fixed a compilation error in mt8173-infracfg)
> https://lore.kernel.org/linux-mediatek/20260707074839.240676-1-akkun11.open@gmail.com/
> 
> Patch 5 fixes the same issue mentioned below
> "[PATCH] clk: mediatek: clk-mt8173-apmixedsys: Invoke platform_set_drvdata on probe"
> https://lore.kernel.org/linux-mediatek/20261010160134.112136-1-l.scorcia@gmail.com/
> 
> Patch 12 is based on
> "[PATCH 1/3] clk: mediatek: clk-mtk: Add cpumux support to common probe/remove helpers"
> https://lore.kernel.org/lkml/20260304181024.738391-1-akkun11.open@gmail.com/
> 
> Changes in v2:
> - Add two new fixes "Fix index in composite clock unwind path" and
>    "Fix memory leak in mtk_clk_register_gate()".
> - Add new refactor "return 0 instead of r in __mtk_clk_simple_probe()"
> - Fix missing `.data = &apmixed_desc` in the MT8167 and MT8195
>    apmixedsys drivers.
> - Fix PLL registration and unregistration when
>    CONFIG_COMMON_CLK_MEDIATEK_FHCTL is disabled.
> - Fix child-device population logic.
> - Clarify the rationale in the SoC conversion commit messages.
> - Minor fixes to several commit messages.
> - Rebased onto `24a19b953e2a ("Linux 7.3-rc7")`
>    from `075b74841bd0 ("Linux 7.2-rc6")`
> 
> Link to v1:
> https://lore.kernel.org/linux-mediatek/20260803141659.559129-1-akkun11.open@gmail.com/T/
> 
> Akari Tsuyukusa (35):
>    clk: mediatek: mt2712: Fix memory leak on module removal
>    clk: mediatek: mt6795: Fix memory leak on module removal
>    clk: mediatek: mt7622: Fix memory leak on module removal
>    clk: mediatek: mt8135: Fix memory leak on module removal
>    clk: mediatek: mt8173: Fix memory leak on module removal
>    clk: mediatek: mt8192: Fix memory leak on module removal
>    clk: mediatek: mt6735: Add missing MODULE_DEVICE_TABLE()
>    clk: mediatek: mt7988-apmixed: Add missing MODULE_DEVICE_TABLE()
>    clk: mediatek: Fix index in composite clock unwind path
>    clk: mediatek: Fix memory leak in mtk_clk_register_gate()
>    clk: mediatek: return 0 instead of r in __mtk_clk_simple_probe()
>    clk: mediatek: Add cpumux support to common probe/remove helpers
>    clk: mediatek: Add PLL support to common probe/remove helpers
>    clk: mediatek: Add child-device population to probe/remove helpers
>    clk: mediatek: Add FHCTL support to common probe/remove helpers
>    clk: mediatek: mt2701: Switch to common probe/remove helpers
>    clk: mediatek: mt2712-apmixedsys: Switch to common probe/remove
>      helpers
>    clk: mediatek: mt6735-apmixedsys: Switch to common probe/remove
>      helpers
>    clk: mediatek: mt6779: Switch to common probe/remove helpers
>    clk: mediatek: mt6795: Switch to common probe/remove helpers
>    clk: mediatek: mt6797: Switch to common probe/remove helpers
>    clk: mediatek: mt7622: Switch to common probe/remove helpers
>    clk: mediatek: mt7981-apmixed: Switch to common probe/remove helpers
>    clk: mediatek: mt7986-apmixed: Switch to common probe/remove helpers
>    clk: mediatek: mt7988-apmixed: Switch to common probe/remove helpers
>    clk: mediatek: mt8135-apmixedsys: Switch to common probe/remove
>      helpers
>    clk: mediatek: mt8167-apmixedsys: Switch to common probe/remove
>      helpers
>    clk: mediatek: mt8173-infracfg: Switch to common probe/remove helpers
>    clk: mediatek: mt8183: Switch to common probe/remove helpers
>    clk: mediatek: mt8186-apmixedsys: Switch to common probe/remove
>      helpers
>    clk: mediatek: mt8188-apmixedsys: Switch to common probe/remove
>      helpers
>    clk: mediatek: mt8192: Switch to common probe/remove helpers
>    clk: mediatek: mt8195: Switch to common probe/remove helpers
>    clk: mediatek: mt8196: Switch to common probe/remove helpers
>    clk: mediatek: mt8516-apmixedsys: Switch to common probe/remove
>      helpers
> 
>   drivers/clk/mediatek/Kconfig                 |  34 +--
>   drivers/clk/mediatek/clk-gate.c              |   4 +-
>   drivers/clk/mediatek/clk-mt2701-aud.c        |  35 +--
>   drivers/clk/mediatek/clk-mt2701.c            | 233 +++++--------------
>   drivers/clk/mediatek/clk-mt2712-apmixedsys.c |  48 +---
>   drivers/clk/mediatek/clk-mt6735-apmixedsys.c |  51 +---
>   drivers/clk/mediatek/clk-mt6735-imgsys.c     |   1 +
>   drivers/clk/mediatek/clk-mt6735-mfgcfg.c     |   1 +
>   drivers/clk/mediatek/clk-mt6779.c            | 124 ++--------
>   drivers/clk/mediatek/clk-mt6795-apmixedsys.c |   2 +
>   drivers/clk/mediatek/clk-mt6795-infracfg.c   |  70 +-----
>   drivers/clk/mediatek/clk-mt6795-pericfg.c    |  71 +-----
>   drivers/clk/mediatek/clk-mt6797.c            | 140 ++---------
>   drivers/clk/mediatek/clk-mt7622-apmixedsys.c |  60 +----
>   drivers/clk/mediatek/clk-mt7622-aud.c        |  35 +--
>   drivers/clk/mediatek/clk-mt7622-infracfg.c   |  70 +-----
>   drivers/clk/mediatek/clk-mt7981-apmixed.c    |  37 +--
>   drivers/clk/mediatek/clk-mt7986-apmixed.c    |  37 +--
>   drivers/clk/mediatek/clk-mt7988-apmixed.c    |  40 +---
>   drivers/clk/mediatek/clk-mt8135-apmixedsys.c |  48 +---
>   drivers/clk/mediatek/clk-mt8167-apmixedsys.c |  58 ++---
>   drivers/clk/mediatek/clk-mt8173-apmixedsys.c |   2 +
>   drivers/clk/mediatek/clk-mt8173-infracfg.c   |  98 ++------
>   drivers/clk/mediatek/clk-mt8183-apmixedsys.c |  51 +---
>   drivers/clk/mediatek/clk-mt8183-audio.c      |  26 +--
>   drivers/clk/mediatek/clk-mt8186-apmixedsys.c |  59 +----
>   drivers/clk/mediatek/clk-mt8188-apmixedsys.c |  60 +----
>   drivers/clk/mediatek/clk-mt8192-apmixedsys.c |  67 ++----
>   drivers/clk/mediatek/clk-mt8192-aud.c        |  26 +--
>   drivers/clk/mediatek/clk-mt8195-apmixedsys.c |  75 ++----
>   drivers/clk/mediatek/clk-mt8195-apusys_pll.c |  49 +---
>   drivers/clk/mediatek/clk-mt8196-apmixedsys.c |  67 +-----
>   drivers/clk/mediatek/clk-mt8196-mcu.c        |  96 +++-----
>   drivers/clk/mediatek/clk-mt8196-mfg.c        |  84 ++-----
>   drivers/clk/mediatek/clk-mt8516-apmixedsys.c |  42 +---
>   drivers/clk/mediatek/clk-mtk.c               |  90 ++++++-
>   drivers/clk/mediatek/clk-mtk.h               |  12 +
>   37 files changed, 496 insertions(+), 1607 deletions(-)
> 
