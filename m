Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764E644A72C;
	Tue, 28 Jul 2026 14:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785249206; cv=none; b=FaQIXebvJ1mDe5NMvQL9gID4uMXfQqw0cjmR9ROOQ+uzrXkC5VviRdUCA4mIY4JqpJwDlpLh4zU8agFTsUQMlZXCCyO8w6LFtH2F45wRaX8u18pFXwedvU2g+d7fLFRBByQJjj2BKyEHHaczh9wGvg0QjlPOF8NOsnXq6ukbbiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785249206; c=relaxed/simple;
	bh=4gKRc3lsPC3rb1kRaCZgNakY0yCL33pRhb9WZBRIPM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EbWw6GdJEk+2C0LPewigtrGnZ5fZ381lNLgESHEPgESx5Dj1mdYSivvhm7MlWxCPgz95knwpjF6/C9yVdfQ4TtjcrbVoDbDqt6697BqYVgha46iIMl4CiOdcCJQcKjDUQUlh+KyBsdfBsoLtX6ZvPI8aIJM/2Vhbl/s8XVJIENA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ngSbIkhO; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ngSbIkhO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785249202;
	bh=4gKRc3lsPC3rb1kRaCZgNakY0yCL33pRhb9WZBRIPM8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ngSbIkhOyFiMhpkd3SX1Hg9cxgLQorJEE6BB1iTxRXJFWMfk/nBgyreb8ZnLWxO2+
	 kn+ZqtiP03ykjWbV20aiFjaAOwAinSr28bBrLHTSiNnJXNlCd+OE7nemylGwVkQIBF
	 srRcf20J7cmkgJFt+yhX12gVEm/1GkIpkpLEdAMH0a+ubUi+DFl5a/ezjYDTBSzhO/
	 FvhQkhWtBa3hMgHHQZeN2eIGUgaBPo39DAv0gkGfgbhvmrHiZfiMKJRyCOoj9VzY44
	 q5DPSdNRcZ7kA3OM8jtNFqssBVaSMPUlTJwgRQ2wXheQJ2Ux3jaraEUagJlyHtTYkD
	 Ao81oWyuEJB6A==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 89A0D17E0114;
	Tue, 28 Jul 2026 16:33:21 +0200 (CEST)
Message-ID: <c1048eae-72c5-4e2e-ac49-25e2c4297018@collabora.com>
Date: Tue, 28 Jul 2026 16:33:21 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] powervr: MT8173 GPU support
To: wens@kernel.org, Brian Masney <bmasney@redhat.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
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
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGb2v64zUO-azpTuei6LCypad2noGFbg+EmaBC1iidoZ2stQzw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/28/26 15:13, Chen-Yu Tsai wrote:
> On Tue, Jul 28, 2026 at 9:10 PM Brian Masney <bmasney@redhat.com> wrote:
>>
>> Hi Chen-Yu,
>>
>> On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wrote:
>>> Hi everyone,
>>>
>>> This is v4 of my MT8173 PowerVR GPU support series.
>>>
>>> This time around Mesa was ready for basic testing, using both vulkanmark
>>> and glmark2-es2-drm (with Zink). Details below.
>>>
>>> Changes since v3 (all in the clk driver patch):
>>> - Changed pm_runtime_put() to pm_runtime_put_sync()
>>> - Added missing of_node_put() in remove function
>>>
>>> Changes since v2 (all in the clk driver patch):
>>> - Made COMMON_CLK_MT8173_MFGTOP depend on PM
>>>    - Needed since the driver implements PM domains using the generic PM
>>>      domain library, which also depends on PM
>>>    - Fixes build breakage (kernel test robot)
>>> - Fixed "RST_DELAY_CNT" name (Brian)
>>> - Dropped unused mfg_desc (Brian)
>>> - Added check of clk_prepare_enable()'s return value in
>>>    clk_mt8173_mfgtop_power_on() (Brian)
>>> - Saved error value for return in IS_ERR(data->clk_26m) branch
>>>    (Dan Carpenter / kernel test robot w/ smatch)
>>>
>>> Changes since v1:
>>> - Adapted to changed DT bindings
>>> - Dropped driver change
>>> - Use same power domain for "a" and "b" GPU power domains
>>>
>>>
>>> This series enables the PowerVR GPU found in the MT8173 SoC, found in
>>> some Chromebooks.
>>
>> I'm making a pull for Stephen for the clk changes. Should patches 1,2,4
>> go through the clk tree? Patches 3,5 go through the DRM tree?
> 
> Only patches 1 and 2 should go through the clock tree.
> 
> Patch 3, 4, 5 can all go through the soc tree if Angelo wants to pick up
> DT binding patches. Otherwise I can push patch 3 through drm-misc.
> 

Not sure if I can really take the DRM bindings patch through soc.

I will take the devicetree ones exactly right now, even though it's going to
give warnings.

I trust that you'll make the binding get into linux-next before it's too late.

Cheers,
Angelo
