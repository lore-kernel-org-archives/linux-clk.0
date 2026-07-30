Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F3A2BDC23;
	Thu, 30 Jul 2026 08:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785399799; cv=none; b=jCUfRSt/KXrloVsiER1EOY4Q+PYpWSXt398eLZvDylBFivDbQN+nM6uTeWLmi0KKVqTe/rd0HdxwTPq3dJjBtTQdlwRDn7o8L7dfzaRJfKAfmWj/2cvC6OBhCEdEgMrbmi7n7s99LzkIEcyC0Rajbl0AdJCRiqk0RYMfhGmKgLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785399799; c=relaxed/simple;
	bh=nGG9LtH3M3n5b0i0af5jANNTuqeyC/oMM6qwL7FI4is=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZBuU/toEcz/Sv7P1jeoQ2S22cEbI9TPS5AGHz526hOXH65MzppkEJEWtnqHeROvH4dY9sIJqLBt0lOOQFQu2T4+/zK9kUA0Usc+c+u7zwhiT15IRe+1rZas627L+Wraue5j49dwM2Vc52f4wkaAKAQtLBgy0PMrC8uTKBuOKlIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZW6guvuf; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZW6guvuf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785399796;
	bh=nGG9LtH3M3n5b0i0af5jANNTuqeyC/oMM6qwL7FI4is=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZW6guvuf0Pa3TUqsqHD9xIFIOpIlto1dDyerDBo6lTaEhwwdvi3LD0+5lvtlreb8M
	 VIAoCsoxmGsXWft6YSdWbbH6PaZNyik2FW7oRay0RyF+E/LPUqBxTHtjVud2Lyn3ly
	 euUSLv12apRjBS4xsG3usTiSwDSaJh0zb7fdu2dKdzk64sB9D7IPUiT9L3PYE0EOa6
	 aVCy2fMLpKnCJaBeM0fjITlZCtR46VEQpIgXok9m64rxQny0Xl7lC3dRtinz3CSnPx
	 E+dKdt5ZnKT1xHshwWY55CWE0mk/KLYMpyGHCnWGuwRk95lu2RxztStHiu8KaCVeSQ
	 JIyuAU1eP7FTg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 555DE17E001F;
	Thu, 30 Jul 2026 10:23:15 +0200 (CEST)
Message-ID: <36f2775a-d332-4913-8e9e-ca0429c3f713@collabora.com>
Date: Thu, 30 Jul 2026 10:23:14 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] powervr: MT8173 GPU support
To: Chen-Yu Tsai <wenst@chromium.org>, Brian Masney <bmasney@redhat.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 YoungJoon Lee <getfeus@gmail.com>
References: <20260728091804.382753-1-wenst@chromium.org>
 <amiqKRkFItYwD6oL@redhat.com>
 <CAGb2v64zUO-azpTuei6LCypad2noGFbg+EmaBC1iidoZ2stQzw@mail.gmail.com>
 <c1048eae-72c5-4e2e-ac49-25e2c4297018@collabora.com>
 <CAGXv+5EgGYFVt4TJCysQgRqA1J5=Qz9c0oWY5YTxgc5PnNC_AQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5EgGYFVt4TJCysQgRqA1J5=Qz9c0oWY5YTxgc5PnNC_AQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/30/26 06:51, Chen-Yu Tsai wrote:
> On Tue, Jul 28, 2026 at 10:33 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> On 7/28/26 15:13, Chen-Yu Tsai wrote:
>>> On Tue, Jul 28, 2026 at 9:10 PM Brian Masney <bmasney@redhat.com> wrote:
>>>>
>>>> Hi Chen-Yu,
>>>>
>>>> On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wrote:
>>>>> Hi everyone,
>>>>>
>>>>> This is v4 of my MT8173 PowerVR GPU support series.
>>>>>
>>>>> This time around Mesa was ready for basic testing, using both vulkanmark
>>>>> and glmark2-es2-drm (with Zink). Details below.
>>>>>
>>>>> Changes since v3 (all in the clk driver patch):
>>>>> - Changed pm_runtime_put() to pm_runtime_put_sync()
>>>>> - Added missing of_node_put() in remove function
>>>>>
>>>>> Changes since v2 (all in the clk driver patch):
>>>>> - Made COMMON_CLK_MT8173_MFGTOP depend on PM
>>>>>     - Needed since the driver implements PM domains using the generic PM
>>>>>       domain library, which also depends on PM
>>>>>     - Fixes build breakage (kernel test robot)
>>>>> - Fixed "RST_DELAY_CNT" name (Brian)
>>>>> - Dropped unused mfg_desc (Brian)
>>>>> - Added check of clk_prepare_enable()'s return value in
>>>>>     clk_mt8173_mfgtop_power_on() (Brian)
>>>>> - Saved error value for return in IS_ERR(data->clk_26m) branch
>>>>>     (Dan Carpenter / kernel test robot w/ smatch)
>>>>>
>>>>> Changes since v1:
>>>>> - Adapted to changed DT bindings
>>>>> - Dropped driver change
>>>>> - Use same power domain for "a" and "b" GPU power domains
>>>>>
>>>>>
>>>>> This series enables the PowerVR GPU found in the MT8173 SoC, found in
>>>>> some Chromebooks.
>>>>
>>>> I'm making a pull for Stephen for the clk changes. Should patches 1,2,4
>>>> go through the clk tree? Patches 3,5 go through the DRM tree?
>>>
>>> Only patches 1 and 2 should go through the clock tree.
>>>
>>> Patch 3, 4, 5 can all go through the soc tree if Angelo wants to pick up
>>> DT binding patches. Otherwise I can push patch 3 through drm-misc.
>>>
>>
>> Not sure if I can really take the DRM bindings patch through soc.
>>
>> I will take the devicetree ones exactly right now, even though it's going to
>> give warnings.
> 
> Apologies for missing this, but the first DT patch depends on the clk DT
> bindings patch for the clk ID macros. This is causing build errors in
> linux-next right now.
> 
> Not sure how we can fix this right now.
> 
> Brian, would it be possible for you to split out that patch into a
> separate immutable branch for Angelo to merge?
> 
> Otherwise Angelo might need to drop the DT patches until the next cycle.
> 
> 
Yeah, that's so bad.
I'd be happy to be able to resolve this, but it's too late on my side.

I should've checked the DT patches more carefully, my bad: I got a bit too excited
to finally see this PowerVR stuff working on MT8173 and going upstream.

Sadly, I have to drop the devicetree patches :-(

Cheers,
Angelo
