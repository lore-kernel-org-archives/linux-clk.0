Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD2D16C43B
	for <linux-clk@vger.kernel.org>; Tue, 28 May 2024 10:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716893699; cv=none; b=CgNtEdPpIidZ9UkyjSKbNDqusJ/GZSbKPfJTpbQn0MF3arJGF8WJyy6kb/fgLZVBQInkSlXObMTGqT4krSpcHKA8KMUbuQlxlbsJyegOCOpYrxpYxseyw1kyfm7VSHXqM+C+y7M4MYoPlAwZ8az4rFIb35UMzrXx12ohQ9/kVao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716893699; c=relaxed/simple;
	bh=GOWMxyN/F4oNh2ktrRZtSe+zgFmhuwQWtSAhncORZrU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sYfPIIXfBl7adG158WrIe9eIU1IVPdDYGlqsQdcm4qXppDVy93GGJ5Kb/544MMiWDqDjObKarF+kbof86M/C72vsLTp/xmAFn3FktM6nFqq90d+6uZ6fvl1WdBBJZd2OdfpSPmmnjkjUP9R0ew6zyhu5G6xN0VkXkHyXqMq9XDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Y/OVEXXx; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Y/OVEXXx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716893695;
	bh=GOWMxyN/F4oNh2ktrRZtSe+zgFmhuwQWtSAhncORZrU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y/OVEXXx15IgIAOvOaJontYPnTl81qrtgA1xK0VBrzJVdDslcePkmcXhGXcDDWyXU
	 +T4Sm1JzylR2t8DA9SuI83+iDmMJHpSc+YJLF1A+eY54r2bwTVTTCTc2djHgnY/53L
	 mgIBDqq3zwPZrVICYQYDjCk+xfuYivm+HeeRetqQYJ77r32fmrYmQrKHm0GkOMbIeo
	 LADdEAdYzZYkiedMBO3mtmVjyUN8XyL29gQo+NXS+LDq7Be07jP7Mt6IlE+YkZyApj
	 biWqOGxpt3UyL12S9+M73MTGKbRQ+5CyKoiYkKoA8Tz/TUEs4TPi2bSxTOLGgR3jrZ
	 uEDBUh+nG1DGg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 134CC3782113;
	Tue, 28 May 2024 10:54:55 +0000 (UTC)
Message-ID: <341c1d0e-95b8-4e0c-9129-7dbda0b4e2b3@collabora.com>
Date: Tue, 28 May 2024 12:54:54 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Can someone at Mediatek add missing MODULE_DESCRIPTION()s?
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Sam Shih <sam.shih@mediatek.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
References: <4f0a78e8-d9cb-47c7-b748-b6cbd2ec1354@quicinc.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <4f0a78e8-d9cb-47c7-b748-b6cbd2ec1354@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 27/05/24 22:00, Jeff Johnson ha scritto:
> Hi Sam,
> 
> 'make W=1' causes modpost to warn if a module doesn't have a
> MODULE_DESCRIPTION(). I've been slowly cleaning up these warnings tree-wide,
> but there are a large number in drivers/clk/mediatek that I'd prefer Mediatek
> to fix.
> 
> Can you drive that cleanup?
> 

I'm doing it - expect a series soon.

Regards,
Angelo

> /jeff
> 
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6765-audio.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6765-cam.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6765-img.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6765-mipi0a.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6765-mm.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6765-vcodec.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6779.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6779-mm.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6779-img.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6779-ipe.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6779-cam.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6779-vdec.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6779-venc.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6779-mfg.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6779-aud.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6797-img.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6797-mm.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6797-vdec.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6797-venc.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt2712-apmixedsys.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt2712.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt2712-bdp.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt2712-img.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt2712-jpgdec.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt2712-mfg.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt2712-mm.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt2712-vdec.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt2712-venc.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt7622-eth.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt7622-hif.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt7622-aud.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt7981-eth.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt7986-apmixed.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt7986-topckgen.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt7988-apmixed.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt7988-topckgen.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt7988-infracfg.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8167-apmixedsys.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8167.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8167-aud.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8167-img.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8167-mfgcfg.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8167-mm.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8167-vdec.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8183-apmixedsys.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8183.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8183-audio.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8183-cam.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8183-img.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8183-ipu0.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8183-ipu1.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8183-ipu_adl.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8183-ipu_conn.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8183-mfgcfg.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8183-mm.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8183-vdec.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8183-venc.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8186-apmixedsys.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8186-topckgen.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8186-infra_ao.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8186-cam.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8186-img.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8186-imp_iic_wrap.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8186-ipe.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8186-mdp.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8186-mfg.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8186-mm.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8186-vdec.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8186-venc.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8186-wpe.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8188-apmixedsys.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8188-topckgen.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8188-peri_ao.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8188-infra_ao.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8188-adsp_audio26m.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8188-cam.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8188-ccu.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8188-img.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8188-imp_iic_wrap.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8188-ipe.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8188-mfg.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8188-vdec.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8188-vdo0.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8188-vdo1.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8188-venc.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8188-vpp0.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8188-vpp1.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8188-wpe.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8192.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8192-aud.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8192-cam.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8192-img.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8192-ipe.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8192-mdp.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8192-mfg.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8192-mm.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8192-msdc.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8192-scp_adsp.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8192-vdec.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8192-venc.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8195-apusys_pll.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8195-cam.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8195-ccu.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8195-img.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8195-ipe.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8195-mfg.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8195-scp_adsp.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8195-vdec.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8195-vdo0.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8195-vdo1.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8195-venc.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8195-vpp0.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8195-vpp1.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8195-wpe.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8365-apmixedsys.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8365.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8365-apu.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8365-cam.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8365-mfg.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8365-mm.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8365-vdec.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8365-venc.o

